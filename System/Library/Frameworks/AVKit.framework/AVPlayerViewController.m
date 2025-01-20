@interface AVPlayerViewController
+ (BOOL)usesSecondGenerationControls;
+ (id)keyPathsForValuesAffectingAnalysisInteractionInProgress;
+ (id)keyPathsForValuesAffectingPictureInPictureActive;
+ (id)keyPathsForValuesAffectingPictureInPicturePossible;
+ (id)keyPathsForValuesAffectingPictureInPictureSuspended;
+ (id)keyPathsForValuesAffectingPictureInPictureWasStartedWhenEnteringBackground;
+ (id)keyPathsForValuesAffectingPixelBufferAttributes;
+ (id)keyPathsForValuesAffectingSelectedSpeed;
+ (id)keyPathsForValuesAffectingSpeeds;
+ (id)keyPathsForValuesAffectingToggleLookupAction;
+ (id)keyPathsForValuesAffectingTransportBarCustomMenuItems;
+ (id)keyPathsForValuesAffectingVideoDisplaySize;
+ (id)keyPathsForValuesAffectingVideoGravity;
+ (void)setUsesSecondGenerationControls:(BOOL)a3;
- ($175F2685EF764341F5DD80B75CC65478)chromelessControlsViewController:(id)a3 contentTabPresentationInfoWithPreferredHeight:(double)a4;
- (AVBehaviorStorage)_behaviorStorage;
- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect;
- (AVCenterTapGestureRecognizer)tapThroughGestureRecognizer;
- (AVContentOverlayView)_actualContentOverlayView;
- (AVGroupExperienceCoordinator)groupExperienceCoordinator;
- (AVInfoTabCoordinator)infoTabCoordinator;
- (AVLayerVideoGravity)videoGravity;
- (AVMobileChromelessControlsViewController)_createPreferredControlsViewController;
- (AVMobileControlsViewController)controlsViewController;
- (AVObservationController)_observationController;
- (AVObservationController)_pipActivitySessionObservationController;
- (AVPictureInPictureController)pictureInPictureController;
- (AVPlaybackControlsController)playbackControlsController;
- (AVPlaybackSpeed)selectedSpeed;
- (AVPlaybackSpeedCollection)playbackSpeedCollection;
- (AVPlayer)contentTransitioningPlayer;
- (AVPlayer)player;
- (AVPlayerController)playerController;
- (AVPlayerControllerVolumeAnimator)volumeAnimator;
- (AVPlayerViewController)initWithCoder:(id)a3;
- (AVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AVPlayerViewController)initWithPlayerLayerView:(id)a3;
- (AVPlayerViewControllerConfiguration)configuration;
- (AVPlayerViewControllerContentTransitioning_NewsOnly)contentTransitioningDelegate;
- (AVPlayerViewControllerContentView)contentView;
- (AVPlayerViewControllerCustomControlsView)customControlsView;
- (AVPlayerViewControllerPlaybackDelegate)privateDelegate;
- (AVPlayerViewControllerSkippingBehavior)skippingBehavior;
- (AVPresentationContext)presentationContext;
- (AVTransitionController)_transitionController;
- (AVVideoFrameAnalysisType)videoFrameAnalysisTypes;
- (AVVisualAnalysisView)analysisView;
- (BOOL)_canEnterFullScreen;
- (BOOL)_contentTabsVisible;
- (BOOL)_controlsViewControllerPrefersStatusBarHidden;
- (BOOL)_delegateRespondsTo:(SEL)a3;
- (BOOL)_hasBegunObservation;
- (BOOL)_hoverGestureRecognizer:(id)a3 hasCursorOverView:(id)a4;
- (BOOL)_isDescendantOfRootViewController;
- (BOOL)_isReadyToConnectSynchronousChecks;
- (BOOL)_isTrackingUserInteraction;
- (BOOL)_isTrackingUserInteractionWithInteractiveView;
- (BOOL)_isTransitioningToOrFromFullScreen;
- (BOOL)_isUnsupportedContent;
- (BOOL)_modalPresentationStyleIsFullScreen;
- (BOOL)_shouldEnterFullScreenAfterPlaybackBegins;
- (BOOL)_shouldPausePlaybackWhenExitingFullscreen;
- (BOOL)_shouldShowPictureInPictureButton;
- (BOOL)_showsWolfControls;
- (BOOL)_wantsNowPlayingInfoCenter:(BOOL)a3;
- (BOOL)actuallyRequiresLinearPlayback;
- (BOOL)allowInfoMetadataSubpanel;
- (BOOL)allowsEnteringFullScreen;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)allowsVideoFrameAnalysis;
- (BOOL)analysisInteractionInProgress;
- (BOOL)appliesPreferredDisplayCriteriaAutomatically;
- (BOOL)avkit_isEffectivelyFullScreen;
- (BOOL)avkit_isVisible;
- (BOOL)avkit_wantsManagedSecondScreenPlayback;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBeginTrimming;
- (BOOL)canControlPlayback;
- (BOOL)canDisplayContentInDetachedWindow;
- (BOOL)canHidePlaybackControls;
- (BOOL)canIncludePlaybackControlsWhenInline;
- (BOOL)canPausePlaybackWhenClosingPictureInPicture;
- (BOOL)canPausePlaybackWhenExitingFullScreen;
- (BOOL)canShowPictureInPictureButton;
- (BOOL)canStartPictureInPictureAutomaticallyFromInline;
- (BOOL)canStartPictureInPictureAutomaticallyWhenEnteringBackground;
- (BOOL)canToggleVideoGravityWhenEmbeddedInline;
- (BOOL)entersFullScreenWhenPlaybackBegins;
- (BOOL)exitsFullScreenWhenPlaybackEnds;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasActiveTransition;
- (BOOL)hasCustomPlaybackControls;
- (BOOL)hasPerformedInitialSetup;
- (BOOL)isAtLiveEdge;
- (BOOL)isAudioOnlyContent;
- (BOOL)isContentTransitionInteractive;
- (BOOL)isHoveringOverPlaybackControl;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPictureInPictureSuspended;
- (BOOL)isPresentedFullScreen;
- (BOOL)isPresentingDetachedFullScreen;
- (BOOL)isPresentingFullScreenFromInline;
- (BOOL)isPresentingFullWindow;
- (BOOL)isReadyForDisplay;
- (BOOL)isSkipBackwardEnabled;
- (BOOL)isSkipForwardEnabled;
- (BOOL)isStartNextContentTransitionButtonEnabled;
- (BOOL)isStartPreviousContentTransitionButtonEnabled;
- (BOOL)isUpdatingSecondScreenConnectionReadyToConnect;
- (BOOL)modalPresentationCapturesStatusBarAppearance;
- (BOOL)observesMediaSelectionForSmartSubtitlesController:(id)a3;
- (BOOL)pictureInPictureWasStartedWhenEnteringBackground;
- (BOOL)playbackControlsIncludeDisplayModeControls;
- (BOOL)playbackControlsIncludeFullScreenLoadingSpinner;
- (BOOL)playbackControlsIncludeInfoViews;
- (BOOL)playbackControlsIncludeTransportBar;
- (BOOL)playbackControlsIncludeTransportControls;
- (BOOL)playbackControlsIncludeVolumeControls;
- (BOOL)playbackControlsShouldControlSystemVolume;
- (BOOL)playerControllerCanRestorePlaybackRateAfterAudioSessionDeactivation:(id)a3;
- (BOOL)playerViewControllerContentViewIsPlayingOnSecondScreen:(id)a3;
- (BOOL)prefersDeviceUserInterfaceStyle;
- (BOOL)prefersStatusBarHidden;
- (BOOL)requiresFullSubtitles;
- (BOOL)requiresImmediateAssetInspection;
- (BOOL)requiresLinearPlayback;
- (BOOL)requiresMonoscopicViewingMode;
- (BOOL)shouldBeginTouchInteractionForVisualAnalysisView:(id)a3;
- (BOOL)shouldUseNetworkingResourcesForLiveStreamingWhilePaused;
- (BOOL)showsAnalysisButtonIfAvailable;
- (BOOL)showsAudioLanguageMenu;
- (BOOL)showsExitFullScreenButton;
- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline;
- (BOOL)showsPlaybackControls;
- (BOOL)showsTimecodes;
- (BOOL)showsVisualLookup;
- (BOOL)titleMetadataIncludesHDRBadge;
- (BOOL)titleMetadataIncludesProResBadge;
- (BOOL)transitionController:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5;
- (BOOL)transitionControllerCanBeginInteractiveDismissalTransition:(id)a3;
- (BOOL)transitionControllerCanBeginInteractivePresentationTransition:(id)a3;
- (BOOL)transportBarIncludesTitleView;
- (BOOL)updatesNowPlayingInfoCenter;
- (BOOL)volumeControlsCanShowSlider;
- (BOOL)wantsDetachedFullscreenPresentation;
- (BOOL)wasInitializedUsingWebKitSPI;
- (CGAffineTransform)overrideTransformForProminentPlayButton;
- (CGRect)avkit_videoRectInWindow;
- (CGRect)videoBounds;
- (CGSize)secondScreenConnectionDisplaySize;
- (CGSize)videoDisplaySize;
- (NSArray)allowedSubtitleOptionLanguages;
- (NSArray)behaviors;
- (NSArray)contextualActions;
- (NSArray)customControlItems;
- (NSArray)customInfoViewControllers;
- (NSArray)infoViewActions;
- (NSArray)speeds;
- (NSArray)transportBarCustomMenuItems;
- (NSDictionary)pixelBufferAttributes;
- (NSMutableDictionary)_localizedDiscoverabilityTitleForKeyCommandLocalizationKey;
- (NSMutableDictionary)_targetVideoGravitiesForLayoutClass;
- (NSString)infoHint;
- (NSString)overrideParentApplicationDisplayIdentifier;
- (NSString)pictureInPictureActivitySessionIdentifier;
- (NSValue)overrideLayoutMarginsWhenEmbeddedInline;
- (UIAction)toggleLookupAction;
- (UIEdgeInsets)_clientLegibleContentInsets;
- (UIEdgeInsets)legibleContentInsets;
- (UIEdgeInsets)playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:(id)a3;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UIImage)contextualActionsPreviewImage;
- (UILayoutGuide)unobscuredContentGuide;
- (UIMenuElement)transportBarCustomAudioMenu;
- (UIPanGestureRecognizer)scrubGestureRecognizer;
- (UIView)contentOverlayView;
- (UIView)contentTransitioningOverlayView;
- (UIView)contextualActionsInfoView;
- (UIView)customContentTransitioningInfoPanel;
- (UIView)iAdPrerollView;
- (UIViewController)customOverlayViewController;
- (UIViewController)fullScreenViewController;
- (UIViewController)infoTabViewController;
- (UIViewController)viewControllerForFullScreenPresentation;
- (UIWindow)avkit_window;
- (VKCImageAnalysis)imageAnalysis;
- (__AVPlayerLayerView)playerLayerView;
- (double)_applyNonlinearScaleToScrubGestureVelocity:(double)a3;
- (double)_availableSpaceForContentTabWithVideoDodgingForSize:(CGSize)a3;
- (double)_seekDistanceForScrubGestureWithVelocity:(double)a3;
- (double)defaultPlaybackRate;
- (double)videoDisplayScale;
- (id)_activeViewControllerForContentView;
- (id)_chromeControlsViewController;
- (id)_currentAnalysis;
- (id)_defaultInfoViewActions;
- (id)_fullScreenController;
- (id)_newsWidgetPlayerBehaviorContext;
- (id)_newsWidgetPlayerLegacyBehavior;
- (id)_transitionControllerIfLoaded;
- (id)_volumeController;
- (id)avkit_pictureInPictureViewController;
- (id)controlsViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4;
- (id)delegate;
- (id)dismissForPIPStartAfterPresentationHandler;
- (id)finishPreparingForInteractiveDismissalHandler;
- (id)interactiveContentOverlayView;
- (id)interactiveDismissalCompletionHandler;
- (id)keyCommands;
- (id)pendingRestoreUserInterfaceForPictureInPictureStopHandler;
- (id)playButtonHandlerForLazyPlayerLoading;
- (id)playbackContainerViewForFullScreenViewController:(id)a3;
- (id)scrubGestureConfigurationSettings;
- (id)scrubbingGestureConfigurationForGestureController:(id)a3;
- (id)transitionController:(id)a3 configurationForPresentedViewController:(id)a4 presentingViewController:(id)a5;
- (id)transitionController:(id)a3 targetViewForDismissingViewController:(id)a4;
- (id)transitionControllerBackgroundViewBackgroundColor:(id)a3;
- (id)transitionControllerPresentedViewBackgroundColor:(id)a3;
- (id)transitioningDelegate;
- (int64_t)_numberOfTrackedUserInteractions;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)activeContentTransitionType;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)avkit_contentSourceType;
- (int64_t)controlsGeneration;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)preferredPlaybackControlsSupplementalSubtitleDisplayOption;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnobscuredArea;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (uint64_t)_performInitialSetup;
- (uint64_t)_updateControlsViewControllerInitialState;
- (uint64_t)_updateControlsViewControllerPerformanceState;
- (uint64_t)_updateControlsVisibilityPolicyAnimated:(uint64_t)result;
- (uint64_t)_updateGesturesEnablementStates;
- (uint64_t)_updateScrubbingGestureEnabledState;
- (uint64_t)_updateSecondGenerationControlsGestureEnablementStates;
- (uint64_t)_updateShowsAnalysisControl;
- (uint64_t)_updateTapThroughGestureRecognizerEnablementState;
- (uint64_t)_updateVisualAnalysisViewActiveInteractionTypes;
- (uint64_t)_updateVisualAnalysisViewHiddenState;
- (void)_addObservers;
- (void)_attachContentTabPanGestureRecognizerIfNeeded;
- (void)_avkitDidBeginPresentationTransition;
- (void)_avkitWillBeginPresentationTransition;
- (void)_beginScrubGestureIfNeeded;
- (void)_beginTrackingUserInteraction;
- (void)_chromelessControlsViewController:(id)a3 willBeginContentTabTransitionWithContext:(id)a4;
- (void)_contentViewDidMoveWindow;
- (void)_contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)_copySubjectMenuItemPressedEvent:(id)a3;
- (void)_createPictureInPictureControllerIfNeeded;
- (void)_didBeginPlayingOnSecondScreen;
- (void)_didEndPlayingOnSecondScreen;
- (void)_endScrubGestureIfActive;
- (void)_endTrackingUserInteraction;
- (void)_ensureBehaviorStorage;
- (void)_enterFullScreenWhenPlayingIfNeeded;
- (void)_handleDoubleTapGesture:(id)a3;
- (void)_handleFastForwardKeyPressedCommand:(id)a3;
- (void)_handleFastForwardKeyReleasedCommand:(id)a3;
- (void)_handleGoToBeginningKeyCommand:(id)a3;
- (void)_handleHoverGestureRecognizer:(id)a3;
- (void)_handlePlayPauseKeyCommand:(id)a3;
- (void)_handlePlaybackToggleNotificationForMetricsCollectionEvent;
- (void)_handleRewindKeyPressedCommand:(id)a3;
- (void)_handleRewindKeyReleasedCommand:(id)a3;
- (void)_handleScrubbingGestureRecognizer:(id)a3;
- (void)_handleShowNextFrameKeyCommand:(id)a3;
- (void)_handleShowPreviousFrameKeyCommand:(id)a3;
- (void)_handleSingleTapGesture:(id)a3;
- (void)_handleSkipAhead15SecondsKeyCommand:(id)a3;
- (void)_handleSkipBack15SecondsKeyCommand:(id)a3;
- (void)_handleUserInteractionObservationRecognizer:(id)a3;
- (void)_handleVideoGravityPinchGesture:(id)a3;
- (void)_handleVolumeDownKeyPressedCommand:(id)a3;
- (void)_handleVolumeDownKeyReleasedCommand:(id)a3;
- (void)_handleVolumeUpKeyPressedCommand:(id)a3;
- (void)_handleVolumeUpKeyReleasedCommand:(id)a3;
- (void)_mediaSelectionDoneButtonTapped:(id)a3;
- (void)_notifyDelegateOfAnalysisCalloutAction;
- (void)_notifyOfMetricsCollectionEvent:(int64_t)a3;
- (void)_playPauseButtonWasPressedEvent:(id)a3;
- (void)_resetVisualAnalysisViewSelectionIfNeeded;
- (void)_seekForScrubGestureWithVelocity:(double)a3;
- (void)_setClientLegibleContentInsets:(UIEdgeInsets)a3;
- (void)_setContentViewOnSelf;
- (void)_setNumberOfTrackedUserInteractions:(int64_t)a3;
- (void)_setSecondScreenConnectionReadyToConnect:(BOOL)a3;
- (void)_setUpEnhanceDialogueControllerIfNeeded;
- (void)_setUpGestureRecognizersIfNeeded;
- (void)_setUpSecondScreenConnectionIfNeeded;
- (void)_setUpVideoFrameVisualAnalyzerIfNeeded;
- (void)_setUpVisualAnalysisViewIfNeeded;
- (void)_setupInfoTabViewController;
- (void)_setupInterstitialControllerDelegateIfNeeded;
- (void)_setupToggleVisualLookupActionIfNeeded;
- (void)_startPlayerLayerViewObservationsIfNeeded;
- (void)_togglePictureInPicture;
- (void)_togglePlaybackForCenterTapGesture:(id)a3;
- (void)_transitionFromDetachedFullScreenPresentationToInlineAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_transitionFromFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_transitionFromFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5;
- (void)_transitionFromFullScreenPresentationToInlineAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5;
- (void)_transitionFromFullScreenWithReason:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)_transitionToAttachedFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5;
- (void)_transitionToDetachedFullScreenCompletionHandler:(id)a3;
- (void)_transitionToFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5;
- (void)_updateActivePlaybackSpeedIfNeeded;
- (void)_updateActuallyRequiresLinearPlayback;
- (void)_updateAnalysisButtonBottomInsetIfNeeded;
- (void)_updateAnalysisViewImageAnalysis;
- (void)_updateAnalysisViewSuperview;
- (void)_updateAudioOnlyIndicatorView;
- (void)_updateContentOverlayViewSuperview;
- (void)_updateContentViewEdgeInsetsForLetterboxedContent;
- (void)_updateCustomControlsViewStateWithVisibleControlsSet:(unint64_t)a3;
- (void)_updateCustomControlsViewSuperViewIfNeeded;
- (void)_updateCustomInfoViewControllersIfNeeded;
- (void)_updateDefaultLinearPlaybackRateIfNeeded;
- (void)_updateDefaultPlaybackRateIfNeeded;
- (void)_updateEnhanceDialogueEnabled;
- (void)_updateExcludedControls;
- (void)_updateExternalPlaybackIndicatorView;
- (void)_updateIncludedControls;
- (void)_updateInfoTabViewControllerIfNeeded;
- (void)_updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:(double)a3;
- (void)_updateNowPlayingInfoController;
- (void)_updateNowPlayingInfoControllerSuspendedState;
- (void)_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground;
- (void)_updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded;
- (void)_updatePlaybackControlsCanHideStateIfNeeded;
- (void)_updatePlaybackControlsState;
- (void)_updatePlayerControllerInspectionState;
- (void)_updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:(void *)a1;
- (void)_updatePlayerLayerLegibleContentInsetsIfNeeded;
- (void)_updatePrefersFullScreenStyleForEmbeddedMode;
- (void)_updateSecondGenerationContentTabsGestureEnablementState;
- (void)_updateSecondScreenConnectionPlayingState;
- (void)_updateSecondScreenConnectionReadyToConnect;
- (void)_updateSelectedPlaybackSpeedIfPlayerControllerRateChanges;
- (void)_updateSmartSubtitlesEnablementIfNeeded;
- (void)_updateStatusBarGradientViewVisibility;
- (void)_updateSupplementalSubtitlesIfNecessary;
- (void)_updateUnsupportedContentIndicatorView;
- (void)_updateViewControllerPreferencesIfNeeded;
- (void)_updateVisualAnalyzerEnabledStateIfNeeded;
- (void)_updateVolumeController;
- (void)_updateWantsAnalysisButtonVisibleStateIfNeeded;
- (void)_visualLookupMenuItemPressedEvent:(id)a3;
- (void)_volumeButtonWasPressedEvent:(id)a3;
- (void)activeContentViewDidChange;
- (void)addBehavior:(id)a3;
- (void)avkit_beginReducingResourcesForPictureInPictureViewController:(id)a3 playerController:(id)a4;
- (void)avkit_endReducingResourcesForPictureInPictureViewController:(id)a3 playerController:(id)a4;
- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3;
- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3;
- (void)avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:(id)a3;
- (void)chromelessControlsViewControllerDidPressLiveTextButton:(id)a3;
- (void)chromelessControlsViewControllerDidPressSkipBackButton:(id)a3;
- (void)chromelessControlsViewControllerDidPressSkipForwardButton:(id)a3;
- (void)controlsViewController:(id)a3 willBeginUpdatingVisibleControlsTo:(unint64_t)a4 withAnimationCoordinator:(id)a5;
- (void)controlsViewControllerDidUpdateLayoutGuides:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didPresentInterstitialGroup:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enterFullScreen:(id)a3;
- (void)enterFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)enterFullScreenWithCompletion:(id)a3;
- (void)exitFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)exitFullScreenWithCompletion:(id)a3;
- (void)exitFullscreen:(id)a3;
- (void)flashPlaybackControlsWithDuration:(double)a3;
- (void)fullScreenViewController:(id)a3 viewWillTransitionToSize:(CGSize)a4 coordinator:(id)a5;
- (void)fullScreenViewControllerDidAttachContentView:(id)a3;
- (void)fullScreenViewControllerWillAttachContentView:(id)a3;
- (void)fullScreenViewControllerWillBeginFullScreenPresentation:(id)a3;
- (void)fullScreenViewControllerWillEndFullScreenPresentation:(id)a3;
- (void)loadView;
- (void)mediaSelectionButtonTapped:(id)a3;
- (void)performInitialSetupIfNeededAndPossible;
- (void)pictureInPictureButtonTapped:(id)a3;
- (void)pictureInPictureController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)pictureInPictureController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)pictureInPictureControllerDidSkipBackwardInPictureInPicture:(id)a3;
- (void)pictureInPictureControllerDidSkipForwardInPictureInPicture:(id)a3;
- (void)pictureInPictureControllerDidStartPictureInPicture:(id)a3;
- (void)pictureInPictureControllerDidStopPictureInPicture:(id)a3;
- (void)pictureInPictureControllerWillStartPictureInPicture:(id)a3;
- (void)pictureInPictureControllerWillStopPictureInPicture:(id)a3;
- (void)playbackControlsView:(id)a3 animateAlongsideVisibilityAnimationsWithAnimationCoordinator:(id)a4 appearingViews:(id)a5 disappearingViews:(id)a6;
- (void)playbackControlsViewDidToggleControlsVisibility:(id)a3;
- (void)playbackControlsViewNeedsUpdateStatusBarAppearance:(id)a3;
- (void)playbackSpeedCollection:(id)a3 selectedPlaybackSpeedDidChangeTo:(id)a4;
- (void)playerControllerDidUpdateIsPlayingHDRContent:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)removeBehavior:(id)a3;
- (void)scrollingObserverDidChangeScrollingState:(id)a3;
- (void)scrubbingGestureControllerStateDidChange:(id)a3;
- (void)selectSpeed:(AVPlaybackSpeed *)speed;
- (void)setActuallyRequiresLinearPlayback:(BOOL)a3;
- (void)setAllowInfoMetadataSubpanel:(BOOL)a3;
- (void)setAllowedSubtitleOptionLanguages:(NSArray *)allowedSubtitleOptionLanguages;
- (void)setAllowsEnteringFullScreen:(BOOL)a3;
- (void)setAllowsPictureInPicturePlayback:(BOOL)allowsPictureInPicturePlayback;
- (void)setAllowsVideoFrameAnalysis:(BOOL)allowsVideoFrameAnalysis;
- (void)setAnalysisView:(id)a3;
- (void)setAppliesPreferredDisplayCriteriaAutomatically:(BOOL)appliesPreferredDisplayCriteriaAutomatically;
- (void)setCacheLargestInscribedRect:(id)a3;
- (void)setCanDisplayContentInDetachedWindow:(BOOL)a3;
- (void)setCanHidePlaybackControls:(BOOL)a3;
- (void)setCanIncludePlaybackControlsWhenInline:(BOOL)a3;
- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3;
- (void)setCanPausePlaybackWhenExitingFullScreen:(BOOL)a3;
- (void)setCanShowPictureInPictureButton:(BOOL)a3;
- (void)setCanStartPictureInPictureAutomaticallyFromInline:(BOOL)canStartPictureInPictureAutomaticallyFromInline;
- (void)setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:(BOOL)a3;
- (void)setCanToggleVideoGravityWhenEmbeddedInline:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentTransitioningDelegate:(id)a3;
- (void)setContextualActions:(NSArray *)contextualActions;
- (void)setContextualActionsPreviewImage:(UIImage *)contextualActionsPreviewImage;
- (void)setControlsGeneration:(int64_t)a3;
- (void)setCustomContentTransitioningInfoPanel:(id)a3;
- (void)setCustomControlItems:(id)a3;
- (void)setCustomInfoViewControllers:(NSArray *)customInfoViewControllers;
- (void)setCustomOverlayViewController:(UIViewController *)customOverlayViewController;
- (void)setDefaultPlaybackRate:(double)a3;
- (void)setDelegate:(id)delegate;
- (void)setDismissForPIPStartAfterPresentationHandler:(id)a3;
- (void)setEntersFullScreenWhenPlaybackBegins:(BOOL)entersFullScreenWhenPlaybackBegins;
- (void)setEntersFullScreenWhenTapped:(BOOL)a3;
- (void)setExitsFullScreenWhenPlaybackEnds:(BOOL)exitsFullScreenWhenPlaybackEnds;
- (void)setFinishPreparingForInteractiveDismissalHandler:(id)a3;
- (void)setHasPerformedInitialSetup:(BOOL)a3;
- (void)setHoverGestureRecognizer:(id)a3;
- (void)setHoveringOverPlaybackControl:(BOOL)a3;
- (void)setImageAnalysis:(id)a3;
- (void)setInfoHint:(id)a3;
- (void)setInfoTabCoordinator:(id)a3;
- (void)setInfoTabViewController:(id)a3;
- (void)setInfoViewActions:(NSArray *)infoViewActions;
- (void)setInteractiveDismissalCompletionHandler:(id)a3;
- (void)setIsUpdatingSecondScreenConnectionReadyToConnect:(BOOL)a3;
- (void)setLegibleContentInsets:(UIEdgeInsets)a3;
- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3;
- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3;
- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3;
- (void)setPendingRestoreUserInterfaceForPictureInPictureStopHandler:(id)a3;
- (void)setPictureInPictureActivitySessionIdentifier:(id)a3;
- (void)setPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes;
- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3;
- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3;
- (void)setPlaybackControlsIncludeFullScreenLoadingSpinner:(BOOL)a3;
- (void)setPlaybackControlsIncludeInfoViews:(BOOL)playbackControlsIncludeInfoViews;
- (void)setPlaybackControlsIncludeTransportBar:(BOOL)playbackControlsIncludeTransportBar;
- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3;
- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3;
- (void)setPlaybackControlsShouldControlSystemVolume:(BOOL)a3;
- (void)setPlaybackSpeedCollection:(id)a3;
- (void)setPlayer:(AVPlayer *)player;
- (void)setPlayerController:(id)a3;
- (void)setPlayerLayerView:(id)a3;
- (void)setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:(int64_t)a3;
- (void)setPreferredUnobscuredArea:(int64_t)a3;
- (void)setPrefersDeviceUserInterfaceStyle:(BOOL)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setReadyForDisplay:(BOOL)a3;
- (void)setRequiresFullSubtitles:(BOOL)requiresFullSubtitles;
- (void)setRequiresImmediateAssetInspection:(BOOL)a3;
- (void)setRequiresLinearPlayback:(BOOL)requiresLinearPlayback;
- (void)setRequiresMonoscopicViewingMode:(BOOL)requiresMonoscopicViewingMode;
- (void)setScrubGestureRecognizer:(id)a3;
- (void)setSecondScreenConnectionDisplaySize:(CGSize)a3;
- (void)setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:(BOOL)a3;
- (void)setShowsAnalysisButtonIfAvailable:(BOOL)a3;
- (void)setShowsAudioLanguageMenu:(BOOL)a3;
- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3;
- (void)setShowsPlaybackControls:(BOOL)showsPlaybackControls;
- (void)setShowsTimecodes:(BOOL)showsTimecodes;
- (void)setShowsVisualLookup:(BOOL)a3;
- (void)setSkipBackwardEnabled:(BOOL)skipBackwardEnabled;
- (void)setSkipForwardEnabled:(BOOL)skipForwardEnabled;
- (void)setSkippingBehavior:(AVPlayerViewControllerSkippingBehavior)skippingBehavior;
- (void)setSpeeds:(NSArray *)speeds;
- (void)setStartNextContentTransitionButtonEnabled:(BOOL)a3;
- (void)setStartPreviousContentTransitionButtonEnabled:(BOOL)a3;
- (void)setTapThroughGestureRecognizer:(id)a3;
- (void)setTitleMetadataIncludesHDRBadge:(BOOL)a3;
- (void)setTitleMetadataIncludesProResBadge:(BOOL)a3;
- (void)setTransportBarCustomAudioMenu:(id)a3;
- (void)setTransportBarCustomMenuItems:(NSArray *)transportBarCustomMenuItems;
- (void)setTransportBarIncludesTitleView:(BOOL)transportBarIncludesTitleView;
- (void)setUpdatesNowPlayingInfoCenter:(BOOL)updatesNowPlayingInfoCenter;
- (void)setVideoBounds:(CGRect)a3;
- (void)setVideoFrameAnalysisTypes:(AVVideoFrameAnalysisType)videoFrameAnalysisTypes;
- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity;
- (void)setVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4;
- (void)setVideoGravityForTransitioningContent:(id)a3;
- (void)setView:(id)a3;
- (void)setVolumeAnimator:(id)a3;
- (void)setVolumeControlsCanShowSlider:(BOOL)a3;
- (void)setWantsDetachedFullscreenPresentation:(BOOL)a3;
- (void)setWasInitializedUsingWebKitSPI:(BOOL)a3;
- (void)setWebKitOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4;
- (void)set_hasBegunObservation:(BOOL)a3;
- (void)showFullScreenPresentationFromView:(id)a3 completion:(id)a4;
- (void)startContentTransition:(int64_t)a3;
- (void)startPictureInPicture;
- (void)stopPictureInPicture;
- (void)toggleMuted:(id)a3;
- (void)togglePlayback:(id)a3;
- (void)transitionController:(id)a3 animationProgressDidChange:(float)a4;
- (void)transitionController:(id)a3 prepareForFinishingInteractiveTransition:(id)a4;
- (void)transitionController:(id)a3 transitionWillComplete:(BOOL)a4 continueBlock:(id)a5;
- (void)transitionController:(id)a3 willBeginDismissingViewController:(id)a4;
- (void)transitionController:(id)a3 willBeginPresentingViewController:(id)a4;
- (void)transitionControllerBeginInteractiveDismissalTransition:(id)a3;
- (void)transitionControllerBeginInteractivePresentationTransition:(id)a3;
- (void)updateVideoBounds;
- (void)videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:(id)a3 withAnalysis:(id)a4;
- (void)videoFrameVisualAnalyzerFailedAnalyzingVideoFrame:(id)a3 withError:(id)a4;
- (void)videoGravityButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)visualAnalysisView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5;
- (void)visualAnalysisViewDidBeginInteraction:(BOOL)a3;
- (void)visualAnalysisViewDidPressAnalysisButton:(id)a3;
- (void)visualAnalysisViewDidUpdateSubjectAvailability:(id)a3;
- (void)visualAnalysisViewDidUpdateVisualLookupAvailability:(id)a3;
- (void)willPresentInterstitialGroup:(id)a3;
@end

@implementation AVPlayerViewController

- (void)addBehavior:(id)a3
{
  id v4 = a3;
  [(AVPlayerViewController *)self _ensureBehaviorStorage];
  id v5 = [(AVPlayerViewController *)self _behaviorStorage];
  [v5 addBehavior:v4];
}

- (void)_ensureBehaviorStorage
{
  if (![(AVPlayerViewController *)self _showsWolfControls] && !self->__behaviorStorage)
  {
    self->__behaviorStorage = [[AVBehaviorStorage alloc] initWithAVKitOwner:self];
    MEMORY[0x1F41817F8]();
  }
}

- (void)loadView
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerViewController *)self isViewLoaded])
  {
    v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[AVPlayerViewController loadView]";
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s Attempt to load view when view was already loaded.", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__8501;
    v44 = __Block_byref_object_dispose__8502;
    v45 = self->_playerLayerView;
    uint64_t v34 = 0;
    v35 = (id *)&v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__8501;
    v38 = __Block_byref_object_dispose__8502;
    id v39 = 0;
    id v4 = [AVPlaybackContentContainerView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = -[AVPlaybackContentContainerView initWithFrame:playerLayerView:contentOverlayView:](v4, "initWithFrame:playerLayerView:contentOverlayView:", *(void *)(*((void *)&buf + 1) + 40), 0, *MEMORY[0x1E4F1DB28], v6, v7, v8);
    v10 = [(AVPlayerViewController *)self _behaviorStorage];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __34__AVPlayerViewController_loadView__block_invoke;
    v30 = &unk_1E5FC28D8;
    v32 = &v34;
    v11 = v9;
    v31 = v11;
    p_long long buf = &buf;
    [v10 enumerateAllBehaviorContextsImplementingSelector:sel_makePlaybackContentContainerWithFrame_activeContentView_ forProtocol:&unk_1F0964880 usingBlock:&v27];

    if (v35[5]) {
      v12 = (AVPlaybackContentContainerView *)v35[5];
    }
    else {
      v12 = v11;
    }
    objc_storeStrong(v35 + 5, v12);
    objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "setPixelBufferAttributes:", self->_pixelBufferAttributes, v27, v28, v29, v30);
    v13 = *(void **)(*((void *)&buf + 1) + 40);
    v14 = [(AVPlayerViewController *)self playerController];
    [v13 setPlayerController:v14];

    [*(id *)(*((void *)&buf + 1) + 40) setVideoGravity:self->_videoGravity];
    v15 = [AVPlayerViewControllerContentView alloc];
    id v16 = v35[5];
    v17 = [(AVPlayerViewController *)self _targetVideoGravitiesForLayoutClass];
    v18 = -[AVPlayerViewControllerContentView initWithFrame:playbackContentContainerView:targetVideoGravities:](v15, "initWithFrame:playbackContentContainerView:targetVideoGravities:", v16, v17, v5, v6, v7, v8);

    [(AVPlayerViewControllerContentView *)v18 setDelegate:self];
    [(AVPlayerViewControllerContentView *)v18 setWantsBackdropView:self->_controlsGeneration != 1];
    [(AVPlayerViewControllerContentView *)v18 setShowsPlaybackControls:[(AVPlayerViewController *)self showsPlaybackControls]];
    [(AVPlayerViewControllerContentView *)v18 setCanAutomaticallyZoomLetterboxVideos:!self->_hasClientSetVideoGravity];
    v19 = [(AVPlayerViewControllerContentView *)v18 scrollingObserver];
    [v19 addDelegate:self];

    [(AVPlayerViewControllerContentView *)v18 setOverrideUserInterfaceStyle:[(AVPlayerViewController *)self overrideUserInterfaceStyle]];
    objc_storeStrong((id *)&self->_playerViewControllerContentView, v18);
    uint64_t v40 = objc_opt_class();
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    id v21 = (id)[(AVPlayerViewController *)self registerForTraitChanges:v20 withHandler:&__block_literal_global_269];

    v22 = [AVPlayerView alloc];
    v23 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "avkit_possibleWindowForControllingOverallAppearance");
    [v23 bounds];
    v24 = -[AVPlayerView initWithFrame:contentView:](v22, "initWithFrame:contentView:", v18, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    objc_storeStrong((id *)&self->_playerViewControllerView, v24);
    v25 = [(AVPresentationContainerView *)v24 appearanceProxy];
    [v25 setActualView:v35[5]];

    [(AVPlayerView *)v24 setAutoresizingMask:18];
    v26 = [MEMORY[0x1E4FB1618] blackColor];
    [(AVPresentationContainerView *)v24 setBackgroundColor:v26];

    [(AVPlayerViewController *)self setView:v24];
    if (!self->_playerLayerView) {
      [(AVPlayerViewController *)self setPlayerLayerView:*(void *)(*((void *)&buf + 1) + 40)];
    }
    self->_controlsViewControllerHasBeenSetUp = 0;
    kdebug_trace();

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)setView:(id)a3
{
  if (self->_playerViewControllerView == a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController setView:](&v3, sel_setView_);
  }
  else
  {
    NSLog(&cfstr_Avplayerviewco_26.isa, a2);
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  if (![(AVPlayerViewController *)self prefersDeviceUserInterfaceStyle]) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  return [(AVPlayerViewController *)&v4 overrideUserInterfaceStyle];
}

- (BOOL)prefersDeviceUserInterfaceStyle
{
  return self->_prefersDeviceUserInterfaceStyle;
}

- (void)_updatePlayerLayerLegibleContentInsetsIfNeeded
{
  objc_super v3 = [(AVPlayerViewController *)self playerLayerView];
  id v26 = [v3 playerLayer];

  if (objc_opt_respondsToSelector())
  {
    double top = self->_legibleContentInsets.top;
    double left = self->_legibleContentInsets.left;
    double bottom = self->_legibleContentInsets.bottom;
    double right = self->_legibleContentInsets.right;
    double v8 = [(AVPlayerViewController *)self playerController];
    if (([v8 isPlayingOnSecondScreen] & 1) == 0)
    {
      BOOL pipStartingOrActive = self->_pipStartingOrActive;

      if (pipStartingOrActive)
      {
LABEL_8:
        objc_msgSend(v26, "setLegibleContentInsets:", top, left, bottom, right);
        goto LABEL_9;
      }
      v10 = [(AVPlayerViewController *)self contentView];
      [v10 bounds];
      double v25 = v11;
      double v13 = v12;

      [(AVPlayerViewController *)self videoBounds];
      double v15 = v14;
      double v17 = v16;
      double v24 = v18;
      double v20 = v19;
      double top = top - v16;
      double left = left - v14;
      double v8 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
      id v21 = [v8 contentTabPresentationContext];
      [v21 presentationHeight];
      double v23 = v13 - v22;
      if (v23 >= v13 - bottom) {
        double v23 = v13 - bottom;
      }
      double bottom = v17 + v20 - v23;
      double right = v15 + v24 - (v25 - right);
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVPlayerViewControllerContentView)contentView
{
  return self->_playerViewControllerContentView;
}

- (__AVPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (CGRect)videoBounds
{
  double x = self->_videoBounds.origin.x;
  double y = self->_videoBounds.origin.y;
  double width = self->_videoBounds.size.width;
  double height = self->_videoBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

uint64_t __67__AVPlayerViewController__startPlayerLayerViewObservationsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateVideoBounds];
}

- (void)updateVideoBounds
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if ([(AVPlayerViewController *)self isViewLoaded])
  {
    [(__AVPlayerLayerView *)self->_playerLayerView videoBounds];
    if (v8 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      playerLayerView = self->_playerLayerView;
      [(__AVPlayerLayerView *)playerLayerView videoBounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v19 = [(AVPlayerViewController *)self contentView];
      -[__AVPlayerLayerView convertRect:toView:](playerLayerView, "convertRect:toView:", v19, v12, v14, v16, v18);

      double v20 = [(AVPlayerViewController *)self contentView];
      UIPointRoundToViewScale();
      double v3 = v21;
      double v4 = v22;

      double v23 = [(AVPlayerViewController *)self contentView];
      UIRoundToViewScale();
      double v5 = v24;

      double v25 = [(AVPlayerViewController *)self contentView];
      UIRoundToViewScale();
      double v6 = v26;
    }
  }
  -[AVPlayerViewController setVideoBounds:](self, "setVideoBounds:", v3, v4, v5, v6);

  [(AVPlayerViewController *)self _updatePlayerLayerLegibleContentInsetsIfNeeded];
}

- (void)setVideoBounds:(CGRect)a3
{
  self->_videoBounds = a3;
}

- (void)setCanPausePlaybackWhenExitingFullScreen:(BOOL)a3
{
  self->_canPausePlaybackWhenExitingFullScreen = a3;
}

- (void)setDelegate:(id)delegate
{
}

- (NSMutableDictionary)_targetVideoGravitiesForLayoutClass
{
  v13[3] = *MEMORY[0x1E4F143B8];
  targetVideoGravitiesForLayoutClass = self->__targetVideoGravitiesForLayoutClass;
  if (!targetVideoGravitiesForLayoutClass)
  {
    uint64_t v4 = [(AVPlayerViewController *)self videoGravity];
    double v5 = (void *)v4;
    double v6 = (void *)*MEMORY[0x1E4F15AF0];
    if (v4) {
      double v6 = (void *)v4;
    }
    id v7 = v6;

    v12[0] = &unk_1F0949F80;
    v12[1] = &unk_1F0949F98;
    v13[0] = v7;
    v13[1] = v7;
    v12[2] = &unk_1F0949FB0;
    v13[2] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v9 = (NSMutableDictionary *)[v8 mutableCopy];
    v10 = self->__targetVideoGravitiesForLayoutClass;
    self->__targetVideoGravitiesForLayoutClass = v9;

    targetVideoGravitiesForLayoutClass = self->__targetVideoGravitiesForLayoutClass;
  }

  return targetVideoGravitiesForLayoutClass;
}

- (void)setSpeeds:(NSArray *)speeds
{
  double v5 = speeds;
  if ([(NSArray *)v5 count])
  {
    uint64_t v4 = +[AVPlaybackSpeedCollection collectionWithSpeeds:v5];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(AVPlayerViewController *)self setPlaybackSpeedCollection:v4];
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v5 = (AVPlaybackSpeedCollection *)a3;
  p_playbackSpeedCollection = &self->_playbackSpeedCollection;
  if (self->_playbackSpeedCollection != v5)
  {
    id v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [(AVPlaybackSpeedCollection *)v5 internalDescription];
      int v10 = 136315394;
      double v11 = "-[AVPlayerViewController setPlaybackSpeedCollection:]";
      __int16 v12 = 2112;
      double v13 = v8;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s New playback speed collection set: %@", (uint8_t *)&v10, 0x16u);
    }
    [(AVPlaybackSpeedCollection *)*p_playbackSpeedCollection setDelegate:0];
    objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
    [(AVPlaybackSpeedCollection *)*p_playbackSpeedCollection setDelegate:self];
    [(AVControlsViewController *)self->_controlsViewController setPlaybackSpeedCollection:v5];
    v9 = [(AVPlayerViewController *)self playbackControlsController];
    [v9 setPlaybackSpeedCollection:v5];

    [(AVPlayerViewController *)self _updateDefaultPlaybackRateIfNeeded];
  }
}

- (BOOL)isPresentedFullScreen
{
  double v3 = [(AVPlayerViewController *)self parentViewController];
  BOOL v4 = !v3
    && [(AVPlayerViewController *)self _isDescendantOfRootViewController]
    && [(AVPlayerViewController *)self _modalPresentationStyleIsFullScreen];

  return v4;
}

- (BOOL)_isDescendantOfRootViewController
{
  v2 = self;
  double v3 = [(AVPlayerViewController *)v2 parentViewController];

  BOOL v4 = v2;
  if (v3)
  {
    double v5 = v2;
    do
    {
      BOOL v4 = [(AVPlayerViewController *)v5 parentViewController];

      double v6 = [(AVPlayerViewController *)v4 parentViewController];

      double v5 = v4;
    }
    while (v6);
  }
  id v7 = [(AVPlayerViewController *)v4 presentingViewController];

  if (v7)
  {
    do
    {
      double v8 = [(AVPlayerViewController *)v4 presentingViewController];

      v9 = [(AVPlayerViewController *)v8 presentingViewController];

      BOOL v4 = v8;
    }
    while (v9);
    if (v8) {
      goto LABEL_7;
    }
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  double v8 = v4;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
  int v10 = [(AVPlayerViewController *)v8 isEqual:v2] ^ 1;
LABEL_10:

  return v10;
}

- (BOOL)isPictureInPictureActive
{
  return [(AVPictureInPictureController *)self->_pictureInPictureController isPictureInPictureActive];
}

- (void)_updatePlaybackControlsState
{
  BOOL v3 = [(AVPlayerViewController *)self isPresentedFullScreen];
  BOOL v4 = [(AVPlayerViewController *)self isPresentingFullScreenFromInline];
  if ([(AVPlayerViewController *)self avkit_isEffectivelyFullScreen])
  {
    double v5 = [(AVPlayerViewController *)self presentingViewController];
    if (v5) {
      BOOL v6 = [(AVPlayerViewController *)self allowsEnteringFullScreen];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [(AVPlayerViewController *)self playbackControlsController];
  double v8 = v7;
  if (v4)
  {
    BOOL v6 = 1;
    [v7 setShowsDoneButtonWhenFullScreen:1];
  }
  else
  {
    v9 = [(AVPlayerViewController *)self presentingViewController];
    if (v9)
    {
      [v8 setShowsDoneButtonWhenFullScreen:1];
    }
    else
    {
      int v10 = [MEMORY[0x1E4F28B50] mainBundle];
      double v11 = [v10 bundleIdentifier];
      objc_msgSend(v8, "setShowsDoneButtonWhenFullScreen:", objc_msgSend(v11, "isEqualToString:", @"com.apple.iBooks"));
    }
  }

  __int16 v12 = [(AVPlayerViewController *)self playbackControlsController];
  objc_msgSend(v12, "setShowsPlaybackControls:", -[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"));

  double v13 = [(AVPlayerViewController *)self playbackControlsController];
  objc_msgSend(v13, "setShowsPictureInPictureButton:", -[AVPlayerViewController _shouldShowPictureInPictureButton](self, "_shouldShowPictureInPictureButton"));

  uint64_t v14 = [(AVPlayerViewController *)self playbackControlsController];
  objc_msgSend(v14, "setPlayerViewControllerHasInvalidViewControllerHierarchy:", -[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController") ^ 1);

  double v15 = [(AVPlayerViewController *)self playbackControlsController];
  [v15 setPlayerViewControllerIsPresentingFullScreen:v4];

  double v16 = [(AVPlayerViewController *)self playbackControlsController];
  [v16 setPlayerViewControllerIsPresentedFullScreen:v3];

  uint64_t v17 = 2;
  if (v6) {
    uint64_t v17 = 0;
  }
  if (v3) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17;
  }
  [(AVMobileFullscreenController *)self->_fullscreenController updatePresentationStateTo:v18];
  -[AVPlayerViewController _updateScrubbingGestureEnabledState]((uint64_t)self);
  [(AVPlayerViewController *)self _updateContentOverlayViewSuperview];

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
}

- (AVPlaybackControlsController)playbackControlsController
{
  v2 = [(AVPlayerViewController *)self _chromeControlsViewController];
  BOOL v3 = [v2 playbackControlsController];

  return (AVPlaybackControlsController *)v3;
}

- (id)_chromeControlsViewController
{
  v2 = [(AVPlayerViewController *)self controlsViewController];
  BOOL v3 = [v2 controlsViewControllerIfChromed];

  return v3;
}

- (AVMobileControlsViewController)controlsViewController
{
  controlsViewController = self->_controlsViewController;
  if (!controlsViewController)
  {
    -[AVPlayerViewController _createPreferredControlsViewController]((uint64_t)self);
    BOOL v4 = (AVMobileControlsViewController *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_controlsViewController;
    self->_controlsViewController = v4;

    -[AVPlayerViewController _updateControlsViewControllerInitialState]((uint64_t)self);
    controlsViewController = self->_controlsViewController;
  }

  return controlsViewController;
}

- (BOOL)isPresentingFullScreenFromInline
{
  v2 = [(AVPlayerViewController *)self fullScreenViewController];
  BOOL v3 = [v2 presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (UIViewController)fullScreenViewController
{
  BOOL v3 = [(AVPlayerViewController *)self _transitionControllerIfLoaded];
  BOOL v4 = [v3 presentationContext];
  double v5 = [v4 presentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = 0;
    if (v5 && v5 != self)
    {
      id v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Unexpected value for the transition controller's presentedViewController", v9, 2u);
      }

      BOOL v6 = 0;
    }
  }

  return (UIViewController *)v6;
}

- (id)_transitionControllerIfLoaded
{
  return self->_transitionController;
}

- (BOOL)avkit_isEffectivelyFullScreen
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerViewController *)self _showsWolfControls])
  {
    BOOL v3 = ![(AVPlayerViewController *)self modalPresentationStyle]
      || [(AVPlayerViewController *)self modalPresentationStyle] == 5
      || [(AVPlayerViewController *)self modalPresentationStyle] == 8;
    double v5 = [(AVPlayerViewController *)self view];
    BOOL v6 = [v5 window];

    if (v6)
    {
      id v7 = [(AVPlayerViewController *)self view];
      double v8 = [v7 window];
      v9 = [(AVPlayerViewController *)self view];
      [v9 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      uint64_t v18 = [(AVPlayerViewController *)self view];
      objc_msgSend(v8, "convertRect:fromView:", v18, v11, v13, v15, v17);

      UISizeRoundToScale();
      double v20 = v19;
      double v22 = v21;
      double v23 = [(AVPlayerViewController *)self view];
      double v24 = [v23 window];
      [v24 bounds];

      UISizeRoundToScale();
      double v26 = v25;
      double v28 = v27;
      BOOL v29 = v22 == v27 && v20 == v25;
      v30 = _AVLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136316162;
        uint64_t v34 = "-[AVPlayerViewController avkit_isEffectivelyFullScreen]";
        __int16 v35 = 2048;
        double v36 = v20;
        __int16 v37 = 2048;
        double v38 = v22;
        __int16 v39 = 2048;
        double v40 = v26;
        __int16 v41 = 2048;
        double v42 = v28;
        _os_log_impl(&dword_1B05B7000, v30, OS_LOG_TYPE_DEFAULT, "%s view size (%f x %f) vs window size (%f x %f)", (uint8_t *)&v33, 0x34u);
      }
    }
    else
    {
      BOOL v29 = 0;
    }
    return v3 || v29;
  }
  else if ([(AVPlayerViewController *)self isPresentedFullScreen] {
         || [(AVPlayerViewController *)self isPresentingFullScreenFromInline])
  }
  {
    return 1;
  }
  else
  {
    v31 = [(AVPlayerViewController *)self contentView];
    char v32 = [v31 isCoveringWindow];

    return v32;
  }
}

- (uint64_t)_updateScrubbingGestureEnabledState
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 1184) == 1)
    {
      v2 = +[AVKitGlobalSettings shared];
      uint64_t v3 = [v2 overVideoScrubbingGestureEnabled];

      if (v3)
      {
        BOOL v4 = [*(id *)(v1 + 1176) fullscreenController];
        uint64_t v3 = [v4 presentationState] != 2
          && ([(id)v1 actuallyRequiresLinearPlayback] & 1) == 0
          && !-[AVPlayerViewController _contentTabsVisible](v1);
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    double v5 = *(void **)(v1 + 1144);
    return [v5 setEnabled:v3];
  }
  return result;
}

- (uint64_t)_updateControlsViewControllerPerformanceState
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [*(id *)(result + 1168) scrollingObserver];
    uint64_t v3 = [v2 isScrolling];

    BOOL v4 = *(void **)(v1 + 1176);
    return [v4 setOptimizeForPerformance:v3];
  }
  return result;
}

- (uint64_t)_updateControlsViewControllerInitialState
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    -[AVPlayerViewController _updateShowsAnalysisControl](result);
    [v1 _updateIncludedControls];
    -[AVPlayerViewController _updateExcludedControls]((uint64_t)v1);
    -[AVPlayerViewController _updatePrefersFullScreenStyleForEmbeddedMode]((uint64_t)v1);
    [v1 _updateCustomControlsViewStateWithVisibleControlsSet:0];
    return -[AVPlayerViewController _updateControlsViewControllerPerformanceState]((uint64_t)v1);
  }
  return result;
}

- (void)_updatePrefersFullScreenStyleForEmbeddedMode
{
  if (a1)
  {
    id v2 = [*(id *)(a1 + 1176) controlsViewControllerIfChromeless];
    objc_msgSend(v2, "setPrefersFullScreenStyleForEmbeddedMode:", objc_msgSend(*(id *)(a1 + 1456), "prefersFullScreenStyleForEmbeddedMode"));
  }
}

- (void)_updateIncludedControls
{
  if (self)
  {
    uint64_t p_playbackControlsIncludeTransportControls = (uint64_t)&self->_playbackControlsIncludeTransportControls;
    uint64_t v3 = 72;
    if (self->_controlsGeneration != 1) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = 57;
    if (self->_controlsGeneration == 1) {
      uint64_t v4 = 121;
    }
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t p_playbackControlsIncludeTransportControls = 1018;
    uint64_t v4 = 57;
  }
  if (*(unsigned char *)p_playbackControlsIncludeTransportControls) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  if (self->_playbackControlsIncludeDisplayModeControls) {
    v5 |= 4uLL;
  }
  if (self->_playbackControlsIncludeVolumeControls) {
    uint64_t v6 = v5 | 2;
  }
  else {
    uint64_t v6 = v5;
  }
  [(AVMobileControlsViewController *)self->_controlsViewController setIncludedControls:v6];
}

- (void)_updateExcludedControls
{
  if (a1)
  {
    id v2 = [*(id *)(a1 + 1176) controlsViewControllerIfChromeless];
    objc_msgSend(v2, "setExcludedControls:", objc_msgSend(*(id *)(a1 + 1456), "excludedControls"));
    -[AVPlayerViewController _updateTapThroughGestureRecognizerEnablementState](a1);
  }
}

- (uint64_t)_updateTapThroughGestureRecognizerEnablementState
{
  uint64_t v2 = *(void *)(a1 + 1184);
  char v3 = [*(id *)(a1 + 1456) excludedControls];
  if (v2 == 1) {
    uint64_t v4 = ((v3 & 1) == 0) & ~-[AVPlayerViewController _contentTabsVisible](a1);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void **)(a1 + 1736);

  return [v5 setEnabled:v4];
}

- (void)_updateCustomControlsViewStateWithVisibleControlsSet:(unint64_t)a3
{
  BOOL v4 = (a3 & 0x31) != 0;
  [(AVPlayerViewControllerCustomControlsView *)self->_customControlsView setAreVolumeControlsVisible:(a3 >> 1) & 1];
  customControlsView = self->_customControlsView;

  [(AVPlayerViewControllerCustomControlsView *)customControlsView setAreTransportControlsVisible:v4];
}

- (void)_updateContentOverlayViewSuperview
{
  char v3 = [(AVPlayerViewController *)self contentView];
  [v3 setContentOverlayView:self->_contentOverlayView];

  id v4 = [(AVPlayerViewController *)self playbackControlsController];
  objc_msgSend(v4, "setHasCustomPlaybackControls:", -[AVPlayerViewController hasCustomPlaybackControls](self, "hasCustomPlaybackControls"));
}

- (BOOL)hasCustomPlaybackControls
{
  if (!dyld_program_sdk_at_least()
    || [(AVPlayerViewController *)self showsPlaybackControls]
    || ![(AVPlayerViewController *)self isPresentedFullScreen])
  {
    return 0;
  }
  char v3 = [(AVPlayerViewController *)self contentTransitioningDelegate];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v6 = [(AVPlayerViewController *)self _actualContentOverlayView];
    id v7 = [v6 subviews];
    BOOL v4 = [v7 count] != 0;
  }
  return v4;
}

- (BOOL)_shouldShowPictureInPictureButton
{
  if (!+[AVPictureInPictureController isPictureInPictureSupported]|| ![(AVPlayerViewController *)self allowsPictureInPicturePlayback]|| ![(AVPlayerViewController *)self isPictureInPicturePossible])
  {
    return 0;
  }

  return [(AVPlayerViewController *)self canShowPictureInPictureButton];
}

- (BOOL)isPictureInPicturePossible
{
  return [(AVPictureInPictureController *)self->_pictureInPictureController isPictureInPicturePossible];
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (AVMobileChromelessControlsViewController)_createPreferredControlsViewController
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 1184) == 1)
    {
      -[AVPlayerViewController _setUpEnhanceDialogueControllerIfNeeded]((void *)a1);
      uint64_t v2 = objc_alloc_init(AVMobileChromelessControlsViewController);
      char v3 = [(id)a1 _fullScreenController];
      [(AVMobileChromelessControlsViewController *)v2 setFullscreenController:v3];

      [(AVMobileChromelessControlsViewController *)v2 setEnhanceDialogueController:*(void *)(a1 + 1152)];
      [(AVMobileChromelessControlsViewController *)v2 setRequiresLinearPlayback:*(unsigned __int8 *)(a1 + 979)];
      [(AVMobileControlsViewController *)v2 addAction:sel__volumeButtonWasPressedEvent_ withTarget:a1 forEvent:@"AVChromelessControlsVolumeButtonPressedEvent"];
      [(AVMobileControlsViewController *)v2 addAction:sel__playPauseButtonWasPressedEvent_ withTarget:a1 forEvent:@"AVChromelessControlsPlayPauseButtonPressedEvent"];
      [(AVMobileControlsViewController *)v2 addAction:sel__copySubjectMenuItemPressedEvent_ withTarget:a1 forEvent:@"AVChromelessControlsCopySubjectMenuItemPressedEvent"];
      [(AVMobileControlsViewController *)v2 addAction:sel__visualLookupMenuItemPressedEvent_ withTarget:a1 forEvent:@"AVChromelessControlsVisualLookupMenuItemPressedEvent"];
      [(AVMobileControlsViewController *)v2 addAction:sel_doneButtonTapped_ withTarget:a1 forEvent:@"AVChromelessControlsDoneButtonPressedEvent"];
    }
    else
    {
      uint64_t v2 = [[AVMobileChromeControlsViewController alloc] initWithPlayerViewController:a1];
      [(id)a1 overrideTransformForProminentPlayButton];
      [(AVMobileChromelessControlsViewController *)v2 setTransformForProminentPlayButton:&v11];
      BOOL v4 = [(id)a1 overrideLayoutMarginsWhenEmbeddedInline];
      [(AVMobileChromelessControlsViewController *)v2 setEmbeddedInlineLayoutMargins:v4];

      uint64_t v5 = [(AVMobileChromelessControlsViewController *)v2 playbackControlsController];
      [v5 setPlaybackSpeedCollection:*(void *)(a1 + 1696)];

      uint64_t v6 = [(AVMobileChromelessControlsViewController *)v2 playbackControlsController];
      objc_msgSend(v6, "setPreferredUnobscuredArea:", objc_msgSend((id)a1, "preferredUnobscuredArea"));

      id v7 = [(AVMobileChromelessControlsViewController *)v2 playbackControlsController];
      [v7 setShowsMinimalPlaybackControlsWhenEmbeddedInline:*(unsigned __int8 *)(a1 + 1376)];
    }
    [(AVMobileChromelessControlsViewController *)v2 setControlItems:*(void *)(a1 + 1744)];
    [(AVMobileControlsViewController *)v2 setDelegate:a1];
    [(AVMobileControlsViewController *)v2 setPipController:*(void *)(a1 + 1512)];
    [(AVMobileChromelessControlsViewController *)v2 setPlayerController:*(void *)(a1 + 1480)];
    [(AVMobileChromelessControlsViewController *)v2 setPlaybackSpeedCollection:*(void *)(a1 + 1696)];
    [(AVMobileChromelessControlsViewController *)v2 setRoutingConfiguration:*(void *)(a1 + 1040)];
    -[AVMobileChromelessControlsViewController setShowsFullScreenControl:](v2, "setShowsFullScreenControl:", [(id)a1 allowsEnteringFullScreen]);
    [(AVMobileChromelessControlsViewController *)v2 setTransportBarCustomMenuItems:*(void *)(a1 + 1560)];
    double v8 = [(id)a1 _volumeController];
    [(AVMobileChromelessControlsViewController *)v2 setVolumeController:v8];

    v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      double v13 = "-[AVPlayerViewController _createPreferredControlsViewController]";
      __int16 v14 = 2112;
      double v15 = v2;
      _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s Created AVMobileControlsViewController: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)allowsEnteringFullScreen
{
  return self->_allowsEnteringFullScreen;
}

- (id)_volumeController
{
  volumeController = self->_volumeController;
  if (!volumeController)
  {
    [(AVPlayerViewController *)self _updateVolumeController];
    volumeController = self->_volumeController;
  }

  return volumeController;
}

- (void)_updateVolumeController
{
  if (!self->_playbackControlsShouldControlSystemVolume
    || (+[AVSystemVolumeController volumeController],
        (char v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v3 = +[AVPlayerVolumeController volumeController];
    [v3 setPlayerController:self->_playerController];
  }
  volumeController = self->_volumeController;
  self->_volumeController = (AVVolumeController *)v3;
}

- (void)_updateEnhanceDialogueEnabled
{
  if (result)
  {
    uint64_t v1 = result;
    if ([result showsPlaybackControls]
      && [v1 playbackControlsIncludeTransportControls])
    {
      uint64_t v2 = [v1 showsAudioLanguageMenu];
    }
    else
    {
      uint64_t v2 = 0;
    }
    char v3 = (void *)v1[144];
    return (void *)[v3 setEnabled:v2];
  }
  return result;
}

- (BOOL)playbackControlsIncludeTransportControls
{
  return self->_playbackControlsIncludeTransportControls;
}

- (BOOL)showsAudioLanguageMenu
{
  return self->_showsAudioLanguageMenu;
}

- (uint64_t)_updateControlsVisibilityPolicyAnimated:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 1184);
    uint64_t v5 = [*(id *)(result + 1080) presentationState];
    uint64_t v6 = [(id)v3 playerController];
    char v7 = [v6 isPlayingOnExternalScreen];

    char v8 = [(id)v3 showsVisualLookup];
    char v9 = [(id)v3 canHidePlaybackControls];
    if (v8)
    {
      int v10 = 1;
    }
    else
    {
      int v10 = [(id)v3 showsPlaybackControls] ^ 1;
      if ((v10 & 1) == 0 && v5 == 2) {
        int v10 = [(id)v3 canIncludePlaybackControlsWhenInline] ^ 1;
      }
    }
    if (*(unsigned char *)(v3 + 1014)
      || *(unsigned char *)(v3 + 1016)
      || ([*(id *)(v3 + 1704) isInteractionInProgress] & 1) != 0)
    {
      int v11 = 1;
    }
    else
    {
      int v11 = [(id)v3 showsPlaybackControls] ^ 1;
    }
    unsigned __int8 v12 = v9 & (v7 ^ 1) | v11;
    BOOL v13 = (v10 | v11) == 0;
    uint64_t v14 = 1;
    if (v13) {
      uint64_t v14 = 2;
    }
    if (((v4 == 1) & v12) != 0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = *(void **)(v3 + 1176);
    return [v16 updateVisibilityPolicy:v15 animated:a2];
  }
  return result;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (BOOL)showsVisualLookup
{
  return self->_showsVisualLookup;
}

- (BOOL)canIncludePlaybackControlsWhenInline
{
  return self->_canIncludePlaybackControlsWhenInline;
}

- (BOOL)canHidePlaybackControls
{
  return self->_canHidePlaybackControls;
}

- (void)_updateActivePlaybackSpeedIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVPlayerViewController *)self playbackSpeedCollection];
  if (v3)
  {
    uint64_t v4 = [(AVPlayerViewController *)self playerController];
    [v4 defaultPlaybackRate];
    double v6 = v5;

    char v7 = [v3 activeSpeed];
    [v7 rate];
    double v9 = v8;

    if (v6 != v9)
    {
      if (v6 == 0.0)
      {
        double v19 = [v3 speeds];
        int v11 = +[AVPlaybackSpeedCollection defaultSpeedFromList:v19];

        if (v11) {
          goto LABEL_16;
        }
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        int v10 = objc_msgSend(v3, "speeds", 0);
        int v11 = (AVPlaybackSpeed *)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v21;
          while (2)
          {
            for (i = 0; i != v11; i = (AVPlaybackSpeed *)((char *)i + 1))
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              [v14 rate];
              if (v6 == v15)
              {
                int v11 = v14;
                goto LABEL_14;
              }
            }
            int v11 = (AVPlaybackSpeed *)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_14:

        if (v11) {
          goto LABEL_16;
        }
      }
      uint64_t v16 = AVLocalizedString(@"Active Speed");
      double v17 = [AVPlaybackSpeed alloc];
      *(float *)&double v18 = v6;
      int v11 = [(AVPlaybackSpeed *)v17 initWithRate:v16 localizedName:1 synthesized:v18];

LABEL_16:
      [v3 setActiveSpeed:v11];
    }
  }
}

- (void)_updateDefaultPlaybackRateIfNeeded
{
  uint64_t v3 = [(AVPlayerViewController *)self playbackSpeedCollection];
  uint64_t v4 = [v3 selectedSpeed];
  [v4 rate];
  float defaultLinearPlaybackRate = v5;

  if ([(AVPlayerViewController *)self requiresLinearPlayback]
    || ([(AVPlayerViewController *)self playbackSpeedCollection],
        char v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    float defaultLinearPlaybackRate = self->_defaultLinearPlaybackRate;
  }
  float v8 = [(AVPlayerViewController *)self playerController];
  [v8 defaultPlaybackRate];
  double v10 = v9;
  double v11 = defaultLinearPlaybackRate;

  if (v10 != v11)
  {
    id v12 = [(AVPlayerViewController *)self playerController];
    [v12 setDefaultPlaybackRate:v11];
  }
}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (id)_fullScreenController
{
  fullscreenController = self->_fullscreenController;
  if (!fullscreenController)
  {
    uint64_t v4 = [[AVMobileFullscreenController alloc] initWithPlayerViewController:self];
    float v5 = self->_fullscreenController;
    self->_fullscreenController = v4;

    fullscreenController = self->_fullscreenController;
  }

  return fullscreenController;
}

- (BOOL)_contentTabsVisible
{
  uint64_t v1 = [*(id *)(a1 + 1176) controlsViewControllerIfChromeless];
  uint64_t v2 = [v1 contentTabPresentationContext];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 state]) {
      BOOL v4 = [v3 state] == 2;
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)usesSecondGenerationControls
{
  uint64_t v2 = +[AVKitGlobalSettings shared];
  char v3 = [v2 secondGenerationPlayerEnabled];

  return v3;
}

- (void)_setUpEnhanceDialogueControllerIfNeeded
{
  if (!result[144])
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(AVEnhanceDialogueController);
    char v3 = (void *)v1[144];
    v1[144] = v2;

    BOOL v4 = (void *)v1[144];
    float v5 = [v1 playerController];
    [v4 setPlayerController:v5];

    return -[AVPlayerViewController _updateEnhanceDialogueEnabled](v1);
  }
  return result;
}

- (void)setPlayer:(AVPlayer *)player
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  float v5 = player;
  double v6 = [(AVPlayerViewController *)self player];

  if (v6 != v5)
  {
    char v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v25 = "-[AVPlayerViewController setPlayer:]";
      __int16 v26 = 2112;
      double v27 = v5;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_player, player);
    if (v5)
    {
      float v8 = [(AVPlayer *)v5 dispatchQueue];
      double v9 = (void *)MEMORY[0x1E4F14428];

      if (v8 != v9)
      {
        double v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3A8];
        id v12 = _AVMethodProem(self);
        [v10 raise:v11, @"%@ only supports AVPlayer instances that have been initialized with the main queue as the dispatch queue for serializing key-value observations.", v12 format];
      }
    }
    BOOL v13 = [(AVPlayerViewController *)self playerController];
    uint64_t v14 = [v13 player];

    if (v14 != v5)
    {
      kdebug_trace();
      float v15 = [[AVPlayerController alloc] initWithPlayer:v5];
      [(AVPlayerController *)v15 setHandlesAudioSessionInterruptions:1];
      if ([(AVPlayerViewController *)self _showsWolfControls]) {
        [(AVPlayerController *)v15 setShouldLoadVisualMediaSelectionOptions:1];
      }
      else {
        [(AVPlayerController *)v15 setInspectionSuspended:[(AVPlayerViewController *)self requiresImmediateAssetInspection] ^ 1];
      }
      uint64_t v16 = [(AVPlayerViewController *)self playerController];
      if (objc_opt_respondsToSelector())
      {
        double v17 = [(AVPlayerViewController *)self playerController];
        if (objc_opt_respondsToSelector())
        {
          double v18 = [(AVPlayerViewController *)self playerController];
          char v19 = objc_opt_respondsToSelector();

          if ((v19 & 1) == 0)
          {
LABEL_18:
            kdebug_trace();
            [(AVPlayerViewController *)self setPlayerController:v15];
            long long v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v23 postNotificationName:@"AVPlayerViewControllerDidChangePlayerControllerNotification" object:self];

            goto LABEL_19;
          }
          long long v20 = [(AVPictureInPictureController *)self->_pictureInPictureController pictureInPictureViewController];
          long long v21 = [v20 pictureInPicturePlayerLayerView];
          uint64_t v16 = [v21 playerLayer];

          long long v22 = [(AVPlayerViewController *)self playerController];
          [v22 endReducingResourcesForPictureInPicturePlayerLayer:v16];

          if ([(AVPictureInPictureController *)self->_pictureInPictureController wantsResourceReduction])
          {
            [(AVPlayerController *)v15 beginReducingResourcesForPictureInPicturePlayerLayer:v16];
          }
        }
        else
        {
        }
      }

      goto LABEL_18;
    }
  }
LABEL_19:
}

- (void)setPlayerController:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  float v5 = (AVPlayerController *)a3;
  double v6 = self->_playerController;
  if (v6 != v5)
  {
    [(AVNowPlayingInfoController *)self->_nowPlayingInfoController stopNowPlayingUpdatesForPlayerController:v6];
    char v7 = [(AVPlayerViewController *)self volumeAnimator];
    [v7 restoreVolumeIfNeeded];

    [(AVPlayerViewController *)self setVolumeAnimator:0];
    float v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 136315394;
      __int16 v41 = "-[AVPlayerViewController setPlayerController:]";
      __int16 v42 = 2112;
      uint64_t v43 = v5;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v40, 0x16u);
    }

    [(AVPlayerController *)v5 setPlayingOnSecondScreen:[(AVPlayerController *)v6 isPlayingOnSecondScreen]];
    secondScreenConnection = self->_secondScreenConnection;
    double v10 = [(AVPlayerViewController *)self player];
    [(AVSecondScreenConnection *)secondScreenConnection setDebugInfoPlayer:v10];

    uint64_t v11 = self->_secondScreenConnection;
    id v12 = [(AVPlayerViewController *)self player];
    [(AVSecondScreenConnection *)v11 setPlayer:v12];

    objc_storeStrong((id *)&self->_playerController, a3);
    smartSubtitlesController = self->_smartSubtitlesController;
    if (!smartSubtitlesController)
    {
      uint64_t v14 = objc_alloc_init(AVSmartSubtitlesController);
      float v15 = self->_smartSubtitlesController;
      self->_smartSubtitlesController = v14;

      [(AVSmartSubtitlesController *)self->_smartSubtitlesController setDelegate:self];
      smartSubtitlesController = self->_smartSubtitlesController;
    }
    uint64_t v16 = [(AVPlayerViewController *)self playerController];
    [(AVSmartSubtitlesController *)smartSubtitlesController setPlayerController:v16];

    if (objc_opt_respondsToSelector())
    {
      [(AVPlayerController *)self->_playerController setInternalDelegate:self];
      [(AVPlayerController *)v6 setInternalDelegate:0];
    }
    double v17 = [(AVPlayerViewController *)self player];
    double v18 = [(AVPlayerController *)v5 player];

    if (v17 != v18)
    {
      char v19 = [(AVPlayerController *)v5 player];
      [(AVPlayerViewController *)self setPlayer:v19];
    }
    [(AVPlayerViewController *)self _updateActivePlaybackSpeedIfNeeded];
    long long v20 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
    long long v21 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
    if (![(AVPlayerViewController *)self _showsWolfControls])
    {
      long long v22 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
      if (v5 && !self->_playerLayerView)
      {
        long long v23 = [__AVPlayerLayerView alloc];
        double v24 = [(AVPlayerViewController *)self contentView];
        [v24 bounds];
        uint64_t v25 = -[__AVPlayerLayerView initWithFrame:](v23, "initWithFrame:");

        [(__AVPlayerLayerView *)v25 setPixelBufferAttributes:self->_pixelBufferAttributes];
        __int16 v26 = [(AVPlayerViewController *)self contentView];
        double v27 = [v26 layoutClass];
        if (v27)
        {
          uint64_t v28 = [(AVPlayerViewController *)self _targetVideoGravitiesForLayoutClass];
          BOOL v29 = [(AVPlayerViewController *)self contentView];
          v30 = [v29 layoutClass];
          v31 = [v28 objectForKeyedSubscript:v30];

          long long v22 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
          long long v20 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;

          long long v21 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
        }
        else
        {
          v31 = [(AVPlayerViewController *)self videoGravity];
        }

        [(__AVPlayerLayerView *)v25 setVideoGravity:AVVideoGravityFromString(v31)];
        [(AVPlayerViewController *)self setPlayerLayerView:v25];
      }
      char v32 = [(AVPlayerViewController *)self playbackControlsController];
      [v32 setPlayerController:v5];

      [*(id *)((char *)&self->super.super.super.isa + v22[497]) setPlayerController:v5];
      [(AVPictureInPictureController *)self->_pictureInPictureController setPlayerController:v5];
      [*(id *)((char *)&self->super.super.super.isa + v20[504]) setPlayerController:v5];
      [*(id *)((char *)&self->super.super.super.isa + v21[512]) setPlayerController:v5];
      -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
    }
    if ([(AVPlayerViewController *)self shouldUseNetworkingResourcesForLiveStreamingWhilePaused])
    {
      [(AVPlayerController *)v6 stopUsingNetworkResourcesForLiveStreamingWhilePaused];
      [(AVPlayerController *)v5 startUsingNetworkResourcesForLiveStreamingWhilePaused];
    }
    int v33 = [(AVPlayerController *)v5 pipActivitySessionIdentifier];
    [(AVPlayerViewController *)self setPictureInPictureActivitySessionIdentifier:v33];

    uint64_t v34 = [(AVPlayerViewController *)self _pipActivitySessionObservationController];
    [v34 stopAllObservation];

    if (v5)
    {
      __int16 v35 = [[AVObservationController alloc] initWithOwner:self];
      pipActivitySessionObservationController = self->__pipActivitySessionObservationController;
      self->__pipActivitySessionObservationController = v35;

      __int16 v37 = [(AVPlayerViewController *)self _pipActivitySessionObservationController];
      [v37 startObservingNotificationForName:@"AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification" object:v5 notificationCenter:0 observationHandler:&__block_literal_global_161_8520];
    }
    [*(id *)((char *)&self->super.super.super.isa + v20[504]) setPlayerController:v5];
    [*(id *)((char *)&self->super.super.super.isa + v21[512]) setPlayerController:v5];
    [(AVScrubbingGestureController *)self->_scrubbingGestureController setPlayerController:v5];
    [(AVEnhanceDialogueController *)self->_enhanceDialogueController setPlayerController:v5];
    -[AVPlayerViewController _setUpVideoFrameVisualAnalyzerIfNeeded]((uint64_t)self);
    -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
    [(AVPlayerViewController *)self _updateNowPlayingInfoController];
    double v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 postNotificationName:@"AVPlayerViewControllerDidChangePlayerControllerNotification" object:self];

    __int16 v39 = [(AVPlayerController *)v6 interstitialController];
    [v39 setDelegateManager:0];

    -[AVPlayerViewController _setupInterstitialControllerDelegateIfNeeded]((uint64_t)self);
  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)_updateVisualAnalyzerEnabledStateIfNeeded
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 1136);
    if (v2)
    {
      id v3 = v2;
      id v10 = [(id)a1 playerController];
      BOOL v4 = [*(id *)(a1 + 1168) scrollingObserver];
      int v5 = [v4 isScrolling];

      char v6 = [(id)a1 isPictureInPictureActive];
      char v7 = [v10 isPlayingOnSecondScreen];
      char v8 = [v10 isPlayingOnExternalScreen];
      if ((v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || (BOOL v9 = *(unsigned char *)(a1 + 1415) != 0, v5)) {
        BOOL v9 = 0;
      }
      [v3 setEnabled:v9];
    }
  }
}

- (AVObservationController)_pipActivitySessionObservationController
{
  return self->__pipActivitySessionObservationController;
}

- (AVLayerVideoGravity)videoGravity
{
  if (self->_playerLayerView) {
    videoGravitdouble y = [(__AVPlayerLayerView *)self->_playerLayerView videoGravity];
  }
  else {
    videoGravitdouble y = self->_videoGravity;
  }
  id v3 = NSStringFromVideoGravity(videoGravity);

  return (AVLayerVideoGravity)v3;
}

- (void)_updateNowPlayingInfoController
{
  id v3 = self->_nowPlayingInfoController;
  BOOL v4 = [(AVPlayerViewController *)self _wantsNowPlayingInfoCenter:0];
  int v5 = [(AVPlayerViewController *)self playerController];
  if (v4)
  {
    if (v3)
    {
      [(AVNowPlayingInfoController *)v3 startNowPlayingUpdatesForPlayerController:v5 afterDelay:1.0];
    }
    else
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __57__AVPlayerViewController__updateNowPlayingInfoController__block_invoke;
      v7[3] = &unk_1E5FC29B0;
      objc_copyWeak(&v8, &location);
      objc_copyWeak(&v9, &from);
      +[AVNowPlayingInfoController sharedNowPlayingInfoControllerWithCompletion:v7];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(AVNowPlayingInfoController *)v3 stopNowPlayingUpdatesForPlayerController:v5];
    nowPlayingInfoController = self->_nowPlayingInfoController;
    self->_nowPlayingInfoController = 0;
  }
}

- (BOOL)_wantsNowPlayingInfoCenter:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = [(AVPlayerViewController *)self playerController];
  char v6 = v5;
  BOOL v7 = v5
    && ([v5 isInspectionSuspended] & 1) == 0
    && [(AVPlayerViewController *)self updatesNowPlayingInfoCenter];
  id v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    uint64_t v11 = "-[AVPlayerViewController _wantsNowPlayingInfoCenter:]";
    __int16 v12 = 1024;
    BOOL v13 = v3;
    __int16 v14 = 1024;
    BOOL v15 = v7;
    __int16 v16 = 1024;
    int v17 = 1;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s isRecheck? %d, wants? %d, experienceWants? %d", (uint8_t *)&v10, 0x1Eu);
  }

  return v7;
}

- (AVPlayerControllerVolumeAnimator)volumeAnimator
{
  return self->_volumeAnimator;
}

- (BOOL)shouldUseNetworkingResourcesForLiveStreamingWhilePaused
{
  return self->_shouldUseNetworkingResourcesForLiveStreamingWhilePaused;
}

- (void)setVolumeAnimator:(id)a3
{
}

- (void)setPlayerLayerView:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v5 = (__AVPlayerLayerView *)a3;
  playerLayerView = self->_playerLayerView;
  char v19 = v5;
  if (playerLayerView != v5)
  {
    [(__AVPlayerLayerView *)playerLayerView removeFromSuperview];
    objc_storeStrong((id *)&self->_playerLayerView, a3);
    [(AVPlayerViewController *)self _updatePlayerLayerLegibleContentInsetsIfNeeded];
    BOOL v7 = [(AVPlayerViewController *)self contentView];
    id v8 = [v7 playbackContentContainerView];
    id v9 = [v8 activeContentView];
    [v9 setPlayerLayerView:v19];

    int v10 = [(AVPlayerViewController *)self contentView];
    uint64_t v11 = [v10 playbackContentContainerView];
    __int16 v12 = [v11 activeContentView];

    uint64_t v13 = [v12 playerLayerView];
    __int16 v14 = (void *)v13;
    if (v10 && v12 && v13)
    {
      BOOL v15 = _AVLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v21 = "-[AVPlayerViewController _updatePlayerLayerPlayerControllerIfNeeded]";
        _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "%s - setting the player controller on the contentView's playerLayerView.", buf, 0xCu);
      }

      __int16 v16 = [(AVPlayerViewController *)self playerController];
      [v14 setPlayerController:v16];
    }
    videoFrameVisualAnalyzer = self->_videoFrameVisualAnalyzer;
    uint64_t v18 = [(__AVPlayerLayerView *)v19 playerLayer];
    [(AVVideoFrameVisualAnalyzer *)videoFrameVisualAnalyzer setPlayerLayer:v18];

    [(AVPlayerViewController *)self _startPlayerLayerViewObservationsIfNeeded];
  }
}

- (void)setPictureInPictureActivitySessionIdentifier:(id)a3
{
  id v6 = a3;
  BOOL v4 = (NSString *)[v6 copy];
  pictureInPictureActivitySessionIdentifier = self->_pictureInPictureActivitySessionIdentifier;
  self->_pictureInPictureActivitySessionIdentifier = v4;

  if (v6) {
    [(AVPlayerViewController *)self loadViewIfNeeded];
  }
  [(AVPictureInPictureController *)self->_pictureInPictureController setActivitySessionIdentifier:v6];
}

- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3
{
  if (self->_canPausePlaybackWhenClosingPictureInPicture != a3)
  {
    BOOL v3 = a3;
    self->_canPausePlaybackWhenClosingPictureInPicture = a3;
    if (![(AVPlayerViewController *)self _showsWolfControls])
    {
      pictureInPictureController = self->_pictureInPictureController;
      [(AVPictureInPictureController *)pictureInPictureController setCanPausePlaybackWhenClosingPictureInPicture:v3];
    }
  }
}

- (AVBehaviorStorage)_behaviorStorage
{
  [(AVPlayerViewController *)self _showsWolfControls];
  behaviorStorage = self->__behaviorStorage;

  return behaviorStorage;
}

- (BOOL)_showsWolfControls
{
  return 0;
}

- (AVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    double v36 = "-[AVPlayerViewController initWithNibName:bundle:]";
    __int16 v37 = 1024;
    int v38 = 454;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v34.receiver = self;
  v34.super_class = (Class)AVPlayerViewController;
  id v6 = [(AVPlayerViewController *)&v34 initWithNibName:0 bundle:0];
  BOOL v7 = v6;
  if (v6)
  {
    v6->_playerShouldAutopladouble y = 0;
    v6->_showsPlaybackControls = 1;
    v6->_videoGravitdouble y = 1;
    v6->_allowsPictureInPicturePlayback = dyld_program_sdk_at_least();
    v7->_wantsDetachedFullscreenPresentation = 0;
    v7->_canDisplayContentInDetachedWindow = 0;
    v7->_showsAnalysisButtonIfAvailable = 1;
    v7->_allowsEnteringFullScreen = 1;
    v7->_updatesNowPlayingInfoCenter = 1;
    v7->_canHidePlaybackControls = 1;
    v7->_canPausePlaybackWhenExitingFullScreen = 1;
    v7->_canPausePlaybackWhenClosingPictureInPicture = 1;
    v7->_canShowPictureInPictureButton = 1;
    v7->_canIncludePlaybackControlsWhenInline = 1;
    v7->_controlsGeneration = [(id)objc_opt_class() usesSecondGenerationControls];
    v7->_playbackControlsShouldControlSystemVolume = 1;
    v7->_showsAudioLanguageMenu = 1;
    uint64_t v8 = MEMORY[0x1E4F1DAB8];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7->_overrideTransformForProminentPlayButton.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7->_overrideTransformForProminentPlayButton.c = v9;
    *(_OWORD *)&v7->_overrideTransformForProminentPlayButton.tdouble x = *(_OWORD *)(v8 + 32);
    overrideLayoutMarginsWhenEmbeddedInline = v7->_overrideLayoutMarginsWhenEmbeddedInline;
    v7->_overrideLayoutMarginsWhenEmbeddedInline = 0;

    v7->_canToggleVideoGravityWhenEmbeddedInline = 1;
    v7->_float defaultLinearPlaybackRate = 1.0;
    v7->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = 1;
    uint64_t v11 = +[AVRoutingConfiguration defaultConfiguration];
    routingConfiguration = v7->_routingConfiguration;
    v7->_routingConfiguration = (AVRoutingConfiguration *)v11;

    uint64_t v13 = +[AVPlayerViewControllerConfiguration defaultConfiguration];
    configuration = v7->_configuration;
    v7->_configuration = (AVPlayerViewControllerConfiguration *)v13;

    BOOL v15 = +[AVKitGlobalSettings shared];
    int v16 = [v15 quickLookModernPlayerControlsEnabled];

    if (v16)
    {
      [(AVPlayerViewController *)v7 setPrefersDeviceUserInterfaceStyle:1];
      [(AVPlayerViewControllerConfiguration *)v7->_configuration setPrefersFullScreenStyleForEmbeddedMode:1];
    }
    uint64_t v17 = [(AVPlayerViewController *)v7 _defaultInfoViewActions];
    infoViewActions = v7->_infoViewActions;
    v7->_infoViewActions = (NSArray *)v17;

    uint64_t v19 = objc_opt_new();
    cacheLargestInscribedRect = v7->_cacheLargestInscribedRect;
    v7->_cacheLargestInscribedRect = (AVCacheLargestInscribedRectInBoundingPath *)v19;

    v7->_playbackControlsIncludeTransportControls = 1;
    v7->_playbackControlsIncludeDisplayModeControls = 1;
    v7->_playbackControlsIncludeVolumeControls = 1;
    v7->_allowInfoMetadataSubpanel = 1;
    long long v21 = +[AVKitGlobalSettings shared];
    v7->_allowsVideoFrameAnalysis = [v21 visualAnalysisEnabled];

    uint64_t v22 = [[AVObservationController alloc] initWithOwner:v7];
    observationController = v7->_observationController;
    v7->_observationController = v22;

    v7->_videoFrameAnalysisTypes = 0;
    double v24 = +[AVPlaybackSpeed systemDefaultSpeeds];
    uint64_t v25 = +[AVPlaybackSpeedCollection collectionWithSpeeds:v24];
    playbackSpeedCollection = v7->_playbackSpeedCollection;
    v7->_playbackSpeedCollection = (AVPlaybackSpeedCollection *)v25;

    [(AVPlaybackSpeedCollection *)v7->_playbackSpeedCollection setDelegate:v7];
    double v27 = +[AVKitGlobalSettings shared];
    LODWORD(v24) = [v27 extendedVisualAnalysisEnabled];

    if (v24) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = 2;
    }
    v7->_videoFrameAnalysisTypes = v28;
    BOOL v29 = [MEMORY[0x1E4F28B50] mainBundle];
    v30 = [v29 bundleIdentifier];
    int v31 = [v30 isEqualToString:@"com.apple.podcasts"];

    if (v31) {
      v7->_wantsDetachedFullscreenPresentation = 0;
    }
    v7->_playerViewControllerAnimated = 0;
    v7->_playerLayerViewObservationsHasBeenSetup = 0;
    [(AVObservationController *)v7->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2E78] object:v7 notificationCenter:0 observationHandler:&__block_literal_global_8591];
    char v32 = [(AVPlayerViewController *)v7 _avkitPreferredTransitioningDelegate];
    [(AVPlayerViewController *)v7 setTransitioningDelegate:v32];

    v7->_isUpdatingSecondScreenConnectionReadyToConnect = 0;
    v7->_preferredPlaybackControlsSupplementalSubtitleDisplayOption = 2;
  }
  return v7;
}

- (void)_updatePlayerControllerInspectionState
{
  if (!a1) {
    return;
  }
  id v8 = [(id)a1 playerController];
  id v2 = *(id *)(a1 + 1168);
  if (*(unsigned char *)(a1 + 1014)) {
    goto LABEL_8;
  }
  if ([(id)a1 requiresImmediateAssetInspection]) {
    goto LABEL_8;
  }
  uint64_t v3 = [v2 window];
  if (!v3) {
    goto LABEL_6;
  }
  BOOL v4 = (void *)v3;
  int v5 = [v2 scrollingObserver];
  char v6 = [v5 isScrolling];

  if ((v6 & 1) == 0)
  {
LABEL_8:
    if ([v8 isInspectionSuspended])
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
LABEL_6:
    if (([v8 isInspectionSuspended] & 1) == 0)
    {
      uint64_t v7 = 1;
LABEL_10:
      [v8 setInspectionSuspended:v7];
      [(id)a1 _updateNowPlayingInfoController];
    }
  }
}

- (BOOL)requiresImmediateAssetInspection
{
  return self->_requiresImmediateAssetInspection;
}

- (AVTransitionController)_transitionController
{
  transitionController = self->_transitionController;
  if (!transitionController)
  {
    BOOL v4 = objc_alloc_init(AVTransitionController);
    int v5 = self->_transitionController;
    self->_transitionController = v4;

    [(AVTransitionController *)self->_transitionController setDelegate:self];
    transitionController = self->_transitionController;
  }

  return transitionController;
}

- (void)_startPlayerLayerViewObservationsIfNeeded
{
  if (!self->_playerLayerViewObservationsHasBeenSetup)
  {
    self->_playerLayerViewObservationsHasBeenSetup = 1;
    uint64_t v3 = [(AVPlayerViewController *)self _observationController];
    BOOL v4 = [(AVPlayerViewController *)self playerLayerView];
    id v5 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, @"playerLayerView.readyForDisplay", objc_msgSend(v4, "isReadyForDisplay"), &__block_literal_global_698);

    id v8 = [(AVPlayerViewController *)self _observationController];
    char v6 = [(AVPlayerViewController *)self playerLayerView];
    id v7 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, @"playerLayerView.videoBounds", objc_msgSend(v6, "isReadyForDisplay"), &__block_literal_global_703);
  }
}

- (AVObservationController)_observationController
{
  return self->_observationController;
}

- (void)_setupInterstitialControllerDelegateIfNeeded
{
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v2 = [*(id *)(a1 + 1480) interstitialController];
    [v2 setDelegateManager:a1];
  }
}

- (void)_setUpVideoFrameVisualAnalyzerIfNeeded
{
  if (a1
    && [(id)a1 allowsVideoFrameAnalysis]
    && [(id)a1 hasPerformedInitialSetup])
  {
    id v2 = [(id)a1 playerLayerView];
    id v6 = [v2 playerLayer];

    uint64_t v3 = [[AVVideoFrameVisualAnalyzer alloc] initWithPlayerController:*(void *)(a1 + 1480) playerLayer:v6];
    BOOL v4 = *(void **)(a1 + 1136);
    *(void *)(a1 + 1136) = v3;

    [*(id *)(a1 + 1136) setDelegate:a1];
    -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes](a1);
    if (*(void *)(a1 + 1464) == 1) {
      uint64_t v5 = 30;
    }
    else {
      uint64_t v5 = *(void *)(a1 + 1464);
    }
    [*(id *)(a1 + 1136) setVideoFrameAnalysisTypes:v5];
    -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded](a1);
  }
}

- (BOOL)hasPerformedInitialSetup
{
  return self->_hasPerformedInitialSetup;
}

- (uint64_t)_updateShowsAnalysisControl
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    int v10 = [*(id *)(result + 1176) controlsViewControllerIfChromeless];
    uint64_t v2 = v1[148];
    int v3 = [v1 allowsVideoFrameAnalysis];
    int v4 = [v1 showsAnalysisButtonIfAvailable];
    uint64_t v5 = (void *)v1[213];
    uint64_t v6 = [v5 hasProminentText];
    id v7 = v10;
    if (v3)
    {
      BOOL v8 = v2 != 1 || v5 == 0;
      if (!v8 && v10 != 0)
      {
        uint64_t v6 = [v10 setShowsAnalysisControl:v4 & v6];
        id v7 = v10;
      }
    }
    return MEMORY[0x1F41817F8](v6, v7);
  }
  return result;
}

- (BOOL)allowsVideoFrameAnalysis
{
  return self->_allowsVideoFrameAnalysis;
}

- (BOOL)showsAnalysisButtonIfAvailable
{
  return self->_showsAnalysisButtonIfAvailable;
}

- (id)_defaultInfoViewActions
{
  v17[1] = *MEMORY[0x1E4F143B8];
  playFromBeginningAction = self->_playFromBeginningAction;
  if (!playFromBeginningAction)
  {
    int v3 = self;
    objc_initWeak(&location, self);
    int v4 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v5 = AVLocalizedString(@"START_PLAYBACK_FROM_BEGINNING");
    uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __49__AVPlayerViewController__defaultInfoViewActions__block_invoke;
    __int16 v14 = &unk_1E5FC3A10;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:&v11];
    int v3 = (AVPlayerViewController *)((char *)v3 + 1072);
    Class isa = v3->super.super.super.isa;
    v3->super.super.super.Class isa = (Class)v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    playFromBeginningAction = (UIAction *)v3->super.super.super.isa;
  }
  v17[0] = playFromBeginningAction;
  long long v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);

  return v9;
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v4 didMoveToParentViewController:a3];
  if (![(AVPlayerViewController *)self _showsWolfControls]) {
    [(AVPlayerViewController *)self _updatePlaybackControlsState];
  }
}

- (void)viewDidLoad
{
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v5 viewDidLoad];
  if (![(AVPlayerViewController *)self _showsWolfControls])
  {
    int v3 = [(AVPlayerViewController *)self contentView];
    objc_super v4 = [(AVPlayerViewController *)self playbackControlsController];
    [v3 setGen1Delegate:v4];
  }
  kdebug_trace();
}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)updatesNowPlayingInfoCenter
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_updatesNowPlayingInfoCenter != updatesNowPlayingInfoCenter)
  {
    BOOL v3 = updatesNowPlayingInfoCenter;
    objc_super v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "NO";
      int v7 = 136315650;
      BOOL v8 = "-[AVPlayerViewController setUpdatesNowPlayingInfoCenter:]";
      int v10 = "updatesNowPlayingInfoCenter";
      __int16 v9 = 2080;
      if (v3) {
        uint64_t v6 = "YES";
      }
      __int16 v11 = 2080;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_updatesNowPlayingInfoCenter = v3;
    [(AVPlayerViewController *)self _updateNowPlayingInfoController];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportBarCustomAudioMenu, 0);
  objc_storeStrong((id *)&self->_privateDelegate, 0);
  objc_storeStrong((id *)&self->_infoHint, 0);
  objc_storeStrong((id *)&self->_pictureInPictureActivitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_customControlItems, 0);
  objc_storeStrong((id *)&self->_tapThroughGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_infoTabCoordinator, 0);
  objc_storeStrong((id *)&self->_infoTabViewController, 0);
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, 0);
  objc_storeStrong((id *)&self->_analysisView, 0);
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_volumeAnimator, 0);
  objc_storeStrong((id *)&self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey, 0);
  objc_storeStrong((id *)&self->_scrubGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong(&self->_interactiveDismissalCompletionHandler, 0);
  objc_storeStrong(&self->_pendingRestoreUserInterfaceForPictureInPictureStopHandler, 0);
  objc_storeStrong(&self->_dismissForPIPStartAfterPresentationHandler, 0);
  objc_storeStrong(&self->_finishPreparingForInteractiveDismissalHandler, 0);
  objc_storeStrong((id *)&self->__pipActivitySessionObservationController, 0);
  objc_storeStrong((id *)&self->__actualContentOverlayView, 0);
  objc_storeStrong((id *)&self->_groupExperienceCoordinator, 0);
  objc_storeStrong((id *)&self->_contextualActionsPreviewImage, 0);
  objc_storeStrong((id *)&self->_contextualActionsInfoView, 0);
  objc_storeStrong((id *)&self->_contextualActions, 0);
  objc_storeStrong((id *)&self->_transportBarCustomMenuItems, 0);
  objc_storeStrong((id *)&self->_customOverlayViewController, 0);
  objc_storeStrong((id *)&self->_allowedSubtitleOptionLanguages, 0);
  objc_storeStrong((id *)&self->_unobscuredContentGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pictureInPictureController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_imageAnalysis, 0);
  objc_storeStrong((id *)&self->_infoViewActions, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->__targetVideoGravitiesForLayoutClass, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_smartSubtitlesController, 0);
  objc_storeStrong((id *)&self->_customInfoViewControllers, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionGestureTracker, 0);
  objc_storeStrong((id *)&self->_scrubInterruptionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userInteractionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_externalGestureRecognizerPreventer, 0);
  objc_storeStrong((id *)&self->_videoGravityPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapTwoFingersGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrubGestureMomentumTimer, 0);
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_customControlsView, 0);
  objc_storeStrong((id *)&self->_controlsViewController, 0);
  objc_storeStrong((id *)&self->_playerViewControllerContentView, 0);
  objc_storeStrong((id *)&self->_playerViewControllerView, 0);
  objc_storeStrong((id *)&self->_enhanceDialogueController, 0);
  objc_storeStrong((id *)&self->_scrubbingGestureController, 0);
  objc_storeStrong((id *)&self->_videoFrameVisualAnalyzer, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_playbackControlsController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_destroyWeak((id *)&self->_mediaSelectionPopoverPresentationController);
  objc_storeStrong((id *)&self->_nowPlayingInfoController, 0);
  objc_storeStrong((id *)&self->_secondScreenConnection, 0);
  objc_storeStrong((id *)&self->_fullscreenController, 0);
  objc_storeStrong((id *)&self->_playFromBeginningAction, 0);
  objc_storeStrong((id *)&self->_toggleLookupAction, 0);
  objc_storeStrong((id *)&self->_copySubjectAction, 0);
  objc_storeStrong((id *)&self->_currentInternalImageAnalysis, 0);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->__behaviorStorage, 0);

  objc_storeStrong((id *)&self->_pixelBufferAttributes, 0);
}

- (int64_t)preferredPlaybackControlsSupplementalSubtitleDisplayOption
{
  return self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption;
}

- (void)setPlaybackControlsIncludeFullScreenLoadingSpinner:(BOOL)a3
{
  self->_playbackControlsIncludeFullScreenLoadingSpinner = a3;
}

- (BOOL)playbackControlsIncludeFullScreenLoadingSpinner
{
  return self->_playbackControlsIncludeFullScreenLoadingSpinner;
}

- (void)setTransportBarCustomAudioMenu:(id)a3
{
}

- (UIMenuElement)transportBarCustomAudioMenu
{
  return self->_transportBarCustomAudioMenu;
}

- (void)_setClientLegibleContentInsets:(UIEdgeInsets)a3
{
  self->__clientLegibleContentInsets = a3;
}

- (UIEdgeInsets)_clientLegibleContentInsets
{
  double top = self->__clientLegibleContentInsets.top;
  double left = self->__clientLegibleContentInsets.left;
  double bottom = self->__clientLegibleContentInsets.bottom;
  double right = self->__clientLegibleContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPrivateDelegate:(id)a3
{
}

- (AVPlayerViewControllerPlaybackDelegate)privateDelegate
{
  return self->_privateDelegate;
}

- (void)setTitleMetadataIncludesHDRBadge:(BOOL)a3
{
  self->_titleMetadataIncludesHDRBadge = a3;
}

- (BOOL)titleMetadataIncludesHDRBadge
{
  return self->_titleMetadataIncludesHDRBadge;
}

- (void)setTitleMetadataIncludesProResBadge:(BOOL)a3
{
  self->_titleMetadataIncludesProResBadge = a3;
}

- (BOOL)titleMetadataIncludesProResBadge
{
  return self->_titleMetadataIncludesProResBadge;
}

- (void)setWantsDetachedFullscreenPresentation:(BOOL)a3
{
  self->_wantsDetachedFullscreenPresentation = a3;
}

- (BOOL)wantsDetachedFullscreenPresentation
{
  return self->_wantsDetachedFullscreenPresentation;
}

- (void)setInfoHint:(id)a3
{
}

- (NSString)infoHint
{
  return self->_infoHint;
}

- (NSString)pictureInPictureActivitySessionIdentifier
{
  return self->_pictureInPictureActivitySessionIdentifier;
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (NSArray)customControlItems
{
  return self->_customControlItems;
}

- (BOOL)canPausePlaybackWhenExitingFullScreen
{
  return self->_canPausePlaybackWhenExitingFullScreen;
}

- (BOOL)isAtLiveEdge
{
  return self->_atLiveEdge;
}

- (void)setTapThroughGestureRecognizer:(id)a3
{
}

- (AVCenterTapGestureRecognizer)tapThroughGestureRecognizer
{
  return self->_tapThroughGestureRecognizer;
}

- (void)setInfoTabCoordinator:(id)a3
{
}

- (AVInfoTabCoordinator)infoTabCoordinator
{
  return self->_infoTabCoordinator;
}

- (UIViewController)infoTabViewController
{
  return self->_infoTabViewController;
}

- (void)setIsUpdatingSecondScreenConnectionReadyToConnect:(BOOL)a3
{
  self->_isUpdatingSecondScreenConnectionReadyToConnect = a3;
}

- (BOOL)isUpdatingSecondScreenConnectionReadyToConnect
{
  return self->_isUpdatingSecondScreenConnectionReadyToConnect;
}

- (void)setCacheLargestInscribedRect:(id)a3
{
}

- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect
{
  return self->_cacheLargestInscribedRect;
}

- (void)setAnalysisView:(id)a3
{
}

- (AVVisualAnalysisView)analysisView
{
  return self->_analysisView;
}

- (void)setWasInitializedUsingWebKitSPI:(BOOL)a3
{
  self->_wasInitializedUsingWebKitSPI = a3;
}

- (BOOL)wasInitializedUsingWebKitSPI
{
  return self->_wasInitializedUsingWebKitSPI;
}

- (void)setHasPerformedInitialSetup:(BOOL)a3
{
  self->_hasPerformedInitialSetup = a3;
}

- (void)setSecondScreenConnectionDisplaySize:(CGSize)a3
{
  self->_secondScreenConnectionDisplaySize = a3;
}

- (CGSize)secondScreenConnectionDisplaySize
{
  double width = self->_secondScreenConnectionDisplaySize.width;
  double height = self->_secondScreenConnectionDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSMutableDictionary)_localizedDiscoverabilityTitleForKeyCommandLocalizationKey
{
  return self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey;
}

- (void)setScrubGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)scrubGestureRecognizer
{
  return self->_scrubGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)_setNumberOfTrackedUserInteractions:(int64_t)a3
{
  self->__numberOfTrackedUserInteractions = a3;
}

- (int64_t)_numberOfTrackedUserInteractions
{
  return self->__numberOfTrackedUserInteractions;
}

- (void)set_hasBegunObservation:(BOOL)a3
{
  self->__hasBegunObservation = a3;
}

- (BOOL)_hasBegunObservation
{
  return self->__hasBegunObservation;
}

- (void)setInteractiveDismissalCompletionHandler:(id)a3
{
}

- (id)interactiveDismissalCompletionHandler
{
  return self->_interactiveDismissalCompletionHandler;
}

- (void)setPendingRestoreUserInterfaceForPictureInPictureStopHandler:(id)a3
{
}

- (id)pendingRestoreUserInterfaceForPictureInPictureStopHandler
{
  return self->_pendingRestoreUserInterfaceForPictureInPictureStopHandler;
}

- (void)setDismissForPIPStartAfterPresentationHandler:(id)a3
{
}

- (id)dismissForPIPStartAfterPresentationHandler
{
  return self->_dismissForPIPStartAfterPresentationHandler;
}

- (void)setFinishPreparingForInteractiveDismissalHandler:(id)a3
{
}

- (id)finishPreparingForInteractiveDismissalHandler
{
  return self->_finishPreparingForInteractiveDismissalHandler;
}

- (AVContentOverlayView)_actualContentOverlayView
{
  return self->__actualContentOverlayView;
}

- (BOOL)canBeginTrimming
{
  return self->_canBeginTrimming;
}

- (AVGroupExperienceCoordinator)groupExperienceCoordinator
{
  return self->_groupExperienceCoordinator;
}

- (void)setContextualActionsPreviewImage:(UIImage *)contextualActionsPreviewImage
{
}

- (UIImage)contextualActionsPreviewImage
{
  return self->_contextualActionsPreviewImage;
}

- (UIView)contextualActionsInfoView
{
  return self->_contextualActionsInfoView;
}

- (void)setContextualActions:(NSArray *)contextualActions
{
}

- (NSArray)contextualActions
{
  return self->_contextualActions;
}

- (void)setRequiresMonoscopicViewingMode:(BOOL)requiresMonoscopicViewingMode
{
  self->_requiresMonoscopicViewingMode = requiresMonoscopicViewingMode;
}

- (BOOL)requiresMonoscopicViewingMode
{
  return self->_requiresMonoscopicViewingMode;
}

- (NSArray)transportBarCustomMenuItems
{
  return self->_transportBarCustomMenuItems;
}

- (void)setCustomOverlayViewController:(UIViewController *)customOverlayViewController
{
}

- (UIViewController)customOverlayViewController
{
  return self->_customOverlayViewController;
}

- (void)setTransportBarIncludesTitleView:(BOOL)transportBarIncludesTitleView
{
  self->_transportBarIncludesTitleView = transportBarIncludesTitleView;
}

- (BOOL)transportBarIncludesTitleView
{
  return self->_transportBarIncludesTitleView;
}

- (void)setPlaybackControlsIncludeInfoViews:(BOOL)playbackControlsIncludeInfoViews
{
  self->_playbackControlsIncludeInfoViews = playbackControlsIncludeInfoViews;
}

- (BOOL)playbackControlsIncludeInfoViews
{
  return self->_playbackControlsIncludeInfoViews;
}

- (void)setPlaybackControlsIncludeTransportBar:(BOOL)playbackControlsIncludeTransportBar
{
  self->_playbackControlsIncludeTransportBar = playbackControlsIncludeTransportBar;
}

- (BOOL)playbackControlsIncludeTransportBar
{
  return self->_playbackControlsIncludeTransportBar;
}

- (void)setSkipBackwardEnabled:(BOOL)skipBackwardEnabled
{
  self->_skipBackwardEnabled = skipBackwardEnabled;
}

- (BOOL)isSkipBackwardEnabled
{
  return self->_skipBackwardEnabled;
}

- (void)setSkipForwardEnabled:(BOOL)skipForwardEnabled
{
  self->_skipForwardEnabled = skipForwardEnabled;
}

- (BOOL)isSkipForwardEnabled
{
  return self->_skipForwardEnabled;
}

- (void)setSkippingBehavior:(AVPlayerViewControllerSkippingBehavior)skippingBehavior
{
  self->_skippingBehavior = skippingBehavior;
}

- (AVPlayerViewControllerSkippingBehavior)skippingBehavior
{
  return self->_skippingBehavior;
}

- (void)setRequiresFullSubtitles:(BOOL)requiresFullSubtitles
{
  self->_requiresFullSubtitles = requiresFullSubtitles;
}

- (BOOL)requiresFullSubtitles
{
  return self->_requiresFullSubtitles;
}

- (void)setAllowedSubtitleOptionLanguages:(NSArray *)allowedSubtitleOptionLanguages
{
}

- (NSArray)allowedSubtitleOptionLanguages
{
  return self->_allowedSubtitleOptionLanguages;
}

- (UILayoutGuide)unobscuredContentGuide
{
  return self->_unobscuredContentGuide;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setAppliesPreferredDisplayCriteriaAutomatically:(BOOL)appliesPreferredDisplayCriteriaAutomatically
{
  self->_appliesPreferredDisplayCriteriaAutomaticalldouble y = appliesPreferredDisplayCriteriaAutomatically;
}

- (BOOL)appliesPreferredDisplayCriteriaAutomatically
{
  return self->_appliesPreferredDisplayCriteriaAutomatically;
}

- (void)setExitsFullScreenWhenPlaybackEnds:(BOOL)exitsFullScreenWhenPlaybackEnds
{
  self->_exitsFullScreenWhenPlaybackEnds = exitsFullScreenWhenPlaybackEnds;
}

- (BOOL)exitsFullScreenWhenPlaybackEnds
{
  return self->_exitsFullScreenWhenPlaybackEnds;
}

- (BOOL)entersFullScreenWhenPlaybackBegins
{
  return self->_entersFullScreenWhenPlaybackBegins;
}

- (BOOL)canStartPictureInPictureAutomaticallyFromInline
{
  return self->_canStartPictureInPictureAutomaticallyFromInline;
}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->_readyForDispladouble y = a3;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (BOOL)showsTimecodes
{
  return self->_showsTimecodes;
}

- (AVPictureInPictureController)pictureInPictureController
{
  return self->_pictureInPictureController;
}

- (VKCImageAnalysis)imageAnalysis
{
  return self->_imageAnalysis;
}

- (BOOL)allowInfoMetadataSubpanel
{
  return self->_allowInfoMetadataSubpanel;
}

- (UIEdgeInsets)legibleContentInsets
{
  double top = self->_legibleContentInsets.top;
  double left = self->_legibleContentInsets.left;
  double bottom = self->_legibleContentInsets.bottom;
  double right = self->_legibleContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)canPausePlaybackWhenClosingPictureInPicture
{
  return self->_canPausePlaybackWhenClosingPictureInPicture;
}

- (BOOL)isHoveringOverPlaybackControl
{
  return self->_hoveringOverPlaybackControl;
}

- (NSArray)infoViewActions
{
  return self->_infoViewActions;
}

- (BOOL)updatesNowPlayingInfoCenter
{
  return self->_updatesNowPlayingInfoCenter;
}

- (id)scrubGestureConfigurationSettings
{
  return 0;
}

- (void)willPresentInterstitialGroup:(id)a3
{
  id v5 = a3;
  [(AVPlayerViewController *)self _updateActuallyRequiresLinearPlayback];
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_willPresentInterstitialTimeRange_])
  {
    objc_super v4 = [(AVPlayerViewController *)self delegate];
    [v4 playerViewController:self willPresentInterstitialTimeRange:v5];
  }
}

- (void)didPresentInterstitialGroup:(id)a3
{
  id v5 = a3;
  [(AVPlayerViewController *)self _updateActuallyRequiresLinearPlayback];
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_didPresentInterstitialTimeRange_])
  {
    objc_super v4 = [(AVPlayerViewController *)self delegate];
    [v4 playerViewController:self didPresentInterstitialTimeRange:v5];
  }
}

- (void)playbackSpeedCollection:(id)a3 selectedPlaybackSpeedDidChangeTo:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 internalDescription];
    int v8 = 136315394;
    __int16 v9 = "-[AVPlayerViewController playbackSpeedCollection:selectedPlaybackSpeedDidChangeTo:]";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s New playback speed selected: %@", (uint8_t *)&v8, 0x16u);
  }
  [(AVPlayerViewController *)self _updateDefaultPlaybackRateIfNeeded];
}

- (void)playerControllerDidUpdateIsPlayingHDRContent:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self controlsViewController];
  id v7 = [v5 controlsViewControllerIfChromeless];

  LODWORD(v5) = [v4 isPlayingHDRContent];
  double v6 = 0.0;
  if (v5) {
    double v6 = 3.0;
  }
  [v7 setExtendedDynamicRangeGain:v6];
}

- (BOOL)playerControllerCanRestorePlaybackRateAfterAudioSessionDeactivation:(id)a3
{
  BOOL v3 = [(AVPlayerViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];

  if ([v5 activationState] == 1)
  {
    double v6 = [v5 _FBSScene];
    id v7 = [v6 uiSettings];
    uint64_t v8 = [v7 deactivationReasons];

    BOOL v9 = (v8 & 0xFFFFFFFFFFFFFFAFLL) == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)fullScreenViewController:(id)a3 viewWillTransitionToSize:(CGSize)a4 coordinator:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a5;
  id v9 = a3;
  __int16 v10 = [(AVPlayerViewController *)self contentView];
  __int16 v11 = [v9 viewIfLoaded];

  LODWORD(v9) = [v10 isDescendantOfView:v11];
  if (v9) {
    -[AVPlayerViewController _contentViewWillTransitionToSize:withTransitionCoordinator:](self, "_contentViewWillTransitionToSize:withTransitionCoordinator:", v12, width, height);
  }
}

- (id)playbackContainerViewForFullScreenViewController:(id)a3
{
  BOOL v3 = [(AVPlayerViewController *)self contentView];
  id v4 = [v3 playbackContentContainerView];

  return v4;
}

- (void)fullScreenViewControllerDidAttachContentView:(id)a3
{
}

- (void)fullScreenViewControllerWillAttachContentView:(id)a3
{
  [(AVMobileControlsViewController *)self->_controlsViewController willMoveToParentViewController:0];
  controlsViewController = self->_controlsViewController;

  [(AVMobileControlsViewController *)controlsViewController removeFromParentViewController];
}

- (void)fullScreenViewControllerWillEndFullScreenPresentation:(id)a3
{
  [(AVPlayerViewController *)self _setContentViewOnSelf];
  id v4 = [(AVPlayerViewController *)self _behaviorStorage];
  [v4 enumerateAllBehaviorContextsImplementingSelector:sel_willExitFullScreen forProtocol:&unk_1F0964880 usingBlock:&__block_literal_global_794];
}

uint64_t __80__AVPlayerViewController_fullScreenViewControllerWillEndFullScreenPresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willExitFullScreen];
}

- (void)fullScreenViewControllerWillBeginFullScreenPresentation:(id)a3
{
  [(AVPlayerView *)self->_playerViewControllerView setContentView:0];
  [(AVPlayerViewController *)self setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:1];
  id v4 = [(AVPlayerViewController *)self _behaviorStorage];
  [v4 enumerateAllBehaviorContextsImplementingSelector:sel_willEnterFullScreen forProtocol:&unk_1F0964880 usingBlock:&__block_literal_global_791];
}

uint64_t __82__AVPlayerViewController_fullScreenViewControllerWillBeginFullScreenPresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willEnterFullScreen];
}

- (void)scrubbingGestureControllerStateDidChange:(id)a3
{
  id v16 = a3;
  if ([v16 state] == 2)
  {
    id v4 = [v16 platformAdapter];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v6 = [v16 platformAdapter];
      id v7 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
      uint64_t v8 = [v7 view];
      [v8 layoutMargins];
      double v10 = v9;
      double v12 = v11;

      uint64_t v13 = [v7 view];
      [v13 frame];
      double v15 = v14 - v10 - v12;

      [v6 setScrubbingWidth:v15];
    }
  }
}

- (id)scrubbingGestureConfigurationForGestureController:(id)a3
{
  return 0;
}

- (void)scrollingObserverDidChangeScrollingState:(id)a3
{
  [(AVPlayerViewController *)self performInitialSetupIfNeededAndPossible];
  -[AVPlayerViewController _updateControlsViewControllerPerformanceState]((uint64_t)self);
  -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);

  -[AVPlayerViewController _updateVisualAnalysisViewHiddenState]((uint64_t)self);
}

- (uint64_t)_updateVisualAnalysisViewHiddenState
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = [*(id *)(result + 1168) scrollingObserver];
    int v3 = [v2 isScrolling];

    uint64_t v4 = [v1 allowsVideoFrameAnalysis] ^ 1 | v3;
    id v5 = (void *)v1[213];
    return [v5 setHidden:v4];
  }
  return result;
}

- (void)playbackControlsView:(id)a3 animateAlongsideVisibilityAnimationsWithAnimationCoordinator:(id)a4 appearingViews:(id)a5 disappearingViews:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  double v12 = [(AVPlayerViewController *)self contentView];
  uint64_t v13 = [v12 playbackControlsView];
  [v13 animateAlongsideVisibilityAnimationsWithAnimationCoordinator:v9 appearingViews:v11 disappearingViews:v10];

  double v14 = [(AVPlayerViewController *)self contentView];
  double v15 = [v14 playbackControlsView];
  id v16 = [v15 playbackControlsContainer];

  uint64_t v17 = [v11 containsObject:v16];
  int v18 = [v10 containsObject:v16];

  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator_]&& v17 | v18)
  {
    uint64_t v19 = [(AVPlayerViewController *)self delegate];
    [v19 playerViewController:self willTransitionToVisibilityOfPlaybackControls:v17 withAnimationCoordinator:v9];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke;
  v21[3] = &unk_1E5FC4698;
  v21[4] = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2;
  v20[3] = &unk_1E5FC3528;
  v20[4] = self;
  [v9 addCoordinatedAnimations:v21 completion:v20];
}

void __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v1, "avkit_needsUpdateBackdropCaptureViewHidden");
}

void __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v1, "avkit_needsUpdateBackdropCaptureViewHidden");
}

- (void)playbackControlsViewDidToggleControlsVisibility:(id)a3
{
  -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](self);

  -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
}

- (void)_updateAnalysisButtonBottomInsetIfNeeded
{
  if (result)
  {
    id v1 = result;
    if (result[213])
    {
      UIEdgeInsets result = (void *)[result allowsVideoFrameAnalysis];
      if (result)
      {
        double v2 = 8.0;
        if (v1[148] != 1)
        {
          int v3 = [v1 contentView];
          uint64_t v4 = [v1 contentView];
          id v5 = [v4 playbackControlsView];

          if ([v5 showsPlaybackControls])
          {
            id v6 = (id)v1[213];
            id v7 = [v5 transportControlsContainerView];
            [v3 frame];
            double v22 = v8;
            [v6 bounds];
            objc_msgSend(v3, "convertRect:fromView:", v6);
            CGFloat v10 = v9;
            CGFloat v12 = v11;
            CGFloat v14 = v13;
            CGFloat v16 = v15;

            [v7 bounds];
            objc_msgSend(v3, "convertRect:fromView:", v7);
            CGFloat x = v24.origin.x;
            CGFloat y = v24.origin.y;
            CGFloat width = v24.size.width;
            v27.size.double height = v24.size.height + v22 - CGRectGetMaxY(v24);
            v25.origin.CGFloat x = v10;
            v25.origin.CGFloat y = v12;
            v25.size.CGFloat width = v14;
            v25.size.double height = v16;
            v27.origin.CGFloat x = x;
            v27.origin.CGFloat y = y;
            v27.size.CGFloat width = width;
            CGRect v26 = CGRectIntersection(v25, v27);
            double height = v26.size.height;
            if (CGRectEqualToRect(v26, *MEMORY[0x1E4F1DB20])) {
              double v2 = 8.0;
            }
            else {
              double v2 = height + 8.0;
            }
          }
        }
        long long v21 = (void *)v1[213];
        return (void *)[v21 setAnalysisButtonBottomInset:v2];
      }
    }
  }
  return result;
}

- (void)_updateWantsAnalysisButtonVisibleStateIfNeeded
{
  if (result)
  {
    id v1 = result;
    if (result[213])
    {
      UIEdgeInsets result = (void *)[result allowsVideoFrameAnalysis];
      if (result)
      {
        char v2 = [v1 isPresentingDetachedFullScreen];
        uint64_t v3 = [v1 showsAnalysisButtonIfAvailable];
        uint64_t v4 = v3;
        if ((v2 & 1) == 0)
        {
          int v5 = *((unsigned char *)v1 + 977) ? v3 : 0;
          if (v5 == 1)
          {
            if (v1[148] == 1)
            {
              uint64_t v4 = 0;
            }
            else
            {
              id v6 = [v1 contentView];
              id v7 = [v6 playbackControlsView];
              uint64_t v4 = [v7 showsPlaybackControls];
            }
          }
        }
        double v8 = (void *)v1[213];
        return (void *)[v8 setWantsAnalysisButtonVisible:v4];
      }
    }
  }
  return result;
}

- (void)playbackControlsViewNeedsUpdateStatusBarAppearance:(id)a3
{
  uint64_t v4 = [(AVPlayerViewController *)self _activeViewControllerForContentView];
  int v5 = [v4 transitionCoordinator];

  if (v5)
  {
    id v6 = [v4 transitionCoordinator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__AVPlayerViewController_playbackControlsViewNeedsUpdateStatusBarAppearance___block_invoke;
    v7[3] = &unk_1E5FC2C48;
    void v7[4] = self;
    [v6 animateAlongsideTransition:v7 completion:0];
  }
  else
  {
    [(AVPlayerViewController *)self _updateViewControllerPreferencesIfNeeded];
  }
}

uint64_t __77__AVPlayerViewController_playbackControlsViewNeedsUpdateStatusBarAppearance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewControllerPreferencesIfNeeded];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(AVPlayerViewController *)self playbackControlsController];
  [v3 setPopoverIsBeingPresented:0];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v3 = [(AVPlayerViewController *)self playbackControlsController];
  [v3 setPopoverIsBeingPresented:1];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 0;
}

- (void)pictureInPictureControllerDidSkipForwardInPictureInPicture:(id)a3
{
}

- (void)_updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:(void *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  -[AVPlayerViewController _updateSupplementalSubtitlesIfNecessary]((uint64_t)a1);
  uint64_t v4 = a1[175];
  if (!v4) {
    return;
  }
  if (a2 == 2)
  {
    if ((v4 & 0xA) == 0) {
      return;
    }
    id v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      CGRect v25 = "-[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:]";
      __int16 v26 = 2112;
      CGRect v27 = a1;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s DisplayTypeOnSkipForward AVPVC: %@", buf, 0x16u);
    }

    double v8 = (void *)a1[174];
    double v9 = 10.0;
LABEL_18:
    [v8 userRequestedSeekWithTimeInterval:v9];
    return;
  }
  if (a2 == 1)
  {
    if ((v4 & 0xA) == 0) {
      return;
    }
    CGFloat v10 = _AVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      CGRect v25 = "-[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:]";
      __int16 v26 = 2112;
      CGRect v27 = a1;
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s DisplayTypeOnSkipBack AVPVC: %@", buf, 0x16u);
    }

    double v8 = (void *)a1[174];
    double v9 = -10.0;
    goto LABEL_18;
  }
  if (a2) {
    return;
  }
  id v23 = [a1 player];
  [v23 rate];
  if (v5 == 0.0)
  {
  }
  else
  {
    uint64_t v6 = a1[175];
    if ((v6 & 4) != 0)
    {
    }
    else
    {

      if ((v6 & 2) == 0) {
        return;
      }
    }
    double v11 = _AVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      CGRect v25 = "-[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:]";
      __int16 v26 = 2112;
      CGRect v27 = a1;
      _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s DisplayTypeOnMute AVPVC: %@", buf, 0x16u);
    }

    CGFloat v12 = (void *)a1[174];
    double v13 = [a1 _volumeController];
    CGFloat v14 = _AVLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [a1 player];
      if ([v15 isMuted]) {
        CGFloat v16 = "YES";
      }
      else {
        CGFloat v16 = "NO";
      }
      [v13 volume];
      CGRect v25 = "-[AVPlayerViewController _isVolumeMuted]";
      __int16 v26 = 2112;
      *(_DWORD *)long long buf = 136315906;
      CGRect v27 = a1;
      if (fabsf(v17) < 0.00000011921 || v17 < 0.0) {
        uint64_t v19 = "YES";
      }
      else {
        uint64_t v19 = "NO";
      }
      __int16 v28 = 2082;
      BOOL v29 = v16;
      __int16 v30 = 2082;
      int v31 = v19;
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s AVPVC: %@ Player mute:%{public}s and system mute:%{public}s states", buf, 0x2Au);
    }
    long long v20 = [a1 player];
    if ([v20 isMuted])
    {
      BOOL v21 = 1;
    }
    else
    {
      [v13 volume];
      BOOL v21 = v22 <= 0.0;
    }

    [v12 updatePlayerVolumeToPlayerMuted:v21];
  }
}

- (void)_updateSupplementalSubtitlesIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!*(void *)(a1 + 1400))
    {
      if (([*(id *)(a1 + 1392) smartSubtitlesActive] & 1) != 0
        || ([(id)a1 playerController],
            char v2 = objc_claimAutoreleasedReturnValue(),
            char v3 = [v2 subtitlesActive],
            v2,
            (v3 & 1) == 0))
      {
        uint64_t v4 = _AVLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 136315394;
          id v7 = "-[AVPlayerViewController _updateSupplementalSubtitlesIfNecessary]";
          __int16 v8 = 2112;
          uint64_t v9 = a1;
          _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSubtitleBehaviorUserSelectedAndPreferredLanguage subtitles active AVPVC %@", (uint8_t *)&v6, 0x16u);
        }

        float v5 = [(id)a1 playerController];
        [v5 setCurrentAssetMediaOption:0];
      }
    }
  }
}

- (void)pictureInPictureControllerDidSkipBackwardInPictureInPicture:(id)a3
{
}

- (void)pictureInPictureController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler_])
  {
    __int16 v8 = [(AVPlayerViewController *)self _transitionController];
    uint64_t v9 = [v8 presentationContext];
    int v10 = [v9 isDismissing];

    double v11 = _AVLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)long long buf = 136315138;
        id v23 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
        _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s PIP stopping, pending restore of user interface presentation will start after dismissal transition completes", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v6);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E5FC2BB0;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, (id *)buf);
      id v18 = v7;
      [(AVPlayerViewController *)self setPendingRestoreUserInterfaceForPictureInPictureStopHandler:v17];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)long long buf = 136315138;
        id v23 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
        _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s PIP stopping, restore user interface starting", buf, 0xCu);
      }

      CGFloat v14 = [(AVPlayerViewController *)self delegate];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke_782;
      v15[3] = &unk_1E5FC2E58;
      id v16 = v7;
      [v14 playerViewController:self restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:v15];
    }
  }
  else
  {
    double v13 = _AVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v23 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
      _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s PIP stopping, client did not implement restore user interface on stop delegate, call back to Pegasus and assume client is restore ready.", buf, 0xCu);
    }

    if (v7) {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
}

void __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 48));
    [v2 pictureInPictureController:WeakRetained restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:*(void *)(a1 + 32)];
  }
}

uint64_t __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke_782(uint64_t result, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    uint64_t v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      float v5 = @"NO";
      if (a2) {
        float v5 = @"YES";
      }
      int v6 = 136315394;
      id v7 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletion"
           "Handler:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s PIP restore underway, client reported restore is ready: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v3 + 32) + 16))();
  }
  return result;
}

- (void)pictureInPictureControllerDidStopPictureInPicture:(id)a3
{
  id v4 = a3;
  self->_BOOL pipStartingOrActive = 0;
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerDidStopPictureInPicture_])
  {
    float v5 = [(AVPlayerViewController *)self delegate];
    [v5 playerViewControllerDidStopPictureInPicture:self];
  }
  int v6 = [(AVPlayerViewController *)self _behaviorStorage];
  [v6 enumerateAllBehaviorContextsImplementingSelector:sel_didStopPictureInPicture forProtocol:&unk_1F0964880 usingBlock:&__block_literal_global_779];

  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __76__AVPlayerViewController_pictureInPictureControllerDidStopPictureInPicture___block_invoke_2;
  BOOL v12 = &unk_1E5FC44F8;
  objc_copyWeak(&v13, &location);
  [v7 animateWithDuration:&v9 animations:0.2];
  __int16 v8 = [(AVPlayerViewController *)self playbackControlsController];
  [v8 setPictureInPictureActive:0];

  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __76__AVPlayerViewController_pictureInPictureControllerDidStopPictureInPicture___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[211] setBackgroundColor:0];
    id WeakRetained = v2;
  }
}

uint64_t __76__AVPlayerViewController_pictureInPictureControllerDidStopPictureInPicture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didStopPictureInPicture];
}

- (void)pictureInPictureControllerWillStopPictureInPicture:(id)a3
{
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerWillStopPictureInPicture_])
  {
    id v4 = [(AVPlayerViewController *)self delegate];
    [v4 playerViewControllerWillStopPictureInPicture:self];
  }
}

- (void)pictureInPictureController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_BOOL pipStartingOrActive = 0;
  __int16 v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 localizedDescription];
    *(_DWORD *)long long buf = 136315394;
    id v16 = "-[AVPlayerViewController pictureInPictureController:failedToStartPictureInPictureWithError:]";
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to start PIP with error: '%@'", buf, 0x16u);
  }
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_failedToStartPictureInPictureWithError_])
  {
    uint64_t v10 = [(AVPlayerViewController *)self delegate];
    [v10 playerViewController:self failedToStartPictureInPictureWithError:v7];
  }
  objc_initWeak((id *)buf, self);
  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__AVPlayerViewController_pictureInPictureController_failedToStartPictureInPictureWithError___block_invoke;
  v13[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v14, (id *)buf);
  [v11 animateWithDuration:v13 animations:0.2];
  BOOL v12 = [(AVPlayerViewController *)self playbackControlsController];
  [v12 setPictureInPictureActive:0];

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __92__AVPlayerViewController_pictureInPictureController_failedToStartPictureInPictureWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[211] setBackgroundColor:0];
    id WeakRetained = v2;
  }
}

- (void)pictureInPictureControllerDidStartPictureInPicture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4FB2748];
  id v6 = (id *)MEMORY[0x1E4FB2608];
  id v7 = (void *)*MEMORY[0x1E4FB2608];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke;
  v23[3] = &__block_descriptor_40_e5_v8__0l;
  v23[4] = v5;
  __int16 v8 = (void *)[v7 beginBackgroundTaskWithExpirationHandler:v23];
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerDidStartPictureInPicture_])
  {
    uint64_t v9 = [(AVPlayerViewController *)self delegate];
    [v9 playerViewControllerDidStartPictureInPicture:self];
  }
  if (![(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart_])
  {
    BOOL v13 = [(AVPlayerViewController *)self isPresentingFullScreenFromInline];
    goto LABEL_9;
  }
  uint64_t v10 = [(AVPlayerViewController *)self delegate];
  int v11 = [v10 playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:self];

  BOOL v12 = [(AVPlayerViewController *)self isPresentingFullScreenFromInline];
  BOOL v13 = v12;
  if (v11)
  {
LABEL_9:
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_2;
    v19[3] = &unk_1E5FC2B88;
    objc_copyWeak(v20, &location);
    BOOL v21 = v13;
    v20[1] = v8;
    id v14 = (void (**)(void))MEMORY[0x1B3E963E0](v19);
    double v15 = [(AVTransitionController *)self->_transitionController presentationContext];
    int v16 = [v15 isPresenting];

    if (v16)
    {
      [(AVPlayerViewController *)self setDismissForPIPStartAfterPresentationHandler:v14];
    }
    else
    {
      __int16 v17 = [(AVTransitionController *)self->_transitionController presentationContext];
      int v18 = [v17 isDismissing];

      if (v18) {
        [*v6 endBackgroundTask:v8];
      }
      else {
        v14[2](v14);
      }
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
    goto LABEL_15;
  }
  if (v12) {
    [(AVPlayerViewController *)self _updatePlaybackControlsState];
  }
  [*v6 endBackgroundTask:v8];
LABEL_15:
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
}

uint64_t __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 32)];
}

void __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained isPresentingFullScreenFromInline] & 1) != 0
    || [WeakRetained isPresentedFullScreen])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_3;
    v4[3] = &unk_1E5FC2B60;
    char v5 = *(unsigned char *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 40);
    v4[4] = WeakRetained;
    v4[5] = v3;
    [WeakRetained _transitionFromFullScreenWithReason:4 animated:1 completionHandler:v4];
  }
  else
  {
    [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 40)];
  }
}

uint64_t __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _updatePlaybackControlsState];
  }
  id v2 = (void *)*MEMORY[0x1E4FB2608];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endBackgroundTask:v3];
}

- (void)pictureInPictureControllerWillStartPictureInPicture:(id)a3
{
  id v4 = a3;
  self->_BOOL pipStartingOrActive = 1;
  char v5 = [(AVPlayerViewController *)self _behaviorStorage];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke;
  v19[3] = &unk_1E5FC2B38;
  void v19[4] = self;
  [v5 enumerateAllBehaviorContextsImplementingSelector:sel_willStartPictureInPictureWithViewController_ forProtocol:&unk_1F0964880 usingBlock:v19];

  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
  id v7 = [WeakRetained presentedViewController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_2;
  v16[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v17, &location);
  [v7 dismissViewControllerAnimated:1 completion:v16];

  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerWillStartPictureInPicture_])
  {
    __int16 v8 = [(AVPlayerViewController *)self delegate];
    [v8 playerViewControllerWillStartPictureInPicture:self];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  BOOL v13 = __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_3;
  id v14 = &unk_1E5FC44F8;
  objc_copyWeak(&v15, &location);
  [v9 animateWithDuration:&v11 animations:0.2];
  uint64_t v10 = [(AVPlayerViewController *)self playbackControlsController];
  [v10 setPictureInPictureActive:1];

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1512);
  id v3 = a2;
  id v4 = [v2 pictureInPictureViewController];
  [v3 willStartPictureInPictureWithViewController:v4];
}

void __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained playbackControlsController];
  [v1 setPopoverIsBeingPresented:0];
}

void __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[211];
    id v4 = WeakRetained;
    id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorBackgroundColor");
    [v2 setBackgroundColor:v3];

    id WeakRetained = v4;
  }
}

- (BOOL)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (int64_t)avkit_contentSourceType
{
  return 0;
}

- (void)avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 pictureInPicturePlayerLayerView];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[AVPlayerViewController avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:]";
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Disabling legible display for picture in picture player layer", (uint8_t *)&v9, 0xCu);
    }

    id v7 = [v3 pictureInPicturePlayerLayerView];
    __int16 v8 = [v7 playerLayer];
    [v8 setLegibleDisplayEnabled:0];
  }
}

- (void)avkit_endReducingResourcesForPictureInPictureViewController:(id)a3 playerController:(id)a4
{
  id v12 = a3;
  char v5 = [(AVPlayerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVPlayerViewController *)self delegate];
    [v7 playerViewControllerEndReducingResourcesForPictureInPicture:self];
  }
  else
  {
    __int16 v8 = [(AVPlayerViewController *)self playerController];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = [(AVPlayerViewController *)self playerController];
    uint64_t v10 = [v12 pictureInPicturePlayerLayerView];
    uint64_t v11 = [v10 playerLayer];
    [v7 endReducingResourcesForPictureInPicturePlayerLayer:v11];
  }
LABEL_6:
}

- (void)avkit_beginReducingResourcesForPictureInPictureViewController:(id)a3 playerController:(id)a4
{
  id v12 = a3;
  char v5 = [(AVPlayerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVPlayerViewController *)self delegate];
    [v7 playerViewControllerBeginReducingResourcesForPictureInPicture:self];
  }
  else
  {
    __int16 v8 = [(AVPlayerViewController *)self playerController];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = [(AVPlayerViewController *)self playerController];
    uint64_t v10 = [v12 pictureInPicturePlayerLayerView];
    uint64_t v11 = [v10 playerLayer];
    [v7 beginReducingResourcesForPictureInPicturePlayerLayer:v11];
  }
LABEL_6:
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3
{
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v4 = a3;
  [v4 loadViewIfNeeded];
  char v5 = [v4 view];

  [(AVPlayerViewController *)self videoBounds];
  objc_msgSend(v5, "setFrame:");

  playerLayerView = self->_playerLayerView;

  [(__AVPlayerLayerView *)playerLayerView startRoutingVideoToPictureInPicturePlayerLayerView];
}

- (id)avkit_pictureInPictureViewController
{
  id v3 = [AVPictureInPictureViewController alloc];
  id v4 = [(__AVPlayerLayerView *)self->_playerLayerView pictureInPicturePlayerLayerView];
  char v5 = [(AVPictureInPictureViewController *)v3 initWithPictureInPicturePlayerLayerView:v4];

  return v5;
}

- (BOOL)avkit_isVisible
{
  id v2 = [(AVPlayerViewController *)self contentView];
  [v2 bounds];
  BOOL v3 = !CGRectIsEmpty(v5);

  return v3;
}

- (CGRect)avkit_videoRectInWindow
{
  BOOL v3 = [(AVPlayerViewController *)self contentView];
  uint64_t v4 = [v3 window];
  CGRect v5 = [(AVPlayerViewController *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(AVPlayerViewController *)self contentView];
  objc_msgSend((id)v4, "convertRect:fromView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  id v23 = [(AVPlayerViewController *)self playerController];
  LOBYTE(v4) = [v23 isPlayingOnExternalScreen];

  if ((v4 & 1) == 0)
  {
    uint64_t v24 = [(AVPlayerViewController *)self avkit_window];
    [(__AVPlayerLayerView *)self->_playerLayerView videoBounds];
    objc_msgSend(v24, "convertRect:fromView:", self->_playerLayerView);
    double v16 = v25;
    double v18 = v26;
    double v20 = v27;
    double v22 = v28;
  }
  double v29 = v16;
  double v30 = v18;
  double v31 = v20;
  double v32 = v22;
  result.size.double height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (UIWindow)avkit_window
{
  return (UIWindow *)[(__AVPlayerLayerView *)self->_playerLayerView window];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  double v6 = (UIHoverGestureRecognizer *)a3;
  double v7 = (UITapGestureRecognizer *)a4;
  double v8 = v7;
  if (self->_hoverGestureRecognizer == v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      char isKindOfClass = 1;
      goto LABEL_10;
    }
LABEL_8:
    char isKindOfClass = 0;
    goto LABEL_10;
  }
  if ((UIHoverGestureRecognizer *)self->_scrubGestureRecognizer == v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_10;
  }
  if ((UIHoverGestureRecognizer *)self->_tapThroughGestureRecognizer != v6) {
    goto LABEL_8;
  }
  char isKindOfClass = self->_singleTapGestureRecognizer == v7;
LABEL_10:

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  double v6 = (AVCenterTapGestureRecognizer *)a3;
  id v7 = a4;
  if ((AVCenterTapGestureRecognizer *)self->_singleTapGestureRecognizer == v6
    || self->_tapThroughGestureRecognizer == v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = [(AVScrubbingGestureController *)self->_scrubbingGestureController state] != 3;
      goto LABEL_10;
    }
LABEL_9:
    char isKindOfClass = 0;
    goto LABEL_10;
  }
  if ((AVCenterTapGestureRecognizer *)self->_videoGravityPinchGestureRecognizer != v6) {
    goto LABEL_9;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
LABEL_10:

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self scrubGestureRecognizer];

  if (v5 == v4)
  {
    BOOL v6 = [(AVPlayerViewController *)self showsPlaybackControls];
    if (v6)
    {
      id v7 = [(AVPlayerViewController *)self playbackControlsController];
      char v8 = [v7 showsProminentPlayButton];

      if (v8)
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        double v9 = [(AVPlayerViewController *)self scrubGestureRecognizer];
        double v10 = [(AVPlayerViewController *)self contentView];
        [v9 velocityInView:v10];
        double v12 = v11;
        double v14 = v13;

        double v15 = fabs(v14);
        LOBYTE(v6) = fabs(v12) > v15 + v15;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    char v8 = [(AVPlayerViewController *)self playbackControlsController];
    if (v8)
    {
      double v9 = v8;
      char v10 = [v8 tapGestureRecognizersCanReceiveTouches];

      if ((v10 & 1) == 0)
      {
LABEL_11:
        LOBYTE(self) = 0;
        goto LABEL_12;
      }
    }
    else if (![(AVPlayerViewController *)self hasCustomPlaybackControls] {
           && ![(AVPlayerViewController *)self showsPlaybackControls])
    }
    {
      goto LABEL_11;
    }
    double v11 = [v6 view];
    double v12 = [v6 view];
    [v7 locationInView:v12];
    double v13 = objc_msgSend(v11, "hitTest:withEvent:", 0);

    double v14 = [(AVMobileControlsViewController *)self->_controlsViewController viewIfLoaded];
    double v15 = self->_customControlsView;
    if (([v13 isDescendantOfView:v14] & 1) != 0
      || ([v13 isDescendantOfView:v15] & 1) != 0)
    {
      LOBYTE(self) = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v6 numberOfTapsRequired] >= 2)
      {
        double v17 = [(AVPlayerViewController *)self playbackControlsController];
        LODWORD(self) = [v17 entersFullScreenWhenTapped] ^ 1;
      }
      else
      {
        LOBYTE(self) = 1;
      }
    }
  }
LABEL_12:

  return (char)self;
}

- (BOOL)_modalPresentationStyleIsFullScreen
{
  return ![(AVPlayerViewController *)self modalPresentationStyle]
      || [(AVPlayerViewController *)self modalPresentationStyle] == 5;
}

- (BOOL)_isTransitioningToOrFromFullScreen
{
  if ([(AVPlayerViewController *)self isBeingDismissed]) {
    char v3 = 1;
  }
  else {
    char v3 = [(AVPlayerViewController *)self isBeingPresented];
  }
  id v4 = [(AVPlayerViewController *)self fullScreenViewController];
  if ([v4 isBeingPresented])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(AVPlayerViewController *)self fullScreenViewController];
    if ([v6 isBeingDismissed])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = [(AVPlayerViewController *)self fullScreenViewController];
      if (v7)
      {
        char v8 = [(AVPlayerViewController *)self fullScreenViewController];
        double v9 = [v8 presentingViewController];
        BOOL v5 = v9 == 0;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }

  return v3 | v5;
}

- (void)transitionController:(id)a3 animationProgressDidChange:(float)a4
{
  double v4 = 1.0 - a4;
  id v5 = [(AVPlayerViewController *)self volumeAnimator];
  [v5 setProgressTowardsZero:1.0 - v4 * v4];
}

- (void)transitionController:(id)a3 transitionWillComplete:(BOOL)a4 continueBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = (void (**)(id, void))a5;
  if (![(AVPlayerViewController *)self wantsDetachedFullscreenPresentation]
    || ![(AVPlayerViewController *)self canDisplayContentInDetachedWindow])
  {
    uint64_t v10 = [(AVPlayerViewController *)self fullScreenViewController];
    if (!v10)
    {
LABEL_9:
      [(AVPlayerViewController *)self _setContentViewOnSelf];
      goto LABEL_10;
    }
    double v11 = (void *)v10;
    double v12 = [(AVPlayerViewController *)self fullScreenViewController];
    if ([v12 isBeingPresented] && !v6)
    {

      goto LABEL_9;
    }
    double v13 = [(AVPlayerViewController *)self fullScreenViewController];
    int v14 = [v13 isBeingDismissed];

    if (v14 && v6) {
      goto LABEL_9;
    }
  }
LABEL_10:
  if (!v6)
  {
LABEL_18:
    v9[2](v9, 0);
    goto LABEL_19;
  }
  double v15 = [v8 presentationContext];
  if (![v15 isDismissing]
    || ([(AVPlayerViewController *)self player], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  double v17 = (void *)v16;
  double v18 = [v8 presentationContext];
  if (([v18 wasInitiallyInteractive] & 1) == 0)
  {

    goto LABEL_17;
  }
  double v19 = [v8 presentationContext];
  double v20 = [v19 presentedViewController];

  if (v20 != self) {
    goto LABEL_18;
  }
  objc_initWeak(&location, self);
  double v21 = [(AVPlayerViewController *)self player];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__AVPlayerViewController_transitionController_transitionWillComplete_continueBlock___block_invoke;
  v22[3] = &unk_1E5FC2B10;
  objc_copyWeak(&v24, &location);
  id v23 = v9;
  +[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:v21 cancellable:1 dismissalBlock:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_19:
  self->_fullscreenTransitionInProgress = 0;
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);
}

void __84__AVPlayerViewController_transitionController_transitionWillComplete_continueBlock___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (a2)
    {
      id v5 = [WeakRetained fullScreenViewController];
      [v5 attachContentView];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v6;
  }
}

- (void)_updateStatusBarGradientViewVisibility
{
  if (!a1 || *(void *)(a1 + 1184) == 1) {
    return;
  }
  id v2 = [(id)a1 presentingViewController];
  if (v2)
  {
  }
  else if (([(id)a1 isPresentingFullScreenFromInline] & 1) == 0)
  {
    goto LABEL_8;
  }
  if (!*(unsigned char *)(a1 + 1016))
  {
    BOOL v3 = *(unsigned char *)(a1 + 1017) == 0;
    goto LABEL_10;
  }
LABEL_8:
  BOOL v3 = 0;
LABEL_10:
  id v4 = [*(id *)(a1 + 1168) playbackContentContainerView];
  [v4 setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:v3];
}

- (id)transitionControllerBackgroundViewBackgroundColor:(id)a3
{
  id v5 = a3;
  id v6 = [v5 presentationContext];
  char v7 = [v6 wasInitiallyInteractive];
  if ((v7 & 1) == 0)
  {
    BOOL v3 = [v5 presentationContext];
    id v4 = [v3 sourceView];
    if (!v4)
    {
      id v8 = [MEMORY[0x1E4FB1618] clearColor];
      goto LABEL_6;
    }
  }
  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  if ((v7 & 1) == 0)
  {
LABEL_6:
  }

  return v8;
}

- (id)transitionControllerPresentedViewBackgroundColor:(id)a3
{
  id v6 = a3;
  char v7 = [v6 presentationContext];
  if (![v7 hasActiveTransition]) {
    goto LABEL_29;
  }
  id v8 = [v6 presentationContext];
  char v9 = [v8 wasInitiallyInteractive];
  if (v9)
  {
    if ([(AVPlayerViewController *)self _isUnsupportedContent]) {
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v3 = [v6 presentationContext];
    id v4 = [v3 sourceView];
    if (!v4 || [(AVPlayerViewController *)self _isUnsupportedContent]) {
      goto LABEL_27;
    }
  }
  uint64_t v10 = [(AVPlayerViewController *)self playerController];
  [v10 contentDimensions];
  BOOL v15 = ((v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v12 >= 0
     || (unint64_t)(v12 - 1) < 0xFFFFFFFFFFFFFLL;
  BOOL v17 = (v11 < 0 || ((v11 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
     && (unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFELL;
  if (v17 || !v15)
  {
LABEL_26:

    if (v9)
    {
LABEL_28:

LABEL_29:
LABEL_30:
      uint64_t v19 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_31;
    }
LABEL_27:

    goto LABEL_28;
  }
  double v18 = [(AVPlayerViewController *)self playerController];
  if ([v18 isPlayingOnExternalScreen])
  {

    goto LABEL_26;
  }
  BOOL v22 = [(AVPlayerViewController *)self isPictureInPictureActive];

  if ((v9 & 1) == 0)
  {
  }
  if (v22) {
    goto LABEL_30;
  }
  uint64_t v19 = [MEMORY[0x1E4FB1618] clearColor];
LABEL_31:
  double v20 = (void *)v19;

  return v20;
}

- (BOOL)transitionControllerCanBeginInteractivePresentationTransition:(id)a3
{
  if (![(AVPlayerViewController *)self canControlPlayback]
    || ![(AVPlayerViewController *)self _canEnterFullScreen])
  {
    return 0;
  }
  id v4 = [(AVPlayerViewController *)self parentViewController];
  if (v4) {
    BOOL v5 = [(AVPlayerViewController *)self _isDescendantOfRootViewController];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)transitionControllerCanBeginInteractiveDismissalTransition:(id)a3
{
  p_Class isa = (id *)&self->super.super.super.isa;
  if ([(AVPlayerViewController *)self canControlPlayback])
  {
    if ([p_isa isPresentingFullScreenFromInline])
    {
      id v4 = [p_isa contentView];
      BOOL v5 = [v4 window];
      id v6 = [v5 windowScene];
      uint64_t v7 = [v6 interfaceOrientation];

      if (([p_isa _isTransitioningToOrFromFullScreen] & 1) == 0)
      {
        id v8 = [p_isa presentationContext];
        char v9 = [v8 presentingTransition];
        if (([v9 presenterSupportsOrientation:v7] & 1) == 0
          && !+[AVPresentationContext supportsInteractiveCounterRotationDismissals])
        {
          char v11 = 0;
          goto LABEL_15;
        }
        p_Class isa = (id *)objc_loadWeakRetained(p_isa + 138);
        uint64_t v10 = [p_isa presentedViewController];
        char v11 = v10 == 0;

LABEL_7:
LABEL_15:

        goto LABEL_16;
      }
    }
    else if (([p_isa _isTransitioningToOrFromFullScreen] & 1) == 0 {
           && [p_isa _isDescendantOfRootViewController])
    }
    {
      uint64_t v12 = [p_isa presentedViewController];
      if (v12)
      {
        id v8 = (void *)v12;
        char v11 = 0;
LABEL_16:

        return v11;
      }
      char v9 = [p_isa presentingViewController];
      uint64_t v14 = [v9 presentedViewController];
      if ((id *)v14 == p_isa)
      {
        char v11 = [p_isa _modalPresentationStyleIsFullScreen];
        id v8 = 0;
      }
      else
      {
        id v8 = 0;
        char v11 = 0;
        p_Class isa = (id *)v14;
      }
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)transitionControllerBeginInteractiveDismissalTransition:(id)a3
{
}

- (void)transitionControllerBeginInteractivePresentationTransition:(id)a3
{
  id v4 = [(AVPlayerViewController *)self viewIfLoaded];
  BOOL v5 = [v4 window];

  if (v5)
  {
    [(AVPlayerViewController *)self _transitionToFullScreenAnimated:1 interactive:1 completionHandler:&__block_literal_global_749];
  }
}

- (void)transitionController:(id)a3 prepareForFinishingInteractiveTransition:(id)a4
{
  char v9 = (void (**)(void))a4;
  if (![(AVPlayerViewController *)self isPresentingFullScreenFromInline]) {
    goto LABEL_5;
  }
  BOOL v5 = [(AVPlayerViewController *)self fullScreenViewController];
  if (([v5 isBeingPresented] & 1) != 0
    || [(AVPlayerViewController *)self isPictureInPictureActive])
  {

LABEL_5:
    [(AVPlayerViewController *)self setFinishPreparingForInteractiveDismissalHandler:0];
    v9[2]();
    goto LABEL_6;
  }
  BOOL v6 = [(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_shouldExitFullScreenWithReason_];

  if (!v6) {
    goto LABEL_5;
  }
  [(AVPlayerViewController *)self setFinishPreparingForInteractiveDismissalHandler:v9];
  uint64_t v7 = [(AVPlayerViewController *)self delegate];
  int v8 = [v7 playerViewController:self shouldExitFullScreenWithReason:2];

  if (v8) {
    goto LABEL_5;
  }
LABEL_6:
}

- (id)transitionController:(id)a3 targetViewForDismissingViewController:(id)a4
{
  BOOL v6 = (AVPlayerViewController *)a4;
  uint64_t v7 = [a3 presentationContext];
  int v8 = [v7 sourceView];

  if (v6 == self)
  {
    if ([(AVPlayerViewController *)v6 _delegateRespondsTo:sel_playerViewController_targetViewForDismissalAnimationWithProposedTargetView_])
    {
      char v11 = [(AVPlayerViewController *)v6 delegate];
      uint64_t v12 = [v11 playerViewController:v6 targetViewForDismissalAnimationWithProposedTargetView:v8];

      int v8 = (void *)v12;
    }
  }
  else
  {
    char v9 = [(AVPlayerViewController *)self view];

    if (v8 != v9)
    {
      uint64_t v10 = _AVLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_error_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_ERROR, "Target view should be our own view when the full screen view controller is being transitioned!", v14, 2u);
      }
    }
  }

  return v8;
}

- (void)transitionController:(id)a3 willBeginDismissingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(AVPlayerViewController *)self _shouldPausePlaybackWhenExitingFullscreen];
  char v9 = [AVPlayerControllerVolumeAnimator alloc];
  uint64_t v10 = [(AVPlayerViewController *)self playerController];
  char v11 = [(AVPlayerControllerVolumeAnimator *)v9 initWithPlayerController:v10];

  if (!v8)
  {
    if (![(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition_])goto LABEL_8; {
LABEL_6:
    }
    double v13 = [(AVPlayerViewController *)self delegate];
    char v14 = [v13 playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition:self];

    if ((v14 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v12 = [(AVPlayerControllerVolumeAnimator *)v11 canAnimateVolumeTowardsZero];
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition_])
  {
    goto LABEL_6;
  }
  if (v12) {
LABEL_7:
  }
    [(AVPlayerViewController *)self setVolumeAnimator:v11];
LABEL_8:
  BOOL v15 = [(AVPlayerViewController *)self playbackControlsController];
  uint64_t v16 = [v7 transitionCoordinator];
  if ([v16 isInteractive])
  {
    [v15 setPlayerViewControllerIsBeingTransitionedWithResizing:1];
  }
  else
  {
    BOOL v17 = [v6 presentationContext];
    double v18 = [v17 sourceView];
    [v15 setPlayerViewControllerIsBeingTransitionedWithResizing:v18 != 0];
  }
  uint64_t v19 = [v6 presentationContext];
  double v20 = [v19 sourceView];

  if (v20)
  {
    double v21 = [(AVPlayerViewController *)self controlsViewController];
    [v20 bounds];
    double v23 = v22;
    double v25 = v24;
    double v26 = [(AVPlayerViewController *)self transitionCoordinator];
    objc_msgSend(v21, "viewWillTransitionToSize:withTransitionCoordinator:", v26, v23, v25);
  }
  objc_initWeak(&location, self);
  double v27 = [v7 transitionCoordinator];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke;
  v31[3] = &unk_1E5FC2AC8;
  objc_copyWeak(&v33, &location);
  BOOL v34 = v8;
  v31[4] = self;
  double v28 = v11;
  double v32 = v28;
  [v27 animateAlongsideTransition:0 completion:v31];

  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator_])
  {
    double v29 = [(AVPlayerViewController *)self delegate];
    double v30 = [v7 transitionCoordinator];
    [v29 playerViewController:self willEndFullScreenPresentationWithAnimationCoordinator:v30];
  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([v3 isCancelled])
    {
      BOOL v5 = [WeakRetained volumeAnimator];
      [v5 restoreVolumeIfNeeded];

      [WeakRetained setVolumeAnimator:0];
      [WeakRetained[143] reset];
    }
    else
    {
      [WeakRetained[145] setWantsAppearanceConfigValues:0];
      id v6 = [WeakRetained[145] appearanceProxy];
      id v7 = [WeakRetained contentView];
      BOOL v8 = [v7 playbackContentContainerView];
      [v6 setActualView:v8];

      if (*(unsigned char *)(a1 + 56))
      {
        char v9 = [WeakRetained playerController];
        char v10 = objc_opt_respondsToSelector();

        char v11 = [WeakRetained playerController];
        BOOL v12 = v11;
        if (v10) {
          [v11 pauseForAllCoordinatedPlaybackParticipants:0];
        }
        else {
          [v11 setPlaying:0];
        }
      }
      [*(id *)(a1 + 32) _setContentViewOnSelf];
      [WeakRetained _notifyOfMetricsCollectionEvent:5];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke_2;
      BOOL v17 = &unk_1E5FC4180;
      id v18 = *(id *)(a1 + 40);
      objc_copyWeak(&v19, (id *)(a1 + 48));
      dispatch_async(MEMORY[0x1E4F14428], &v14);
      objc_destroyWeak(&v19);
    }
    objc_msgSend(WeakRetained[189], "contentSourceVideoRectInWindowChanged", v14, v15, v16, v17);
    [WeakRetained _updatePlaybackControlsState];
    double v13 = [WeakRetained playbackControlsController];
    [v13 setPlayerViewControllerIsBeingTransitionedWithResizing:0];
  }
}

void __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke_2(id *a1)
{
  id v1 = a1;
  [a1[4] restoreVolumeIfNeeded];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained setVolumeAnimator:0];

  id v3 = objc_loadWeakRetained(v1);
  uint64_t v6 = [v3 pendingRestoreUserInterfaceForPictureInPictureStopHandler];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setPendingRestoreUserInterfaceForPictureInPictureStopHandler:0];

  BOOL v5 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    BOOL v5 = (void *)v6;
  }
}

- (void)transitionController:(id)a3 willBeginPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVPlayerViewController *)self fullScreenViewController];

  if (v8 == v7)
  {
    [(AVPresentationContainerView *)self->_playerViewControllerView setWantsAppearanceConfigValues:1];
    char v9 = [(AVPresentationContainerView *)self->_playerViewControllerView appearanceProxy];
    [v9 setActualView:0];

    char v10 = [(AVPlayerViewController *)self fullScreenViewController];
    [v10 setDelegate:self];

    char v11 = [(AVPlayerViewController *)self presentationContext];
    objc_msgSend(v11, "setAllowsSecondWindowPresentations:", -[AVPlayerViewController wasInitializedUsingWebKitSPI](self, "wasInitializedUsingWebKitSPI") ^ 1);
  }
  BOOL v12 = [v6 presentationContext];
  double v13 = [v12 sourceView];

  if (v13)
  {
    uint64_t v14 = [(AVPlayerViewController *)self controlsViewController];
    [v13 bounds];
    double v16 = v15;
    double v18 = v17;
    id v19 = [(AVPlayerViewController *)self transitionCoordinator];
    objc_msgSend(v14, "viewWillTransitionToSize:withTransitionCoordinator:", v19, v16, v18);
  }
  double v20 = [(AVPlayerViewController *)self playbackControlsController];
  double v21 = [v7 transitionCoordinator];
  if ([v21 isInteractive])
  {
    [v20 setPlayerViewControllerIsBeingTransitionedWithResizing:1];
  }
  else
  {
    double v22 = [v6 presentationContext];
    double v23 = [v22 sourceView];
    [v20 setPlayerViewControllerIsBeingTransitionedWithResizing:v23 != 0];
  }
  double v24 = [v7 transitionCoordinator];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  double v30 = __81__AVPlayerViewController_transitionController_willBeginPresentingViewController___block_invoke;
  double v31 = &unk_1E5FC2AA0;
  double v32 = self;
  id v25 = v7;
  id v33 = v25;
  [v24 animateAlongsideTransition:0 completion:&v28];

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator_, v28, v29, v30, v31, v32))
  {
    double v26 = [(AVPlayerViewController *)self delegate];
    double v27 = [v25 transitionCoordinator];
    [v26 playerViewController:self willBeginFullScreenPresentationWithAnimationCoordinator:v27];
  }
}

uint64_t __81__AVPlayerViewController_transitionController_willBeginPresentingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isCancelled];
  BOOL v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _setContentViewOnSelf];
    [*(id *)(*(void *)(a1 + 32) + 1160) setWantsAppearanceConfigValues:0];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 1160) appearanceProxy];
    id v7 = [*(id *)(a1 + 32) contentView];
    id v8 = [v7 playbackContentContainerView];
    [v6 setActualView:v8];
  }
  else
  {
    [v5 _notifyOfMetricsCollectionEvent:4];
  }
  [*(id *)(*(void *)(a1 + 32) + 1512) contentSourceVideoRectInWindowChanged];
  [*(id *)(a1 + 32) _updatePlaybackControlsState];
  uint64_t v9 = [*(id *)(a1 + 32) playbackControlsController];
  [(id)v9 setPlayerViewControllerIsBeingTransitionedWithResizing:0];

  LOBYTE(v9) = [v3 isCancelled];
  if ((v9 & 1) == 0) {
    [*(id *)(a1 + 40) setNeedsUpdateOfSupportedInterfaceOrientations];
  }
  char v10 = [*(id *)(a1 + 32) dismissForPIPStartAfterPresentationHandler];

  if (v10)
  {
    char v11 = [*(id *)(a1 + 32) dismissForPIPStartAfterPresentationHandler];
    [*(id *)(a1 + 32) setDismissForPIPStartAfterPresentationHandler:0];
    v11[2](v11);
  }
  BOOL v12 = *(void **)(a1 + 32);

  return [v12 _createPictureInPictureControllerIfNeeded];
}

- (BOOL)transitionController:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(AVPlayerViewController *)self presentationContext];

  if (!v9) {
    goto LABEL_3;
  }
  char v10 = [(AVPlayerViewController *)self presentationContext];
  char v11 = [v10 presentedViewController];
  BOOL v12 = [v11 transitioningDelegate];
  double v13 = [(AVPlayerViewController *)self _avkitPreferredTransitioningDelegate];

  if (v12 == v13)
  {
LABEL_3:
    if (![(AVPlayerViewController *)self _isTrackingUserInteractionWithInteractiveView])
    {
      double v15 = [v7 view];
      double v16 = [(AVPlayerViewController *)self contentView];

      double v17 = [v8 view];
      if (v15 == v16)
      {
        double v18 = [(AVPlayerViewController *)self _actualContentOverlayView];
        if (([v17 isDescendantOfView:v18] & 1) == 0)
        {
          id v19 = [(AVPlayerViewController *)self contentView];
          double v20 = [v8 view];
          if ([v19 isViewDescendantOfPlaybackControlsSubview:v20])
          {
            double v21 = [v8 view];
            id v25 = [(AVPlayerViewController *)self contentView];
            double v22 = [v25 playbackControlsView];
            double v23 = [v22 prominentPlayButtonContainerView];
            char isKindOfClass = [v21 isDescendantOfView:v23];
          }
          else
          {
            char isKindOfClass = 1;
          }

          goto LABEL_17;
        }
        char isKindOfClass = 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char isKindOfClass = 0;
LABEL_19:

          goto LABEL_20;
        }
        double v18 = [v8 view];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = [v8 view];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
LABEL_17:

          goto LABEL_18;
        }
        char isKindOfClass = 1;
      }
LABEL_18:

      goto LABEL_19;
    }
  }
  char isKindOfClass = 0;
LABEL_20:

  return isKindOfClass & 1;
}

- (id)transitionController:(id)a3 configurationForPresentedViewController:(id)a4 presentingViewController:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (AVPlayerViewController *)a4;
  id v10 = a5;
  if (v9 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  BOOL v12 = +[AVPresentationConfiguration configurationWithTransitionStyle:v11 transitionDuration:0.4];

  return v12;
}

- (void)_notifyDelegateOfAnalysisCalloutAction
{
  if (a1)
  {
    id v2 = [a1 delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [a1 delegate];
      [v4 playerViewControllerWillPerformAnalysisCalloutAction:a1];
    }
  }
}

- (BOOL)shouldBeginTouchInteractionForVisualAnalysisView:(id)a3
{
  controlsViewController = self->_controlsViewController;
  return !controlsViewController
      || [(AVControlsViewController *)controlsViewController visibleControls] == 0;
}

- (void)visualAnalysisViewDidUpdateVisualLookupAvailability:(id)a3
{
  id v8 = a3;
  id v4 = +[AVKitGlobalSettings shared];
  int v5 = [v4 extendedVisualAnalysisEnabled];

  if (v5)
  {
    uint64_t v6 = [v8 hasVisualLookupResults];
    id v7 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
    [v7 setShowsVisualLookupControl:v6];
    -[AVPlayerViewController _setupToggleVisualLookupActionIfNeeded]((uint64_t)self);
    [(UIAction *)self->_toggleLookupAction setState:self->_showsVisualLookup];
    [(UIAction *)self->_toggleLookupAction setAttributes:[(UIAction *)self->_toggleLookupAction attributes] & 0xFFFFFFFFFFFFFFFELL | [(AVVisualAnalysisView *)self->_analysisView hasVisualLookupResults] ^ 1];
  }
}

- (void)_setupToggleVisualLookupActionIfNeeded
{
  if (a1)
  {
    id v2 = +[AVKitGlobalSettings shared];
    int v3 = [v2 extendedVisualAnalysisEnabled];

    if (v3)
    {
      objc_initWeak(&location, (id)a1);
      id v4 = (void *)MEMORY[0x1E4FB13F0];
      int v5 = AVLocalizedString(@"OVERFLOW_MENU_VISUAL_LOOKUP");
      uint64_t v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"info.circle.and.sparkles"];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __64__AVPlayerViewController__setupToggleVisualLookupActionIfNeeded__block_invoke;
      BOOL v12 = &unk_1E5FC3A10;
      objc_copyWeak(&v13, &location);
      uint64_t v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:&v9];
      id v8 = *(void **)(a1 + 1064);
      *(void *)(a1 + 1064) = v7;

      objc_msgSend(*(id *)(a1 + 1064), "setAttributes:", objc_msgSend(*(id *)(a1 + 1064), "attributes") & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(*(id *)(a1 + 1704), "hasVisualLookupResults", v9, v10, v11, v12) ^ 1);
      [*(id *)(a1 + 1064) setState:*(unsigned __int8 *)(a1 + 1432)];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __64__AVPlayerViewController__setupToggleVisualLookupActionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _visualLookupMenuItemPressedEvent:0];
}

- (void)visualAnalysisViewDidUpdateSubjectAvailability:(id)a3
{
  id v7 = a3;
  id v4 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
  int v5 = +[AVKitGlobalSettings shared];
  char v6 = [v5 subjectLiftGestureEnabled];

  if ((v6 & 1) == 0) {
    objc_msgSend(v4, "setShowsCopySubjectControl:", objc_msgSend(v7, "hasSubjectToCopy"));
  }
}

- (void)visualAnalysisViewDidBeginInteraction:(BOOL)a3
{
}

- (void)visualAnalysisView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  id v6 = a5;
  -[AVPlayerViewController _notifyDelegateOfAnalysisCalloutAction](self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AVPlayerViewController_visualAnalysisView_prepareForCalloutAction_completion___block_invoke;
  block[3] = &unk_1E5FC41A8;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__AVPlayerViewController_visualAnalysisView_prepareForCalloutAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)visualAnalysisViewDidPressAnalysisButton:(id)a3
{
  id v6 = a3;
  if (self && self->_controlsGeneration == 1) {
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
  }
  [(AVControlsViewController *)self->_controlsViewController toggleVisibility:self];
  id v4 = [(AVPlayerViewController *)self contentView];
  int v5 = [v4 playbackContentContainerView];
  objc_msgSend(v5, "setClipsToBounds:", objc_msgSend(v6, "highlightsInteractableAreas"));
}

- (void)videoFrameVisualAnalyzerFailedAnalyzingVideoFrame:(id)a3 withError:(id)a4
{
  currentInternalImageAnalysis = self->_currentInternalImageAnalysis;
  self->_currentInternalImageAnalysis = 0;

  -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
}

- (void)_updateAnalysisViewImageAnalysis
{
  if (a1)
  {
    -[AVPlayerViewController _currentAnalysis]((uint64_t)a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if ([a1 allowsVideoFrameAnalysis]) {
      [a1[213] setAnalysis:v2];
    }
  }
}

- (id)_currentAnalysis
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 1048);
    int v3 = *(void **)(a1 + 1496);
    if (v3)
    {
      id v4 = v3;

      id v2 = v4;
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:(id)a3 withAnalysis:(id)a4
{
  objc_storeStrong((id *)&self->_currentInternalImageAnalysis, a4);
  -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)self);

  -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
}

- (void)_setUpVisualAnalysisViewIfNeeded
{
  if (a1)
  {
    if (!*(void *)(a1 + 1704))
    {
      uint64_t v2 = -[AVPlayerViewController _currentAnalysis](a1);
      if (v2)
      {
        int v3 = (void *)v2;
        int v4 = [(id)a1 hasPerformedInitialSetup];

        if (v4)
        {
          [(id)a1 willChangeValueForKey:@"analysisView"];
          int v5 = [AVVisualAnalysisView alloc];
          uint64_t v6 = -[AVVisualAnalysisView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          id v7 = *(void **)(a1 + 1704);
          *(void *)(a1 + 1704) = v6;

          [(id)a1 didChangeValueForKey:@"analysisView"];
          [*(id *)(a1 + 1704) setDelegate:a1];
          -[AVPlayerViewController _updateAnalysisViewSuperview]((void *)a1);
          -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)a1);
          -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded]((void *)a1);
          -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded]((void *)a1);
          -[AVPlayerViewController _updateVisualAnalysisViewHiddenState](a1);
          -[AVPlayerViewController _updateShowsAnalysisControl](a1);
          -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes](a1);
          if (*(void *)(a1 + 1464) == 1) {
            uint64_t v8 = 30;
          }
          else {
            uint64_t v8 = *(void *)(a1 + 1464);
          }
          id v9 = *(void **)(a1 + 1136);
          [v9 setVideoFrameAnalysisTypes:v8];
        }
      }
    }
  }
}

- (void)_updateAnalysisViewSuperview
{
  if (a1)
  {
    id v4 = [a1 contentView];
    uint64_t v2 = [v4 playbackContentContainerView];
    int v3 = [v2 activeContentView];
    [v3 setVisualAnalysisView:a1[213]];
  }
}

- (uint64_t)_updateVisualAnalysisViewActiveInteractionTypes
{
  if (result)
  {
    if (*(void *)(result + 1464) == 1) {
      uint64_t v1 = 30;
    }
    else {
      uint64_t v1 = *(void *)(result + 1464);
    }
    if ((v1 & 8) != 0 && !*(unsigned char *)(result + 1432)) {
      v1 &= ~8uLL;
    }
    return [*(id *)(result + 1704) setAnalysisTypes:v1];
  }
  return result;
}

- (BOOL)observesMediaSelectionForSmartSubtitlesController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t preferredPlaybackControlsSupplementalSubtitleDisplayOption = self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption;
  if (preferredPlaybackControlsSupplementalSubtitleDisplayOption)
  {
    id v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[AVPlayerViewController observesMediaSelectionForSmartSubtitlesController:]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s AVPlaybackControlsSupplementalSubtitleDisplayOption enabled", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    -[AVPlayerViewController _updateSupplementalSubtitlesIfNecessary]((uint64_t)self);
  }
  return preferredPlaybackControlsSupplementalSubtitleDisplayOption != 0;
}

- (UIEdgeInsets)playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:(id)a3
{
  id v4 = a3;
  int v5 = [(AVPlayerViewController *)self playerController];
  [v5 contentDimensions];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  if ([(AVPlayerViewController *)self isPresentedFullScreen]
    || [(AVPlayerViewController *)self isPresentingFullScreenFromInline]
    || [(AVPlayerViewController *)self _isTransitioningToOrFromFullScreen])
  {
    id v10 = [(AVPlayerViewController *)self playerController];
    if ([v10 isPlayingOnExternalScreen])
    {
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v11 = [v4 traitCollection];
    [v11 displayCornerRadius];
    if (v12 <= 0.0)
    {
LABEL_40:

      goto LABEL_41;
    }
    BOOL v13 = ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || v9 < 0;
    BOOL v14 = v13 && (unint64_t)(v9 - 1) >= 0xFFFFFFFFFFFFFLL;
    BOOL v15 = !v14;

    BOOL v16 = v7 < 0 || ((v7 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    BOOL v17 = v16 && (unint64_t)(v7 - 1) > 0xFFFFFFFFFFFFELL;
    if (!v17 && v15)
    {
      double v18 = [v4 window];
      id v19 = v18;
      if (v18)
      {
        id v10 = v18;
      }
      else
      {
        double v20 = [(AVPlayerViewController *)self presentationContext];
        id v10 = [v20 presentationWindow];
      }
      double v21 = [(AVPlayerViewController *)self presentationContext];
      uint64_t v11 = [v21 currentTransition];

      double v22 = [(AVPlayerViewController *)self presentationContext];
      if ([v22 hasActiveTransition])
      {
        uint64_t v23 = [v10 _windowInterfaceOrientation];
        if (v23 == [v11 finalInterfaceOrientation])
        {
          [v4 bounds];
          double Width = CGRectGetWidth(v46);
          [v10 bounds];
          double Height = CGRectGetHeight(v47);

          if (Width != Height) {
            goto LABEL_31;
          }
        }
        else
        {
        }
        int v26 = 1;
LABEL_34:
        [v10 bounds];
        UIRectGetCenter();
        -[AVCacheLargestInscribedRectInBoundingPath getLargestInscribableRectForView:withCenter:aspectRatio:](self->_cacheLargestInscribedRect, "getLargestInscribableRectForView:withCenter:aspectRatio:", v10);
        CGFloat x = v48.origin.x;
        CGFloat y = v48.origin.y;
        CGFloat v29 = v48.size.width;
        CGFloat v30 = v48.size.height;
        if (CGRectIsNull(v48))
        {
          double v31 = [v10 traitCollection];
          uint64_t v32 = [v31 userInterfaceIdiom];

          if (!v32)
          {
            id v33 = [v4 layoutClass];
            [v33 unsignedIntegerValue];
          }
        }
        else
        {
          CGFloat v34 = x;
          CGFloat v35 = y;
          CGFloat v36 = v29;
          CGFloat v37 = v30;
          if (v26)
          {
            CGRectGetMinX(*(CGRect *)&v34);
            v49.origin.CGFloat x = x;
            v49.origin.CGFloat y = y;
            v49.size.CGFloat width = v29;
            v49.size.double height = v30;
            CGRectGetMinY(v49);
          }
          else
          {
            CGRectGetMinY(*(CGRect *)&v34);
            v50.origin.CGFloat x = x;
            v50.origin.CGFloat y = y;
            v50.size.CGFloat width = v29;
            v50.size.double height = v30;
            CGRectGetMinX(v50);
          }
        }
        goto LABEL_40;
      }

LABEL_31:
      int v26 = 0;
      goto LABEL_34;
    }
  }
LABEL_42:
  UIRoundToViewScale();
  double v39 = v38;
  UIRoundToViewScale();
  double v41 = v40;

  double v42 = v39;
  double v43 = v41;
  double v44 = v39;
  double v45 = v41;
  result.double right = v45;
  result.double bottom = v44;
  result.double left = v43;
  result.double top = v42;
  return result;
}

- (BOOL)playerViewControllerContentViewIsPlayingOnSecondScreen:(id)a3
{
  return [(AVSecondScreenConnection *)self->_secondScreenConnection isActive];
}

- (void)chromelessControlsViewControllerDidPressSkipForwardButton:(id)a3
{
}

- (void)chromelessControlsViewControllerDidPressSkipBackButton:(id)a3
{
}

- (void)chromelessControlsViewControllerDidPressLiveTextButton:(id)a3
{
  uint64_t v4 = [(AVVisualAnalysisView *)self->_analysisView highlightsInteractableAreas] ^ 1;
  analysisView = self->_analysisView;

  [(AVVisualAnalysisView *)analysisView setHighlightsInteractableAreas:v4];
}

- ($175F2685EF764341F5DD80B75CC65478)chromelessControlsViewController:(id)a3 contentTabPresentationInfoWithPreferredHeight:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(AVPlayerViewController *)self playerLayerView];
  uint64_t v8 = [v6 viewIfLoaded];

  uint64_t v9 = 0;
  if (v7 && v8)
  {
    double v10 = 0.0;
    if (self->_playerViewControllerContentView)
    {
      [v8 bounds];
      double v12 = v11;
      -[AVPlayerViewController _availableSpaceForContentTabWithVideoDodgingForSize:](self, "_availableSpaceForContentTabWithVideoDodgingForSize:", v13, v11);
      float v15 = v14;
      float v16 = v12 * 0.5;
      if (vabds_f32(v15, v16) >= 0.00000011921 && v15 >= v16 || v14 < a4) {
        a4 = v14;
      }
      uint64_t v9 = 1;
      double v19 = v12 * 0.75;
      if (a4 < v12 * 0.75) {
        double v19 = a4;
      }
      double v10 = v19;
    }
  }
  else
  {
    double v10 = 0.0;
  }
  [(AVPlayerViewController *)self updateVideoBounds];

  double v20 = v10;
  unint64_t v21 = v9;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (id)controlsViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  id v5 = a4;
  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_displayNameForMediaSelectionOption_])
  {
    id v6 = [(AVPlayerViewController *)self delegate];
    uint64_t v7 = [v6 playerViewController:self displayNameForMediaSelectionOption:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)controlsViewControllerDidUpdateLayoutGuides:(id)a3
{
  id v3 = [(AVPlayerViewController *)self contentView];
  [v3 updateCustomControlsViewLayoutGuides];
}

- (void)controlsViewController:(id)a3 willBeginUpdatingVisibleControlsTo:(unint64_t)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(AVPlayerViewController *)self _updateCustomControlsViewStateWithVisibleControlsSet:a4];
  if ([(AVPlayerViewControllerCustomControlsView *)self->_customControlsView needsUpdateConstraints])
  {
    [(AVPlayerViewControllerCustomControlsView *)self->_customControlsView updateConstraintsIfNeeded];
    objc_initWeak(&location, self);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    double v13 = __109__AVPlayerViewController_controlsViewController_willBeginUpdatingVisibleControlsTo_withAnimationCoordinator___block_invoke;
    double v14 = &unk_1E5FC44F8;
    objc_copyWeak(&v15, &location);
    [v9 addCoordinatedAnimations:&v11 completion:0];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if ((a4 != 0) == ([(AVControlsViewController *)self->_controlsViewController visibleControls] == 0)&& [(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator_])
  {
    double v10 = [(AVPlayerViewController *)self delegate];
    [v10 playerViewController:self willTransitionToVisibilityOfPlaybackControls:a4 != 0 withAnimationCoordinator:v9];
  }
}

void __109__AVPlayerViewController_controlsViewController_willBeginUpdatingVisibleControlsTo_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[149] layoutIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)_transitionFromDetachedFullScreenPresentationToInlineAnimated:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Detached fullscreen is only available on Mac Catalyst.", v5, 2u);
  }
}

- (void)_transitionFromFullScreenPresentationToInlineAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(AVPlayerViewController *)self fullScreenViewController];
  double v10 = [v9 presentingViewController];
  if (v10)
  {
    uint64_t v11 = [(AVPlayerViewController *)self fullScreenViewController];
  }
  else
  {
    uint64_t v11 = self;
  }
  uint64_t v12 = v11;

  self->_fullscreenTransitionInProgress = 1;
  double v13 = [(AVPlayerViewController *)self _transitionController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__AVPlayerViewController__transitionFromFullScreenPresentationToInlineAnimated_interactive_completionHandler___block_invoke;
  v15[3] = &unk_1E5FC2A78;
  void v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v13 beginFullScreenDismissalOfViewController:v12 animated:v6 isInteractive:v5 completion:v15];

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);
}

void __110__AVPlayerViewController__transitionFromFullScreenPresentationToInlineAnimated_interactive_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, a2, 0);
  }
  BOOL v5 = [*(id *)(a1 + 32) interactiveDismissalCompletionHandler];

  if (v5)
  {
    BOOL v6 = [*(id *)(a1 + 32) interactiveDismissalCompletionHandler];
    v6[2](v6, a2, 0);

    [*(id *)(a1 + 32) setInteractiveDismissalCompletionHandler:0];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"AVPlayerViewControllerDidExitFullScreenFromInline" object:*(void *)(a1 + 32)];
}

- (void)_transitionFromFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (![(AVPlayerViewController *)self _isDescendantOfRootViewController]) {
    NSLog(&cfstr_WarningIsTryin_0.isa, self);
  }
  id v9 = (void (**)(void, void, void))[v8 copy];

  [(AVPlayerViewController *)self _resetVisualAnalysisViewSelectionIfNeeded];
  if (([(AVPlayerViewController *)self isPresentingFullScreenFromInline]
     || [(AVPlayerViewController *)self isPresentedFullScreen])
    && ![(AVPlayerViewController *)self _isTransitioningToOrFromFullScreen])
  {
    if ([(AVPlayerViewController *)self isPresentingDetachedFullScreen]) {
      [(AVPlayerViewController *)self _transitionFromDetachedFullScreenPresentationToInlineAnimated:v6 completionHandler:v9];
    }
    else {
      [(AVPlayerViewController *)self _transitionFromFullScreenPresentationToInlineAnimated:v6 interactive:v5 completionHandler:v9];
    }
  }
  else
  {
    double v10 = [(AVPlayerViewController *)self presentingViewController];
    if (!v10
      || v5
      || [(AVPlayerViewController *)self _isTransitioningToOrFromFullScreen])
    {
    }
    else
    {
      BOOL v17 = [(AVPlayerViewController *)self presentingViewController];
      double v18 = [v17 presentedViewController];
      char v19 = [v18 isBeingDismissed];

      if ((v19 & 1) == 0)
      {
        double v20 = [(AVPlayerViewController *)self presentingViewController];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __90__AVPlayerViewController__transitionFromFullScreenAnimated_interactive_completionHandler___block_invoke;
        v21[3] = &unk_1E5FC41A8;
        double v22 = v9;
        [v20 dismissViewControllerAnimated:v6 completion:v21];

        goto LABEL_17;
      }
    }
    if (v9)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v12 = NSString;
      double v13 = _AVMethodProem(self);
      id v14 = [v12 stringWithFormat:@"Invalid call of %@!", v13];
      v24[0] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v16 = [v11 errorWithDomain:@"AVKitErrorDomain" code:0 userInfo:v15];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v16);
    }
  }
LABEL_17:
}

uint64_t __90__AVPlayerViewController__transitionFromFullScreenAnimated_interactive_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_transitionFromFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)_transitionToDetachedFullScreenCompletionHandler:(id)a3
{
  id v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Detached fullscreen is only available on Mac Catalyst.", v4, 2u);
  }
}

- (void)_transitionToAttachedFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(AVPlayerViewController *)self contentView];
  char v9 = [v8 canAutomaticallyZoomLetterboxVideos];

  if ((v9 & 1) == 0)
  {
    double v10 = [(AVPlayerViewController *)self contentView];
    [v10 setCanAutomaticallyZoomLetterboxVideos:1];

    uint64_t v11 = *MEMORY[0x1E4F15AF0];
    [(AVPlayerViewController *)self setVideoGravity:*MEMORY[0x1E4F15AF0] forLayoutClass:1];
    [(AVPlayerViewController *)self setVideoGravity:v11 forLayoutClass:2];
  }
  uint64_t v12 = objc_alloc_init(AVFullScreenViewController);
  double v13 = [MEMORY[0x1E4F28B50] mainBundle];
  id v14 = [v13 bundleIdentifier];
  if ([v14 isEqualToString:@"com.apple.SafariViewService"])
  {
    uint64_t v15 = 5;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v17 = [v16 bundleIdentifier];
    if ([v17 isEqualToString:@"com.apple.WebSheet"]) {
      uint64_t v15 = 5;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  [(AVFullScreenViewController *)v12 setModalPresentationStyle:v15];
  double v18 = [(AVPlayerViewController *)self _transitionController];
  [(AVFullScreenViewController *)v12 setTransitioningDelegate:v18];

  [(AVFullScreenViewController *)v12 setDelegate:self];
  self->_fullscreenTransitionInProgress = 1;
  char v19 = [(AVPlayerViewController *)self _transitionController];
  double v20 = [(AVPlayerViewController *)self view];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__AVPlayerViewController__transitionToAttachedFullScreenAnimated_interactive_completionHandler___block_invoke;
  v22[3] = &unk_1E5FC2A78;
  void v22[4] = self;
  id v23 = v7;
  id v21 = v7;
  [v19 beginFullScreenPresentationOfViewController:v12 fromView:v20 isInteractive:v5 completion:v22];

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);
}

void __96__AVPlayerViewController__transitionToAttachedFullScreenAnimated_interactive_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 0;
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:](*(void *)(a1 + 32), 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility](*(void *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, a2, 0);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"AVPlayerViewControllerDidEnterFullScreenFromInline" object:*(void *)(a1 + 32)];
}

- (void)_transitionToFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void, void *))a5;
  if (![(AVPlayerViewController *)self _isDescendantOfRootViewController]) {
    NSLog(&cfstr_WarningIsTryin.isa, self);
  }
  if ([(AVPlayerViewController *)self isPresentingFullScreenFromInline]
    || [(AVPlayerViewController *)self isPresentedFullScreen]
    || [(AVPlayerViewController *)self _isTransitioningToOrFromFullScreen])
  {
    if (!v8) {
      return;
    }
    char v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    double v10 = NSString;
    uint64_t v11 = _AVMethodProem(self);
    uint64_t v12 = [v10 stringWithFormat:@"Invalid call of %@!", v11];
    v22[0] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v14 = [v9 errorWithDomain:@"AVKitErrorDomain" code:0 userInfo:v13];
    v8[2](v8, 0, v14);

    uint64_t v15 = v8;
  }
  else
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    BOOL v17 = [WeakRetained presentedViewController];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__AVPlayerViewController__transitionToFullScreenAnimated_interactive_completionHandler___block_invoke;
    v18[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v19, &location);
    [v17 dismissViewControllerAnimated:v6 completion:v18];

    uint64_t v15 = (void *)[v8 copy];
    if ([(AVPlayerViewController *)self wantsDetachedFullscreenPresentation]
      && [(AVPlayerViewController *)self canDisplayContentInDetachedWindow])
    {
      [(AVPlayerViewController *)self _transitionToDetachedFullScreenCompletionHandler:v15];
    }
    else
    {
      [(AVPlayerViewController *)self _transitionToAttachedFullScreenAnimated:v6 interactive:v5 completionHandler:v15];
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __88__AVPlayerViewController__transitionToFullScreenAnimated_interactive_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained playbackControlsController];
  [v1 setPopoverIsBeingPresented:0];
}

- (BOOL)_canEnterFullScreen
{
  if ([(AVPlayerViewController *)self allowsEnteringFullScreen])
  {
    id v3 = [(AVPlayerViewController *)self contentView];
    if (([v3 isCoveringWindow] & 1) != 0
      || [(AVPlayerViewController *)self isPresentingFullScreenFromInline]
      || [(AVPlayerViewController *)self _isTransitioningToOrFromFullScreen])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      BOOL v4 = ![(AVPlayerViewController *)self isPictureInPictureActive];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_transitionFromFullScreenWithReason:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v11 = a5;
  if (!-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_shouldExitFullScreenWithReason_)|| (-[AVPlayerViewController delegate](self, "delegate"), id v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 playerViewController:self shouldExitFullScreenWithReason:a3], v8, v9))
  {
    [(AVPlayerViewController *)self _transitionFromFullScreenAnimated:v5 completionHandler:v11];
LABEL_4:
    double v10 = v11;
    goto LABEL_5;
  }
  double v10 = v11;
  if (v11)
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
    goto LABEL_4;
  }
LABEL_5:
}

- (void)exitFullScreenWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    double v10 = "-[AVPlayerViewController exitFullScreenWithCompletion:]";
    __int16 v11 = 1024;
    int v12 = 6545;
    __int16 v13 = 2048;
    id v14 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AVPlayerViewController_exitFullScreenWithCompletion___block_invoke;
  v7[3] = &unk_1E5FC2A50;
  id v8 = v4;
  id v6 = v4;
  [(AVPlayerViewController *)self exitFullScreenAnimated:1 completionHandler:v7];
}

void __55__AVPlayerViewController_exitFullScreenWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = "NO";
    int v9 = 136315650;
    double v10 = "-[AVPlayerViewController exitFullScreenWithCompletion:]_block_invoke";
    int v12 = "success";
    __int16 v11 = 2080;
    if (a2) {
      BOOL v5 = "YES";
    }
    __int16 v13 = 2080;
    id v14 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v6, v7);
    }
  }
}

- (void)enterFullScreenWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    double v10 = "-[AVPlayerViewController enterFullScreenWithCompletion:]";
    __int16 v11 = 1024;
    int v12 = 6476;
    __int16 v13 = 2048;
    id v14 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__AVPlayerViewController_enterFullScreenWithCompletion___block_invoke;
  v7[3] = &unk_1E5FC2A50;
  id v8 = v4;
  id v6 = v4;
  [(AVPlayerViewController *)self enterFullScreenAnimated:1 completionHandler:v7];
}

void __56__AVPlayerViewController_enterFullScreenWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = "NO";
    int v9 = 136315650;
    double v10 = "-[AVPlayerViewController enterFullScreenWithCompletion:]_block_invoke";
    int v12 = "success";
    __int16 v11 = 2080;
    if (a2) {
      BOOL v5 = "YES";
    }
    __int16 v13 = 2080;
    id v14 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v6, v7);
    }
  }
}

- (void)showFullScreenPresentationFromView:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    double v18 = "-[AVPlayerViewController showFullScreenPresentationFromView:completion:]";
    __int16 v19 = 1024;
    int v20 = 6427;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  int v9 = (void *)[v6 copy];
  double v10 = [(AVPlayerViewController *)self transitioningDelegate];
  __int16 v11 = [(AVPlayerViewController *)self _avkitPreferredTransitioningDelegate];

  if (v10 != v11)
  {
    int v12 = [(AVPlayerViewController *)self _avkitPreferredTransitioningDelegate];
    [(AVPlayerViewController *)self setTransitioningDelegate:v12];
  }
  __int16 v13 = [(AVPlayerViewController *)self _transitionController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__AVPlayerViewController_showFullScreenPresentationFromView_completion___block_invoke;
  v15[3] = &unk_1E5FC2A78;
  void v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [v13 beginFullScreenPresentationOfViewController:self fromView:v7 isInteractive:0 completion:v15];
}

void __72__AVPlayerViewController_showFullScreenPresentationFromView_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"AVPlayerViewControllerDidEnterFullScreenFromInline" object:*(void *)(a1 + 32)];
}

- (void)_updateViewControllerPreferencesIfNeeded
{
  id v2 = [(AVPlayerViewController *)self _activeViewControllerForContentView];
  objc_msgSend(v2, "avkit_setNeedsUpdatePreferencesIfNeeded");
}

- (void)_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground
{
  BOOL v3 = [(AVPlayerViewController *)self canStartPictureInPictureAutomaticallyWhenEnteringBackground];
  BOOL v4 = !self->_disallowsAutomaticPictureInPictureStart && v3;
  pictureInPictureController = self->_pictureInPictureController;

  [(AVPictureInPictureController *)pictureInPictureController setCanStartAutomaticallyWhenEnteringBackground:v4];
}

- (void)_updatePlaybackControlsCanHideStateIfNeeded
{
  BOOL v3 = [(AVPlayerViewController *)self canHidePlaybackControls];
  uint64_t v4 = v3 & ~[(AVPlayerViewController *)self isHoveringOverPlaybackControl];
  id v5 = [(AVPlayerViewController *)self playbackControlsController];
  [v5 setCanHidePlaybackControls:v4];
}

- (void)_updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded
{
  BOOL v3 = [(AVPlayerViewController *)self playerController];
  uint64_t v4 = [v3 status];

  if (v4 == 2)
  {
    id v5 = [(AVPlayerViewController *)self playerController];
    int v6 = [v5 isPlaying];

    if (!v6) {
      return;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  self->_playbackBeganAfterPlayerControllerBecameReadyToPlaCGFloat y = v7;
}

void __67__AVPlayerViewController__startPlayerLayerViewObservationsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = [a4 value];
  objc_msgSend(v5, "setReadyForDisplay:", objc_msgSend(v6, "BOOLValue"));
}

- (BOOL)_hoverGestureRecognizer:(id)a3 hasCursorOverView:(id)a4
{
  id v5 = a4;
  [a3 locationInView:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  [v5 bounds];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  uint64_t v18 = v11;
  uint64_t v19 = v13;
  uint64_t v20 = v15;
  uint64_t v21 = v17;
  uint64_t v22 = v7;
  uint64_t v23 = v9;

  return CGRectContainsPoint(*(CGRect *)&v18, *(CGPoint *)&v22);
}

- (void)_beginScrubGestureIfNeeded
{
  BOOL v3 = [(AVPlayerViewController *)self playerController];
  char v4 = [v3 isScrubbing];

  if ((v4 & 1) == 0)
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "Scrub gesture will begin.", v9, 2u);
    }

    uint64_t v6 = [(AVPlayerViewController *)self playbackControlsController];
    [v6 beginUserInteraction];

    uint64_t v7 = [(AVPlayerViewController *)self playerController];
    [v7 beginPlaybackSuspension];

    uint64_t v8 = [(AVPlayerViewController *)self playerController];
    [v8 beginScrubbing:self];
  }
}

- (void)_endScrubGestureIfActive
{
  BOOL v3 = [(AVPlayerViewController *)self playerController];
  int v4 = [v3 isScrubbing];

  if (v4)
  {
    id v5 = [(AVPlayerViewController *)self playerController];
    [v5 endScrubbing:self];

    uint64_t v6 = [(AVPlayerViewController *)self playbackControlsController];
    [v6 endUserInteraction];

    uint64_t v7 = [(AVPlayerViewController *)self playerController];
    [v7 endPlaybackSuspension];

    [(NSTimer *)self->_scrubGestureMomentumTimer invalidate];
    scrubGestureMomentumTimer = self->_scrubGestureMomentumTimer;
    self->_scrubGestureMomentumTimer = 0;

    uint64_t v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "Scrub gesture did end.", v10, 2u);
    }
  }
}

- (BOOL)_shouldPausePlaybackWhenExitingFullscreen
{
  if ([(AVPlayerViewController *)self canPausePlaybackWhenExitingFullScreen]
    && ![(AVPlayerViewController *)self isPictureInPictureActive])
  {
    uint64_t v6 = [(AVPlayerViewController *)self playerController];
    char v7 = [v6 isExternalPlaybackActive];

    uint64_t v8 = [(AVPlayerViewController *)self _transitionController];
    BOOL v3 = v8;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = [v8 presentationContext];
      char v4 = [v9 allowsPausingWhenTransitionCompletes];

      goto LABEL_5;
    }
  }
  else
  {
    BOOL v3 = [(AVPlayerViewController *)self _transitionController];
  }
  char v4 = 0;
LABEL_5:

  return v4;
}

- (void)_seekForScrubGestureWithVelocity:(double)a3
{
  uint64_t v5 = [(AVPlayerViewController *)self playerController];
  uint64_t v6 = (void *)v5;
  uint64_t v10 = (void *)v5;
  if (a3 < 0.0 && (uint64_t v5 = [(id)v5 canSeekFrameBackward], v6 = v10, (v5 & 1) != 0)
    || a3 > 0.0 && (uint64_t v5 = [v6 canSeekFrameForward], v6 = v10, v5))
  {
    [(AVPlayerViewController *)self _seekDistanceForScrubGestureWithVelocity:a3];
    double v8 = v7;
    [v10 seekToTime];
    uint64_t v5 = [v10 seekToTime:v8 + v9 toleranceBefore:0.0 toleranceAfter:0.0];
    uint64_t v6 = v10;
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (double)_seekDistanceForScrubGestureWithVelocity:(double)a3
{
  char v4 = [(AVPlayerViewController *)self playerController];
  [v4 contentDurationWithinEndTimes];
  double v6 = pow(v5 / 1000.0, 0.75) / 400.0 * a3;

  return v6;
}

- (double)_applyNonlinearScaleToScrubGestureVelocity:(double)a3
{
  if (a3 > 0.0)
  {
    double v3 = pow(a3, 1.3);
    double v4 = 0.035;
    return v3 * v4;
  }
  double v5 = 0.0;
  if (a3 < 0.0)
  {
    double v3 = pow(-a3, 1.3);
    double v4 = -0.035;
    return v3 * v4;
  }
  return v5;
}

- (void)_handleScrubbingGestureRecognizer:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    if ([v4 state] == 1)
    {
      double v5 = [(AVPlayerViewController *)self playerController];
      int v6 = [v5 isScrubbing];

      if (v6)
      {
        [(NSTimer *)self->_scrubGestureMomentumTimer invalidate];
        scrubGestureMomentumTimer = self->_scrubGestureMomentumTimer;
        self->_scrubGestureMomentumTimer = 0;
      }
      [(AVPlayerViewController *)self _beginScrubGestureIfNeeded];
    }
    else if ([v4 state] == 2 || objc_msgSend(v4, "state") == 3)
    {
      double v8 = [(AVPlayerViewController *)self contentView];
      [v4 velocityInView:v8];
      double v10 = v9;

      [(AVPlayerViewController *)self _applyNonlinearScaleToScrubGestureVelocity:v10];
      uint64_t v12 = v11;
      -[AVPlayerViewController _seekForScrubGestureWithVelocity:](self, "_seekForScrubGestureWithVelocity:");
      if ([v4 state] == 3)
      {
        uint64_t v21 = 0;
        uint64_t v22 = &v21;
        uint64_t v23 = 0x2020000000;
        uint64_t v24 = v12;
        objc_initWeak(&location, self);
        uint64_t v13 = _AVLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = v22[3];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v26 = v14;
          _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "Scrub gesture will transition to momentum phase with remaining velocity %f.", buf, 0xCu);
        }

        uint64_t v15 = (void *)MEMORY[0x1E4F1CB00];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__AVPlayerViewController__handleScrubbingGestureRecognizer___block_invoke;
        v18[3] = &unk_1E5FC2A28;
        objc_copyWeak(&v19, &location);
        void v18[4] = &v21;
        uint64_t v16 = [v15 scheduledTimerWithTimeInterval:1 repeats:v18 block:0.016];
        uint64_t v17 = self->_scrubGestureMomentumTimer;
        self->_scrubGestureMomentumTimer = v16;

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        _Block_object_dispose(&v21, 8);
      }
    }
    else
    {
      [(AVPlayerViewController *)self _endScrubGestureIfActive];
    }
  }
}

void __60__AVPlayerViewController__handleScrubbingGestureRecognizer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                * 0.9;
    id v3 = WeakRetained;
    [WeakRetained _seekForScrubGestureWithVelocity:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    id WeakRetained = v3;
    if (fabs(*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) <= 0.45)
    {
      [v3 _endScrubGestureIfActive];
      id WeakRetained = v3;
    }
  }
}

- (void)_handlePlaybackToggleNotificationForMetricsCollectionEvent
{
  id v3 = [(AVPlayerViewController *)self playerController];
  -[AVPlayerViewController _notifyOfMetricsCollectionEvent:](self, "_notifyOfMetricsCollectionEvent:", [v3 isPlaying]);
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 2)
    {
      if (v4 == 1 && self) {
        [(AVMobileControlsViewController *)self->_controlsViewController didBeginIndirectUserInteraction];
      }
      goto LABEL_21;
    }
    id v5 = v14;
    if (self)
    {
      int v6 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];

      if (v6)
      {
        if (![(AVControlsViewController *)self->_controlsViewController visibleControls]) {
          goto LABEL_20;
        }
LABEL_18:
        [(AVMobileControlsViewController *)self->_controlsViewController didBeginIndirectUserInteraction];
        goto LABEL_20;
      }
      double v7 = [(AVPlayerViewController *)self contentView];
      double v8 = [v7 playbackControlsView];

      double v9 = [v8 transportControlsContainerView];
      double v10 = [v8 volumeControls];
      uint64_t v11 = [v8 screenModeControls];
      BOOL v12 = [(AVPlayerViewController *)self _hoverGestureRecognizer:v5 hasCursorOverView:v9]|| [(AVPlayerViewController *)self _hoverGestureRecognizer:v5 hasCursorOverView:v10]|| [(AVPlayerViewController *)self _hoverGestureRecognizer:v5 hasCursorOverView:v11];
      [(AVPlayerViewController *)self setHoveringOverPlaybackControl:v12];
      if (![(AVPlayerViewController *)self showsPlaybackControls])
      {

        goto LABEL_20;
      }
      char v13 = [v8 showsPlaybackControls];

      if ((v13 & 1) == 0) {
        goto LABEL_18;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (self)
  {
    [(AVPlayerViewController *)self setHoveringOverPlaybackControl:0];
    [(AVMobileControlsViewController *)self->_controlsViewController didEndIndirectUserInteraction];
  }
LABEL_21:
}

- (void)_enterFullScreenWhenPlayingIfNeeded
{
  id v3 = [(AVPlayerViewController *)self playerController];
  char v4 = [v3 isPlaying];

  if ((v4 & 1) == 0
    && [(AVPlayerViewController *)self _shouldEnterFullScreenAfterPlaybackBegins])
  {
    [(AVPlayerViewController *)self _transitionToFullScreenAnimated:1 interactive:0 completionHandler:0];
  }
}

- (void)_contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(AVPlayerViewController *)self _behaviorStorage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__AVPlayerViewController__contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E5FC2A00;
  double v15 = width;
  double v16 = height;
  id v9 = v7;
  id v14 = v9;
  [v8 enumerateAllBehaviorContextsImplementingSelector:sel_contentViewWillTransitionToSize_withCoordinator_ forProtocol:&unk_1F0964880 usingBlock:v13];

  double v10 = [(AVPlayerViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    BOOL v12 = [(AVPlayerViewController *)self delegate];
    objc_msgSend(v12, "playerViewController:contentViewWillTransitionToSize:withTransitionCoordinator:", self, v9, width, height);
  }
}

uint64_t __85__AVPlayerViewController__contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentViewWillTransitionToSize:withCoordinator:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)_delegateRespondsTo:(SEL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(AVPlayerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [(AVPlayerViewController *)self delegate];
    id v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    char v11 = [(AVPlayerViewController *)self delegate];
    if (v6) {
      BOOL v12 = @"does";
    }
    else {
      BOOL v12 = @"does NOT";
    }
    char v13 = NSStringFromSelector(a3);
    int v15 = 136316162;
    double v16 = "-[AVPlayerViewController _delegateRespondsTo:]";
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s <%{public}@ %p> %@ respond to %{public}@", (uint8_t *)&v15, 0x34u);
  }
  return v6 & 1;
}

- (void)_notifyOfMetricsCollectionEvent:(int64_t)a3
{
  id v5 = [(AVPlayerViewController *)self _behaviorStorage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__AVPlayerViewController__notifyOfMetricsCollectionEvent___block_invoke;
  v7[3] = &unk_1E5FC29D8;
  void v7[4] = self;
  void v7[5] = a3;
  [v5 enumerateAllBehaviorContextsConformingToProtocol:&unk_1F096DB80 usingBlock:v7];

  if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewController_metricsCollectionEventOccured_])
  {
    char v6 = [(AVPlayerViewController *)self delegate];
    [v6 playerViewController:self metricsCollectionEventOccured:a3];
  }
}

uint64_t __58__AVPlayerViewController__notifyOfMetricsCollectionEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 playerViewController:*(void *)(a1 + 32) didCollectMetricsEvent:*(void *)(a1 + 40)];
}

- (void)_mediaSelectionDoneButtonTapped:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    char v11 = "-[AVPlayerViewController _mediaSelectionDoneButtonTapped:]";
    __int16 v12 = 1024;
    int v13 = 5841;
    __int16 v14 = 2048;
    int v15 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
  id v7 = [WeakRetained presentedViewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__AVPlayerViewController__mediaSelectionDoneButtonTapped___block_invoke;
  v8[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v9, (id *)buf);
  [v7 dismissViewControllerAnimated:1 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __58__AVPlayerViewController__mediaSelectionDoneButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained playbackControlsController];
  [v1 setPopoverIsBeingPresented:0];
}

- (void)_togglePictureInPicture
{
  if ([(AVPlayerViewController *)self isPictureInPicturePossible])
  {
    BOOL v3 = [(AVPictureInPictureController *)self->_pictureInPictureController isPictureInPictureActive];
    pictureInPictureController = self->_pictureInPictureController;
    if (v3)
    {
      [(AVPictureInPictureController *)pictureInPictureController stopPictureInPicture];
    }
    else
    {
      [(AVPictureInPictureController *)pictureInPictureController startPictureInPicture];
    }
  }
}

- (BOOL)_isTrackingUserInteractionWithInteractiveView
{
  if (![(AVPlayerViewController *)self _isTrackingUserInteraction]
    || [(AVPlayerViewController *)self isContentTransitionInteractive])
  {
    return 0;
  }
  id v4 = [(AVPlayerViewController *)self view];
  char v5 = objc_msgSend(v4, "avkit_isAncestorOfViewPassingTest:", &__block_literal_global_673);

  return v5;
}

uint64_t __71__AVPlayerViewController__isTrackingUserInteractionWithInteractiveView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [v2 isTracking];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_isTrackingUserInteraction
{
  return [(AVPlayerViewController *)self _numberOfTrackedUserInteractions] > 0;
}

- (void)_endTrackingUserInteraction
{
  [(AVPlayerViewController *)self _setNumberOfTrackedUserInteractions:[(AVPlayerViewController *)self _numberOfTrackedUserInteractions] - 1];
  id v3 = [(AVPlayerViewController *)self playbackControlsController];
  [v3 endUserInteraction];
}

- (void)_beginTrackingUserInteraction
{
  [(AVPlayerViewController *)self _setNumberOfTrackedUserInteractions:[(AVPlayerViewController *)self _numberOfTrackedUserInteractions] + 1];
  id v3 = [(AVPlayerViewController *)self playbackControlsController];
  [v3 beginUserInteraction];
}

- (BOOL)isAudioOnlyContent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVPlayerViewController *)self playerController];
  if ([v2 status] == 2 && (objc_msgSend(v2, "hasEnabledVideo") & 1) == 0) {
    char v3 = [v2 hasEnabledAudio];
  }
  else {
    char v3 = 0;
  }
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    id v7 = "-[AVPlayerViewController isAudioOnlyContent]";
    __int16 v8 = 2048;
    uint64_t v9 = [v2 status];
    __int16 v10 = 1024;
    int v11 = [v2 hasEnabledVideo];
    __int16 v12 = 1024;
    int v13 = [v2 hasEnabledAudio];
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s .status: %ld .hasEnabledVideo: %d .hasEnabledAudio: %d", (uint8_t *)&v6, 0x22u);
  }

  return v3;
}

- (void)_volumeButtonWasPressedEvent:(id)a3
{
  id v5 = [(AVPlayerViewController *)self playerController];
  if ([v5 isMuted]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  [(AVPlayerViewController *)self _notifyOfMetricsCollectionEvent:v4];
}

- (void)_updateUnsupportedContentIndicatorView
{
  id v3 = [(AVPlayerViewController *)self contentView];
  objc_msgSend(v3, "setShowsUnsupportedContentIndicator:", -[AVPlayerViewController _isUnsupportedContent](self, "_isUnsupportedContent"));
}

- (void)_updateExternalPlaybackIndicatorView
{
  id v3 = [(AVPlayerViewController *)self playerController];
  uint64_t v4 = [v3 externalPlaybackType];

  if (v4 == 1)
  {
    AVLocalizedString(@"EXTERNAL_PLAYBACK_INDICATOR_VIEW_AIRPLAY_TITLE");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [(AVPlayerViewController *)self playerController];
    int v6 = [v5 externalPlaybackAirPlayDeviceLocalizedName];

    if (v6)
    {
      id v7 = NSString;
      __int16 v8 = AVLocalizedString(@"This video is playing on “%@”");
      uint64_t v9 = [(AVPlayerViewController *)self playerController];
      __int16 v10 = [v9 externalPlaybackAirPlayDeviceLocalizedName];
      int v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);
    }
    else
    {
      int v11 = 0;
    }
    goto LABEL_9;
  }
  __int16 v12 = [(AVPlayerViewController *)self playerController];
  if ([v12 isPlayingOnExternalScreen])
  {

LABEL_7:
    AVLocalizedString(@"EXTERNAL_PLAYBACK_INDICATOR_VIEW_TV_OUT_TITLE");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    int v11 = AVLocalizedString(@"EXTERNAL_PLAYBACK_INDICATOR_VIEW_TV_OUT_SUBTITLE");
LABEL_9:
    uint64_t v15 = 1;
    goto LABEL_10;
  }
  int v13 = [(AVPlayerViewController *)self playerController];
  int v14 = [v13 isPlayingOnSecondScreen];

  if (v14) {
    goto LABEL_7;
  }
  id v18 = 0;
  int v11 = 0;
  uint64_t v15 = 0;
LABEL_10:
  uint64_t v16 = [(AVPlayerViewController *)self contentView];
  [v16 setExternalPlaybackIndicatorTitle:v18 subtitle:v11];

  __int16 v17 = [(AVPlayerViewController *)self contentView];
  [v17 setShowsExternalPlaybackIndicator:v15];
}

- (void)_updateAudioOnlyIndicatorView
{
  id v3 = [(AVPlayerViewController *)self contentView];
  objc_msgSend(v3, "setShowsAudioOnlyIndicator:", -[AVPlayerViewController isAudioOnlyContent](self, "isAudioOnlyContent"));
}

- (BOOL)_shouldEnterFullScreenAfterPlaybackBegins
{
  BOOL v3 = [(AVPlayerViewController *)self _isDescendantOfRootViewController];
  uint64_t v4 = [(AVPlayerViewController *)self _chromeControlsViewController];

  if (!v4) {
    return [(AVPlayerViewController *)self entersFullScreenWhenPlaybackBegins]
  }
        && v3
        && !self->_playbackBeganAfterPlayerControllerBecameReadyToPlay;
  id v5 = [(AVPlayerViewController *)self playbackControlsController];
  char v6 = [v5 shouldEnterFullScreenWhenPlaybackBegins];

  return v6;
}

- (void)_visualLookupMenuItemPressedEvent:(id)a3
{
  [(AVPlayerViewController *)self setShowsVisualLookup:!self->_showsVisualLookup];
  BOOL showsVisualLookup = self->_showsVisualLookup;
  toggleLookupAction = self->_toggleLookupAction;

  [(UIAction *)toggleLookupAction setState:showsVisualLookup];
}

- (void)_setContentViewOnSelf
{
  BOOL v3 = [(AVMobileControlsViewController *)self->_controlsViewController parentViewController];

  if (v3 == self)
  {
    playerViewControllerView = self->_playerViewControllerView;
    playerViewControllerContentView = self->_playerViewControllerContentView;
    [(AVPlayerView *)playerViewControllerView setContentView:playerViewControllerContentView];
  }
  else
  {
    [(AVMobileControlsViewController *)self->_controlsViewController willMoveToParentViewController:0];
    [(AVMobileControlsViewController *)self->_controlsViewController removeFromParentViewController];
    [(AVPlayerView *)self->_playerViewControllerView setContentView:self->_playerViewControllerContentView];
    [(AVPlayerViewController *)self addChildViewController:self->_controlsViewController];
    controlsViewController = self->_controlsViewController;
    [(AVMobileControlsViewController *)controlsViewController didMoveToParentViewController:self];
  }
}

- (void)_playPauseButtonWasPressedEvent:(id)a3
{
  [(AVPlayerViewController *)self _enterFullScreenWhenPlayingIfNeeded];

  [(AVPlayerViewController *)self _handlePlaybackToggleNotificationForMetricsCollectionEvent];
}

- (BOOL)_isUnsupportedContent
{
  id v2 = [(AVPlayerViewController *)self playerController];
  BOOL v3 = [v2 status] == 3;

  return v3;
}

void __49__AVPlayerViewController__defaultInfoViewActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    id v2 = [WeakRetained playerController];
    if ([v2 canSeekToBeginning] && !v3[978]) {
      [v2 seekToBeginning:0];
    }

    id WeakRetained = v3;
  }
}

- (BOOL)_controlsViewControllerPrefersStatusBarHidden
{
  BOOL v3 = [(AVPlayerViewController *)self playbackControlsController];
  char v4 = [v3 prefersStatusBarHidden];

  if (self && self->_controlsGeneration == 1)
  {
    unint64_t v5 = [(AVControlsViewController *)self->_controlsViewController visibleControls];
    if (v5) {
      BOOL v6 = v5 == 2;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      return 1;
    }
    else {
      return v5 == 1 && [(AVPlayerController *)self->_playerController isScrubbing];
    }
  }
  return v4;
}

- (void)_createPictureInPictureControllerIfNeeded
{
  if (![(AVPlayerViewController *)self _showsWolfControls] && !self->_pictureInPictureController)
  {
    if (+[AVPictureInPictureController isPictureInPictureSupported])
    {
      if ([(AVPlayerViewController *)self _hasBegunObservation])
      {
        BOOL v3 = [(AVTransitionController *)self->_transitionController presentationContext];
        char v4 = [v3 isPresenting];

        if ((v4 & 1) == 0)
        {
          unint64_t v5 = [[AVPictureInPictureController alloc] initWithSource:self];
          [(AVPictureInPictureController *)v5 setRequiresLinearPlayback:[(AVPlayerViewController *)self requiresLinearPlayback]];
          [(AVPictureInPictureController *)v5 setAllowsPictureInPicturePlayback:[(AVPlayerViewController *)self allowsPictureInPicturePlayback]];
          [(AVPictureInPictureController *)v5 setRetainsSourceDuringPictureInPicturePlayback:1];
          [(AVPictureInPictureController *)v5 setCanPausePlaybackWhenClosingPictureInPicture:[(AVPlayerViewController *)self canPausePlaybackWhenClosingPictureInPicture]];
          if ([(AVPlayerViewController *)self _delegateRespondsTo:sel_playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground_])
          {
            BOOL v6 = [(AVPlayerViewController *)self delegate];
            -[AVPlayerViewController setCanStartPictureInPictureAutomaticallyFromInline:](self, "setCanStartPictureInPictureAutomaticallyFromInline:", [v6 playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground:self]);
          }
          [(AVPictureInPictureController *)v5 setCanStartPictureInPictureAutomaticallyFromInline:[(AVPlayerViewController *)self canStartPictureInPictureAutomaticallyFromInline]];
          [(AVPictureInPictureController *)v5 setDelegate:self];
          id v7 = [(AVPlayerViewController *)self playerController];
          [(AVPictureInPictureController *)v5 setPlayerController:v7];

          __int16 v8 = [(AVPlayerViewController *)self pictureInPictureActivitySessionIdentifier];
          [(AVPictureInPictureController *)v5 setActivitySessionIdentifier:v8];

          [(AVMobileControlsViewController *)self->_controlsViewController setPipController:v5];
          uint64_t v9 = [(AVPlayerViewController *)self _observationController];
          id v10 = (id)[v9 startObserving:self keyPath:@"pictureInPictureController.pictureInPicturePossible" includeInitialValue:1 observationHandler:&__block_literal_global_606];

          int v11 = [(AVPlayerViewController *)self playbackControlsController];
          [v11 setPictureInPictureController:v5];

          [(AVPlayerViewController *)self willChangeValueForKey:@"pictureInPictureController"];
          pictureInPictureController = self->_pictureInPictureController;
          self->_pictureInPictureController = v5;

          [(AVPlayerViewController *)self didChangeValueForKey:@"pictureInPictureController"];
          [(AVPlayerViewController *)self _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground];
        }
      }
    }
  }
}

void __67__AVPlayerViewController__createPictureInPictureControllerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 playbackControlsController];
  uint64_t v3 = [v2 _shouldShowPictureInPictureButton];

  [v4 setShowsPictureInPictureButton:v3];
}

- (void)_copySubjectMenuItemPressedEvent:(id)a3
{
  if ([(AVVisualAnalysisView *)self->_analysisView hasSubjectToCopy])
  {
    analysisView = self->_analysisView;
    [(AVVisualAnalysisView *)analysisView copySubject];
  }
}

- (void)_chromelessControlsViewController:(id)a3 willBeginContentTabTransitionWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 state] == 2)
  {
    __int16 v8 = [v7 transitionContext];
    uint64_t v9 = [v8 animationCoordinator];
    -[AVPlayerViewController _updateGesturesEnablementStates]((uint64_t)self);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke;
    v14[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_2;
    void v12[3] = &unk_1E5FC4220;
    objc_copyWeak(&v13, &location);
    [v9 addCoordinatedAnimations:v14 completion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView setNeedsLayout];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_3;
    v10[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v11, &location);
    dispatch_async(MEMORY[0x1E4F14428], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (uint64_t)_updateGesturesEnablementStates
{
  if (result)
  {
    uint64_t v1 = result;
    -[AVPlayerViewController _updateSecondGenerationControlsGestureEnablementStates](result);
    [*(id *)(v1 + 1344) setEnabled:!-[AVPlayerViewController _contentTabsVisible](v1)];
    id v2 = *(void **)(v1 + 1304);
    BOOL v3 = !-[AVPlayerViewController _contentTabsVisible](v1);
    return [v2 setEnabled:v3];
  }
  return result;
}

void __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[146] setNeedsLayout];
    [v2[146] layoutIfNeeded];
    [v2 updateVideoBounds];
    id WeakRetained = v2;
  }
}

void __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (a2) {
      [WeakRetained _updatePlayerLayerLegibleContentInsetsIfNeeded];
    }
    else {
      [WeakRetained[146] setNeedsLayout];
    }
    -[AVPlayerViewController _updateGesturesEnablementStates]((uint64_t)v4);
    [v4 updateVideoBounds];
    id WeakRetained = v4;
  }
}

void __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlayerLayerLegibleContentInsetsIfNeeded];

  id v3 = objc_loadWeakRetained(v1);
  -[AVPlayerViewController _updateGesturesEnablementStates]((uint64_t)v3);

  id v4 = objc_loadWeakRetained(v1);
  [v4 updateVideoBounds];
}

- (uint64_t)_updateSecondGenerationControlsGestureEnablementStates
{
  -[AVPlayerViewController _updateSecondGenerationContentTabsGestureEnablementState]((id *)a1);
  -[AVPlayerViewController _updateTapThroughGestureRecognizerEnablementState](a1);
  BOOL v2 = *(void *)(a1 + 1184) == 1 && !-[AVPlayerViewController _contentTabsVisible](a1);
  [*(id *)(a1 + 1312) setEnabled:v2];

  return -[AVPlayerViewController _updateScrubbingGestureEnabledState](a1);
}

- (void)_updateSecondGenerationContentTabsGestureEnablementState
{
  if (a1)
  {
    id v5 = [a1 playerController];
    BOOL v2 = [a1[147] controlsViewControllerIfChromeless];
    BOOL v3 = [v5 status] == 2;
    id v4 = [v2 contentTabPanGestureRecognizer];
    [v4 setEnabled:v3];
  }
}

- (double)_availableSpaceForContentTabWithVideoDodgingForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
  if (v6)
  {
    id v7 = [(AVPlayerViewController *)self playerController];
    __int16 v8 = [v6 viewIfLoaded];
    uint64_t v9 = self->_playerViewControllerContentView;
    uint64_t v10 = [(AVPlayerViewController *)self playerLayerView];
    id v11 = (void *)v10;
    double v12 = NAN;
    if (!v7) {
      goto LABEL_29;
    }
    BOOL v13 = !v8 || v9 == 0;
    if (v13 || v10 == 0) {
      goto LABEL_29;
    }
    [v7 contentDimensions];
    double v17 = v16;
    double v12 = NAN;
    if (v16 <= 0.0) {
      goto LABEL_29;
    }
    double v18 = v15;
    if (v15 <= 0.0) {
      goto LABEL_29;
    }
    if (width <= height) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    uint64_t v20 = [(AVPlayerViewControllerContentView *)v9 targetVideoGravities];
    __int16 v21 = [NSNumber numberWithUnsignedInteger:v19];
    uint64_t v22 = [v20 objectForKeyedSubscript:v21];

    if (v22 == (void *)*MEMORY[0x1E4F15AE8])
    {
      double v23 = height;
    }
    else
    {
      double v23 = height;
      if (v22 != (void *)*MEMORY[0x1E4F15AF8])
      {
        if (v22 != (void *)*MEMORY[0x1E4F15AF0])
        {
          double v12 = NAN;
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
        double v23 = width / (v18 / v17);
      }
    }
    [v6 unobscuredContentArea];
    double v24 = height - (v23 + CGRectGetMinY(v29) + 40.0);
    float v25 = v24;
    float v26 = v23;
    if (vabds_f32(v25, v26) < 0.00000011921 || v25 < v26) {
      double v12 = NAN;
    }
    else {
      double v12 = v24;
    }
    goto LABEL_28;
  }
  double v12 = NAN;
LABEL_30:

  return v12;
}

- (BOOL)analysisInteractionInProgress
{
  BOOL v2 = [(AVPlayerViewController *)self analysisView];
  char v3 = [v2 isInteractionInProgress];

  return v3;
}

- (void)_resetVisualAnalysisViewSelectionIfNeeded
{
  BOOL allowsVideoFrameAnalysis = self->_allowsVideoFrameAnalysis;
  uint64_t v4 = -[AVPlayerViewController _currentAnalysis]((uint64_t)self);
  analysisView = self->_analysisView;
  if (allowsVideoFrameAnalysis && v4 != 0 && analysisView != 0)
  {
    uint64_t v8 = v4;
    analysisView = (AVVisualAnalysisView *)[(AVVisualAnalysisView *)analysisView resetSelection];
    uint64_t v4 = v8;
  }

  MEMORY[0x1F41817F8](analysisView, v4);
}

- (void)_updateSelectedPlaybackSpeedIfPlayerControllerRateChanges
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v3 = [(AVPlayerViewController *)self playerController];
  uint64_t v4 = [(AVPlayerViewController *)self playbackSpeedCollection];
  [v3 rate];
  double v6 = v5;
  if (v5 >= 0.1 && v5 < 4.0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = objc_msgSend(v4, "speeds", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
LABEL_8:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        [v13 rate];
        if (v6 == v14) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
      double v15 = v13;

      if (v15) {
        goto LABEL_17;
      }
    }
    else
    {
LABEL_14:
    }
    double v16 = AVLocalizedString(@"Active Speed");
    double v17 = [AVPlaybackSpeed alloc];
    [v3 defaultPlaybackRate];
    *(float *)&double v18 = v18;
    double v15 = [(AVPlaybackSpeed *)v17 initWithRate:v16 localizedName:1 synthesized:v18];

LABEL_17:
    [v4 setActiveSpeed:v15];
  }
}

void __57__AVPlayerViewController__updateNowPlayingInfoController__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained playerController];
    if ([v5 _wantsNowPlayingInfoCenter:1])
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 40));

      if (v6 == v7)
      {
        objc_storeStrong(v5 + 137, a2);
        [v8 startNowPlayingUpdatesForPlayerController:v6 afterDelay:1.0];
        -[AVPlayerViewController _updateNowPlayingInfoControllerSuspendedState](v5);
      }
    }
  }
}

- (void)_updateNowPlayingInfoControllerSuspendedState
{
  if (result)
  {
    uint64_t v1 = result;
    BOOL v2 = [result playerController];
    uint64_t v3 = [v2 isScrubbing];

    uint64_t v4 = (void *)v1[137];
    return (void *)[v4 setSuspended:v3];
  }
  return result;
}

- (void)_updateDefaultLinearPlaybackRateIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVPlayerViewController *)self playerController];
  [v3 defaultPlaybackRate];
  if (v4 != self->_defaultLinearPlaybackRate)
  {
    double v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [v3 defaultPlaybackRate];
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "setDefaultPlaybackRate called during linear playback. Updating default linear playback rate to %f", (uint8_t *)&v8, 0xCu);
    }

    [v3 defaultPlaybackRate];
    *(float *)&double v7 = v7;
    self->_float defaultLinearPlaybackRate = *(float *)&v7;
  }
}

- (void)_updateContentViewEdgeInsetsForLetterboxedContent
{
  id v3 = [(AVPlayerViewController *)self contentView];
  [(AVPlayerViewController *)self playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:v3];
  objc_msgSend(v3, "setEdgeInsetsForLetterboxedContent:");
  [v3 setNeedsLayout];
}

- (void)_setSecondScreenConnectionReadyToConnect:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  secondScreenConnection = self->_secondScreenConnection;
  if (secondScreenConnection)
  {
    BOOL v5 = a3;
    if ([(AVSecondScreenConnection *)secondScreenConnection isReadyToConnect] != a3)
    {
      uint64_t v6 = _AVLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = "NO";
        int v8 = 136315650;
        uint64_t v9 = "-[AVPlayerViewController _setSecondScreenConnectionReadyToConnect:]";
        uint64_t v11 = "readyToConnect";
        __int16 v10 = 2080;
        if (v5) {
          double v7 = "YES";
        }
        __int16 v12 = 2080;
        BOOL v13 = v7;
        _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
      }

      [(AVSecondScreenConnection *)self->_secondScreenConnection setReadyToConnect:v5];
    }
  }
}

- (void)_updateSecondScreenConnectionReadyToConnect
{
  if ([(AVPlayerViewController *)self _isReadyToConnectSynchronousChecks])
  {
    id v3 = [(AVPlayerViewController *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1)
    {
      if (!self->_isUpdatingSecondScreenConnectionReadyToConnect)
      {
        self->_isUpdatingSecondScreenConnectionReadyToConnect = 1;
        BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.avkit.SharedPreferences"];
        uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F09B4238];
        [v5 setRemoteObjectInterface:v6];

        [v5 resume];
        objc_initWeak(&location, self);
        double v7 = [v5 remoteObjectProxy];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke;
        v11[3] = &unk_1E5FC3550;
        objc_copyWeak(&v13, &location);
        id v8 = v5;
        id v12 = v8;
        [v7 extendedDisplayActive:v11];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
      return;
    }
    uint64_t v9 = self;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v9 = self;
    uint64_t v10 = 0;
  }

  [(AVPlayerViewController *)v9 _setSecondScreenConnectionReadyToConnect:v10];
}

void __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke_2;
  double v7 = &unk_1E5FC46C0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
}

void __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = [WeakRetained _isReadyToConnectSynchronousChecks];
    }
    [v4 _setSecondScreenConnectionReadyToConnect:v3];
    [v4 setIsUpdatingSecondScreenConnectionReadyToConnect:0];
    id WeakRetained = v4;
  }
}

- (BOOL)_isReadyToConnectSynchronousChecks
{
  uint64_t v3 = [(AVPlayerViewController *)self playerController];
  id v4 = [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView window];
  if (v4
    && [v3 allowsExternalPlayback]
    && [v3 externalPlaybackType] != 1
    && (![(AVPlayerViewController *)self isBeingDismissed]
     || [(AVSecondScreenConnection *)self->_secondScreenConnection isReadyToConnect]))
  {
    char v5 = [v3 usesExternalPlaybackWhileExternalScreenIsActive];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateSecondScreenConnectionPlayingState
{
  uint64_t v3 = [(AVPlayerViewController *)self playerController];
  BOOL v4 = [v3 timeControlStatus] != 0;

  secondScreenConnection = self->_secondScreenConnection;

  [(AVSecondScreenConnection *)secondScreenConnection setPlaying:v4];
}

- (void)_setUpSecondScreenConnectionIfNeeded
{
  uint64_t v3 = [(AVPlayerViewController *)self contentView];
  uint64_t v11 = [v3 playbackContentContainerView];

  uint64_t v5 = v11;
  if (v11)
  {
    if (!self->_secondScreenConnection)
    {
      uint64_t v4 = [(AVPlayerViewController *)self hasPerformedInitialSetup];
      uint64_t v5 = v11;
      if (v4)
      {
        uint64_t v6 = [[AVSecondScreenContentViewConnection alloc] initWithContentView:v11];
        double v7 = [(AVPlayerViewController *)self player];
        [(AVSecondScreenConnection *)v6 setDebugInfoPlayer:v7];

        id v8 = [(AVPlayerViewController *)self player];
        [(AVSecondScreenConnection *)v6 setPlayer:v8];

        [(AVSecondScreenConnection *)v6 setRequiresTVOutScreen:1];
        [(AVSecondScreenContentViewConnection *)v6 startUpdates];
        char v9 = +[AVSecondScreenController sharedInstance];
        [v9 addConnection:v6];

        secondScreenConnection = self->_secondScreenConnection;
        self->_secondScreenConnection = v6;

        [(AVPlayerViewController *)self _updateSecondScreenConnectionPlayingState];
        uint64_t v4 = [(AVPlayerViewController *)self _updateSecondScreenConnectionReadyToConnect];
        uint64_t v5 = v11;
      }
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setCanStartPictureInPictureAutomaticallyFromInline:(BOOL)canStartPictureInPictureAutomaticallyFromInline
{
  self->_canStartPictureInPictureAutomaticallyFromInline = canStartPictureInPictureAutomaticallyFromInline;
  -[AVPictureInPictureController setCanStartPictureInPictureAutomaticallyFromInline:](self->_pictureInPictureController, "setCanStartPictureInPictureAutomaticallyFromInline:");
}

- (void)_addObservers
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      double v38 = "-[AVPlayerViewController _addObservers]";
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", buf, 0xCu);
    }
  }
  uint64_t v4 = [(AVPlayerViewController *)self playerController];
  if (![v4 status])
  {
    uint64_t v5 = [(AVPlayerViewController *)self playerController];
    char v6 = [v5 hasContent];

    if (v6) {
      goto LABEL_10;
    }
    uint64_t v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      CGFloat v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      double v38 = v34;
      _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "The player controller should have content before calling %@.", buf, 0xCu);
    }
  }

LABEL_10:
  if ([(AVPlayerViewController *)self _hasBegunObservation])
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "It's an error to repeatedly add observers.", buf, 2u);
    }
  }
  [(AVPlayerViewController *)self set_hasBegunObservation:1];
  id v8 = [(AVPlayerViewController *)self _observationController];
  char v9 = (void *)MEMORY[0x1E4F74A88];
  uint64_t v36 = *MEMORY[0x1E4F74A88];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  uint64_t v11 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  [v11 setAttribute:v10 forKey:*MEMORY[0x1E4F74EA8] error:0];

  [v8 startObservingNotificationForName:*v9 object:0 notificationCenter:0 observationHandler:&__block_literal_global_409];
  [v8 startObservingNotificationForName:*MEMORY[0x1E4F15F60] object:0 notificationCenter:0 observationHandler:&__block_literal_global_411];
  id v12 = (id)[v8 startObserving:self keyPath:@"playerController.player.currentItem" includeInitialValue:1 observationHandler:&__block_literal_global_417];
  [(AVObservationController *)self->_observationController startObservingNotificationForName:@"AVVolumeControllerVolumeChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_419];
  id v13 = (id)[v8 startObserving:self keyPath:@"playerController.player.muted" includeInitialValue:0 observationHandler:&__block_literal_global_424];
  [v8 startObservingNotificationForName:@"AVNowPlayingInfoControllerDidReceiveSkipCommandEventNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_426];
  [v8 startObservingNotificationForName:@"AVPictureInPictureControllerUserPlaybackStateDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_428];
  [v8 startObservingNotificationForName:@"AVNowPlayingInfoControllerDidReceiveStopCommandEventNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_430];
  [v8 startObservingNotificationForName:@"AVPlayerControllerPlaybackDidEndNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_433];
  id v14 = (id)[v8 startObserving:self keyPath:@"playerController.contentDimensions" includeInitialValue:1 observationHandler:&__block_literal_global_439];
  id v15 = (id)[v8 startObserving:self keyPath:@"playerController.playingOnExternalScreen" includeInitialValue:0 observationHandler:&__block_literal_global_445];
  id v16 = (id)[v8 startObserving:self keyPath:@"playerController.externalPlaybackType" includeInitialValue:0 observationHandler:&__block_literal_global_448];
  id v17 = (id)[v8 startObserving:self keyPath:@"playerController.externalPlaybackAirPlayDeviceLocalizedName" includeInitialValue:0 observationHandler:&__block_literal_global_454];
  v35[0] = @"playerController.hasEnabledAudio";
  v35[1] = @"playerController.hasEnabledVideo";
  v35[2] = @"playerController.status";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  id v19 = (id)[v8 startObserving:self keyPaths:v18 observationHandler:&__block_literal_global_467];

  id v20 = (id)[v8 startObserving:self keyPath:@"playerController.status" includeInitialValue:1 observationHandler:&__block_literal_global_470];
  id v21 = (id)[v8 startObserving:self keyPath:@"playerController.defaultPlaybackRate" includeInitialValue:1 observationHandler:&__block_literal_global_476];
  long long v22 = [(AVPlayerViewController *)self playerController];
  LOBYTE(v18) = objc_opt_respondsToSelector();

  if (v18) {
    id v23 = (id)[v8 startObserving:self keyPath:@"playerController.timeControlStatus" includeInitialValue:0 observationHandler:&__block_literal_global_483];
  }
  id v24 = (id)[v8 startObserving:self keyPath:@"playerController.allowsExternalPlayback" includeInitialValue:0 observationHandler:&__block_literal_global_488];
  id v25 = (id)[v8 startObserving:self keyPath:@"playerController.scrubbing" includeInitialValue:0 observationHandler:&__block_literal_global_493];
  id v26 = (id)[v8 startObserving:self keyPath:@"playerController.playingOnSecondScreen" includeInitialValue:0 observationHandler:&__block_literal_global_498];
  id v27 = (id)[v8 startObserving:self keyPath:@"contentView.playbackContentContainerView.bounds" includeInitialValue:1 observationHandler:&__block_literal_global_503];
  uint64_t v28 = [(AVPlayerViewController *)self playerController];
  char v29 = objc_opt_respondsToSelector();

  if (v29) {
    id v30 = [(AVObservationController *)self->_observationController startObserving:self keyPath:@"playerController.usesExternalPlaybackWhileExternalScreenIsActive" includeInitialValue:0 observationHandler:&__block_literal_global_511];
  }
  [(AVPlayerViewController *)self _updateUnsupportedContentIndicatorView];
  [(AVPlayerViewController *)self _updateAudioOnlyIndicatorView];
  [(AVPlayerViewController *)self _updateExternalPlaybackIndicatorView];
  [(AVPlayerViewController *)self _updateSecondScreenConnectionPlayingState];
  [(AVPlayerViewController *)self _updateSecondScreenConnectionReadyToConnect];
  [(AVPlayerViewController *)self _updateContentViewEdgeInsetsForLetterboxedContent];
  [(AVPlayerViewController *)self _updatePlayerLayerLegibleContentInsetsIfNeeded];
  -[AVPlayerViewController _updateSmartSubtitlesEnablementIfNeeded]((id *)&self->super.super.super.isa);
  id v31 = (id)[v8 startObserving:self keyPath:@"playerController.rate" includeInitialValue:1 observationHandler:&__block_literal_global_516];
  if (![(AVPlayerViewController *)self _showsWolfControls]) {
    [(AVPlayerViewController *)self _createPictureInPictureControllerIfNeeded];
  }
  if (self->_controlsGeneration != 1)
  {
    id v32 = (id)[v8 startObserving:self keyPath:@"playerLayerView.videoGravity" includeInitialValue:1 observationHandler:&__block_literal_global_518];
    id v33 = (id)[v8 startObserving:self keyPath:@"playerLayerView.frame" includeInitialValue:1 observationHandler:&__block_literal_global_523];
  }
  [(AVPlayerViewController *)self _showsWolfControls];
}

- (void)_updateSmartSubtitlesEnablementIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v2 = [a1 playerController];
    if ([v2 externalPlaybackType] == 1)
    {
      uint64_t v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315138;
        uint64_t v5 = "-[AVPlayerViewController _updateSmartSubtitlesEnablementIfNeeded]";
        _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s Airplay is active disable automatic subtitles", (uint8_t *)&v4, 0xCu);
      }

      [a1[174] userRequestedSmartSubtitlesHiddenIfActive];
    }
    else
    {
      -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](a1, 0);
    }
  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_17(uint64_t a1, void *a2)
{
  BOOL v2 = a2;
  -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](v2);
  [v2 updateVideoBounds];
}

void __39__AVPlayerViewController__addObservers__block_invoke_16(uint64_t a1, void *a2)
{
  BOOL v2 = a2;
  -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](v2);
  [v2 updateVideoBounds];
}

void __39__AVPlayerViewController__addObservers__block_invoke_15(uint64_t a1, void *a2)
{
  id v8 = a2;
  BOOL v2 = +[AVKitGlobalSettings shared];
  if ([v2 isTVApp])
  {
  }
  else
  {
    uint64_t v3 = +[AVKitGlobalSettings shared];
    int v4 = [v3 isAVKitTester];

    uint64_t v5 = v8;
    if (!v4) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = [v8 playerController];
  int v7 = [v6 coordinatedPlaybackActive];

  uint64_t v5 = v8;
  if (v7)
  {
    [v8 _updateSelectedPlaybackSpeedIfPlayerControllerRateChanges];
    uint64_t v5 = v8;
  }
LABEL_6:
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v5, 0);
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 _updateSecondScreenConnectionReadyToConnect];
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 updateVideoBounds];
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 _updatePlayerLayerLegibleContentInsetsIfNeeded];
}

void __39__AVPlayerViewController__addObservers__block_invoke_11(uint64_t a1, void *a2)
{
  BOOL v2 = a2;
  -[AVPlayerViewController _updateNowPlayingInfoControllerSuspendedState](v2);
  [v2 _updateViewControllerPreferencesIfNeeded];
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 _updateSecondScreenConnectionReadyToConnect];
}

void __39__AVPlayerViewController__addObservers__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateSecondScreenConnectionPlayingState];
  [v2 _updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded];
}

void __39__AVPlayerViewController__addObservers__block_invoke_8_474(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 requiresLinearPlayback]) {
    [v2 _updateDefaultLinearPlaybackRateIfNeeded];
  }
  else {
    [v2 _updateActivePlaybackSpeedIfNeeded];
  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_7_468(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateUnsupportedContentIndicatorView];
  [v2 _updateAudioOnlyIndicatorView];
  [v2 _updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded];
  -[AVPlayerViewController _updateSecondGenerationContentTabsGestureEnablementState]((id *)v2);
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_6_464(uint64_t a1, void *a2)
{
  return [a2 _updateAudioOnlyIndicatorView];
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_5_452(uint64_t a1, void *a2)
{
  return [a2 _updateExternalPlaybackIndicatorView];
}

void __39__AVPlayerViewController__addObservers__block_invoke_4_446(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateExternalPlaybackIndicatorView];
  -[AVPlayerViewController _updateSmartSubtitlesEnablementIfNeeded]((id *)v2);
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)v2);
  [v2 _updateSecondScreenConnectionReadyToConnect];
}

void __39__AVPlayerViewController__addObservers__block_invoke_3_443(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateExternalPlaybackIndicatorView];
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)v2);
  [v2 _updateSecondScreenConnectionReadyToConnect];
  [v2 _updateContentViewEdgeInsetsForLetterboxedContent];
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)v2, 1);
}

void __39__AVPlayerViewController__addObservers__block_invoke_2_437(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v2 = [v7 contentView];
  uint64_t v3 = [v2 playbackContentContainerView];
  int v4 = [v3 activeContentView];

  uint64_t v5 = [v4 visualAnalysisView];
  uint64_t v6 = v5;
  if (v5 && ([v5 isHidden] & 1) == 0) {
    [v4 setNeedsLayout];
  }
  [v7 _updateContentViewEdgeInsetsForLetterboxedContent];
  [v2 setNeedsLayout];
}

void __39__AVPlayerViewController__addObservers__block_invoke_431(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  uint64_t v5 = [a4 object];
  uint64_t v6 = [v9 playerController];
  if (v5 == v6 && [v9 exitsFullScreenWhenPlaybackEnds])
  {
    char v7 = [v9 _isTrackingUserInteraction];

    id v8 = v9;
    if (v7) {
      goto LABEL_7;
    }
    [v9 _transitionFromFullScreenAnimated:1 completionHandler:0];
  }
  else
  {
  }
  id v8 = v9;
LABEL_7:
}

void __39__AVPlayerViewController__addObservers__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  char v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Did receive stop command notification.", v13, 2u);
  }

  id v8 = [v6 object];

  id v9 = [v5 playbackControlsController];
  uint64_t v10 = [v9 nowPlayingInfoControllerIfLoaded];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    id v12 = [v5 fullScreenViewController];

    if (v12) {
      [v5 _transitionFromFullScreenWithReason:3 animated:1 completionHandler:0];
    }
    else {
      [v5 _transitionFromFullScreenAnimated:1 completionHandler:0];
    }
  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_7(uint64_t a1, void *a2)
{
}

void __39__AVPlayerViewController__addObservers__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v5 = a4;
  id v6 = [v13 player];
  [v6 rate];
  float v8 = v7;

  if (v8 != 0.0)
  {
    id v9 = [v5 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"AVNowPlayingInfoSkipCommandDirectionKey"];
    int v11 = [v10 intValue];

    if (v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v13, v12);
  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v5 = a4;
  id v6 = [v5 oldValue];
  int v7 = [v6 BOOLValue];

  float v8 = [v5 value];

  LODWORD(v5) = [v8 BOOLValue];
  if (v7 != v5) {
    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v9, 0);
  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  float v8 = a2;
  id v5 = [a4 object];
  id v6 = [v8 _volumeController];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v8, 0);
  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVPlayerViewController _setupInfoTabViewController](v2);
  -[AVPlayerViewController _updateInfoTabViewControllerIfNeeded](v2);
}

- (void)_setupInfoTabViewController
{
  if (a1)
  {
    id v2 = +[AVKitGlobalSettings shared];
    int v3 = [v2 isTVApp];

    if (v3)
    {
      int v4 = [a1 showsPlaybackControls];
      id v5 = [a1 playerController];
      id v6 = [v5 activePlayer];
      id v19 = [v6 currentItem];

      id v7 = a1[215];
      if (v19) {
        BOOL v8 = v7 == 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (v8) {
        id v9 = 0;
      }
      else {
        id v9 = v7;
      }
      if (v8 && v4)
      {
        uint64_t v10 = [AVInfoTabCoordinator alloc];
        int v11 = [a1 infoViewActions];
        uint64_t v12 = [(AVInfoTabCoordinator *)v10 initWithPlayerItem:v19 actions:v11];
        id v13 = a1[216];
        a1[216] = (id)v12;

        id v9 = [a1[216] infoTabViewController];
        [a1 setInfoTabViewController:v9];
        -[AVPlayerViewController _updateInfoTabViewControllerIfNeeded](a1);
        id v14 = [a1 view];
        [v14 frame];
        double v16 = v15;
        double v18 = v17;

        [(AVPlayerViewController *)(uint64_t)a1 _updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:v18];
      }
    }
  }
}

- (void)_updateInfoTabViewControllerIfNeeded
{
  if (a1)
  {
    id v2 = +[AVKitGlobalSettings shared];
    int v3 = [v2 isTVApp];

    if (v3)
    {
      int v4 = [a1 playerController];
      id v5 = [v4 activePlayer];
      id v6 = [v5 currentItem];

      [a1[216] setPlayerItem:v6];
      -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)a1);
    }
  }
}

- (void)_updateCustomInfoViewControllersIfNeeded
{
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v10 = (id)[v2 initWithArray:MEMORY[0x1E4F1CBF0]];
    id v3 = *(id *)(a1 + 1720);
    int v4 = [(id)a1 allowInfoMetadataSubpanel];
    id v5 = +[AVKitGlobalSettings shared];
    int v6 = [v5 isTVApp];

    if (v3) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7 && v6 != 0) {
      [v10 addObject:v3];
    }
    [v10 addObjectsFromArray:*(void *)(a1 + 1384)];
    id v9 = [*(id *)(a1 + 1176) controlsViewControllerIfChromeless];
    [v9 setCustomInfoViewControllers:v10];
  }
}

- (void)_updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:(double)a3
{
  if (a1)
  {
    int v6 = +[AVKitGlobalSettings shared];
    int v7 = [v6 isTVApp];

    if (v7)
    {
      BOOL v8 = *(void **)(a1 + 1720);
      if (v8)
      {
        double v9 = dbl_1B07212D0[a2 > a3];
        objc_msgSend(v8, "setPreferredContentSize:", a2, v9);
      }
    }
  }
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _updateExternalPlaybackIndicatorView];
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateExternalPlaybackIndicatorView];
}

- (void)setInfoTabViewController:(id)a3
{
  id v10 = (UIViewController *)a3;
  id v5 = +[AVKitGlobalSettings shared];
  int v6 = [v5 isTVApp];

  p_infoTabViewController = &self->_infoTabViewController;
  infoTabViewController = self->_infoTabViewController;
  if (v6)
  {
    double v9 = v10;
    if (infoTabViewController == v10) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)p_infoTabViewController, a3);
    -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)self);
  }
  else
  {
    *p_infoTabViewController = 0;
  }
  double v9 = v10;
LABEL_6:

  MEMORY[0x1F41817F8](p_infoTabViewController, v9);
}

- (void)setShowsVisualLookup:(BOOL)a3
{
  if (self->_showsVisualLookup != a3)
  {
    self->_BOOL showsVisualLookup = a3;
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
    -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes]((uint64_t)self);
    BOOL showsVisualLookup = self->_showsVisualLookup;
    toggleLookupAction = self->_toggleLookupAction;
    [(UIAction *)toggleLookupAction setState:showsVisualLookup];
  }
}

- (void)_contentViewDidMoveWindow
{
  [(AVPlayerViewController *)self performInitialSetupIfNeededAndPossible];
  -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);

  [(AVPlayerViewController *)self _updateSecondScreenConnectionReadyToConnect];
}

- (void)_didEndPlayingOnSecondScreen
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__AVPlayerViewController__didEndPlayingOnSecondScreen__block_invoke;
  v2[3] = &unk_1E5FC4698;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __54__AVPlayerViewController__didEndPlayingOnSecondScreen__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) playerController];
  id v2 = [*(id *)(a1 + 32) contentView];
  id v3 = [v2 playbackContentContainerView];
  [v3 setPlayingOnSecondScreen:0];

  [v4 setPlayingOnSecondScreen:0];
  [v2 addPlaybackContentContainerViewIfNeeded];
}

- (void)_didBeginPlayingOnSecondScreen
{
  id v5 = [(AVPlayerViewController *)self playerController];
  id v3 = [(AVPlayerViewController *)self contentView];
  id v4 = [v3 playbackContentContainerView];

  [v4 setPlayingOnSecondScreen:1];
  [v5 setPlayingOnSecondScreen:1];
}

- (void)_handleFastForwardKeyReleasedCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self playerController];
  [v5 endScanningForward:v4];
}

- (void)_handleFastForwardKeyPressedCommand:(id)a3
{
  id v5 = a3;
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    id v4 = [(AVPlayerViewController *)self playerController];
    [v4 beginScanningForward:v5];
  }
}

- (void)_handleRewindKeyReleasedCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self playerController];
  [v5 endScanningBackward:v4];
}

- (void)_handleRewindKeyPressedCommand:(id)a3
{
  id v5 = a3;
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    id v4 = [(AVPlayerViewController *)self playerController];
    [v4 beginScanningBackward:v5];
  }
}

- (void)_handleVolumeDownKeyReleasedCommand:(id)a3
{
  id v3 = [(AVPlayerViewController *)self _volumeController];
  [v3 endChangingVolume];
}

- (void)_handleVolumeDownKeyPressedCommand:(id)a3
{
  id v6 = [(AVPlayerViewController *)self _volumeController];
  [v6 beginChangingVolume];
  [v6 volume];
  double v4 = v3 + -0.0625;
  double v5 = 0.0;
  if (v4 >= 0.0)
  {
    objc_msgSend(v6, "volume", 0.0);
    *(float *)&double v5 = *(float *)&v5 + -0.0625;
  }
  [v6 setTargetVolume:v5];
}

- (void)_handleVolumeUpKeyReleasedCommand:(id)a3
{
  id v3 = [(AVPlayerViewController *)self _volumeController];
  [v3 endChangingVolume];
}

- (void)_handleVolumeUpKeyPressedCommand:(id)a3
{
  id v6 = [(AVPlayerViewController *)self _volumeController];
  [v6 beginChangingVolume];
  [v6 volume];
  double v5 = v3;
  double v4 = v5 + 0.0625;
  LODWORD(v5) = 1.0;
  if (v4 <= 1.0)
  {
    objc_msgSend(v6, "volume", v5);
    *(float *)&double v5 = *(float *)&v5 + 0.0625;
  }
  [v6 setTargetVolume:v5];
}

- (void)_handleShowPreviousFrameKeyCommand:(id)a3
{
  id v5 = a3;
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    double v4 = [(AVPlayerViewController *)self playerController];
    [v4 seekFrameBackward:v5];
  }
}

- (void)_handleGoToBeginningKeyCommand:(id)a3
{
  id v5 = a3;
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    double v4 = [(AVPlayerViewController *)self playerController];
    [v4 seekToBeginning:v5];
  }
}

- (void)_handleShowNextFrameKeyCommand:(id)a3
{
  id v5 = a3;
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    double v4 = [(AVPlayerViewController *)self playerController];
    [v4 seekFrameForward:v5];
  }
}

- (void)_handleSkipAhead15SecondsKeyCommand:(id)a3
{
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    double v4 = [(AVPlayerViewController *)self playerController];
    char v5 = objc_opt_respondsToSelector();

    id v8 = [(AVPlayerViewController *)self playerController];
    if (v5)
    {
      [v8 seekByTimeInterval:15.0 toleranceBefore:0.5 toleranceAfter:0.5];
    }
    else
    {
      id v6 = [(AVPlayerViewController *)self playerController];
      [v6 currentTime];
      [v8 seekToTime:v7 + 15.0];
    }
  }
}

- (void)_handleSkipBack15SecondsKeyCommand:(id)a3
{
  if (![(AVPlayerViewController *)self requiresLinearPlayback])
  {
    double v4 = [(AVPlayerViewController *)self playerController];
    char v5 = objc_opt_respondsToSelector();

    id v8 = [(AVPlayerViewController *)self playerController];
    if (v5)
    {
      [v8 seekByTimeInterval:-15.0 toleranceBefore:0.5 toleranceAfter:0.5];
    }
    else
    {
      id v6 = [(AVPlayerViewController *)self playerController];
      [v6 currentTime];
      [v8 seekToTime:v7 + -15.0];
    }
  }
}

- (void)_handlePlayPauseKeyCommand:(id)a3
{
}

- (void)_handleVideoGravityPinchGesture:(id)a3
{
  int v11 = self->_videoGravityPinchGestureRecognizer;
  double v4 = [(AVPlayerViewController *)self contentView];
  char v5 = [v4 layoutClass];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    [(UIPinchGestureRecognizer *)v11 scale];
    double v8 = v7;
    if (fabs(v7 + -1.0) >= 0.1)
    {
      id v9 = (id)*MEMORY[0x1E4F15AF0];
      if (v8 > 1.0)
      {
        id v10 = (id)*MEMORY[0x1E4F15AF8];

        id v9 = v10;
      }
      [(AVPlayerViewController *)self setVideoGravity:v9 forLayoutClass:v6];
    }
  }
}

- (void)_togglePlaybackForCenterTapGesture:(id)a3
{
  [(AVPlayerViewController *)self _handlePlaybackToggleNotificationForMetricsCollectionEvent];
  id v4 = [(AVPlayerViewController *)self playerController];
  [v4 togglePlayback:self];
}

- (void)_handleUserInteractionObservationRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(AVPlayerViewController *)self _beginTrackingUserInteraction];
  }
  else if ([v4 state] == 3)
  {
    [(AVPlayerViewController *)self _endTrackingUserInteraction];
  }
}

- (void)_handleSingleTapGesture:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[AVPlayerViewController _handleSingleTapGesture:]";
    __int16 v10 = 1024;
    int v11 = 3327;
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v8, 0x1Cu);
  }

  if ([(AVPlayerViewController *)self _canEnterFullScreen]
    && ([(AVPlayerViewController *)self playbackControlsController],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 entersFullScreenWhenTapped],
        v5,
        v6))
  {
    [(AVPlayerViewController *)self _transitionToFullScreenAnimated:1 interactive:0 completionHandler:0];
  }
  else
  {
    if ([(AVPlayerViewController *)self showsVisualLookup]) {
      [(AVPlayerViewController *)self setShowsVisualLookup:0];
    }
    double v7 = [(AVPlayerViewController *)self controlsViewController];
    [v7 toggleVisibility:self];
  }
}

- (void)_handleDoubleTapGesture:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 136315650;
    CGRect v47 = "-[AVPlayerViewController _handleDoubleTapGesture:]";
    __int16 v48 = 1024;
    int v49 = 3289;
    __int16 v50 = 2048;
    v51 = self;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v46, 0x1Cu);
  }

  BOOL v5 = [(AVPlayerViewController *)self isPresentedFullScreen]
    || [(AVPlayerViewController *)self isPresentingFullScreenFromInline]
    || [(AVPlayerViewController *)self canToggleVideoGravityWhenEmbeddedInline];
  int v6 = [(AVPlayerViewController *)self playerController];
  [v6 contentDimensions];
  double v8 = v7;
  double v10 = v9;

  if (v5)
  {
    int v11 = [(AVPlayerViewController *)self playbackControlsController];
    if (![v11 showsVideoGravityButton])
    {
      BOOL v13 = 0;
      goto LABEL_22;
    }
    __int16 v12 = [(AVPlayerViewController *)self playerController];
    BOOL v13 = 0;
    if ([v12 isExternalPlaybackActive])
    {
LABEL_21:

      goto LABEL_22;
    }

    BOOL v13 = 0;
    if (v10 > 0.0 && v8 > 0.0)
    {
      uint64_t v14 = [(AVPlayerViewController *)self fullScreenViewController];
      double v15 = [v14 view];
      double v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        id v17 = [(AVPlayerViewController *)self view];
      }
      int v11 = v17;

      [v11 bounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      v53.CGFloat width = v8;
      v53.CGFloat height = v10;
      v58.origin.CGFloat x = v19;
      v58.origin.CGFloat y = v21;
      v58.size.CGFloat width = v23;
      v58.size.CGFloat height = v25;
      CGRect v54 = AVMakeRectWithAspectRatioInsideRect(v53, v58);
      CGFloat width = v54.size.width;
      CGFloat height = v54.size.height;
      UIPointRoundToViewScale();
      CGFloat x = v55.origin.x;
      CGFloat y = v55.origin.y;
      v55.size.CGFloat width = width;
      v55.size.CGFloat height = height;
      CGRectGetWidth(v55);
      UIRoundToViewScale();
      CGFloat v31 = v30;
      v56.origin.CGFloat x = x;
      v56.origin.CGFloat y = y;
      v56.size.CGFloat width = v31;
      v56.size.CGFloat height = height;
      CGRectGetHeight(v56);
      UIRoundToViewScale();
      CGFloat v33 = v32;
      __int16 v12 = [(AVPlayerViewController *)self traitCollection];
      [v12 displayCornerRadius];
      double v35 = v34;

      if (v35 > 0.0)
      {
        __int16 v12 = [(AVPlayerViewController *)self contentView];
        if ([v12 isCoveringWindow])
        {
          BOOL v13 = 1;
          goto LABEL_21;
        }
      }
      [v11 bounds];
      v59.origin.CGFloat x = v36;
      v59.origin.CGFloat y = v37;
      v59.size.CGFloat width = v38;
      v59.size.CGFloat height = v39;
      v57.origin.CGFloat x = x;
      v57.origin.CGFloat y = y;
      v57.size.CGFloat width = v31;
      v57.size.CGFloat height = v33;
      BOOL v13 = !CGRectEqualToRect(v57, v59);
      if (v35 > 0.0) {
        goto LABEL_21;
      }
LABEL_22:
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  if (![(AVPictureInPictureController *)self->_pictureInPictureController isPictureInPictureActive]&& v13)
  {
    double v40 = [(AVPlayerViewController *)self contentView];
    double v41 = [v40 layoutClass];

    if (v41)
    {
      if ([(__AVPlayerLayerView *)self->_playerLayerView isVideoScaled]) {
        uint64_t v42 = 1;
      }
      else {
        uint64_t v42 = 2;
      }
      double v43 = NSStringFromVideoGravity(v42);
      double v44 = [(AVPlayerViewController *)self contentView];
      double v45 = [v44 layoutClass];
      -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v43, [v45 unsignedIntegerValue]);
    }
  }
}

- (id)keyCommands
{
  if ([(AVPlayerViewController *)self canControlPlayback])
  {
    float v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [(AVPlayerViewController *)self _localizedDiscoverabilityTitleForKeyCommandLocalizationKey];

    if (!v4)
    {
      BOOL v5 = [MEMORY[0x1E4F1CA60] dictionary];
      localizedDiscoverabilityTitleForKeyCommandLocalizationKeCGFloat y = self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey;
      self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKeCGFloat y = v5;
    }
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    double v20 = __37__AVPlayerViewController_keyCommands__block_invoke;
    CGFloat v21 = &unk_1E5FC2948;
    double v22 = self;
    id v7 = v3;
    id v23 = v7;
    double v8 = (void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void))MEMORY[0x1B3E963E0](&v18);
    ((void (**)(void, __CFString *, void, void, char *, void, __CFString *, __CFString *, uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *), void *, AVPlayerViewController *))v8)[2](v8, @" ", 0, 0, sel__handlePlayPauseKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_PLAY_PAUSE", @"Play/Pause keyboard command discoverability title", v18, v19, v20, v21, v22);
    double v9 = [(AVPlayerViewController *)self _volumeController];
    int v10 = [v9 currentRouteHasVolumeControl];

    if (v10)
    {
      ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), void, void, uint64_t, char *, char *, __CFString *, __CFString *))v8[2])(v8, *MEMORY[0x1E4FB2B98], 0, 1, sel__handleVolumeUpKeyPressedCommand_, sel__handleVolumeUpKeyReleasedCommand_, @"KEYBOARD_DISCOVERABILITY_VOLUME_UP", @"Volume up keyboard command discoverability title");
      ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), void, void, uint64_t, char *, char *, __CFString *, __CFString *))v8[2])(v8, *MEMORY[0x1E4FB2AF8], 0, 1, sel__handleVolumeDownKeyPressedCommand_, sel__handleVolumeDownKeyReleasedCommand_, @"KEYBOARD_DISCOVERABILITY_VOLUME_DOWN", @"Volume down keyboard command discoverability title");
    }
    int v11 = [(AVPlayerViewController *)self playerController];
    if (![(AVPlayerViewController *)self requiresLinearPlayback]
      && [v11 canSeek])
    {
      uint64_t v12 = *MEMORY[0x1E4FB2B78];
      ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), void, void, uint64_t, char *, void, __CFString *, __CFString *))v8[2])(v8, *MEMORY[0x1E4FB2B78], 0, 1, sel__handleSkipBack15SecondsKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_SKIP_BACK_15", @"Skip back 15 seconds keyboard command discoverability title");
      uint64_t v13 = *MEMORY[0x1E4FB2B90];
      ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), void, void, uint64_t, char *, void, __CFString *, __CFString *))v8[2])(v8, *MEMORY[0x1E4FB2B90], 0, 1, sel__handleSkipAhead15SecondsKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_SKIP_AHEAD_15", @"Skip ahead 15 seconds keyboard command discoverability title");
      if ([v11 canSeekToBeginning]) {
        ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, uint64_t, uint64_t, char *, void, __CFString *, __CFString *))v8[2])(v8, v12, 0x80000, 1, sel__handleGoToBeginningKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_GO_TO_BEGINNING", @"Go to beginning keyboard command discoverability title");
      }
      if ([v11 canScanBackward]) {
        ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, void, uint64_t, char *, char *, __CFString *, __CFString *))v8[2])(v8, v12, 0, 1, sel__handleRewindKeyPressedCommand_, sel__handleRewindKeyReleasedCommand_, @"KEYBOARD_DISCOVERABILITY_REWIND", @"Rewind keyboard command discoverability title");
      }
      if ([v11 canScanForward]) {
        ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, void, uint64_t, char *, char *, __CFString *, __CFString *))v8[2])(v8, v13, 0, 1, sel__handleFastForwardKeyPressedCommand_, sel__handleFastForwardKeyReleasedCommand_, @"KEYBOARD_DISCOVERABILITY_FAST_FORWARD", @"Fast forward keyboard command discoverability title");
      }
      if ([v11 canSeekFrameBackward]) {
        ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, uint64_t, uint64_t, char *, void, __CFString *, __CFString *))v8[2])(v8, v12, 0x20000, 1, sel__handleShowPreviousFrameKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_SHOW_PREVIOUS_FRAME", @"Show previous frame keyboard command discoverability title");
      }
      if ([v11 canSeekFrameForward]) {
        ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, uint64_t, uint64_t, char *, void, __CFString *, __CFString *))v8[2])(v8, v13, 0x20000, 1, sel__handleShowNextFrameKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_SHOW_NEXT_FRAME", @"Show next frame keyboard command discoverability title");
      }
    }
    uint64_t v14 = [(AVPlayerViewController *)self contentView];
    int v15 = [v14 isCoveringWindow];

    if (v15) {
      ((void (*)(void (**)(void, void, void, void, void, void, void, void, void, void, void, void, void), void, void, void, char *, void, __CFString *, __CFString *))v8[2])(v8, *MEMORY[0x1E4FB2B08], 0, 0, sel__handleExitFullScreenKeyCommand_, 0, @"KEYBOARD_DISCOVERABILITY_EXIT_FULLSCREEN", @"Exit full screen keyboard command discoverability title");
    }
    double v16 = (void *)[v7 copy];
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

void __37__AVPlayerViewController_keyCommands__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v15 = a2;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [*(id *)(a1 + 32) _localizedDiscoverabilityTitleForKeyCommandLocalizationKey];
  uint64_t v19 = [v18 objectForKeyedSubscript:v16];

  if (v19)
  {
    if (a6)
    {
      double v20 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v15 modifierFlags:a3 action:a5 upAction:a6 discoverabilityTitle:v19];
    }
    else
    {
      double v20 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v15 modifierFlags:a3 action:a5];
      [v20 setDiscoverabilityTitle:v19];
    }
    [v20 setWantsPriorityOverSystemBehavior:a4];
    [*(id *)(a1 + 40) addObject:v20];
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__AVPlayerViewController_keyCommands__block_invoke_2;
    v21[3] = &unk_1E5FC2920;
    objc_copyWeak(&v23, &location);
    id v22 = v16;
    AVAsynchronousLocalizedString(v22, v17, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __37__AVPlayerViewController_keyCommands__block_invoke_2(uint64_t a1, void *a2)
{
  float v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  BOOL v5 = [WeakRetained _localizedDiscoverabilityTitleForKeyCommandLocalizationKey];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setTransportBarCustomMenuItems:(NSArray *)transportBarCustomMenuItems
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  float v3 = transportBarCustomMenuItems;
  id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v5 = v3;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v14 = _AVLog();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_16;
            }
            id v15 = [v10 description];
            *(_DWORD *)long long buf = 136315394;
            id v26 = "-[AVPlayerViewController setTransportBarCustomMenuItems:]";
            __int16 v27 = 2112;
            uint64_t v28 = v15;
            id v16 = v14;
            id v17 = "%s Unsupported subclass of UIMenuElement. Only UIAction and UIMenu types are supported. Skipping: %@.";
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v10 title];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v10 image];

          if (v13)
          {
            uint64_t v14 = [v10 copy];
            [(NSArray *)v4 addObject:v14];
            goto LABEL_16;
          }
        }
        uint64_t v14 = _AVLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v10 description];
          *(_DWORD *)long long buf = 136315394;
          id v26 = "-[AVPlayerViewController setTransportBarCustomMenuItems:]";
          __int16 v27 = 2112;
          uint64_t v28 = v15;
          id v16 = v14;
          id v17 = "%s Unsupported custom menu item. Skipping %@. UIMenuElements must have both a title and an image.";
LABEL_15:
          _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
        }
LABEL_16:
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }

  controlsViewController = self->_controlsViewController;
  if (controlsViewController) {
    [(AVMobileControlsViewController *)controlsViewController setTransportBarCustomMenuItems:v4];
  }
  uint64_t v19 = self->_transportBarCustomMenuItems;
  self->_transportBarCustomMenuItems = v4;
}

- (int64_t)_preferredModalPresentationStyle
{
  if ([(AVPlayerViewController *)self _showsWolfControls]) {
    return -2;
  }
  else {
    return 0;
  }
}

- (id)transitioningDelegate
{
  if ([(AVPlayerViewController *)self _showsWolfControls])
  {
    v9.receiver = self;
    v9.super_class = (Class)AVPlayerViewController;
    float v3 = [(AVPlayerViewController *)&v9 transitioningDelegate];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerViewController;
    id v4 = [(AVPlayerViewController *)&v8 transitioningDelegate];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(AVPlayerViewController *)self _avkitPreferredTransitioningDelegate];
    }
    float v3 = v6;
  }

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  float v3 = [(AVPlayerViewController *)self presentationContext];
  if ([v3 isDismissing])
  {
    id v4 = [(AVPlayerViewController *)self presentationContext];
    BOOL v5 = [v4 rotatableWindowViewController];

    if (v5) {
      return 0;
    }
  }
  else
  {
  }
  uint64_t v7 = [(AVPlayerViewController *)self fullScreenViewController];
  objc_super v8 = [v7 viewIfLoaded];
  objc_super v9 = [v8 window];
  int v10 = [v9 windowScene];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = [(AVPlayerViewController *)self viewIfLoaded];
    uint64_t v14 = [v13 window];
    id v12 = [v14 windowScene];
  }
  if ([(AVPlayerViewController *)self prefersStatusBarHidden])
  {
    id v15 = [v12 statusBarManager];
    int64_t v6 = [v15 statusBarStyle];
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (BOOL)prefersStatusBarHidden
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  float v3 = [(AVPlayerViewController *)self fullScreenViewController];
  id v4 = [v3 viewIfLoaded];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(AVPlayerViewController *)self viewIfLoaded];
  }
  uint64_t v7 = v6;

  if ([(AVPlayerViewController *)self isPresentingFullScreenFromInline]) {
    goto LABEL_7;
  }
  uint64_t v8 = [(AVPlayerViewController *)self navigationController];
  if (!v8
    || (objc_super v9 = (void *)v8,
        [(AVPlayerViewController *)self navigationController],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isNavigationBarHidden],
        v10,
        v9,
        (v11 & 1) != 0))
  {
LABEL_7:
    id v12 = [(AVPlayerViewController *)self fullScreenViewController];
    if ([v12 isBeingDismissed])
    {
      uint64_t v13 = [(AVPlayerViewController *)self presentationContext];
      uint64_t v14 = [v13 rotatableWindowViewController];

      if (v14)
      {
        BOOL v15 = 0;
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([v7 isCounterRotatingContentView])
    {
      BOOL v15 = 1;
      goto LABEL_16;
    }
    unsigned int v16 = [(AVPlayerViewController *)self _controlsViewControllerPrefersStatusBarHidden];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)AVPlayerViewController;
    unsigned int v16 = [(AVPlayerViewController *)&v22 prefersStatusBarHidden];
  }
  BOOL v15 = v16;
LABEL_16:
  id v17 = _AVLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = "NO";
    *(_DWORD *)long long buf = 136315650;
    long long v24 = "-[AVPlayerViewController prefersStatusBarHidden]";
    id v26 = "prefersStatusBarHidden";
    __int16 v25 = 2080;
    if (v15) {
      uint64_t v18 = "YES";
    }
    __int16 v27 = 2080;
    uint64_t v28 = v18;
    _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  if (self->_currentPrefersStatusBarHidden != v15)
  {
    self->_currentPrefersStatusBarHidden = v15;
    uint64_t v19 = _AVLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = "NO";
      *(_DWORD *)long long buf = 136315650;
      long long v24 = "-[AVPlayerViewController prefersStatusBarHidden]";
      id v26 = "prefersStatusBarHidden";
      __int16 v25 = 2080;
      if (v15) {
        double v20 = "YES";
      }
      __int16 v27 = 2080;
      uint64_t v28 = v20;
      _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
    }
  }
  return v15;
}

- (BOOL)modalPresentationCapturesStatusBarAppearance
{
  if ([(AVPlayerViewController *)self _showsWolfControls]) {
    return 0;
  }
  if ([(AVPlayerViewController *)self _modalPresentationStyleIsFullScreen]) {
    return 1;
  }
  id v4 = [(AVPlayerViewController *)self contentView];
  char v5 = [v4 isCoveringWindow];

  return v5;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(AVPlayerViewController *)self _showsWolfControls])
  {
    v12.receiver = self;
    v12.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  }
  else
  {
    uint64_t v8 = [(AVPlayerViewController *)self contentView];
    objc_super v9 = [(AVPlayerViewController *)self viewIfLoaded];
    int v10 = [v8 isDescendantOfView:v9];

    if (v10) {
      -[AVPlayerViewController _contentViewWillTransitionToSize:withTransitionCoordinator:](self, "_contentViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    }
    v11.receiver = self;
    v11.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
    [(AVPlayerViewController *)(uint64_t)self _updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:height];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v8 = "-[AVPlayerViewController viewWillDisappear:]";
    __int16 v9 = 1024;
    int v10 = 2865;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v4 viewDidDisappear:a3];
  self->_playerViewControllerAnimated = 0;
  [(AVPlayerViewController *)self setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v14 = "-[AVPlayerViewController viewDidAppear:]";
    __int16 v15 = 1024;
    int v16 = 2815;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v12.receiver = self;
  v12.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v12 viewDidAppear:v3];
  objc_super v6 = [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView scrollingObserver];
  char v7 = [v6 isScrolling];

  if ((v7 & 1) == 0)
  {
    [(AVPlayerViewController *)self _updateViewControllerPreferencesIfNeeded];
    [(AVPlayerViewController *)self _updatePlaybackControlsState];
    if (self->_playerShouldAutoplay)
    {
      uint64_t v8 = [(AVPlayerViewController *)self playerController];
      [v8 autoplay:0];
    }
    [(AVPlayerViewController *)self setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:1];
    __int16 v9 = [(AVPlayerViewController *)self contentView];
    int v10 = [v9 playbackControlsView];

    if (!v10)
    {
      uint64_t v11 = [(AVPlayerViewController *)self contentView];
      [v11 setNeedsLayout];
    }
    [(AVPlayerViewController *)self updateVideoBounds];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v13 viewWillAppear:a3];
  objc_super v4 = [(AVPlayerViewController *)self transitionCoordinator];
  if ([v4 isAnimated]) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = 2;
  }
  self->_playerViewControllerAnimated = v5;

  if (!self->_controlsViewControllerHasBeenSetUp)
  {
    objc_super v6 = self->_playerViewControllerContentView;
    char v7 = [(AVPlayerViewController *)self controlsViewController];
    [(AVPlayerViewController *)self addChildViewController:v7];
    [(AVPlayerViewControllerContentView *)v6 setControlsViewController:v7];

    [v7 didMoveToParentViewController:self];
    self->_controlsViewControllerHasBeenSetUp = 1;
  }
  uint64_t v8 = [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView scrollingObserver];
  char v9 = [v8 isScrolling];

  if ((v9 & 1) == 0)
  {
    int v10 = [(AVPlayerViewController *)self transitionCoordinator];
    void v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__AVPlayerViewController_viewWillAppear___block_invoke;
    void v12[3] = &unk_1E5FC2C48;
    void v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__AVPlayerViewController_viewWillAppear___block_invoke_2;
    v11[3] = &unk_1E5FC2C48;
    [v10 animateAlongsideTransition:v12 completion:v11];

    [(AVPlayerViewController *)self _updatePlaybackControlsState];
  }
  -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
}

uint64_t __41__AVPlayerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewControllerPreferencesIfNeeded];
}

uint64_t __41__AVPlayerViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewControllerPreferencesIfNeeded];
}

void __34__AVPlayerViewController_loadView__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    objc_super v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Expected only one context for AVPlayerViewControllerBehaviorContext. This is fine, but probably means AVPlayerViewControllerBehaviorContext needs to be refactored", v15, 2u);
    }
  }
  uint64_t v5 = objc_msgSend(v3, "makePlaybackContentContainerWithFrame:activeContentView:", a1[4], *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v6 = *(void *)(a1[5] + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(a1[6] + 8);
  char v9 = *(void **)(v8 + 40);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v10;
  }
  else
  {
    uint64_t v11 = [*(id *)(*(void *)(a1[5] + 8) + 40) activeContentView];
    uint64_t v12 = [v11 playerLayerView];
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void __34__AVPlayerViewController_loadView__block_invoke_266(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 contentView];
  uint64_t v3 = [v2 overrideUserInterfaceStyle];

  [v4 setOverrideUserInterfaceStyle:v3];
}

- (void)performInitialSetupIfNeededAndPossible
{
  if ([(AVPlayerViewController *)self hasPerformedInitialSetup]) {
    return;
  }
  uint64_t v3 = [(AVPlayerViewController *)self pictureInPictureActivitySessionIdentifier];

  if ([(AVPlayerViewController *)self _showsWolfControls])
  {
    id v4 = [(AVPlayerViewController *)self view];
    uint64_t v5 = [v4 window];
    uint64_t v6 = v3 | v5;

    if (!v6) {
      return;
    }
    goto LABEL_11;
  }
  char v7 = [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView scrollingObserver];
  if ([v7 isScrolling])
  {
    BOOL v8 = 0;
  }
  else
  {
    char v9 = [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView window];
    BOOL v8 = v9 != 0;
  }
  if (v3 || v8)
  {
LABEL_11:
    -[AVPlayerViewController _performInitialSetup]((uint64_t)self);
  }
}

- (uint64_t)_performInitialSetup
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    kdebug_trace();
    if ([v1 hasPerformedInitialSetup])
    {
      id v2 = _AVLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_error_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_ERROR, "Already performed initial setup.", v11, 2u);
      }
    }
    [v1 setHasPerformedInitialSetup:1];
    int v3 = [v1 _showsWolfControls];
    [v1 _startPlayerLayerViewObservationsIfNeeded];
    id v4 = v1[188];
    if (v3)
    {
      id v5 = (id)[v4 startObserving:v1 keyPath:@"playerController.status" includeInitialValue:1 observationHandler:&__block_literal_global_542];
      uint64_t v6 = [v1 _behaviorStorage];
      [v6 enumerateAllBehaviorContextsImplementingSelector:sel_viewDidLoad forProtocol:&unk_1F0964880 usingBlock:&__block_literal_global_544];

      id v7 = (id)[v1 keyCommands];
    }
    else
    {
      id v8 = (id)[v4 startObserving:v1 keyPath:@"playerController.status" includeInitialValue:1 observationHandler:&__block_literal_global_546];
      [v1[188] startObservingNotificationForName:@"AVSecondScreenConnectionActiveDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_548];
      [v1[188] startObservingNotificationForName:*MEMORY[0x1E4FB2E70] object:v1 notificationCenter:0 observationHandler:&__block_literal_global_550];
      [v1[188] startObservingNotificationForName:*MEMORY[0x1E4FB2E60] object:v1 notificationCenter:0 observationHandler:&__block_literal_global_552];
      char v9 = [v1 _behaviorStorage];
      [v9 enumerateAllBehaviorContextsImplementingSelector:sel_viewDidLoad forProtocol:&unk_1F0964880 usingBlock:&__block_literal_global_554];

      id v10 = (id)[v1 keyCommands];
      -[AVPlayerViewController _setUpGestureRecognizersIfNeeded]((uint64_t)v1);
      -[AVPlayerViewController _setUpVideoFrameVisualAnalyzerIfNeeded]((uint64_t)v1);
      -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)v1);
      [v1 _setUpSecondScreenConnectionIfNeeded];
      -[AVPlayerViewController _setUpEnhanceDialogueControllerIfNeeded](v1);
      -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)v1);
      -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)v1, 0);
    }
    return kdebug_trace();
  }
  return result;
}

- (void)_setUpGestureRecognizersIfNeeded
{
  id v2 = [(id)a1 contentView];
  if (!v2)
  {
    int v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v33 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Content view should be loaded before attempting to add gesture recognizers to it.", v33, 2u);
    }
  }
  id v4 = [(id)a1 _transitionController];
  uint64_t v5 = *(void *)(a1 + 1184);
  uint64_t v6 = [(id)a1 contentView];
  if (v5 == 1)
  {
    -[AVPlayerViewController _attachContentTabPanGestureRecognizerIfNeeded]((id *)a1);
    id v7 = [[AVCenterTapGestureRecognizer alloc] initWithTarget:a1 action:sel__togglePlaybackForCenterTapGesture_];
    id v8 = *(void **)(a1 + 1736);
    *(void *)(a1 + 1736) = v7;

    [*(id *)(a1 + 1736) setDelegate:a1];
    [v6 addGestureRecognizer:*(void *)(a1 + 1736)];
    char v9 = [[AVScrubbingGesturePlatformAdapter_iOS alloc] initWithView:v6];
    id v10 = [[AVScrubbingGestureController alloc] initWithPlatformAdapter:v9];
    uint64_t v11 = *(void **)(a1 + 1144);
    *(void *)(a1 + 1144) = v10;

    [*(id *)(a1 + 1144) setDelegate:a1];
    uint64_t v12 = *(void **)(a1 + 1144);
    uint64_t v13 = [(id)a1 playerController];
    [v12 setPlayerController:v13];

    [*(id *)(a1 + 1144) setScrubsHaveMomentum:1];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:a1 action:sel__handleVideoGravityPinchGesture_];
    __int16 v15 = *(void **)(a1 + 1312);
    *(void *)(a1 + 1312) = v14;

    [v6 addGestureRecognizer:*(void *)(a1 + 1312)];
    -[AVPlayerViewController _updateScrubbingGestureEnabledState](a1);
  }
  else
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:a1 action:sel__handleDoubleTapGesture_];
    uint64_t v17 = *(void **)(a1 + 1296);
    *(void *)(a1 + 1296) = v16;

    [*(id *)(a1 + 1296) setDelegate:a1];
    [*(id *)(a1 + 1296) setNumberOfTapsRequired:2];
    [v6 addGestureRecognizer:*(void *)(a1 + 1296)];
  }

  if (!*(void *)(a1 + 1288))
  {
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:a1 action:sel__handleSingleTapGesture_];
    uint64_t v19 = *(void **)(a1 + 1288);
    *(void *)(a1 + 1288) = v18;

    [*(id *)(a1 + 1288) setDelegate:a1];
    if (*(void *)(a1 + 1296)) {
      objc_msgSend(*(id *)(a1 + 1288), "requireGestureRecognizerToFail:");
    }
    [v2 addGestureRecognizer:*(void *)(a1 + 1288)];
  }
  if (!*(void *)(a1 + 1304))
  {
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:a1 action:sel__handleDoubleTapTwoFingersGesture_];
    long long v21 = *(void **)(a1 + 1304);
    *(void *)(a1 + 1304) = v20;

    [*(id *)(a1 + 1304) setNumberOfTapsRequired:2];
    [*(id *)(a1 + 1304) setNumberOfTouchesRequired:2];
    [v2 addGestureRecognizer:*(void *)(a1 + 1304)];
  }
  if (!*(void *)(a1 + 1320))
  {
    objc_super v22 = [[AVExternalGestureRecognizerPreventer alloc] initWithTarget:0 action:0];
    long long v23 = *(void **)(a1 + 1320);
    *(void *)(a1 + 1320) = v22;

    [v2 addGestureRecognizer:*(void *)(a1 + 1320)];
  }
  if (!*(void *)(a1 + 1328))
  {
    long long v24 = [[AVUserInteractionObserverGestureRecognizer alloc] initWithTarget:a1 action:sel__handleUserInteractionObservationRecognizer_];
    __int16 v25 = *(void **)(a1 + 1328);
    *(void *)(a1 + 1328) = v24;

    [v2 addGestureRecognizer:*(void *)(a1 + 1328)];
  }
  if (!*(void *)(a1 + 1656))
  {
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:a1 action:sel__handleHoverGestureRecognizer_];
    __int16 v27 = *(void **)(a1 + 1656);
    *(void *)(a1 + 1656) = v26;

    [*(id *)(a1 + 1656) setDelegate:a1];
    [(id)a1 setHoverGestureRecognizer:*(void *)(a1 + 1656)];
    [v2 addGestureRecognizer:*(void *)(a1 + 1656)];
  }
  if (!*(void *)(a1 + 1664))
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:a1 action:sel__handleScrubbingGestureRecognizer_];
    [v28 setAllowedScrollTypesMask:2];
    [v28 _setiOSMacIgnoreScrollDirectionUserPreference:1];
    [v28 setDelegate:a1];
    [v28 setAllowedTouchTypes:&unk_1F094A2E0];
    [(id)a1 setScrubGestureRecognizer:v28];
    [v2 addGestureRecognizer:v28];
  }
  if (!*(void *)(a1 + 1336))
  {
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4FB21B8]) initWithTarget:a1 action:sel__handleScrubInteruptionGestureRecognizer_];
    uint64_t v30 = *(void **)(a1 + 1336);
    *(void *)(a1 + 1336) = v29;

    [v2 addGestureRecognizer:*(void *)(a1 + 1336)];
  }
  [v4 setInteractionView:v2];
  if (!*(void *)(a1 + 1344))
  {
    CGFloat v31 = objc_alloc_init(AVInteractiveTransitionGestureTracker);
    double v32 = *(void **)(a1 + 1344);
    *(void *)(a1 + 1344) = v31;

    [v4 setInteractiveGestureTracker:*(void *)(a1 + 1344)];
  }
  -[AVPlayerViewController _updateGesturesEnablementStates](a1);
}

- (void)_attachContentTabPanGestureRecognizerIfNeeded
{
  if (a1)
  {
    id v6 = [a1 contentView];
    id v2 = [a1[147] controlsViewControllerIfChromeless];
    int v3 = [v2 contentTabPanGestureRecognizer];

    if (v3)
    {
      id v4 = [v6 gestureRecognizers];
      char v5 = [v4 containsObject:v3];

      if ((v5 & 1) == 0) {
        [v6 addGestureRecognizer:v3];
      }
    }
  }
}

uint64_t __46__AVPlayerViewController__performInitialSetup__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 viewDidLoad];
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_7(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__AVPlayerViewController__performInitialSetup__block_invoke_8;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1017] = 0;
    id v2 = WeakRetained;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_5(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__AVPlayerViewController__performInitialSetup__block_invoke_6;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1017] = 0;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)WeakRetained);
    [WeakRetained _createPictureInPictureControllerIfNeeded];
  }
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = v8[136];
  id v6 = [a4 object];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    if ([v5 isActive]) {
      [v8 _didBeginPlayingOnSecondScreen];
    }
    else {
      [v8 _didEndPlayingOnSecondScreen];
    }
  }
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 _hasBegunObservation] & 1) == 0)
  {
    id v2 = [v7 playerController];
    if ([v2 hasContent])
    {
LABEL_5:

LABEL_6:
      [v7 _addObservers];
      id v4 = [v7 playbackControlsController];
      [v4 startUpdatesIfNeeded];

      goto LABEL_7;
    }
    id v3 = [v7 playerController];
    if ([v3 status] == 1)
    {

      goto LABEL_5;
    }
    id v5 = [v7 playerController];
    uint64_t v6 = [v5 status];

    if (v6 == 2) {
      goto LABEL_6;
    }
  }
LABEL_7:
  [v7 _updateUnsupportedContentIndicatorView];
}

uint64_t __46__AVPlayerViewController__performInitialSetup__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 viewDidLoad];
}

uint64_t __46__AVPlayerViewController__performInitialSetup__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v2 = [v9 _hasBegunObservation];
  id v3 = v9;
  if ((v2 & 1) == 0)
  {
    id v4 = [v9 playerController];
    if ([v4 hasContent])
    {
LABEL_5:

      id v3 = v9;
LABEL_6:
      uint64_t v2 = [v3 _addObservers];
      id v3 = v9;
      goto LABEL_7;
    }
    id v5 = [v9 playerController];
    if ([v5 status] == 1)
    {

      goto LABEL_5;
    }
    uint64_t v6 = [v9 playerController];
    uint64_t v7 = [v6 status];

    id v3 = v9;
    if (v7 == 2) {
      goto LABEL_6;
    }
  }
LABEL_7:

  return MEMORY[0x1F41817F8](v2, v3);
}

- (void)setImageAnalysis:(id)a3
{
  p_imageAnalysis = &self->_imageAnalysis;
  uint64_t v6 = (VKCImageAnalysis *)a3;
  id v9 = v6;
  if (*p_imageAnalysis != v6)
  {
    uint64_t v7 = +[AVKitGlobalSettings shared];
    char v8 = [v7 visualAnalysisSupported];

    if (v8)
    {
      objc_storeStrong((id *)&self->_imageAnalysis, a3);
      -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
      goto LABEL_6;
    }
    uint64_t v6 = *p_imageAnalysis;
  }
  *p_imageAnalysis = 0;

LABEL_6:
}

- (void)setAllowInfoMetadataSubpanel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[AVPlayerViewController setAllowInfoMetadataSubpanel:]";
    __int16 v11 = 1024;
    int v12 = 2535;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v9, 0x12u);
  }

  uint64_t v6 = +[AVKitGlobalSettings shared];
  if ([v6 isTVApp])
  {
  }
  else
  {
    uint64_t v7 = +[AVKitGlobalSettings shared];
    char v8 = [v7 isArtemisApp];

    if ((v8 & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Error: setAllowInfoMetadataSubpanel is only available on the TV app and the Artemis app."];
    }
  }
  if (self->_allowInfoMetadataSubpanel != v3)
  {
    self->_allowInfoMetadataSubpanel = v3;
    if (![(AVPlayerViewController *)self _showsWolfControls]) {
      -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)self);
    }
  }
}

- (void)setCustomInfoViewControllers:(NSArray *)customInfoViewControllers
{
  id v5 = customInfoViewControllers;
  p_customInfoViewControllers = &self->_customInfoViewControllers;
  if (self->_customInfoViewControllers != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_customInfoViewControllers, customInfoViewControllers);
    -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)self);
    -[AVPlayerViewController _attachContentTabPanGestureRecognizerIfNeeded]((id *)&self->super.super.super.isa);
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_customInfoViewControllers, v5);
}

- (NSArray)customInfoViewControllers
{
  return self->_customInfoViewControllers;
}

- (void)setLegibleContentInsets:(UIEdgeInsets)a3
{
  if (self->_legibleContentInsets.left != a3.left
    || self->_legibleContentInsets.top != a3.top
    || self->_legibleContentInsets.right != a3.right
    || self->_legibleContentInsets.bottom != a3.bottom)
  {
    self->_legibleContentInsets = a3;
    [(AVPlayerViewController *)self _updatePlayerLayerLegibleContentInsetsIfNeeded];
  }
}

- (void)setDefaultPlaybackRate:(double)a3
{
  id v4 = [(AVPlayerViewController *)self playerController];
  [v4 setDefaultPlaybackRate:a3];
}

- (void)setHoveringOverPlaybackControl:(BOOL)a3
{
  if (self->_hoveringOverPlaybackControl != a3)
  {
    self->_hoveringOverPlaybackControl = a3;
    [(AVPlayerViewController *)self _updatePlaybackControlsCanHideStateIfNeeded];
  }
}

- (UIViewController)viewControllerForFullScreenPresentation
{
  uint64_t v2 = [(AVPlayerViewController *)self contentView];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4FB1EC0] _viewControllerForFullScreenPresentationFromView:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (UIViewController *)v3;
}

- (id)_activeViewControllerForContentView
{
  BOOL v3 = [(AVPlayerViewController *)self fullScreenViewController];
  id v4 = [v3 associatedFullScreenViewController];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AVPlayerViewController *)self fullScreenViewController];
    char v8 = (void *)v7;
    if (v7) {
      int v9 = (AVPlayerViewController *)v7;
    }
    else {
      int v9 = self;
    }
    uint64_t v6 = v9;
  }

  return v6;
}

- (NSValue)overrideLayoutMarginsWhenEmbeddedInline
{
  return self->_overrideLayoutMarginsWhenEmbeddedInline;
}

- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3
{
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, a3);
  id v5 = a3;
  id v6 = [(AVPlayerViewController *)self _chromeControlsViewController];
  [v6 setEmbeddedInlineLayoutMargins:v5];
}

- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self playbackControlsController];
  [v5 setPlayButtonHandlerForLazyPlayerLoading:v4];
}

- (id)playButtonHandlerForLazyPlayerLoading
{
  uint64_t v2 = [(AVPlayerViewController *)self playbackControlsController];
  BOOL v3 = [v2 playButtonHandlerForLazyPlayerLoading];

  return v3;
}

- (void)setInfoViewActions:(NSArray *)infoViewActions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_infoViewActions != infoViewActions)
  {
    BOOL v3 = (void *)[(NSArray *)infoViewActions copy];
    if (!v3)
    {
      BOOL v3 = [(AVPlayerViewController *)self _defaultInfoViewActions];
    }
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(obj);
          }
          char v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          int v9 = [(AVPlayerViewController *)self controlsViewController];
          id v10 = [v9 controlsViewControllerIfChromeless];

          __int16 v11 = (void *)MEMORY[0x1E4FB13F0];
          int v12 = [v8 title];
          uint64_t v13 = [v8 image];
          uint64_t v14 = [v8 identifier];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          void v22[2] = __45__AVPlayerViewController_setInfoViewActions___block_invoke;
          v22[3] = &unk_1E5FC28B0;
          void v22[4] = v8;
          id v23 = v10;
          id v15 = v10;
          uint64_t v16 = [v11 actionWithTitle:v12 image:v13 identifier:v14 handler:v22];

          [(NSArray *)v20 addObject:v16];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v5);
    }

    uint64_t v17 = self->_infoViewActions;
    self->_infoViewActions = v20;
    uint64_t v18 = v20;

    [(AVInfoTabCoordinator *)self->_infoTabCoordinator setActions:self->_infoViewActions];
  }
}

void __45__AVPlayerViewController_setInfoViewActions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 sender];
  [v2 performWithSender:v3 target:0];

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AVPlayerViewController_setInfoViewActions___block_invoke_2;
    block[3] = &unk_1E5FC4698;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __45__AVPlayerViewController_setInfoViewActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissCustomInfoViewControllerAnimated:1];
}

- (void)setCustomControlItems:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_customControlItems, "isEqualToArray:"))
  {
    uint64_t v4 = (NSArray *)[v7 copy];
    customControlItems = self->_customControlItems;
    self->_customControlItems = v4;

    controlsViewController = self->_controlsViewController;
    if (controlsViewController) {
      [(AVMobileControlsViewController *)controlsViewController setControlItems:v7];
    }
  }
}

- (void)setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:(BOOL)a3
{
  if (self->_shouldUseNetworkingResourcesForLiveStreamingWhilePaused != a3)
  {
    BOOL v3 = a3;
    self->_shouldUseNetworkingResourcesForLiveStreamingWhilePaused = a3;
    uint64_t v4 = [(AVPlayerViewController *)self playerController];
    id v5 = v4;
    if (v3) {
      [v4 startUsingNetworkResourcesForLiveStreamingWhilePaused];
    }
    else {
      [v4 stopUsingNetworkResourcesForLiveStreamingWhilePaused];
    }
  }
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v11 = "-[AVPlayerViewController flashPlaybackControlsWithDuration:]";
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %f", buf, 0x16u);
  }

  double v6 = 2.0;
  if (a3 <= 2.0)
  {
    id v7 = _AVMethodProem(self);
    char v8 = [NSNumber numberWithDouble:a3];
    NSLog(&cfstr_WarningCalledW.isa, v7, v8);
  }
  else
  {
    double v6 = a3;
  }
  int v9 = [(AVPlayerViewController *)self controlsViewController];
  [v9 flashControlsWithDuration:v6];
}

- (void)setEntersFullScreenWhenPlaybackBegins:(BOOL)entersFullScreenWhenPlaybackBegins
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_entersFullScreenWhenPlaybackBegins != entersFullScreenWhenPlaybackBegins)
  {
    BOOL v3 = entersFullScreenWhenPlaybackBegins;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v8 = 136315650;
      int v9 = "-[AVPlayerViewController setEntersFullScreenWhenPlaybackBegins:]";
      __int16 v11 = "entersFullScreenWhenPlaybackBegins";
      __int16 v10 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v12 = 2080;
      double v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_entersFullScreenWhenPlaybackBegins = v3;
    id v7 = [(AVPlayerViewController *)self playbackControlsController];
    [v7 setEntersFullScreenWhenPlaybackBegins:v3];
  }
}

- (void)setVolumeControlsCanShowSlider:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = "NO";
    int v8 = 136315650;
    int v9 = "-[AVPlayerViewController setVolumeControlsCanShowSlider:]";
    __int16 v11 = "volumeControlsCanShowSlider";
    __int16 v10 = 2080;
    if (v3) {
      double v6 = "YES";
    }
    __int16 v12 = 2080;
    double v13 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

  id v7 = [(AVPlayerViewController *)self playbackControlsController];
  [v7 setVolumeControlsCanShowSlider:v3];
}

- (BOOL)volumeControlsCanShowSlider
{
  uint64_t v2 = [(AVPlayerViewController *)self playbackControlsController];
  char v3 = [v2 volumeControlsCanShowSlider];

  return v3;
}

- (void)_updateActuallyRequiresLinearPlayback
{
  uint64_t v3 = [(AVPlayerViewController *)self requiresLinearPlayback];
  uint64_t v4 = [(AVPlayerViewController *)self playerController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if ([(AVPlayerViewController *)self requiresLinearPlayback])
    {
      uint64_t v3 = 1;
    }
    else
    {
      double v6 = [(AVPlayerViewController *)self playerController];
      id v7 = [v6 interstitialController];
      int v8 = [v7 requiresLinearPlayback];

      uint64_t v3 = v8 | v3;
    }
  }

  [(AVPlayerViewController *)self setActuallyRequiresLinearPlayback:v3];
}

- (void)setRequiresLinearPlayback:(BOOL)requiresLinearPlayback
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_requiresLinearPlayback != requiresLinearPlayback)
  {
    BOOL v3 = requiresLinearPlayback;
    char v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlayerViewController setRequiresLinearPlayback:]";
      __int16 v10 = "requiresLinearPlayback";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_requiresLinearPlayback = v3;
    [(AVPlayerViewController *)self _updateActuallyRequiresLinearPlayback];
  }
}

- (void)setActuallyRequiresLinearPlayback:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_actuallyRequiresLinearPlayback != a3)
  {
    BOOL v3 = a3;
    char v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      *(_DWORD *)__int16 v11 = 136315650;
      *(void *)&void v11[4] = "-[AVPlayerViewController setActuallyRequiresLinearPlayback:]";
      *(void *)&v11[14] = "actuallyRequiresLinearPlayback";
      *(_WORD *)&v11[12] = 2080;
      if (v3) {
        double v6 = "YES";
      }
      *(_WORD *)&v11[22] = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v11, 0x20u);
    }

    self->_actuallyRequiresLinearPlayback = v3;
    if (![(AVPlayerViewController *)self _showsWolfControls])
    {
      [(AVMobileControlsViewController *)self->_controlsViewController setRequiresLinearPlayback:v3];
      int v7 = [(AVPlayerViewController *)self playbackControlsController];
      [v7 setRequiresLinearPlayback:v3];

      int v8 = [(AVPlayerViewController *)self playerController];
      [v8 setTouchBarRequiresLinearPlayback:v3];

      [(AVPictureInPictureController *)self->_pictureInPictureController setRequiresLinearPlayback:v3];
    }
    if (v3)
    {
      __int16 v9 = [(AVPlayerViewController *)self playerController];
      [v9 endScanningForward:self];

      __int16 v10 = [(AVPlayerViewController *)self playerController];
      [v10 endScanningBackward:self];
    }
    self->_float defaultLinearPlaybackRate = 1.0;
    [(AVPlayerViewController *)self _updateDefaultPlaybackRateIfNeeded];
    -[AVPlayerViewController _updateScrubbingGestureEnabledState]((uint64_t)self);
  }
}

- (BOOL)actuallyRequiresLinearPlayback
{
  return self->_actuallyRequiresLinearPlayback;
}

- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_showsMinimalPlaybackControlsWhenEmbeddedInline != a3)
  {
    BOOL v3 = a3;
    self->_showsMinimalPlaybackControlsWhenEmbeddedInline = a3;
    char v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v8 = 136315650;
      __int16 v9 = "-[AVPlayerViewController setShowsMinimalPlaybackControlsWhenEmbeddedInline:]";
      __int16 v11 = "showsMinimalPlaybackControlsWhenEmbeddedInline";
      __int16 v10 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v12 = 2080;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    int v7 = [(AVPlayerViewController *)self playbackControlsController];
    [v7 setShowsMinimalPlaybackControlsWhenEmbeddedInline:v3];
  }
}

- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline
{
  return self->_showsMinimalPlaybackControlsWhenEmbeddedInline;
}

- (void)setAllowsEnteringFullScreen:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_allowsEnteringFullScreen != a3)
  {
    BOOL v3 = a3;
    char v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlayerViewController setAllowsEnteringFullScreen:]";
      __int16 v10 = "allowsEnteringFullScreen";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_allowsEnteringFullScreen = v3;
    if (![(AVPlayerViewController *)self _showsWolfControls])
    {
      [(AVMobileControlsViewController *)self->_controlsViewController setShowsFullScreenControl:v3];
      [(AVPlayerViewController *)self _updatePlaybackControlsState];
    }
  }
}

- (void)setCanHidePlaybackControls:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_canHidePlaybackControls != a3)
  {
    BOOL v3 = a3;
    char v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlayerViewController setCanHidePlaybackControls:]";
      __int16 v10 = "canHidePlaybackControls";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_canHidePlaybackControls = v3;
    [(AVPlayerViewController *)self _updatePlaybackControlsCanHideStateIfNeeded];
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
  }
}

- (BOOL)canControlPlayback
{
  if ([(AVPlayerViewController *)self showsPlaybackControls]) {
    return 1;
  }

  return [(AVPlayerViewController *)self hasCustomPlaybackControls];
}

- (void)_updateCustomControlsViewSuperViewIfNeeded
{
  if (self->_customControlsView)
  {
    [(AVPlayerViewController *)self loadViewIfNeeded];
    id v3 = [(AVPlayerViewController *)self contentView];
    [v3 setCustomControlsView:self->_customControlsView];
  }
}

- (AVPlayerViewControllerCustomControlsView)customControlsView
{
  if (!self->_customControlsView)
  {
    id v3 = objc_alloc_init(AVPlayerViewControllerCustomControlsView);
    customControlsView = self->_customControlsView;
    self->_customControlsView = v3;

    [(AVPlayerViewControllerCustomControlsView *)self->_customControlsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AVPlayerViewControllerCustomControlsView *)self->_customControlsView setEdgesInsettingLayoutMarginsFromSafeArea:0];
    [(AVPlayerViewController *)self _updateCustomControlsViewStateWithVisibleControlsSet:0];
  }
  [(AVPlayerViewController *)self _updateCustomControlsViewSuperViewIfNeeded];
  char v5 = self->_customControlsView;

  return v5;
}

- (id)interactiveContentOverlayView
{
  [(AVPlayerViewController *)self loadViewIfNeeded];
  id v3 = [(AVPlayerViewController *)self contentView];
  uint64_t v4 = [v3 interactiveContentOverlayView];

  return v4;
}

- (void)setPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes
{
  char v5 = pixelBufferAttributes;
  if ([(AVPlayerViewController *)self isViewLoaded])
  {
    [(__AVPlayerLayerView *)self->_playerLayerView setPixelBufferAttributes:v5];
  }
  else
  {
    uint64_t v4 = (NSDictionary *)[(NSDictionary *)v5 copy];

    char v5 = self->_pixelBufferAttributes;
    self->_pixelBufferAttributes = v4;
  }
}

- (NSDictionary)pixelBufferAttributes
{
  if ([(AVPlayerViewController *)self isViewLoaded])
  {
    id v3 = [(__AVPlayerLayerView *)self->_playerLayerView pixelBufferAttributes];
  }
  else
  {
    id v3 = self->_pixelBufferAttributes;
  }

  return v3;
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_overrideParentApplicationDisplayIdentifier isEqualToString:v4])
  {
    char v5 = (NSString *)[v4 copy];
    overrideParentApplicationDisplayIdentifier = self->_overrideParentApplicationDisplayIdentifier;
    self->_overrideParentApplicationDisplayIdentifier = v5;

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__AVPlayerViewController_setOverrideParentApplicationDisplayIdentifier___block_invoke;
    v7[3] = &unk_1E5FC2888;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    +[AVNowPlayingInfoController sharedNowPlayingInfoControllerWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __72__AVPlayerViewController_setOverrideParentApplicationDisplayIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [v4 setOverrideParentApplicationDisplayIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)setShowsTimecodes:(BOOL)showsTimecodes
{
  BOOL v3 = showsTimecodes;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_showsTimecodes = showsTimecodes;
  char v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = "YES";
    BOOL v7 = !self->_showsTimecodes;
    int v8 = 136315650;
    id v9 = "-[AVPlayerViewController setShowsTimecodes:]";
    __int16 v11 = "_showsTimecodes";
    __int16 v10 = 2080;
    if (v7) {
      double v6 = "NO";
    }
    __int16 v12 = 2080;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

  [(AVPlaybackControlsController *)self->_playbackControlsController setShowsTimecodes:v3];
}

- (void)selectSpeed:(AVPlaybackSpeed *)speed
{
}

- (AVPlaybackSpeed)selectedSpeed
{
  return [(AVPlaybackSpeedCollection *)self->_playbackSpeedCollection selectedSpeed];
}

- (NSArray)speeds
{
  return [(AVPlaybackSpeedCollection *)self->_playbackSpeedCollection speeds];
}

void __46__AVPlayerViewController_setPlayerController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 playerController];
  BOOL v3 = [v4 pipActivitySessionIdentifier];
  [v2 setPictureInPictureActivitySessionIdentifier:v3];
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)allowsPictureInPicturePlayback
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_allowsPictureInPicturePlayback != allowsPictureInPicturePlayback)
  {
    BOOL v3 = allowsPictureInPicturePlayback;
    char v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      *(_DWORD *)int v8 = 136315650;
      *(void *)&void v8[4] = "-[AVPlayerViewController setAllowsPictureInPicturePlayback:]";
      *(void *)&v8[14] = "allowsPictureInPicturePlayback";
      *(_WORD *)&v8[12] = 2080;
      if (v3) {
        double v6 = "YES";
      }
      *(_WORD *)&v8[22] = 2080;
      id v9 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v8, 0x20u);
    }

    self->_allowsPictureInPicturePlayback = v3;
    if ([(AVPlayerViewController *)self isViewLoaded])
    {
      [(AVPlayerViewController *)self _updatePlaybackControlsState];
      [(AVPictureInPictureController *)self->_pictureInPictureController setAllowsPictureInPicturePlayback:v3];
    }
    if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground_, *(_OWORD *)v8, *(void *)&v8[16]))
    {
      BOOL v7 = [(AVPlayerViewController *)self delegate];
      -[AVPlayerViewController setCanStartPictureInPictureAutomaticallyFromInline:](self, "setCanStartPictureInPictureAutomaticallyFromInline:", [v7 playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground:self]);
    }
    if ([(AVPlayerViewController *)self isPictureInPictureActive])
    {
      if (!v3) {
        [(AVPlayerViewController *)self stopPictureInPicture];
      }
    }
  }
}

- (void)setShowsAnalysisButtonIfAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = +[AVKitGlobalSettings shared];
  int v6 = [v5 visualAnalysisSupported];

  if (v6)
  {
    if (self->_showsAnalysisButtonIfAvailable != v3)
    {
      self->_showsAnalysisButtonIfAvailable = v3;
      -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
    }
  }
  else
  {
    self->_showsAnalysisButtonIfAvailable = 0;
  }
}

- (void)setAllowsVideoFrameAnalysis:(BOOL)allowsVideoFrameAnalysis
{
  BOOL v3 = allowsVideoFrameAnalysis;
  char v5 = +[AVKitGlobalSettings shared];
  int v6 = [v5 visualAnalysisSupported];

  if (v6)
  {
    if (self->_allowsVideoFrameAnalysis != v3)
    {
      self->_BOOL allowsVideoFrameAnalysis = v3;
      -[AVPlayerViewController _setUpVideoFrameVisualAnalyzerIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
      -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
      -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](self);
      -[AVPlayerViewController _updateShowsAnalysisControl]((uint64_t)self);
      -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updateVisualAnalysisViewHiddenState]((uint64_t)self);
    }
  }
  else
  {
    BOOL v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Video frame analysis is not supported on this device or platform.", v8, 2u);
    }

    self->_BOOL allowsVideoFrameAnalysis = 0;
  }
}

- (UIView)contentOverlayView
{
  [(AVPlayerViewController *)self loadViewIfNeeded];
  if (!self->_contentOverlayView)
  {
    BOOL v3 = objc_alloc_init(AVTouchIgnoringView);
    [(AVTouchIgnoringView *)v3 setAutoresizingMask:0];
    contentOverlayView = self->_contentOverlayView;
    self->_contentOverlayView = &v3->super;
  }
  [(AVPlayerViewController *)self _updateContentOverlayViewSuperview];
  char v5 = self->_contentOverlayView;

  return v5;
}

- (double)videoDisplayScale
{
  BOOL v3 = [(__AVPlayerLayerView *)self->_playerLayerView traitCollection];
  [v3 displayScale];
  double v5 = v4;

  [(AVPlayerViewController *)self secondScreenConnectionDisplaySize];
  if (*MEMORY[0x1E4F1DB30] != v7 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v6)
  {
    [(AVSecondScreenConnection *)self->_secondScreenConnection videoDisplayScale];
    double v5 = v9;
  }
  double result = 1.0;
  if (v5 >= 1.0) {
    return v5;
  }
  return result;
}

- (CGSize)videoDisplaySize
{
  [(AVPlayerViewController *)self secondScreenConnectionDisplaySize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v8 = *MEMORY[0x1E4F1DB30] == v3 && v7 == v6;
  if (v8
    && ([(AVPlayerViewController *)self playerController],
        double v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 externalPlaybackType],
        v9,
        v10 != 1))
  {
    playerLayerView = self->_playerLayerView;
    [(__AVPlayerLayerView *)playerLayerView videoDisplaySize];
  }
  else
  {
    double v11 = v4;
    double v12 = v6;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UIAction)toggleLookupAction
{
  toggleLookupAction = self->_toggleLookupAction;
  if (!toggleLookupAction)
  {
    -[AVPlayerViewController _setupToggleVisualLookupActionIfNeeded]((uint64_t)self);
    toggleLookupAction = self->_toggleLookupAction;
  }

  return toggleLookupAction;
}

- (void)setVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    uint64_t v17 = "-[AVPlayerViewController setVideoGravity:forLayoutClass:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ layoutClass: %ld", (uint8_t *)&v16, 0x20u);
  }

  BOOL v8 = [(AVPlayerViewController *)self _targetVideoGravitiesForLayoutClass];
  double v9 = [NSNumber numberWithUnsignedInteger:a4];
  [v8 setObject:v6 forKeyedSubscript:v9];

  uint64_t v10 = [(AVPlayerViewController *)self contentView];
  [v10 setTargetVideoGravity:v6 forLayoutClass:a4];

  double v11 = [(AVPlayerViewController *)self contentView];
  uint64_t v12 = [v11 window];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    playerLayerView = self->_playerLayerView;
    id v15 = [(AVPlayerViewController *)self contentView];
    LOBYTE(playerLayerView) = [(__AVPlayerLayerView *)playerLayerView isDescendantOfView:v15];

    if ((playerLayerView & 1) == 0) {
      [(__AVPlayerLayerView *)self->_playerLayerView setVideoGravity:AVVideoGravityFromString(v6)];
    }
  }
  else
  {
  }
}

- (AVVideoFrameAnalysisType)videoFrameAnalysisTypes
{
  return self->_videoFrameAnalysisTypes;
}

- (void)setVideoFrameAnalysisTypes:(AVVideoFrameAnalysisType)videoFrameAnalysisTypes
{
  double v5 = +[AVKitGlobalSettings shared];
  int v6 = [v5 extendedVisualAnalysisEnabled];

  if (v6)
  {
    if (self->_videoFrameAnalysisTypes != videoFrameAnalysisTypes)
    {
      self->_videoFrameAnalysisTypes = videoFrameAnalysisTypes;
      -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes]((uint64_t)self);
      if (self->_videoFrameAnalysisTypes == 1) {
        unint64_t v7 = 30;
      }
      else {
        unint64_t v7 = self->_videoFrameAnalysisTypes;
      }
      videoFrameVisualAnalyzer = self->_videoFrameVisualAnalyzer;
      [(AVVideoFrameVisualAnalyzer *)videoFrameVisualAnalyzer setVideoFrameAnalysisTypes:v7];
    }
  }
  else
  {
    self->_videoFrameAnalysisTypes = 2;
  }
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  double v5 = videoGravity;
  if (![(AVPlayerViewController *)self _showsWolfControls])
  {
    self->_hasClientSetVideoGravitCGFloat y = 1;
    double v4 = [(AVPlayerViewController *)self contentView];
    [v4 setCanAutomaticallyZoomLetterboxVideos:0];

    self->_videoGravitCGFloat y = AVVideoGravityFromString(v5);
    [(AVPlayerViewController *)self setVideoGravity:v5 forLayoutClass:0];
    [(AVPlayerViewController *)self setVideoGravity:v5 forLayoutClass:1];
    [(AVPlayerViewController *)self setVideoGravity:v5 forLayoutClass:2];
  }
}

- (void)setShowsAudioLanguageMenu:(BOOL)a3
{
  if (self->_showsAudioLanguageMenu != a3)
  {
    BOOL v3 = a3;
    self->_showsAudioLanguageMenu = a3;
    id v5 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
    [v5 setShowsAudioTrackSelectionMenu:v3];
    -[AVPlayerViewController _updateEnhanceDialogueEnabled](self);
  }
}

- (void)setCanIncludePlaybackControlsWhenInline:(BOOL)a3
{
  if (self->_canIncludePlaybackControlsWhenInline != a3)
  {
    self->_canIncludePlaybackControlsWhenInline = a3;
    double v4 = [(AVPlayerViewController *)self playbackControlsController];
    objc_msgSend(v4, "setCanIncludePlaybackControlsWhenInline:", -[AVPlayerViewController canIncludePlaybackControlsWhenInline](self, "canIncludePlaybackControlsWhenInline"));

    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
  }
}

- (void)setShowsPlaybackControls:(BOOL)showsPlaybackControls
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_showsPlaybackControls != showsPlaybackControls)
  {
    BOOL v3 = showsPlaybackControls;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = "NO";
      int v9 = 136315650;
      uint64_t v10 = "-[AVPlayerViewController setShowsPlaybackControls:]";
      uint64_t v12 = "showsPlaybackControls";
      __int16 v11 = 2080;
      if (v3) {
        int v6 = "YES";
      }
      __int16 v13 = 2080;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
    }

    self->_showsPlaybackControls = v3;
    unint64_t v7 = [(AVPlayerViewController *)self playbackControlsController];
    [v7 setShowsPlaybackControls:self->_showsPlaybackControls];

    BOOL v8 = [(AVPlayerViewController *)self contentView];
    [v8 setShowsPlaybackControls:self->_showsPlaybackControls];

    [(AVPlayerViewController *)self _updateContentOverlayViewSuperview];
    -[AVPlayerViewController _updateAnalysisViewSuperview](self);
    -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
    -[AVPlayerViewController _setupInfoTabViewController]((id *)&self->super.super.super.isa);
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
    [(AVPlayerViewController *)self _updateSecondScreenConnectionReadyToConnect];
    -[AVPlayerViewController _updateEnhanceDialogueEnabled](self);
  }
}

- (void)setPrefersDeviceUserInterfaceStyle:(BOOL)a3
{
  if (self->_prefersDeviceUserInterfaceStyle != a3)
  {
    self->_prefersDeviceUserInterfaceStyle = a3;
    id v4 = [(AVPlayerViewController *)self contentView];
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", -[AVPlayerViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
  }
}

- (AVPlayerViewControllerConfiguration)configuration
{
  id v2 = (void *)[(AVPlayerViewControllerConfiguration *)self->_configuration copy];

  return (AVPlayerViewControllerConfiguration *)v2;
}

- (void)setConfiguration:(id)a3
{
  if (self->_configuration != a3)
  {
    id v4 = (AVPlayerViewControllerConfiguration *)[a3 copy];
    configuration = self->_configuration;
    self->_configuration = v4;

    -[AVPlayerViewController _updateExcludedControls]((uint64_t)self);
    -[AVPlayerViewController _updatePrefersFullScreenStyleForEmbeddedMode]((uint64_t)self);
  }
}

- (void)setRequiresImmediateAssetInspection:(BOOL)a3
{
  if (self->_requiresImmediateAssetInspection != a3)
  {
    self->_requiresImmediateAssetInspection = a3;
    -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
  }
}

- (void)setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption != a3)
  {
    self->_int64_t preferredPlaybackControlsSupplementalSubtitleDisplayOption = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      unint64_t v7 = "-[AVPlayerViewController setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:]";
      __int16 v8 = 2048;
      int64_t v9 = a3;
      __int16 v10 = 2112;
      __int16 v11 = self;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %ld for AVPVC: %@", (uint8_t *)&v6, 0x20u);
    }

    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](self, 0);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    int64_t v9 = "-[AVPlayerViewController encodeWithCoder:]";
    __int16 v10 = 1024;
    int v11 = 758;
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v7 encodeWithCoder:v4];
  [v4 encodeBool:self->_showsPlaybackControls forKey:@"AVShowsPlaybackControls"];
  if ([(AVPlayerViewController *)self isViewLoaded]) {
    videoGravitCGFloat y = [(__AVPlayerLayerView *)self->_playerLayerView videoGravity];
  }
  else {
    videoGravitCGFloat y = self->_videoGravity;
  }
  [v4 encodeInteger:videoGravity forKey:@"AVVideoLayerGravity"];
  [v4 encodeBool:self->_allowsPictureInPicturePlayback forKey:@"AVAllowsPictureInPicturePlayback"];
  [v4 encodeBool:self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground forKey:@"AVCanStartPictureInPictureAutomaticallyWhenEnteringBackground"];
  [v4 encodeBool:self->_allowsVideoFrameAnalysis forKey:@"AVAllowsVideoFrameVisualAnalysis"];
  [v4 encodeBool:self->_showsAnalysisButtonIfAvailable forKey:@"AVShowsAnalysisButtonIfAvailable"];
  [v4 encodeBool:self->_allowsEnteringFullScreen forKey:@"AVAllowsEnteringFullScreen"];
  [v4 encodeInteger:self->_videoFrameAnalysisTypes forKey:@"AVVideoFrameAnalysisTypes"];
  [v4 encodeBool:self->_showsVisualLookup forKey:@"AVShowsVisualLookup"];
}

- (AVPlayerViewController)initWithCoder:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v51 = "-[AVPlayerViewController initWithCoder:]";
    __int16 v52 = 1024;
    int v53 = 615;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v49.receiver = self;
  v49.super_class = (Class)AVPlayerViewController;
  int v6 = [(AVPlayerViewController *)&v49 initWithCoder:v4];
  if (v6)
  {
    if ([v4 containsValueForKey:@"AVPlayerAssetFilename"])
    {
      player = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AVPlayerAssetFilename"];
      __int16 v8 = [MEMORY[0x1E4F28B50] mainBundle];
      int64_t v9 = [v8 URLForMovieResource:player];

      if (!v9)
      {
        __int16 v10 = 0;
LABEL_12:

        goto LABEL_13;
      }
      __int16 v10 = [MEMORY[0x1E4F16608] playerWithURL:v9];

      if (v10)
      {
        int v11 = [[AVPlayerController alloc] initWithPlayer:v10];
        playerController = v6->_playerController;
        v6->_playerController = v11;

        if (objc_opt_respondsToSelector()) {
          [(AVPlayerController *)v6->_playerController setInternalDelegate:v6];
        }
        __int16 v10 = v10;
        player = v6->_player;
        v6->_player = v10;
        goto LABEL_12;
      }
    }
    else
    {
      __int16 v10 = 0;
    }
LABEL_13:
    __int16 v13 = +[AVPlaybackSpeed systemDefaultSpeeds];
    uint64_t v14 = +[AVPlaybackSpeedCollection collectionWithSpeeds:v13];
    playbackSpeedCollection = v6->_playbackSpeedCollection;
    v6->_playbackSpeedCollection = (AVPlaybackSpeedCollection *)v14;

    [(AVPlaybackSpeedCollection *)v6->_playbackSpeedCollection setDelegate:v6];
    int v16 = [v4 containsValueForKey:@"AVPlayerShouldAutoplay"];
    if (v16) {
      LOBYTE(v16) = [v4 decodeBoolForKey:@"AVPlayerShouldAutoplay"];
    }
    v6->_playerShouldAutoplaCGFloat y = v16;
    if ([v4 containsValueForKey:@"AVShowsPlaybackControls"]) {
      char v17 = [v4 decodeBoolForKey:@"AVShowsPlaybackControls"];
    }
    else {
      char v17 = 1;
    }
    v6->_showsPlaybackControls = v17;
    if ([v4 containsValueForKey:@"AVVideoLayerGravity"]) {
      uint64_t v18 = [v4 decodeIntegerForKey:@"AVVideoLayerGravity"];
    }
    else {
      uint64_t v18 = 1;
    }
    v6->_videoGravitCGFloat y = v18;
    if ([v4 containsValueForKey:@"AVAllowsPictureInPicturePlayback"]) {
      char v19 = [v4 decodeBoolForKey:@"AVAllowsPictureInPicturePlayback"];
    }
    else {
      char v19 = dyld_program_sdk_at_least();
    }
    v6->_allowsPictureInPicturePlayback = v19;
    int v20 = [v4 containsValueForKey:@"AVWantsDetachedFullscreenPresentation"];
    if (v20) {
      LOBYTE(v20) = [v4 decodeBoolForKey:@"AVWantsDetachedFullscreenPresentation"];
    }
    v6->_wantsDetachedFullscreenPresentation = v20;
    int v21 = [v4 containsValueForKey:@"AVCanDisplayContentInDetachedWindow"];
    if (v21) {
      LOBYTE(v21) = [v4 decodeBoolForKey:@"AVCanDisplayContentInDetachedWindow"];
    }
    v6->_canDisplayContentInDetachedWindow = v21;
    if ([v4 containsValueForKey:@"AVCanStartPictureInPictureAutomaticallyWhenEnteringBackground"])char v22 = objc_msgSend(v4, "decodeBoolForKey:", @"AVCanStartPictureInPictureAutomaticallyWhenEnteringBackground"); {
    else
    }
      char v22 = 1;
    v6->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = v22;
    if ([v4 containsValueForKey:@"AVAllowsVideoFrameVisualAnalysis"])
    {
      char v23 = [v4 decodeBoolForKey:@"AVAllowsVideoFrameVisualAnalysis"];
    }
    else
    {
      long long v24 = +[AVKitGlobalSettings shared];
      char v23 = [v24 visualAnalysisEnabled];
    }
    v6->_BOOL allowsVideoFrameAnalysis = v23;
    if ([v4 containsValueForKey:@"AVShowsAnalysisButtonIfAvailable"]) {
      char v25 = [v4 decodeBoolForKey:@"AVShowsAnalysisButtonIfAvailable"];
    }
    else {
      char v25 = 1;
    }
    v6->_showsAnalysisButtonIfAvailable = v25;
    if ([v4 containsValueForKey:@"AVAllowsEnteringFullScreen"]) {
      char v26 = [v4 decodeBoolForKey:@"AVAllowsEnteringFullScreen"];
    }
    else {
      char v26 = 1;
    }
    v6->_allowsEnteringFullScreen = v26;
    int v27 = [v4 containsValueForKey:@"AVShowsVisualLookup"];
    if (v27) {
      LOBYTE(v27) = [v4 decodeBoolForKey:@"AVShowsVisualLookup"];
    }
    v6->_BOOL showsVisualLookup = v27;
    v6->_videoFrameAnalysisTypes = 0;
    uint64_t v28 = +[AVKitGlobalSettings shared];
    int v29 = [v28 extendedVisualAnalysisEnabled];

    int v30 = [v4 containsValueForKey:@"AVVideoFrameAnalysisTypes"];
    if (v29) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2;
    }
    v6->_videoFrameAnalysisTypes = v31;
    if (v30) {
      v6->_videoFrameAnalysisTypes = [v4 decodeIntegerForKey:@"AVVideoFrameAnalysisTypes"];
    }
    v6->_updatesNowPlayingInfoCenter = 1;
    v6->_canPausePlaybackWhenExitingFullScreen = 1;
    v6->_canPausePlaybackWhenClosingPictureInPicture = 1;
    v6->_controlsGeneration = [(id)objc_opt_class() usesSecondGenerationControls];
    v6->_playbackControlsShouldControlSystemVolume = 1;
    v6->_showsAudioLanguageMenu = 1;
    v6->_canShowPictureInPictureButton = 1;
    v6->_canIncludePlaybackControlsWhenInline = 1;
    v6->_canHidePlaybackControls = 1;
    double v32 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v6->_overrideTransformForProminentPlayButton.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v33 = v32[1];
    *(_OWORD *)&v6->_overrideTransformForProminentPlayButton.a = *v32;
    *(_OWORD *)&v6->_overrideTransformForProminentPlayButton.c = v33;
    v6->_canToggleVideoGravityWhenEmbeddedInline = 1;
    v6->_float defaultLinearPlaybackRate = 1.0;
    uint64_t v34 = +[AVRoutingConfiguration defaultConfiguration];
    routingConfiguration = v6->_routingConfiguration;
    v6->_routingConfiguration = (AVRoutingConfiguration *)v34;

    uint64_t v36 = +[AVPlayerViewControllerConfiguration defaultConfiguration];
    configuration = v6->_configuration;
    v6->_configuration = (AVPlayerViewControllerConfiguration *)v36;

    CGFloat v38 = +[AVKitGlobalSettings shared];
    int v39 = [v38 quickLookModernPlayerControlsEnabled];

    if (v39)
    {
      [(AVPlayerViewController *)v6 setPrefersDeviceUserInterfaceStyle:1];
      [(AVPlayerViewControllerConfiguration *)v6->_configuration setPrefersFullScreenStyleForEmbeddedMode:1];
    }
    uint64_t v40 = [(AVPlayerViewController *)v6 _defaultInfoViewActions];
    infoViewActions = v6->_infoViewActions;
    v6->_infoViewActions = (NSArray *)v40;

    v6->_allowInfoMetadataSubpanel = 1;
    v6->_playbackControlsIncludeTransportControls = 1;
    v6->_playbackControlsIncludeDisplayModeControls = 1;
    v6->_playbackControlsIncludeVolumeControls = 1;
    v6->_playerViewControllerAnimated = 0;
    v6->_playerLayerViewObservationsHasBeenSetup = 0;
    uint64_t v42 = [[AVObservationController alloc] initWithOwner:v6];
    observationController = v6->_observationController;
    v6->_observationController = v42;

    [(AVObservationController *)v6->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2E78] object:v6 notificationCenter:0 observationHandler:&__block_literal_global_112];
    [(AVObservationController *)v6->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2E68] object:v6 notificationCenter:0 observationHandler:&__block_literal_global_114_8571];
    double v44 = [(AVPlayerViewController *)v6 _avkitPreferredTransitioningDelegate];
    [(AVPlayerViewController *)v6 setTransitioningDelegate:v44];

    double v45 = [MEMORY[0x1E4F28B50] mainBundle];
    int v46 = [v45 bundleIdentifier];
    int v47 = [v46 isEqualToString:@"com.apple.podcasts"];

    if (v47) {
      v6->_wantsDetachedFullscreenPresentation = 0;
    }
    v6->_isUpdatingSecondScreenConnectionReadyToConnect = 0;
  }
  return v6;
}

void __40__AVPlayerViewController_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = v2;
  if (v2)
  {
    *((unsigned char *)v2 + 1017) = 1;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)v2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerViewController_initWithCoder___block_invoke_4;
  block[3] = &unk_1E5FC4698;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __40__AVPlayerViewController_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVPlayerViewController _avkitWillBeginPresentationTransition](v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerViewController_initWithCoder___block_invoke_2;
  block[3] = &unk_1E5FC4698;
  id v5 = v2;
  BOOL v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_avkitWillBeginPresentationTransition
{
  if (a1)
  {
    id v2 = [a1 controlsViewController];
    [(id)objc_opt_class() autoHideInterval];
    objc_msgSend(v2, "flashControlsWithDuration:");
    a1[1017] = 1;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)a1);
  }
}

void __40__AVPlayerViewController_initWithCoder___block_invoke_2(uint64_t a1)
{
}

- (void)_avkitDidBeginPresentationTransition
{
  if (a1)
  {
    if (a1[170] == 2
      || ([a1 transitioningDelegate],
          id v2 = objc_claimAutoreleasedReturnValue(),
          [a1 _transitionController],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v2,
          v2 != v3))
    {
      id v5 = [a1 _transitionController];
      id v4 = [a1 presentingViewController];
      [v5 ensurePresentationControllerWithPresentingViewController:v4 presentedViewController:a1];
    }
  }
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[AVPlayerViewController dealloc]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 563;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  [(AVNowPlayingInfoController *)self->_nowPlayingInfoController stopNowPlayingUpdatesForPlayerController:self->_playerController];
  if (![(AVPlayerViewController *)self _showsWolfControls])
  {
    id v4 = [(AVPlayerViewController *)self fullScreenViewController];
    id v5 = [v4 presentingViewController];
    if (v5)
    {
      id v6 = [(AVPlayerViewController *)self fullScreenViewController];
      char v7 = [v6 isBeingDismissed];

      if ((v7 & 1) == 0)
      {
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__8501;
        char v19 = __Block_byref_object_dispose__8502;
        id v20 = [(AVPlayerViewController *)self fullScreenViewController];
        v16[0] = 0;
        v16[1] = v16;
        v16[2] = 0x3032000000;
        v16[3] = __Block_byref_object_copy__8501;
        void v16[4] = __Block_byref_object_dispose__8502;
        id v17 = [(AVPlayerViewController *)self _transitionController];
        __int16 v8 = [(AVPlayerViewController *)self _transitionController];
        int64_t v9 = [(AVPlayerViewController *)self fullScreenViewController];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __33__AVPlayerViewController_dealloc__block_invoke;
        v15[3] = &unk_1E5FC2860;
        void v15[4] = v16;
        void v15[5] = buf;
        [v8 beginFullScreenDismissalOfViewController:v9 animated:0 isInteractive:0 completion:v15];

        NSLog(&cfstr_WarningWasDeal.isa, self);
        _Block_object_dispose(v16, 8);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
    }
    [(AVPlaybackControlsController *)self->_playbackControlsController setPlayerController:0];
    [(__AVPlayerLayerView *)self->_playerLayerView setPlayerController:0];
  }
  [(AVPictureInPictureController *)self->_pictureInPictureController invalidate];
  __int16 v10 = [(AVPlayerViewController *)self _observationController];
  [v10 stopAllObservation];

  int v11 = [(AVPlayerViewController *)self _pipActivitySessionObservationController];
  [v11 stopAllObservation];

  if (self->_secondScreenConnection)
  {
    __int16 v12 = +[AVSecondScreenController sharedInstance];
    [v12 removeConnection:self->_secondScreenConnection];

    secondScreenConnection = self->_secondScreenConnection;
    self->_secondScreenConnection = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)AVPlayerViewController;
  [(AVPlayerViewController *)&v14 dealloc];
}

void __33__AVPlayerViewController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __49__AVPlayerViewController_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  -[AVPlayerViewController _avkitWillBeginPresentationTransition](v2);
  objc_initWeak(&location, v2);

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__AVPlayerViewController_initWithNibName_bundle___block_invoke_2;
  v3[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__AVPlayerViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    -[AVPlayerViewController _avkitDidBeginPresentationTransition](WeakRetained);
    id WeakRetained = v2;
  }
}

+ (id)keyPathsForValuesAffectingAnalysisInteractionInProgress
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"analysisView.interactionInProgress"];
}

+ (id)keyPathsForValuesAffectingToggleLookupAction
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"analysisView.hasVisualLookupResults"];
}

+ (id)keyPathsForValuesAffectingTransportBarCustomMenuItems
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"playbackControlsController.transportBarCustomMenuItems"];
}

+ (id)keyPathsForValuesAffectingPictureInPictureActive
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"pictureInPictureController.pictureInPictureActive"];
}

+ (id)keyPathsForValuesAffectingPixelBufferAttributes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"_playerLayerView.pixelBufferAttributes"];
}

+ (id)keyPathsForValuesAffectingSelectedSpeed
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playbackSpeedCollection.selectedSpeed", 0);
}

+ (id)keyPathsForValuesAffectingSpeeds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playbackSpeedCollection.speeds", 0);
}

+ (id)keyPathsForValuesAffectingVideoDisplaySize
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F094A2C8];
}

+ (id)keyPathsForValuesAffectingVideoGravity
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"playerLayerView.videoGravity"];
}

- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playbackControlsIncludeVolumeControls != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      __int16 v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPlaybackControlsIncludeVolumeControls:]";
      __int16 v10 = "playbackControlsIncludeVolumeControls";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsIncludeVolumeControls = v3;
    [(AVPlayerViewController *)self _updateIncludedControls];
  }
}

- (BOOL)playbackControlsIncludeVolumeControls
{
  return self->_playbackControlsIncludeVolumeControls;
}

- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playbackControlsIncludeDisplayModeControls != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      __int16 v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPlaybackControlsIncludeDisplayModeControls:]";
      __int16 v10 = "playbackControlsIncludeDisplayModeControls";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsIncludeDisplayModeControls = v3;
    [(AVPlayerViewController *)self _updateIncludedControls];
  }
}

- (BOOL)playbackControlsIncludeDisplayModeControls
{
  return self->_playbackControlsIncludeDisplayModeControls;
}

- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playbackControlsIncludeTransportControls != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      __int16 v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPlaybackControlsIncludeTransportControls:]";
      __int16 v10 = "playbackControlsIncludeTransportControls";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsIncludeTransportControls = v3;
    [(AVPlayerViewController *)self _updateIncludedControls];
    -[AVPlayerViewController _updateEnhanceDialogueEnabled](self);
  }
}

- (void)setEntersFullScreenWhenTapped:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    int v7 = 136315650;
    __int16 v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setEntersFullScreenWhenTapped:]";
    __int16 v10 = "entersFullScreenWhenTapped";
    __int16 v9 = 2080;
    if (v3) {
      id v6 = "YES";
    }
    __int16 v11 = 2080;
    __int16 v12 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  [(AVPlayerViewController *)self setShowsMinimalPlaybackControlsWhenEmbeddedInline:v3];
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_preferredUnobscuredArea != a3)
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      __int16 v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPreferredUnobscuredArea:]";
      __int16 v9 = 2048;
      int64_t v10 = a3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v7, 0x16u);
    }

    self->_preferredUnobscuredArea = a3;
    id v6 = [(AVPlayerViewController *)self playbackControlsController];
    [v6 setPreferredUnobscuredArea:a3];
  }
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (double)defaultPlaybackRate
{
  uint64_t v2 = [(AVPlayerViewController *)self playerController];
  [v2 defaultPlaybackRate];
  double v4 = v3;

  return v4;
}

- (void)setWebKitOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  id v5 = +[AVRoutingConfiguration configurationWithOutputContextID:a4 sharingPolicy:a3];
  routingConfiguration = self->_routingConfiguration;
  self->_routingConfiguration = v5;

  controlsViewController = self->_controlsViewController;
  __int16 v8 = self->_routingConfiguration;

  [(AVMobileControlsViewController *)controlsViewController setRoutingConfiguration:v8];
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  return [(AVPictureInPictureController *)self->_pictureInPictureController pictureInPictureWasStartedWhenEnteringBackground];
}

- (BOOL)isPictureInPictureSuspended
{
  return [(AVPictureInPictureController *)self->_pictureInPictureController isPictureInPictureSuspended];
}

- (void)stopPictureInPicture
{
}

- (void)startPictureInPicture
{
}

- (void)exitFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a4;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    double v35 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) exitFullScreenAnimated:completionHandler:]";
    __int16 v36 = 1024;
    int v37 = 8757;
    __int16 v38 = 2048;
    int v39 = self;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  __int16 v8 = [(AVPlayerViewController *)self finishPreparingForInteractiveDismissalHandler];
  __int16 v9 = (void (**)(void))[v8 copy];

  [(AVPlayerViewController *)self setFinishPreparingForInteractiveDismissalHandler:0];
  int64_t v10 = [(AVPlayerViewController *)self fullScreenViewController];
  int v11 = [v10 isBeingDismissed];

  if (v11 && v9)
  {
    [(AVPlayerViewController *)self setInteractiveDismissalCompletionHandler:v6];
    v9[2](v9);
    goto LABEL_18;
  }
  if (![(AVPlayerViewController *)self isViewLoaded]) {
    goto LABEL_15;
  }
  __int16 v12 = [(AVPlayerViewController *)self view];
  uint64_t v13 = [v12 superview];
  if (!v13 && ![(AVPlayerViewController *)self isPresentingDetachedFullScreen])
  {

    goto LABEL_15;
  }
  BOOL v14 = [(AVPlayerViewController *)self isPresentingFullScreenFromInline];

  if (!v14)
  {
LABEL_15:
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    char v25 = NSString;
    id v20 = _AVMethodProem(self);
    uint64_t v21 = [v25 stringWithFormat:@"View needs to be loaded before you can call %@!", v20];
    uint64_t v31 = v21;
    char v22 = (void *)MEMORY[0x1E4F1C9E8];
    char v23 = &v31;
    long long v24 = &v30;
LABEL_17:
    char v26 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    int v27 = [v18 errorWithDomain:@"AVKitErrorDomain" code:0 userInfo:v26];
    v6[2](v6, 0, v27);

    goto LABEL_18;
  }
  uint64_t v15 = [(AVPlayerViewController *)self view];
  int v16 = [v15 layer];
  int v17 = [v16 needsLayout];

  if (!v17)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __102__AVPlayerViewController_AVPlayerViewController_WebKitOnly__exitFullScreenAnimated_completionHandler___block_invoke;
    v28[3] = &unk_1E5FC2A50;
    int v29 = v6;
    [(AVPlayerViewController *)self _transitionFromFullScreenAnimated:v4 completionHandler:v28];

    goto LABEL_18;
  }
  if (v6)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    char v19 = NSString;
    id v20 = _AVMethodProem(self);
    uint64_t v21 = [v19 stringWithFormat:@"View may not need layout when you call %@!", v20];
    long long v33 = v21;
    char v22 = (void *)MEMORY[0x1E4F1C9E8];
    char v23 = &v33;
    long long v24 = &v32;
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __102__AVPlayerViewController_AVPlayerViewController_WebKitOnly__exitFullScreenAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)enterFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v30 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) enterFullScreenAnimated:completionHandler:]";
    __int16 v31 = 1024;
    int v32 = 8730;
    __int16 v33 = 2048;
    uint64_t v34 = self;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  if ([(AVPlayerViewController *)self isViewLoaded]
    && ([(AVPlayerViewController *)self view],
        __int16 v8 = objc_claimAutoreleasedReturnValue(),
        [v8 superview],
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    int64_t v10 = [(AVPlayerViewController *)self view];
    int v11 = [v10 layer];
    int v12 = [v11 needsLayout];

    if (!v12)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __103__AVPlayerViewController_AVPlayerViewController_WebKitOnly__enterFullScreenAnimated_completionHandler___block_invoke;
      v23[3] = &unk_1E5FC2A50;
      id v24 = v6;
      [(AVPlayerViewController *)self _transitionToFullScreenAnimated:v4 interactive:0 completionHandler:v23];
      uint64_t v15 = v24;
      goto LABEL_12;
    }
    if (v6)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      BOOL v14 = NSString;
      uint64_t v15 = _AVMethodProem(self);
      int v16 = [v14 stringWithFormat:@"View may not need layout when you call %@!", v15];
      uint64_t v28 = v16;
      int v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = &v28;
      char v19 = &v27;
LABEL_10:
      uint64_t v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
      char v22 = [v13 errorWithDomain:@"AVKitErrorDomain" code:0 userInfo:v21];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v22);

LABEL_12:
    }
  }
  else if (v6)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    id v20 = NSString;
    uint64_t v15 = _AVMethodProem(self);
    int v16 = [v20 stringWithFormat:@"View needs to be loaded before you can call %@!", v15];
    char v26 = v16;
    int v17 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v18 = &v26;
    char v19 = &v25;
    goto LABEL_10;
  }
}

uint64_t __103__AVPlayerViewController_AVPlayerViewController_WebKitOnly__enterFullScreenAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPlaybackControlsShouldControlSystemVolume:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playbackControlsShouldControlSystemVolume != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      __int16 v8 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) setPlaybackControlsShouldControlSystemVolume:]";
      int64_t v10 = "playbackControlsShouldControlSystemVolume";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      int v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsShouldControlSystemVolume = v3;
    [(AVPlayerViewController *)self _updateVolumeController];
    [(AVMobileControlsViewController *)self->_controlsViewController setVolumeController:self->_volumeController];
  }
}

- (BOOL)playbackControlsShouldControlSystemVolume
{
  return self->_playbackControlsShouldControlSystemVolume;
}

- (BOOL)showsExitFullScreenButton
{
  return 0;
}

- (AVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self initWithNibName:0 bundle:0];
  id v6 = v5;
  if (v5)
  {
    [(AVPlayerViewController *)v5 setWasInitializedUsingWebKitSPI:1];
    [(AVPlayerViewController *)v6 setCanDisplayContentInDetachedWindow:0];
    [(AVPlayerViewController *)v6 setPlayerLayerView:v4];
    uint64_t v7 = +[AVRoutingConfiguration defaultConfiguration];
    routingConfiguration = v6->_routingConfiguration;
    v6->_routingConfiguration = (AVRoutingConfiguration *)v7;

    uint64_t v9 = +[AVPlayerViewControllerConfiguration defaultConfiguration];
    configuration = v6->_configuration;
    v6->_configuration = (AVPlayerViewControllerConfiguration *)v9;

    __int16 v11 = +[AVKitGlobalSettings shared];
    int v12 = [v11 quickLookModernPlayerControlsEnabled];

    if (v12)
    {
      [(AVPlayerViewController *)v6 setPrefersDeviceUserInterfaceStyle:1];
      [(AVPlayerViewControllerConfiguration *)v6->_configuration setPrefersFullScreenStyleForEmbeddedMode:1];
    }
    v6->_canIncludePlaybackControlsWhenInline = 0;
    v6->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = 1;
    v6->_showsAnalysisButtonIfAvailable = 1;
    v6->_allowInfoMetadataSubpanel = 1;
    v6->_playbackControlsIncludeTransportControls = 1;
    v6->_playbackControlsIncludeDisplayModeControls = 1;
    v6->_playbackControlsIncludeVolumeControls = 1;
    v6->_controlsGeneration = [(id)objc_opt_class() usesSecondGenerationControls];
    uint64_t v13 = +[AVKitGlobalSettings shared];
    v6->_BOOL allowsVideoFrameAnalysis = [v13 visualAnalysisEnabled];

    v6->_videoFrameAnalysisTypes = 0;
    uint64_t v14 = [(AVPlayerViewController *)v6 _defaultInfoViewActions];
    infoViewActions = v6->_infoViewActions;
    v6->_infoViewActions = (NSArray *)v14;

    int v16 = +[AVKitGlobalSettings shared];
    int v17 = [v16 extendedVisualAnalysisEnabled];

    if (v17) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    v6->_videoFrameAnalysisTypes = v18;
    char v19 = _AVLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315394;
      char v22 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) initWithPlayerLayerView:]";
      __int16 v23 = 1024;
      int v24 = 8699;
      _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v21, 0x12u);
    }
  }
  return v6;
}

- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  p_overrideTransformForProminentPlayButton = &self->_overrideTransformForProminentPlayButton;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_overrideTransformForProminentPlayButton->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_overrideTransformForProminentPlayButton->tCGFloat x = v9;
    *(_OWORD *)&p_overrideTransformForProminentPlayButton->a = v8;
    int64_t v10 = [(AVPlayerViewController *)self _chromeControlsViewController];
    long long v11 = *(_OWORD *)&p_overrideTransformForProminentPlayButton->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_overrideTransformForProminentPlayButton->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&p_overrideTransformForProminentPlayButton->tx;
    [v10 setTransformForProminentPlayButton:&t1];
  }
}

- (void)setCanToggleVideoGravityWhenEmbeddedInline:(BOOL)a3
{
  self->_canToggleVideoGravityWhenEmbeddedInline = a3;
}

- (CGAffineTransform)overrideTransformForProminentPlayButton
{
  long long v3 = *(_OWORD *)&self[25].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[25].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[26].a;
  return self;
}

- (BOOL)canToggleVideoGravityWhenEmbeddedInline
{
  return self->_canToggleVideoGravityWhenEmbeddedInline;
}

- (UIView)iAdPrerollView
{
  uint64_t v2 = [(AVPlayerViewController *)self contentView];
  long long v3 = [v2 iAdPreRollView];

  return (UIView *)v3;
}

- (AVPresentationContext)presentationContext
{
  uint64_t v2 = [(AVPlayerViewController *)self _transitionController];
  long long v3 = [v2 presentationContext];

  return (AVPresentationContext *)v3;
}

- (BOOL)isPresentingFullWindow
{
  BOOL v3 = [(AVPlayerViewController *)self _showsWolfControls];
  if (v3)
  {
    id v4 = [(AVPlayerViewController *)self view];
    id v5 = [v4 window];

    if (v5)
    {
      long long v6 = [(AVPlayerViewController *)self view];
      long long v7 = [v6 window];
      long long v8 = [(AVPlayerViewController *)self view];
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      int v17 = [(AVPlayerViewController *)self view];
      objc_msgSend(v7, "convertRect:fromView:", v17, v10, v12, v14, v16);

      UIPointRoundToScale();
      UISizeRoundToScale();
      double v19 = v18;
      double v21 = v20;
      char v22 = [(AVPlayerViewController *)self view];
      __int16 v23 = [v22 window];
      [v23 bounds];
      double v25 = v24;
      double v27 = v26;

      LOBYTE(v3) = v21 == v27 && v19 == v25;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isPresentingDetachedFullScreen
{
  return 0;
}

- (void)setCanDisplayContentInDetachedWindow:(BOOL)a3
{
  self->_canDisplayContentInDetachedWindow = a3;
}

- (BOOL)canDisplayContentInDetachedWindow
{
  return self->_canDisplayContentInDetachedWindow;
}

- (BOOL)hasActiveTransition
{
  if (([(AVPlayerViewController *)self isBeingDismissed] & 1) != 0
    || ([(AVPlayerViewController *)self isBeingPresented] & 1) != 0)
  {
    return 1;
  }
  id v4 = [(AVPlayerViewController *)self _transitionControllerIfLoaded];
  id v5 = [v4 presentationContext];
  char v6 = [v5 hasActiveTransition];

  return v6;
}

- (void)setControlsGeneration:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_controlsGeneration != a3)
  {
    self->_controlsGeneration = a3;
    if (self->_controlsViewController)
    {
      id v4 = _AVLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        controlsViewController = self->_controlsViewController;
        int v11 = 136315394;
        double v12 = "-[AVPlayerViewController _updateControlsViewController]";
        __int16 v13 = 2112;
        double v14 = controlsViewController;
        _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Removing from AVPlayerViewController hierarchy, AVMobileControlsViewController: %@", (uint8_t *)&v11, 0x16u);
      }

      [(AVMobileControlsViewController *)self->_controlsViewController willMoveToParentViewController:0];
      char v6 = [(AVMobileControlsViewController *)self->_controlsViewController view];
      [v6 removeFromSuperview];

      [(AVMobileControlsViewController *)self->_controlsViewController removeFromParentViewController];
      -[AVPlayerViewController _createPreferredControlsViewController]((uint64_t)self);
      long long v7 = (AVMobileControlsViewController *)objc_claimAutoreleasedReturnValue();
      long long v8 = self->_controlsViewController;
      self->_controlsViewController = v7;

      double v9 = _AVLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = self->_controlsViewController;
        int v11 = 136315394;
        double v12 = "-[AVPlayerViewController _updateControlsViewController]";
        __int16 v13 = 2112;
        double v14 = v10;
        _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s Updated AVMobileControlsViewController to: %@", (uint8_t *)&v11, 0x16u);
      }

      [(AVPlayerViewControllerContentView *)self->_playerViewControllerContentView setControlsViewController:self->_controlsViewController];
      -[AVPlayerViewController _setUpGestureRecognizersIfNeeded]((uint64_t)self);
      [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setEnabled:self->_controlsGeneration == 0];
      -[AVPlayerViewController _updateSecondGenerationControlsGestureEnablementStates]((uint64_t)self);
      -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);
      -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
      -[AVPlayerViewController _updateControlsViewControllerInitialState]((uint64_t)self);
    }
  }
}

- (int64_t)controlsGeneration
{
  return self->_controlsGeneration;
}

- (void)setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground != a3)
  {
    BOOL v3 = a3;
    self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = "NO";
      int v7 = 136315650;
      long long v8 = "-[AVPlayerViewController(AVPlayerViewControllerInternal) setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:]";
      double v10 = "canStartPictureInPictureAutomaticallyWhenEnteringBackground";
      __int16 v9 = 2080;
      if (v3) {
        char v6 = "YES";
      }
      __int16 v11 = 2080;
      double v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    [(AVPlayerViewController *)self _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground];
  }
}

- (BOOL)canStartPictureInPictureAutomaticallyWhenEnteringBackground
{
  return self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground;
}

- (void)activeContentViewDidChange
{
  BOOL v3 = [(AVPlayerViewController *)self contentView];
  id v4 = [v3 playbackContentContainerView];
  id v5 = [v4 activeContentView];
  char v6 = [v5 playerLayerView];
  int v7 = [v6 playerLayer];
  long long v8 = [v7 videoGravity];
  [(AVPlayerViewController *)self setVideoGravity:v8];

  __int16 v9 = [(AVPlayerViewController *)self contentView];
  double v10 = [v9 playbackContentContainerView];
  __int16 v11 = [v10 activeContentView];
  double v12 = [v11 playerLayerView];
  [(AVPlayerViewController *)self setPlayerLayerView:v12];

  id v14 = [(__AVPlayerLayerView *)self->_playerLayerView playerLayer];
  uint64_t v13 = [v14 player];
  [(AVPlayerViewController *)self setPlayer:v13];
}

- (BOOL)canShowPictureInPictureButton
{
  return self->_canShowPictureInPictureButton;
}

- (void)setCanShowPictureInPictureButton:(BOOL)a3
{
  if (self->_canShowPictureInPictureButton != a3)
  {
    self->_canShowPictureInPictureButton = a3;
    [(AVPlayerViewController *)self _updatePlaybackControlsState];
  }
}

- (void)exitFullscreen:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v13 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) exitFullscreen:]";
    __int16 v14 = 1024;
    int v15 = 9047;
    __int16 v16 = 2048;
    int v17 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke;
  v10[3] = &unk_1E5FC4220;
  objc_copyWeak(&v11, (id *)buf);
  char v6 = (void (**)(void, void))MEMORY[0x1B3E963E0](v10);
  int v7 = [(AVPlayerViewController *)self fullScreenViewController];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    __int16 v9 = [(AVPlayerViewController *)self player];
    +[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:v9 cancellable:1 dismissalBlock:v6];
  }
  else
  {
    v6[2](v6, 0);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke(uint64_t a1, char a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && (a2 & 1) == 0)
  {
    WeakRetained[1012] = 1;
    [WeakRetained _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground];
    char v6 = [v5 _transitionController];
    int v7 = [v6 presentationContext];
    BOOL v8 = [v7 presentedViewController];
    if (v8)
    {
    }
    else
    {
      char v9 = [v5 isPresentingDetachedFullScreen];

      if ((v9 & 1) == 0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_3;
        v11[3] = &unk_1E5FC2BD8;
        double v10 = &v12;
        objc_copyWeak(&v12, v3);
        [v5 _transitionFromFullScreenAnimated:1 completionHandler:v11];
        goto LABEL_7;
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_2;
    v13[3] = &unk_1E5FC2BD8;
    double v10 = &v14;
    objc_copyWeak(&v14, v3);
    [v5 _transitionFromFullScreenWithReason:0 animated:1 completionHandler:v13];
LABEL_7:
    objc_destroyWeak(v10);
  }
}

void __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1012] = 0;
    uint64_t v2 = WeakRetained;
    [WeakRetained _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground];
    id WeakRetained = v2;
  }
}

void __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1012] = 0;
    uint64_t v2 = WeakRetained;
    [WeakRetained _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground];
    id WeakRetained = v2;
  }
}

- (void)toggleMuted:(id)a3
{
  [(AVPlayerViewController *)self _volumeButtonWasPressedEvent:a3];
  id v4 = [(AVPlayerViewController *)self playbackControlsController];
  [v4 toggleMuted];
}

- (void)pictureInPictureButtonTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    char v6 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) pictureInPictureButtonTapped:]";
    __int16 v7 = 1024;
    int v8 = 9034;
    __int16 v9 = 2048;
    double v10 = self;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v5, 0x1Cu);
  }

  [(AVPlayerViewController *)self _togglePictureInPicture];
}

- (void)enterFullScreen:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    char v6 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) enterFullScreen:]";
    __int16 v7 = 1024;
    int v8 = 9018;
    __int16 v9 = 2048;
    double v10 = self;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v5, 0x1Cu);
  }

  [(AVPlayerViewController *)self _transitionToFullScreenAnimated:1 interactive:0 completionHandler:0];
}

- (void)mediaSelectionButtonTapped:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315650;
    char v22 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) mediaSelectionButtonTapped:]";
    __int16 v23 = 1024;
    int v24 = 8996;
    __int16 v25 = 2048;
    double v26 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v21, 0x1Cu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [AVMediaSelectionViewController alloc];
    __int16 v7 = [(AVPlayerViewController *)self playerController];
    int v8 = [(AVMediaSelectionViewController *)v6 initWithPlayerController:v7 doneButtonTarget:self doneButtonAction:sel__mediaSelectionDoneButtonTapped_];

    __int16 v9 = [(AVMediaSelectionViewController *)v8 popoverPresentationController];
    objc_storeWeak((id *)&self->_mediaSelectionPopoverPresentationController, v9);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
    [WeakRetained setBackgroundColor:v11];

    id v12 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    [v12 setDelegate:self];

    id v13 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    [v13 setPermittedArrowDirections:15];

    id v14 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    [v4 bounds];
    objc_msgSend(v14, "setSourceRect:");

    id v15 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    [v15 setSourceView:v4];

    __int16 v16 = [(AVPlayerViewController *)self parentViewController];
    if (v16)
    {
      [(AVMediaSelectionViewController *)v8 _setIgnoreAppSupportedOrientations:0];
    }
    else
    {
      int v17 = [(AVPlayerViewController *)self fullScreenViewController];
      [(AVMediaSelectionViewController *)v8 _setIgnoreAppSupportedOrientations:v17 == 0];
    }
    uint64_t v18 = [(AVMediaSelectionViewController *)v8 mediaSelectionTableViewController];
    objc_msgSend(v18, "_setIgnoreAppSupportedOrientations:", -[AVMediaSelectionViewController _ignoreAppSupportedOrientations](v8, "_ignoreAppSupportedOrientations"));

    double v19 = [(AVPlayerViewController *)self playbackControlsController];
    [v19 setPopoverIsBeingPresented:1];

    double v20 = [(AVPlayerViewController *)self _activeViewControllerForContentView];
    [v20 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)togglePlayback:(id)a3
{
  id v4 = a3;
  [(AVPlayerViewController *)self _playPauseButtonWasPressedEvent:v4];
  id v5 = [(AVPlayerViewController *)self playerController];
  [v5 togglePlayback:v4];
}

- (void)videoGravityButtonTapped:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    __int16 v16 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) videoGravityButtonTapped:]";
    __int16 v17 = 1024;
    int v18 = 8977;
    __int16 v19 = 2048;
    double v20 = self;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v15, 0x1Cu);
  }

  id v5 = [(AVPlayerViewController *)self videoGravity];
  char v6 = (void *)*MEMORY[0x1E4F15AF0];
  int v7 = [v5 isEqualToString:*MEMORY[0x1E4F15AF0]];
  int v8 = (void *)*MEMORY[0x1E4F15AF8];
  if (!v7) {
    int v8 = v6;
  }
  id v9 = v8;
  double v10 = [(AVPlayerViewController *)self contentView];
  uint64_t v11 = [v10 layoutClass];
  uint64_t v12 = [v11 unsignedIntegerValue];

  if (v12)
  {
    id v13 = [(AVPlayerViewController *)self contentView];
    id v14 = [v13 layoutClass];
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v9, [v14 unsignedIntegerValue]);
  }
}

- (void)doneButtonTapped:(id)a3
{
}

+ (id)keyPathsForValuesAffectingPictureInPictureWasStartedWhenEnteringBackground
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"pictureInPictureController.pictureInPictureWasStartedWhenEnteringBackground"];
}

+ (id)keyPathsForValuesAffectingPictureInPictureSuspended
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"pictureInPictureController.pictureInPictureSuspended"];
}

+ (id)keyPathsForValuesAffectingPictureInPicturePossible
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"pictureInPictureController.pictureInPicturePossible"];
}

+ (void)setUsesSecondGenerationControls:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 usesSecondGenerationControls] != a3)
  {
    id v4 = +[AVKitGlobalSettings shared];
    [v4 setSecondGenerationPlayerEnabled:v3];
  }
}

- (id)_newsWidgetPlayerLegacyBehavior
{
  uint64_t v2 = [(AVPlayerViewController *)self _behaviorStorage];
  BOOL v3 = [v2 behaviorOfClass:objc_opt_class()];

  return v3;
}

- (id)_newsWidgetPlayerBehaviorContext
{
  uint64_t v2 = [(AVPlayerViewController *)self _behaviorStorage];
  BOOL v3 = [v2 behaviorContextOfClass:objc_opt_class()];

  return v3;
}

- (void)setVideoGravityForTransitioningContent:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  [v5 setVideoGravityForTransitioningContent:v4];
}

- (void)startContentTransition:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(AVPlayerViewController *)self activeContentTransitionType];
  char v6 = _AVLog();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = self;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Warning: Attempted to start content transition on a %@, which was already transitioning. Ignoring.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = (AVPlayerViewController *)"-[AVPlayerViewController(AVPlayerViewController_NewsOnly) startContentTransition:]";
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v8, 0x16u);
    }

    int v7 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
    [v7 startContentTransition:a3];
  }
}

- (void)setContentTransitioningDelegate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self contentTransitioningDelegate];

  if (v5 != v4)
  {
    char v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      int64_t v11 = "-[AVPlayerViewController(AVPlayerViewController_NewsOnly) setContentTransitioningDelegate:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
    }

    int v7 = [(AVPlayerViewController *)self _newsWidgetPlayerLegacyBehavior];
    if (v7) {
      [(AVPlayerViewController *)self removeBehavior:v7];
    }
    if (v4)
    {
      int v8 = objc_alloc_init(AVNewsWidgetPlayerLegacyBehavior);
      [(AVPlayerViewController *)self addBehavior:v8];

      id v9 = [(AVPlayerViewController *)self _newsWidgetPlayerLegacyBehavior];
      [v9 setLegacyDelegate:v4];
    }
  }
}

- (AVPlayerViewControllerContentTransitioning_NewsOnly)contentTransitioningDelegate
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerLegacyBehavior];
  BOOL v3 = [v2 legacyDelegate];

  return (AVPlayerViewControllerContentTransitioning_NewsOnly *)v3;
}

- (AVPlayer)contentTransitioningPlayer
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  BOOL v3 = [v2 contentTransitioningPlayer];

  return (AVPlayer *)v3;
}

- (BOOL)isContentTransitionInteractive
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  char v3 = [v2 isContentTransitionInteractive];

  return v3;
}

- (UIView)contentTransitioningOverlayView
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  char v3 = [v2 contentTransitioningOverlayView];

  return (UIView *)v3;
}

- (void)setStartNextContentTransitionButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  [v4 setStartNextContentTransitionButtonEnabled:v3];
}

- (BOOL)isStartNextContentTransitionButtonEnabled
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  char v3 = [v2 isStartNextContentTransitionButtonEnabled];

  return v3;
}

- (void)setStartPreviousContentTransitionButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  [v4 setStartPreviousContentTransitionButtonEnabled:v3];
}

- (BOOL)isStartPreviousContentTransitionButtonEnabled
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  char v3 = [v2 isStartPreviousContentTransitionButtonEnabled];

  return v3;
}

- (void)setCustomContentTransitioningInfoPanel:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  [v5 setCustomContentTransitioningInfoPanel:v4];
}

- (UIView)customContentTransitioningInfoPanel
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  char v3 = [v2 customContentTransitioningInfoPanel];

  return (UIView *)v3;
}

- (int64_t)activeContentTransitionType
{
  uint64_t v2 = [(AVPlayerViewController *)self _newsWidgetPlayerBehaviorContext];
  int64_t v3 = [v2 activeContentTransitionType];

  return v3;
}

- (NSArray)behaviors
{
  uint64_t v2 = [(AVPlayerViewController *)self _behaviorStorage];
  int64_t v3 = [v2 behaviors];
  id v4 = v3;
  if (!v3) {
    int64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)removeBehavior:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerViewController *)self _behaviorStorage];
  [v5 removeBehavior:v4];
}

@end