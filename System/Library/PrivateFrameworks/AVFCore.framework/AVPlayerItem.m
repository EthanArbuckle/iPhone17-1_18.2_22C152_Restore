@interface AVPlayerItem
+ (AVPlayerItem)playerItemWithAsset:(AVAsset *)asset;
+ (AVPlayerItem)playerItemWithAsset:(AVAsset *)asset automaticallyLoadedAssetKeys:(NSArray *)automaticallyLoadedAssetKeys;
+ (AVPlayerItem)playerItemWithURL:(NSURL *)URL;
+ (BOOL)_forNonStreamingURLsFireKVOForAssetWhenReadyForInspection;
+ (BOOL)_forStreamingItemsVendAssetWithFigPlaybackItem;
+ (BOOL)_hasOverrideForSelector:(SEL)a3;
+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveResume;
+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveStartup;
+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveSwitchUp;
+ (BOOL)automaticallyNotifiesObserversOfAsset;
+ (BOOL)automaticallyNotifiesObserversOfHasEnabledAudio;
+ (BOOL)automaticallyNotifiesObserversOfHasEnabledVideo;
+ (BOOL)automaticallyNotifiesObserversOfLoadedTimeRanges;
+ (BOOL)automaticallyNotifiesObserversOfPlaybackBufferEmpty;
+ (BOOL)automaticallyNotifiesObserversOfPlaybackBufferFull;
+ (BOOL)automaticallyNotifiesObserversOfPlaybackLikelyToKeepUp;
+ (BOOL)automaticallyNotifiesObserversOfPresentationSize;
+ (BOOL)automaticallyNotifiesObserversOfSavesDownloadedDataToDiskWhenDone;
+ (BOOL)automaticallyNotifiesObserversOfSeekableTimeRanges;
+ (BOOL)automaticallyNotifiesObserversOfStatus;
+ (BOOL)automaticallyNotifiesObserversOfTracks;
+ (BOOL)automaticallyNotifiesObserversOfUsesMinimalLatencyForVideoCompositionRendering;
+ (BOOL)automaticallyNotifiesObserversOfVariantIndex;
+ (OpaqueCMTimebase)_copyTimebaseFromFigPlaybackItem:(OpaqueFigPlaybackItem *)a3;
+ (id)_initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider:(id)a3 withOptions:(id)a4;
+ (int)_createFigPlaybackItemForFigPlayer:(OpaqueFigPlayer *)a3 asset:(id)a4 URL:(id)a5 flags:(unsigned int)a6 options:(__CFDictionary *)a7 playbackItem:(OpaqueFigPlaybackItem *)a8;
+ (void)_uninitializeProtectedContentPlaybackSupportSession:(id)a3;
+ (void)initialize;
- ($1CE2C3FC342086196D07C2B4E8C70800)loopTimeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_configuredTimeOffsetFromLive;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentTimeWithOptionalFoldedTimebase:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_recommendedTimeOffsetFromLive;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeToPauseBuffering;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeToPausePlayback;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)advanceTimeForOverlappedPlayback;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUnfoldedTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumForwardBufferDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTimePlayedToDuringOverlappedPlayback;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTimePlayedToSinceLastSeek;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTrailingBufferDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumIntervalForIFrameOnlyPlayback;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overlappedPlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)speedRampAdjustabilityMargin;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeToPauseBuffering;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeToPausePlayback;
- (AVAsset)asset;
- (AVAudioMix)audioMix;
- (AVAudioSpatializationFormats)allowedAudioSpatializationFormats;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (AVMediaSelection)currentMediaSelection;
- (AVMediaSelectionOption)selectedMediaOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (AVPlayerItem)init;
- (AVPlayerItem)initWithAsset:(AVAsset *)asset;
- (AVPlayerItem)initWithAsset:(AVAsset *)asset automaticallyLoadedAssetKeys:(NSArray *)automaticallyLoadedAssetKeys;
- (AVPlayerItem)initWithURL:(NSURL *)URL;
- (AVPlayerItem)templatePlayerItem;
- (AVPlayerItemAccessLog)accessLog;
- (AVPlayerItemErrorLog)errorLog;
- (AVPlayerItemIntegratedTimeline)integratedTimeline;
- (AVPlayerItemStatus)status;
- (AVVariantPreferences)variantPreferences;
- (AVVideoApertureMode)videoApertureMode;
- (AVVideoComposition)videoComposition;
- (BOOL)_addToPlayQueueOfFigPlayerOfPlayer:(id)a3 afterFigPlaybackItemOfItem:(id)a4;
- (BOOL)_canPlayFastForward;
- (BOOL)_canPlayFastReverse;
- (BOOL)_canPlayReverse;
- (BOOL)_canStepForward;
- (BOOL)_configurePlaybackItemAndReturnError:(id *)a3;
- (BOOL)_getCachedPresentationSize:(CGSize *)a3;
- (BOOL)_hasEnabledAudio;
- (BOOL)_hasEnabledVideo;
- (BOOL)_hasEnqueuedVideoFrame;
- (BOOL)_hasSelectionInCachedMediaSelectionGroup:(id)a3;
- (BOOL)_isAFileBasedItemThatsReadyToPlay;
- (BOOL)_isExternalProtectionRequiredForPlayback;
- (BOOL)_isFigAssetReadyForInspectionOfMediaSelectionOptions;
- (BOOL)_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection;
- (BOOL)_isFigItemConfigured;
- (BOOL)_isNonForcedSubtitleDisplayEnabled;
- (BOOL)_isReadyForBasicInspection;
- (BOOL)_isReadyForInspectionOfDuration;
- (BOOL)_isReadyForInspectionOfPresentationSize;
- (BOOL)_isReadyForInspectionOfRecommendedTimeOffsetFromLive;
- (BOOL)_isReadyForInspectionOfTracks;
- (BOOL)_isRental;
- (BOOL)_isRentalPlaybackStarted;
- (BOOL)_selectMediaOption:(id)a3 inMediaSelectionGroup:(id)a4;
- (BOOL)_speedRampDataWasSet;
- (BOOL)_suppressesVideoLayers;
- (BOOL)_suppressionForOutputs:(id)a3;
- (BOOL)_timeJumpedNotificationIncludesExtendedDiagnosticPayload;
- (BOOL)adjustCompressionProfileWasSet;
- (BOOL)adjustTargetLevelWasSet;
- (BOOL)advanceTimeForOverlappedPlaybackWasSet;
- (BOOL)aggressivelyCachesVideoFrames;
- (BOOL)aggressivelyCachesVideoFramesWasSet;
- (BOOL)allowProgressiveResume;
- (BOOL)allowProgressiveStartup;
- (BOOL)allowProgressiveSwitchUp;
- (BOOL)allowedAudioSpatializationFormatsWasSet;
- (BOOL)allowsExtendedReadAhead;
- (BOOL)alwaysMonitorsPlayability;
- (BOOL)appliesPerFrameHDRDisplayMetadata;
- (BOOL)appliesPerFrameHDRDisplayMetadataWasSet;
- (BOOL)audioSpatializationAllowedWasSet;
- (BOOL)autoSwitchAtmosStreamVariants;
- (BOOL)automaticallyHandlesInterstitialEvents;
- (BOOL)automaticallyPreservesTimeOffsetFromLive;
- (BOOL)blendsVideoFrames;
- (BOOL)blendsVideoFramesWasSet;
- (BOOL)canPlayFastForward;
- (BOOL)canPlayFastReverse;
- (BOOL)canPlayReverse;
- (BOOL)canPlaySlowForward;
- (BOOL)canPlaySlowReverse;
- (BOOL)canStepBackward;
- (BOOL)canStepForward;
- (BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused;
- (BOOL)continuesPlayingDuringPrerollForRateChange;
- (BOOL)continuesPlayingDuringPrerollForSeek;
- (BOOL)decodesAllFramesDuringOrdinaryPlayback;
- (BOOL)decodesAllFramesDuringOrdinaryPlaybackWasSet;
- (BOOL)hasEnabledAudio;
- (BOOL)hasEnabledVideo;
- (BOOL)hasVideo;
- (BOOL)imageQueueInterpolationCurveWasSet;
- (BOOL)isApplicationAuthorizedForPlayback;
- (BOOL)isAudioSpatializationAllowed;
- (BOOL)isAuthorizationRequiredForPlayback;
- (BOOL)isContentAuthorizedForPlayback;
- (BOOL)isDefunct;
- (BOOL)isNonForcedSubtitleDisplayEnabled;
- (BOOL)isPlaybackBufferEmpty;
- (BOOL)isPlaybackBufferFull;
- (BOOL)isPlaybackLikelyToKeepUp;
- (BOOL)isRenderingSpatialAudio;
- (BOOL)limitReadAhead;
- (BOOL)minimumIntervalForIFrameOnlyPlaybackWasSet;
- (BOOL)overlappedPlaybackEndTimeWasSet;
- (BOOL)participatesInCoordinatedPlayback;
- (BOOL)playHapticTracks;
- (BOOL)playerAppliesAutomaticMediaSelectionToGroup:(id)a3;
- (BOOL)prefersOfflinePlayableVariants;
- (BOOL)refreshesClosedCaptionsImmediatelyAfterSeeking;
- (BOOL)requiresAccessLog;
- (BOOL)restrictsAutomaticMediaSelectionToAvailableOfflineOptions;
- (BOOL)reversesMoreVideoFramesInMemory;
- (BOOL)reversesMoreVideoFramesInMemoryWasSet;
- (BOOL)savesDownloadedDataToDiskWhenDone;
- (BOOL)savesDownloadedDataToDiskWhenDoneWasSet;
- (BOOL)seekToDate:(NSDate *)date;
- (BOOL)seekToDate:(NSDate *)date completionHandler:(void *)completionHandler;
- (BOOL)seekingWaitsForVideoCompositionRendering;
- (BOOL)speedThresholdForIFrameOnlyPlaybackWasSet;
- (BOOL)startsOnFirstEligibleVariant;
- (BOOL)suppressesAudioOnlyVariants;
- (BOOL)usesIFrameOnlyPlaybackForHighRateScaledEdits;
- (BOOL)usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet;
- (BOOL)usesMinimalLatencyForVideoCompositionRendering;
- (BOOL)willNeverSeekBackwardsHint;
- (CGSize)IFramePrefetchTargetDimensions;
- (CGSize)_presentationSize;
- (CGSize)preferredMaximumResolution;
- (CGSize)preferredMaximumResolutionForExpensiveNetworks;
- (CGSize)preferredMinimumResolution;
- (CGSize)presentationSize;
- (CMTime)configuredTimeOffsetFromLive;
- (CMTime)currentTime;
- (CMTime)duration;
- (CMTime)forwardPlaybackEndTime;
- (CMTime)recommendedTimeOffsetFromLive;
- (CMTime)reversePlaybackEndTime;
- (CMTimebaseRef)timebase;
- (NSArray)automaticallyLoadedAssetKeys;
- (NSArray)loadedTimeRanges;
- (NSArray)mediaDataCollectors;
- (NSArray)outputs;
- (NSArray)seekableTimeRanges;
- (NSArray)speedRamp;
- (NSArray)textStyleRules;
- (NSArray)timedMetadata;
- (NSArray)tracks;
- (NSDate)_rentalExpirationDate;
- (NSDate)_rentalPlaybackExpirationDate;
- (NSDate)_rentalPlaybackStartedDate;
- (NSDate)_rentalStartDate;
- (NSDate)currentDate;
- (NSError)error;
- (NSObject)AVKitData;
- (NSString)description;
- (NSString)hapticPlaybackLocality;
- (NSString)serviceIdentifier;
- (NSTimeInterval)preferredForwardBufferDuration;
- (OpaqueCMTimebase)_copyFoldedTimebase;
- (OpaqueCMTimebase)_copyProxyFoldedTimebase;
- (OpaqueCMTimebase)_copyProxyUnfoldedTimebase;
- (OpaqueCMTimebase)_copyUnfoldedFigTimebase;
- (OpaqueCMTimebase)unfoldedTimebase;
- (OpaqueFigCPEProtector)_copyFigCPEProtector;
- (OpaqueFigPlaybackItem)_copyFigPlaybackItem;
- (OpaqueFigPlaybackItem)_copyFigPlaybackItemLocked:(BOOL)a3;
- (double)_delayPreparingItemForTestingOnly;
- (double)liveUpdateInterval;
- (double)preferredMaximumAudioSampleRate;
- (double)preferredPeakBitRate;
- (double)preferredPeakBitRateForExpensiveNetworks;
- (double)seekableTimeRangesLastModifiedTime;
- (float)adjustTargetLevel;
- (float)maximumBitRate;
- (float)progressTowardsPlaybackLikelyToKeepUp;
- (float)soundCheckVolumeNormalization;
- (float)speedThresholdForIFrameOnlyPlayback;
- (float)volumeAdjustment;
- (id)_URL;
- (id)_cachedTracks;
- (id)_coordinationIdentifier;
- (id)_copyIntegratedTimelineIfCreated;
- (id)_copyPlayer;
- (id)_copyStateDispatchQueue;
- (id)_currentMediaSelectionFromFigSelectedMediaArray:(id)a3;
- (id)_enabledTrackFormatDescriptions;
- (id)_ensureAssetWithFigPlaybackItemWithTrackIDs:(id)a3;
- (id)_figSelectedMediaArray;
- (id)_fpNotificationNames;
- (id)_integratedTimelineOffsets;
- (id)_interstitialEventItemTimeOffset;
- (id)_isExternalProtectionRequiredForPlaybackInternal;
- (id)_legibleOutputForKey:(id)a3;
- (id)_legibleOutputsForKeys;
- (id)_loadedTimeRanges;
- (id)_loadedTimeRangesFromFPPlaybableTimeIntervals:(id)a3;
- (id)_mediaOptionsSelectedByClient;
- (id)_mediaOptionsSelectedByClientForKey:(id)a3;
- (id)_metadataCollectors;
- (id)_metadataOutputForKey:(id)a3;
- (id)_metadataOutputsForKeys;
- (id)_nameForLogging;
- (id)_nextItem;
- (id)_playbackCoordinator;
- (id)_playbackItemNotificationPayloadToError:(__CFDictionary *)a3;
- (id)_playbackProperties;
- (id)_player;
- (id)_playerConnection;
- (id)_preferredPixelBufferAttributes;
- (id)_previousItem;
- (id)_propertyListForMediaSelection:(id)a3 forGroup:(id)a4;
- (id)_propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:(id)a3;
- (id)_renderedLegibleOutputForKey:(id)a3;
- (id)_renderedLegibleOutputsForKeys;
- (id)_seekableTimeRanges;
- (id)_seekableTimeRangesFromFPSeekableTimeIntervals:(id)a3;
- (id)_syncLayers;
- (id)_trackWithTrackID:(int)a3;
- (id)_tracks;
- (id)_tracksFromAssetTrackIDs;
- (id)_tracksWithFPTrackIDArray:(id)a3 fromFigPlaybackItem:(OpaqueFigPlaybackItem *)a4;
- (id)_videoOutputs;
- (id)_weakReference;
- (id)configurationGroup;
- (id)copy;
- (id)copyWithZone:(NSZone *)zone;
- (id)copyWithZone:(_NSZone *)a3 newAssetOptions:(id)a4;
- (id)currentEstimatedDate;
- (id)currentStableVariantID;
- (id)customVideoCompositor;
- (id)delegate;
- (id)gaplessInfo;
- (id)identifier;
- (id)imageQueueInterpolationCurve;
- (id)initialDate;
- (id)initialEstimatedDate;
- (id)interstitialEventID;
- (id)loudnessInfo;
- (id)mediaKind;
- (id)nonForcedSubtitleDisplayEnabledPublisher;
- (id)playabilityMetrics;
- (id)presentationSizePublisher;
- (id)reportingCategory;
- (id)textHighlightArray;
- (id)tracksPublisher;
- (id)valueForUndefinedKey:(id)a3;
- (id)videoEnhancementMode;
- (int)_CreateSeekID;
- (int)makeSeekID;
- (int64_t)_availableFileSize;
- (int64_t)_fileSize;
- (int64_t)playbackLikelyToKeepUpTrigger;
- (int64_t)variantIndex;
- (opaqueMTAudioProcessingTap)audioTapProcessor;
- (unint64_t)restrictions;
- (unsigned)RTCReportingFlags;
- (unsigned)_snapTimeToPausePlayback;
- (unsigned)adjustCompressionProfile;
- (unsigned)snapTimeToPausePlayback;
- (void)_addFAListeners;
- (void)_addFPListeners;
- (void)_addFoldedTBListeners;
- (void)_addInterstitialEventCollector;
- (void)_addInterstitialEventCollectorLocked:(BOOL)a3;
- (void)_addLegibleOutput:(id)a3;
- (void)_addMetadataCollector:(id)a3;
- (void)_addMetadataCollector:(id)a3 locked:(BOOL)a4;
- (void)_addMetadataOutput:(id)a3;
- (void)_addRenderedLegibleOutput:(id)a3;
- (void)_addSyncLayer:(id)a3;
- (void)_addVideoOutput:(id)a3;
- (void)_applyCurrentAudioMix;
- (void)_applyCurrentVideoComposition;
- (void)_applyMediaSelectionOptions;
- (void)_attachToFigPlayer;
- (void)_attachToPlayer:(id)a3;
- (void)_cacheMediaSelectionOption:(id)a3 forMediaSelectionGroup:(id)a4;
- (void)_cancelPendingSeekAndRegisterSeekID:(int)a3 withCompletionHandler:(id)a4;
- (void)_changeStatusToFailedWithError:(id)a3;
- (void)_clearCachedMediaSelectionGroup:(id)a3;
- (void)_configureVideoCompositionColorProperties;
- (void)_evaluateLegibleOutputs;
- (void)_evaluateMetadataOutputs;
- (void)_evaluateRenderedLegibleOutputs;
- (void)_evaluateVideoOutputs;
- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushLegibleOutputWithDictionaryKey:(id)a4;
- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushMetadataOutputWithDictionaryKey:(id)a4;
- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushRenderedLegibleOutputWithDictionaryKey:(id)a4;
- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 atItemTime:(id *)a6 withLegibleOutputsDictionaryKey:(id)a7;
- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputRenderedCaptionImages:(id)a4 atItemTime:(id *)a5 withRenderedLegibleOutputsDictionaryKey:(id)a6;
- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputSampleBuffers:(id)a4 fromTrackWithID:(int)a5 forMetadataOutputWithDictionaryKey:(id)a6;
- (void)_getVideoComposition:(id *)a3 customVideoCompositorSession:(id *)a4 figVideoCompositor:(OpaqueFigVideoCompositor *)a5;
- (void)_informObserversAboutAvailabilityOfCurrentMediaSelection;
- (void)_informObserversAboutAvailabilityOfDuration:(id *)a3;
- (void)_informObserversAboutAvailabilityOfPresentationSize;
- (void)_informObserversAboutAvailabilityOfTracks:(id)a3;
- (void)_insertAfterItem:(id)a3;
- (void)_invokeReadyForEnqueueingHandlers;
- (void)_kickAssetObserversIfAppropriate;
- (void)_makeReadyForEnqueueingWithCompletionHandler:(id)a3;
- (void)_markAsFigItemConfigured;
- (void)_markAsNeedingNewAssetWithFigPlaybackItem;
- (void)_markAsReadyForBasicInspection;
- (void)_markAsReadyForInspectionOfDuration;
- (void)_markAsReadyForInspectionOfPresentationSize;
- (void)_markAsReadyForInspectionOfRecommendedTimeOffsetFromLive;
- (void)_markAsReadyForInspectionOfTracks;
- (void)_markAssetWithFigPlaybackItemAsNeedingNewTracks;
- (void)_markFigAssetAsReadyForInspectionOfMediaSelectionOptions;
- (void)_postSeekCompletionNotificationWithSeekID:(int)a3 andResult:(BOOL)a4;
- (void)_quietlySetEQPreset:(int)a3;
- (void)_quietlySetServiceIdentifier;
- (void)_quietlySetVariantIndex:(int64_t)a3;
- (void)_removeFAListeners;
- (void)_removeFPListeners;
- (void)_removeFoldedTBListeners;
- (void)_removeFromItems;
- (void)_removeFromPlayQueueOfFigPlayerOfAttachedPlayer;
- (void)_removeInterstitialEventCollector;
- (void)_removeInterstitialEventCollectorLocked:(BOOL)a3;
- (void)_removeLegibleOutput:(id)a3;
- (void)_removeMediaOptionsSelectedByClient;
- (void)_removeMetadataCollector:(id)a3;
- (void)_removeMetadataCollector:(id)a3 locked:(BOOL)a4;
- (void)_removeMetadataOutput:(id)a3;
- (void)_removeRenderedLegibleOutput:(id)a3;
- (void)_removeSyncLayer:(id)a3;
- (void)_removeVideoOutput:(id)a3;
- (void)_renderingSuppressionDidChangeForOutput:(id)a3;
- (void)_respondToBecomingReadyForBasicInspection;
- (void)_respondToBecomingReadyForBasicInspectionWithDuration:(id *)a3;
- (void)_seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 seekID:(int)a6 completionHandler:(id)a7;
- (void)_setAsset:(id)a3;
- (void)_setAssetToAssetWithFigPlaybackItemIfAppropriate;
- (void)_setAudibleDRMInfo:(id)a3;
- (void)_setAudioCurvesAccordingToInputParameters:(id)a3 forTrackID:(int)a4;
- (void)_setAudioEffectParameters:(id)a3 previousEffects:(id)a4 forTrackID:(int)a5;
- (void)_setAudioProcessingEffectsAccordingToInputParameters:(id)a3 forTrackID:(int)a4;
- (void)_setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3 forTrackID:(int)a4;
- (void)_setAudioTimePitchAlgorithm:(id)a3 forTrackID:(int)a4;
- (void)_setCoordinatorIdentifier:(id)a3;
- (void)_setCurrentMediaSelection:(id)a3;
- (void)_setDelayPreparingItemForTestingOnly:(double)a3;
- (void)_setEQPreset:(int)a3;
- (void)_setExternalProtectionRequiredForPlayback:(BOOL)a3;
- (void)_setInterstitialEventID:(id)a3;
- (void)_setMediaOptionsSelectedByClient:(id)a3 forKey:(id)a4;
- (void)_setParticipatesInCoordinatedPlayback:(BOOL)a3;
- (void)_setPlaybackCoordinator:(id)a3;
- (void)_setRampInOutInfo:(id)a3;
- (void)_setSuppressesVideoLayers:(BOOL)a3;
- (void)_setSyncLayersOnFigPlaybackItem;
- (void)_setTemplatePlayerItem:(id)a3;
- (void)_setTimeJumpedNotificationIncludesExtendedDiagnosticPayload:(BOOL)a3;
- (void)_setTimedMetadata:(id)a3;
- (void)_setURL:(id)a3;
- (void)_setVideoCompositionColorPrimaries:(id)a3;
- (void)_setVideoCompositionColorTransferFunction:(id)a3;
- (void)_setVideoCompositionColorYCbCrMatrix:(id)a3;
- (void)_setVideoCompositionFrameDuration:(id *)a3;
- (void)_setVideoCompositionHDRDisplayMetadataPolicy:(id)a3;
- (void)_setVideoCompositionInstructions:(id)a3;
- (void)_setVideoCompositionRenderScale:(float)a3;
- (void)_setVideoCompositionRenderSize:(CGSize)a3;
- (void)_setVideoCompositionSourceSampleDataTrackIDs:(id)a3;
- (void)_setVideoCompositionSourceTrackIDForFrameTiming:(int)a3;
- (void)_setVideoCompositor:(void *)a3;
- (void)_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:(int)a3 finished:(BOOL)a4;
- (void)_updateAdjustCompressionProfileOnFigPlaybackItem;
- (void)_updateAdjustTargetLevelOnFigPlaybackItem;
- (void)_updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem;
- (void)_updateAggressivelyCachesVideoFramesOnFigPlaybackItem;
- (void)_updateAllowedAudioSpatializationFormats;
- (void)_updateAllowedAudioSpatializationFormatsFromFigItem;
- (void)_updateAlwaysMonitorsPlayabilityOnFigPlaybackItem;
- (void)_updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem;
- (void)_updateAudioSpatializationAllowed;
- (void)_updateAudioTapProcessorOnFigPlaybackItem;
- (void)_updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem;
- (void)_updateBlendsVideoFramesOnFigPlaybackItem;
- (void)_updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:(id)a3 updateStatusToReadyToPlay:(BOOL)a4;
- (void)_updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem;
- (void)_updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem;
- (void)_updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem;
- (void)_updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem;
- (void)_updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem;
- (void)_updateFigTimePitchAlgorithmOnFigPlaybackItem;
- (void)_updateForwardPlaybackEndTimeOnFigPlaybackItem;
- (void)_updateIFramePrefetchTargetDimensionsOnFigPlaybackItem;
- (void)_updateImageQueueInterpolationCurveOnFigPlaybackItem;
- (void)_updateItemIdentifierForCoordinatedPlayback;
- (void)_updateLegibleSuppressionOnFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 basedOnOutputs:(id)a4;
- (void)_updateLimitReadAheadOnFigPlaybackItem;
- (void)_updateLoopTimeRangeOnFigPlaybackItem;
- (void)_updateLoudnessInfoOnFigPlaybackItem;
- (void)_updateMaximumForwardBufferDurationOnFigPlaybackItem;
- (void)_updateMaximumTrailingBufferDurationOnFigPlaybackItem;
- (void)_updateMediaKindOnFigPlaybackItem;
- (void)_updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem;
- (void)_updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem;
- (void)_updateOverlappedPlaybackEndTimeOnFigPlaybackItem;
- (void)_updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem;
- (void)_updatePlaybackPropertiesOnFigPlaybackItem;
- (void)_updatePreferredMaximumAudioSampleRateOnFigPlaybackItem;
- (void)_updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem;
- (void)_updatePreferredMaximumResolutionOnFigPlaybackItem;
- (void)_updatePreferredMinimumResolutionOnFigPlaybackItem;
- (void)_updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem;
- (void)_updatePreferredPeakBitRateOnFigPlaybackItem;
- (void)_updatePreservesTimeOffsetFromLive;
- (void)_updateRTCReportingCategoryOnFigPlaybackItem;
- (void)_updateRTCReportingFlagsOnFigPlaybackItem;
- (void)_updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem;
- (void)_updateReportingValuesOnFigPlaybackItem;
- (void)_updateReportingValuesProperty:(id)a3 forKey:(id)a4;
- (void)_updateRestrictionsOnFigPlaybackItem;
- (void)_updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions;
- (void)_updateReversePlaybackEndTimeOnFigPlaybackItem;
- (void)_updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem;
- (void)_updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem;
- (void)_updateSnapTimeToPausePlaybackOnFigPlaybackItem;
- (void)_updateSoundCheckVolumeNormalizationOnFigPlaybackItem;
- (void)_updateSpeedRampDataOnFigPlaybackItem;
- (void)_updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem;
- (void)_updateStartsOnFirstEligibleVariantOnFigPlaybackItem;
- (void)_updateTaggedMetadataArray:(id)a3;
- (void)_updateTextHighlightArrayOnFigPlaybackItem;
- (void)_updateTextStyleRulesOnFigPlaybackItem;
- (void)_updateTimeToPauseBufferingOnFigPlaybackItem;
- (void)_updateTimeToPausePlaybackOnFigPlaybackItem;
- (void)_updateTimebase;
- (void)_updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem;
- (void)_updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem;
- (void)_updateVariantPreferencesOnFigPlaybackItem;
- (void)_updateVideoApertureModeOnFigPlaybackItem;
- (void)_updateVideoEnhancementModeOnFigPlaybackItem;
- (void)_updateVideoSuppressionOnFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 basedOnOutputs:(id)a4;
- (void)_updateVolumeAdjustmentOnFigPlaybackItem;
- (void)_updateWillNeverSeekBackwardsHintOnFigPlaybackItem;
- (void)addMediaDataCollector:(AVPlayerItemMediaDataCollector *)collector;
- (void)addMediaDataCollector:(id)a3 locked:(BOOL)a4;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)addOutput:(AVPlayerItemOutput *)output;
- (void)cancelPendingSeeks;
- (void)dealloc;
- (void)dispatchIVarWrite:(BOOL)a3 locked:(BOOL)a4 block:(id)a5;
- (void)getEventTimelineWithCompletionHandler:(id)a3;
- (void)processWaitingMetricEventTimelineCompletionHandlers;
- (void)removeMediaDataCollector:(AVPlayerItemMediaDataCollector *)collector;
- (void)removeMediaDataCollector:(id)a3 locked:(BOOL)a4;
- (void)removeOutput:(AVPlayerItemOutput *)output;
- (void)resetAudioBufferedAhead;
- (void)seekToTime:(CMTime *)time;
- (void)seekToTime:(CMTime *)time completionHandler:(void *)completionHandler;
- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter;
- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter completionHandler:(void *)completionHandler;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 seekID:(int)a6;
- (void)selectMediaOption:(AVMediaSelectionOption *)mediaSelectionOption inMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (void)selectMediaOptionAutomaticallyInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (void)setAVKitData:(id)a3;
- (void)setAdjustCompressionProfile:(unsigned int)a3;
- (void)setAdjustTargetLevel:(float)a3;
- (void)setAdvanceTimeForOverlappedPlayback:(id *)a3;
- (void)setAggressivelyCachesVideoFrames:(BOOL)a3;
- (void)setAllowProgressiveResume:(BOOL)a3;
- (void)setAllowProgressiveStartup:(BOOL)a3;
- (void)setAllowProgressiveSwitchUp:(BOOL)a3;
- (void)setAllowedAudioSpatializationFormats:(AVAudioSpatializationFormats)allowedAudioSpatializationFormats;
- (void)setAllowsExtendedReadAhead:(BOOL)a3;
- (void)setAlwaysMonitorsPlayability:(BOOL)a3;
- (void)setAppliesPerFrameHDRDisplayMetadata:(BOOL)appliesPerFrameHDRDisplayMetadata;
- (void)setAudioMix:(AVAudioMix *)audioMix;
- (void)setAudioSpatializationAllowed:(BOOL)audioSpatializationAllowed;
- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3;
- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (void)setAutoSwitchAtmosStreamVariants:(BOOL)a3;
- (void)setAutomaticallyHandlesInterstitialEvents:(BOOL)automaticallyHandlesInterstitialEvents;
- (void)setAutomaticallyPreservesTimeOffsetFromLive:(BOOL)automaticallyPreservesTimeOffsetFromLive;
- (void)setBlendsVideoFrames:(BOOL)a3;
- (void)setCanUseNetworkResourcesForLiveStreamingWhilePaused:(BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused;
- (void)setConfiguredTimeOffsetFromLive:(CMTime *)configuredTimeOffsetFromLive;
- (void)setContinuesPlayingDuringPrerollForRateChange:(BOOL)a3;
- (void)setContinuesPlayingDuringPrerollForSeek:(BOOL)a3;
- (void)setDecodesAllFramesDuringOrdinaryPlayback:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardPlaybackEndTime:(CMTime *)forwardPlaybackEndTime;
- (void)setGaplessInfo:(id)a3;
- (void)setHapticPlaybackLocality:(id)a3;
- (void)setIFramePrefetchTargetDimensions:(CGSize)a3;
- (void)setImageQueueInterpolationCurve:(id)a3;
- (void)setInitialDate:(id)a3;
- (void)setInitialEstimatedDate:(id)a3;
- (void)setLimitReadAhead:(BOOL)a3;
- (void)setLoopTimeRange:(id *)a3;
- (void)setLoudnessInfo:(id)a3;
- (void)setMaximumBitRate:(float)a3;
- (void)setMaximumForwardBufferDuration:(id *)a3;
- (void)setMaximumTrailingBufferDuration:(id *)a3;
- (void)setMediaKind:(id)a3;
- (void)setMinimumIntervalForIFrameOnlyPlayback:(id *)a3;
- (void)setNonForcedSubtitleDisplayEnabled:(BOOL)a3;
- (void)setOverlappedPlaybackEndTime:(id *)a3;
- (void)setPlayHapticTracks:(BOOL)a3;
- (void)setPlaybackLikelyToKeepUpTrigger:(int64_t)a3;
- (void)setPreferredForwardBufferDuration:(NSTimeInterval)preferredForwardBufferDuration;
- (void)setPreferredMaximumAudioSampleRate:(double)a3;
- (void)setPreferredMaximumResolution:(CGSize)preferredMaximumResolution;
- (void)setPreferredMaximumResolutionForExpensiveNetworks:(CGSize)preferredMaximumResolutionForExpensiveNetworks;
- (void)setPreferredMinimumResolution:(CGSize)a3;
- (void)setPreferredPeakBitRate:(double)preferredPeakBitRate;
- (void)setPreferredPeakBitRateForExpensiveNetworks:(double)preferredPeakBitRateForExpensiveNetworks;
- (void)setPrefersOfflinePlayableVariants:(BOOL)a3;
- (void)setRTCReportingFlags:(unsigned int)a3;
- (void)setRefreshesClosedCaptionsImmediatelyAfterSeeking:(BOOL)a3;
- (void)setReportingCategory:(id)a3;
- (void)setReportingValueWithNumber:(id)a3 forKey:(id)a4;
- (void)setReportingValueWithString:(id)a3 forKey:(id)a4;
- (void)setRequiresAccessLog:(BOOL)a3;
- (void)setRestrictions:(unint64_t)a3;
- (void)setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions:(BOOL)a3;
- (void)setReversePlaybackEndTime:(CMTime *)reversePlaybackEndTime;
- (void)setReversesMoreVideoFramesInMemory:(BOOL)a3;
- (void)setSavesDownloadedDataToDiskWhenDone:(BOOL)a3;
- (void)setSeekingWaitsForVideoCompositionRendering:(BOOL)seekingWaitsForVideoCompositionRendering;
- (void)setServiceIdentifier:(id)a3;
- (void)setSnapTimeToPausePlayback:(unsigned __int8)a3;
- (void)setSoundCheckVolumeNormalization:(float)a3;
- (void)setSpeedRamp:(id)a3;
- (void)setSpeedThresholdForIFrameOnlyPlayback:(float)a3;
- (void)setStartsOnFirstEligibleVariant:(BOOL)startsOnFirstEligibleVariant;
- (void)setSuppressesAudioOnlyVariants:(BOOL)a3;
- (void)setTextHighlightArray:(id)a3;
- (void)setTextStyleRules:(NSArray *)textStyleRules;
- (void)setTimeToPauseBuffering:(id *)a3;
- (void)setTimeToPausePlayback:(id *)a3;
- (void)setUsesIFrameOnlyPlaybackForHighRateScaledEdits:(BOOL)a3;
- (void)setUsesMinimalLatencyForVideoCompositionRendering:(BOOL)a3;
- (void)setVariantIndex:(int64_t)a3;
- (void)setVariantPreferences:(AVVariantPreferences)variantPreferences;
- (void)setVideoApertureMode:(AVVideoApertureMode)videoApertureMode;
- (void)setVideoComposition:(AVVideoComposition *)videoComposition;
- (void)setVideoEnhancementMode:(id)a3;
- (void)setVolumeAdjustment:(float)a3;
- (void)setWillNeverSeekBackwardsHint:(BOOL)a3;
- (void)stepByCount:(NSInteger)stepCount;
@end

@implementation AVPlayerItem

void __39__AVPlayerItem__copyStateDispatchQueue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 128);
  v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1) {
    dispatch_retain(v1);
  }
}

- (id)_copyStateDispatchQueue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem__copyStateDispatchQueue__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OpaqueFigPlaybackItem)_copyFigPlaybackItemLocked:(BOOL)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem__copyFigPlaybackItemLocked___block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  [(AVPlayerItem *)self dispatchIVarWrite:0 locked:a3 block:v5];
  v3 = (OpaqueFigPlaybackItem *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dispatchIVarWrite:(BOOL)a3 locked:(BOOL)a4 block:(id)a5
{
  if (a4)
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
  else
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    if (a3) {
      av_readwrite_dispatch_queue_write(ivarAccessQueue, a5);
    }
    else {
      av_readwrite_dispatch_queue_read(ivarAccessQueue, a5);
    }
  }
}

CFTypeRef __43__AVPlayerItem__copyFigPlaybackItemLocked___block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 120);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_player
{
  return (id)[self->_playerItem->allowedAudioSpatializationFormats referencedObject];
}

- (AVAsset)asset
{
  v2 = self->_playerItem->asset;
  return v2;
}

- (void)_markFigAssetAsReadyForInspectionOfMediaSelectionOptions
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVPlayerItem__markFigAssetAsReadyForInspectionOfMediaSelectionOptions__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_markAsReadyForInspectionOfTracks
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItem__markAsReadyForInspectionOfTracks__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (id)_tracks
{
  id v3 = (id)[MEMORY[0x1E4F1C978] array];
  if (![(AVPlayerItem *)self _isReadyForInspectionOfTracks]
    && sOKToBlockWhenGettingValuesOfProperties != 1)
  {
    return v3;
  }
  if ([(AVAsset *)self->_playerItem->asset _isStreaming])
  {
    v4 = [(AVPlayerItem *)self _copyFigPlaybackItem];
    if (v4)
    {
      v5 = v4;
      CFTypeRef cf = 0;
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v10 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v8 + 48);
      if (v10 && !v10(FigBaseObject, *MEMORY[0x1E4F33C08], *MEMORY[0x1E4F1CF80], &cf))
      {
        id v3 = [(AVPlayerItem *)self _tracksWithFPTrackIDArray:cf fromFigPlaybackItem:v5];
        if (cf) {
          CFRelease(cf);
        }
      }
      CFRelease(v5);
    }
    return v3;
  }
  if (!self->_playerItem->asset) {
    return v3;
  }
  return [(AVPlayerItem *)self _tracksFromAssetTrackIDs];
}

- (BOOL)_isReadyForInspectionOfTracks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem__isReadyForInspectionOfTracks__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __29__AVPlayerItem_loopTimeRange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(v2 + 1040);
  long long v4 = *(_OWORD *)(v2 + 1072);
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v2 + 1056);
  *(_OWORD *)(v1 + 64) = v4;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

uint64_t __48__AVPlayerItem_AVPlayerItemAVKit__setAVKitData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copyWithZone:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 896) = result;
  return result;
}

void __60__AVPlayerItem_AVPlayerItemOutputs___evaluateLegibleOutputs__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (v2)
  {
    char v3 = (const void *)v2;
    long long v4 = (void *)[*(id *)(a1 + 32) _legibleOutputsForKeys];
    objc_msgSend(*(id *)(a1 + 32), "_updateLegibleSuppressionOnFigPlaybackItem:basedOnOutputs:", v3, objc_msgSend(v4, "allValues"));
    v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v9)), "_figLegibleOutputsDictionaryOptions"), *(void *)(*((void *)&v14 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = *(void (**)(uint64_t, void, void *))(v12 + 56);
    if (v13) {
      v13(FigBaseObject, *MEMORY[0x1E4F33A20], v5);
    }
    CFRelease(v3);
  }
}

- (id)_legibleOutputsForKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayerItem_AVPlayerItemOutputs___legibleOutputsForKeys__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateLegibleSuppressionOnFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 basedOnOutputs:(id)a4
{
  if ([(AVPlayerItem *)self _suppressionForOutputs:a4]) {
    long long v4 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    long long v4 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33BA8];
    uint64_t v10 = *v4;
    v8(FigBaseObject, v9, v10);
  }
}

- (void)_updateVideoSuppressionOnFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 basedOnOutputs:(id)a4
{
  BOOL v5 = [(AVPlayerItem *)self _suppressionForOutputs:a4];
  [(AVPlayerItem *)self _setSuppressesVideoLayers:v5];
  if (v5) {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F33BB0];
    uint64_t v12 = *v6;
    v10(FigBaseObject, v11, v12);
  }
}

- (BOOL)_suppressionForOutputs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) suppressesPlayerRendering])
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (void)_setSuppressesVideoLayers:(BOOL)a3
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItem__setSuppressesVideoLayers___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v7 = a3;
  block[4] = self;
  void block[5] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v9 + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemSuppressesVideoLayersDidChangeNotification" object:self userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
  }
  _Block_object_dispose(&v8, 8);
}

void __61__AVPlayerItem_AVPlayerItemOutputs___evaluateMetadataOutputs__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t v4 = (void *)[*(id *)(a1 + 32) _metadataOutputsForKeys];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * v10)), "_figMetadataOutputsDictionaryOptions"), *(void *)(*((void *)&v15 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *(void (**)(uint64_t, void, void *))(v13 + 56);
    if (v14) {
      v14(FigBaseObject, *MEMORY[0x1E4F33A68], v5);
    }
    CFRelease(v3);
  }
}

- (id)_metadataOutputsForKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_AVPlayerItemOutputs___metadataOutputsForKeys__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __68__AVPlayerItem_AVPlayerItemOutputs___evaluateRenderedLegibleOutputs__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t v4 = (void *)[*(id *)(a1 + 32) _renderedLegibleOutputsForKeys];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v9)), "_figRenderedLegibleOutputsDictionaryOptions"), *(void *)(*((void *)&v14 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void (**)(uint64_t, void, void *))(v12 + 56);
    if (v13) {
      v13(FigBaseObject, *MEMORY[0x1E4F33AF8], v5);
    }
    CFRelease(v3);
  }
}

- (id)_renderedLegibleOutputsForKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlayerItem_AVPlayerItemOutputs___renderedLegibleOutputsForKeys__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_isNonForcedSubtitleDisplayEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 996);
  return result;
}

uint64_t __47__AVPlayerItem__isReadyForInspectionOfDuration__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 226);
  return result;
}

uint64_t __46__AVPlayerItem_prefersOfflinePlayableVariants__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 810);
  return result;
}

uint64_t __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 912)];
  if ((result & 1) == 0)
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 912) = [*(id *)(a1 + 32) copy];
    uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 120);
    if (result) {
      uint64_t result = (uint64_t)CFRetain((CFTypeRef)result);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

void __76__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__setServiceIdentifier___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1152)] & 1) == 0)
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1152) = *(void *)(a1 + 32);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  if ([a4 isEqualToString:@"timedMetadata"])
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AVPlayerItem_addObserver_forKeyPath_options_context___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    uint64_t v12 = objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyFigPlayer");
    if (v12)
    {
      uint64_t v13 = (const void *)v12;
      uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      long long v17 = *(void (**)(uint64_t, void, void))(v16 + 56);
      if (v17) {
        v17(FigBaseObject, *MEMORY[0x1E4F34258], *MEMORY[0x1E4F1CFD0]);
      }
      CFRelease(v13);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)AVPlayerItem;
  [(AVPlayerItem *)&v18 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
}

- (id)copyWithZone:(NSZone *)zone
{
  return [(AVPlayerItem *)self copyWithZone:zone newAssetOptions:0];
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter completionHandler:(void *)completionHandler
{
  uint64_t v11 = [(AVPlayerItem *)self makeSeekID];
  CMTime v14 = *time;
  CMTime v13 = *toleranceBefore;
  CMTime v12 = *toleranceAfter;
  [(AVPlayerItem *)self _seekToTime:&v14 toleranceBefore:&v13 toleranceAfter:&v12 seekID:v11 completionHandler:completionHandler];
}

- (int)makeSeekID
{
  MEMORY[0x199715030](self->_playerItem->seekIDMutex, a2);
  int v3 = [(AVPlayerItem *)self _CreateSeekID];
  MEMORY[0x199715040](self->_playerItem->seekIDMutex);
  return v3;
}

- (int)_CreateSeekID
{
  int value_high = HIDWORD(self->_playerItem->initialMaxSnapTime.value);
  HIDWORD(self->_playerItem->initialMaxSnapTime.value) = FPSupport_IncrementSeekID();
  return value_high;
}

- (CMTime)duration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F0];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__AVPlayerItem_duration__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

uint64_t __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 810) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __51__AVPlayerItem__markAsReadyForInspectionOfDuration__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 226) = 1;
  return result;
}

__n128 __42__AVPlayerItem_preferredMinimumResolution__block_invoke(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 952);
  __n128 result = *v1;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

uint64_t __22__AVPlayerItem_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 272);
  return result;
}

__n128 __32__AVPlayerItem_presentationSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 976);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

uint64_t __72__AVPlayerItem__markFigAssetAsReadyForInspectionOfMediaSelectionOptions__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 227) = 1;
  return result;
}

uint64_t __66__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 752);
  return result;
}

uint64_t __62__AVPlayerItem_refreshesClosedCaptionsImmediatelyAfterSeeking__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 789);
  return result;
}

uint64_t __60__AVPlayerItem_decodesAllFramesDuringOrdinaryPlaybackWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 749);
  return result;
}

uint64_t __58__AVPlayerItem_minimumIntervalForIFrameOnlyPlaybackWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 780);
  return result;
}

uint64_t __58__AVPlayerItem_continuesPlayingDuringPrerollForRateChange__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 751);
  return result;
}

uint64_t __57__AVPlayerItem_speedThresholdForIFrameOnlyPlaybackWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 788);
  return result;
}

uint64_t __56__AVPlayerItem_automaticallyPreservesTimeOffsetFromLive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 438);
  return result;
}

uint64_t __55__AVPlayerItem_appliesPerFrameHDRDisplayMetadataWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 844);
  return result;
}

uint64_t __55__AVPlayerItem_allowedAudioSpatializationFormatsWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1448);
  return result;
}

uint64_t __54__AVPlayerItem_advanceTimeForOverlappedPlaybackWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 408);
  return result;
}

uint64_t __53__AVPlayerItem_AVPlayerItemHaptics__playHapticTracks__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 904);
  return result;
}

uint64_t __53__AVPlayerItem_reversesMoreVideoFramesInMemoryWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 745);
  return result;
}

uint64_t __52__AVPlayerItem_continuesPlayingDuringPrerollForSeek__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 750);
  return result;
}

uint64_t __51__AVPlayerItem_aggressivelyCachesVideoFramesWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 747);
  return result;
}

uint64_t __50__AVPlayerItem_imageQueueInterpolationCurveWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 840);
  return result;
}

uint64_t __48__AVPlayerItem_audioSpatializationAllowedWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1433);
  return result;
}

double __47__AVPlayerItem_preferredMaximumAudioSampleRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 824);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __46__AVPlayerItem_adjustCompressionProfileWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 712);
  return result;
}

float __45__AVPlayerItem_soundCheckVolumeNormalization__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 680);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43__AVPlayerItem_suppressesAudioOnlyVariants__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 809);
  return result;
}

uint64_t __39__AVPlayerItem_blendsVideoFramesWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 842);
  return result;
}

uint64_t __39__AVPlayerItem_adjustTargetLevelWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 704);
  return result;
}

uint64_t __34__AVPlayerItem_variantPreferences__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 816);
  return result;
}

uint64_t __33__AVPlayerItem_requiresAccessLog__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 808);
  return result;
}

float __32__AVPlayerItem_volumeAdjustment__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 684);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __28__AVPlayerItem_restrictions__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 720);
  return result;
}

uint64_t __83__AVPlayerItem_AVPlayerInterstitialSupport__automaticallyHandlesInterstitialEvents__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1002);
  return result;
}

uint64_t __55__AVPlayerItem__isReadyForInspectionOfPresentationSize__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 225);
  return result;
}

uint64_t __39__AVPlayerItem_audioTimePitchAlgorithm__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 536);
  return result;
}

uint64_t __32__AVPlayerItem__attachToPlayer___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 128) = *(void *)(result + 40);
  return result;
}

uint64_t __38__AVPlayerItem__suppressesVideoLayers__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 200);
  return result;
}

uint64_t __49__AVPlayerItem__markAsReadyForInspectionOfTracks__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 224) = 1;
  return result;
}

uint64_t __62__AVPlayerItem_setContinuesPlayingDuringPrerollForRateChange___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 751) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 904) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __56__AVPlayerItem_setContinuesPlayingDuringPrerollForSeek___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 750) = *(unsigned char *)(result + 40);
  return result;
}

double __51__AVPlayerItem_setPreferredMaximumAudioSampleRate___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 824) = result;
  return result;
}

uint64_t __49__AVPlayerItem_setAutoSwitchAtmosStreamVariants___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 811) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 809) = *(unsigned char *)(result + 40);
  return result;
}

__n128 __46__AVPlayerItem_setPreferredMinimumResolution___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 952) = result;
  return result;
}

uint64_t __37__AVPlayerItem_setRequiresAccessLog___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 808) = *(unsigned char *)(result + 40);
  return result;
}

__n128 __38__AVPlayerItem_reversePlaybackEndTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(v2 + 312);
  v1[3].n128_u64[0] = *(void *)(v2 + 328);
  v1[2] = result;
  return result;
}

__n128 __36__AVPlayerItem__timeToPausePlayback__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(v2 + 360);
  v1[3].n128_u64[0] = *(void *)(v2 + 376);
  v1[2] = result;
  return result;
}

uint64_t __37__AVPlayerItem_isPlaybackBufferEmpty__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 992);
  return result;
}

uint64_t __51__AVPlayerItem_setNonForcedSubtitleDisplayEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 996) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __36__AVPlayerItem_isPlaybackBufferFull__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 993);
  return result;
}

__n128 __44__AVPlayerItem_configuredTimeOffsetFromLive__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(v2 + 440);
  v1[3].n128_u64[0] = *(void *)(v2 + 456);
  v1[2] = result;
  return result;
}

__n128 __38__AVPlayerItem_forwardPlaybackEndTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = v2[18];
  v1[3].n128_u64[0] = v2[19].n128_u64[0];
  v1[2] = result;
  return result;
}

__n128 __37__AVPlayerItem__timeToPauseBuffering__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = v2[21];
  v1[3].n128_u64[0] = v2[22].n128_u64[0];
  v1[2] = result;
  return result;
}

uint64_t __45__AVPlayerItem_autoSwitchAtmosStreamVariants__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 811);
  return result;
}

uint64_t __44__AVPlayerItem_AVPlayerItemAVKit__AVKitData__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 896);
  return result;
}

uint64_t __40__AVPlayerItem__snapTimeToPausePlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 437);
  return result;
}

uint64_t __38__AVPlayerItem__hasEnqueuedVideoFrame__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1000);
  return result;
}

uint64_t __59__AVPlayerItem__markAsReadyForInspectionOfPresentationSize__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 225) = 1;
  return result;
}

uint64_t __45__AVPlayerItem_copyWithZone_newAssetOptions___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 616);
  return result;
}

uint64_t __42__AVPlayerItem__isReadyForBasicInspection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 249);
  return result;
}

__n128 __42__AVPlayerItem_setReversePlaybackEndTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v1 + 328) = *(void *)(a1 + 56);
  *(__n128 *)(v1 + 312) = result;
  return result;
}

uint64_t __24__AVPlayerItem_delegate__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 256);
  return result;
}

uint64_t __34__AVPlayerItem__attachToFigPlayer__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 120) = *(void *)(result + 40);
  return result;
}

uint64_t __45__AVPlayerItem__isReadyForInspectionOfTracks__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 224);
  return result;
}

__n128 __48__AVPlayerItem_setConfiguredTimeOffsetFromLive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v1 + 456) = *(void *)(a1 + 56);
  *(__n128 *)(v1 + 440) = result;
  return result;
}

__n128 __42__AVPlayerItem_setForwardPlaybackEndTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[19].n128_u64[0] = *(void *)(a1 + 56);
  v1[18] = result;
  return result;
}

__n128 __26__AVPlayerItem__setAsset___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v1 + 504) = *(void *)(a1 + 56);
  *(__n128 *)(v1 + 488) = result;
  return result;
}

uint64_t __106__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v1 + 249)) {
    BOOL v2 = *(unsigned char *)(v1 + 227) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __72__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__serviceIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1152) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __46__AVPlayerItem__markAsReadyForBasicInspection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 249) = 1;
  return result;
}

uint64_t __40__AVPlayerItem__markAsFigItemConfigured__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 877) = 1;
  return result;
}

id __59__AVPlayerItem_AVPlayerItemHaptics__hapticPlaybackLocality__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 912);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __34__AVPlayerItem_textHighlightArray__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 528);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __30__AVPlayerItem_textStyleRules__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 520);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __28__AVPlayerItem_loudnessInfo__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 688) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __25__AVPlayerItem_mediaKind__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 736) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __24__AVPlayerItem_audioMix__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 264);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __66__AVPlayerItem_AVPlayerItemVideoEnhancement__videoEnhancementMode__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1112);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_addFPListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_playerItem->figPlaybackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVPlayerItem *)self _weakReference];
    CFRetain(v4);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVPlayerItem *)self _fpNotificationNames];
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
          [v3 addListenerWithWeakReference:v4 callback:avplayeritem_fpItemNotificationCallback name:*(void *)(*((void *)&v10 + 1) + 8 * v9++) object:self->_playerItem->figPlaybackItem flags:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputChanged name:*MEMORY[0x1E4F335E0] object:self->_playerItem->figPlaybackItem flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputWasFlushed name:*MEMORY[0x1E4F335E8] object:self->_playerItem->figPlaybackItem flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_MetadataOutputChanged name:*MEMORY[0x1E4F335F0] object:self->_playerItem->figPlaybackItem flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_MetadataOutputWasFlushed name:*MEMORY[0x1E4F335F8] object:self->_playerItem->figPlaybackItem flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_TaggedMetadataArrayChanged name:*MEMORY[0x1E4F336C8] object:self->_playerItem->figPlaybackItem flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputChanged name:*MEMORY[0x1E4F33650] object:self->_playerItem->figPlaybackItem flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputWasFlushed name:*MEMORY[0x1E4F33658] object:self->_playerItem->figPlaybackItem flags:0];
  }
}

- (id)_fpNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F33640], *MEMORY[0x1E4F33590], *MEMORY[0x1E4F33648], *MEMORY[0x1E4F33598], *MEMORY[0x1E4F336B0], *MEMORY[0x1E4F336C0], *MEMORY[0x1E4F336B8], *MEMORY[0x1E4F336A8], *MEMORY[0x1E4F33628], *MEMORY[0x1E4F33688], *MEMORY[0x1E4F33620], *MEMORY[0x1E4F33568], *MEMORY[0x1E4F335A0], *MEMORY[0x1E4F33578], *MEMORY[0x1E4F336E0], *MEMORY[0x1E4F33588], *MEMORY[0x1E4F335A8],
               *MEMORY[0x1E4F33570],
               *MEMORY[0x1E4F336D0],
               *MEMORY[0x1E4F33600],
               *MEMORY[0x1E4F33608],
               *MEMORY[0x1E4F33678],
               *MEMORY[0x1E4F33680],
               *MEMORY[0x1E4F335C8],
               *MEMORY[0x1E4F335D0],
               *MEMORY[0x1E4F335D8],
               *MEMORY[0x1E4F33550],
               *MEMORY[0x1E4F336D8],
               *MEMORY[0x1E4F33560],
               *MEMORY[0x1E4F33580],
               *MEMORY[0x1E4F33660],
               *MEMORY[0x1E4F335B8],
               *MEMORY[0x1E4F335C0],
               *MEMORY[0x1E4F33690],
               *MEMORY[0x1E4F335B0],
               *MEMORY[0x1E4F336A0],
               *MEMORY[0x1E4F33610],
               *MEMORY[0x1E4F33698],
               *MEMORY[0x1E4F33548],
               *MEMORY[0x1E4F33638],
               *MEMORY[0x1E4F33630],
               *MEMORY[0x1E4F33618],
               @"OverlappedPlaybackItemDidComplete",
               *MEMORY[0x1E4F34058],
               *MEMORY[0x1E4F21770],
               0,
               *MEMORY[0x1E4F336E0],
               *MEMORY[0x1E4F33578],
               *MEMORY[0x1E4F335A0],
               *MEMORY[0x1E4F33568],
               *MEMORY[0x1E4F33620],
               *MEMORY[0x1E4F33688],
               *MEMORY[0x1E4F33628],
               *MEMORY[0x1E4F336A8],
               *MEMORY[0x1E4F336B8],
               *MEMORY[0x1E4F336C0],
               *MEMORY[0x1E4F336B0],
               *MEMORY[0x1E4F33598],
               *MEMORY[0x1E4F33648],
               *MEMORY[0x1E4F33590],
               *MEMORY[0x1E4F33640]);
}

CFTypeRef __35__AVPlayerItem__copyFoldedTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 208);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __93__AVPlayerItem_AVPlayerItemProtectedContentPrivate___isExternalProtectionRequiredForPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1001);
  return result;
}

uint64_t __73__AVPlayerItem_restrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 995);
  return result;
}

uint64_t __67__AVPlayerItem_AVPlayerItemSpeedRampInternal___speedRampDataWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1520);
  return result;
}

uint64_t __65__AVPlayerItem_canUseNetworkResourcesForLiveStreamingWhilePaused__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 544);
  return result;
}

uint64_t __62__AVPlayerItem_usesMinimalLatencyForVideoCompositionRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 856);
  return result;
}

__n128 __62__AVPlayerItem_preferredMaximumResolutionForExpensiveNetworks__block_invoke(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 936);
  __n128 result = *v1;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

uint64_t __56__AVPlayerItem_seekingWaitsForVideoCompositionRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 512);
  return result;
}

double __56__AVPlayerItem_preferredPeakBitRateForExpensiveNetworks__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 608);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __55__AVPlayerItem_savesDownloadedDataToDiskWhenDoneWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 873);
  return result;
}

uint64_t __45__AVPlayerItem_playbackLikelyToKeepUpTrigger__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 864);
  return result;
}

uint64_t __42__AVPlayerItem_willNeverSeekBackwardsHint__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1288);
  return result;
}

__n128 __42__AVPlayerItem_preferredMaximumResolution__block_invoke(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 920);
  __n128 result = *v1;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

uint64_t __41__AVPlayerItem_alwaysMonitorsPlayability__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 857);
  return result;
}

uint64_t __40__AVPlayerItem_allowProgressiveSwitchUp__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 874);
  return result;
}

uint64_t __39__AVPlayerItem_allowProgressiveStartup__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 875);
  return result;
}

uint64_t __38__AVPlayerItem_allowProgressiveResume__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 876);
  return result;
}

double __36__AVPlayerItem_preferredPeakBitRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 600);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __33__AVPlayerItem_videoApertureMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 848);
  return result;
}

uint64_t __33__AVPlayerItem_audioTapProcessor__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 696);
  return result;
}

uint64_t __33__AVPlayerItem_RTCReportingFlags__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 648);
  return result;
}

uint64_t __30__AVPlayerItem_limitReadAhead__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 728);
  return result;
}

id __68__AVPlayerItem_AVPlayerItemMediaDataCollectors___metadataCollectors__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 632);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __22__AVPlayerItem_tracks__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 144) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __49__AVPlayerItem_setSoundCheckVolumeNormalization___block_invoke(uint64_t result)
{
  float v1 = *(float *)(result + 48);
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (v1 != *(float *)(v2 + 680))
  {
    *(float *)(v2 + 680) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __36__AVPlayerItem_setVolumeAdjustment___block_invoke(uint64_t result)
{
  float v1 = *(float *)(result + 48);
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (v1 != *(float *)(v2 + 684))
  {
    *(float *)(v2 + 684) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void *__32__AVPlayerItem_setRestrictions___block_invoke(void *result)
{
  uint64_t v1 = result[6];
  uint64_t v2 = *(void *)(result[4] + 8);
  if (v1 != *(void *)(v2 + 720))
  {
    *(void *)(v2 + 720) = v1;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

__n128 __46__AVPlayerItem_IFramePrefetchTargetDimensions__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 880);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfStatus
{
  return 0;
}

uint64_t __56__AVPlayerItem__setMediaOptionsSelectedByClient_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(*(void *)(a1[5] + 8) + 1392);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

uint64_t __87__AVPlayerItem_AVPlayerInterstitialSupport__setAutomaticallyHandlesInterstitialEvents___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 1002) != v2)
  {
    *(unsigned char *)(v1 + 1002) = v2;
    int v3 = *(unsigned __int8 *)(result + 40);
    id v4 = *(void **)(result + 32);
    if (v3) {
      return [v4 _addInterstitialEventCollectorLocked:1];
    }
    else {
      return [v4 _removeInterstitialEventCollectorLocked:1];
    }
  }
  return result;
}

- (BOOL)_configurePlaybackItemAndReturnError:(id *)a3
{
  uint64_t v62 = 0;
  v63 = 0;
  CFTypeRef v60 = 0;
  id v61 = 0;
  if (!self->_playerItem->figPlaybackItem) {
    return 1;
  }
  [(AVPlayerItem *)self _getVideoComposition:&v62 customVideoCompositorSession:&v61 figVideoCompositor:&v60];
  if (v62) {
    BOOL v5 = v61 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || ([v61 commitCustomVideoCompositorPropertiesAndReturnError:&v63] & 1) != 0)
  {
    if ([(NSArray *)self->_playerItem->automaticallyLoadedAssetKeys count])
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_playerItem->automaticallyLoadedAssetKeys];
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      +[AVFigAssetInspectorLoader _mapAssetKeys:toFigAssetPropertySet:figAssetTrackPropertySet:callerName:](AVFigAssetInspectorLoader, "_mapAssetKeys:toFigAssetPropertySet:figAssetTrackPropertySet:callerName:", v6, v7, v8, @"-[AVPlayerItem _configurePlaybackItem]");
      if ([v7 count])
      {
        uint64_t v9 = [v7 allObjects];
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v12 = v11 ? v11 : 0;
        CMTime v14 = *(void (**)(uint64_t, void, uint64_t))(v12 + 56);
        if (v14) {
          v14(FigBaseObject, *MEMORY[0x1E4F338E8], v9);
        }
      }
      if ([v8 count])
      {
        uint64_t v15 = [v8 allObjects];
        uint64_t v16 = FigPlaybackItemGetFigBaseObject();
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v18 = v17 ? v17 : 0;
        uint64_t v19 = *(void (**)(uint64_t, void, uint64_t))(v18 + 56);
        if (v19) {
          v19(v16, *MEMORY[0x1E4F338F0], v15);
        }
      }
    }
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    if ([(AVPlayerItem *)self savesDownloadedDataToDiskWhenDoneWasSet]) {
      [(AVPlayerItem *)self setSavesDownloadedDataToDiskWhenDone:[(AVPlayerItem *)self savesDownloadedDataToDiskWhenDone]];
    }
    seekQueue = self->_playerItem->seekQueue;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_2;
    v58[3] = &unk_1E57B1E80;
    v58[4] = self;
    dispatch_sync(seekQueue, v58);
    id v22 = [(AVPlayerItem *)self initialDate];
    if (v22) {
      [(AVPlayerItem *)self seekToDate:v22 completionHandler:0];
    }
    id v23 = [(AVPlayerItem *)self initialEstimatedDate];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = FigPlaybackItemGetFigBaseObject();
      uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v27 = v26 ? v26 : 0;
      v28 = *(void (**)(uint64_t, void, id))(v27 + 56);
      if (v28) {
        v28(v25, *MEMORY[0x1E4F339B8], v24);
      }
    }
    [(AVPlayerItem *)self loopTimeRange];
    if (v57)
    {
      [(AVPlayerItem *)self loopTimeRange];
      if (v56)
      {
        [(AVPlayerItem *)self loopTimeRange];
        if (!v55)
        {
          [(AVPlayerItem *)self loopTimeRange];
          if ((v54 & 0x8000000000000000) == 0) {
            [(AVPlayerItem *)self _updateLoopTimeRangeOnFigPlaybackItem];
          }
        }
      }
    }
    [(AVPlayerItem *)self forwardPlaybackEndTime];
    if (v53) {
      [(AVPlayerItem *)self _updateForwardPlaybackEndTimeOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self reversePlaybackEndTime];
    if (v52) {
      [(AVPlayerItem *)self _updateReversePlaybackEndTimeOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _timeToPauseBuffering];
    if (v51) {
      [(AVPlayerItem *)self _updateTimeToPauseBufferingOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _timeToPausePlayback];
    if (v50) {
      [(AVPlayerItem *)self _updateTimeToPausePlaybackOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self advanceTimeForOverlappedPlaybackWasSet]) {
      [(AVPlayerItem *)self _updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self overlappedPlaybackEndTimeWasSet]) {
      [(AVPlayerItem *)self _updateOverlappedPlaybackEndTimeOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self imageQueueInterpolationCurveWasSet]) {
      [(AVPlayerItem *)self _updateImageQueueInterpolationCurveOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self blendsVideoFramesWasSet]) {
      [(AVPlayerItem *)self _updateBlendsVideoFramesOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self appliesPerFrameHDRDisplayMetadataWasSet]) {
      [(AVPlayerItem *)self _updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self reversesMoreVideoFramesInMemoryWasSet]) {
      [(AVPlayerItem *)self _updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self aggressivelyCachesVideoFramesWasSet]) {
      [(AVPlayerItem *)self _updateAggressivelyCachesVideoFramesOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self decodesAllFramesDuringOrdinaryPlaybackWasSet])
    {
      [(AVPlayerItem *)self _updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem];
    }
    if (![(AVPlayerItem *)self continuesPlayingDuringPrerollForSeek]) {
      [(AVPlayerItem *)self _updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem];
    }
    if (![(AVPlayerItem *)self continuesPlayingDuringPrerollForRateChange]) {
      [(AVPlayerItem *)self _updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet])
    {
      [(AVPlayerItem *)self _updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self minimumIntervalForIFrameOnlyPlaybackWasSet]) {
      [(AVPlayerItem *)self _updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self speedThresholdForIFrameOnlyPlaybackWasSet]) {
      [(AVPlayerItem *)self _updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self refreshesClosedCaptionsImmediatelyAfterSeeking])
    {
      [(AVPlayerItem *)self _updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self audioSpatializationAllowedWasSet]) {
      [(AVPlayerItem *)self _updateAudioSpatializationAllowed];
    }
    if ([(AVPlayerItem *)self allowedAudioSpatializationFormatsWasSet]) {
      [(AVPlayerItem *)self _updateAllowedAudioSpatializationFormats];
    }
    [(AVPlayerItem *)self _updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem];
    if ([(AVPlayerItem *)self automaticallyPreservesTimeOffsetFromLive]) {
      [(AVPlayerItem *)self _updatePreservesTimeOffsetFromLive];
    }
    [(AVPlayerItem *)self configuredTimeOffsetFromLive];
    if (v49) {
      [(AVPlayerItem *)self _updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem];
    }
    if (v62) {
      [(AVPlayerItem *)self _applyCurrentVideoComposition];
    }
    [(AVPlayerItem *)self _applyCurrentAudioMix];
    [(AVPlayerItem *)self _updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem];
    if ((HIDWORD(self->_playerItem->interstitialEventID) & 0x80000000) == 0) {
      -[AVPlayerItem _quietlySetEQPreset:](self, "_quietlySetEQPreset:");
    }
    [(AVPlayerItem *)self _updatePlaybackPropertiesOnFigPlaybackItem];
    if (((unint64_t)self->_playerItem->rampInOutInfo & 0x8000000000000000) == 0) {
      -[AVPlayerItem _quietlySetVariantIndex:](self, "_quietlySetVariantIndex:");
    }
    [(AVPlayerItem *)self _updateSoundCheckVolumeNormalizationOnFigPlaybackItem];
    [(AVPlayerItem *)self _updateVolumeAdjustmentOnFigPlaybackItem];
    if ([(AVPlayerItem *)self audioTimePitchAlgorithm])
    {
      [(AVPlayerItem *)self _updateFigTimePitchAlgorithmOnFigPlaybackItem];
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_3;
      v48[3] = &unk_1E57B1E80;
      v48[4] = self;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v48);
    }
    [(AVPlayerItem *)self _updateLoudnessInfoOnFigPlaybackItem];
    [(AVPlayerItem *)self _updateAudioTapProcessorOnFigPlaybackItem];
    if ([(AVPlayerItem *)self adjustTargetLevelWasSet]) {
      [(AVPlayerItem *)self _updateAdjustTargetLevelOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self adjustCompressionProfileWasSet]) {
      [(AVPlayerItem *)self _updateAdjustCompressionProfileOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _applyMediaSelectionOptions];
    [(AVPlayerItem *)self _updateTextStyleRulesOnFigPlaybackItem];
    if ([(AVPlayerItem *)self textHighlightArray]) {
      [(AVPlayerItem *)self _updateTextHighlightArrayOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _updateMediaKindOnFigPlaybackItem];
    [(AVPlayerItem *)self _updateRestrictionsOnFigPlaybackItem];
    [(AVPlayerItem *)self _quietlySetServiceIdentifier];
    [(AVPlayerItem *)self _setSyncLayersOnFigPlaybackItem];
    [(AVPlayerItem *)self _updateTimebase];
    [(AVPlayerItem *)self IFramePrefetchTargetDimensions];
    double v32 = *MEMORY[0x1E4F1DB30];
    double v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v33 != *MEMORY[0x1E4F1DB30] || v30 != v31) {
      [(AVPlayerItem *)self _updateIFramePrefetchTargetDimensionsOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self preferredPeakBitRate];
    if (v34 > 0.0) {
      [(AVPlayerItem *)self _updatePreferredPeakBitRateOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self preferredPeakBitRateForExpensiveNetworks];
    if (v35 > 0.0) {
      [(AVPlayerItem *)self _updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self preferredMaximumResolution];
    if (v37 != v32 || v36 != v31) {
      [(AVPlayerItem *)self _updatePreferredMaximumResolutionOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self preferredMaximumResolutionForExpensiveNetworks];
    if (v39 != v32 || v38 != v31) {
      [(AVPlayerItem *)self _updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self preferredMinimumResolution];
    if (v41 != v32 || v40 != v31) {
      [(AVPlayerItem *)self _updatePreferredMinimumResolutionOnFigPlaybackItem];
    }
    if (self->_playerItem->maximumTrailingBufferDuration.value) {
      [(AVPlayerItem *)self _updateMaximumTrailingBufferDurationOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self maximumForwardBufferDuration];
    if (v47) {
      [(AVPlayerItem *)self _updateMaximumForwardBufferDurationOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self videoApertureMode]) {
      [(AVPlayerItem *)self _updateVideoApertureModeOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _updateVariantPreferencesOnFigPlaybackItem];
    [(AVPlayerItem *)self preferredMaximumAudioSampleRate];
    if (v42 != 0.0) {
      [(AVPlayerItem *)self _updatePreferredMaximumAudioSampleRateOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self RTCReportingFlags] != 1) {
      [(AVPlayerItem *)self _updateRTCReportingFlagsOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _updateRTCReportingCategoryOnFigPlaybackItem];
    [(AVPlayerItem *)self _updateReportingValuesOnFigPlaybackItem];
    uint64_t v43 = objc_msgSend(-[AVPlayerItem _metadataCollectors](self, "_metadataCollectors"), "count");
    if (v43)
    {
      v44 = self->_playerItem->figPlaybackItemSetterQueue;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_4;
      v46[3] = &unk_1E57B2228;
      v46[4] = self;
      v46[5] = v43;
      dispatch_sync(v44, v46);
    }
    if ([(AVPlayerItem *)self videoEnhancementMode]) {
      [(AVPlayerItem *)self _updateVideoEnhancementModeOnFigPlaybackItem];
    }
    playerItem = self->_playerItem;
    if (LODWORD(playerItem->preferredPeakBitRateForExpensiveNetworks) != -1)
    {
      [(AVPlayerItem *)self _updateStartsOnFirstEligibleVariantOnFigPlaybackItem];
      playerItem = self->_playerItem;
    }
    if (!BYTE3(playerItem->initialDate)) {
      [(AVPlayerItem *)self _updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self _speedRampDataWasSet]) {
      [(AVPlayerItem *)self _updateSpeedRampDataOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _markAsFigItemConfigured];
    if (v60) {
      CFRelease(v60);
    }
    return 1;
  }
  BOOL result = 0;
  if (a3) {
    *a3 = v63;
  }
  return result;
}

- (CGSize)preferredMinimumResolution
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AVPlayerItem_preferredMinimumResolution__block_invoke;
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

- (void)_updateTimebase
{
  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVPlayerItem__updateTimebase__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(figPlaybackItemAccessorQueue, block);
}

- (AVVideoComposition)videoComposition
{
  AVTelemetryGenerateID();
  double v4 = 0;
  [(AVPlayerItem *)self _getVideoComposition:&v4 customVideoCompositorSession:0 figVideoCompositor:0];
  return v4;
}

- (void)_getVideoComposition:(id *)a3 customVideoCompositorSession:(id *)a4 figVideoCompositor:(OpaqueFigVideoCompositor *)a5
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__7;
  uint64_t v26 = __Block_byref_object_dispose__7;
  uint64_t v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__7;
  uint64_t v20 = __Block_byref_object_dispose__7;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__AVPlayerItem__getVideoComposition_customVideoCompositorSession_figVideoCompositor___block_invoke;
  v11[3] = &unk_1E57B40C8;
  v11[4] = self;
  v11[5] = &v22;
  v11[6] = &v16;
  v11[7] = &v12;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v11);
  if (a3) {
    *a3 = (id)v23[5];
  }
  if (a4) {
    *a4 = (id)v17[5];
  }
  if (a5)
  {
    uint64_t v9 = (OpaqueFigVideoCompositor *)v13[3];
    if (v9) {
      uint64_t v9 = (OpaqueFigVideoCompositor *)CFRetain(v9);
    }
    *a5 = v9;
  }

  uint64_t v10 = (const void *)v13[3];
  if (v10) {
    CFRelease(v10);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeToPausePlayback
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  CGSize result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    double v6 = result;
    CFDictionaryRef dictionaryRepresentation = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(unsigned int (**)(uint64_t, void, void, CFDictionaryRef *))(v9 + 48);
    if (v10 && !v10(FigBaseObject, *MEMORY[0x1E4F33BF8], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation))
    {
      CMTimeMakeFromDictionary(&v12, dictionaryRepresentation);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v12.value;
      CFDictionaryRef v11 = dictionaryRepresentation;
      retstr->var3 = v12.epoch;
      if (v11) {
        CFRelease(v11);
      }
    }
    CFRelease(v6);
  }
  else
  {
    if (self) {
      CGSize result = [(AVPlayerItem *)self _timeToPausePlayback];
    }
    else {
      memset(&v12, 0, sizeof(v12));
    }
    *(CMTime *)retstr = v12;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeToPausePlayback
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem__timeToPausePlayback__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeToPauseBuffering
{
  CMTime v15 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  double v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v5)
  {
    double v6 = v5;
    CFDictionaryRef dictionaryRepresentation = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    long long v11 = *(unsigned int (**)(uint64_t, void, void, CFDictionaryRef *))(v9 + 48);
    if (v11)
    {
      if (!v11(FigBaseObject, *MEMORY[0x1E4F33BF0], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation))
      {
        CMTimeMakeFromDictionary(&v13, dictionaryRepresentation);
        CMTime v15 = v13;
        if (dictionaryRepresentation) {
          CFRelease(dictionaryRepresentation);
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    CGSize result = [(AVPlayerItem *)self _timeToPauseBuffering];
    CMTime v15 = v12;
  }
  *(CMTime *)retstr = v15;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeToPauseBuffering
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AVPlayerItem__timeToPauseBuffering__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)setRequiresAccessLog:(BOOL)a3
{
  double v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AVPlayerItem_setRequiresAccessLog___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__AVPlayerItem_setRequiresAccessLog___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    v8[4] = v5;
    BOOL v9 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

void __31__AVPlayerItem__updateTimebase__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (*(void *)(v2[1] + 128))
  {
    uint64_t v3 = [v2 _copyFigPlaybackItem];
    uint64_t v4 = [(id)objc_opt_class() _copyTimebaseFromFigPlaybackItem:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(NSObject **)(*(void *)(v5 + 8) + 128);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__AVPlayerItem__updateTimebase__block_invoke_2;
    block[3] = &unk_1E57B36D0;
    block[4] = v5;
    void block[5] = v4;
    void block[6] = v3;
    dispatch_async(v6, block);
  }
}

- (void)_updatePreferredMinimumResolutionOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__AVPlayerItem__updatePreferredMinimumResolutionOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

- (void)_updateLoudnessInfoOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__AVPlayerItem__updateLoudnessInfoOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateMediaKindOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__AVPlayerItem__updateMediaKindOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)setPrefersOfflinePlayableVariants:(BOOL)a3
{
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    v8[4] = v5;
    BOOL v9 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

- (OpaqueFigPlaybackItem)_copyFigPlaybackItem
{
  return [(AVPlayerItem *)self _copyFigPlaybackItemLocked:0];
}

+ (OpaqueCMTimebase)_copyTimebaseFromFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  uint64_t v8 = 0;
  if (!a3) {
    return 0;
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v5 = v4 ? v4 : 0;
  double v6 = *(void (**)(uint64_t, void, void, OpaqueCMTimebase **))(v5 + 48);
  if (!v6) {
    return 0;
  }
  v6(FigBaseObject, *MEMORY[0x1E4F33C00], *MEMORY[0x1E4F1CF80], &v8);
  return v8;
}

- (void)setPreferredMinimumResolution:(CGSize)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerItem_setPreferredMinimumResolution___block_invoke;
  block[3] = &unk_1E57B36D0;
  block[4] = self;
  CGSize v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerItem *)self _updatePreferredMinimumResolutionOnFigPlaybackItem];
}

- (void)setAudioMix:(AVAudioMix *)audioMix
{
  AVTelemetryGenerateID();
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__AVPlayerItem_setAudioMix___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = audioMix;
  void block[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  CGSize v6 = [(AVPlayerItem *)self _copyStateDispatchQueue];
  if (v6)
  {
    uint64_t v7 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __28__AVPlayerItem_setAudioMix___block_invoke_2;
    v8[3] = &unk_1E57B1E80;
    v8[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(v6, v8);
    dispatch_release(v7);
  }
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  AVTelemetryGenerateID();
  if (videoComposition)
  {
    uint64_t v20 = 0;
    if ([(AVVideoComposition *)videoComposition _isValidReturningExceptionReason:&v20])
    {
      if (![(AVVideoComposition *)videoComposition animationTool]) {
        goto LABEL_4;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      uint64_t v16 = @"AVVideoCompositions using AVVideoCompositionCoreAnimationTool cannot be used with AVPlayerItem. AVVideoCompositionCoreAnimationTool is for offline rendering only.";
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      uint64_t v16 = v20;
    }
    uint64_t v17 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v6, v7, v8, v9, v10, v18[0]), 0);
    objc_exception_throw(v17);
  }
LABEL_4:
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem_setVideoComposition___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = videoComposition;
  void block[6] = &v20;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v12 = [(AVPlayerItem *)self _copyStateDispatchQueue];
    CMTime v13 = v12;
    if (v12)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = (uint64_t)__36__AVPlayerItem_setVideoComposition___block_invoke_2;
      v18[3] = (uint64_t)&unk_1E57B1E80;
      v18[4] = (uint64_t)self;
      AVSerializeOnQueueAsyncIfNecessary(v12, v18);
      dispatch_release(v13);
    }
  }
  _Block_object_dispose(&v20, 8);
}

- (AVPlayerItem)initWithAsset:(AVAsset *)asset
{
  AVTelemetryGenerateID();
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if (sOKToBlockWhenGettingValuesOfProperties)
  {
    uint64_t v6 = 0;
  }
  else
  {
    int v7 = isKindOfClass;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() | v7)) {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"duration", @"availableMediaCharacteristicsWithMediaSelectionOptions", 0);
    }
    else {
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:@"duration"];
    }
    uint64_t v6 = v8;
  }
  return [(AVPlayerItem *)self initWithAsset:asset automaticallyLoadedAssetKeys:v6];
}

- (AVPlayerItem)initWithAsset:(AVAsset *)asset automaticallyLoadedAssetKeys:(NSArray *)automaticallyLoadedAssetKeys
{
  AVTelemetryGenerateID();
  uint64_t v8 = objc_alloc_init(AVPlayerItemInternal);
  self->_playerItem = v8;
  if (!v8)
  {
LABEL_10:

    return 0;
  }
  CFRetain(v8);
  if (sInvokeOverrideOfInitFromDesignatedInitializer != 1
    || ![(id)objc_opt_class() _hasOverrideForSelector:sel_init]
    || (self = [(AVPlayerItem *)self init]) != 0)
  {
    if (!asset) {
      goto LABEL_10;
    }
    if (([(id)objc_opt_class() supportsPlayerItems] & 1) == 0)
    {
      double v37 = self;
      double v38 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v39 = *MEMORY[0x1E4F1C3C8];
      double v40 = (objc_class *)objc_opt_class();
      double v41 = NSStringFromClass(v40);
      char v47 = (void *)[v38 exceptionWithName:v39, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@ does not support playback via AVPlayer", v42, v43, v44, v45, v46, (uint64_t)v41), 0 reason userInfo];
      objc_exception_throw(v47);
    }
    self->_playerItem->weakReference = [[AVWeakReference alloc] initWithReferencedObject:self];
    self->_playerItem->timeJumpedNotificationIncludesExtendedDiagnosticPayload = 1;
    uint64_t v9 = &self->_playerItem->timeJumpedNotificationIncludesExtendedDiagnosticPayload + 4;
    uint64_t v10 = (_OWORD *)MEMORY[0x1E4F1FA48];
    *((void *)v9 + 2) = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)uint64_t v9 = *v10;
    BYTE4(self->_playerItem->initialTime.value) = 1;
    playerItem = self->_playerItem;
    uint64_t v12 = (_OWORD *)MEMORY[0x1E4F1F9F0];
    *(void *)&playerItem->duration.timescale = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
    *(_OWORD *)&playerItem->recommendedTimeOffsetFromLive.epoch = *v12;
    CMTime v13 = (CMTime *)MEMORY[0x1E4F1FA10];
    self->_playerItem->initialTime.timescale = AVPlayerItemGetFigPlayerSetTimeFlagsForTolerances(MEMORY[0x1E4F1FA10], MEMORY[0x1E4F1FA10]);
    uint64_t v14 = self->_playerItem;
    CMTime v49 = *(CMTime *)(&v14->timeJumpedNotificationIncludesExtendedDiagnosticPayload + 4);
    AVPlayerItemGetFigPlayerSnapTimesForTimeAndTolerances(&v49, v13, v13, (CMTime *)&v14->initialTime.flags, (CMTime *)((char *)&v14->initialMinSnapTime.value + 4));
    *(_OWORD *)&self->_playerItem->preferredMinimumResolution.height = *MEMORY[0x1E4F1DB30];
    LOBYTE(self->_playerItem->presentationSize.width) = 1;
    BYTE2(self->_playerItem->initialDate) = 1;
    uint64_t v15 = self->_playerItem;
    uint64_t v16 = (long long *)MEMORY[0x1E4F1F9F8];
    int64_t v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v15->forwardPlaybackEndTime.epoch = v17;
    long long v18 = *v16;
    *(_OWORD *)&v15->forwardPlaybackEndTime.value = *v16;
    uint64_t v19 = self->_playerItem;
    v19->reversePlaybackEndTime.epoch = v17;
    *(_OWORD *)&v19->reversePlaybackEndTime.value = v18;
    uint64_t v20 = self->_playerItem;
    v20->timeToPauseBuffering.epoch = v17;
    *(_OWORD *)&v20->timeToPauseBuffering.value = v18;
    uint64_t v21 = self->_playerItem;
    v21->timeToPausePlayback.epoch = v17;
    *(_OWORD *)&v21->timeToPausePlayback.value = v18;
    BYTE5(self->_playerItem->overlappedPlaybackEndTime.epoch) = 0;
    uint64_t v22 = self->_playerItem;
    v22->advanceTimeForOverlappedPlayback.epoch = v17;
    *(_OWORD *)&v22->advanceTimeForOverlappedPlayback.value = v18;
    self->_playerItem->advanceTimeForOverlappedPlaybackWasSet = 0;
    char v23 = &self->_playerItem->advanceTimeForOverlappedPlaybackWasSet + 4;
    *(_OWORD *)char v23 = v18;
    *((void *)v23 + 2) = v17;
    BYTE4(self->_playerItem->overlappedPlaybackEndTime.epoch) = 0;
    BYTE6(self->_playerItem->overlappedPlaybackEndTime.epoch) = 0;
    uint64_t v24 = self->_playerItem;
    *(_OWORD *)&v24->overlappedPlaybackEndTimeWasSet = v18;
    *(void *)&v24->configuredTimeOffsetFromLive.timescale = v17;
    uint64_t v25 = self->_playerItem;
    long long v48 = v18;
    *(_OWORD *)&v25->configuredTimeOffsetFromLive.epoch = v18;
    *(void *)&v25->recommendedTimeOffsetFromLive.timescale = v17;
    BYTE6(self->_playerItem->mediaKind) = 1;
    HIBYTE(self->_playerItem->mediaKind) = 1;
    p_decodesAllFramesDuringOrdinaryPlayback = &self->_playerItem->decodesAllFramesDuringOrdinaryPlayback;
    CMTimeMake(&v49, 1, 10);
    *(CMTime *)p_decodesAllFramesDuringOrdinaryPlayback = v49;
    LODWORD(self->_playerItem->minimumIntervalForIFrameOnlyPlayback.epoch) = 0x40000000;
    LOBYTE(self->_playerItem->initialFigTimePitchAlgorithm) = sCanUseExtraNetworkingByDefault;
    BYTE2(self->_playerItem->presentationSize.height) = 1;
    *(_WORD *)((char *)&self->_playerItem->preferredMaximumAudioSampleRate + 3) = 1;
    HIDWORD(self->_playerItem->interstitialEventID) = -1;
    self->_playerItem->rampInOutInfo = (NSDictionary *)-1;
    LODWORD(self->_playerItem->preferredPeakBitRateForExpensiveNetworks) = -1;
    BYTE3(self->_playerItem->initialDate) = 1;
    uint64_t v27 = 3;
    if (!sConstrainsScalabilityToLosslessVariantsAndSampleRatesByDefault) {
      uint64_t v27 = 0;
    }
    self->_playerItem->initialEstimatedDate = (NSDate *)v27;
    playerItem_createDefaultProxyTimebase();
    playerItem_createDefaultProxyTimebase();
    LODWORD(self->_playerItem->gaplessInfo) = 0;
    HIDWORD(self->_playerItem->gaplessInfo) = 1065353216;
    LOBYTE(self->_playerItem->audioProcessingTap) = 0;
    self->_playerItem->adjustTargetLevelWasSet = 0;
    self->_playerItem->mediaOptionsSelectedByClient = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)&self->_playerItem->adjustCompressionProfileWasSet = 0;
    self->_playerItem->seekIDMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    self->_playerItem->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritem.ivars");
    self->_playerItem->figConfigurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.figplaybackitem", 0);
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_playerItem->figPlaybackItemAccessorQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.figplaybackitem.accessor", v28);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_playerItem->figPlaybackItemSetterQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.figplaybackitem.setter", v29);
    double v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_playerItem->seekQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritem.seek", v30);
    self->_playerItem->itemOutputs = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    self->_playerItem->itemVideoOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_playerItem->itemLegibleOutputsForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_playerItem->itemMetadataOutputsForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_playerItem->itemRenderedLegibleOutputsForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_playerItem->initialVariantIndex = (int64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)&self->_playerItem->startsOnFirstEligibleVariant = objc_alloc_init(MEMORY[0x1E4F1C978]);
    self->_playerItem->itemCollectors = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_playerItem->videoApertureMode = 0;
    self->_playerItem->cachedTracks = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    LODWORD(self->_playerItem->interstitialEventCollector) = 1;
    *(void *)&self->_playerItem->loopTimeRange.duration.timescale = (id)[(AVLoggingIdentifier *)[(AVAsset *)asset loggingIdentifier] makeDerivedIdentifier];
    self->_playerItem->loopTimeRange.duration.epoch = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), "copy");
    if (VTPixelBufferAttributesMediatorCreate()) {
      goto LABEL_10;
    }
    VTPixelBufferAttributesMediatorSetProperty();
    p_flags = &self->_playerItem->maximumForwardBufferDuration.flags;
    *((void *)p_flags + 2) = v17;
    *(_OWORD *)p_flags = v48;
    double v33 = (char *)&self->_playerItem->initialFigTimePitchAlgorithm + 4;
    *((void *)v33 + 2) = v17;
    *(_OWORD *)double v33 = v48;
    *(_WORD *)&self->_playerItem->haveInitialSamples = 1;
    self->_playerItem->mostRecentlyAppliedAudioMix = (AVAudioMix *)4;
    self->_playerItem->audioSpatializationAllowed = 0;
    id v34 = [(AVAsset *)asset _absoluteURL];
    [(AVPlayerItem *)self _setURL:v34];
    if ([(AVAsset *)asset _playbackItem])
    {
      double v35 = +[AVURLAsset URLAssetWithURL:v34 options:0];
      double v36 = self;
    }
    else
    {
      double v36 = self;
      double v35 = (AVURLAsset *)asset;
    }
    [(AVPlayerItem *)v36 _setAsset:v35];
    self->_playerItem->automaticallyLoadedAssetKeys = (NSArray *)[(NSArray *)automaticallyLoadedAssetKeys copy];
    LOBYTE(self->_playerItem->currentMediaSelection) = 0;
    HIDWORD(self->_playerItem->initialMaxSnapTime.value) = FPSupport_InitialSeekIDForSource();
    LOBYTE(self->_playerItem->interstitialEventID) = 1;
    self->_playerItem->figCPEProtector = (OpaqueFigCPEProtector *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return self;
}

- (AVAudioMix)audioMix
{
  AVTelemetryGenerateID();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__7;
  BOOL v11 = __Block_byref_object_dispose__7;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__AVPlayerItem_audioMix__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  uint64_t v4 = (AVAudioMix *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_setURL:(id)a3
{
  if (!self->_playerItem->URL) {
    self->_playerItem->URL = (NSURL *)a3;
  }
}

- (void)_updateRestrictionsOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__AVPlayerItem__updateRestrictionsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateReportingValuesOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3052000000;
    uint64_t v12 = __Block_byref_object_copy__7;
    CMTime v13 = __Block_byref_object_dispose__7;
    uint64_t v14 = 0;
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E57B2110;
    block[4] = self;
    void block[5] = &v9;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke_2;
    v7[3] = &unk_1E57B4010;
    v7[4] = &v9;
    v7[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v7);

    CFRelease(v4);
    _Block_object_dispose(&v9, 8);
  }
}

void __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_metadataCollectors"), "count"));
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33970], v2);
  }
  uint64_t v7 = *(const void **)(a1 + 40);
  if (v7)
  {
    CFRelease(v7);
  }
}

- (id)_metadataCollectors
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem_AVPlayerItemMediaDataCollectors___metadataCollectors__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__AVPlayerItem__updateFigTimePitchAlgorithmOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) audioTimePitchAlgorithm];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33BE8];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__7;
  CMTime v13 = __Block_byref_object_dispose__7;
  uint64_t v14 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AVPlayerItem_audioTimePitchAlgorithm__block_invoke;
  v8[3] = &unk_1E57B2110;
  v8[4] = self;
  void v8[5] = &v9;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v8);
  int v3 = dyld_program_sdk_at_least();
  uint64_t v4 = &AVAudioTimePitchAlgorithmTimeDomain;
  if (!v3) {
    uint64_t v4 = &AVAudioTimePitchAlgorithmLowQualityZeroLatency;
  }
  uint64_t v5 = *v4;
  if (v10[5]) {
    uint64_t v6 = (NSString *)v10[5];
  }
  else {
    uint64_t v6 = v5;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)_speedRampDataWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlayerItem_AVPlayerItemSpeedRampInternal___speedRampDataWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_quietlySetServiceIdentifier
{
  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__AVPlayerItem_AVPlayerItemServiceIdentifier_Private___quietlySetServiceIdentifier__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (AVVideoApertureMode)videoApertureMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = @"CleanAperture";
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_videoApertureMode__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)savesDownloadedDataToDiskWhenDoneWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_savesDownloadedDataToDiskWhenDoneWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)preferredPeakBitRate
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem_preferredPeakBitRate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)preferredPeakBitRateForExpensiveNetworks
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_preferredPeakBitRateForExpensiveNetworks__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)preferredMaximumResolution
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AVPlayerItem_preferredMaximumResolution__block_invoke;
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

- (CGSize)preferredMaximumResolutionForExpensiveNetworks
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AVPlayerItem_preferredMaximumResolutionForExpensiveNetworks__block_invoke;
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumForwardBufferDuration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVPlayerItem_maximumForwardBufferDuration__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (id)initialEstimatedDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem_initialEstimatedDate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)initialDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem_initialDate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateSoundCheckVolumeNormalizationOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateSoundCheckVolumeNormalizationOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__AVPlayerItem__updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateRTCReportingCategoryOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__updateRTCReportingCategoryOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updatePlaybackPropertiesOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    if (_updatePlaybackPropertiesOnFigPlaybackItem_keyMapOnce != -1) {
      dispatch_once(&_updatePlaybackPropertiesOnFigPlaybackItem_keyMapOnce, &__block_literal_global_628);
    }
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__AVPlayerItem__updatePlaybackPropertiesOnFigPlaybackItem__block_invoke_2;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateFigTimePitchAlgorithmOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__AVPlayerItem__updateFigTimePitchAlgorithmOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__AVPlayerItem__updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateAudioTapProcessorOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateAudioTapProcessorOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_setSyncLayersOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__AVPlayerItem__setSyncLayersOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_markAsFigItemConfigured
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerItem__markAsFigItemConfigured__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_applyCurrentAudioMix
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_playerItem->figPlaybackItem)
  {
    id v3 = [(AVPlayerItem *)self audioMix];
    playerItem = self->_playerItem;
    handlersToCallWhenReadyForEnqueueing = (AVAudioMix *)playerItem->handlersToCallWhenReadyForEnqueueing;
    if (v3 != handlersToCallWhenReadyForEnqueueing)
    {
      uint64_t v6 = v3;
      if (![(AVAudioMix *)v3 isEqual:playerItem->handlersToCallWhenReadyForEnqueueing])
      {
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[AVAudioMix inputParameters](v6, "inputParameters"));
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v8 = [(AVAudioMix *)handlersToCallWhenReadyForEnqueueing inputParameters];
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v25 + 1) + 8 * i) trackID];
              if (![(AVAudioMix *)v6 audioMixInputParametersForTrackID:v13])
              {
                uint64_t v14 = +[AVMutableAudioMixInputParameters audioMixInputParameters];
                [(AVMutableAudioMixInputParameters *)v14 setTrackID:v13];
                [v7 addObject:v14];
              }
            }
            uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v10);
        }
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v15 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v7);
              }
              uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v20 = [v19 trackID];
              [(AVPlayerItem *)self _setAudioProcessingEffectsAccordingToInputParameters:v19 forTrackID:v20];
              [(AVPlayerItem *)self _setAudioCurvesAccordingToInputParameters:v19 forTrackID:v20];
              if (v20)
              {
                -[AVPlayerItem _setAudioTapProcessor:forTrackID:](self, "_setAudioTapProcessor:forTrackID:", [v19 audioTapProcessor], v20);
                -[AVPlayerItem _setAudioTimePitchAlgorithm:forTrackID:](self, "_setAudioTimePitchAlgorithm:forTrackID:", [v19 audioTimePitchAlgorithm], v20);
                -[AVPlayerItem _setAudioEffectParameters:previousEffects:forTrackID:](self, "_setAudioEffectParameters:previousEffects:forTrackID:", [v19 effects], objc_msgSend(-[AVAudioMix audioMixInputParametersForTrackID:](handlersToCallWhenReadyForEnqueueing, "audioMixInputParametersForTrackID:", v20), "effects"), v20);
              }
            }
            uint64_t v16 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v16);
        }

        self->_playerItem->handlersToCallWhenReadyForEnqueueing = (NSMutableArray *)[(AVAudioMix *)v6 copy];
      }
    }
  }
}

- (unsigned)RTCReportingFlags
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_RTCReportingFlags__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)IFramePrefetchTargetDimensions
{
  uint64_t v8 = 0;
  int v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AVPlayerItem_IFramePrefetchTargetDimensions__block_invoke;
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

- (void)_updateVolumeAdjustmentOnFigPlaybackItem
{
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__AVPlayerItem__updateVolumeAdjustmentOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateVariantPreferencesOnFigPlaybackItem
{
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__AVPlayerItem__updateVariantPreferencesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateTextStyleRulesOnFigPlaybackItem
{
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__AVPlayerItem__updateTextStyleRulesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (id)copyWithZone:(_NSZone *)a3 newAssetOptions:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  if (dyld_program_sdk_at_least()) {
    uint64_t v7 = objc_opt_class();
  }
  playerItem = self->_playerItem;
  asset = (AVURLAsset *)playerItem->asset;
  if (asset)
  {
    if (a4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        asset = +[AVURLAsset URLAssetWithURL:[(AVURLAsset *)asset URL] options:a4];
      }
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", a3), "initWithAsset:", asset);
  }
  else
  {
    if (!playerItem->URL) {
      return 0;
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", a3), "initWithURL:", self->_playerItem->URL);
  }
  uint64_t v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setVideoComposition:", -[AVPlayerItem videoComposition](self, "videoComposition"));
    objc_msgSend(v11, "setAudioMix:", -[AVPlayerItem audioMix](self, "audioMix"));
    objc_msgSend(v11, "setTextStyleRules:", -[AVPlayerItem textStyleRules](self, "textStyleRules"));
    objc_msgSend(v11, "setTextHighlightArray:", -[AVPlayerItem textHighlightArray](self, "textHighlightArray"));
    objc_msgSend(v11, "setRequiresAccessLog:", -[AVPlayerItem requiresAccessLog](self, "requiresAccessLog"));
    objc_msgSend(v11, "setSuppressesAudioOnlyVariants:", -[AVPlayerItem suppressesAudioOnlyVariants](self, "suppressesAudioOnlyVariants"));
    objc_msgSend(v11, "setPrefersOfflinePlayableVariants:", -[AVPlayerItem prefersOfflinePlayableVariants](self, "prefersOfflinePlayableVariants"));
    [(AVPlayerItem *)self forwardPlaybackEndTime];
    [v11 setForwardPlaybackEndTime:v36];
    [(AVPlayerItem *)self reversePlaybackEndTime];
    [v11 setReversePlaybackEndTime:v35];
    [(AVPlayerItem *)self timeToPauseBuffering];
    if (v34[36])
    {
      [(AVPlayerItem *)self timeToPauseBuffering];
      [v11 setTimeToPauseBuffering:v34];
    }
    [(AVPlayerItem *)self timeToPausePlayback];
    if (v33[36])
    {
      [(AVPlayerItem *)self timeToPausePlayback];
      [v11 setTimeToPausePlayback:v33];
    }
    if ([(AVPlayerItem *)self snapTimeToPausePlayback]) {
      [v11 setSnapTimeToPausePlayback:1];
    }
    if ([(AVPlayerItem *)self advanceTimeForOverlappedPlaybackWasSet])
    {
      [(AVPlayerItem *)self advanceTimeForOverlappedPlayback];
      [v11 setAdvanceTimeForOverlappedPlayback:v32];
    }
    if ([(AVPlayerItem *)self overlappedPlaybackEndTimeWasSet])
    {
      [(AVPlayerItem *)self overlappedPlaybackEndTime];
      [v11 setOverlappedPlaybackEndTime:v31];
    }
    if ([(AVPlayerItem *)self automaticallyPreservesTimeOffsetFromLive]) {
      [v11 setAutomaticallyPreservesTimeOffsetFromLive:1];
    }
    [(AVPlayerItem *)self configuredTimeOffsetFromLive];
    [v11 setConfiguredTimeOffsetFromLive:v30];
    if ([(AVPlayerItem *)self imageQueueInterpolationCurveWasSet]) {
      objc_msgSend(v11, "setImageQueueInterpolationCurve:", -[AVPlayerItem imageQueueInterpolationCurve](self, "imageQueueInterpolationCurve"));
    }
    if ([(AVPlayerItem *)self blendsVideoFramesWasSet]) {
      objc_msgSend(v11, "setBlendsVideoFrames:", -[AVPlayerItem blendsVideoFrames](self, "blendsVideoFrames"));
    }
    if ([(AVPlayerItem *)self appliesPerFrameHDRDisplayMetadataWasSet]) {
      objc_msgSend(v11, "setAppliesPerFrameHDRDisplayMetadata:", -[AVPlayerItem appliesPerFrameHDRDisplayMetadata](self, "appliesPerFrameHDRDisplayMetadata"));
    }
    if ([(AVPlayerItem *)self reversesMoreVideoFramesInMemoryWasSet]) {
      objc_msgSend(v11, "setReversesMoreVideoFramesInMemory:", -[AVPlayerItem reversesMoreVideoFramesInMemory](self, "reversesMoreVideoFramesInMemory"));
    }
    if ([(AVPlayerItem *)self aggressivelyCachesVideoFramesWasSet]) {
      objc_msgSend(v11, "setAggressivelyCachesVideoFrames:", -[AVPlayerItem aggressivelyCachesVideoFrames](self, "aggressivelyCachesVideoFrames"));
    }
    if ([(AVPlayerItem *)self decodesAllFramesDuringOrdinaryPlaybackWasSet])
    {
      objc_msgSend(v11, "setDecodesAllFramesDuringOrdinaryPlayback:", -[AVPlayerItem decodesAllFramesDuringOrdinaryPlayback](self, "decodesAllFramesDuringOrdinaryPlayback"));
    }
    objc_msgSend(v11, "setLoudnessInfo:", -[AVPlayerItem loudnessInfo](self, "loudnessInfo"));
    objc_msgSend(v11, "setAVKitData:", -[AVPlayerItem AVKitData](self, "AVKitData"));
    objc_msgSend(v11, "setServiceIdentifier:", -[AVPlayerItem serviceIdentifier](self, "serviceIdentifier"));
    [(AVPlayerItem *)self soundCheckVolumeNormalization];
    objc_msgSend(v11, "setSoundCheckVolumeNormalization:");
    [(AVPlayerItem *)self volumeAdjustment];
    objc_msgSend(v11, "setVolumeAdjustment:");
    objc_msgSend(v11, "setMediaKind:", -[AVPlayerItem mediaKind](self, "mediaKind"));
    objc_msgSend(v11, "setRestrictions:", -[AVPlayerItem restrictions](self, "restrictions"));
    objc_msgSend(v11, "setAutomaticallyHandlesInterstitialEvents:", -[AVPlayerItem automaticallyHandlesInterstitialEvents](self, "automaticallyHandlesInterstitialEvents"));
    if ([(AVPlayerItem *)self adjustTargetLevelWasSet])
    {
      [(AVPlayerItem *)self adjustTargetLevel];
      objc_msgSend(v11, "setAdjustTargetLevel:");
    }
    if ([(AVPlayerItem *)self adjustCompressionProfileWasSet]) {
      objc_msgSend(v11, "setAdjustCompressionProfile:", -[AVPlayerItem adjustCompressionProfile](self, "adjustCompressionProfile"));
    }
    objc_msgSend(v11, "setPlayHapticTracks:", -[AVPlayerItem playHapticTracks](self, "playHapticTracks"));
    objc_msgSend(v11, "setHapticPlaybackLocality:", -[AVPlayerItem hapticPlaybackLocality](self, "hapticPlaybackLocality"));
    objc_msgSend(v11, "setContinuesPlayingDuringPrerollForRateChange:", -[AVPlayerItem continuesPlayingDuringPrerollForRateChange](self, "continuesPlayingDuringPrerollForRateChange"));
    objc_msgSend(v11, "setContinuesPlayingDuringPrerollForSeek:", -[AVPlayerItem continuesPlayingDuringPrerollForSeek](self, "continuesPlayingDuringPrerollForSeek"));
    if ([(AVPlayerItem *)self usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet])
    {
      objc_msgSend(v11, "setUsesIFrameOnlyPlaybackForHighRateScaledEdits:", -[AVPlayerItem usesIFrameOnlyPlaybackForHighRateScaledEdits](self, "usesIFrameOnlyPlaybackForHighRateScaledEdits"));
    }
    if ([(AVPlayerItem *)self minimumIntervalForIFrameOnlyPlaybackWasSet])
    {
      [(AVPlayerItem *)self minimumIntervalForIFrameOnlyPlayback];
      [v11 setMinimumIntervalForIFrameOnlyPlayback:v29];
    }
    if ([(AVPlayerItem *)self speedThresholdForIFrameOnlyPlaybackWasSet])
    {
      [(AVPlayerItem *)self speedThresholdForIFrameOnlyPlayback];
      objc_msgSend(v11, "setSpeedThresholdForIFrameOnlyPlayback:");
    }
    if ([(AVPlayerItem *)self refreshesClosedCaptionsImmediatelyAfterSeeking])
    {
      objc_msgSend(v11, "setRefreshesClosedCaptionsImmediatelyAfterSeeking:", -[AVPlayerItem refreshesClosedCaptionsImmediatelyAfterSeeking](self, "refreshesClosedCaptionsImmediatelyAfterSeeking"));
    }
    if ([(AVPlayerItem *)self audioSpatializationAllowedWasSet]) {
      objc_msgSend(v11, "setAudioSpatializationAllowed:", -[AVPlayerItem isAudioSpatializationAllowed](self, "isAudioSpatializationAllowed"));
    }
    if ([(AVPlayerItem *)self allowedAudioSpatializationFormatsWasSet]) {
      objc_msgSend(v11, "setAllowedAudioSpatializationFormats:", -[AVPlayerItem allowedAudioSpatializationFormats](self, "allowedAudioSpatializationFormats"));
    }
    if ([(AVPlayerItem *)self variantPreferences]) {
      objc_msgSend(v11, "setVariantPreferences:", -[AVPlayerItem variantPreferences](self, "variantPreferences"));
    }
    [(AVPlayerItem *)self preferredMaximumAudioSampleRate];
    objc_msgSend(v11, "setPreferredMaximumAudioSampleRate:");
    objc_msgSend(v11, "setPrefersOfflinePlayableVariants:", -[AVPlayerItem prefersOfflinePlayableVariants](self, "prefersOfflinePlayableVariants"));
    objc_msgSend(v11, "setAutoSwitchAtmosStreamVariants:", -[AVPlayerItem autoSwitchAtmosStreamVariants](self, "autoSwitchAtmosStreamVariants"));
    if ([(AVAsset *)self->_playerItem->asset statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:0] == 2)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v12 = [(AVAsset *)self->_playerItem->asset availableMediaCharacteristicsWithMediaSelectionOptions];
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = [(AVAsset *)self->_playerItem->asset mediaSelectionGroupForMediaCharacteristic:*(void *)(*((void *)&v25 + 1) + 8 * i)];
            if (v16)
            {
              uint64_t v17 = [(AVPlayerItem *)self currentMediaSelection];
              if (!-[AVMediaSelection mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:](v17, "mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:", v16))objc_msgSend(v11, "selectMediaOption:inMediaSelectionGroup:", -[AVMediaSelection selectedMediaOptionInMediaSelectionGroup:](v17, "selectedMediaOptionInMediaSelectionGroup:", v16), v16); {
            }
              }
          }
          uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
        }
        while (v13);
      }
    }
    else
    {
      objc_msgSend(v11, "setNonForcedSubtitleDisplayEnabled:", -[AVPlayerItem isNonForcedSubtitleDisplayEnabled](self, "isNonForcedSubtitleDisplayEnabled"));
    }
    objc_msgSend(v11, "setVideoEnhancementMode:", -[AVPlayerItem videoEnhancementMode](self, "videoEnhancementMode"));
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__AVPlayerItem_copyWithZone_newAssetOptions___block_invoke;
    v20[3] = &unk_1E57B2110;
    v20[4] = self;
    v20[5] = &v21;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, v20);
    if (*((_DWORD *)v22 + 6) != -1) {
      objc_msgSend(v11, "setStartsOnFirstEligibleVariant:", -[AVPlayerItem startsOnFirstEligibleVariant](self, "startsOnFirstEligibleVariant"));
    }
    _Block_object_dispose(&v21, 8);
  }
  return v11;
}

- (BOOL)isNonForcedSubtitleDisplayEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_isNonForcedSubtitleDisplayEnabled__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)prefersOfflinePlayableVariants
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_prefersOfflinePlayableVariants__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)serviceIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__serviceIdentifier__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)playHapticTracks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_AVPlayerItemHaptics__playHapticTracks__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)hapticPlaybackLocality
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayerItem_AVPlayerItemHaptics__hapticPlaybackLocality__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)volumeAdjustment
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1065353216;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayerItem_volumeAdjustment__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVVariantPreferences)variantPreferences
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_variantPreferences__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVVariantPreferences v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEditsWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)textStyleRules
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_textStyleRules__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)textHighlightArray
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_textHighlightArray__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)suppressesAudioOnlyVariants
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem_suppressesAudioOnlyVariants__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)speedThresholdForIFrameOnlyPlaybackWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayerItem_speedThresholdForIFrameOnlyPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)soundCheckVolumeNormalization
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_soundCheckVolumeNormalization__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)reversesMoreVideoFramesInMemoryWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_reversesMoreVideoFramesInMemoryWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CMTime)reversePlaybackEndTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVPlayerItem_reversePlaybackEndTime__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (unint64_t)restrictions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayerItem_restrictions__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)requiresAccessLog
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_requiresAccessLog__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)refreshesClosedCaptionsImmediatelyAfterSeeking
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItem_refreshesClosedCaptionsImmediatelyAfterSeeking__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)preferredMaximumAudioSampleRate
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem_preferredMaximumAudioSampleRate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)minimumIntervalForIFrameOnlyPlaybackWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_minimumIntervalForIFrameOnlyPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)mediaKind
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__AVPlayerItem_mediaKind__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)loudnessInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayerItem_loudnessInfo__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)imageQueueInterpolationCurveWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItem_imageQueueInterpolationCurveWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CMTime)forwardPlaybackEndTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVPlayerItem_forwardPlaybackEndTime__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)decodesAllFramesDuringOrdinaryPlaybackWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_decodesAllFramesDuringOrdinaryPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)continuesPlayingDuringPrerollForSeek
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVPlayerItem_continuesPlayingDuringPrerollForSeek__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)continuesPlayingDuringPrerollForRateChange
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_continuesPlayingDuringPrerollForRateChange__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CMTime)configuredTimeOffsetFromLive
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVPlayerItem_configuredTimeOffsetFromLive__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)blendsVideoFramesWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_blendsVideoFramesWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)automaticallyPreservesTimeOffsetFromLive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_automaticallyPreservesTimeOffsetFromLive__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)audioSpatializationAllowedWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_audioSpatializationAllowedWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)appliesPerFrameHDRDisplayMetadataWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_appliesPerFrameHDRDisplayMetadataWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowedAudioSpatializationFormatsWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_allowedAudioSpatializationFormatsWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)aggressivelyCachesVideoFramesWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_aggressivelyCachesVideoFramesWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)advanceTimeForOverlappedPlaybackWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItem_advanceTimeForOverlappedPlaybackWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)adjustTargetLevelWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_adjustTargetLevelWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)adjustCompressionProfileWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_adjustCompressionProfileWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)videoEnhancementMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_AVPlayerItemVideoEnhancement__videoEnhancementMode__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)automaticallyHandlesInterstitialEvents
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__AVPlayerItem_AVPlayerInterstitialSupport__automaticallyHandlesInterstitialEvents__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setAsset:(id)a3
{
  if (self->_playerItem->asset != a3)
  {
    [(AVPlayerItem *)self _removeFAListeners];
    id v5 = a3;

    self->_playerItem->asset = (AVAsset *)a3;
    [(AVPlayerItem *)self _addFAListeners];
    if (![(AVPlayerItem *)self _isReadyForInspectionOfDuration]
      && [a3 statusOfValueForKey:@"duration" error:0] == 2)
    {
      [(AVPlayerItem *)self _markAsReadyForInspectionOfDuration];
      long long v13 = 0uLL;
      uint64_t v14 = 0;
      [(AVPlayerItem *)self _duration];
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__AVPlayerItem__setAsset___block_invoke;
      block[3] = &unk_1E57B3FC0;
      block[4] = self;
      long long v11 = v13;
      uint64_t v12 = v14;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    }
    if ([a3 statusOfValueForKey:@"tracks" error:0] == 2
      && ([a3 _isStreaming] & 1) == 0)
    {
      [(AVPlayerItem *)self _markAsReadyForInspectionOfTracks];
      id v7 = [(AVPlayerItem *)self _tracks];
      uint64_t v8 = self->_playerItem->ivarAccessQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __26__AVPlayerItem__setAsset___block_invoke_2;
      v9[3] = &unk_1E57B2098;
      v9[4] = self;
      v9[5] = v7;
      av_readwrite_dispatch_queue_write(v8, v9);
    }
    if ([a3 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:0] == 2)
    {
      [(AVPlayerItem *)self _markFigAssetAsReadyForInspectionOfMediaSelectionOptions];
      [(AVPlayerItem *)self _informObserversAboutAvailabilityOfCurrentMediaSelection];
    }
  }
}

- (BOOL)_isReadyForInspectionOfDuration
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem__isReadyForInspectionOfDuration__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_markAsReadyForInspectionOfDuration
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVPlayerItem__markAsReadyForInspectionOfDuration__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_removeFAListeners
{
  char v3 = [(AVAsset *)self->_playerItem->asset _figAsset];
  if (v3)
  {
    double v4 = v3;
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayerItem *)self _weakReference];
    [v5 removeListenerWithWeakReference:v6 callback:avplayeritem_figassetNotificationCallback name:*MEMORY[0x1E4F31ED8] object:v4];
    CFRelease(v6);
    CFRelease(v4);
  }
}

- (void)_addFAListeners
{
  char v3 = [(AVAsset *)self->_playerItem->asset _figAsset];
  if (v3)
  {
    double v4 = v3;
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayerItem *)self _weakReference];
    CFRetain(v6);
    CFRetain(v4);
    uint64_t v7 = *MEMORY[0x1E4F31ED8];
    [v5 addListenerWithWeakReference:v6 callback:avplayeritem_figassetNotificationCallback name:v7 object:v4 flags:0];
  }
}

- (id)_weakReference
{
  return self->_playerItem->weakReference;
}

- (void)setServiceIdentifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVPlayerItem_AVPlayerItemServiceIdentifier_Private__setServiceIdentifier___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = v4;
  void block[5] = self;
  void block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  id v6 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v6)
  {
    if (*((unsigned char *)v9 + 24)) {
      [(AVPlayerItem *)self _quietlySetServiceIdentifier];
    }
    CFRelease(v6);
  }
  _Block_object_dispose(&v8, 8);
}

- (void)setPlayHapticTracks:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  id v6 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v6)
  {
    uint64_t v7 = v6;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke_2;
    v9[3] = &__block_descriptor_41_e5_v8__0l;
    v9[4] = v7;
    BOOL v10 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    CFRelease(v7);
  }
}

- (void)setHapticPlaybackLocality:(id)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (a3
    && ([a3 isEqualToString:@"Default"] & 1) == 0
    && ([a3 isEqualToString:@"FullGamut"] & 1) == 0
    && ([a3 isEqualToString:@"DefaultWithFullStrength"] & 1) == 0)
  {
    long long v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Haptic playback locality is not valid: %@", v6, v7, v8, v9, v10, (uint64_t)a3), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = &v16;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v17[3])
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke_2;
    v14[3] = &unk_1E57B2110;
    v14[4] = self;
    v14[5] = &v16;
    dispatch_sync(figPlaybackItemSetterQueue, v14);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)setAVKitData:(id)a3
{
  if (a3)
  {
    if ([a3 conformsToProtocol:&unk_1EE5E2580])
    {
      if ([a3 conformsToProtocol:&unk_1EE5E4C90]) {
        goto LABEL_4;
      }
      BOOL v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      uint64_t v14 = "newAVKitData == nil || [newAVKitData conformsToProtocol:@protocol(NSCopying)]";
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      uint64_t v14 = "newAVKitData == nil || [newAVKitData conformsToProtocol:@protocol(NSObject)]";
    }
    uint64_t v15 = (void *)[v12 exceptionWithName:v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)v14), 0 reason userInfo];
    objc_exception_throw(v15);
  }
LABEL_4:
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVPlayerItem_AVPlayerItemAVKit__setAVKitData___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (NSObject)AVKitData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_AVPlayerItemAVKit__AVKitData__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAutomaticallyHandlesInterstitialEvents:(BOOL)automaticallyHandlesInterstitialEvents
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__AVPlayerItem_AVPlayerInterstitialSupport__setAutomaticallyHandlesInterstitialEvents___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = automaticallyHandlesInterstitialEvents;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (unsigned)snapTimeToPausePlayback
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeRef cf = (CFTypeRef)*MEMORY[0x1E4F1CFC8];
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
    if (v9 && !v9(FigBaseObject, *MEMORY[0x1E4F33B70], *MEMORY[0x1E4F1CF80], &cf))
    {
      unsigned __int8 v10 = FigCFEqual();
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
    CFRelease(v4);
    return v10;
  }
  else
  {
    return [(AVPlayerItem *)self _snapTimeToPausePlayback];
  }
}

- (void)setVolumeAdjustment:(float)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem_setVolumeAdjustment___block_invoke;
  block[3] = &unk_1E57B4150;
  float v6 = a3;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(AVPlayerItem *)self _updateVolumeAdjustmentOnFigPlaybackItem];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)setTextStyleRules:(NSArray *)textStyleRules
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVPlayerItem_setTextStyleRules___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = textStyleRules;
  void block[5] = self;
  void block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    [(AVPlayerItem *)self _updateTextStyleRulesOnFigPlaybackItem];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)setTextHighlightArray:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVPlayerItem_setTextHighlightArray___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    [(AVPlayerItem *)self _updateTextHighlightArrayOnFigPlaybackItem];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)setSuppressesAudioOnlyVariants:(BOOL)a3
{
  BOOL v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    v8[4] = v5;
    BOOL v9 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

- (void)setSoundCheckVolumeNormalization:(float)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItem_setSoundCheckVolumeNormalization___block_invoke;
  block[3] = &unk_1E57B4150;
  float v6 = a3;
  block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(AVPlayerItem *)self _updateSoundCheckVolumeNormalizationOnFigPlaybackItem];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)setReversePlaybackEndTime:(CMTime *)reversePlaybackEndTime
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem_setReversePlaybackEndTime___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  v5[4] = self;
  CMTime v6 = *reversePlaybackEndTime;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateReversePlaybackEndTimeOnFigPlaybackItem];
}

- (void)setRestrictions:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AVPlayerItem_setRestrictions___block_invoke;
  block[3] = &unk_1E57B3A60;
  void block[5] = &v6;
  void block[6] = a3;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    [(AVPlayerItem *)self _updateRestrictionsOnFigPlaybackItem];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)setPreferredMaximumAudioSampleRate:(double)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_setPreferredMaximumAudioSampleRate___block_invoke;
  v5[3] = &unk_1E57B2228;
  v5[4] = self;
  *(double *)&void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updatePreferredMaximumAudioSampleRateOnFigPlaybackItem];
}

- (void)setMediaKind:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AVPlayerItem_setMediaKind___block_invoke;
  v5[3] = &unk_1E57B2098;
  v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateMediaKindOnFigPlaybackItem];
}

- (void)setLoudnessInfo:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayerItem_setLoudnessInfo___block_invoke;
  v5[3] = &unk_1E57B2098;
  v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateLoudnessInfoOnFigPlaybackItem];
}

- (void)setForwardPlaybackEndTime:(CMTime *)forwardPlaybackEndTime
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem_setForwardPlaybackEndTime___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  v5[4] = self;
  CMTime v6 = *forwardPlaybackEndTime;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateForwardPlaybackEndTimeOnFigPlaybackItem];
}

- (void)setContinuesPlayingDuringPrerollForSeek:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_setContinuesPlayingDuringPrerollForSeek___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem];
}

- (void)setContinuesPlayingDuringPrerollForRateChange:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItem_setContinuesPlayingDuringPrerollForRateChange___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem];
}

- (void)setConfiguredTimeOffsetFromLive:(CMTime *)configuredTimeOffsetFromLive
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setConfiguredTimeOffsetFromLive___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  v5[4] = self;
  CMTime v6 = *configuredTimeOffsetFromLive;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem];
}

- (void)setAutoSwitchAtmosStreamVariants:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setAutoSwitchAtmosStreamVariants___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem];
}

- (BOOL)autoSwitchAtmosStreamVariants
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_autoSwitchAtmosStreamVariants__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateReversePlaybackEndTimeOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__AVPlayerItem__updateReversePlaybackEndTimeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updatePreferredMaximumAudioSampleRateOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__AVPlayerItem__updatePreferredMaximumAudioSampleRateOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateForwardPlaybackEndTimeOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__AVPlayerItem__updateForwardPlaybackEndTimeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__AVPlayerItem__updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__AVPlayerItem__updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (unsigned)_snapTimeToPausePlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem__snapTimeToPausePlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setVideoEnhancementMode:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  while (([(__CFString *)sValidVideoEnhancementModes[v5] isEqualToString:a3] & 1) == 0)
  {
    if (++v5 == 4) {
      goto LABEL_7;
    }
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AVPlayerItem_AVPlayerItemVideoEnhancement__setVideoEnhancementMode___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(AVPlayerItem *)self _updateVideoEnhancementModeOnFigPlaybackItem];
  }
LABEL_7:
  _Block_object_dispose(&v8, 8);
}

uint64_t __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"duration"];
  v5[0] = MEMORY[0x1E4F143A8];
  long long v2 = *(_OWORD *)(a1 + 32);
  unsigned __int8 v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_3;
  v5[3] = &unk_1E57B2160;
  long long v6 = v2;
  av_readwrite_dispatch_queue_write(v3, v5);
  return [*(id *)(a1 + 32) didChangeValueForKey:@"duration"];
}

uint64_t __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"presentationSize"];
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned __int8 v3 = *(NSObject **)(*(void *)(v2 + 8) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_3;
  block[3] = &unk_1E57B36D0;
  block[4] = v2;
  long long v7 = *(_OWORD *)(a1 + 40);
  av_readwrite_dispatch_queue_write(v3, block);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_player"), "_noteNewPresentationSizeForPlayerItem:", *(void *)(a1 + 32));
  [*(id *)(a1 + 32) didChangeValueForKey:@"presentationSize"];
  uint64_t v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemPresentationSizeDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v4);
}

- (void)_informObserversAboutAvailabilityOfCurrentMediaSelection
{
  if ([(AVPlayerItem *)self _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection])
  {
    unsigned __int8 v3 = [(AVPlayerItem *)self currentMediaSelection];
    [(AVPlayerItem *)self _setCurrentMediaSelection:v3];
  }
}

- (BOOL)_isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_informObserversAboutAvailabilityOfTracks:(id)a3
{
  if (!BYTE2(self->_playerItem->timedMetadata))
  {
    [(AVPlayerItem *)self willChangeValueForKey:@"tracks"];
    if (!a3) {
      a3 = [(AVPlayerItem *)self _tracks];
    }
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__AVPlayerItem__informObserversAboutAvailabilityOfTracks___block_invoke;
    v7[3] = &unk_1E57B2098;
    v7[4] = self;
    v7[5] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v7);
    [(AVPlayerItem *)self didChangeValueForKey:@"tracks"];
    uint64_t v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemTracksDidChangeNotification" object:self userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v6);
    BYTE2(self->_playerItem->timedMetadata) = 1;
  }
}

- (id)_tracksFromAssetTrackIDs
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem__tracksFromAssetTrackIDs__block_invoke;
  v5[3] = &unk_1E57B2160;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_informObserversAboutAvailabilityOfDuration:(id *)a3
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3810000000;
  v10[3] = &unk_194C75EBF;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  CMTime time1 = *(CMTime *)a3;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (CMTimeCompare(&time1, &time2))
  {
    [(AVPlayerItem *)self willChangeValueForKey:@"duration"];
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_4;
    v6[3] = &unk_1E57B2160;
    v6[4] = self;
    v6[5] = v10;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
    [(AVPlayerItem *)self didChangeValueForKey:@"duration"];
  }
  else
  {
    figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke;
    block[3] = &unk_1E57B2110;
    block[4] = self;
    void block[5] = v10;
    dispatch_async(figPlaybackItemAccessorQueue, block);
  }
  _Block_object_dispose(v10, 8);
}

- (void)_updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:(id)a3 updateStatusToReadyToPlay:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v7 = (void *)[a3 objectForKey:*MEMORY[0x1E4F33728]];
  if (v7) {
    char v8 = [v7 BOOLValue];
  }
  else {
    char v8 = [(AVPlayerItem *)self _canPlayFastForward];
  }
  char v30 = v8;
  char v9 = (void *)[a3 objectForKey:*MEMORY[0x1E4F33738]];
  if (v9) {
    char v10 = [v9 BOOLValue];
  }
  else {
    char v10 = [(AVPlayerItem *)self _canPlayReverse];
  }
  char v11 = v10;
  BOOL v12 = (void *)[a3 objectForKey:*MEMORY[0x1E4F33730]];
  if (v12) {
    char v13 = [v12 BOOLValue];
  }
  else {
    char v13 = [(AVPlayerItem *)self _canPlayFastReverse];
  }
  char v14 = v13;
  uint64_t v15 = (void *)[a3 objectForKey:*MEMORY[0x1E4F33788]];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = [v15 BOOLValue];
    char v18 = [v16 BOOLValue];
  }
  else
  {
    char v17 = [(AVPlayerItem *)self _canStepForward];
    char v18 = [(AVPlayerItem *)self _canStepBackward];
  }
  char v19 = v18;
  if (v4) {
    uint64_t v20 = (void *)[&unk_1EE5E19E0 arrayByAddingObjectsFromArray:&unk_1EE5E19C8];
  }
  else {
    uint64_t v20 = &unk_1EE5E19C8;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v43;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AVPlayerItem *)self willChangeValueForKey:*(void *)(*((void *)&v42 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v22);
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__AVPlayerItem__updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload_updateStatusToReadyToPlay___block_invoke;
  block[3] = &unk_1E57B41A0;
  BOOL v36 = v4;
  block[4] = self;
  char v37 = v30;
  char v38 = v11;
  char v39 = v14;
  char v40 = v17;
  char v41 = v19;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v26 = [v20 countByEnumeratingWithState:&v31 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v32;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v20);
        }
        [(AVPlayerItem *)self didChangeValueForKey:*(void *)(*((void *)&v31 + 1) + 8 * v29++)];
      }
      while (v27 != v29);
      uint64_t v27 = [v20 countByEnumeratingWithState:&v31 objects:v46 count:16];
    }
    while (v27);
  }
}

void *__59__AVPlayerItem__updateItemIdentifierForCoordinatedPlayback__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  CGSize result = (void *)[*(id *)(a1 + 32) _playbackCoordinator];
  if (result)
  {
    id v3 = result;
    BOOL v4 = (void *)[result interstitialTimeRangesForPlayerItem:*(void *)(a1 + 32)];
    if (v4)
    {
      uint64_t v5 = v4;
      if ([v4 count])
      {
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v31;
          CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v31 != v9) {
                objc_enumerationMutation(v5);
              }
              BOOL v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (v12) {
                [v12 CMTimeRangeValue];
              }
              else {
                memset(&range, 0, sizeof(range));
              }
              CFDictionaryRef v13 = CMTimeRangeCopyAsDictionary(&range, v10);
              if (v13)
              {
                CFDictionaryRef v14 = v13;
                [v6 addObject:v13];
                CFRelease(v14);
              }
            }
            uint64_t v8 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v8);
        }
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v16) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        char v18 = *(void (**)(uint64_t, void, void *))(v17 + 56);
        if (v18) {
          v18(FigBaseObject, *MEMORY[0x1E4F33A18], v6);
        }
      }
    }
    uint64_t v19 = [v3 identifierForPlayerItem:*(void *)(a1 + 32)];
    if (dword_1EB2D3A00)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CGSize result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_player", v27, v28), "_isInterstitialPlayer");
    if (!result || v19)
    {
      uint64_t v21 = FigPlaybackItemGetFigBaseObject();
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v24 = *(void *)(VTable + 8);
      CGSize result = (void *)(VTable + 8);
      uint64_t v23 = v24;
      if (v24) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = *(uint64_t (**)(uint64_t, void, uint64_t))(v25 + 56);
      if (v26) {
        return (void *)v26(v21, *MEMORY[0x1E4F33968], v19);
      }
    }
  }
  return result;
}

- (id)_playbackCoordinator
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  CFAllocatorRef v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem__playbackCoordinator__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem__attachToFigPlayer__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) processWaitingMetricEventTimelineCompletionHandlers];
}

uint64_t __58__AVPlayerItem__informObserversAboutAvailabilityOfTracks___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 144) = result;
  return result;
}

__n128 __44__AVPlayerItem_maximumForwardBufferDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 548);
  v1[3].n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 564);
  v1[2] = result;
  return result;
}

uint64_t __42__AVPlayerItem__setSuppressesVideoLayers___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 200) != v2)
  {
    *(unsigned char *)(v1 + 200) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __53__AVPlayerItem_AVPlayerItemOutputs___addVideoOutput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 168) addObject:*(void *)(a1 + 40)];
}

uint64_t __29__AVPlayerItem__cachedTracks__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setNonForcedSubtitleDisplayEnabled:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_setNonForcedSubtitleDisplayEnabled___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem];
  objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:", self);
}

- (void)_updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    BOOL v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__AVPlayerItem__updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (id)tracksPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"tracks" notificationName:@"AVPlayerItemTracksDidChangeNotification"];
}

- (id)presentationSizePublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"presentationSize" notificationName:@"AVPlayerItemPresentationSizeDidChangeNotification"];
}

- (id)nonForcedSubtitleDisplayEnabledPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"isNonForcedSubtitleDisplayEnabled" notificationName:@"AVPlayerItemNonForcedSubtitleDisplayEnabledDidChangeNotification"];
}

uint64_t __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 640) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) addMediaDataCollector:*(void *)(a1 + 40) locked:1];
}

void __31__AVPlayerItem__updateTimebase__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(const void **)(v2 + 216);
  if (v3)
  {
    CFRelease(v3);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v2 + 216) = *(void *)(a1 + 40);
}

uint64_t __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 1440) = *(void *)(result + 40);
  return result;
}

uint64_t __32__AVPlayerItem_setLoudnessInfo___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(result + 32) + 8) + 688);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 688) = result;
  }
  return result;
}

uint64_t __29__AVPlayerItem_setMediaKind___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(result + 32) + 8) + 736);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 736) = result;
  }
  return result;
}

uint64_t __28__AVPlayerItem_setAudioMix___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 264);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 32) copy];
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 264) = result;
  }
  return result;
}

CFTypeRef __85__AVPlayerItem__getVideoComposition_customVideoCompositorSession_figVideoCompositor___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = *(id *)(*(void *)(a1[4] + 8) + 1296);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(id *)(*(void *)(a1[4] + 8) + 1312);
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1[4] + 8) + 1320);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

void __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _duration];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v2 + 32) = v7;
  *(void *)(v2 + 48) = v8;
  block[0] = MEMORY[0x1E4F143A8];
  long long v3 = *(_OWORD *)(a1 + 32);
  BOOL v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 128);
  block[1] = 3221225472;
  block[2] = __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_2;
  block[3] = &unk_1E57B2160;
  long long v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_2(uint64_t result)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v1 + 1160))
  {
    uint64_t v2 = result;
    *(_OWORD *)&v11.value = *(_OWORD *)(v1 + 1164);
    v11.epoch = *(void *)(v1 + 1180);
    CMTime v13 = *(CMTime *)(v1 + 1196);
    *(_OWORD *)&v12.value = *(_OWORD *)(v1 + 1220);
    v12.epoch = *(void *)(v1 + 1236);
    uint64_t v3 = *(unsigned int *)(v1 + 1192);
    v14[0] = *MEMORY[0x1E4F33D10];
    v15[0] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v3];
    v14[1] = *MEMORY[0x1E4F33CF8];
    v15[1] = NSDictionaryFromCMTime(&v13);
    v14[2] = *MEMORY[0x1E4F33CF0];
    CMTime v13 = v12;
    v15[2] = NSDictionaryFromCMTime(&v13);
    v14[3] = *MEMORY[0x1E4F33CE8];
    v15[3] = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 32) + 8) + 1188)];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 120);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    CFTypeRef result = VTable + 16;
    uint64_t v7 = v8;
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    CFAllocatorRef v10 = *(uint64_t (**)(uint64_t, CMTime *, uint64_t))(v9 + 176);
    if (v10)
    {
      CMTime v13 = v11;
      return v10(v5, &v13, v4);
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_duration
{
  if (sOKToBlockWhenGettingValuesOfProperties == 1) {
    uint64_t v5 = MEMORY[0x1E4F1FA48];
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1F9F0];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v5;
  retstr->var3 = *(void *)(v5 + 16);
  long long v6 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  uint64_t v7 = v6;
  if (sOKToBlockWhenGettingValuesOfProperties != 1)
  {
    if (![(AVPlayerItem *)self _isReadyForInspectionOfDuration])
    {
      CFTypeRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](self->_playerItem->asset, "loadValuesAsynchronouslyForKeys:completionHandler:", [MEMORY[0x1E4F1C978] arrayWithObject:@"duration"], &__block_literal_global_6);
      goto LABEL_32;
    }
    if (v7
      && ((v10 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0 ? (uint64_t v11 = 0) : (uint64_t v11 = v10),
          (uint64_t v15 = *(unsigned int (**)(OpaqueFigPlaybackItem *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v11 + 16)) != 0
       && !v15(v7, retstr)))
    {
      if ((~retstr->var2 & 5) != 0
        || !self
        || ([(AVPlayerItem *)self loopTimeRange], (v19 & 1) == 0)
        || ([(AVPlayerItem *)self loopTimeRange], (v18 & 1) == 0)
        || ([(AVPlayerItem *)self loopTimeRange], v17)
        || ([(AVPlayerItem *)self loopTimeRange], v16 < 0))
      {
LABEL_33:
        CFRelease(v7);
        return result;
      }
      CFTypeRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerItem->asset;
      if (!result)
      {
        long long v20 = 0uLL;
        int64_t v21 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      CFTypeRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerItem->asset;
      if (!result) {
        goto LABEL_32;
      }
    }
    CFTypeRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result duration];
LABEL_31:
    *(_OWORD *)&retstr->var0 = v20;
    retstr->var3 = v21;
LABEL_32:
    if (!v7) {
      return result;
    }
    goto LABEL_33;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    CMTime v13 = *(unsigned int (**)(OpaqueFigPlaybackItem *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v9 + 16);
    if (v13)
    {
      if (!v13(v7, retstr) && (~retstr->var2 & 5) == 0)
      {
        if (self)
        {
          [(AVPlayerItem *)self loopTimeRange];
          if (v25)
          {
            [(AVPlayerItem *)self loopTimeRange];
            if (v24)
            {
              [(AVPlayerItem *)self loopTimeRange];
              if (!v23)
              {
                [(AVPlayerItem *)self loopTimeRange];
                if ((v22 & 0x8000000000000000) == 0)
                {
                  asset = self->_playerItem->asset;
                  if (asset)
                  {
                    [(AVAsset *)asset duration];
                    *(_OWORD *)&retstr->var0 = v20;
                    retstr->var3 = v21;
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_33;
  }
  CFTypeRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerItem->asset;
  if (result)
  {
    CFTypeRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result duration];
    *(_OWORD *)&retstr->var0 = v20;
    retstr->var3 = v21;
  }
  return result;
}

- (void)_seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 seekID:(int)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  v88[5] = *MEMORY[0x1E4F143B8];
  id v19 = [(AVPlayerItem *)self delegate];
  memset(&v86, 0, sizeof(v86));
  if (self)
  {
    [(AVPlayerItem *)self loopTimeRange];
    char flags = v86.start.flags;
  }
  else
  {
    char flags = 0;
  }
  CMTime v85 = (CMTime)*a3;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  if ((flags & 1) != 0
    && (v86.duration.flags & 1) != 0
    && !v86.duration.epoch
    && (v86.duration.value & 0x8000000000000000) == 0
    && (a3->var2 & 0x1D) == 1)
  {
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    memset(&v79, 0, sizeof(v79));
    CMTimeRange time1 = v86;
    CMTimeRangeGetEnd(&v79, &time1);
    CMTime v85 = (CMTime)*a3;
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.CMTimeEpoch epoch = a3->var3;
    CMTime lhs = v86.start;
    if ((CMTimeCompare(&time1.start, &lhs) & 0x80000000) == 0)
    {
      CMTime time = (CMTime)*a3;
      CMTimeRange time1 = v86;
      CMTimeFoldIntoRange(&lhs, &time, &time1);
      CMTime v85 = lhs;
    }
    CMTime lhs = v79;
    CMTime time = v85;
    CMTimeSubtract(&time1.start, &lhs, &time);
    CMTime time2 = time1.start;
    CMTimeMake(&rhs, 1, 1000);
    CMTime lhs = time2;
    CMTimeSubtract(&time1.start, &lhs, &rhs);
    CMTime time2 = time1.start;
    CMTime lhs = (CMTime)*a5;
    CMTime time = time1.start;
    CMTimeMinimum(&time1.start, &lhs, &time);
    *(_OWORD *)&a5->var0 = *(_OWORD *)&time1.start.value;
    a5->int64_t var3 = time1.start.epoch;
  }
  if (v19
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v19 playerItem:self shouldSeekToTime:a3 toleranceBefore:a4 toleranceAfter:a5] & 1) == 0)
  {
    [(AVPlayerItem *)self _cancelPendingSeekAndRegisterSeekID:v8 withCompletionHandler:a7];
    [(AVPlayerItem *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:v8 finished:0];
    goto LABEL_44;
  }
  if (sRaiseExceptionWhenSeekingToANonNumericTime == 1 && (a3->var2 & 0x11) != 1)
  {
    CFAllocatorRef v52 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.CMTimeEpoch epoch = a3->var3;
    CFStringRef v53 = (id)CMTimeCopyDescription(v52, &time1.start);
    v59 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Seeking is not possible to time %@", v54, v55, v56, v57, v58, (uint64_t)v53), 0 reason userInfo];
    objc_exception_throw(v59);
  }
  if ((a4->var2 & 1) == 0)
  {
    char v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"toleranceBefore seekToTime must be valid", v14, v15, v16, v17, v18, v60);
    goto LABEL_51;
  }
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
  time1.start.CMTimeEpoch epoch = a4->var3;
  long long v61 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  time2.CMTimeEpoch epoch = v21;
  if (CMTimeCompare(&time1.start, &time2) < 0)
  {
    char v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"toleranceBefore seekToTime may not be negative", v22, v23, v24, v25, v26, v60);
    goto LABEL_51;
  }
  if ((a5->var2 & 1) == 0)
  {
    char v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"toleranceAfter seekToTime must be valid", v22, v23, v24, v25, v26, v60);
    goto LABEL_51;
  }
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a5->var0;
  time1.start.CMTimeEpoch epoch = a5->var3;
  *(_OWORD *)&time2.value = v61;
  time2.CMTimeEpoch epoch = v21;
  if (CMTimeCompare(&time1.start, &time2) < 0)
  {
    char v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"toleranceAfter seekToTime may not be negative", v27, v28, v29, v30, v31, v60);
LABEL_51:
    objc_exception_throw((id)[v50 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v51 userInfo:0]);
  }
  CMTime v74 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  CMTimeEpoch epoch = v74.epoch;
  long long v62 = *(_OWORD *)&v74.value;
  CMTime v73 = v74;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
  time1.start.CMTimeEpoch epoch = a3->var3;
  CMTime time2 = (CMTime)*a4;
  CMTime v79 = (CMTime)*a5;
  AVPlayerItemGetFigPlayerSnapTimesForTimeAndTolerances(&time1.start, &time2, &v79, &v74, &v73);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
  time1.start.CMTimeEpoch epoch = a4->var3;
  CMTime time2 = (CMTime)*a5;
  uint64_t FigPlayerSetTimeFlagsForTolerances = AVPlayerItemGetFigPlayerSetTimeFlagsForTolerances(&time1.start, &time2);
  seekQueue = self->_playerItem->seekQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVPlayerItem__seekToTime_toleranceBefore_toleranceAfter_seekID_completionHandler___block_invoke;
  block[3] = &unk_1E57B3FE8;
  void block[4] = self;
  void block[5] = &v81;
  long long v64 = *(_OWORD *)&v86.start.value;
  long long v65 = *(_OWORD *)&v86.start.epoch;
  int64_t var3 = a3->var3;
  long long v35 = *(_OWORD *)&a3->var0;
  long long v66 = *(_OWORD *)&v86.duration.timescale;
  long long v67 = v35;
  CMTime v69 = v85;
  int v70 = FigPlayerSetTimeFlagsForTolerances;
  CMTime v71 = v74;
  CMTime v72 = v73;
  dispatch_sync(seekQueue, block);
  if (v82[3])
  {
    v87[0] = *MEMORY[0x1E4F33D10];
    v88[0] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:FigPlayerSetTimeFlagsForTolerances];
    v87[1] = *MEMORY[0x1E4F33D00];
    v88[1] = [MEMORY[0x1E4F28ED0] numberWithInt:v8];
    v87[2] = *MEMORY[0x1E4F33CF8];
    time1.start = v74;
    v88[2] = NSDictionaryFromCMTime(&time1.start);
    v87[3] = *MEMORY[0x1E4F33CF0];
    time1.start = v73;
    CFDictionaryRef v36 = NSDictionaryFromCMTime(&time1.start);
    v87[4] = *MEMORY[0x1E4F33D08];
    v88[3] = v36;
    v88[4] = &unk_1EE5E1818;
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:5];
    [(AVPlayerItem *)self _cancelPendingSeekAndRegisterSeekID:v8 withCompletionHandler:a7];
    char v38 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyInterstitialCoordinatorIfCreated");
    CMTime time2 = (CMTime)*a3;
    if (v38)
    {
      uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v40 = v39 ? v39 : 0;
      char v41 = *(void (**)(const void *, CMTimeRange *, uint64_t))(v40 + 72);
      if (v41)
      {
        time1.start = time2;
        v41(v38, &time1, v8);
      }
    }
    uint64_t v42 = v82[3];
    CMTime time2 = (CMTime)*a3;
    uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v43) {
      uint64_t v44 = v43;
    }
    else {
      uint64_t v44 = 0;
    }
    long long v45 = *(unsigned int (**)(uint64_t, CMTimeRange *, uint64_t))(v44 + 176);
    if (v45 && (time1.start = time2, !v45(v42, &time1, v37)))
    {
      if (!v38) {
        goto LABEL_44;
      }
    }
    else
    {
      [(AVPlayerItem *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:v8 finished:0];
      if (!v38) {
        goto LABEL_44;
      }
      uint64_t v46 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v46) {
        uint64_t v47 = v46;
      }
      else {
        uint64_t v47 = 0;
      }
      uint64_t v48 = *(void (**)(const void *, CMTimeRange *, uint64_t))(v47 + 72);
      if (v48)
      {
        *(_OWORD *)&time1.start.value = v62;
        time1.start.CMTimeEpoch epoch = epoch;
        v48(v38, &time1, 0xFFFFFFFFLL);
      }
    }
    CFRelease(v38);
  }
  else if (a7)
  {
    (*((void (**)(id, uint64_t))a7 + 2))(a7, 1);
  }
LABEL_44:
  CMTime v49 = (const void *)v82[3];
  if (v49) {
    CFRelease(v49);
  }
  _Block_object_dispose(&v81, 8);
}

void __31__AVPlayerItem__updateTimebase__block_invoke_2(uint64_t a1)
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 loopTimeRange];
  }
  uint64_t v30 = 0;
  if (*(void *)(a1 + 40)
    && (BYTE12(v31) & 1) != 0
    && (BYTE4(v33) & 1) != 0
    && !*((void *)&v33 + 1)
    && (*((void *)&v32 + 1) & 0x8000000000000000) == 0)
  {
    *(_OWORD *)timebaseOut = v31;
    long long v28 = v32;
    long long v29 = v33;
    CMTimebaseCreateLoopingTimebase();
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"timebase"];
  block[0] = MEMORY[0x1E4F143A8];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  block[1] = 3221225472;
  block[2] = __31__AVPlayerItem__updateTimebase__block_invoke_3;
  block[3] = &unk_1E57B2228;
  long long v26 = v3;
  av_readwrite_dispatch_queue_write(v4, block);
  if (!*(void *)(a1 + 40))
  {
    timebaseOut[0] = 0;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    HostTimeClock = CMClockGetHostTimeClock();
    CMTimebaseCreateWithSourceClock(v8, HostTimeClock, timebaseOut);
    FigReadOnlyTimebaseSetTargetTimebase();
    FigReadOnlyTimebaseSetTargetTimebase();
    if (timebaseOut[0]) {
      CFRelease(timebaseOut[0]);
    }
    [*(id *)(a1 + 32) _removeFoldedTBListeners];
    uint64_t v10 = *(void *)(a1 + 32);
    long long v6 = *(NSObject **)(*(void *)(v10 + 8) + 16);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __31__AVPlayerItem__updateTimebase__block_invoke_6;
    uint64_t v17 = &unk_1E57B1E80;
    uint64_t v18 = v10;
    uint64_t v7 = &v14;
    goto LABEL_15;
  }
  FigReadOnlyTimebaseSetTargetTimebase();
  if ((BYTE12(v31) & 1) == 0
    || (BYTE4(v33) & 1) == 0
    || *((void *)&v33 + 1)
    || (*((void *)&v32 + 1) & 0x8000000000000000) != 0)
  {
    FigReadOnlyTimebaseSetTargetTimebase();
    [*(id *)(a1 + 32) _removeFoldedTBListeners];
    uint64_t v5 = *(void *)(a1 + 32);
    long long v6 = *(NSObject **)(*(void *)(v5 + 8) + 16);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    CMTimeEpoch v21 = __31__AVPlayerItem__updateTimebase__block_invoke_5;
    uint64_t v22 = &unk_1E57B1E80;
    uint64_t v23 = v5;
    uint64_t v7 = &v19;
LABEL_15:
    av_readwrite_dispatch_queue_write(v6, v7);
    goto LABEL_16;
  }
  [*(id *)(a1 + 32) _removeFoldedTBListeners];
  uint64_t v12 = *(void *)(a1 + 32);
  CMTime v13 = *(NSObject **)(*(void *)(v12 + 8) + 16);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __31__AVPlayerItem__updateTimebase__block_invoke_4;
  v24[3] = &unk_1E57B2228;
  v24[4] = v12;
  v24[5] = v30;
  av_readwrite_dispatch_queue_write(v13, v24);
  if (v30) {
    [*(id *)(a1 + 32) _addFoldedTBListeners];
  }
  FigReadOnlyTimebaseSetTargetTimebase();
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", @"timebase", v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
}

- ($1CE2C3FC342086196D07C2B4E8C70800)loopTimeRange
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x5010000000;
  CMTime v13 = &unk_194C75EBF;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v14 = *MEMORY[0x1E4F1FA20];
  long long v15 = v4;
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__AVPlayerItem_loopTimeRange__block_invoke;
  v9[3] = &unk_1E57B2110;
  v9[4] = self;
  void v9[5] = &v10;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v9);
  long long v6 = v11;
  long long v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->var0.int64_t var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

- (void)_removeFoldedTBListeners
{
  playerItem = self->_playerItem;
  if (playerItem)
  {
    if (playerItem->ivarAccessQueue)
    {
      long long v4 = [(AVPlayerItem *)self _copyFoldedTimebase];
      if (v4)
      {
        uint64_t v5 = v4;
        CFRelease(v4);
        id v6 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
        id v7 = [(AVPlayerItem *)self _weakReference];
        [v6 removeListenerWithWeakReference:v7 callback:cmTimebaseNotificationCallback_TimeJumped name:*MEMORY[0x1E4F1FA68] object:v5];
        CFRelease(v7);
        CFRelease(v5);
      }
    }
  }
}

- (OpaqueCMTimebase)_copyFoldedTimebase
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AVPlayerItem__copyFoldedTimebase__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  long long v3 = (OpaqueCMTimebase *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)delegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayerItem_delegate__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  long long v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (int)_createFigPlaybackItemForFigPlayer:(OpaqueFigPlayer *)a3 asset:(id)a4 URL:(id)a5 flags:(unsigned int)a6 options:(__CFDictionary *)a7 playbackItem:(OpaqueFigPlaybackItem *)a8
{
  uint64_t v10 = *(void *)&a6;
  if (![a4 _figAsset])
  {
    if (a5)
    {
      CFGetAllocator(a3);
      figAssetDefaultCreationFlags();
      int v17 = FigAssetRemoteCreateWithURL();
      if (!v17)
      {
        uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v18) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 0;
        }
        long long v26 = *(uint64_t (**)(OpaqueFigPlayer *, void, uint64_t, __CFDictionary *, OpaqueFigPlaybackItem **))(v19 + 96);
        if (v26) {
          return v26(a3, 0, v10, a7, a8);
        }
        else {
          return -12782;
        }
      }
    }
    else
    {
      uint64_t v22 = [a4 _copyFormatReader];
      if (v22)
      {
        uint64_t v23 = (const void *)v22;
        CFGetAllocator(a3);
        figAssetDefaultCreationFlags();
        int v17 = FigAssetRemoteCreateWithFormatReader();
        if (!v17)
        {
          uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v24) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          uint64_t v27 = *(uint64_t (**)(OpaqueFigPlayer *, void, uint64_t, __CFDictionary *, OpaqueFigPlaybackItem **))(v25 + 96);
          if (v27) {
            int v17 = v27(a3, 0, v10, a7, a8);
          }
          else {
            int v17 = -12782;
          }
        }
        CFRelease(v23);
      }
      else
      {
        return 0;
      }
    }
    return v17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [a4 _shouldOptimizeAccessForLinearMoviePlayback])
  {
    LODWORD(v10) = v10 | 0x40;
  }
  uint64_t v14 = [a4 _figAsset];
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(OpaqueFigPlayer *, uint64_t, void, __CFDictionary *, OpaqueFigPlaybackItem **))(v16 + 96);
  if (!v20) {
    return -12782;
  }
  return v20(a3, v14, v10 | 0x80, a7, a8);
}

- (void)_addFoldedTBListeners
{
  long long v3 = [(AVPlayerItem *)self _copyFoldedTimebase];
  if (v3)
  {
    long long v4 = v3;
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayerItem *)self _weakReference];
    CFRetain(v6);
    uint64_t v7 = *MEMORY[0x1E4F1FA68];
    [v5 addListenerWithWeakReference:v6 callback:cmTimebaseNotificationCallback_TimeJumped name:v7 object:v4 flags:0];
  }
}

- (id)_seekableTimeRangesFromFPSeekableTimeIntervals:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  obuint64_t j = a3;
  if (a3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      uint64_t v8 = *MEMORY[0x1E4F33CC8];
      uint64_t v9 = *MEMORY[0x1E4F33CC0];
      long long v17 = *MEMORY[0x1E4F1FA48];
      CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          *(_OWORD *)&v23.value = v17;
          v23.CMTimeEpoch epoch = v10;
          *(_OWORD *)&v22.value = v17;
          v22.CMTimeEpoch epoch = v10;
          CFDictionaryRef v13 = (const __CFDictionary *)[v12 objectForKey:v8];
          CFDictionaryRef v14 = (const __CFDictionary *)[v12 objectForKey:v9];
          if (v13) {
            CMTimeMakeFromDictionary(&v23, v13);
          }
          if (v14)
          {
            CMTimeMakeFromDictionary(&lhs, v14);
            rhs.CMTimeRange start = v23;
            CMTimeSubtract(&v22, &lhs, &rhs.start);
          }
          memset(&rhs, 0, sizeof(rhs));
          start.CMTimeRange start = v23;
          CMTime duration = v22;
          CMTimeRangeMake(&rhs, &start.start, &duration);
          CMTimeRange start = rhs;
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeRange:", &start));
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (id)_loadedTimeRangesFromFPPlaybableTimeIntervals:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  obuint64_t j = a3;
  if (a3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      uint64_t v8 = *MEMORY[0x1E4F33850];
      uint64_t v9 = *MEMORY[0x1E4F33848];
      long long v17 = *MEMORY[0x1E4F1FA48];
      CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          *(_OWORD *)&v23.value = v17;
          v23.CMTimeEpoch epoch = v10;
          *(_OWORD *)&v22.value = v17;
          v22.CMTimeEpoch epoch = v10;
          CFDictionaryRef v13 = (const __CFDictionary *)[v12 objectForKey:v8];
          CFDictionaryRef v14 = (const __CFDictionary *)[v12 objectForKey:v9];
          if (v13) {
            CMTimeMakeFromDictionary(&v23, v13);
          }
          if (v14)
          {
            CMTimeMakeFromDictionary(&lhs, v14);
            rhs.CMTimeRange start = v23;
            CMTimeSubtract(&v22, &lhs, &rhs.start);
          }
          memset(&rhs, 0, sizeof(rhs));
          start.CMTimeRange start = v23;
          CMTime duration = v22;
          CMTimeRangeMake(&rhs, &start.start, &duration);
          CMTimeRange start = rhs;
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeRange:", &start));
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

uint64_t __72__AVPlayerItem__timeJumpedNotificationIncludesExtendedDiagnosticPayload__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1144);
  return result;
}

uint64_t __67__AVPlayerItem_AVPlayerItemOutputs___renderedLegibleOutputsForKeys__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 192) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __59__AVPlayerItem_AVPlayerItemOutputs___legibleOutputsForKeys__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __50__AVPlayerItem_AVPlayerItemOutputs___videoOutputs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 168) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __47__AVPlayerItem_AVPlayerItemOutputs__addOutput___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 160) containsObject:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && !*(unsigned char *)(a1 + 56))
  {
    id v2 = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 160) arrayByAddingObject:*(void *)(a1 + 40)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 160) = v2;
  }
}

- (void)_updateTaggedMetadataArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v4 = [(AVPlayerItem *)self mediaDataCollectors];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (needsTaggedRanges()) {
          [v9 _updateTaggedRangeMetadataArray:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addOutput:(AVPlayerItemOutput *)output
{
  AVTelemetryGenerateID();
  BOOL v6 = [(AVPlayerItemOutput *)output _attachToPlayerItem:self];
  uint64_t v22 = 0;
  CMTime v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot attach AVPlayerItemSampleBufferOutput to AVPlayerItem", v7, v8, v9, v10, v11, v20[0]);
    goto LABEL_16;
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = (uint64_t)__47__AVPlayerItem_AVPlayerItemOutputs__addOutput___block_invoke;
  v20[3] = (uint64_t)&unk_1E57B3C08;
  v20[5] = (uint64_t)output;
  void v20[6] = (uint64_t)&v22;
  v20[4] = (uint64_t)self;
  BOOL v21 = !v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v20);
  if (*((unsigned char *)v23 + 24)) {
    goto LABEL_13;
  }
  if (!v6)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot attach an output that is already attached or nil output", v13, v14, v15, v16, v17, v20[0]);
LABEL_16:
    objc_exception_throw((id)[v18 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0]);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVPlayerItem *)self _addVideoOutput:output];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AVPlayerItem *)self _addLegibleOutput:output];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(AVPlayerItem *)self _addMetadataOutput:output];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(AVPlayerItem *)self _addRenderedLegibleOutput:output];
        }
      }
    }
  }
  [(AVPlayerItemOutput *)output _setTimebase:self->_playerItem->proxyUnfoldedTimebase];
LABEL_13:
  _Block_object_dispose(&v22, 8);
}

- (void)addMediaDataCollector:(id)a3 locked:(BOOL)a4
{
  BOOL v4 = a4;
  char v8 = [a3 _attachToPlayerItem:self];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__AVPlayerItem_AVPlayerItemMediaDataCollectors__addMediaDataCollector_locked___block_invoke;
  v9[3] = &unk_1E57B41F0;
  v9[4] = self;
  void v9[5] = a3;
  char v10 = v8 ^ 1;
  void v9[6] = v11;
  v9[7] = a2;
  [(AVPlayerItem *)self dispatchIVarWrite:1 locked:v4 block:v9];
  _Block_object_dispose(v11, 8);
}

uint64_t __78__AVPlayerItem_AVPlayerItemMediaDataCollectors__addMediaDataCollector_locked___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624) containsObject:*(void *)(a1 + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || !*(unsigned char *)(a1 + 64)
    && (id v7 = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624) arrayByAddingObject:*(void *)(a1 + 40)], *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 624) = v7, *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))|| *(unsigned char *)(a1 + 64))
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 32), *(const char **)(a1 + 56), @"Cannot attach a collector that is already attached", v2, v3, v4, v5, v6, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  uint64_t result = needsTaggedRanges();
  if (result)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    return [v9 _addMetadataCollector:v10 locked:1];
  }
  return result;
}

- (void)_addMetadataCollector:(id)a3 locked:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(AVPlayerItem *)self _copyFigPlaybackItemLocked:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke;
  v10[3] = &unk_1E57B2098;
  void v10[4] = self;
  v10[5] = a3;
  [(AVPlayerItem *)self dispatchIVarWrite:1 locked:v4 block:v10];
  if (v7)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke_2;
    v9[3] = &unk_1E57B2228;
    v9[4] = self;
    void v9[5] = v7;
    dispatch_async(figPlaybackItemSetterQueue, v9);
  }
}

uint64_t __78__AVPlayerItem_AVPlayerItemMediaDataCollectors___addMetadataCollector_locked___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 632) addObject:*(void *)(a1 + 40)];
}

- (void)_addVideoOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AVPlayerItem_AVPlayerItemOutputs___addVideoOutput___block_invoke;
  v7[3] = &unk_1E57B2098;
  v7[4] = self;
  v7[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v7);
  [a3 _pixelBufferAttributes];
  VTPixelBufferAttributesMediatorSetRequestedPixelBufferAttributesForKey();
  uint64_t v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemPreferredPixelBufferAttributesDidChangeNotification" object:self userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v6);
  [(AVPlayerItem *)self _evaluateVideoOutputs];
}

- (id)_enabledTrackFormatDescriptions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(AVPlayerItem *)self tracks];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "assetTrack"), "isEnabled")) {
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v9, "assetTrack"), "formatDescriptions"));
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSArray)tracks
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__7;
  long long v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__AVPlayerItem_tracks__block_invoke;
  v7[3] = &unk_1E57B2110;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSArray)mediaDataCollectors
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem_AVPlayerItemMediaDataCollectors__mediaDataCollectors__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_insertAfterItem:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVPlayerItem.m", 4543, @"Invalid parameter not satisfying: %@", @"previousItem != nil");
  }
  uint64_t v5 = *(void **)(*((void *)a3 + 1) + 1272);
  if (v5)
  {
    *(void *)(v5[1] + 1264) = self;
    uint64_t v5 = *(void **)(*((void *)a3 + 1) + 1272);
  }
  self->_playerItem->seekCompletionHandler = v5;
  *(void *)(*((void *)a3 + 1) + 1272) = self;
  *(void *)&self->_playerItem->nextSeekIDToGenerate = a3;
}

uint64_t __38__AVPlayerItem_setTextHighlightArray___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(result + 32) + 8) + 528);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 528) = result;
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __34__AVPlayerItem_setTextStyleRules___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 520);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 32) copy];
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 520) = result;
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 664) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __45__AVPlayerItem__mediaOptionsSelectedByClient__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1392) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __36__AVPlayerItem_initialEstimatedDate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 800);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __36__AVPlayerItem__playbackCoordinator__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1128);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __33__AVPlayerItem_reportingCategory__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 656) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __27__AVPlayerItem_initialDate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 792);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __27__AVPlayerItem_gaplessInfo__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 672);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

__n128 __24__AVPlayerItem_duration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(v2 + 488);
  v1[3].n128_u64[0] = *(void *)(v2 + 504);
  v1[2] = result;
  return result;
}

- (OpaqueCMTimebase)_copyProxyFoldedTimebase
{
  return (OpaqueCMTimebase *)CFRetain(self->_playerItem->proxyFoldedTimebase);
}

- (BOOL)_getCachedPresentationSize:(CGSize *)a3
{
  BOOL v5 = [(AVPlayerItem *)self _isReadyForInspectionOfPresentationSize];
  BOOL v6 = v5;
  if (a3 && v5)
  {
    [(AVPlayerItem *)self presentationSize];
    a3->width = v7;
    a3->height = v8;
  }
  return v6;
}

- (CGSize)presentationSize
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__AVPlayerItem_presentationSize__block_invoke;
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

- (BOOL)_isReadyForInspectionOfPresentationSize
{
  uint64_t v6 = 0;
  CGFloat v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem__isReadyForInspectionOfPresentationSize__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_preferredPixelBufferAttributes
{
  return 0;
}

- (BOOL)_suppressesVideoLayers
{
  uint64_t v6 = 0;
  CGFloat v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem__suppressesVideoLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_hasEnqueuedVideoFrame
{
  uint64_t v6 = 0;
  CGFloat v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem__hasEnqueuedVideoFrame__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__AVPlayerItem__syncLayers__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 152), "allObjects"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __87__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport___copyIntegratedTimelineIfCreated__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1008);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __60__AVPlayerItem_AVPlayerItemOutputs___metadataOutputsForKeys__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 184) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __36__AVPlayerItem_setVideoComposition___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1304) referencedObject] != *(void *)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1304), "referencedObject"), "_changeSeed"), id result = (id)objc_msgSend(*(id *)(a1 + 40), "_changeSeed"), (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != (void)result) != 0))
  {

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1296) = [*(id *)(a1 + 40) _deepCopy];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1304) = [[AVWeakReference alloc] initWithReferencedObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8)+ 1296)];
    CGFloat v7 = 0;
    uint64_t v8 = 0;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1296) _copyFigVideoCompositor:&v8 andSession:&v7 recyclingSession:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1312) forFigRemaker:0 error:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    double v5 = *(const void **)(v4 + 1320);
    if (v5)
    {
      CFRelease(v5);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    *(void *)(v4 + 1320) = v8;
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 1312);
    if (v6 != v7)
    {
      [v6 detachVideoComposition];
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 1312);
    }
    id result = v6;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1312) = v7;
  }
  return result;
}

- (void)selectMediaOption:(AVMediaSelectionOption *)mediaSelectionOption inMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  AVTelemetryGenerateID();
  if (dword_1EB2D3A00)
  {
    int v11 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerItem_selectMediaOption_inMediaSelectionGroup___block_invoke;
  block[3] = &unk_1E57B2138;
  void block[4] = self;
  void block[5] = mediaSelectionOption;
  void block[6] = mediaSelectionGroup;
  dispatch_sync(figPlaybackItemSetterQueue, block);
}

uint64_t __58__AVPlayerItem__updatePlaybackPropertiesOnFigPlaybackItem__block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _playbackProperties];
  if (result)
  {
    uint64_t v2 = (void *)result;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v3 = (void *)_updatePlaybackPropertiesOnFigPlaybackItem_keyMap;
    uint64_t result = [(id)_updatePlaybackPropertiesOnFigPlaybackItem_keyMap countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (result)
    {
      uint64_t v4 = result;
      double v5 = 0;
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
          uint64_t v9 = [v2 objectForKey:v8];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = [(id)_updatePlaybackPropertiesOnFigPlaybackItem_keyMap objectForKey:v8];
            if (!v5) {
              double v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            }
            [v5 setObject:v10 forKey:v11];
          }
          ++v7;
        }
        while (v4 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v4 = result;
      }
      while (result);
      if (v5)
      {
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t VTable = CMBaseObjectGetVTable();
        uint64_t v15 = *(void *)(VTable + 8);
        uint64_t result = VTable + 8;
        uint64_t v14 = v15;
        if (v15) {
          uint64_t v16 = v14;
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = *(uint64_t (**)(uint64_t, void, void *))(v16 + 56);
        if (v17) {
          return v17(FigBaseObject, *MEMORY[0x1E4F33AA8], v5);
        }
      }
    }
  }
  return result;
}

- (id)_playbackProperties
{
  char v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AVPlayerItem *)self gaplessInfo];
  if (v4) {
    [v3 addEntriesFromDictionary:v4];
  }
  playerItem = self->_playerItem;
  if (playerItem->coordinationIdentifier)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:");
    playerItem = self->_playerItem;
  }
  if (*(void *)&playerItem->participatesInCoordinatedPlayback) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  return v3;
}

- (id)gaplessInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem_gaplessInfo__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__AVPlayerItem_AVPlayerItemOutputs___evaluateVideoOutputs__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (v2)
  {
    id v3 = (const void *)v2;
    id v4 = (void *)[*(id *)(a1 + 32) _videoOutputs];
    [*(id *)(a1 + 32) _updateVideoSuppressionOnFigPlaybackItem:v3 basedOnOutputs:v4];
    double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9++), "_visualContext"));
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void (**)(uint64_t, void, void *))(v12 + 56);
    if (v13) {
      v13(FigBaseObject, *MEMORY[0x1E4F33CA0], v5);
    }
    CFRelease(v3);
  }
}

- (id)_videoOutputs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItem_AVPlayerItemOutputs___videoOutputs__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVPlayerItem__applyMediaSelectionOptions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _selectMediaOption:*(void *)(a1 + 40) inMediaSelectionGroup:*(void *)(a1 + 48)];
  if (([*(id *)(a1 + 32) _isReadyForBasicInspection] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 48) _isStreamingGroup], result))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 _setMediaOptionsSelectedByClient:0 forKey:v4];
  }
  return result;
}

- (BOOL)_isReadyForBasicInspection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem__isReadyForBasicInspection__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setMediaOptionsSelectedByClient:(id)a3 forKey:(id)a4
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerItem__setMediaOptionsSelectedByClient_forKey___block_invoke;
  block[3] = &unk_1E57B2138;
  void block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __56__AVPlayerItem_selectMediaOption_inMediaSelectionGroup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _selectMediaOption:*(void *)(a1 + 40) inMediaSelectionGroup:*(void *)(a1 + 48)];
  uint64_t result = [*(id *)(a1 + 32) _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection];
  if ((result & 1) == 0)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v3 _cacheMediaSelectionOption:v4 forMediaSelectionGroup:v5];
  }
  return result;
}

- (void)_cacheMediaSelectionOption:(id)a3 forMediaSelectionGroup:(id)a4
{
  if (-[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", [a4 asset]))
  {
    if (!a3)
    {
      if (![a4 allowsEmptySelection]) {
        return;
      }
      a3 = +[AVMediaSelectionOption mediaSelectionNilOptionForGroup:a4];
    }
    [(AVPlayerItem *)self _setMediaOptionsSelectedByClient:a3 forKey:a4];
  }
}

- (BOOL)_selectMediaOption:(id)a3 inMediaSelectionGroup:(id)a4
{
  LODWORD(v7) = -[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", [a4 asset]);
  if (v7)
  {
    if (a3 || (LODWORD(v7) = [a4 allowsEmptySelection], v7))
    {
      uint64_t v7 = [(AVPlayerItem *)self _copyFigPlaybackItem];
      if (v7)
      {
        uint64_t v8 = v7;
        ivarAccessQueue = self->_playerItem->ivarAccessQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__AVPlayerItem__selectMediaOption_inMediaSelectionGroup___block_invoke;
        block[3] = &unk_1E57B1E80;
        void block[4] = self;
        av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", -[AVPlayerItem _propertyListForMediaSelection:forGroup:](self, "_propertyListForMediaSelection:forGroup:", a3, a4));
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        long long v14 = *(void (**)(uint64_t, void, uint64_t))(v13 + 56);
        if (v14) {
          v14(FigBaseObject, *MEMORY[0x1E4F33B60], v10);
        }
        CFRelease(v8);
        LOBYTE(v7) = 1;
      }
    }
  }
  return (char)v7;
}

- (id)_propertyListForMediaSelection:(id)a3 forGroup:(id)a4
{
  id v4 = a3;
  if (!a3)
  {
    id v4 = +[AVMediaSelectionOption mediaSelectionNilOptionForGroup:a4];
    if (!v4) {
      goto LABEL_12;
    }
  }
  uint64_t v5 = (void *)[v4 propertyList];
  if (v5) {
    id v6 = (id)[v5 mutableCopy];
  }
  else {
    id v6 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v4 dictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 addEntriesFromDictionary:v8];
  }
  if (v7)
  {
    char v9 = (void *)[v7 copy];
    return v9;
  }
  else
  {
LABEL_12:
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    return (id)[v11 dictionary];
  }
}

void __31__AVPlayerItem__updateTimebase__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  char v3 = *(const void **)(v2 + 208);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 208) = 0;
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v2 + 208) = *(void *)(a1 + 40);
}

uint64_t __58__AVPlayerItem__updateVariantPreferencesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  char v1 = [*(id *)(a1 + 32) variantPreferences];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:v1 & 0xF ^ 3];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
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
  char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33C20];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

- (void)_setAssetToAssetWithFigPlaybackItemIfAppropriate
{
  if (+[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem])
  {
    if (!self->_playerItem->allowedAudioSpatializationFormatsWasSet)
    {
      uint64_t v5 = 0;
      uint64_t v6 = &v5;
      uint64_t v7 = 0x3052000000;
      uint64_t v8 = __Block_byref_object_copy__7;
      char v9 = __Block_byref_object_dispose__7;
      uint64_t v10 = 0;
      [(AVPlayerItem *)self willChangeValueForKey:@"asset"];
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __64__AVPlayerItem__setAssetToAssetWithFigPlaybackItemIfAppropriate__block_invoke;
      v4[3] = &unk_1E57B2160;
      v4[4] = self;
      void v4[5] = &v5;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
      [(AVPlayerItem *)self _setAsset:v6[5]];
      [(AVPlayerItem *)self didChangeValueForKey:@"asset"];
      self->_playerItem->allowedAudioSpatializationFormatsWasSet = 1;

      _Block_object_dispose(&v5, 8);
    }
  }
}

+ (BOOL)_forStreamingItemsVendAssetWithFigPlaybackItem
{
  return 0;
}

- (id)_nameForLogging
{
  playerItem = self->_playerItem;
  if (!playerItem) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  }
  char v3 = *(void **)&playerItem->loopTimeRange.duration.timescale;
  if (!v3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  }
  return (id)[v3 name];
}

- (void)_attachToPlayer:(id)a3
{
  id v5 = (id)[a3 _weakReference];
  uint64_t v6 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_playerItem->allowedAudioSpatializationFormats, (unint64_t *)&v6, (unint64_t)v5);
  if (v6)
  {
    id v9 = v5;
    unint64_t allowedAudioSpatializationFormats = self->_playerItem->allowedAudioSpatializationFormats;

    if (v9 != (id)allowedAudioSpatializationFormats) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"An AVPlayerItem cannot be associated with more than one instance of AVPlayer" userInfo:0]);
    }
  }
  else
  {
    uint64_t v7 = [a3 _stateDispatchQueue];
    dispatch_retain(v7);
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __32__AVPlayerItem__attachToPlayer___block_invoke;
    void v11[3] = &unk_1E57B2098;
    v11[4] = self;
    v11[5] = v7;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v11);
    dispatch_set_target_queue((dispatch_object_t)self->_playerItem->figConfigurationQueue, v7);
  }
}

void __57__AVPlayerItem__selectMediaOption_inMediaSelectionGroup___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1104) = 0;
}

uint64_t __57__AVPlayerItem__updateAudioTapProcessorOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) audioTapProcessor];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F338C0];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (opaqueMTAudioProcessingTap)audioTapProcessor
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_audioTapProcessor__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (opaqueMTAudioProcessingTap *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_nextItem
{
  return self->_playerItem->seekCompletionHandler;
}

uint64_t __80__AVPlayerItem__updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) seekingWaitsForVideoCompositionRendering]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33B58];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (BOOL)seekingWaitsForVideoCompositionRendering
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_seekingWaitsForVideoCompositionRendering__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVPlayerItem__updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) restrictsAutomaticMediaSelectionToAvailableOfflineOptions]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33B30];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (BOOL)restrictsAutomaticMediaSelectionToAvailableOfflineOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__AVPlayerItem_restrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayerItem__updateLimitReadAheadOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) limitReadAhead]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33998];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (BOOL)limitReadAhead
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_limitReadAhead__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __89__AVPlayerItem__updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canUseNetworkResourcesForLiveStreamingWhilePaused]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33A78];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = sCanUseExtraNetworkingByDefault;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVPlayerItem_canUseNetworkResourcesForLiveStreamingWhilePaused__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_addToPlayQueueOfFigPlayerOfPlayer:(id)a3 afterFigPlaybackItemOfItem:(id)a4
{
  if (self->_playerItem->previousItem) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:0x1EE595FF8 userInfo:0]);
  }
  [(AVPlayerItem *)self _attachToFigPlayer];
  self->_playerItem->previousItem = (AVPlayerItem *)-[AVPlayerConnection initWithWeakReferenceToPlayer:weakReferenceToPlayerItem:]([AVPlayerConnection alloc], "initWithWeakReferenceToPlayer:weakReferenceToPlayerItem:", [a3 _weakReference], -[AVPlayerItem _weakReference](self, "_weakReference"));
  previousItem = self->_playerItem->previousItem;
  return [(AVPlayerItem *)previousItem addItemToPlayQueueAfterPlaybackItemOfItem:a4];
}

- (void)_attachToFigPlayer
{
  uint64_t v67 = 0;
  char v3 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyFigPlayer");
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3052000000;
  uint64_t v56 = __Block_byref_object_copy__7;
  uint64_t v57 = __Block_byref_object_dispose__7;
  uint64_t v58 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3052000000;
  char v50 = __Block_byref_object_copy__7;
  uint64_t v51 = __Block_byref_object_dispose__7;
  uint64_t v52 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x3052000000;
  uint64_t v40 = __Block_byref_object_copy__7;
  char v41 = __Block_byref_object_dispose__7;
  uint64_t v42 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVPlayerItem__attachToFigPlayer__block_invoke;
  block[3] = &unk_1E57B3F98;
  void block[4] = self;
  void block[5] = &v63;
  void block[6] = &v59;
  void block[7] = &v53;
  block[8] = &v47;
  block[9] = &v43;
  block[10] = &v37;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (*((unsigned char *)v64 + 24))
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(uint64_t, void, void))(v7 + 56);
    if (v8) {
      v8(FigBaseObject, *MEMORY[0x1E4F34258], *MEMORY[0x1E4F1CFD0]);
    }
  }
  playerItem = self->_playerItem;
  if (playerItem->figPlaybackItem) {
    goto LABEL_69;
  }
  signed int valuePtr = 0;
  uint64_t v34 = 0;
  asset = playerItem->asset;
  if (!asset) {
    goto LABEL_53;
  }
  uint64_t v11 = *MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  id v13 = [(AVPlayerItem *)self _nameForLogging];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F336F8], v13);
  long long v14 = (const void *)v54[5];
  if (v14) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F336F0], v14);
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F33708], (const void *)v38[5]);
  long long v15 = (const void *)v48[5];
  if (v15) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F336E8], v15);
  }
  if (*((unsigned char *)v44 + 24)) {
    long long v16 = (const void **)MEMORY[0x1E4F1CFD0];
  }
  else {
    long long v16 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F33700], *v16);
  signed int valuePtr = [(id)objc_opt_class() _createFigPlaybackItemForFigPlayer:v3 asset:asset URL:self->_playerItem->URL flags:0 options:Mutable playbackItem:&v34];
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (!v34)
  {
    if (valuePtr) {
      goto LABEL_56;
    }
    goto LABEL_53;
  }
  long long v17 = self->_playerItem->ivarAccessQueue;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __34__AVPlayerItem__attachToFigPlayer__block_invoke_2;
  v33[3] = &unk_1E57B2228;
  v33[4] = self;
  v33[5] = v34;
  av_readwrite_dispatch_queue_write(v17, v33);
  [(AVPlayerItem *)self _addFPListeners];
  CFNumberRef number = 0;
  uint64_t v18 = FigPlaybackItemGetFigBaseObject();
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  long long v21 = *(uint64_t (**)(uint64_t, void, uint64_t, CFNumberRef *))(v20 + 48);
  if (!v21) {
    goto LABEL_28;
  }
  int v22 = v21(v18, *MEMORY[0x1E4F33B90], v11, &number);
  CFNumberRef v23 = number;
  if (!v22 && number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
LABEL_28:
    CFNumberRef v23 = number;
  }
  if (v23) {
    CFRelease(v23);
  }
  if (!valuePtr
    && [(AVPlayerItem *)self _configurePlaybackItemAndReturnError:&v67])
  {
    [(AVPlayerItem *)self _updateLimitReadAheadOnFigPlaybackItem];
    if ([(AVPlayerItem *)self playbackLikelyToKeepUpTrigger]) {
      [(AVPlayerItem *)self _updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self willNeverSeekBackwardsHint]) {
      [(AVPlayerItem *)self _updateWillNeverSeekBackwardsHintOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self alwaysMonitorsPlayability]) {
      [(AVPlayerItem *)self _updateAlwaysMonitorsPlayabilityOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self isNonForcedSubtitleDisplayEnabled]) {
      [(AVPlayerItem *)self _updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem];
    }
    if ([(AVPlayerItem *)self usesMinimalLatencyForVideoCompositionRendering])
    {
      [(AVPlayerItem *)self _updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem];
    }
    [(AVPlayerItem *)self _updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions];
    objc_msgSend(-[AVPlayerItem _cachedTracks](self, "_cachedTracks"), "makeObjectsPerformSelector:withObject:", sel__attachToFigPlaybackItemOfPlayerItem_, self);
    [(AVPlayerItem *)self _evaluateVideoOutputs];
    [(AVPlayerItem *)self _evaluateLegibleOutputs];
    [(AVPlayerItem *)self _evaluateMetadataOutputs];
    [(AVPlayerItem *)self _evaluateRenderedLegibleOutputs];
    id v24 = [(AVPlayerItem *)self _copyIntegratedTimelineIfCreated];
    char v25 = v24;
    if (v24)
    {
      [v24 _attachToItem:self];
      long long v26 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyInterstitialCoordinatorIfCreated");
      [v25 _attachCoordinator:v26];
    }
    else
    {
      long long v26 = 0;
    }

    if (v26) {
      CFRelease(v26);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __34__AVPlayerItem__attachToFigPlayer__block_invoke_3;
    v31[3] = &unk_1E57B1E80;
    v31[4] = self;
    dispatch_async(global_queue, v31);
    if (!valuePtr)
    {
      if (v34
        && [(AVAsset *)asset statusOfValueForKey:@"streaming" error:0] == 2
        && [(AVAsset *)self->_playerItem->asset _isStreaming])
      {
        [(AVPlayerItem *)self _respondToBecomingReadyForBasicInspection];
      }
LABEL_53:
      if (!*((unsigned char *)v60 + 24)
        && [(AVPlayerItem *)self automaticallyHandlesInterstitialEvents])
      {
        [(AVPlayerItem *)self _addInterstitialEventCollector];
      }
    }
  }
LABEL_56:
  if (valuePtr || v67)
  {
    URL = self->_playerItem->URL;
    if (URL)
    {
      if (v67)
      {
LABEL_60:
        -[AVPlayerItem _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:");
        goto LABEL_69;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if (v67) {
          goto LABEL_60;
        }
        uint64_t v30 = 0;
        signed int v29 = valuePtr;
        goto LABEL_68;
      }
      URL = (NSURL *)[(AVAsset *)asset URL];
      if (v67) {
        goto LABEL_60;
      }
    }
    signed int v29 = valuePtr;
    if (URL) {
      uint64_t v30 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:URL forKey:*MEMORY[0x1E4F289D0]];
    }
    else {
      uint64_t v30 = 0;
    }
LABEL_68:
    [(AVPlayerItem *)self _changeStatusToFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v29, v30)];
  }
LABEL_69:

  if (v3) {
    CFRelease(v3);
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
}

- (void)_evaluateVideoOutputs
{
  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AVPlayerItem_AVPlayerItemOutputs___evaluateVideoOutputs__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (id)_cachedTracks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AVPlayerItem__cachedTracks__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)willNeverSeekBackwardsHint
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerItem_willNeverSeekBackwardsHint__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)usesMinimalLatencyForVideoCompositionRendering
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerItem_usesMinimalLatencyForVideoCompositionRendering__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)playbackLikelyToKeepUpTrigger
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_playbackLikelyToKeepUpTrigger__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)alwaysMonitorsPlayability
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayerItem_alwaysMonitorsPlayability__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateLimitReadAheadOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__AVPlayerItem__updateLimitReadAheadOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__AVPlayerItem__updateRestrictsAutomaticMediaSelectionToAvailableOfflineOptions__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (AVPlayerItemStatus)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__AVPlayerItem_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerItemStatus v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setPlaybackCoordinator:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerItem__setPlaybackCoordinator___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (a3 && *((unsigned char *)v8 + 24)) {
    [(AVPlayerItem *)self _updateItemIdentifierForCoordinatedPlayback];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_updateItemIdentifierForCoordinatedPlayback
{
  AVPlayerItemStatus v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__AVPlayerItem__updateItemIdentifierForCoordinatedPlayback__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

- (void)_evaluateRenderedLegibleOutputs
{
  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AVPlayerItem_AVPlayerItemOutputs___evaluateRenderedLegibleOutputs__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (void)_evaluateMetadataOutputs
{
  figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AVPlayerItem_AVPlayerItemOutputs___evaluateMetadataOutputs__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_sync(figPlaybackItemSetterQueue, block);
}

- (void)_evaluateLegibleOutputs
{
  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AVPlayerItem_AVPlayerItemOutputs___evaluateLegibleOutputs__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_async(figConfigurationQueue, block);
}

- (id)_copyIntegratedTimelineIfCreated
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  char v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport___copyIntegratedTimelineIfCreated__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerItemStatus v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addInterstitialEventCollector
{
}

- (void)_addInterstitialEventCollectorLocked:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, [(AVPlayerItem *)self _player]);
  uint64_t v5 = [AVPlayerItemInterstitialEventCollector alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke;
  v8[3] = &unk_1E57B4178;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = [(AVPlayerItemInterstitialEventCollector *)v5 initWithCoordinatorGenerator:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke_2;
  v7[3] = &unk_1E57B2098;
  v7[4] = self;
  v7[5] = v6;
  [(AVPlayerItem *)self dispatchIVarWrite:1 locked:v3 block:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_respondToBecomingReadyForBasicInspection
{
  long long v2 = *MEMORY[0x1E4F1F9F8];
  uint64_t v3 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(AVPlayerItem *)self _respondToBecomingReadyForBasicInspectionWithDuration:&v2];
}

- (void)_respondToBecomingReadyForBasicInspectionWithDuration:(id *)a3
{
  if (![(AVPlayerItem *)self _isReadyForInspectionOfDuration])
  {
    if ([(AVAsset *)self->_playerItem->asset statusOfValueForKey:@"duration" error:0] == 2)[(AVPlayerItem *)self _markAsReadyForInspectionOfDuration]; {
    if ([(AVPlayerItem *)self _isReadyForInspectionOfDuration])
    }
    {
      long long v5 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      [(AVPlayerItem *)self _informObserversAboutAvailabilityOfDuration:&v5];
    }
  }
  if (![(AVAsset *)self->_playerItem->asset _isStreaming])
  {
    [(AVPlayerItem *)self _markAsReadyForBasicInspection];
    [(AVPlayerItem *)self _markAsReadyForInspectionOfTracks];
    [(AVPlayerItem *)self _markAsReadyForInspectionOfPresentationSize];
    objc_msgSend(-[AVPlayerItem _cachedTracks](self, "_cachedTracks"), "makeObjectsPerformSelector:", sel__respondToFigPlaybackItemBecomingReadyForInpection);
    [(AVPlayerItem *)self _kickAssetObserversIfAppropriate];
    [(AVPlayerItem *)self _informObserversAboutAvailabilityOfTracks:0];
    [(AVPlayerItem *)self _informObserversAboutAvailabilityOfPresentationSize];
  }
}

- (void)_markAsReadyForInspectionOfPresentationSize
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVPlayerItem__markAsReadyForInspectionOfPresentationSize__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_markAsReadyForBasicInspection
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerItem__markAsReadyForBasicInspection__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (void)_kickAssetObserversIfAppropriate
{
  if (self->_playerItem->wasInitializedWithURL
    && +[AVPlayerItem _forNonStreamingURLsFireKVOForAssetWhenReadyForInspection]&& !BYTE3(self->_playerItem->timedMetadata))
  {
    [(AVPlayerItem *)self willChangeValueForKey:@"asset"];
    [(AVPlayerItem *)self didChangeValueForKey:@"asset"];
    BYTE3(self->_playerItem->timedMetadata) = 1;
  }
}

- (void)_informObserversAboutAvailabilityOfPresentationSize
{
  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_async(figPlaybackItemAccessorQueue, block);
}

uint64_t __60__AVPlayerItem__updateRTCReportingCategoryOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) reportingCategory];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33AD8];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (id)reportingCategory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  char v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_reportingCategory__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerItem__setSyncLayersOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) _syncLayers];
  if ([v1 count]) {
    long long v2 = v1;
  }
  else {
    long long v2 = 0;
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
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
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v8 + 56);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33BC0];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

- (id)_syncLayers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem__syncLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __84__AVPlayerItem__seekToTime_toleranceBefore_toleranceAfter_seekID_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1160) = 0;
  }
  else
  {
    if ((*(unsigned char *)(a1 + 60) & 1) != 0
      && (*(unsigned char *)(a1 + 84) & 1) != 0
      && !*(void *)(a1 + 88)
      && (*(void *)(a1 + 72) & 0x8000000000000000) == 0
      && (*(_DWORD *)(a1 + 108) & 0x1D) == 1)
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8) + 1164;
      long long v4 = *(_OWORD *)(a1 + 120);
      uint64_t v5 = *(void *)(a1 + 136);
    }
    else
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8) + 1164;
      long long v4 = *(_OWORD *)(a1 + 96);
      uint64_t v5 = *(void *)(a1 + 112);
    }
    *(void *)(v3 + 16) = v5;
    *(_OWORD *)uint64_t v3 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1188) = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 1192) = *(_DWORD *)(a1 + 144);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8) + 1196;
    long long v7 = *(_OWORD *)(a1 + 148);
    *(void *)(v6 + 16) = *(void *)(a1 + 164);
    *(_OWORD *)uint64_t v6 = v7;
    uint64_t v8 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 1220);
    __n128 result = *(__n128 *)(a1 + 172);
    v8[1].n128_u64[0] = *(void *)(a1 + 188);
    *uint64_t v8 = result;
  }
  return result;
}

id __34__AVPlayerItem__attachToFigPlayer__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 8) + 248);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 640) != 0;
  id result = *(id *)(*(void *)(a1[4] + 8) + 1336);
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  *(void *)(*(void *)(a1[8] + 8) + 40) = *(void *)(*(void *)(a1[4] + 8) + 1344);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 8) + 1352);
  *(void *)(*(void *)(a1[10] + 8) + 40) = *(void *)(*(void *)(a1[4] + 8) + 1096);
  return result;
}

uint64_t __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1488) count];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8)+ 1488)];
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 1488);
    return [v3 removeAllObjects];
  }
  return result;
}

- (void)_applyMediaSelectionOptions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVPlayerItem *)self _mediaOptionsSelectedByClient];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v3 objectForKey:v8];
        figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__AVPlayerItem__applyMediaSelectionOptions__block_invoke;
        block[3] = &unk_1E57B2138;
        void block[4] = self;
        void block[5] = v9;
        void block[6] = v8;
        dispatch_sync(figPlaybackItemSetterQueue, block);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)_mediaOptionsSelectedByClient
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem__mediaOptionsSelectedByClient__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __83__AVPlayerItem_AVPlayerItemServiceIdentifier_Private___quietlySetServiceIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) serviceIdentifier];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v6 = *(void *)(VTable + 8);
    uint64_t result = VTable + 8;
    uint64_t v5 = v6;
    uint64_t v7 = v6 ? v5 : 0;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F33B68];
      return v8(FigBaseObject, v9, v2);
    }
  }
  return result;
}

id __68__AVPlayerItem_AVPlayerItemMediaDataCollectors__mediaDataCollectors__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __55__AVPlayerItem__updateReportingValuesOnFigPlaybackItem__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33948];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

uint64_t __52__AVPlayerItem__updateLoudnessInfoOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) loudnessInfo];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33A40];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

uint64_t __49__AVPlayerItem__updateMediaKindOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) mediaKind];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v6 = *(void *)(VTable + 8);
    uint64_t result = VTable + 8;
    uint64_t v5 = v6;
    uint64_t v7 = v6 ? v5 : 0;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F33A60];
      return v8(FigBaseObject, v9, v2);
    }
  }
  return result;
}

void __69__AVPlayerItem__updateSoundCheckVolumeNormalizationOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) soundCheckVolumeNormalization];
  int valuePtr = v1;
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, CFNumberRef))(v6 + 56);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33B78], v3);
    }
    CFRelease(v3);
  }
}

void __56__AVPlayerItem__updateVolumeAdjustmentOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) volumeAdjustment];
  int valuePtr = v1;
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, CFNumberRef))(v6 + 56);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33CA8], v3);
    }
    CFRelease(v3);
  }
}

void __52__AVPlayerItem__updateRestrictionsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t valuePtr = [*(id *)(a1 + 32) restrictions];
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, CFNumberRef))(v5 + 56);
    if (v6) {
      v6(FigBaseObject, *MEMORY[0x1E4F33B28], v2);
    }
    CFRelease(v2);
  }
}

uint64_t __54__AVPlayerItem__updateTextStyleRulesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) textStyleRules];
  if (v1) {
    id v2 = +[AVTextStyleRule propertyListForTextStyleRules:v1];
  }
  else {
    id v2 = 0;
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
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
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, id))(v8 + 56);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33BD0];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

__n128 __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_3(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 976) = result;
  return result;
}

void __66__AVPlayerItem__updatePreferredMinimumResolutionOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredMinimumResolution];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v7);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, CFDictionaryRef))(v4 + 56);
  if (v5) {
    v5(FigBaseObject, *MEMORY[0x1E4F33B20], DictionaryRepresentation);
  }
  CFRelease(DictionaryRepresentation);
}

CFTypeRef __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 1496);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__AVPlayerItem__tracksFromAssetTrackIDs__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) tracks];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = +[AVPlayerItemTrack playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:](AVPlayerItemTrack, "playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 120), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 249), [*(id *)(*((void *)&v14 + 1) + 8 * i) trackID], *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 112));
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) indexOfObject:v8];
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v11 = v3;
            uint64_t v12 = (uint64_t)v9;
          }
          else
          {
            uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) objectAtIndex:v10];
            uint64_t v11 = v3;
          }
          [v11 addObject:v12];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) = [v3 copy];
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _isExternalProtectionRequiredForPlayback];
  uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  if (v2)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    CGSize v7 = *(void (**)(uint64_t, void, uint64_t))(v6 + 56);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33B00], v3);
    }
  }
  int v8 = [*(id *)(a1 + 32) playHapticTracks];
  uint64_t v9 = *MEMORY[0x1E4F1CFC8];
  if (v8) {
    uint64_t v10 = v3;
  }
  else {
    uint64_t v10 = *MEMORY[0x1E4F1CFC8];
  }
  uint64_t v11 = FigPlaybackItemGetFigBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  long long v14 = *(void (**)(uint64_t, void, uint64_t))(v13 + 56);
  if (v14) {
    v14(v11, *MEMORY[0x1E4F33A90], v10);
  }
  uint64_t v15 = [*(id *)(a1 + 32) hapticPlaybackLocality];
  uint64_t v16 = FigPlaybackItemGetFigBaseObject();
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = *(void (**)(uint64_t, void, uint64_t))(v18 + 56);
  if (v19) {
    v19(v16, *MEMORY[0x1E4F339D0], v15);
  }
  if ([*(id *)(a1 + 32) suppressesAudioOnlyVariants]) {
    uint64_t v20 = v3;
  }
  else {
    uint64_t v20 = v9;
  }
  uint64_t v21 = FigPlaybackItemGetFigBaseObject();
  uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  id v24 = *(void (**)(uint64_t, void, uint64_t))(v23 + 56);
  if (v24) {
    v24(v21, *MEMORY[0x1E4F33BB8], v20);
  }
  if ([*(id *)(a1 + 32) prefersOfflinePlayableVariants]) {
    uint64_t v25 = v3;
  }
  else {
    uint64_t v25 = v9;
  }
  uint64_t v26 = FigPlaybackItemGetFigBaseObject();
  uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v27) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = 0;
  }
  signed int v29 = *(void (**)(uint64_t, void, uint64_t))(v28 + 56);
  if (v29) {
    v29(v26, *MEMORY[0x1E4F33AB8], v25);
  }
  if ([*(id *)(a1 + 32) requiresAccessLog]) {
    uint64_t v30 = v3;
  }
  else {
    uint64_t v30 = v9;
  }
  uint64_t v31 = FigPlaybackItemGetFigBaseObject();
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  uint64_t v34 = *(void (**)(uint64_t, void, uint64_t))(v33 + 56);
  if (v34) {
    v34(v31, *MEMORY[0x1E4F339C8], v30);
  }
  if ([*(id *)(a1 + 32) allowProgressiveSwitchUp]) {
    uint64_t v35 = v3;
  }
  else {
    uint64_t v35 = v9;
  }
  uint64_t v36 = FigPlaybackItemGetFigBaseObject();
  uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v37) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = 0;
  }
  uint64_t v39 = *(void (**)(uint64_t, void, uint64_t))(v38 + 56);
  if (v39) {
    v39(v36, *MEMORY[0x1E4F33890], v35);
  }
  if ([*(id *)(a1 + 32) allowProgressiveStartup]) {
    uint64_t v40 = v3;
  }
  else {
    uint64_t v40 = v9;
  }
  uint64_t v41 = FigPlaybackItemGetFigBaseObject();
  uint64_t v42 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v42) {
    uint64_t v43 = v42;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v44 = *(void (**)(uint64_t, void, uint64_t))(v43 + 56);
  if (v44) {
    v44(v41, *MEMORY[0x1E4F33888], v40);
  }
  if (![*(id *)(a1 + 32) allowProgressiveResume]) {
    uint64_t v3 = v9;
  }
  uint64_t v45 = FigPlaybackItemGetFigBaseObject();
  uint64_t v46 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v46) {
    uint64_t v47 = v46;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v48 = *(void (**)(uint64_t, void, uint64_t))(v47 + 56);
  if (v48) {
    v48(v45, *MEMORY[0x1E4F33880], v3);
  }
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 1480) > 0.0)
  {
    Float64 = (const void *)FigCFNumberCreateFloat64();
    uint64_t v50 = FigPlaybackItemGetFigBaseObject();
    uint64_t v51 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v51) {
      uint64_t v52 = v51;
    }
    else {
      uint64_t v52 = 0;
    }
    uint64_t v53 = *(void (**)(uint64_t, void, const void *))(v52 + 56);
    if (v53) {
      v53(v50, *MEMORY[0x1E4F338A8], Float64);
    }
    if (Float64)
    {
      CFRelease(Float64);
    }
  }
}

- (BOOL)_isExternalProtectionRequiredForPlayback
{
  uint64_t v6 = 0;
  CGSize v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__AVPlayerItem_AVPlayerItemProtectedContentPrivate___isExternalProtectionRequiredForPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowProgressiveSwitchUp
{
  uint64_t v6 = 0;
  CGSize v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_allowProgressiveSwitchUp__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowProgressiveStartup
{
  uint64_t v6 = 0;
  CGSize v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_allowProgressiveStartup__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowProgressiveResume
{
  uint64_t v6 = 0;
  CGSize v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem_allowProgressiveResume__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

__n128 __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = v2[2];
  *(void *)(v1 + 504) = v2[3].n128_u64[0];
  *(__n128 *)(v1 + 488) = result;
  return result;
}

void __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(const void **)(v1 + 1496);
  char v3 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(void *)(v1 + 1496) = v3;
  if (v3) {
    CFRetain(v3);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

void __40__AVPlayerItem__setPlaybackCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 1128);
  if (v1 != *(void **)(a1 + 40))
  {

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1128) = *(id *)(a1 + 40);
    char v3 = *(void **)(a1 + 32);
    if (*(void *)(v3[1] + 1136))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1136));

      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1136) = 0;
      char v3 = *(void **)(a1 + 32);
    }
    objc_initWeak(&location, v3);
    uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__AVPlayerItem__setPlaybackCoordinator___block_invoke_2;
    v6[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v7, &location);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1136) = (id)[v4 addObserverForName:0x1EE5A65B8 object:v5 queue:0 usingBlock:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))();
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  id v7 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7) {
    CFRelease(v7);
  }
}

- (void)processWaitingMetricEventTimelineCompletionHandlers
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3052000000;
  v19[3] = __Block_byref_object_copy__7;
  v19[4] = __Block_byref_object_dispose__7;
  v19[5] = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke;
  block[3] = &unk_1E57B2110;
  void block[4] = self;
  void block[5] = &v20;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  uint64_t v4 = v21 + 3;
  if (v21[3]) {
    goto LABEL_2;
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  long long v10 = *(uint64_t (**)(uint64_t, void, void, void *))(v9 + 48);
  if (!v10)
  {
    signed int v11 = -12782;
LABEL_10:
    uint64_t v6 = AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
    goto LABEL_11;
  }
  signed int v11 = v10(FigBaseObject, *MEMORY[0x1E4F33A70], *MEMORY[0x1E4F1CF80], v4);
  if (v11) {
    goto LABEL_10;
  }
LABEL_2:
  uint64_t v5 = self->_playerItem->ivarAccessQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_2;
  v17[3] = &unk_1E57B2160;
  v17[4] = self;
  v17[5] = &v20;
  av_readwrite_dispatch_queue_write(v5, v17);
  uint64_t v6 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
LABEL_11:
  uint64_t v12 = v6;
  uint64_t v13 = self->_playerItem->ivarAccessQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_3;
  v16[3] = &unk_1E57B2160;
  v16[4] = self;
  v16[5] = v19;
  av_readwrite_dispatch_queue_write(v13, v16);
  global_queue = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__AVPlayerItem_processWaitingMetricEventTimelineCompletionHandlers__block_invoke_4;
  v15[3] = &unk_1E57B3F70;
  void v15[5] = v19;
  v15[6] = &v20;
  v15[4] = v12;
  dispatch_async(global_queue, v15);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
}

- (BOOL)isPlaybackBufferEmpty
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_isPlaybackBufferEmpty__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPlaybackBufferFull
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem_isPlaybackBufferFull__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:(int)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  MEMORY[0x199715030](self->_playerItem->seekIDMutex, a2);
  int timescale = self->_playerItem->initialMaxSnapTime.timescale;
  if (timescale) {
    BOOL v7 = timescale == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    JUMPOUT(0x199715040);
  }
  [(AVPlayerItem *)self _postSeekCompletionNotificationWithSeekID:v5 andResult:v4];
  playerItem = self->_playerItem;
  CMTimeEpoch epoch = (void (**)(void, void))playerItem->initialMaxSnapTime.epoch;
  playerItem->initialMaxSnapTime.int timescale = 0;
  self->_playerItem->initialMaxSnapTime.CMTimeEpoch epoch = 0;
  MEMORY[0x199715040](self->_playerItem->seekIDMutex);
  if (epoch)
  {
    epoch[2](epoch, v4);
  }
}

- (BOOL)_timeJumpedNotificationIncludesExtendedDiagnosticPayload
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayerItem__timeJumpedNotificationIncludesExtendedDiagnosticPayload__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateAllowedAudioSpatializationFormatsFromFigItem
{
  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_async(figPlaybackItemAccessorQueue, block);
}

- (void)_invokeReadyForEnqueueingHandlers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_playerItem->mediaOptionsSelectedByClient count])
  {
    char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_playerItem->mediaOptionsSelectedByClient];
    [(NSMutableDictionary *)self->_playerItem->mediaOptionsSelectedByClient removeAllObjects];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __58__AVPlayerItem__updatePlaybackPropertiesOnFigPlaybackItem__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E4F33E50], @"GaplessInfoHeuristicInfoKey", *MEMORY[0x1E4F33E40], @"GaplessInfoEncodingDelayInFramesKey", *MEMORY[0x1E4F33E48], @"GaplessInfoEncodingDrainInFramesKey", *MEMORY[0x1E4F33E38], @"GaplessInfoDurationInFramesKey", *MEMORY[0x1E4F33E58], @"GaplessInfoLastPacketsResyncKey", *MEMORY[0x1E4F33E60], @"RampInOutInfoInDuration", *MEMORY[0x1E4F33E68], @"RampInOutInfoOutDuration", *MEMORY[0x1E4F33E30], @"AudibleDRMInfoGroupID", 0);
  _updatePlaybackPropertiesOnFigPlaybackItem_keyMap = result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    if (dyld_program_sdk_at_least()) {
      sRaiseExceptionWhenSeekingToANonNumericTime = 1;
    }
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      sOKToBlockWhenGettingValuesOfProperties = 1;
    }
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      sInvokeOverrideOfInitFromDesignatedInitializer = 1;
      sCanUseExtraNetworkingByDefault = 1;
    }
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      sConstrainsScalabilityToLosslessVariantsAndSampleRatesByDefault = 1;
    }
  }
}

uint64_t __115__AVPlayerItem__updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload_updateStatusToReadyToPlay___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 272) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 972) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 968) = *(unsigned char *)(result + 41);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 970) = *(unsigned char *)(result + 42);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 971) = *(unsigned char *)(result + 42);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 969) = *(unsigned char *)(result + 43);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 973) = *(unsigned char *)(result + 44);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 974) = *(unsigned char *)(result + 45);
  return result;
}

__n128 __33__AVPlayerItem_setLoopTimeRange___block_invoke(uint64_t a1)
{
  int v2 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  long long v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range1.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = v3;
  *(_OWORD *)&range1.duration.int timescale = *(_OWORD *)(a1 + 80);
  long long v4 = v2[66];
  *(_OWORD *)&v8.start.value = v2[65];
  *(_OWORD *)&v8.start.CMTimeEpoch epoch = v4;
  *(_OWORD *)&v8.duration.int timescale = v2[67];
  if (!CMTimeRangeEqual(&range1, &v8))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    __n128 result = *(__n128 *)(a1 + 48);
    long long v7 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v6 + 1072) = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v6 + 1056) = v7;
    *(__n128 *)(v6 + 1040) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (v2)
  {
    long long v3 = (const void *)v2;
    CFBooleanRef v17 = 0;
    CFBooleanRef BOOLean = 0;
    uint64_t v4 = *MEMORY[0x1E4F1CF80];
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    CMTimeRange v8 = *(void (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v7 + 48);
    if (v8 && (v8(FigBaseObject, *MEMORY[0x1E4F338D8], v4, &BOOLean), BOOLean)) {
      uint64_t v9 = 4 * (CFBooleanGetValue(BOOLean) != 0);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = FigPlaybackItemGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v12 + 48);
    if (v13)
    {
      v13(v10, *MEMORY[0x1E4F33B98], v4, &v17);
      if (v17)
      {
        if (CFBooleanGetValue(v17)) {
          v9 |= 3uLL;
        }
      }
    }
    if (BOOLean) {
      CFRelease(BOOLean);
    }
    if (v17) {
      CFRelease(v17);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(NSObject **)(*(void *)(v14 + 8) + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__AVPlayerItem__updateAllowedAudioSpatializationFormatsFromFigItem__block_invoke_2;
    v16[3] = &unk_1E57B2228;
    v16[4] = v14;
    v16[5] = v9;
    av_readwrite_dispatch_queue_write(v15, v16);
    CFRelease(v3);
  }
}

void __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _presentationSize];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(v2 + 8) + 128);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerItem__informObserversAboutAvailabilityOfPresentationSize__block_invoke_2;
  block[3] = &unk_1E57B36D0;
  void block[4] = v2;
  void block[5] = v4;
  void block[6] = v5;
  dispatch_async(v3, block);
}

- (CGSize)_presentationSize
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([(AVPlayerItem *)self _isReadyForInspectionOfPresentationSize]
      || sOKToBlockWhenGettingValuesOfProperties == 1)
    {
      uint64_t v12 = 0;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(unsigned int (**)(OpaqueFigPlaybackItem *, char *, uint64_t *))(v8 + 8);
      if (v9 && !v9(v6, (char *)&v12 + 4, &v12))
      {
        double v4 = *(float *)&v12;
        double v3 = *((float *)&v12 + 1);
      }
    }
    CFRelease(v6);
  }
  double v10 = v3;
  double v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setLoopTimeRange:(id *)a3
{
  uint64_t v16 = 0;
  CFBooleanRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  unsigned int var2 = a3->var0.var2;
  if ((var2 & 1) == 0
    || (unsigned int v6 = a3->var1.var2, (v6 & 1) == 0)
    || ((p_var1 = &a3->var1, a3->var1.var3) || p_var1->var0 < 0 || ((v6 | var2) & 0x10) == 0)
    && (a3->var1.var3
     || p_var1->var0 < 0
     || (*(_OWORD *)&time1.value = *(_OWORD *)&p_var1->var0,
         time1.CMTimeEpoch epoch = a3->var1.var3,
         CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
         CMTimeCompare(&time1, &time2))))
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__AVPlayerItem_setLoopTimeRange___block_invoke;
    v10[3] = &unk_1E57B4128;
    long long v9 = *(_OWORD *)&a3->var0.var3;
    long long v11 = *(_OWORD *)&a3->var0.var0;
    long long v12 = v9;
    long long v13 = *(_OWORD *)&a3->var1.var1;
    void v10[4] = self;
    v10[5] = &v16;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v10);
    if (*((unsigned char *)v17 + 24))
    {
      [(AVPlayerItem *)self _updateTimebase];
      [(AVPlayerItem *)self _updateLoopTimeRangeOnFigPlaybackItem];
    }
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_updateLoopTimeRangeOnFigPlaybackItem
{
  memset(&v19, 0, sizeof(v19));
  if (self) {
    [(AVPlayerItem *)self loopTimeRange];
  }
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    double v4 = v3;
    if ((v19.start.flags & 0x1D) != 1) {
      goto LABEL_10;
    }
    *(_OWORD *)&time1.start.value = *(_OWORD *)&v19.start.value;
    time1.start.CMTimeEpoch epoch = v19.start.epoch;
    long long v16 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    time2.CMTimeEpoch epoch = v5;
    if (CMTimeCompare(&time1.start, &time2) < 0) {
      goto LABEL_10;
    }
    if ((v19.duration.flags & 0x1D) == 1
      && (time1.CMTimeRange start = v19.duration,
          *(_OWORD *)&time2.value = v16,
          time2.CMTimeEpoch epoch = v5,
          CMTimeCompare(&time1.start, &time2) >= 1))
    {
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CMTimeRange time1 = v19;
      CFDictionaryRef v7 = CMTimeRangeCopyAsDictionary(&time1, v6);
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v15 = *(void (**)(uint64_t, void, CFDictionaryRef))(v10 + 56);
      if (v15) {
        v15(FigBaseObject, *MEMORY[0x1E4F33A38], v7);
      }
      if (v7) {
        CFRelease(v7);
      }
    }
    else
    {
LABEL_10:
      uint64_t v11 = FigPlaybackItemGetFigBaseObject();
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v14 = *(void (**)(uint64_t, void, void))(v13 + 56);
      if (v14) {
        v14(v11, *MEMORY[0x1E4F33A38], 0);
      }
    }
    CFRelease(v4);
  }
}

+ (BOOL)_forNonStreamingURLsFireKVOForAssetWhenReadyForInspection
{
  return 0;
}

+ (AVPlayerItem)playerItemWithURL:(NSURL *)URL
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithURL:URL];
  return (AVPlayerItem *)v3;
}

+ (AVPlayerItem)playerItemWithAsset:(AVAsset *)asset
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithAsset:asset];
  return (AVPlayerItem *)v3;
}

+ (AVPlayerItem)playerItemWithAsset:(AVAsset *)asset automaticallyLoadedAssetKeys:(NSArray *)automaticallyLoadedAssetKeys
{
  double v4 = (void *)[objc_alloc((Class)a1) initWithAsset:asset automaticallyLoadedAssetKeys:automaticallyLoadedAssetKeys];
  return (AVPlayerItem *)v4;
}

- (AVPlayerItem)init
{
  if (self->_playerItem)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVPlayerItem;
    return [(AVPlayerItem *)&v3 init];
  }
  else
  {

    return 0;
  }
}

- (AVPlayerItem)initWithURL:(NSURL *)URL
{
  if (URL)
  {
    CGSize result = [(AVPlayerItem *)self initWithAsset:+[AVAsset assetWithURL:](AVAsset, "assetWithURL:")];
    if (result) {
      result->_playerItem->wasInitializedWithURL = 1;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

+ (BOOL)_hasOverrideForSelector:(SEL)a3
{
  Method InstanceMethod = class_getInstanceMethod((Class)a1, a3);
  CMTimeEpoch v5 = (objc_class *)self;
  return InstanceMethod != class_getInstanceMethod(v5, a3);
}

- (void)dealloc
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A00)
  {
    int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_playerItem)
  {
    if (dword_1EB2D3A00)
    {
      int v40 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      double v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVPlayerItem *)self _removeFAListeners];
    [(AVPlayerItem *)self _removeFPListeners];
    [(AVPlayerItem *)self _removeFoldedTBListeners];
    [(NSMutableArray *)self->_playerItem->itemMetadataCollectors _detatchFromPlayerItem];

    playerItem = self->_playerItem;
    if (*(void *)&playerItem->isRenderingSpatialAudio)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)&self->_playerItem->isRenderingSpatialAudio);

      playerItem = self->_playerItem;
    }
    ivarAccessQueue = playerItem->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      playerItem = self->_playerItem;
    }
    figConfigurationQueue = playerItem->figConfigurationQueue;
    if (figConfigurationQueue)
    {
      dispatch_release(figConfigurationQueue);
      playerItem = self->_playerItem;
    }
    seekQueue = playerItem->seekQueue;
    if (seekQueue)
    {
      dispatch_release(seekQueue);
      playerItem = self->_playerItem;
    }
    if (playerItem->figPlaybackItem)
    {
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v10 = FigBaseObject;
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v12 = v11 ? v11 : 0;
        uint64_t v13 = *(void (**)(uint64_t))(v12 + 24);
        if (v13) {
          v13(v10);
        }
      }
    }
    uint64_t v14 = self->_playerItem;
    unfoldedFigTimebase = v14->unfoldedFigTimebase;
    if (unfoldedFigTimebase)
    {
      CFRelease(unfoldedFigTimebase);
      self->_playerItem->unfoldedFigTimebase = 0;
      uint64_t v14 = self->_playerItem;
    }
    proxyUnfoldedTimebase = v14->proxyUnfoldedTimebase;
    if (proxyUnfoldedTimebase)
    {
      CFRelease(proxyUnfoldedTimebase);
      self->_playerItem->proxyUnfoldedTimebase = 0;
      uint64_t v14 = self->_playerItem;
    }
    foldedTimebase = v14->foldedTimebase;
    if (foldedTimebase)
    {
      CFRelease(foldedTimebase);
      self->_playerItem->foldedTimebase = 0;
      uint64_t v14 = self->_playerItem;
    }
    proxyFoldedTimebase = v14->proxyFoldedTimebase;
    if (proxyFoldedTimebase)
    {
      CFRelease(proxyFoldedTimebase);
      self->_playerItem->proxyFoldedTimebase = 0;
      uint64_t v14 = self->_playerItem;
    }
    double delayPreparingItemDuration = v14->delayPreparingItemDuration;
    if (delayPreparingItemDuration != 0.0)
    {
      CFRelease(*(CFTypeRef *)&delayPreparingItemDuration);
      self->_playerItem->double delayPreparingItemDuration = 0.0;
      uint64_t v14 = self->_playerItem;
    }

    uint64_t v20 = self->_playerItem;
    playerReference = v20->playerReference;
    if (playerReference)
    {
      CFRelease(playerReference);
      self->_playerItem->playerReference = 0;
      uint64_t v20 = self->_playerItem;
    }
    textHighlightArray = v20->textHighlightArray;
    if (textHighlightArray)
    {
      CFRelease(textHighlightArray);
      self->_playerItem->textHighlightArray = 0;
      uint64_t v20 = self->_playerItem;
    }

    uint64_t v23 = self->_playerItem;
    pixelBufferAttributeMediator = v23->pixelBufferAttributeMediator;
    if (pixelBufferAttributeMediator)
    {
      CFRelease(pixelBufferAttributeMediator);
      uint64_t v23 = self->_playerItem;
    }

    uint64_t v25 = self->_playerItem;
    figPlaybackItem = v25->figPlaybackItem;
    if (figPlaybackItem)
    {
      CFRelease(figPlaybackItem);
      self->_playerItem->figPlaybackItem = 0;
      uint64_t v25 = self->_playerItem;
    }

    uint64_t v27 = self->_playerItem;
    clientsOriginalVideoComposition = v27->clientsOriginalVideoComposition;
    if (clientsOriginalVideoComposition)
    {
      CFRelease(clientsOriginalVideoComposition);
      uint64_t v27 = self->_playerItem;
    }

    signed int v29 = self->_playerItem;
    loudnessInfo = v29->loudnessInfo;
    if (loudnessInfo)
    {
      CFRelease(loudnessInfo);
      self->_playerItem->loudnessInfo = 0;
      signed int v29 = self->_playerItem;
    }

    uint64_t v31 = self->_playerItem;
    if (v31->initialMaxSnapTime.epoch)
    {
      NSLog(&cfstr_AvplayeritemPD.isa, self);
      uint64_t v31 = self->_playerItem;
    }
    if (v31->seekIDMutex)
    {
      FigSimpleMutexDestroy();
      uint64_t v31 = self->_playerItem;
    }
    stateDispatchQueue = v31->stateDispatchQueue;
    if (stateDispatchQueue)
    {
      dispatch_release(stateDispatchQueue);
      uint64_t v31 = self->_playerItem;
    }
    figPlaybackItemAccessorQueue = v31->figPlaybackItemAccessorQueue;
    if (figPlaybackItemAccessorQueue)
    {
      dispatch_release(figPlaybackItemAccessorQueue);
      uint64_t v31 = self->_playerItem;
    }
    figPlaybackItemSetterQueue = v31->figPlaybackItemSetterQueue;
    if (figPlaybackItemSetterQueue)
    {
      dispatch_release(figPlaybackItemSetterQueue);
      uint64_t v31 = self->_playerItem;
    }

    uint64_t v35 = self->_playerItem;
    if (v35)
    {
      CFRelease(v35);
      self->_playerItem = 0;
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)AVPlayerItem;
  [(AVPlayerItem *)&v38 dealloc];
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItem;
  return [(AVPlayerItem *)&v3 copy];
}

- (NSString)description
{
  objc_super v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  CMTimeEpoch v5 = NSStringFromClass(v4);
  if ([(AVPlayerItem *)self asset])
  {
    CFAllocatorRef v6 = (__CFString *)[NSString stringWithFormat:@"asset = %@", -[AVPlayerItem asset](self, "asset")];
  }
  else if ([(AVPlayerItem *)self _URL])
  {
    CFAllocatorRef v6 = (__CFString *)[NSString stringWithFormat:@"URL = %@", -[AVPlayerItem _URL](self, "_URL")];
  }
  else
  {
    CFAllocatorRef v6 = @"with no asset and no URL";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v6];
}

- (id)identifier
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__AVPlayerItem_identifier__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__AVPlayerItem_identifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1096) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__AVPlayerItem_setDelegate___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __28__AVPlayerItem_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 256) = *(void *)(result + 40);
  return result;
}

- (void)_setTimeJumpedNotificationIncludesExtendedDiagnosticPayload:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__AVPlayerItem__setTimeJumpedNotificationIncludesExtendedDiagnosticPayload___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __76__AVPlayerItem__setTimeJumpedNotificationIncludesExtendedDiagnosticPayload___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1144) = *(unsigned char *)(result + 40);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"_externalProtectionRequiredForPlayback"])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28ED0];
    BOOL v6 = [(AVPlayerItem *)self _isExternalProtectionRequiredForPlayback];
    return (id)[v5 numberWithBool:v6];
  }
  else if ([a3 isEqualToString:@"timebase"])
  {
    return [(AVPlayerItem *)self timebase];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerItem;
    return [(AVPlayerItem *)&v8 valueForUndefinedKey:a3];
  }
}

uint64_t __55__AVPlayerItem_addObserver_forKeyPath_options_context___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 248) = 1;
  return result;
}

void __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 536);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 536) = 0;
  }
}

uint64_t __53__AVPlayerItem__configurePlaybackItemAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  objc_super v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33970];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (id)_copyPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerItem__copyPlayer__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __27__AVPlayerItem__copyPlayer__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1456) referencedObject];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_playerConnection
{
  return self->_playerItem->previousItem;
}

- (void)_removeFromPlayQueueOfFigPlayerOfAttachedPlayer
{
  self->_playerItem->previousItem = 0;
}

- (id)_previousItem
{
  return *(id *)&self->_playerItem->nextSeekIDToGenerate;
}

- (void)_removeFromItems
{
  playerItem = self->_playerItem;
  seekCompletionHandler = playerItem->seekCompletionHandler;
  uint64_t v4 = *(void *)&playerItem->nextSeekIDToGenerate;
  if (v4)
  {
    *(void *)(*(void *)(v4 + 8) + 1272) = seekCompletionHandler;
    playerItem = self->_playerItem;
  }
  if (seekCompletionHandler)
  {
    *(void *)(seekCompletionHandler[1] + 1264) = *(void *)&playerItem->nextSeekIDToGenerate;
    playerItem = self->_playerItem;
  }
  *(void *)&playerItem->nextSeekIDToGenerate = 0;
  self->_playerItem->seekCompletionHandler = 0;
}

- (id)_URL
{
  return self->_playerItem->URL;
}

uint64_t __26__AVPlayerItem__setAsset___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 144) = result;
  return result;
}

- (id)_ensureAssetWithFigPlaybackItemWithTrackIDs:(id)a3
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  CMTimeRange v19 = __Block_byref_object_dispose__7;
  uint64_t v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if ([(AVAsset *)self->_playerItem->asset _isStreaming]
    && !+[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem])
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke;
    block[3] = &unk_1E57B2188;
    void block[4] = a3;
    void block[5] = self;
    void block[6] = &v11;
    void block[7] = &v15;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }
  else
  {
    uint64_t v5 = self->_playerItem->ivarAccessQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke_2;
    v9[3] = &unk_1E57B2110;
    v9[4] = self;
    void v9[5] = &v15;
    av_readwrite_dispatch_queue_read(v5, v9);
  }
  if (*((unsigned char *)v12 + 24)) {
    [(id)v16[5] tracks];
  }
  id v7 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

id __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 240)] & 1) == 0)
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 240) = *(id *)(a1 + 32);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 232) = +[AVAsset assetWithURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 8) figPlaybackItem:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 120) trackIDs:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 240) dynamicBehavior:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 232);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

id __60__AVPlayerItem__ensureAssetWithFigPlaybackItemWithTrackIDs___block_invoke_2(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 232);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_markAsNeedingNewAssetWithFigPlaybackItem
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerItem__markAsNeedingNewAssetWithFigPlaybackItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __57__AVPlayerItem__markAsNeedingNewAssetWithFigPlaybackItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 240) = 0;
}

id __64__AVPlayerItem__setAssetToAssetWithFigPlaybackItemIfAppropriate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = (void *)v2[29];
  if (!v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 232) = +[AVAsset assetWithURL:v2[1] figPlaybackItem:v2[15] trackIDs:0 dynamicBehavior:1];
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 232);
  }
  id result = v3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_markAssetWithFigPlaybackItemAsNeedingNewTracks
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  id v7 = __Block_byref_object_copy__7;
  uint64_t v8 = __Block_byref_object_dispose__7;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__AVPlayerItem__markAssetWithFigPlaybackItemAsNeedingNewTracks__block_invoke;
  v3[3] = &unk_1E57B2110;
  v3[4] = self;
  v3[5] = &v4;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v3);
  [(id)v5[5] _tracksDidChange];

  _Block_object_dispose(&v4, 8);
}

id __63__AVPlayerItem__markAssetWithFigPlaybackItemAsNeedingNewTracks__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 232);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

__n128 __60__AVPlayerItem__informObserversAboutAvailabilityOfDuration___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = v2[2];
  *(void *)(v1 + 504) = v2[3].n128_u64[0];
  *(__n128 *)(v1 + 488) = result;
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__AVPlayerItem_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __21__AVPlayerItem_error__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 280);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_changeStatusToFailedWithError:(id)a3
{
  if ([(AVPlayerItem *)self status] != AVPlayerItemStatusFailed)
  {
    [(AVPlayerItem *)self willChangeValueForKey:@"status"];
    [(AVPlayerItem *)self willChangeValueForKey:@"error"];
    NSUInteger v5 = [(NSArray *)[(AVPlayerItemErrorLog *)[(AVPlayerItem *)self errorLog] events] count];
    if (v5)
    {
      NSUInteger v6 = v5;
      id v7 = (void *)[MEMORY[0x1E4F28E78] string];
      uint64_t v8 = (void *)[a3 userInfo];
      uint64_t v9 = *MEMORY[0x1E4F1D138];
      uint64_t v10 = [v8 objectForKey:*MEMORY[0x1E4F1D138]];
      if (v10) {
        [v7 appendFormat:@"%@, ", v10];
      }
      objc_msgSend(v7, "appendFormat:", @"See -[AVPlayerItem errorLog] for %d events", v6);
      id v11 = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "mutableCopy");
      [v11 setObject:v7 forKey:v9];
      a3 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"), v11);
    }
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AVPlayerItem__changeStatusToFailedWithError___block_invoke;
    block[3] = &unk_1E57B2098;
    void block[4] = self;
    void block[5] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    [(AVPlayerItem *)self didChangeValueForKey:@"error"];
    [(AVPlayerItem *)self didChangeValueForKey:@"status"];
    if (objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", @"AVFoundationErrorDomain"))
    {
      if ([a3 code] == -11819) {
        [(AVAsset *)[(AVPlayerItem *)self asset] _serverHasDied];
      }
    }
  }
}

uint64_t __47__AVPlayerItem__changeStatusToFailedWithError___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v1 + 272) != 2)
  {
    uint64_t v2 = result;
    *(void *)(v1 + 272) = 2;
    id result = [*(id *)(result + 40) copy];
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 280) = result;
  }
  return result;
}

- (NSArray)automaticallyLoadedAssetKeys
{
  id result = self->_playerItem->automaticallyLoadedAssetKeys;
  if (!result) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  return result;
}

- (id)_tracksWithFPTrackIDArray:(id)a3 fromFigPlaybackItem:(OpaqueFigPlaybackItem *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    [(AVPlayerItem *)self _ensureAssetWithFigPlaybackItemWithTrackIDs:a3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(a3);
          }
          id v11 = *(const void **)(*((void *)&v18 + 1) + 8 * i);
          CFTypeID v12 = CFGetTypeID(v11);
          if (v12 == CFNumberGetTypeID())
          {
            int valuePtr = 0;
            CFNumberGetValue((CFNumberRef)v11, kCFNumberSInt32Type, &valuePtr);
            if (valuePtr)
            {
              uint64_t v13 = +[AVPlayerItemTrack playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:](AVPlayerItemTrack, "playerItemTrackWithFigPlaybackItem:readyForInspection:trackID:asset:playerItem:", a4, 1);
              if (v13) {
                [v16 addObject:v13];
              }
            }
          }
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    return v16;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v15 array];
  }
}

- (id)_trackWithTrackID:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(AVPlayerItem *)self _tracks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "assetTrack"), "trackID") == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_removeFPListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_playerItem->figPlaybackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVPlayerItem *)self _weakReference];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVPlayerItem *)self _fpNotificationNames];
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
          [v3 removeListenerWithWeakReference:v4 callback:avplayeritem_fpItemNotificationCallback name:*(void *)(*((void *)&v10 + 1) + 8 * v9++) object:self->_playerItem->figPlaybackItem];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputChanged name:*MEMORY[0x1E4F335E0] object:self->_playerItem->figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputWasFlushed name:*MEMORY[0x1E4F335E8] object:self->_playerItem->figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_MetadataOutputChanged name:*MEMORY[0x1E4F335F0] object:self->_playerItem->figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_MetadataOutputWasFlushed name:*MEMORY[0x1E4F335F8] object:self->_playerItem->figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_TaggedMetadataArrayChanged name:*MEMORY[0x1E4F336C8] object:self->_playerItem->figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputChanged name:*MEMORY[0x1E4F33650] object:self->_playerItem->figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputWasFlushed name:*MEMORY[0x1E4F33658] object:self->_playerItem->figPlaybackItem];
    CFRelease(v4);
  }
}

- (void)_makeReadyForEnqueueingWithCompletionHandler:(id)a3
{
  [(AVPlayerItem *)self _attachToFigPlayer];
  figPlaybackItem = self->_playerItem->figPlaybackItem;
  if (figPlaybackItem)
  {
    char v25 = 0;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(OpaqueFigPlaybackItem *, void, char *))(v7 + 48);
    if (v9)
    {
      signed int v10 = v9(figPlaybackItem, 0, &v25);
      if (!v10)
      {
        int v11 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      signed int v10 = -12782;
    }
    [(AVPlayerItem *)self _changeStatusToFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v10, 0)];
    int v11 = 0;
LABEL_14:
    if (v25) {
      [(AVPlayerItem *)self _respondToBecomingReadyForBasicInspection];
    }
    if (!v11)
    {
LABEL_27:
      if (v10) {
        goto LABEL_39;
      }
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F33920]];
      char v25 = 0;
      long long v18 = self->_playerItem->figPlaybackItem;
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      long long v21 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, char *))(v20 + 48);
      if (v21)
      {
        signed int v22 = v21(v18, v17, &v25);
        if (!v22)
        {
LABEL_36:
          if (v25) {
            BYTE1(self->_playerItem->timedMetadata) = 1;
          }
          if (!v22)
          {
            if (![(AVPlayerItem *)self _isReadyForBasicInspection]
              || (playerItem = self->_playerItem, !LOBYTE(playerItem->timedMetadata))
              || !BYTE1(playerItem->timedMetadata))
            {
              if (a3)
              {
                id v24 = (void *)[a3 copy];
                [(NSMutableDictionary *)self->_playerItem->mediaOptionsSelectedByClient addObject:v24];
              }
              return;
            }
          }
LABEL_39:
          [(AVPlayerItem *)self _invokeReadyForEnqueueingHandlers];
          if (a3) {
            (*((void (**)(id))a3 + 2))(a3);
          }
          return;
        }
      }
      else
      {
        signed int v22 = -12782;
      }
      [(AVPlayerItem *)self _changeStatusToFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v22, 0)];
      goto LABEL_36;
    }
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F33A00]];
    char v25 = 0;
    long long v13 = self->_playerItem->figPlaybackItem;
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, char *))(v15 + 48);
    if (v16)
    {
      signed int v10 = v16(v13, v12, &v25);
      if (!v10)
      {
LABEL_25:
        if (v25) {
          LOBYTE(self->_playerItem->timedMetadata) = 1;
        }
        goto LABEL_27;
      }
    }
    else
    {
      signed int v10 = -12782;
    }
    [(AVPlayerItem *)self _changeStatusToFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v10, 0)];
    goto LABEL_25;
  }
  if (a3)
  {
    uint64_t v8 = (void (*)(id))*((void *)a3 + 2);
    v8(a3);
  }
}

- (BOOL)_canPlayFastForward
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  if (([(AVPlayerItem *)self status] == AVPlayerItemStatusReadyToPlay
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && ((CFBooleanRef BOOLean = 0,
         uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(),
         (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (uint64_t v9 = *(void (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48)) != 0
     && (v9(FigBaseObject, *MEMORY[0x1E4F33930], *MEMORY[0x1E4F1CF80], &BOOLean), BOOLean)))
  {
    BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)canPlayFastForward
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlayFastForward__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlayFastForward__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 968);
  return result;
}

- (BOOL)_canPlayFastReverse
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  if (([(AVPlayerItem *)self status] == AVPlayerItemStatusReadyToPlay
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && ((CFBooleanRef BOOLean = 0,
         uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(),
         (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (char v9 = *(void (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48)) != 0
     && (v9(FigBaseObject, *MEMORY[0x1E4F33938], *MEMORY[0x1E4F1CF80], &BOOLean), BOOLean)))
  {
    BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)canPlayFastReverse
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlayFastReverse__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlayFastReverse__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 969);
  return result;
}

- (BOOL)_isAFileBasedItemThatsReadyToPlay
{
  if ([(AVPlayerItem *)self status] == AVPlayerItemStatusReadyToPlay) {
    return ![(AVAsset *)self->_playerItem->asset _isStreaming];
  }
  else {
    return 0;
  }
}

- (BOOL)_canPlayReverse
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  if ([(AVPlayerItem *)self status] == AVPlayerItemStatusReadyToPlay
    && ((CFBooleanRef BOOLean = 0,
         uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(),
         (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (char v9 = *(void (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48)) != 0
     && (v9(FigBaseObject, *MEMORY[0x1E4F33940], *MEMORY[0x1E4F1CF80], &BOOLean), BOOLean)))
  {
    BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)canPlayReverse
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_canPlayReverse__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__AVPlayerItem_canPlayReverse__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 970);
  return result;
}

- (BOOL)canPlaySlowForward
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlaySlowForward__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlaySlowForward__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 972);
  return result;
}

- (BOOL)canPlaySlowReverse
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_canPlaySlowReverse__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVPlayerItem_canPlaySlowReverse__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 971);
  return result;
}

- (BOOL)_canStepForward
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  if (([(AVPlayerItem *)self status] == AVPlayerItemStatusReadyToPlay
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && ((CFBooleanRef BOOLean = 0,
         uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(),
         (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (char v9 = *(void (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48)) != 0
     && (v9(FigBaseObject, *MEMORY[0x1E4F33BA0], *MEMORY[0x1E4F1CF80], &BOOLean), BOOLean)))
  {
    BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)canStepForward
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem_canStepForward__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__AVPlayerItem_canStepForward__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 973);
  return result;
}

- (BOOL)canStepBackward
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayerItem_canStepBackward__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVPlayerItem_canStepBackward__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 974);
  return result;
}

- (void)_updatePreservesTimeOffsetFromLive
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__AVPlayerItem__updatePreservesTimeOffsetFromLive__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __50__AVPlayerItem__updatePreservesTimeOffsetFromLive__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) automaticallyPreservesTimeOffsetFromLive]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F338F8];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)setAutomaticallyPreservesTimeOffsetFromLive:(BOOL)automaticallyPreservesTimeOffsetFromLive
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_setAutomaticallyPreservesTimeOffsetFromLive___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = automaticallyPreservesTimeOffsetFromLive;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updatePreservesTimeOffsetFromLive];
}

uint64_t __60__AVPlayerItem_setAutomaticallyPreservesTimeOffsetFromLive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 438) = *(unsigned char *)(result + 40);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_configuredTimeOffsetFromLive
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    uint64_t v8 = result;
    if ([(AVPlayerItem *)self _isReadyForInspectionOfRecommendedTimeOffsetFromLive]|| sOKToBlockWhenGettingValuesOfProperties == 1)
    {
      CFDictionaryRef dictionaryRepresentation = 0;
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v11 = v10 ? v10 : 0;
      uint64_t v12 = *(unsigned int (**)(uint64_t, void, void, CFDictionaryRef *))(v11 + 48);
      if (v12)
      {
        if (!v12(FigBaseObject, *MEMORY[0x1E4F33BE0], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation))
        {
          CMTimeMakeFromDictionary(&v17, dictionaryRepresentation);
          CMTimeValue value = v17.value;
          CMTimeFlags flags = v17.flags;
          CMTimeScale timescale = v17.timescale;
          CMTimeEpoch epoch = v17.epoch;
          if (dictionaryRepresentation) {
            CFRelease(dictionaryRepresentation);
          }
        }
      }
    }
    CFRelease(v8);
  }
  if ((flags & 1) == 0)
  {
    uint64_t result = [(AVPlayerItem *)self configuredTimeOffsetFromLive];
    CMTimeValue value = v13;
    CMTimeFlags flags = v15;
    CMTimeScale timescale = v14;
    CMTimeEpoch epoch = v16;
  }
  retstr->var0 = value;
  retstr->var1 = timescale;
  retstr->unsigned int var2 = flags;
  retstr->int64_t var3 = epoch;
  return result;
}

void __68__AVPlayerItem__updateConfiguredTimeOffsetFromLiveOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  memset(&v8[1], 0, sizeof(CMTime));
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 configuredTimeOffsetFromLive];
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v8[0] = v8[1];
  CFDictionaryRef v3 = CMTimeCopyAsDictionary(v8, v2);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, CFDictionaryRef))(v6 + 56);
  if (v7) {
    v7(FigBaseObject, *MEMORY[0x1E4F33BE0], v3);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (BOOL)_isReadyForInspectionOfRecommendedTimeOffsetFromLive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem__isReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVPlayerItem__isReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 228);
  return result;
}

- (void)_markAsReadyForInspectionOfRecommendedTimeOffsetFromLive
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVPlayerItem__markAsReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __72__AVPlayerItem__markAsReadyForInspectionOfRecommendedTimeOffsetFromLive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 228) = 1;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_recommendedTimeOffsetFromLive
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    uint64_t v6 = result;
    if ([(AVPlayerItem *)self _isReadyForInspectionOfRecommendedTimeOffsetFromLive]|| sOKToBlockWhenGettingValuesOfProperties == 1)
    {
      CFDictionaryRef v14 = 0;
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = *(void (**)(uint64_t, void, void, const __CFDictionary **))(v9 + 48);
      if (v10)
      {
        v10(FigBaseObject, *MEMORY[0x1E4F33AF0], *MEMORY[0x1E4F1CF80], &v14);
        CFDictionaryRef v11 = v14;
      }
      else
      {
        CFDictionaryRef v11 = 0;
      }
      CMTimeMakeFromDictionary(&v13, v11);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13.value;
      CFDictionaryRef v12 = v14;
      retstr->int64_t var3 = v13.epoch;
      if (v12) {
        CFRelease(v12);
      }
    }
    CFRelease(v6);
  }
  return result;
}

- (CMTime)recommendedTimeOffsetFromLive
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AVPlayerItem_recommendedTimeOffsetFromLive__block_invoke;
  block[3] = &unk_1E57B2110;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *(CMTime *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __45__AVPlayerItem_recommendedTimeOffsetFromLive__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  CFAllocatorRef v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = v2[29];
  v1[3].n128_u64[0] = v2[30].n128_u64[0];
  v1[2] = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentTimeWithOptionalFoldedTimebase:(SEL)a3
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3810000000;
  uint64_t v20 = &unk_194C75EBF;
  long long v21 = *MEMORY[0x1E4F1F9F8];
  uint64_t v22 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v7 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v7)
  {
    if (a4)
    {
      CMTimebaseGetTime(&v16, a4);
      *(CMTime *)(v18 + 4) = v16;
LABEL_10:
      CFRelease(v7);
      goto LABEL_11;
    }
    uint64_t v8 = v18;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    long long v11 = *(unsigned int (**)(OpaqueFigPlaybackItem *, uint64_t *))(v10 + 32);
    if (v11 && !v11(v7, v8 + 4)) {
      goto LABEL_10;
    }
  }
  seekQueue = self->_playerItem->seekQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__AVPlayerItem__currentTimeWithOptionalFoldedTimebase___block_invoke;
  v15[3] = &unk_1E57B2110;
  v15[4] = self;
  void v15[5] = &v17;
  dispatch_sync(seekQueue, v15);
  if (v7) {
    goto LABEL_10;
  }
LABEL_11:
  CMTime v13 = v18;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v18 + 2);
  retstr->int64_t var3 = v13[6];
  _Block_object_dispose(&v17, 8);
  return result;
}

__n128 __55__AVPlayerItem__currentTimeWithOptionalFoldedTimebase___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 1164);
  v1[3].n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1180);
  v1[2] = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUnfoldedTime
{
  if (self) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _currentTimeWithOptionalFoldedTimebase:0];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  return self;
}

- (CMTime)currentTime
{
  __n128 result = [(AVPlayerItem *)self _copyFoldedTimebase];
  uint64_t v6 = result;
  *(void *)&retstr->CMTimeScale timescale = 0;
  retstr->CMTimeEpoch epoch = 0;
  retstr->CMTimeValue value = 0;
  if (self) {
    __n128 result = [(AVPlayerItem *)self _currentTimeWithOptionalFoldedTimebase:result];
  }
  if (v6)
  {
    CFRelease(v6);
  }
  return result;
}

- (void)_cancelPendingSeekAndRegisterSeekID:(int)a3 withCompletionHandler:(id)a4
{
  MEMORY[0x199715030](self->_playerItem->seekIDMutex, a2);
  uint64_t v6 = self;
  playerItem = self->_playerItem;
  CMTimeEpoch epoch = (void (**)(void, void))playerItem->initialMaxSnapTime.epoch;
  if (epoch) {
    playerItem->initialMaxSnapTime.CMTimeEpoch epoch = 0;
  }
  uint64_t timescale = playerItem->initialMaxSnapTime.timescale;
  self->_playerItem->initialMaxSnapTime.uint64_t timescale = a3;
  if (a4)
  {
    self->_playerItem->initialMaxSnapTime.CMTimeEpoch epoch = [a4 copy];
    uint64_t v10 = self;
    uint64_t v6 = self;
  }
  MEMORY[0x199715040](v6->_playerItem->seekIDMutex);
  if (timescale) {
    [(AVPlayerItem *)self _postSeekCompletionNotificationWithSeekID:timescale andResult:0];
  }
  if (epoch)
  {
    epoch[2](epoch, 0);
  }
}

- (void)_postSeekCompletionNotificationWithSeekID:(int)a3 andResult:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = @"AVPlayerItemSeekDidCompleteNotification";
  }
  else {
    uint64_t v5 = @"AVPlayerItemSeekDidCancelNotification";
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", *(void *)&a3), @"AVPlayerItemSeekIDKey", 0);
  uint64_t v7 = [MEMORY[0x1E4F28EA0] notificationWithName:v5 object:self userInfo:v6];
  uint64_t v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (void)seekToTime:(CMTime *)time
{
  CMTime v3 = *time;
  [(AVPlayerItem *)self seekToTime:&v3 completionHandler:0];
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter
{
  uint64_t v9 = [(AVPlayerItem *)self makeSeekID];
  CMTime v12 = *time;
  CMTime v11 = *toleranceBefore;
  CMTime v10 = *toleranceAfter;
  [(AVPlayerItem *)self _seekToTime:&v12 toleranceBefore:&v11 toleranceAfter:&v10 seekID:v9 completionHandler:0];
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 seekID:(int)a6
{
  if (!a6)
  {
    CMTimeFlags v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"Invalid SeekID";
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)&a6;
  int v14 = FPSupport_SeekIDGetSource();
  if (v14 != FPSupport_SeekIDGetSource())
  {
    CMTimeFlags v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"seekID was not created by this player item";
LABEL_6:
    long long v18 = objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, v6, v7, v19), 0);
    objc_exception_throw(v18);
  }
  long long v23 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  long long v21 = *(_OWORD *)&a4->var0;
  int64_t v22 = a4->var3;
  long long v19 = *(_OWORD *)&a5->var0;
  int64_t v20 = a5->var3;
  [(AVPlayerItem *)self _seekToTime:&v23 toleranceBefore:&v21 toleranceAfter:&v19 seekID:v10 completionHandler:0];
}

- (void)seekToTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  uint64_t v7 = [(AVPlayerItem *)self makeSeekID];
  CMTime v12 = *time;
  long long v10 = *MEMORY[0x1E4F1FA10];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  long long v8 = v10;
  uint64_t v9 = v11;
  [(AVPlayerItem *)self _seekToTime:&v12 toleranceBefore:&v10 toleranceAfter:&v8 seekID:v7 completionHandler:completionHandler];
}

- (void)cancelPendingSeeks
{
  MEMORY[0x199715030](self->_playerItem->seekIDMutex, a2);
  playerItem = self->_playerItem;
  uint64_t timescale = playerItem->initialMaxSnapTime.timescale;
  MEMORY[0x199715040](playerItem->seekIDMutex);
  [(AVPlayerItem *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:timescale finished:0];
}

- (NSDate)currentDate
{
  CFAllocatorRef v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v2) {
    return 0;
  }
  CMTime v3 = v2;
  id v10 = 0;
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  long long v8 = *(unsigned int (**)(uint64_t, void, void, id *))(v6 + 48);
  if (v8 && !v8(FigBaseObject, *MEMORY[0x1E4F33978], *MEMORY[0x1E4F1CF80], &v10)) {
    uint64_t v7 = (NSDate *)v10;
  }
  else {
    uint64_t v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

- (BOOL)seekToDate:(NSDate *)date completionHandler:(void *)completionHandler
{
  uint64_t v7 = [(AVPlayerItem *)self makeSeekID];
  long long v8 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v8)
  {
    uint64_t v9 = v8;
    [(AVPlayerItem *)self _cancelPendingSeekAndRegisterSeekID:v7 withCompletionHandler:completionHandler];
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    CMTime v13 = *(unsigned int (**)(OpaqueFigPlaybackItem *, NSDate *, uint64_t))(v11 + 128);
    if (v13 && !v13(v9, date, v7))
    {
      BOOL v12 = 1;
    }
    else
    {
      [(AVPlayerItem *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:v7 finished:0];
      BOOL v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    [(AVPlayerItem *)self _postSeekCompletionNotificationWithSeekID:v7 andResult:0];
    if (completionHandler) {
      (*((void (**)(void *, void))completionHandler + 2))(completionHandler, 0);
    }
    return 0;
  }
  return v12;
}

- (BOOL)seekToDate:(NSDate *)date
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVPlayerItem *)self _copyStateDispatchQueue];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t IsNotCurrentDispatchQueue = _FigIsNotCurrentDispatchQueue();
    if (IsNotCurrentDispatchQueue)
    {
      if (dword_1EB2D3A00)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        uint64_t IsNotCurrentDispatchQueue = fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      AVPotentialRaceCondition(IsNotCurrentDispatchQueue);
    }
    dispatch_release(v6);
  }
  return -[AVPlayerItem seekToDate:completionHandler:](self, "seekToDate:completionHandler:", date, 0, v10, v11);
}

- (void)setInitialDate:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__AVPlayerItem_setInitialDate___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

id __31__AVPlayerItem_setInitialDate___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 792) = result;
  return result;
}

- (id)currentEstimatedDate
{
  CFAllocatorRef v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v2) {
    return 0;
  }
  CMTime v3 = v2;
  id v10 = 0;
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  long long v8 = *(unsigned int (**)(uint64_t, void, void, id *))(v6 + 48);
  if (v8 && !v8(FigBaseObject, *MEMORY[0x1E4F339B8], *MEMORY[0x1E4F1CF80], &v10)) {
    id v7 = v10;
  }
  else {
    id v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

- (void)setInitialEstimatedDate:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__AVPlayerItem_setInitialEstimatedDate___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

id __40__AVPlayerItem_setInitialEstimatedDate___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 800) = result;
  return result;
}

- (void)stepByCount:(NSInteger)stepCount
{
  AVTelemetryGenerateID();
  id v5 = [(AVPlayerItem *)self _player];
  uint64_t v6 = (const void *)[v5 _copyFigPlayer];
  id v7 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  long long v8 = v7;
  if (v7 && v6)
  {
    [v5 pause];
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void (**)(const void *, NSInteger))(v10 + 72);
    if (v11) {
      v11(v6, stepCount);
    }
LABEL_13:
    CFRelease(v8);
    if (!v6) {
      return;
    }
    goto LABEL_7;
  }
  if (v7) {
    goto LABEL_13;
  }
  if (!v6) {
    return;
  }
LABEL_7:
  CFRelease(v6);
}

void __62__AVPlayerItem__updateForwardPlaybackEndTimeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 forwardPlaybackEndTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F339A8], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __62__AVPlayerItem__updateReversePlaybackEndTimeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 reversePlaybackEndTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33B38], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)_updateTimeToPauseBufferingOnFigPlaybackItem
{
  CMTime v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__updateTimeToPauseBufferingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __60__AVPlayerItem__updateTimeToPauseBufferingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 _timeToPauseBuffering];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33BF0], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setTimeToPauseBuffering:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_setTimeToPauseBuffering___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateTimeToPauseBufferingOnFigPlaybackItem];
}

__n128 __40__AVPlayerItem_setTimeToPauseBuffering___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[22].n128_u64[0] = *(void *)(a1 + 56);
  v1[21] = result;
  return result;
}

- (void)_updateTimeToPausePlaybackOnFigPlaybackItem
{
  CMTime v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__AVPlayerItem__updateTimeToPausePlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __59__AVPlayerItem__updateTimeToPausePlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 _timeToPausePlayback];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33BF8], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setTimeToPausePlayback:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_setTimeToPausePlayback___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateTimeToPausePlaybackOnFigPlaybackItem];
}

__n128 __39__AVPlayerItem_setTimeToPausePlayback___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v1 + 376) = *(void *)(a1 + 56);
  *(__n128 *)(v1 + 360) = result;
  return result;
}

- (void)_updateSnapTimeToPausePlaybackOnFigPlaybackItem
{
  CMTime v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__AVPlayerItem__updateSnapTimeToPausePlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __63__AVPlayerItem__updateSnapTimeToPausePlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _snapTimeToPausePlayback]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  long long v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33B70];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setSnapTimeToPausePlayback:(unsigned __int8)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem_setSnapTimeToPausePlayback___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  unsigned __int8 v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateSnapTimeToPausePlaybackOnFigPlaybackItem];
}

uint64_t __43__AVPlayerItem_setSnapTimeToPausePlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 437) = *(unsigned char *)(result + 40) != 0;
  return result;
}

- (id)imageQueueInterpolationCurve
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_imageQueueInterpolationCurve__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVPlayerItem_imageQueueInterpolationCurve__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 832) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateImageQueueInterpolationCurveOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateImageQueueInterpolationCurveOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __68__AVPlayerItem__updateImageQueueInterpolationCurveOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) imageQueueInterpolationCurve];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F339F8];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (void)setImageQueueInterpolationCurve:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setImageQueueInterpolationCurve___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateImageQueueInterpolationCurveOnFigPlaybackItem];
}

uint64_t __48__AVPlayerItem_setImageQueueInterpolationCurve___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 840) = 1;

  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 832) = result;
  return result;
}

- (BOOL)blendsVideoFrames
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_blendsVideoFrames__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVPlayerItem_blendsVideoFrames__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 841);
  return result;
}

- (void)_updateBlendsVideoFramesOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateBlendsVideoFramesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __57__AVPlayerItem__updateBlendsVideoFramesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) blendsVideoFrames]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33918];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setBlendsVideoFrames:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setBlendsVideoFrames___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateBlendsVideoFramesOnFigPlaybackItem];
}

uint64_t __37__AVPlayerItem_setBlendsVideoFrames___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 842) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 841) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)appliesPerFrameHDRDisplayMetadata
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_appliesPerFrameHDRDisplayMetadata__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_appliesPerFrameHDRDisplayMetadata__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 843);
  return result;
}

- (void)_updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__AVPlayerItem__updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __73__AVPlayerItem__updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) appliesPerFrameHDRDisplayMetadata]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33AC8];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setAppliesPerFrameHDRDisplayMetadata:(BOOL)appliesPerFrameHDRDisplayMetadata
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_setAppliesPerFrameHDRDisplayMetadata___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = appliesPerFrameHDRDisplayMetadata;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAppliesPerFrameHDRDisplayMetadataOnFigPlaybackItem];
}

uint64_t __53__AVPlayerItem_setAppliesPerFrameHDRDisplayMetadata___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 844) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 843) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)reversesMoreVideoFramesInMemory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem_reversesMoreVideoFramesInMemory__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerItem_reversesMoreVideoFramesInMemory__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 744);
  return result;
}

- (void)_updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__AVPlayerItem__updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __71__AVPlayerItem__updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reversesMoreVideoFramesInMemory]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33B40];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setReversesMoreVideoFramesInMemory:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateReversesMoreVideoFramesInMemoryOnFigPlaybackItem];
}

uint64_t __51__AVPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 744) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 745) = 1;
  return result;
}

- (BOOL)aggressivelyCachesVideoFrames
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_aggressivelyCachesVideoFrames__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVPlayerItem_aggressivelyCachesVideoFrames__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 746);
  return result;
}

- (void)_updateAggressivelyCachesVideoFramesOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateAggressivelyCachesVideoFramesOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __69__AVPlayerItem__updateAggressivelyCachesVideoFramesOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) aggressivelyCachesVideoFrames]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33878];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setAggressivelyCachesVideoFrames:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setAggressivelyCachesVideoFrames___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAggressivelyCachesVideoFramesOnFigPlaybackItem];
}

uint64_t __49__AVPlayerItem_setAggressivelyCachesVideoFrames___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 747) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 746) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)decodesAllFramesDuringOrdinaryPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 748);
  return result;
}

- (void)_updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__AVPlayerItem__updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __78__AVPlayerItem__updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) decodesAllFramesDuringOrdinaryPlayback]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33980];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setDecodesAllFramesDuringOrdinaryPlayback:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateDecodesAllFramesDuringOrdinaryPlaybackOnFigPlaybackItem];
}

uint64_t __58__AVPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 749) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 748) = *(unsigned char *)(result + 40);
  return result;
}

- (OpaqueCMTimebase)_copyProxyUnfoldedTimebase
{
  return (OpaqueCMTimebase *)CFRetain(self->_playerItem->proxyUnfoldedTimebase);
}

- (OpaqueCMTimebase)_copyUnfoldedFigTimebase
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem__copyUnfoldedFigTimebase__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (OpaqueCMTimebase *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __40__AVPlayerItem__copyUnfoldedFigTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 216);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (OpaqueCMTimebase)unfoldedTimebase
{
  CFDictionaryRef v2 = [(AVPlayerItem *)self _copyProxyUnfoldedTimebase];
  char v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (CMTimebaseRef)timebase
{
  CFDictionaryRef v2 = [(AVPlayerItem *)self _copyProxyFoldedTimebase];
  char v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

void __31__AVPlayerItem__updateTimebase__block_invoke_5(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 208);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 208) = 0;
  }
}

void __31__AVPlayerItem__updateTimebase__block_invoke_6(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 208);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 208) = 0;
  }
}

- (void)_updateRTCReportingFlagsOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateRTCReportingFlagsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __57__AVPlayerItem__updateRTCReportingFlagsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int valuePtr = [*(id *)(a1 + 32) RTCReportingFlags];
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, CFNumberRef))(v4 + 56);
  if (v5) {
    v5(FigBaseObject, *MEMORY[0x1E4F33AE0], v1);
  }
  if (v1) {
    CFRelease(v1);
  }
}

- (void)setRTCReportingFlags:(unsigned int)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setRTCReportingFlags___block_invoke;
  v5[3] = &unk_1E57B39C8;
  void v5[4] = self;
  unsigned int v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateRTCReportingFlagsOnFigPlaybackItem];
}

uint64_t __37__AVPlayerItem_setRTCReportingFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 648) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setReportingCategory:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setReportingCategory___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateRTCReportingCategoryOnFigPlaybackItem];
}

void __37__AVPlayerItem_setReportingCategory___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 656);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 656) = [*(id *)(a1 + 40) copy];
}

- (void)_updateReportingValuesProperty:(id)a3 forKey:(id)a4
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVPlayerItem__updateReportingValuesProperty_forKey___block_invoke;
  block[3] = &unk_1E57B2138;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerItem *)self _updateReportingValuesOnFigPlaybackItem];
}

uint64_t __54__AVPlayerItem__updateReportingValuesProperty_forKey___block_invoke(void *a1)
{
  CFDictionaryRef v2 = *(void **)(*(void *)(a1[4] + 8) + 664);
  if (!v2)
  {
    *(void *)(*(void *)(a1[4] + 8) + 664) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFDictionaryRef v2 = *(void **)(*(void *)(a1[4] + 8) + 664);
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 setObject:v3 forKey:v4];
}

- (void)setReportingValueWithNumber:(id)a3 forKey:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CMTime v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Value is not a number.", v8, v9, v10, v11, v12, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  [(AVPlayerItem *)self _updateReportingValuesProperty:a3 forKey:a4];
}

- (void)setReportingValueWithString:(id)a3 forKey:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CMTime v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Value is not a string.", v8, v9, v10, v11, v12, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  [(AVPlayerItem *)self _updateReportingValuesProperty:a3 forKey:a4];
}

- (void)setLimitReadAhead:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayerItem_setLimitReadAhead___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateLimitReadAheadOnFigPlaybackItem];
}

uint64_t __34__AVPlayerItem_setLimitReadAhead___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 728) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)allowsExtendedReadAhead
{
  memset(&v6, 0, sizeof(v6));
  CMTimeMake(&v6, 50, 1);
  if (self) {
    [(AVPlayerItem *)self maximumForwardBufferDuration];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime v4 = v6;
  return CMTimeCompare(&time1, &v4) != 0;
}

- (void)setAllowsExtendedReadAhead:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, 50, 1);
  if (!v3)
  {
    *(_OWORD *)&v6.CMTimeValue value = *(_OWORD *)&v8.value;
    CMTimeEpoch epoch = v8.epoch;
LABEL_8:
    v6.CMTimeEpoch epoch = epoch;
    [(AVPlayerItem *)self setMaximumForwardBufferDuration:&v6];
    return;
  }
  if (self) {
    [(AVPlayerItem *)self maximumForwardBufferDuration];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime v6 = v8;
  if (!CMTimeCompare(&time1, &v6))
  {
    *(_OWORD *)&v6.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    goto LABEL_8;
  }
}

- (NSTimeInterval)preferredForwardBufferDuration
{
  double v2 = 0.0;
  if (self)
  {
    memset(&v4[1], 0, sizeof(CMTime));
    [(AVPlayerItem *)self maximumForwardBufferDuration];
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v4[0] = v4[1];
      return CMTimeGetSeconds(v4);
    }
  }
  return v2;
}

- (void)setPreferredForwardBufferDuration:(NSTimeInterval)preferredForwardBufferDuration
{
  memset(&v11, 0, sizeof(v11));
  if (preferredForwardBufferDuration < 0.0)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"preferredForwardBufferDuration >= 0.0"), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (preferredForwardBufferDuration <= 0.0) {
    CMTime v11 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  }
  else {
    CMTimeMakeWithSeconds(&v11, preferredForwardBufferDuration, 1000);
  }
  CMTime v10 = v11;
  [(AVPlayerItem *)self setMaximumForwardBufferDuration:&v10];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTrailingBufferDuration
{
  uint64_t v7 = 0;
  CMTime v8 = &v7;
  uint64_t v9 = 0x3810000000;
  CMTime v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AVPlayerItem_maximumTrailingBufferDuration__block_invoke;
  block[3] = &unk_1E57B2110;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __45__AVPlayerItem_maximumTrailingBufferDuration__block_invoke(uint64_t a1)
{
  id v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 572);
  v1[3].n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 588);
  v1[2] = result;
  return result;
}

- (void)_updateMaximumTrailingBufferDurationOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updateMaximumTrailingBufferDurationOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __69__AVPlayerItem__updateMaximumTrailingBufferDurationOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  memset(&v10, 0, sizeof(v10));
  id v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 maximumTrailingBufferDuration];
  }
  CMTime time1 = v10;
  CMTime v8 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &v8) < 0)
  {
    int v2 = -1;
  }
  else
  {
    CMTime time1 = v10;
    int v2 = (int)(CMTimeGetSeconds(&time1) + 0.5);
  }
  LODWORD(time1.value) = v2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &time1);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, CFNumberRef))(v6 + 56);
  if (v7) {
    v7(FigBaseObject, *MEMORY[0x1E4F33A58], v3);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (void)setMaximumTrailingBufferDuration:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setMaximumTrailingBufferDuration___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateMaximumTrailingBufferDurationOnFigPlaybackItem];
}

__n128 __49__AVPlayerItem_setMaximumTrailingBufferDuration___block_invoke(uint64_t a1)
{
  id v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 572);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(void *)(a1 + 56);
  __n128 *v1 = result;
  return result;
}

- (void)_updateMaximumForwardBufferDurationOnFigPlaybackItem
{
  CFNumberRef v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateMaximumForwardBufferDurationOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __68__AVPlayerItem__updateMaximumForwardBufferDurationOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 maximumForwardBufferDuration];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  Float64 valuePtr = CMTimeGetSeconds(&v7);
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat64Type, &valuePtr);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *(void (**)(uint64_t, void, CFNumberRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33AB0], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setMaximumForwardBufferDuration:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setMaximumForwardBufferDuration___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateMaximumForwardBufferDurationOnFigPlaybackItem];
}

__n128 __48__AVPlayerItem_setMaximumForwardBufferDuration___block_invoke(uint64_t a1)
{
  id v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 548);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(void *)(a1 + 56);
  __n128 *v1 = result;
  return result;
}

- (void)_updateAlwaysMonitorsPlayabilityOnFigPlaybackItem
{
  CFNumberRef v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AVPlayerItem__updateAlwaysMonitorsPlayabilityOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __65__AVPlayerItem__updateAlwaysMonitorsPlayabilityOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) alwaysMonitorsPlayability]) {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  CMTime v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33898];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setAlwaysMonitorsPlayability:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_setAlwaysMonitorsPlayability___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAlwaysMonitorsPlayabilityOnFigPlaybackItem];
}

uint64_t __45__AVPlayerItem_setAlwaysMonitorsPlayability___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 857) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem
{
  CFNumberRef v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__AVPlayerItem__updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __69__AVPlayerItem__updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  id v1 = (uint64_t *)MEMORY[0x1E4F33528];
  if ([*(id *)(a1 + 32) playbackLikelyToKeepUpTrigger] == 1) {
    id v1 = (uint64_t *)MEMORY[0x1E4F33530];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  CMTime v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33A28];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setPlaybackLikelyToKeepUpTrigger:(int64_t)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_setPlaybackLikelyToKeepUpTrigger___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updatePlaybackLikelyToKeepUpTriggerOnFigPlaybackItem];
}

uint64_t __49__AVPlayerItem_setPlaybackLikelyToKeepUpTrigger___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 864) = *(void *)(result + 40);
  return result;
}

- (void)_updateWillNeverSeekBackwardsHintOnFigPlaybackItem
{
  CFNumberRef v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__AVPlayerItem__updateWillNeverSeekBackwardsHintOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __66__AVPlayerItem__updateWillNeverSeekBackwardsHintOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) willNeverSeekBackwardsHint]) {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  else {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  CMTime v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33AE8];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setWillNeverSeekBackwardsHint:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_setWillNeverSeekBackwardsHint___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateWillNeverSeekBackwardsHintOnFigPlaybackItem];
}

uint64_t __46__AVPlayerItem_setWillNeverSeekBackwardsHint___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1288) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)savesDownloadedDataToDiskWhenDone
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_savesDownloadedDataToDiskWhenDone__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_savesDownloadedDataToDiskWhenDone__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 872);
  return result;
}

- (void)setSavesDownloadedDataToDiskWhenDone:(BOOL)a3
{
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CMTime v8[2] = __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    BOOL v9 = a3;
    void v8[4] = v5;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

uint64_t __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 872) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 873) = 1;
  return result;
}

uint64_t __53__AVPlayerItem_setSavesDownloadedDataToDiskWhenDone___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33B48];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (BOOL)_isFigItemConfigured
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItem__isFigItemConfigured__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayerItem__isFigItemConfigured__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 877);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfSavesDownloadedDataToDiskWhenDone
{
  return 0;
}

uint64_t __76__AVPlayerItem__updateContinuesPlayingDuringPrerollForSeekOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) continuesPlayingDuringPrerollForSeek]) {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33960];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

uint64_t __82__AVPlayerItem__updateContinuesPlayingDuringPrerollForRateChangeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) continuesPlayingDuringPrerollForRateChange]) {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33958];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (BOOL)usesIFrameOnlyPlaybackForHighRateScaledEdits
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEdits__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__AVPlayerItem_usesIFrameOnlyPlaybackForHighRateScaledEdits__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 753);
  return result;
}

- (void)_updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__AVPlayerItem__updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __84__AVPlayerItem__updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) usesIFrameOnlyPlaybackForHighRateScaledEdits]) {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33C10];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setUsesIFrameOnlyPlaybackForHighRateScaledEdits:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AVPlayerItem_setUsesIFrameOnlyPlaybackForHighRateScaledEdits___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateUsesIFrameOnlyPlaybackForHighRateScaledEditsOnFigPlaybackItem];
}

uint64_t __64__AVPlayerItem_setUsesIFrameOnlyPlaybackForHighRateScaledEdits___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 752) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 753) = *(unsigned char *)(result + 40);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumIntervalForIFrameOnlyPlayback
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerItem_minimumIntervalForIFrameOnlyPlayback__block_invoke;
  block[3] = &unk_1E57B2110;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __52__AVPlayerItem_minimumIntervalForIFrameOnlyPlayback__block_invoke(uint64_t a1)
{
  id v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 756);
  v1[3].n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 772);
  v1[2] = result;
  return result;
}

- (void)_updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__AVPlayerItem__updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __76__AVPlayerItem__updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 minimumIntervalForIFrameOnlyPlayback];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33A80], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setMinimumIntervalForIFrameOnlyPlayback:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_setMinimumIntervalForIFrameOnlyPlayback___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateMinimumIntervalForIFrameOnlyPlaybackOnFigPlaybackItem];
}

__n128 __56__AVPlayerItem_setMinimumIntervalForIFrameOnlyPlayback___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 780) = 1;
  id v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 756);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(void *)(a1 + 56);
  __n128 *v1 = result;
  return result;
}

- (float)speedThresholdForIFrameOnlyPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayerItem_speedThresholdForIFrameOnlyPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __51__AVPlayerItem_speedThresholdForIFrameOnlyPlayback__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 784);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem
{
  float v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__AVPlayerItem__updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __75__AVPlayerItem__updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) speedThresholdForIFrameOnlyPlayback];
  int valuePtr = v1;
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, CFNumberRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F339E8], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setSpeedThresholdForIFrameOnlyPlayback:(float)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_setSpeedThresholdForIFrameOnlyPlayback___block_invoke;
  v5[3] = &unk_1E57B39C8;
  void v5[4] = self;
  float v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateSpeedThresholdForIFrameOnlyPlaybackOnFigPlaybackItem];
}

float __55__AVPlayerItem_setSpeedThresholdForIFrameOnlyPlayback___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 788) = 1;
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 784) = result;
  return result;
}

- (void)_updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem
{
  float v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__AVPlayerItem__updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __86__AVPlayerItem__updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) refreshesClosedCaptionsImmediatelyAfterSeeking]) {
    int v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    int v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33BD8];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setRefreshesClosedCaptionsImmediatelyAfterSeeking:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_setRefreshesClosedCaptionsImmediatelyAfterSeeking___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateRefreshesClosedCaptionsImmediatelyAfterSeekingOnFigPlaybackItem];
}

uint64_t __66__AVPlayerItem_setRefreshesClosedCaptionsImmediatelyAfterSeeking___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 789) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_setAudioCurvesAccordingToInputParameters:(id)a3 forTrackID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [a3 _figAudioCurves];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    if (v4)
    {
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      CMTime v13 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, void, uint64_t))(v11 + 112);
      if (v13) {
        int v14 = v13(v8, v4, *MEMORY[0x1E4F33D78], v9);
      }
      else {
        int v14 = -12782;
      }
      *((_DWORD *)v17 + 6) = v14;
    }
    else
    {
      figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__AVPlayerItem__setAudioCurvesAccordingToInputParameters_forTrackID___block_invoke;
      block[3] = &unk_1E57B3B20;
      void block[5] = &v16;
      void block[6] = v8;
      void block[4] = v9;
      dispatch_sync(figPlaybackItemSetterQueue, block);
    }
    _Block_object_dispose(&v16, 8);
    CFRelease(v8);
  }
}

uint64_t __69__AVPlayerItem__setAudioCurvesAccordingToInputParameters_forTrackID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, @"AudioCurves", v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setAudioProcessingEffectsAccordingToInputParameters:(id)a3 forTrackID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend(a3, "effects", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        CMTime v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
        if ([v13 isMemberOfClass:objc_opt_class()])
        {
          objc_msgSend(v7, "addObject:", objc_msgSend(v13, "_figIdentifier"));
          objc_msgSend(v7, "addObject:", objc_msgSend(v13, "_figAudioProperties"));
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  if ([v7 count])
  {
    figPlaybackItem = self->_playerItem->figPlaybackItem;
    if (v4)
    {
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      int64_t v20 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, void, void *))(v16 + 112);
      if (v20) {
        v20(figPlaybackItem, v4, *MEMORY[0x1E4F33D88], v7);
      }
    }
    else
    {
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
      long long v21 = *(void (**)(uint64_t, void, void *))(v19 + 56);
      if (v21) {
        v21(FigBaseObject, *MEMORY[0x1E4F338C8], v7);
      }
    }
  }
}

- (void)_setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3 forTrackID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  figPlaybackItem = self->_playerItem->figPlaybackItem;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, opaqueMTAudioProcessingTap *))(v8 + 112);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33D80];
    v9(figPlaybackItem, v4, v10, a3);
  }
}

- (void)_setAudioTimePitchAlgorithm:(id)a3 forTrackID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  figPlaybackItem = self->_playerItem->figPlaybackItem;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, id))(v8 + 112);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F33E00];
    v9(figPlaybackItem, v4, v10, a3);
  }
}

- (void)_setAudioEffectParameters:(id)a3 previousEffects:(id)a4 forTrackID:(int)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke;
  v71[3] = &unk_1E57B4058;
  v71[4] = v8;
  [a4 enumerateObjectsUsingBlock:v71];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke_2;
  v70[3] = &unk_1E57B4058;
  id v60 = (id)v8;
  v70[4] = v8;
  [a3 enumerateObjectsUsingBlock:v70];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = a3;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v67;
    uint64_t v58 = *MEMORY[0x1E4F33E18];
    uint64_t v57 = *MEMORY[0x1E4F33E28];
    uint64_t v56 = *MEMORY[0x1E4F33E20];
    uint64_t v12 = *MEMORY[0x1E4F33E10];
    uint64_t v55 = *MEMORY[0x1E4F33DF0];
    uint64_t v54 = (__CFString *)*MEMORY[0x1E4F33DF8];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v67 != v11) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v66 + 1) + 8 * v13);
        if ([v14 isMemberOfClass:objc_opt_class()])
        {
          v76[0] = MEMORY[0x1E4F1CC38];
          v75[0] = v58;
          v75[1] = v57;
          v76[1] = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v14, "minimumCutOffFrequency"));
          v75[2] = v56;
          v76[2] = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v14, "maximumCutOffFrequency"));
          v75[3] = v12;
          uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
          [v14 bypassThreshold];
          v76[3] = objc_msgSend(v15, "numberWithFloat:");
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:4];
          figPlaybackItem = self->_playerItem->figPlaybackItem;
          uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v18) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = 0;
          }
          long long v24 = *(void (**)(OpaqueFigPlaybackItem *, void, uint64_t, uint64_t))(v19 + 112);
          if (v24) {
            v24(figPlaybackItem, a5, v55, v16);
          }
          long long v25 = self->_playerItem->figPlaybackItem;
          uint64_t v26 = (void *)MEMORY[0x1E4F28ED0];
          objc_msgSend(v14, "sweepValue", v54);
          uint64_t v21 = [v26 numberWithDouble:v27];
          uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v28) {
            uint64_t v29 = v28;
          }
          else {
            uint64_t v29 = 0;
          }
          uint64_t v30 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v29 + 112);
          if (v30)
          {
            uint64_t v31 = v25;
            uint64_t v32 = a5;
            uint64_t v33 = v54;
LABEL_23:
            v30(v31, v32, v33, v21);
          }
        }
        else if ([v14 isMemberOfClass:objc_opt_class()])
        {
          int64_t v20 = self->_playerItem->figPlaybackItem;
          uint64_t v21 = [v14 data];
          uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v23 = v22 ? v22 : 0;
          uint64_t v30 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v23 + 112);
          if (v30)
          {
            uint64_t v31 = v20;
            uint64_t v32 = a5;
            uint64_t v33 = @"CinematicAudioParameters";
            goto LABEL_23;
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v10);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v34 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v62, v74, 16, v54);
  if (!v34) {
    return;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)v63;
  uint64_t v37 = *MEMORY[0x1E4F33E18];
  objc_super v38 = (__CFString *)*MEMORY[0x1E4F33DF0];
  uint64_t v39 = MEMORY[0x1E4F1CC28];
  do
  {
    uint64_t v40 = 0;
    do
    {
      if (*(void *)v63 != v36) {
        objc_enumerationMutation(v60);
      }
      uint64_t v41 = *(void *)(*((void *)&v62 + 1) + 8 * v40);
      if (v41 == objc_opt_class())
      {
        uint64_t v72 = v37;
        uint64_t v73 = v39;
        uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        uint64_t v46 = self->_playerItem->figPlaybackItem;
        uint64_t v47 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v47) {
          uint64_t v48 = v47;
        }
        else {
          uint64_t v48 = 0;
        }
        uint64_t v49 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v48 + 112);
        if (v49)
        {
          uint64_t v50 = v46;
          uint64_t v51 = a5;
          uint64_t v52 = v38;
          uint64_t v53 = v45;
LABEL_43:
          v49(v50, v51, v52, v53);
        }
      }
      else if (v41 == objc_opt_class())
      {
        uint64_t v42 = self->_playerItem->figPlaybackItem;
        uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v44 = v43 ? v43 : 0;
        uint64_t v49 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v44 + 112);
        if (v49)
        {
          uint64_t v50 = v42;
          uint64_t v51 = a5;
          uint64_t v52 = @"CinematicAudioParameters";
          uint64_t v53 = 0;
          goto LABEL_43;
        }
      }
      ++v40;
    }
    while (v35 != v40);
    uint64_t v35 = [v60 countByEnumeratingWithState:&v62 objects:v74 count:16];
  }
  while (v35);
}

uint64_t __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_opt_class();
  return [v1 addObject:v2];
}

uint64_t __69__AVPlayerItem__setAudioEffectParameters_previousEffects_forTrackID___block_invoke_2(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_opt_class();
  return [v1 removeObject:v2];
}

uint64_t __28__AVPlayerItem_setAudioMix___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyCurrentAudioMix];
}

- (void)_setDelayPreparingItemForTestingOnly:(double)a3
{
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke;
  block[3] = &unk_1E57B2228;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    Float64 = (const void *)FigCFNumberCreateFloat64();
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = v5;
    void v9[5] = Float64;
    dispatch_sync(figPlaybackItemSetterQueue, v9);
    if (Float64) {
      CFRelease(Float64);
    }
    CFRelease(v5);
  }
}

double __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 1480) = result;
  return result;
}

uint64_t __53__AVPlayerItem__setDelayPreparingItemForTestingOnly___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F338A8];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (double)_delayPreparingItemForTestingOnly
{
  float v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  figPlaybackItemAccessorQueue = self->_playerItem->figPlaybackItemAccessorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVPlayerItem__delayPreparingItemForTestingOnly__block_invoke;
  block[3] = &unk_1E57B40A0;
  void block[5] = &v9;
  void block[6] = v3;
  void block[4] = &v13;
  dispatch_sync(figPlaybackItemAccessorQueue, block);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v5 = (const void *)v14[3];
  if (v5) {
    CFRelease(v5);
  }
  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __49__AVPlayerItem__delayPreparingItemForTestingOnly__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  double v6 = *(void (**)(uint64_t, void, void, uint64_t))(v5 + 48);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F338A8], *MEMORY[0x1E4F1CF80], v2 + 24);
  }
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    uint64_t result = FigCFNumberGetFloat64();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  }
  return result;
}

- (void)_applyCurrentVideoComposition
{
  id v16 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  CMTimeValue value = 0;
  id v11 = 0;
  if (self->_playerItem->figPlaybackItem)
  {
    [(AVPlayerItem *)self _getVideoComposition:&v16 customVideoCompositorSession:&v15 figVideoCompositor:&value];
    objc_msgSend(v16, "videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:", v15, -[AVPlayerItem _enabledTrackFormatDescriptions](self, "_enabledTrackFormatDescriptions"), &v14, &v13, &v12, &v11);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      uint64_t v4 = Mutable;
      if (v16) {
        [v16 frameDuration];
      }
      FigCFDictionarySetCMTime();
      [v16 sourceTrackIDForFrameTiming];
      FigCFDictionarySetInt32();
      [v16 renderSize];
      CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v17);
      FigCFDictionarySetValue();
      [v16 renderScale];
      FigCFDictionarySetFloat();
      FigCFDictionarySetValue();
      FigCFDictionarySetValue();
      FigCFDictionarySetValue();
      [v11 isEqual:@"PerFrameHDRDisplayMetadataPolicy_Generate"];
      FigCFDictionarySetValue();
      [v16 _serializableInstructions];
      FigCFDictionarySetValue();
      [v16 sourceSampleDataTrackIDs];
      FigCFDictionarySetValue();
      AVVideoCompositionSerializeSourceTrackWindows((void *)[v16 sourceVideoTrackWindowsForTrackIDs]);
      FigCFDictionarySetValue();
      AVVideoCompositionSerializeSourceTrackWindows((void *)[v16 sourceSampleDataTrackWindowsForTrackIDs]);
      FigCFDictionarySetValue();
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F33C38], value);
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(void (**)(uint64_t, void, __CFDictionary *))(v8 + 56);
      if (v9) {
        v9(FigBaseObject, *MEMORY[0x1E4F33C30], v4);
      }
      CFRelease(v4);
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
    }
  }
  if (value) {
    CFRelease(value);
  }
}

void __36__AVPlayerItem_setVideoComposition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(v2[1] + 120))
  {
    id v5 = 0;
    uint64_t v6 = 0;
    CFTypeRef cf = 0;
    [v2 _getVideoComposition:&v6 customVideoCompositorSession:&v5 figVideoCompositor:&cf];
    if (v6)
    {
      uint64_t v3 = 0;
      if (v5 && ![v5 commitCustomVideoCompositorPropertiesAndReturnError:&v3]) {
        [*(id *)(a1 + 32) _changeStatusToFailedWithError:v3];
      }
      else {
        objc_msgSend(*(id *)(a1 + 32), "_applyCurrentVideoComposition", v3);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _setVideoCompositionInstructions:0];
      [*(id *)(a1 + 32) _setVideoCompositor:cf];
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (void)_setVideoCompositionFrameDuration:(id *)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime v9 = *(CMTime *)a3;
    CFDictionaryRef v4 = CMTimeCopyAsDictionary(&v9, v3);
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, CFDictionaryRef))(v7 + 56);
    if (v8) {
      v8(FigBaseObject, *MEMORY[0x1E4F33C58], v4);
    }
    CFRelease(v4);
  }
}

- (void)_setVideoCompositionSourceTrackIDForFrameTiming:(int)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C88];
      v7(FigBaseObject, v8, v3);
    }
  }
}

- (void)_setVideoCompositionRenderSize:(CGSize)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(a3);
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, CFDictionaryRef))(v6 + 56);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33C68], DictionaryRepresentation);
    }
    CFRelease(DictionaryRepresentation);
  }
}

- (void)_setVideoCompositionRenderScale:(float)a3
{
  float valuePtr = a3;
  if (self->_playerItem->figPlaybackItem)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, CFNumberRef))(v6 + 56);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33C70], v3);
    }
    CFRelease(v3);
  }
}

- (void)_setVideoCompositionColorPrimaries:(id)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, id))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C40];
      v7(FigBaseObject, v8, a3);
    }
  }
}

- (void)_setVideoCompositionColorYCbCrMatrix:(id)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, id))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C50];
      v7(FigBaseObject, v8, a3);
    }
  }
}

- (void)_setVideoCompositionColorTransferFunction:(id)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, id))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C48];
      v7(FigBaseObject, v8, a3);
    }
  }
}

- (void)_setVideoCompositionHDRDisplayMetadataPolicy:(id)a3
{
  if (!self->_playerItem->figPlaybackItem) {
    return;
  }
  int v3 = [a3 isEqual:@"PerFrameHDRDisplayMetadataPolicy_Generate"];
  uint64_t v4 = *MEMORY[0x1E4F33C60];
  if (v3)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v10)
    {
      id v11 = (uint64_t *)MEMORY[0x1E4F34B10];
LABEL_13:
      uint64_t v12 = *v11;
      v10(FigBaseObject, v4, v12);
    }
  }
  else
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 56);
    if (v10)
    {
      id v11 = (uint64_t *)MEMORY[0x1E4F34B18];
      goto LABEL_13;
    }
  }
}

- (void)_setVideoCompositionInstructions:(id)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, id))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C28];
      v7(FigBaseObject, v8, a3);
    }
  }
}

- (void)_setVideoCompositionSourceSampleDataTrackIDs:(id)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, id))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C78];
      v7(FigBaseObject, v8, a3);
    }
  }
}

- (void)_setVideoCompositor:(void *)a3
{
  if (self->_playerItem->figPlaybackItem)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, void *))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F33C38];
      v7(FigBaseObject, v8, a3);
    }
  }
}

- (id)customVideoCompositor
{
  AVTelemetryGenerateID();
  id v4 = 0;
  [(AVPlayerItem *)self _getVideoComposition:0 customVideoCompositorSession:&v4 figVideoCompositor:0];
  return (id)[v4 customVideoCompositor];
}

- (void)setSeekingWaitsForVideoCompositionRendering:(BOOL)seekingWaitsForVideoCompositionRendering
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AVPlayerItem_setSeekingWaitsForVideoCompositionRendering___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v6 = seekingWaitsForVideoCompositionRendering;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(AVPlayerItem *)self _updateSeekingWaitsForVideoCompositionRenderingOnFigPlaybackItem];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __60__AVPlayerItem_setSeekingWaitsForVideoCompositionRendering___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (v1 != *(unsigned __int8 *)(v2 + 512))
  {
    *(unsigned char *)(v2 + 512) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem
{
  int v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__AVPlayerItem__updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __86__AVPlayerItem__updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) usesMinimalLatencyForVideoCompositionRendering]) {
    int v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    int v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33C18];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)setUsesMinimalLatencyForVideoCompositionRendering:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVPlayerItem_setUsesMinimalLatencyForVideoCompositionRendering___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v6 = a3;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(AVPlayerItem *)self _updateUsesMinimalLatencyForVideoCompositionRenderingOnFigPlaybackItem];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __66__AVPlayerItem_setUsesMinimalLatencyForVideoCompositionRendering___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 856) != v2)
  {
    *(unsigned char *)(v1 + 856) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfUsesMinimalLatencyForVideoCompositionRendering
{
  return 0;
}

- (void)_updateTextHighlightArrayOnFigPlaybackItem
{
  int v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__AVPlayerItem__updateTextHighlightArrayOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __58__AVPlayerItem__updateTextHighlightArrayOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) textHighlightArray];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33BC8];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayerItem_setAudioTimePitchAlgorithm___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  void v5[5] = audioTimePitchAlgorithm;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateFigTimePitchAlgorithmOnFigPlaybackItem];
}

CFTypeRef __43__AVPlayerItem_setAudioTimePitchAlgorithm___block_invoke(uint64_t a1)
{
  int v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 536);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 536) = 0;
  }
  CFTypeRef result = *(CFTypeRef *)(a1 + 40);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 536) = result;
  return result;
}

- (BOOL)isPlaybackLikelyToKeepUp
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_isPlaybackLikelyToKeepUp__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVPlayerItem_isPlaybackLikelyToKeepUp__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 994);
  return result;
}

- (float)progressTowardsPlaybackLikelyToKeepUp
{
  float valuePtr = 0.0;
  int v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v2) {
    return 0.0;
  }
  char v3 = v2;
  CFNumberRef number = 0;
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, void, void, CFNumberRef *))(v6 + 48);
  if (v8)
  {
    v8(FigBaseObject, *MEMORY[0x1E4F33AC0], *MEMORY[0x1E4F1CF80], &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberFloatType, &valuePtr);
      CFRelease(number);
    }
  }
  CFRelease(v3);
  return valuePtr;
}

- (void)setCanUseNetworkResourcesForLiveStreamingWhilePaused:(BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayerItem_setCanUseNetworkResourcesForLiveStreamingWhilePaused___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = canUseNetworkResourcesForLiveStreamingWhilePaused;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateCanUseNetworkResourcesForLiveStreamingWhilePausedOnFigPlaybackItem];
}

uint64_t __69__AVPlayerItem_setCanUseNetworkResourcesForLiveStreamingWhilePaused___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 544) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)startsOnFirstEligibleVariant
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_startsOnFirstEligibleVariant__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVPlayerItem_startsOnFirstEligibleVariant__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8)
                                                                             + 616) == 1;
  return result;
}

- (void)_updateStartsOnFirstEligibleVariantOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AVPlayerItem__updateStartsOnFirstEligibleVariantOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __68__AVPlayerItem__updateStartsOnFirstEligibleVariantOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) startsOnFirstEligibleVariant]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33B88];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)setStartsOnFirstEligibleVariant:(BOOL)startsOnFirstEligibleVariant
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_setStartsOnFirstEligibleVariant___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = startsOnFirstEligibleVariant;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateStartsOnFirstEligibleVariantOnFigPlaybackItem];
}

uint64_t __48__AVPlayerItem_setStartsOnFirstEligibleVariant___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 616) = *(unsigned __int8 *)(result + 40);
  return result;
}

- (id)playabilityMetrics
{
  id v9 = 0;
  id result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    id v3 = result;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, void, id *))(v6 + 48);
    if (v7)
    {
      v7(FigBaseObject, *MEMORY[0x1E4F33A98], *MEMORY[0x1E4F1CF80], &v9);
      if (v9) {
        id v8 = v9;
      }
    }
    CFRelease(v3);
    return v9;
  }
  return result;
}

- (id)_seekableTimeRanges
{
  CFTypeRef cf = 0;
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3
    && ([(AVPlayerItem *)self _isReadyForBasicInspection]
     || [(AVPlayerItem *)self _isReadyForInspectionOfDuration]
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && ((uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(), (v5 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v6 = 0)
      : (uint64_t v6 = v5),
        (uint64_t v7 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48)) != 0))
  {
    v7(FigBaseObject, *MEMORY[0x1E4F33B50], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v8 = cf;
  }
  else
  {
    CFTypeRef v8 = 0;
  }
  id v9 = [(AVPlayerItem *)self _seekableTimeRangesFromFPSeekableTimeIntervals:v8];
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v9;
}

- (NSArray)seekableTimeRanges
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__AVPlayerItem_seekableTimeRanges__block_invoke;
  v7[3] = &unk_1E57B2110;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  id v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__AVPlayerItem_seekableTimeRanges__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1016) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (double)seekableTimeRangesLastModifiedTime
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerItem_seekableTimeRangesLastModifiedTime__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __50__AVPlayerItem_seekableTimeRangesLastModifiedTime__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 1024);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_loadedTimeRanges
{
  CFTypeRef cf = 0;
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3
    && ((uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(), (v5 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v6 = 0)
      : (uint64_t v6 = v5),
        (uint64_t v7 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48)) != 0))
  {
    v7(FigBaseObject, *MEMORY[0x1E4F33AA0], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v8 = cf;
  }
  else
  {
    CFTypeRef v8 = 0;
  }
  id v9 = [(AVPlayerItem *)self _loadedTimeRangesFromFPPlaybableTimeIntervals:v8];
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v9;
}

- (NSArray)loadedTimeRanges
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__AVPlayerItem_loadedTimeRanges__block_invoke;
  v7[3] = &unk_1E57B2110;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  double v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __32__AVPlayerItem_loadedTimeRanges__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1032) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setGaplessInfo:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVPlayerItem_setGaplessInfo___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = a3;
  void block[5] = self;
  void block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    [(AVPlayerItem *)self _updatePlaybackPropertiesOnFigPlaybackItem];
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __31__AVPlayerItem_setGaplessInfo___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 672);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    uint64_t result = [*(id *)(v2 + 32) copy];
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 672) = result;
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (id)configurationGroup
{
  uint64_t v2 = @"Default";
  uint64_t v10 = @"Default";
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, void, __CFString **))(v7 + 48);
    if (v8) {
      v8(FigBaseObject, *MEMORY[0x1E4F33950], *MEMORY[0x1E4F1CF80], &v10);
    }
    CFRelease(v4);
    return v10;
  }
  return v2;
}

- (int64_t)variantIndex
{
  int64_t valuePtr = -1;
  double v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    id v4 = v3;
    CFNumberRef number = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    char v9 = *(unsigned int (**)(uint64_t, void, void, CFNumberRef *))(v7 + 48);
    if (v9)
    {
      if (v9(FigBaseObject, *MEMORY[0x1E4F33AD0], *MEMORY[0x1E4F1CF80], &number)) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = number == 0;
      }
      if (!v10)
      {
        CFNumberGetValue(number, kCFNumberNSIntegerType, &valuePtr);
        CFRelease(number);
      }
    }
    CFRelease(v4);
    return valuePtr;
  }
  else if ((uint64_t)self->_playerItem->rampInOutInfo < 0)
  {
    return -1;
  }
  else
  {
    return (int64_t)self->_playerItem->rampInOutInfo;
  }
}

- (double)liveUpdateInterval
{
  double valuePtr = 0.0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v2) {
    return 0.0;
  }
  double v3 = v2;
  CFNumberRef number = 0;
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v8 = *(unsigned int (**)(uint64_t, void, void, CFNumberRef *))(v6 + 48);
  if (v8)
  {
    if (v8(FigBaseObject, *MEMORY[0x1E4F33A30], *MEMORY[0x1E4F1CF80], &number)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = number == 0;
    }
    if (!v9)
    {
      CFNumberGetValue(number, kCFNumberDoubleType, &valuePtr);
      CFRelease(number);
    }
  }
  CFRelease(v3);
  return valuePtr;
}

- (void)_quietlySetVariantIndex:(int64_t)a3
{
  int64_t valuePtr = a3;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberNSIntegerType, &valuePtr);
  if (v3)
  {
    CFNumberRef v4 = v3;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, CFNumberRef))(v7 + 56);
    if (v8) {
      v8(FigBaseObject, *MEMORY[0x1E4F33AD0], v4);
    }
    CFRelease(v4);
  }
}

- (void)setVariantIndex:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0)
  {
    playerItem = self->_playerItem;
    if (playerItem->figPlaybackItem) {
      -[AVPlayerItem _quietlySetVariantIndex:](self, "_quietlySetVariantIndex:");
    }
    else {
      playerItem->rampInOutInfo = (NSDictionary *)a3;
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversOfVariantIndex
{
  return 0;
}

- (id)currentStableVariantID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = __Block_byref_object_copy__7;
  BOOL v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem_currentStableVariantID__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AVPlayerItem_currentStableVariantID__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1384) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateAdjustTargetLevelOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    CFNumberRef v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateAdjustTargetLevelOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __57__AVPlayerItem__updateAdjustTargetLevelOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) adjustTargetLevel];
  int valuePtr = v1;
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, CFNumberRef))(v6 + 56);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33868], v3);
    }
    CFRelease(v3);
  }
}

- (void)setAdjustTargetLevel:(float)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setAdjustTargetLevel___block_invoke;
  v5[3] = &unk_1E57B39C8;
  void v5[4] = self;
  float v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAdjustTargetLevelOnFigPlaybackItem];
}

float __37__AVPlayerItem_setAdjustTargetLevel___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 704) = 1;
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 708) = result;
  return result;
}

- (float)adjustTargetLevel
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem_adjustTargetLevel__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __33__AVPlayerItem_adjustTargetLevel__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 708);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateAdjustCompressionProfileOnFigPlaybackItem
{
  float v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    CFNumberRef v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__AVPlayerItem__updateAdjustCompressionProfileOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __64__AVPlayerItem__updateAdjustCompressionProfileOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  int valuePtr = [*(id *)(a1 + 32) adjustCompressionProfile];
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, CFNumberRef))(v5 + 56);
    if (v6) {
      v6(FigBaseObject, *MEMORY[0x1E4F33860], v2);
    }
    CFRelease(v2);
  }
}

- (void)setAdjustCompressionProfile:(unsigned int)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_setAdjustCompressionProfile___block_invoke;
  v5[3] = &unk_1E57B39C8;
  void v5[4] = self;
  unsigned int v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAdjustCompressionProfileOnFigPlaybackItem];
}

uint64_t __44__AVPlayerItem_setAdjustCompressionProfile___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 712) = 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 716) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)adjustCompressionProfile
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_adjustCompressionProfile__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVPlayerItem_adjustCompressionProfile__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 716);
  return result;
}

- (id)_mediaOptionsSelectedByClientForKey:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  BOOL v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerItem__mediaOptionsSelectedByClientForKey___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a3;
  void block[6] = &v7;
  void block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __52__AVPlayerItem__mediaOptionsSelectedByClientForKey___block_invoke(void *a1)
{
  id result = (id)[*(id *)(*(void *)(a1[4] + 8) + 1392) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeMediaOptionsSelectedByClient
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVPlayerItem__removeMediaOptionsSelectedByClient__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __51__AVPlayerItem__removeMediaOptionsSelectedByClient__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1392) removeAllObjects];
}

- (BOOL)_isFigAssetReadyForInspectionOfMediaSelectionOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptions__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVPlayerItem__isFigAssetReadyForInspectionOfMediaSelectionOptions__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 227);
  return result;
}

- (void)_clearCachedMediaSelectionGroup:(id)a3
{
}

- (BOOL)_hasSelectionInCachedMediaSelectionGroup:(id)a3
{
  return [(AVPlayerItem *)self _mediaOptionsSelectedByClientForKey:a3] != 0;
}

- (id)_propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  CFTypeRef cf = 0;
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
  if (v8
    && !v8(FigBaseObject, *MEMORY[0x1E4F33B60], *MEMORY[0x1E4F1CF80], &cf)
    && (long long v21 = 0u,
        long long v22 = 0u,
        long long v19 = 0u,
        long long v20 = 0u,
        char v9 = (void *)cf,
        (uint64_t v10 = [(id)cf countByEnumeratingWithState:&v19 objects:v24 count:16]) != 0))
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    uint64_t v13 = *MEMORY[0x1E4F34718];
    uint64_t v14 = *MEMORY[0x1E4F34708];
LABEL_8:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
      if (objc_msgSend(a3, "_matchesGroupID:mediaType:", objc_msgSend(v16, "objectForKey:", v14), objc_msgSend(v16, "objectForKey:", v13)))break; {
      if (v11 == ++v15)
      }
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        id v17 = 0;
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }
    id v17 = v16;
    if (v4) {
      goto LABEL_17;
    }
  }
  else
  {
    id v17 = 0;
LABEL_16:
    if (v4) {
LABEL_17:
    }
      CFRelease(v4);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v17;
}

- (void)selectMediaOptionAutomaticallyInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  AVTelemetryGenerateID();
  if ([(AVAsset *)[(AVPlayerItem *)self asset] isEqual:[(AVMediaSelectionGroup *)mediaSelectionGroup asset]])
  {
    if (dword_1EB2D3A00)
    {
      int v9 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke;
    block[3] = &unk_1E57B2098;
    void block[4] = self;
    void block[5] = mediaSelectionGroup;
    dispatch_sync(figPlaybackItemSetterQueue, block);
  }
}

void __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke(uint64_t a1)
{
  CFNumberRef v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlaybackItem];
  char v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = *(NSObject **)(v3[1] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke_2;
    block[3] = &unk_1E57B1E80;
    void block[4] = v3;
    av_readwrite_dispatch_queue_write(v4, block);
    id v5 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_propertyListForMediaSelection:forGroup:", 0, *(void *)(a1 + 40)), "mutableCopy");
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v5 setObject:v6 forKey:*MEMORY[0x1E4F33CD8]];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v12 = *(void (**)(uint64_t, void, uint64_t))(v10 + 56);
    if (v12) {
      v12(FigBaseObject, *MEMORY[0x1E4F33B60], v7);
    }
    [*(id *)(a1 + 32) _clearCachedMediaSelectionGroup:*(void *)(a1 + 40)];
    CFRelease(v2);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    [v3 _clearCachedMediaSelectionGroup:v11];
  }
}

void __68__AVPlayerItem_selectMediaOptionAutomaticallyInMediaSelectionGroup___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1104) = 0;
}

- (BOOL)playerAppliesAutomaticMediaSelectionToGroup:(id)a3
{
  if (!-[AVAsset isEqual:](-[AVPlayerItem asset](self, "asset"), "isEqual:", [a3 asset])) {
    return 0;
  }
  if ([(AVPlayerItem *)self _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection])
  {
    id v5 = [(AVPlayerItem *)self _propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:a3];
    uint64_t v6 = (void *)[v5 objectForKey:*MEMORY[0x1E4F33CE0]];
    return [v6 BOOLValue];
  }
  if ([(AVPlayerItem *)self _hasSelectionInCachedMediaSelectionGroup:a3]) {
    return 0;
  }
  id v8 = [(AVPlayerItem *)self _player];
  return [v8 appliesMediaSelectionCriteriaAutomatically];
}

- (AVMediaSelectionOption)selectedMediaOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  if (![(AVAsset *)[(AVPlayerItem *)self asset] isEqual:[(AVMediaSelectionGroup *)mediaSelectionGroup asset]])return 0; {
  if ([(AVPlayerItem *)self _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection])
  }
  {
    id v5 = [(AVMediaSelectionGroup *)mediaSelectionGroup mediaSelectionOptionWithPropertyList:[(AVPlayerItem *)self _propertyListForSelectedMediaOptionUsingFigSelectedMediaArrayObtainedFromGroup:mediaSelectionGroup]];
    if ([(AVMediaSelectionOption *)v5 _representsNilSelection]) {
      return 0;
    }
    else {
      return v5;
    }
  }
  else
  {
    uint64_t v7 = [(AVPlayerItem *)self _mediaOptionsSelectedByClientForKey:mediaSelectionGroup];
    if (v7)
    {
      id v8 = v7;
      if ([(AVMediaSelectionOption *)v7 _representsNilSelection]) {
        return 0;
      }
      else {
        return v8;
      }
    }
    else
    {
      return [(AVMediaSelectionGroup *)mediaSelectionGroup defaultOption];
    }
  }
}

- (id)_figSelectedMediaArray
{
  id v9 = 0;
  CFNumberRef v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v2)
  {
    char v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, void, id *))(v6 + 48);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33B60], *MEMORY[0x1E4F1CF80], &v9);
    }
    CFRelease(v3);
    CFNumberRef v2 = (OpaqueFigPlaybackItem *)v9;
  }
  return v2;
}

- (id)_currentMediaSelectionFromFigSelectedMediaArray:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v21 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v19 = [(AVPlayerItem *)self _isFigAssetReadyForInspectionOfMediaSelectionOptions];
  if (v19)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = [(AVAsset *)self->_playerItem->asset availableMediaCharacteristicsWithMediaSelectionOptions];
    uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v30;
      uint64_t v5 = *MEMORY[0x1E4F34718];
      uint64_t v6 = *MEMORY[0x1E4F34708];
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v7;
          id v8 = [(AVAsset *)[(AVPlayerItem *)self asset] mediaSelectionGroupForMediaCharacteristic:*(void *)(*((void *)&v29 + 1) + 8 * v7)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (long long v27 = 0u,
                long long v28 = 0u,
                long long v25 = 0u,
                long long v26 = 0u,
                (uint64_t v9 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16]) != 0))
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v26;
LABEL_10:
            uint64_t v12 = 0;
            while (1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(a3);
              }
              uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v14 = [v13 objectForKey:v5];
                if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (-[AVMediaSelectionGroup _matchesGroupID:mediaType:](v8, "_matchesGroupID:mediaType:", [v13 objectForKey:v6], v14))
                  {
                    break;
                  }
                }
              }
              if (v10 == ++v12)
              {
                uint64_t v10 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
                if (v10) {
                  goto LABEL_10;
                }
                goto LABEL_19;
              }
            }
          }
          else
          {
LABEL_19:
            objc_msgSend(v21, "addObject:", -[AVPlayerItem _propertyListForMediaSelection:forGroup:](self, "_propertyListForMediaSelection:forGroup:", +[AVMediaSelectionOption mediaSelectionNilOptionForGroup:](AVMediaSelectionOption, "mediaSelectionNilOptionForGroup:", v8), v8));
          }
          uint64_t v7 = v24 + 1;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }
  }
  if (a3) {
    [v21 addObjectsFromArray:a3];
  }
  uint64_t v15 = [AVMediaSelection alloc];
  id v16 = [(AVPlayerItem *)self asset];
  if (v19) {
    id v17 = [(AVMediaSelection *)v15 _initWithAsset:v16 selectedMediaArray:v21];
  }
  else {
    id v17 = [(AVMediaSelection *)v15 _initWithDeferredLoadingOfAsset:v16 selectedMediaArray:v21];
  }
  return v17;
}

- (void)_setCurrentMediaSelection:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItem__setCurrentMediaSelection___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24))
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v5, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:", @"AVPlayerItemMediaSelectionDidChangeNotification", self));
  }
  _Block_object_dispose(&v7, 8);
}

void *__42__AVPlayerItem__setCurrentMediaSelection___block_invoke(void *result)
{
  CFNumberRef v1 = *(void **)(*(void *)(result[4] + 8) + 1104);
  if (v1 != (void *)result[5])
  {
    CFNumberRef v2 = result;

    id result = (id)v2[5];
    *(void *)(*(void *)(v2[4] + 8) + 1104) = result;
    *(unsigned char *)(*(void *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

- (AVMediaSelection)currentMediaSelection
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  AVTelemetryGenerateID();
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000;
  long long v26 = __Block_byref_object_copy__7;
  long long v27 = __Block_byref_object_dispose__7;
  uint64_t v28 = 0;
  if ([(AVPlayerItem *)self _isFigAssetReadyForInspectionOfMediaSelectionOptionsAndFigPlaybackItemIsReadyForInspection])
  {
    ivarAccessQueue = self->_playerItem->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__AVPlayerItem_currentMediaSelection__block_invoke;
    block[3] = &unk_1E57B2110;
    void block[4] = self;
    void block[5] = &v23;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    id v4 = (AVMediaSelection *)v24[5];
    if (!v4)
    {
      id v5 = [(AVPlayerItem *)self _currentMediaSelectionFromFigSelectedMediaArray:[(AVPlayerItem *)self _figSelectedMediaArray]];
      v24[5] = (uint64_t)v5;
      uint64_t v6 = self->_playerItem->ivarAccessQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __37__AVPlayerItem_currentMediaSelection__block_invoke_2;
      v21[3] = &unk_1E57B2160;
      v21[4] = self;
      v21[5] = &v23;
      av_readwrite_dispatch_queue_write(v6, v21);
      id v4 = (AVMediaSelection *)v24[5];
    }
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(AVAsset *)[(AVPlayerItem *)self asset] statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:0] == 2)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = [(AVAsset *)self->_playerItem->asset availableMediaCharacteristicsWithMediaSelectionOptions];
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = [(AVAsset *)[(AVPlayerItem *)self asset] mediaSelectionGroupForMediaCharacteristic:*(void *)(*((void *)&v17 + 1) + 8 * v11)];
            id v13 = [(AVPlayerItem *)self _mediaOptionsSelectedByClientForKey:v12];
            if (v13) {
              objc_msgSend(v7, "addObject:", -[AVPlayerItem _propertyListForMediaSelection:forGroup:](self, "_propertyListForMediaSelection:forGroup:", v13, v12));
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v29 count:16];
        }
        while (v9);
      }
      uint64_t v14 = (AVMediaSelection *)[[AVMediaSelection alloc] _initWithAsset:[(AVPlayerItem *)self asset] selectedMediaArray:v7];
    }
    else
    {
      uint64_t v15 = [(AVPlayerItem *)self asset];
      -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v15, "loadValuesAsynchronouslyForKeys:completionHandler:", [MEMORY[0x1E4F1C978] arrayWithObject:@"availableMediaCharacteristicsWithMediaSelectionOptions"], &__block_literal_global_634);
      uint64_t v14 = (AVMediaSelection *)[[AVMediaSelection alloc] _initWithAssetWithoutGroupDictionaries:[(AVPlayerItem *)self asset]];
    }
    id v4 = v14;
    v24[5] = (uint64_t)v14;
  }
  _Block_object_dispose(&v23, 8);
  return v4;
}

uint64_t __37__AVPlayerItem_currentMediaSelection__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 1104);
  return result;
}

id __37__AVPlayerItem_currentMediaSelection__block_invoke_2(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1104) = result;
  return result;
}

- (void)setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __77__AVPlayerItem_setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __77__AVPlayerItem_setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 995) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __71__AVPlayerItem__updateNonForcedSubtitleDisplayEnabledOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isNonForcedSubtitleDisplayEnabled]) {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F33988];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (BOOL)_isNonForcedSubtitleDisplayEnabled
{
  CFNumberRef v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v2) {
    return 0;
  }
  char v3 = v2;
  CFBooleanRef BOOLean = 0;
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = *(unsigned int (**)(uint64_t, void, void, CFBooleanRef *))(v6 + 48);
  if (v8 && !v8(FigBaseObject, *MEMORY[0x1E4F33988], *MEMORY[0x1E4F1CF80], &BOOLean) && BOOLean)
  {
    BOOL v7 = CFBooleanGetValue(BOOLean) != 0;
    CFRelease(BOOLean);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

- (OpaqueFigCPEProtector)_copyFigCPEProtector
{
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVPlayerItem__copyFigCPEProtector__block_invoke;
  block[3] = &unk_1E57B3BB8;
  void block[4] = self;
  void block[5] = &v16;
  void block[6] = &v20;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (v17[3])
  {
    id v4 = v21;
    if (v21[3])
    {
      CFRelease((CFTypeRef)v21[3]);
      id v4 = v21;
      v21[3] = 0;
    }
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = *(void (**)(uint64_t, void, void, uint64_t *))(v7 + 48);
    if (v8) {
      v8(CMBaseObject, *MEMORY[0x1E4F321A0], *MEMORY[0x1E4F1CF80], v4 + 3);
    }
    uint64_t v9 = self->_playerItem->ivarAccessQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__AVPlayerItem__copyFigCPEProtector__block_invoke_2;
    v14[3] = &unk_1E57B2160;
    void v14[4] = self;
    v14[5] = &v20;
    av_readwrite_dispatch_queue_write(v9, v14);
    uint64_t v10 = (const void *)v21[3];
    if (v10) {
      CFRetain(v10);
    }
  }
  uint64_t v11 = (const void *)v17[3];
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = (OpaqueFigCPEProtector *)v21[3];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v12;
}

CFTypeRef __36__AVPlayerItem__copyFigCPEProtector__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 8);
  if (!*(void *)(v3 + 1472))
  {
    char v4 = [*(id *)(v3 + 112) _isStreaming];
    uint64_t v2 = a1[4];
    if ((v4 & 1) == 0)
    {
      int v5 = [*(id *)(*(void *)(v2 + 8) + 112) hasProtectedContent];
      uint64_t v2 = a1[4];
      if (v5)
      {
        CFTypeRef v6 = (CFTypeRef)[*(id *)(*(void *)(v2 + 8) + 112) _figAsset];
        if (v6) {
          CFTypeRef v6 = CFRetain(v6);
        }
        *(void *)(*(void *)(a1[5] + 8) + 24) = v6;
        uint64_t v2 = a1[4];
      }
    }
  }
  CFTypeRef result = *(CFTypeRef *)(*(void *)(v2 + 8) + 1472);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void __36__AVPlayerItem__copyFigCPEProtector__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(const void **)(v2 + 1472);
  if (v3)
  {
    CFRelease(v3);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v2 + 1472) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (NSArray)timedMetadata
{
  uint64_t v2 = self->_playerItem->currentStableVariantID;
  return (NSArray *)v2;
}

- (void)_setTimedMetadata:(id)a3
{
  if ([a3 count]) {
    int v5 = (NSString *)[a3 copy];
  }
  else {
    int v5 = 0;
  }

  self->_playerItem->currentStableVariantID = v5;
}

- (void)_removeSyncLayer:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerItem__removeSyncLayer___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _setSyncLayersOnFigPlaybackItem];
}

uint64_t __33__AVPlayerItem__removeSyncLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 152) count];
  if (v2)
  {
    uint64_t v3 = v2;
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 152) pointerAtIndex:i] == *(void *)(a1 + 40)) {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 152) replacePointerAtIndex:i withPointer:0];
      }
    }
  }
  int v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 152);
  return [v5 compact];
}

- (void)_addSyncLayer:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__AVPlayerItem__addSyncLayer___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _setSyncLayersOnFigPlaybackItem];
}

uint64_t __30__AVPlayerItem__addSyncLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 152);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 152) = (id)[MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 152);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 addPointer:v3];
}

- (id)_playbackItemNotificationPayloadToError:(__CFDictionary *)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F33820]);
  if (Value) {
    BOOL v7 = CFBooleanGetValue(Value) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  id result = (id)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F33818]);
  signed int valuePtr = 0;
  if (result)
  {
    CFNumberRef v9 = (const __CFNumber *)result;
    CFTypeID v10 = CFGetTypeID(result);
    if (v10 == CFNumberGetTypeID())
    {
      id v12 = 0;
      [(AVPlayerItem *)self _getVideoComposition:0 customVideoCompositorSession:&v12 figVideoCompositor:0];
      CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr != -16180 || !v12 || (id result = (id)[v12 getAndClearClientError]) == 0)
      {
        uint64_t v11 = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F33710]);
        id result = (id)AVErrorWithNSErrorAndOSStatus((uint64_t)v11, valuePtr, 0);
        if (v7) {
          return (id)AVLocalizedError(@"AVFoundationErrorDomain", -11870, (void *)[result userInfo]);
        }
      }
      return result;
    }
    return 0;
  }
  return result;
}

- (BOOL)_hasEnabledVideo
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v3) {
    return 0;
  }
  char v4 = v3;
  if (([(AVPlayerItem *)self _isReadyForInspectionOfTracks]
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && ((CFBooleanRef BOOLean = 0,
         uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(),
         (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (CFNumberRef v9 = *(unsigned int (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48)) != 0
     && !v9(FigBaseObject, *MEMORY[0x1E4F339E0], *MEMORY[0x1E4F1CF80], &BOOLean)
     && BOOLean))
  {
    BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)hasEnabledVideo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayerItem_hasEnabledVideo__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVPlayerItem_hasEnabledVideo__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 997);
  return result;
}

- (BOOL)hasVideo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayerItem_hasVideo__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__AVPlayerItem_hasVideo__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 998);
  return result;
}

- (BOOL)isRenderingSpatialAudio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayerItem_isRenderingSpatialAudio__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__AVPlayerItem_isRenderingSpatialAudio__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1120);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfHasEnabledVideo
{
  return 0;
}

- (BOOL)_hasEnabledAudio
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (!v3) {
    return 0;
  }
  char v4 = v3;
  if (([(AVPlayerItem *)self _isReadyForInspectionOfTracks]
     || sOKToBlockWhenGettingValuesOfProperties == 1)
    && ((CFBooleanRef BOOLean = 0,
         uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(),
         (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (char v9 = *(unsigned int (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48)) != 0
     && !v9(FigBaseObject, *MEMORY[0x1E4F339D8], *MEMORY[0x1E4F1CF80], &BOOLean)
     && BOOLean))
  {
    BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)hasEnabledAudio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayerItem_hasEnabledAudio__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVPlayerItem_hasEnabledAudio__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 999);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfHasEnabledAudio
{
  return 0;
}

- (void)setAllowProgressiveSwitchUp:(BOOL)a3
{
  CFTypeID v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CMTime v8[2] = __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    void v8[4] = v5;
    BOOL v9 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

uint64_t __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 874) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __44__AVPlayerItem_setAllowProgressiveSwitchUp___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33890];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)setAllowProgressiveStartup:(BOOL)a3
{
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CMTime v8[2] = __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    void v8[4] = v5;
    BOOL v9 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

uint64_t __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 875) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __43__AVPlayerItem_setAllowProgressiveStartup___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33888];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)setAllowProgressiveResume:(BOOL)a3
{
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItem_setAllowProgressiveResume___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v11 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5)
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CMTime v8[2] = __42__AVPlayerItem_setAllowProgressiveResume___block_invoke_2;
    v8[3] = &__block_descriptor_41_e5_v8__0l;
    void v8[4] = v5;
    BOOL v9 = a3;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v5);
  }
}

uint64_t __42__AVPlayerItem_setAllowProgressiveResume___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 876) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __42__AVPlayerItem_setAllowProgressiveResume___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFNumberRef v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33880];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)_updateIFramePrefetchTargetDimensionsOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    char v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__AVPlayerItem__updateIFramePrefetchTargetDimensionsOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __70__AVPlayerItem__updateIFramePrefetchTargetDimensionsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) IFramePrefetchTargetDimensions];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v7);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, CFDictionaryRef))(v4 + 56);
  if (v5) {
    v5(FigBaseObject, *MEMORY[0x1E4F339F0], DictionaryRepresentation);
  }
  if (DictionaryRepresentation)
  {
    CFRelease(DictionaryRepresentation);
  }
}

- (void)setIFramePrefetchTargetDimensions:(CGSize)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItem_setIFramePrefetchTargetDimensions___block_invoke;
  block[3] = &unk_1E57B36D0;
  void block[4] = self;
  CGSize v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerItem *)self _updateIFramePrefetchTargetDimensionsOnFigPlaybackItem];
}

__n128 __50__AVPlayerItem_setIFramePrefetchTargetDimensions___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 880) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveSwitchUp
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveStartup
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfAllowProgressiveResume
{
  return 0;
}

- (void)_updatePreferredPeakBitRateOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AVPlayerItem__updatePreferredPeakBitRateOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __60__AVPlayerItem__updatePreferredPeakBitRateOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  CFNumberRef v1 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 32) preferredPeakBitRate];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
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
    uint64_t v10 = *MEMORY[0x1E4F33908];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

- (void)setPreferredPeakBitRate:(double)preferredPeakBitRate
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerItem_setPreferredPeakBitRate___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  *(double *)&void v5[5] = preferredPeakBitRate;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updatePreferredPeakBitRateOnFigPlaybackItem];
}

double __40__AVPlayerItem_setPreferredPeakBitRate___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 600) = result;
  return result;
}

- (void)_updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__AVPlayerItem__updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __80__AVPlayerItem__updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredPeakBitRateForExpensiveNetworks];
  if (v1 <= 0.0) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
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
    uint64_t v10 = *MEMORY[0x1E4F33910];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

- (void)setPreferredPeakBitRateForExpensiveNetworks:(double)preferredPeakBitRateForExpensiveNetworks
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVPlayerItem_setPreferredPeakBitRateForExpensiveNetworks___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  *(double *)&void v5[5] = preferredPeakBitRateForExpensiveNetworks;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updatePreferredPeakBitRateForExpensiveNetworksOnFigPlaybackItem];
}

double __60__AVPlayerItem_setPreferredPeakBitRateForExpensiveNetworks___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 608) = result;
  return result;
}

- (float)maximumBitRate
{
  [(AVPlayerItem *)self preferredPeakBitRate];
  return v2;
}

- (void)setMaximumBitRate:(float)a3
{
}

- (void)_updatePreferredMaximumResolutionOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__AVPlayerItem__updatePreferredMaximumResolutionOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E57B1E80;
    void block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

void __66__AVPlayerItem__updatePreferredMaximumResolutionOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredMaximumResolution];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v7);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, CFDictionaryRef))(v4 + 56);
  if (v5) {
    v5(FigBaseObject, *MEMORY[0x1E4F33B10], DictionaryRepresentation);
  }
  CFRelease(DictionaryRepresentation);
}

- (void)setPreferredMaximumResolution:(CGSize)preferredMaximumResolution
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerItem_setPreferredMaximumResolution___block_invoke;
  block[3] = &unk_1E57B36D0;
  void block[4] = self;
  CGSize v6 = preferredMaximumResolution;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerItem *)self _updatePreferredMaximumResolutionOnFigPlaybackItem];
}

__n128 __46__AVPlayerItem_setPreferredMaximumResolution___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 920) = result;
  return result;
}

- (void)_updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__AVPlayerItem__updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem__block_invoke;
    block[3] = &unk_1E57B1E80;
    void block[4] = self;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

void __86__AVPlayerItem__updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredMaximumResolutionForExpensiveNetworks];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v7);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, CFDictionaryRef))(v4 + 56);
  if (v5) {
    v5(FigBaseObject, *MEMORY[0x1E4F33B18], DictionaryRepresentation);
  }
  CFRelease(DictionaryRepresentation);
}

- (void)setPreferredMaximumResolutionForExpensiveNetworks:(CGSize)preferredMaximumResolutionForExpensiveNetworks
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVPlayerItem_setPreferredMaximumResolutionForExpensiveNetworks___block_invoke;
  block[3] = &unk_1E57B36D0;
  void block[4] = self;
  CGSize v6 = preferredMaximumResolutionForExpensiveNetworks;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerItem *)self _updatePreferredMaximumResolutionForExpensiveNetworksOnFigPlaybackItem];
}

__n128 __66__AVPlayerItem_setPreferredMaximumResolutionForExpensiveNetworks___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 936) = result;
  return result;
}

- (void)_renderingSuppressionDidChangeForOutput:(id)a3
{
  figConfigurationQueue = self->_playerItem->figConfigurationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __56__AVPlayerItem__renderingSuppressionDidChangeForOutput___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(figConfigurationQueue, v4);
}

void __56__AVPlayerItem__renderingSuppressionDidChangeForOutput___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlaybackItem];
  if (!v2) {
    return;
  }
  uint64_t v3 = (const void *)v2;
  uint64_t v4 = (void *)[*(id *)(a1 + 32) _videoOutputs];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_legibleOutputsForKeys"), "allValues");
  CGSize v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_renderedLegibleOutputsForKeys"), "allValues");
  if (![v4 containsObject:*(void *)(a1 + 40)])
  {
    if ([v5 containsObject:*(void *)(a1 + 40)])
    {
      CGSize v7 = *(void **)(a1 + 32);
      uint64_t v8 = v3;
      uint64_t v9 = v5;
    }
    else
    {
      if (![v6 containsObject:*(void *)(a1 + 40)]) {
        goto LABEL_10;
      }
      CGSize v7 = *(void **)(a1 + 32);
      uint64_t v8 = v3;
      uint64_t v9 = v6;
    }
    [v7 _updateLegibleSuppressionOnFigPlaybackItem:v8 basedOnOutputs:v9];
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) _updateVideoSuppressionOnFigPlaybackItem:v3 basedOnOutputs:v4];
LABEL_10:
  CFRelease(v3);
}

uint64_t __37__AVPlayerItem_setRequiresAccessLog___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F339C8];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

uint64_t __47__AVPlayerItem_setSuppressesAudioOnlyVariants___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33BB8];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

uint64_t __50__AVPlayerItem_setPrefersOfflinePlayableVariants___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33AB8];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)setVariantPreferences:(AVVariantPreferences)variantPreferences
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayerItem_setVariantPreferences___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  void v5[5] = variantPreferences;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateVariantPreferencesOnFigPlaybackItem];
}

uint64_t __38__AVPlayerItem_setVariantPreferences___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 816) = *(void *)(result + 40);
  return result;
}

uint64_t __71__AVPlayerItem__updatePreferredMaximumAudioSampleRateOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  double v1 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 32) preferredMaximumAudioSampleRate];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
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
    uint64_t v10 = *MEMORY[0x1E4F338D0];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

uint64_t __69__AVPlayerItem__updateAutoSwitchAtmosStreamVariantsOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) autoSwitchAtmosStreamVariants]) {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    double v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *v1;
    uint64_t v10 = *MEMORY[0x1E4F338E0];
    return v8(FigBaseObject, v10, v9);
  }
  return result;
}

- (void)_updateVideoApertureModeOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__AVPlayerItem__updateVideoApertureModeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __57__AVPlayerItem__updateVideoApertureModeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) videoApertureMode];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F338A0];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (void)setVideoApertureMode:(AVVideoApertureMode)videoApertureMode
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setVideoApertureMode___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = videoApertureMode;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateVideoApertureModeOnFigPlaybackItem];
}

uint64_t __37__AVPlayerItem_setVideoApertureMode___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 848);
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 848) = result;
  return result;
}

- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerItem_setAudioTapProcessor___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAudioTapProcessorOnFigPlaybackItem];
}

void __37__AVPlayerItem_setAudioTapProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(const void **)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 8);
  uint64_t v4 = *(const void **)(v3 + 696);
  if (v4 != v1)
  {
    *(void *)(v3 + 696) = v1;
    if (v1) {
      CFRetain(v1);
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (void)resetAudioBufferedAhead
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__AVPlayerItem_resetAudioBufferedAhead__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, block);
    CFRelease(v4);
  }
}

uint64_t __39__AVPlayerItem_resetAudioBufferedAhead__block_invoke()
{
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v4 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v3 = v4;
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 56);
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F33B08];
    uint64_t v8 = *MEMORY[0x1E4F1CFD0];
    return v6(FigBaseObject, v7, v8);
  }
  return result;
}

uint64_t __53__AVPlayerItem__addInterstitialEventCollectorLocked___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _copyInterstitialCoordinator];
}

- (void)_removeInterstitialEventCollector
{
}

- (void)_removeInterstitialEventCollectorLocked:(BOOL)a3
{
  v4[0] = 0;
  v4[1] = v4;
  CMTime v4[2] = 0x3052000000;
  v4[3] = __Block_byref_object_copy__7;
  v4[4] = __Block_byref_object_dispose__7;
  void v4[5] = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__AVPlayerItem__removeInterstitialEventCollectorLocked___block_invoke;
  v3[3] = &unk_1E57B2110;
  v3[4] = self;
  v3[5] = v4;
  [(AVPlayerItem *)self dispatchIVarWrite:1 locked:a3 block:v3];
  _Block_object_dispose(v4, 8);
}

void __56__AVPlayerItem__removeInterstitialEventCollectorLocked___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 640));

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 640) = 0;
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    [*(id *)(a1 + 32) removeMediaDataCollector:v2 locked:1];
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
}

+ (BOOL)automaticallyNotifiesObserversOfAsset
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPlaybackLikelyToKeepUp
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPlaybackBufferEmpty
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPlaybackBufferFull
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfSeekableTimeRanges
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfLoadedTimeRanges
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPresentationSize
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfTracks
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)advanceTimeForOverlappedPlayback
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVPlayerItem_advanceTimeForOverlappedPlayback__block_invoke;
  block[3] = &unk_1E57B2110;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __48__AVPlayerItem_advanceTimeForOverlappedPlayback__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = v2[24];
  v1[3].n128_u64[0] = v2[25].n128_u64[0];
  v1[2] = result;
  return result;
}

- (void)_updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__AVPlayerItem__updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __72__AVPlayerItem__updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 advanceTimeForOverlappedPlayback];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33870], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setAdvanceTimeForOverlappedPlayback:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVPlayerItem_setAdvanceTimeForOverlappedPlayback___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAdvanceTimeForOverlappedPlaybackOnFigPlaybackItem];
}

__n128 __52__AVPlayerItem_setAdvanceTimeForOverlappedPlayback___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 408) = 1;
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[25].n128_u64[0] = *(void *)(a1 + 56);
  v1[24] = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overlappedPlaybackEndTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AVPlayerItem_overlappedPlaybackEndTime__block_invoke;
  block[3] = &unk_1E57B2110;
  void block[4] = self;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __41__AVPlayerItem_overlappedPlaybackEndTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 412);
  v1[3].n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 428);
  v1[2] = result;
  return result;
}

- (BOOL)overlappedPlaybackEndTimeWasSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerItem_overlappedPlaybackEndTimeWasSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerItem_overlappedPlaybackEndTimeWasSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 436);
  return result;
}

- (void)_updateOverlappedPlaybackEndTimeOnFigPlaybackItem
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AVPlayerItem__updateOverlappedPlaybackEndTimeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

void __65__AVPlayerItem__updateOverlappedPlaybackEndTimeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 overlappedPlaybackEndTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, CFDictionaryRef))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33A88], v2);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)setOverlappedPlaybackEndTime:(id *)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerItem_setOverlappedPlaybackEndTime___block_invoke;
  v5[3] = &unk_1E57B3FC0;
  void v5[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateOverlappedPlaybackEndTimeOnFigPlaybackItem];
}

__n128 __45__AVPlayerItem_setOverlappedPlaybackEndTime___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 436) = 1;
  uint64_t v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 412);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(void *)(a1 + 56);
  __n128 *v1 = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTimePlayedToDuringOverlappedPlayback
{
  if (self) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self currentTime];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumTimePlayedToSinceLastSeek
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  __n128 result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    uint64_t v5 = result;
    CFDictionaryRef dictionaryRepresentation = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    char v9 = *(unsigned int (**)(uint64_t, void, void, CFDictionaryRef *))(v8 + 48);
    if (v9 && !v9(FigBaseObject, *MEMORY[0x1E4F33A50], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation))
    {
      CMTimeMakeFromDictionary(&v11, dictionaryRepresentation);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v11.value;
      CFDictionaryRef v10 = dictionaryRepresentation;
      retstr->int64_t var3 = v11.epoch;
      if (v10) {
        CFRelease(v10);
      }
    }
    CFRelease(v5);
  }
  return result;
}

- (BOOL)isAudioSpatializationAllowed
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVPlayerItem_isAudioSpatializationAllowed__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVPlayerItem_isAudioSpatializationAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1432);
  return result;
}

- (void)_updateAudioSpatializationAllowed
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__AVPlayerItem__updateAudioSpatializationAllowed__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __49__AVPlayerItem__updateAudioSpatializationAllowed__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAudioSpatializationAllowed]) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F338D8];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

- (void)setAudioSpatializationAllowed:(BOOL)audioSpatializationAllowed
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayerItem_setAudioSpatializationAllowed___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = audioSpatializationAllowed;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAudioSpatializationAllowed];
}

uint64_t __46__AVPlayerItem_setAudioSpatializationAllowed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1433) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1432) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_updateAllowedAudioSpatializationFormats
{
  char v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__AVPlayerItem__updateAllowedAudioSpatializationFormats__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __56__AVPlayerItem__updateAllowedAudioSpatializationFormats__block_invoke(uint64_t a1)
{
  char v1 = [*(id *)(a1 + 32) allowedAudioSpatializationFormats];
  uint64_t v2 = *MEMORY[0x1E4F338D8];
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 56);
  if (v7) {
    v7(FigBaseObject, v2, v3);
  }
  uint64_t v8 = *MEMORY[0x1E4F33B98];
  uint64_t v9 = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v13 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v12 = v13;
  if (v13) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 56);
  if (v15) {
    uint64_t result = v15(v9, v8, v3);
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F1CFD0];
  if ((v1 & 4) != 0)
  {
    uint64_t v17 = FigPlaybackItemGetFigBaseObject();
    uint64_t v18 = CMBaseObjectGetVTable();
    uint64_t v20 = *(void *)(v18 + 8);
    uint64_t result = v18 + 8;
    uint64_t v19 = v20;
    uint64_t v21 = v20 ? v19 : 0;
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, void))(v21 + 56);
    if (v22) {
      uint64_t result = v22(v17, v2, *v16);
    }
  }
  if ((v1 & 3) != 0)
  {
    uint64_t v23 = FigPlaybackItemGetFigBaseObject();
    uint64_t v24 = CMBaseObjectGetVTable();
    uint64_t v26 = *(void *)(v24 + 8);
    uint64_t result = v24 + 8;
    uint64_t v25 = v26;
    uint64_t v27 = v26 ? v25 : 0;
    uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 56);
    if (v28)
    {
      uint64_t v29 = *v16;
      return v28(v23, v8, v29);
    }
  }
  return result;
}

- (AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerItem_allowedAudioSpatializationFormats__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVAudioSpatializationFormats v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerItem_allowedAudioSpatializationFormats__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 1440);
  return result;
}

- (void)setAllowedAudioSpatializationFormats:(AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayerItem_setAllowedAudioSpatializationFormats___block_invoke;
  v5[3] = &unk_1E57B2228;
  void v5[4] = self;
  void v5[5] = allowedAudioSpatializationFormats;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _updateAllowedAudioSpatializationFormats];
}

uint64_t __53__AVPlayerItem_setAllowedAudioSpatializationFormats___block_invoke(uint64_t result)
{
  char v1 = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1448) = 1;
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 1440) = *(void *)(result + 40);
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v3 = *(void *)(v2 + 1440);
  if ((v3 & 4) == 0)
  {
    if (v3) {
      return result;
    }
    char v1 = 0;
  }
  *(unsigned char *)(v2 + 1432) = v1;
  return result;
}

uint64_t __40__AVPlayerItem__setPlaybackCoordinator___block_invoke_2(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _updateItemIdentifierForCoordinatedPlayback];
}

- (BOOL)isAuthorizationRequiredForPlayback
{
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  uint64_t v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (BOOL)isApplicationAuthorizedForPlayback
{
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  int v9 = 0;
  uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = *v5
    && (uint64_t v7 = (unsigned int (*)(OpaqueFigCPEProtector *, uint64_t, int *))v5[4]) != 0
    && !v7(v3, 3, &v9)
    && (~v9 & 3) == 0;
  CFRelease(v3);
  return v6;
}

- (BOOL)isContentAuthorizedForPlayback
{
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  int v9 = 0;
  uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = *v5
    && (uint64_t v7 = (unsigned int (*)(OpaqueFigCPEProtector *, uint64_t, int *))v5[6]) != 0
    && !v7(v3, 3, &v9)
    && (~v9 & 3) == 0;
  CFRelease(v3);
  return v6;
}

+ (id)_initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider:(id)a3 withOptions:(id)a4
{
  id v9 = 0;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if (([a3 isEqualToString:@"AVProtectedContentProviderFairPlay"] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVPlayerItem does not support the specified protected content provider" userInfo:0]);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  CMTime v8[2] = __140__AVPlayerItem_AVPlayerItemProtectedContentPrivate___initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider_withOptions___block_invoke;
  v8[3] = &unk_1E57B41C8;
  void v8[4] = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v8];
  FigCPERemoteInitializeWithOptions();
  return v9;
}

uint64_t __140__AVPlayerItem_AVPlayerItemProtectedContentPrivate___initializeProtectedContentPlaybackSupportSessionAsynchronouslyForProvider_withOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 isEqualToString:@"AVInitializeProtectedContentPlaybackSupportStorageURLKey"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F32708];
LABEL_7:
    uint64_t result = [*(id *)(a1 + 32) setValue:a3 forKey:*v8];
    goto LABEL_8;
  }
  if ([a2 isEqualToString:@"AVInitializeProtectedContentPlaybackSupportVideoKey"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F32700];
    goto LABEL_7;
  }
  uint64_t result = [a2 isEqualToString:@"AVInitializeProtectedContentPlaybackSupportExternalProtectionKey"];
  if (result)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F326F8];
    goto LABEL_7;
  }
LABEL_8:
  *a4 = 0;
  return result;
}

+ (void)_uninitializeProtectedContentPlaybackSupportSession:(id)a3
{
  if (FigCPERemoteUninitialize()) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVPlayerItem could not uninitialize the specified protected content support session" userInfo:0]);
  }
}

- (id)_isExternalProtectionRequiredForPlaybackInternal
{
  CFBooleanRef BOOLean = 0;
  uint64_t v3 = [(AVPlayerItem *)self _copyFigCPEProtector];
  uint64_t v4 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    CMTime v11 = *(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef *))(v7 + 48);
    if (v11)
    {
      uint64_t v12 = *MEMORY[0x1E4F32750];
      uint64_t v13 = *MEMORY[0x1E4F1CF80];
      uint64_t v14 = (uint64_t)v3;
LABEL_13:
      v11(v14, v12, v13, &BOOLean);
    }
  }
  else if (v4)
  {
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v10 = v9 ? v9 : 0;
    CMTime v11 = *(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef *))(v10 + 48);
    if (v11)
    {
      uint64_t v12 = *MEMORY[0x1E4F33B00];
      uint64_t v13 = *MEMORY[0x1E4F1CF80];
      uint64_t v14 = FigBaseObject;
      goto LABEL_13;
    }
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
  if (BOOLean) {
    BOOL v16 = CFBooleanGetValue(BOOLean) != 0;
  }
  else {
    BOOL v16 = 0;
  }
  uint64_t v17 = (void *)[v15 numberWithBool:v16];
  if (BOOLean) {
    CFRelease(BOOLean);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v17;
}

- (void)_setExternalProtectionRequiredForPlayback:(BOOL)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVPlayerItem._externalProtectionRequiredForPlayback can only be set to YES" userInfo:0]);
  }
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v5 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v5)
  {
    uint64_t v6 = v5;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CMTime v8[2] = __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke_2;
    v8[3] = &__block_descriptor_40_e5_v8__0l;
    void v8[4] = v6;
    dispatch_sync(figPlaybackItemSetterQueue, v8);
    CFRelease(v6);
  }
}

uint64_t __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1001) = 1;
  return result;
}

uint64_t __95__AVPlayerItem_AVPlayerItemProtectedContentPrivate___setExternalProtectionRequiredForPlayback___block_invoke_2()
{
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v4 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v3 = v4;
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 56);
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F33B00];
    uint64_t v8 = *MEMORY[0x1E4F1CFD0];
    return v6(FigBaseObject, v7, v8);
  }
  return result;
}

- (BOOL)_isRental
{
  CFBooleanRef BOOLean = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void (**)(OpaqueFigCPEProtector *, void, void, CFBooleanRef *))(v5 + 48);
  if (v7 && (v7(v3, *MEMORY[0x1E4F32758], *MEMORY[0x1E4F1CF80], &BOOLean), BOOLean))
  {
    BOOL v6 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

- (NSDate)_rentalStartDate
{
  id v8 = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2
    || ((uint64_t v3 = v2, (v4 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0) ? (v5 = 0) : (v5 = v4),
        (BOOL v6 = *(void (**)(OpaqueFigCPEProtector *, void, void, id *))(v5 + 48)) == 0
     || (v6(v3, *MEMORY[0x1E4F32770], *MEMORY[0x1E4F1CF80], &v8), !v8)))
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot get rental expiration date information from an AVPlayerItem that does not contain rental content" userInfo:0]);
  }
  CFRelease(v3);
  return (NSDate *)v8;
}

- (NSDate)_rentalExpirationDate
{
  id v8 = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2
    || ((uint64_t v3 = v2, (v4 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0) ? (v5 = 0) : (v5 = v4),
        (BOOL v6 = *(void (**)(OpaqueFigCPEProtector *, void, void, id *))(v5 + 48)) == 0
     || (v6(v3, *MEMORY[0x1E4F32768], *MEMORY[0x1E4F1CF80], &v8), !v8)))
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot get rental expiration date information from an AVPlayerItem that does not contain rental content" userInfo:0]);
  }
  CFRelease(v3);
  return (NSDate *)v8;
}

- (BOOL)_isRentalPlaybackStarted
{
  CFBooleanRef BOOLean = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void (**)(OpaqueFigCPEProtector *, void, void, CFBooleanRef *))(v5 + 48);
  if (v7 && (v7(v3, *MEMORY[0x1E4F32760], *MEMORY[0x1E4F1CF80], &BOOLean), BOOLean))
  {
    BOOL v6 = CFBooleanGetValue(BOOLean) != 0;
    if (BOOLean) {
      CFRelease(BOOLean);
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

- (NSDate)_rentalPlaybackStartedDate
{
  id v8 = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2
    || ((uint64_t v3 = v2, (v4 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0) ? (v5 = 0) : (v5 = v4),
        (BOOL v6 = *(void (**)(OpaqueFigCPEProtector *, void, void, id *))(v5 + 48)) == 0
     || (v6(v3, *MEMORY[0x1E4F32780], *MEMORY[0x1E4F1CF80], &v8), !v8)))
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot get rental playback date information from an AVPlayerItem that does not contain rental content or when rental playback has not started" userInfo:0]);
  }
  CFRelease(v3);
  return (NSDate *)v8;
}

- (NSDate)_rentalPlaybackExpirationDate
{
  id v8 = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigCPEProtector];
  if (!v2
    || ((uint64_t v3 = v2, (v4 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0) ? (v5 = 0) : (v5 = v4),
        (BOOL v6 = *(void (**)(OpaqueFigCPEProtector *, void, void, id *))(v5 + 48)) == 0
     || (v6(v3, *MEMORY[0x1E4F32778], *MEMORY[0x1E4F1CF80], &v8), !v8)))
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot get rental playback date information from an AVPlayerItem that does not contain rental content or when rental playback has not started" userInfo:0]);
  }
  CFRelease(v3);
  return (NSDate *)v8;
}

- (AVPlayerItemAccessLog)accessLog
{
  id v13 = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v8 = *(unsigned int (**)(uint64_t, void, void, id *))(v6 + 48);
    if (!v8
      || (!v8(FigBaseObject, *MEMORY[0x1E4F33858], *MEMORY[0x1E4F1CF80], &v13) ? (BOOL v9 = v13 == 0) : (BOOL v9 = 1), v9))
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v11 = v13;
      id v12 = objc_allocWithZone((Class)AVPlayerItemAccessLog);
      uint64_t v7 = (void *)[v12 initWithLogArray:v13];
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (AVPlayerItemAccessLog *)v7;
}

- (AVPlayerItemErrorLog)errorLog
{
  id v13 = 0;
  uint64_t v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v8 = *(unsigned int (**)(uint64_t, void, void, id *))(v6 + 48);
    if (!v8
      || (!v8(FigBaseObject, *MEMORY[0x1E4F339B0], *MEMORY[0x1E4F1CF80], &v13) ? (BOOL v9 = v13 == 0) : (BOOL v9 = 1), v9))
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v11 = v13;
      id v12 = objc_allocWithZone((Class)AVPlayerItemErrorLog);
      uint64_t v7 = (void *)[v12 initWithLogArray:v13];
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (AVPlayerItemErrorLog *)v7;
}

- (void)_quietlySetEQPreset:(int)a3
{
  int valuePtr = a3;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    CFNumberRef v4 = v3;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = *(void (**)(uint64_t, void, CFNumberRef))(v7 + 56);
    if (v8) {
      v8(FigBaseObject, *MEMORY[0x1E4F33990], v4);
    }
    CFRelease(v4);
  }
}

- (void)_setEQPreset:(int)a3
{
  playerItem = self->_playerItem;
  if (HIDWORD(playerItem->interstitialEventID) != a3)
  {
    HIDWORD(playerItem->interstitialEventID) = a3;
    if (self->_playerItem->figPlaybackItem) {
      -[AVPlayerItem _quietlySetEQPreset:](self, "_quietlySetEQPreset:");
    }
  }
}

- (void)_setRampInOutInfo:(id)a3
{
  if (self->_playerItem->coordinationIdentifier != a3)
  {
    CFNumberRef v4 = (NSString *)[a3 copy];

    self->_playerItem->coordinationIdentifier = v4;
    if (self->_playerItem->figPlaybackItem)
    {
      [(AVPlayerItem *)self _updatePlaybackPropertiesOnFigPlaybackItem];
    }
  }
}

- (void)_setAudibleDRMInfo:(id)a3
{
  if (*(id *)&self->_playerItem->participatesInCoordinatedPlayback != a3)
  {
    uint64_t v4 = [a3 copy];

    *(void *)&self->_playerItem->participatesInCoordinatedPlayback = v4;
    if (self->_playerItem->figPlaybackItem)
    {
      [(AVPlayerItem *)self _updatePlaybackPropertiesOnFigPlaybackItem];
    }
  }
}

- (int64_t)_fileSize
{
  int64_t valuePtr = 0;
  int64_t result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    CFNumberRef v3 = (const void *)result;
    CFNumberRef number = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v6 + 48);
    if (v7)
    {
      int v8 = v7(FigBaseObject, *MEMORY[0x1E4F339C0], *MEMORY[0x1E4F1CF80], &number);
      CFNumberRef v9 = number;
      if (!v8)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v9 = number;
      }
      if (v9) {
        CFRelease(v9);
      }
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

- (int64_t)_availableFileSize
{
  int64_t valuePtr = 0;
  int64_t result = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (result)
  {
    CFNumberRef v3 = (const void *)result;
    CFNumberRef number = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v6 + 48);
    if (v7)
    {
      int v8 = v7(FigBaseObject, *MEMORY[0x1E4F33900], *MEMORY[0x1E4F1CF80], &number);
      CFNumberRef v9 = number;
      if (!v8)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v9 = number;
      }
      if (v9) {
        CFRelease(v9);
      }
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

- (void)_configureVideoCompositionColorProperties
{
  CFNumberRef v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v5 = 0;
    id v6 = 0;
    [(AVPlayerItem *)self _getVideoComposition:&v6 customVideoCompositorSession:&v5 figVideoCompositor:0];
    objc_msgSend(v6, "videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:", v5, -[AVPlayerItem _enabledTrackFormatDescriptions](self, "_enabledTrackFormatDescriptions"), &v10, &v9, &v8, &v7);
    [(AVPlayerItem *)self _setVideoCompositionColorPrimaries:v10];
    [(AVPlayerItem *)self _setVideoCompositionColorYCbCrMatrix:v8];
    [(AVPlayerItem *)self _setVideoCompositionColorTransferFunction:v9];
    [(AVPlayerItem *)self _setVideoCompositionHDRDisplayMetadataPolicy:v7];
    CFRelease(v4);
  }
}

- (void)_addLegibleOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVPlayerItem_AVPlayerItemOutputs___addLegibleOutput___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _evaluateLegibleOutputs];
}

uint64_t __55__AVPlayerItem_AVPlayerItemOutputs___addLegibleOutput___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 176);
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", FigAtomicIncrement32());
  return [v2 setObject:v1 forKey:v3];
}

- (void)_addMetadataOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerItem_AVPlayerItemOutputs___addMetadataOutput___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _evaluateMetadataOutputs];
}

uint64_t __56__AVPlayerItem_AVPlayerItemOutputs___addMetadataOutput___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 184);
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", FigAtomicIncrement32());
  return [v2 setObject:v1 forKey:v3];
}

- (void)_addRenderedLegibleOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayerItem_AVPlayerItemOutputs___addRenderedLegibleOutput___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _evaluateRenderedLegibleOutputs];
}

uint64_t __63__AVPlayerItem_AVPlayerItemOutputs___addRenderedLegibleOutput___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 192);
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", FigAtomicIncrement32());
  return [v2 setObject:v1 forKey:v3];
}

- (void)_removeVideoOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AVPlayerItem_AVPlayerItemOutputs___removeVideoOutput___block_invoke;
  v6[3] = &unk_1E57B2098;
  void v6[4] = self;
  v6[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
  VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey();
  uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemPreferredPixelBufferAttributesDidChangeNotification" object:self userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
  [(AVPlayerItem *)self _evaluateVideoOutputs];
}

uint64_t __56__AVPlayerItem_AVPlayerItemOutputs___removeVideoOutput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 168) removeObject:*(void *)(a1 + 40)];
}

- (void)_removeLegibleOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerItem_AVPlayerItemOutputs___removeLegibleOutput___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _evaluateLegibleOutputs];
}

uint64_t __58__AVPlayerItem_AVPlayerItemOutputs___removeLegibleOutput___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) allKeysForObject:*(void *)(a1 + 40)];
  uint64_t result = [v2 count];
  if (result)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 176);
    uint64_t v5 = [v2 firstObject];
    return [v4 removeObjectForKey:v5];
  }
  return result;
}

- (void)_removeMetadataOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayerItem_AVPlayerItemOutputs___removeMetadataOutput___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _evaluateMetadataOutputs];
}

uint64_t __59__AVPlayerItem_AVPlayerItemOutputs___removeMetadataOutput___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 184), "allKeysForObject:", *(void *)(a1 + 40)), "objectAtIndex:", 0);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 184);
  return [v3 removeObjectForKey:v2];
}

- (void)removeOutput:(AVPlayerItemOutput *)output
{
  AVTelemetryGenerateID();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItem_AVPlayerItemOutputs__removeOutput___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = output;
  void block[6] = &v7;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24))
  {
    [(AVPlayerItemOutput *)output _detachFromPlayerItem];
    [(AVPlayerItemOutput *)output _setTimebase:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AVPlayerItem *)self _removeVideoOutput:output];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(AVPlayerItem *)self _removeLegibleOutput:output];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(AVPlayerItem *)self _removeMetadataOutput:output];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(AVPlayerItem *)self _removeRenderedLegibleOutput:output];
          }
        }
      }
    }
  }
  _Block_object_dispose(&v7, 8);
}

void __50__AVPlayerItem_AVPlayerItemOutputs__removeOutput___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(*(void *)(a1[4] + 8) + 160) containsObject:a1[5]];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1[4] + 8) + 160) mutableCopy];
    [v2 removeObject:a1[5]];

    *(void *)(*(void *)(a1[4] + 8) + 160) = v2;
  }
}

- (void)_removeRenderedLegibleOutput:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AVPlayerItem_AVPlayerItemOutputs___removeRenderedLegibleOutput___block_invoke;
  v5[3] = &unk_1E57B2098;
  void v5[4] = self;
  void v5[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVPlayerItem *)self _evaluateRenderedLegibleOutputs];
}

uint64_t __66__AVPlayerItem_AVPlayerItemOutputs___removeRenderedLegibleOutput___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 192) allKeysForObject:*(void *)(a1 + 40)];
  uint64_t result = [v2 count];
  if (result)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 192);
    uint64_t v5 = [v2 firstObject];
    return [v4 removeObjectForKey:v5];
  }
  return result;
}

- (NSArray)outputs
{
  AVTelemetryGenerateID();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__7;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVPlayerItem_AVPlayerItemOutputs__outputs__block_invoke;
  v6[3] = &unk_1E57B2110;
  void v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  uint64_t v4 = (NSArray *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __44__AVPlayerItem_AVPlayerItemOutputs__outputs__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 160);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_addMetadataCollector:(id)a3
{
}

- (void)_removeMetadataCollector:(id)a3
{
}

- (void)_removeMetadataCollector:(id)a3 locked:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v13 = 0;
  id v13 = [(AVPlayerItem *)self _copyFigPlaybackItemLocked:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke;
  v9[3] = &unk_1E57B2098;
  v9[4] = self;
  void v9[5] = a3;
  [(AVPlayerItem *)self dispatchIVarWrite:1 locked:v4 block:v9];
  if (v11[3])
  {
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CMTime v8[2] = __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke_2;
    v8[3] = &unk_1E57B2160;
    void v8[4] = self;
    void v8[5] = &v10;
    dispatch_async(figPlaybackItemSetterQueue, v8);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 632) removeObject:*(void *)(a1 + 40)];
}

void __81__AVPlayerItem_AVPlayerItemMediaDataCollectors___removeMetadataCollector_locked___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_metadataCollectors"), "count"));
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = *(void (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F33970], v2);
  }
  uint64_t v7 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    CFRelease(v7);
  }
}

- (void)addMediaDataCollector:(AVPlayerItemMediaDataCollector *)collector
{
}

- (void)removeMediaDataCollector:(AVPlayerItemMediaDataCollector *)collector
{
}

- (void)removeMediaDataCollector:(id)a3 locked:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __81__AVPlayerItem_AVPlayerItemMediaDataCollectors__removeMediaDataCollector_locked___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  [(AVPlayerItem *)self dispatchIVarWrite:1 locked:a4 block:v4];
}

uint64_t __81__AVPlayerItem_AVPlayerItemMediaDataCollectors__removeMediaDataCollector_locked___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624) mutableCopy];
    [v3 removeObject:*(void *)(a1 + 40)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 624) = v3;
    [*(id *)(a1 + 40) _detatchFromPlayerItem];
    uint64_t result = needsTaggedRanges();
    if (result)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      return [v4 _removeMetadataCollector:v5 locked:1];
    }
  }
  return result;
}

- (id)_legibleOutputForKey:(id)a3
{
  id v4 = [(AVPlayerItem *)self _legibleOutputsForKeys];
  return (id)[v4 objectForKey:a3];
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 atItemTime:(id *)a6 withLegibleOutputsDictionaryKey:(id)a7
{
  id v10 = [(AVPlayerItem *)self _legibleOutputForKey:a7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a6;
  [v10 _pushAttributedStrings:a4 andSampleBuffers:a5 atItemTime:&v11];
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushLegibleOutputWithDictionaryKey:(id)a4
{
  id v4 = [(AVPlayerItem *)self _legibleOutputForKey:a4];
  [v4 _signalFlush];
}

- (id)_metadataOutputForKey:(id)a3
{
  id v4 = [(AVPlayerItem *)self _metadataOutputsForKeys];
  return (id)[v4 objectForKey:a3];
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputSampleBuffers:(id)a4 fromTrackWithID:(int)a5 forMetadataOutputWithDictionaryKey:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(AVAsset *)self->_playerItem->asset _isStreaming]) {
    id v10 = 0;
  }
  else {
    id v10 = [(AVPlayerItem *)self _trackWithTrackID:v7];
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(a4);
        }
        BOOL v16 = [[AVTimedMetadataGroup alloc] initWithSampleBuffer:*(void *)(*((void *)&v17 + 1) + 8 * v15)];
        [v11 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
  objc_msgSend(-[AVPlayerItem _metadataOutputForKey:](self, "_metadataOutputForKey:", a6), "_pushTimedMetadataGroups:fromPlayerItemTrack:", v11, v10);
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushMetadataOutputWithDictionaryKey:(id)a4
{
  id v4 = [(AVPlayerItem *)self _metadataOutputForKey:a4];
  [v4 _signalFlush];
}

- (id)_renderedLegibleOutputForKey:(id)a3
{
  id v4 = [(AVPlayerItem *)self _renderedLegibleOutputsForKeys];
  return (id)[v4 objectForKey:a3];
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didOutputRenderedCaptionImages:(id)a4 atItemTime:(id *)a5 withRenderedLegibleOutputsDictionaryKey:(id)a6
{
  id v8 = [(AVPlayerItem *)self _renderedLegibleOutputForKey:a6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  [v8 _pushRenderedCaptionImages:a4 atItemTime:&v9];
}

- (void)_figPlaybackItem:(OpaqueFigPlaybackItem *)a3 didFlushRenderedLegibleOutputWithDictionaryKey:(id)a4
{
  id v4 = [(AVPlayerItem *)self _renderedLegibleOutputForKey:a4];
  [v4 _signalFlush];
}

- (id)interstitialEventID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = __Block_byref_object_copy__7;
  id v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayerItem_AVPlayerItemAVKit__interstitialEventID__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __54__AVPlayerItem_AVPlayerItemAVKit__interstitialEventID__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1336);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setInterstitialEventID:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __59__AVPlayerItem_AVPlayerItemAVKit___setInterstitialEventID___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  void v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void __59__AVPlayerItem_AVPlayerItemAVKit___setInterstitialEventID___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1336) = *(void *)(a1 + 32);
}

uint64_t __57__AVPlayerItem_AVPlayerItemHaptics__setPlayHapticTracks___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33A90];
    uint64_t v10 = *v1;
    return v8(FigBaseObject, v9, v10);
  }
  return result;
}

void __63__AVPlayerItem_AVPlayerItemHaptics__setHapticPlaybackLocality___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hapticPlaybackLocality];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    v6(FigBaseObject, *MEMORY[0x1E4F339D0], v2);
  }
  uint64_t v7 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CFRelease(v7);
}

- (void)_updateVideoEnhancementModeOnFigPlaybackItem
{
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__AVPlayerItem_AVPlayerItemVideoEnhancement___updateVideoEnhancementModeOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __90__AVPlayerItem_AVPlayerItemVideoEnhancement___updateVideoEnhancementModeOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) videoEnhancementMode];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33C98];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

uint64_t __70__AVPlayerItem_AVPlayerItemVideoEnhancement__setVideoEnhancementMode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1112)];
  if ((result & 1) == 0)
  {

    uint64_t result = [*(id *)(a1 + 32) copy];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1112) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (AVPlayerItem)templatePlayerItem
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayerItem_AVPlayerInterstitialSupport__templatePlayerItem__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (AVPlayerItem *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __63__AVPlayerItem_AVPlayerInterstitialSupport__templatePlayerItem__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1328);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setTemplatePlayerItem:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __68__AVPlayerItem_AVPlayerInterstitialSupport___setTemplatePlayerItem___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  void v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void __68__AVPlayerItem_AVPlayerInterstitialSupport___setTemplatePlayerItem___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1328) = *(void *)(a1 + 32);
}

- (id)_coordinationIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayerItem_AVPlayerInterstitialSupport___coordinationIdentifier__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __68__AVPlayerItem_AVPlayerInterstitialSupport___coordinationIdentifier__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1344);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setCoordinatorIdentifier:(id)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __71__AVPlayerItem_AVPlayerInterstitialSupport___setCoordinatorIdentifier___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  void v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void __71__AVPlayerItem_AVPlayerInterstitialSupport___setCoordinatorIdentifier___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 1344) = *(void *)(a1 + 32);
}

- (BOOL)participatesInCoordinatedPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayerItem_AVPlayerInterstitialSupport__participatesInCoordinatedPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__AVPlayerItem_AVPlayerInterstitialSupport__participatesInCoordinatedPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 1352);
  return result;
}

- (void)_setParticipatesInCoordinatedPlayback:(BOOL)a3
{
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  CMTime v4[2] = __83__AVPlayerItem_AVPlayerInterstitialSupport___setParticipatesInCoordinatedPlayback___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __83__AVPlayerItem_AVPlayerInterstitialSupport___setParticipatesInCoordinatedPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1352) = *(unsigned char *)(result + 40);
  return result;
}

- (id)_integratedTimelineOffsets
{
  id v9 = 0;
  id v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v2)
  {
    char v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, void, id *))(v6 + 48);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33A08], *MEMORY[0x1E4F1CF80], &v9);
    }
    CFRelease(v3);
    id v2 = (OpaqueFigPlaybackItem *)v9;
  }
  return v2;
}

- (id)_interstitialEventItemTimeOffset
{
  id v9 = 0;
  id v2 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v2)
  {
    char v3 = v2;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, void, id *))(v6 + 48);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F33A10], *MEMORY[0x1E4F1CF80], &v9);
    }
    CFRelease(v3);
    id v2 = (OpaqueFigPlaybackItem *)v9;
  }
  return v2;
}

- (AVPlayerItemIntegratedTimeline)integratedTimeline
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  uint64_t v14 = 0;
  if ((objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_isInterstitialPlayer") & 1) == 0)
  {
    id v3 = [(AVPlayerItem *)self _copyIntegratedTimelineIfCreated];
    v10[5] = (uint64_t)v3;
    if (!v3)
    {
      uint64_t v4 = (const void *)objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_copyInterstitialCoordinatorIfCreated");
      ivarAccessQueue = self->_playerItem->ivarAccessQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      CMTime v8[2] = __73__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport__integratedTimeline__block_invoke;
      v8[3] = &unk_1E57B2160;
      void v8[4] = self;
      void v8[5] = &v9;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v8);
      [(id)v10[5] _attachToItem:self];
      [(id)v10[5] _attachCoordinator:v4];
      objc_msgSend((id)v10[5], "_attachInterstitialPlayer:", objc_msgSend(-[AVPlayerItem _player](self, "_player"), "_interstitialPlayerIfCreated"));
      if (v4) {
        CFRelease(v4);
      }
    }
  }
  uint64_t v6 = (AVPlayerItemIntegratedTimeline *)(id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __73__AVPlayerItem_AVPlayerItemIntegratedTimelineSupport__integratedTimeline__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 1008);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1008) = [[AVPlayerItemIntegratedTimeline alloc] _initInternal];
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 1008);
  }
  id result = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isDefunct
{
  BOOL v9 = 0;
  id v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v5 = v4 ? (void *)v4 : 0;
    if (*v5 < 5uLL) {
      goto LABEL_11;
    }
    uint64_t v6 = (uint64_t (*)(OpaqueFigPlaybackItem *, BOOL *))v5[11];
    if (!v6) {
      goto LABEL_11;
    }
    int v7 = v6(v3, &v9);
    if (v9)
    {
LABEL_12:
      CFRelease(v3);
      return v9;
    }
    if (v7)
    {
LABEL_11:
      BOOL v9 = 1;
      goto LABEL_12;
    }
  }
  BOOL result = [(AVAsset *)[(AVPlayerItem *)self asset] isDefunct];
  BOOL v9 = result;
  if (v3) {
    goto LABEL_12;
  }
  return result;
}

- (NSArray)speedRamp
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerItem_AVPlayerItemSpeedRamp__speedRamp__block_invoke;
  v5[3] = &unk_1E57B2160;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerItem_AVPlayerItemSpeedRamp__speedRamp__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v1 + 1504))
  {
    uint64_t v2 = result;
    BOOL result = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(v1 + 1512)];
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 40) = result;
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t v4 = v3 + 8;
    if (*(void *)(v5 + 1512))
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        objc_msgSend(*(id *)(*(void *)v4 + 1504), "getBytes:range:", &v12, v6, 96);
        uint64_t v8 = *(void **)(*(void *)(*(void *)(v2 + 40) + 8) + 40);
        v11[2] = v14;
        void v11[3] = v15;
        v11[4] = v16;
        v11[5] = v17;
        v11[0] = v12;
        v11[1] = v13;
        BOOL result = objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeMapping:", v11));
        ++v7;
        uint64_t v9 = *(void *)(v2 + 32);
        uint64_t v10 = *(void *)(v9 + 8);
        uint64_t v4 = v9 + 8;
        v6 += 96;
      }
      while (v7 < *(void *)(v10 + 1512));
    }
  }
  return result;
}

- (void)setSpeedRamp:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (!a3 || (unint64_t v41 = [a3 count]) == 0)
  {
    unint64_t v7 = 0;
    goto LABEL_54;
  }
  uint64_t v6 = (void *)[a3 objectAtIndexedSubscript:0];
  if (v6)
  {
    [v6 CMTimeMappingValue];
  }
  else
  {
    long long v87 = 0u;
    long long v86 = 0u;
    long long v85 = 0u;
    memset(&v84, 0, sizeof(v84));
  }
  CMTimeRange range = v84;
  CMTimeRangeGetEnd(&v83, &range);
  if ((v83.flags & 0x1D) != 1) {
    goto LABEL_60;
  }
  long long v13 = (void *)[a3 objectAtIndexedSubscript:0];
  if (v13)
  {
    [v13 CMTimeMappingValue];
  }
  else
  {
    memset(&v81, 0, sizeof(v81));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v78 = 0u;
  }
  CMTimeRange v82 = v81;
  CMTimeRangeGetEnd(&v77, &v82);
  if ((v77.flags & 0x1D) != 1)
  {
LABEL_60:
    long long v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v34 = @"All time mappings must have numeric start and duration times";
LABEL_63:
    uint64_t v35 = (objc_class *)self;
    uint64_t v36 = a2;
    goto LABEL_59;
  }
  long long v14 = (void *)[a3 objectAtIndexedSubscript:0];
  if (v14)
  {
    [v14 CMTimeMappingValue];
  }
  else
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
  }
  *(_OWORD *)&time1.CMTimeValue value = v70;
  time1.CMTimeEpoch epoch = v71;
  long long v40 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&time2[0].start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  time2[0].start.CMTimeEpoch epoch = v15;
  if (CMTimeCompare(&time1, &time2[0].start))
  {
    long long v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v34 = @"First time mapping must have zero source start time";
    goto LABEL_63;
  }
  long long v16 = (void *)[a3 objectAtIndexedSubscript:0];
  if (v16)
  {
    [v16 CMTimeMappingValue];
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
  }
  *(_OWORD *)&v69.CMTimeValue value = v66;
  v69.CMTimeEpoch epoch = v67;
  *(_OWORD *)&time2[0].start.CMTimeValue value = v40;
  time2[0].start.CMTimeEpoch epoch = v15;
  if (CMTimeCompare(&v69, &time2[0].start))
  {
    long long v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v34 = @"First time mapping must have zero target start time";
    goto LABEL_63;
  }
  uint64_t v39 = self;
  memset(time2, 0, sizeof(time2));
  long long v17 = (void *)[a3 objectAtIndexedSubscript:0];
  if (v17) {
    [v17 CMTimeMappingValue];
  }
  else {
    memset(time2, 0, sizeof(time2));
  }
  if (v41 >= 2)
  {
    uint64_t v18 = 1;
    while (1)
    {
      long long v19 = (void *)[a3 objectAtIndexedSubscript:v18];
      if (v19)
      {
        [v19 CMTimeMappingValue];
        CMTimeFlags v20 = HIDWORD(v59);
        CMTimeEpoch v21 = *(void *)&v60[0];
      }
      else
      {
        CMTimeEpoch v21 = 0;
        CMTimeFlags v20 = 0;
        long long v59 = 0u;
        memset(v60, 0, sizeof(v60));
      }
      CMTimeValue v96 = v59;
      CMTimeScale v97 = DWORD2(v59);
      CMTime v61 = *(CMTime *)((char *)v60 + 8);
      uint64_t v22 = (void *)[a3 objectAtIndexedSubscript:v18];
      if (v22)
      {
        [v22 CMTimeMappingValue];
        CMTimeFlags v23 = HIDWORD(v56);
        CMTimeEpoch v24 = *(void *)&v57[0];
      }
      else
      {
        CMTimeEpoch v24 = 0;
        CMTimeFlags v23 = 0;
        memset(v57, 0, sizeof(v57));
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
      }
      CMTimeValue v94 = v56;
      CMTimeScale v95 = DWORD2(v56);
      CMTime v58 = *(CMTime *)((char *)v57 + 8);
      v47.start.CMTimeValue value = v96;
      v47.start.uint64_t timescale = v97;
      v47.start.CMTimeFlags flags = v20;
      v47.start.CMTimeEpoch epoch = v21;
      v47.CMTime duration = v61;
      CMTimeRangeGetEnd(&v52, &v47);
      if ((v52.flags & 0x1D) != 1
        || (v47.start.CMTimeValue value = v94,
            v47.start.uint64_t timescale = v95,
            v47.start.CMTimeFlags flags = v23,
            v47.start.CMTimeEpoch epoch = v24,
            v47.CMTime duration = v58,
            CMTimeRangeGetEnd(&v51, &v47),
            (v51.flags & 0x1D) != 1))
      {
        long long v32 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v33 = *MEMORY[0x1E4F1C3C8];
        uint64_t v34 = @"All time mappings must have numeric start and duration times";
        goto LABEL_58;
      }
      CMTimeRange v47 = time2[0];
      CMTimeRangeGetEnd(&v50, &v47);
      if ((v50.flags & 0x1F) != 3 && (v20 & 0x1F) != 3) {
        goto LABEL_66;
      }
      memset(&v47, 0, 24);
      CMTime lhs = v50;
      rhs.CMTimeValue value = v96;
      rhs.uint64_t timescale = v97;
      rhs.CMTimeFlags flags = v20;
      rhs.CMTimeEpoch epoch = v21;
      CMTimeSubtract(&time, &lhs, &rhs);
      CMTimeAbsoluteValue(&v47.start, &time);
      CMTimeMake(&v89, 1, 1000000000);
      CMTime lhs = v47.start;
      if (CMTimeCompare(&lhs, &v89) > 0)
      {
LABEL_66:
        v47.CMTimeRange start = v50;
        lhs.CMTimeValue value = v96;
        lhs.uint64_t timescale = v97;
        lhs.CMTimeFlags flags = v20;
        lhs.CMTimeEpoch epoch = v21;
        if (CMTimeCompare(&v47.start, &lhs))
        {
          long long v32 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v33 = *MEMORY[0x1E4F1C3C8];
          uint64_t v34 = @"Each time mapping's source start time must match the previous mapping's source end time";
          goto LABEL_58;
        }
      }
      CMTimeRange v47 = time2[1];
      CMTimeRangeGetEnd(&v49, &v47);
      if ((v49.flags & 0x1F) != 3 && (v23 & 0x1F) != 3) {
        goto LABEL_67;
      }
      memset(&v47, 0, 24);
      CMTime lhs = v49;
      rhs.CMTimeValue value = v94;
      rhs.uint64_t timescale = v95;
      rhs.CMTimeFlags flags = v23;
      rhs.CMTimeEpoch epoch = v24;
      CMTimeSubtract(&time, &lhs, &rhs);
      CMTimeAbsoluteValue(&v47.start, &time);
      CMTimeMake(&v89, 1, 1000000000);
      CMTime lhs = v47.start;
      if (CMTimeCompare(&lhs, &v89) > 0)
      {
LABEL_67:
        v47.CMTimeRange start = v49;
        lhs.CMTimeValue value = v94;
        lhs.uint64_t timescale = v95;
        lhs.CMTimeFlags flags = v23;
        lhs.CMTimeEpoch epoch = v24;
        if (CMTimeCompare(&v47.start, &lhs)) {
          break;
        }
      }
      uint64_t v25 = (void *)[a3 objectAtIndexedSubscript:v18];
      if (v25)
      {
        [v25 CMTimeMappingValue];
      }
      else
      {
        memset(&v48, 0, sizeof(v48));
        memset(&v47, 0, sizeof(v47));
      }
      time2[0] = v47;
      time2[1] = v48;
      if (v41 == ++v18) {
        goto LABEL_45;
      }
    }
    long long v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v34 = @"Each time mapping's target start time must match the previous mapping's target end time";
LABEL_58:
    uint64_t v36 = a2;
    uint64_t v35 = (objc_class *)v39;
LABEL_59:
    uint64_t v37 = objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, AVMethodExceptionReasonWithObjectAndSelector(v35, v36, (uint64_t)v34, v8, v9, v10, v11, v12, v38), 0);
    objc_exception_throw(v37);
  }
LABEL_45:
  self = v39;
  unint64_t v7 = (void *)[MEMORY[0x1E4F1CA58] dataWithCapacity:96 * (uint64_t)v39->_playerItem->eventTimeline];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v26 = [a3 countByEnumeratingWithState:&v43 objects:v93 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(a3);
        }
        uint64_t v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        memset(time2, 0, sizeof(time2));
        if (v30) {
          [v30 CMTimeMappingValue];
        }
        [v7 appendBytes:time2 length:96];
      }
      uint64_t v27 = [a3 countByEnumeratingWithState:&v43 objects:v93 count:16];
    }
    while (v27);
  }
LABEL_54:
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayerItem_AVPlayerItemSpeedRamp__setSpeedRamp___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerItem *)self _updateSpeedRampDataOnFigPlaybackItem];
}

unint64_t __52__AVPlayerItem_AVPlayerItemSpeedRamp__setSpeedRamp___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1504) = *(id *)(a1 + 40);
  unint64_t result = [*(id *)(a1 + 40) length];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1512) = result / 0x60;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1520) = 1;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)speedRampAdjustabilityMargin
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 2, 1);
}

- (void)_updateSpeedRampDataOnFigPlaybackItem
{
  uint64_t v3 = [(AVPlayerItem *)self _copyFigPlaybackItem];
  if (v3)
  {
    uint64_t v4 = v3;
    figPlaybackItemSetterQueue = self->_playerItem->figPlaybackItemSetterQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__AVPlayerItem_AVPlayerItemSpeedRampInternal___updateSpeedRampDataOnFigPlaybackItem__block_invoke;
    v6[3] = &unk_1E57B2228;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_sync(figPlaybackItemSetterQueue, v6);
    CFRelease(v4);
  }
}

uint64_t __84__AVPlayerItem_AVPlayerItemSpeedRampInternal___updateSpeedRampDataOnFigPlaybackItem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1504);
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F33B80];
    return v8(FigBaseObject, v9, v1);
  }
  return result;
}

- (void)getEventTimelineWithCompletionHandler:(id)a3
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  CMTimeFlags v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  ivarAccessQueue = self->_playerItem->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke;
  block[3] = &unk_1E57B4250;
  void block[6] = &v26;
  void block[7] = &v22;
  void block[8] = &v18;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (!v23[3]) {
    goto LABEL_3;
  }
  uint64_t v6 = v27 + 3;
  if (v27[3]) {
    goto LABEL_3;
  }
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  long long v13 = *(uint64_t (**)(uint64_t, void, void, void *))(v11 + 48);
  if (v13)
  {
    signed int v7 = v13(FigBaseObject, *MEMORY[0x1E4F33A70], *MEMORY[0x1E4F1CF80], v6);
    if (!v7)
    {
      long long v14 = self->_playerItem->ivarAccessQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke_2;
      v16[3] = &unk_1E57B2160;
      v16[4] = self;
      v16[5] = &v26;
      av_readwrite_dispatch_queue_write(v14, v16);
LABEL_3:
      signed int v7 = 0;
    }
  }
  else
  {
    signed int v7 = -12782;
  }
  if (!*((unsigned char *)v19 + 24))
  {
    uint64_t v8 = v27[3];
    if (v8)
    {
      (*((void (**)(id, uint64_t, void))a3 + 2))(a3, v8, 0);
    }
    else
    {
      if (v7) {
        uint64_t v12 = AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
      }
      else {
        uint64_t v12 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
      }
      (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v12);
    }
  }
  CMTimeEpoch v15 = (const void *)v27[3];
  if (v15) {
    CFRelease(v15);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(const void **)(v2 + 120);
  if (v3)
  {
    uint64_t v4 = *(const void **)(v2 + 1496);
    if (v4)
    {
      CFTypeRef v5 = CFRetain(v4);
      uint64_t v6 = a1[6];
    }
    else
    {
      CFTypeRef v5 = CFRetain(v3);
      uint64_t v6 = a1[7];
    }
    *(void *)(*(void *)(v6 + 8) + 24) = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    signed int v7 = (void *)a1[5];
    if (v7)
    {
      id v8 = (id)[v7 copy];
      [*(id *)(*(void *)(a1[4] + 8) + 1488) addObject:v8];
    }
  }
}

void __92__AVPlayerItem_AVMetricEventStreamPublisherInternal__getEventTimelineWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(const void **)(v1 + 1496);
  uint64_t v3 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(void *)(v1 + 1496) = v3;
  if (v3) {
    CFRetain(v3);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

@end