@interface AVPlaybackControlsController
+ (id)keyPathsForValuesAffectingCanShowLoadingIndicator;
+ (id)keyPathsForValuesAffectingCurrentTime;
+ (id)keyPathsForValuesAffectingFullScreen;
+ (id)keyPathsForValuesAffectingMaximumTime;
+ (id)keyPathsForValuesAffectingMinimumTime;
+ (id)keyPathsForValuesAffectingNeedsTimeResolver;
+ (id)keyPathsForValuesAffectingPlayButtonsShowPauseGlyph;
+ (id)keyPathsForValuesAffectingProminentPlayButtonCanShowPauseGlyph;
+ (id)keyPathsForValuesAffectingSeekingEnabled;
+ (id)keyPathsForValuesAffectingShouldEnterFullScreenWhenPlaybackBegins;
+ (id)keyPathsForValuesAffectingShowsMediaSelectionButton;
+ (id)keyPathsForValuesAffectingShowsProminentPlayButton;
+ (id)keyPathsForValuesAffectingShowsRoutePickerView;
+ (id)keyPathsForValuesAffectingShowsSkipButtons;
+ (id)keyPathsForValuesAffectingShowsStartContentTransitionButtons;
+ (id)keyPathsForValuesAffectingShowsTransportControls;
- (AVMediaSelectionMenuController)mediaSelectionMenuController;
- (AVMobilePlaybackRateMenuController)playbackRateMenuController;
- (AVNowPlayingInfoController)nowPlayingInfoControllerIfLoaded;
- (AVObservationController)observationController;
- (AVObservationController)playbackControlsObservationController;
- (AVPictureInPictureController)pictureInPictureController;
- (AVPlaybackControlsController)initWithPlayerViewController:(id)a3;
- (AVPlaybackControlsView)playbackControlsView;
- (AVPlaybackSpeedCollection)playbackSpeedCollection;
- (AVPlayerController)playerController;
- (AVPlayerControllerTimeResolver)timeResolver;
- (AVPlayerControllerVolumeAnimator)volumeAnimator;
- (AVPlayerViewController)playerViewController;
- (AVRouteDetectorCoordinator)routeDetectorCoordinator;
- (AVTimeFormatter)elapsedTimeFormatter;
- (AVTimeFormatter)remainingTimeFormatter;
- (AVTurboModePlaybackControlsPlaceholderView)turboModePlaybackControlsPlaceholderView;
- (AVVolumeController)volumeController;
- (BOOL)_prefersVolumeSliderExpandedAutomatically;
- (BOOL)_wantsRouteDetectionEnabled;
- (BOOL)allowsEnteringFullScreen;
- (BOOL)canHidePlaybackControls;
- (BOOL)canIncludePlaybackControlsWhenInline;
- (BOOL)canIncludeVideoGravityButton;
- (BOOL)canShowLoadingIndicator;
- (BOOL)entersFullScreenWhenPlaybackBegins;
- (BOOL)entersFullScreenWhenTapped;
- (BOOL)forcePlaybackControlsHidden;
- (BOOL)hasBecomeReadyToPlay;
- (BOOL)hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties;
- (BOOL)hasCustomPlaybackControls;
- (BOOL)hasPlaybackBegunSincePlayerControllerBecameReadyToPlay;
- (BOOL)hasSeekableLiveStreamingContent;
- (BOOL)hasStartedUpdates;
- (BOOL)isCoveringWindow;
- (BOOL)isFullScreen;
- (BOOL)isHidingItemsForTransition;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPlaybackSuspendedForScrubbing;
- (BOOL)isPopoverBeingPresented;
- (BOOL)isResumingUpdates;
- (BOOL)isScrubbingOrSeeking;
- (BOOL)isSeekingEnabled;
- (BOOL)isShowingPlaybackControls;
- (BOOL)isStartLeftwardContentTransitionButtonEnabled;
- (BOOL)isStartRightwardContentTransitionButtonEnabled;
- (BOOL)isUserInteracting;
- (BOOL)isVideoScaled;
- (BOOL)multipleRoutesDetected;
- (BOOL)needsTimeResolver;
- (BOOL)playButtonsShowPauseGlyph;
- (BOOL)playbackControlsIncludeDisplayModeControls;
- (BOOL)playbackControlsIncludeStartContentTransitionButtons;
- (BOOL)playbackControlsIncludeTransportControls;
- (BOOL)playbackControlsIncludeVolumeControls;
- (BOOL)playerViewControllerContentViewHasActiveTransition:(id)a3;
- (BOOL)playerViewControllerContentViewIsBeingTransitionedFromFullScreen:(id)a3;
- (BOOL)playerViewControllerContentViewShouldApplyAutomaticVideoGravity:(id)a3;
- (BOOL)playerViewControllerHasInvalidViewControllerHierarchy;
- (BOOL)playerViewControllerIsBeingTransitionedWithResizing;
- (BOOL)playerViewControllerIsPresentedFullScreen;
- (BOOL)playerViewControllerIsPresentingFullScreen;
- (BOOL)prefersMuted;
- (BOOL)prefersStatusBarHidden;
- (BOOL)prominentPlayButtonCanShowPauseGlyph;
- (BOOL)requiresLinearPlayback;
- (BOOL)shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:(id)a3;
- (BOOL)shouldEnterFullScreenWhenPlaybackBegins;
- (BOOL)shouldIgnoreTimeResolverUpdates;
- (BOOL)shouldShowVolumeControlInTransportBar;
- (BOOL)showsDoneButtonWhenFullScreen;
- (BOOL)showsLoadingIndicator;
- (BOOL)showsMediaSelectionButton;
- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline;
- (BOOL)showsPictureInPictureButton;
- (BOOL)showsPlaybackControls;
- (BOOL)showsPlaybackSpeedButton;
- (BOOL)showsProminentPlayButton;
- (BOOL)showsRoutePickerView;
- (BOOL)showsSkipButtons;
- (BOOL)showsStartContentTransitionButtons;
- (BOOL)showsTimecodes;
- (BOOL)showsTransportControls;
- (BOOL)showsVideoGravityButton;
- (BOOL)showsVolumeControlsForContentWithNoAudio;
- (BOOL)tapGestureRecognizersCanReceiveTouches;
- (BOOL)volumeControlsCanShowSlider;
- (BOOL)wantsExternalPlaybackButtonShown;
- (CGRect)playbackViewFrame;
- (CGSize)playerViewControllerContentViewContentDimensions:(id)a3;
- (NSArray)customControlItems;
- (NSArray)transportBarCustomMenuItems;
- (NSNumber)pendingOrientationChange;
- (NSString)uniqueIdentifer;
- (NSString)windowSceneSessionIdentifier;
- (NSTimer)loadingIndicatorTimer;
- (NSTimer)playbackControlsVisibilityTimer;
- (NSUUID)playerMuteFadeAnimationID;
- (UIAlertController)routePickerAlertController;
- (UIViewPropertyAnimator)collapseExpandSliderAnimator;
- (double)currentTime;
- (double)loadingIndicatorTimerDelay;
- (double)maximumTime;
- (double)minimumTime;
- (double)targetTime;
- (id)AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver;
- (id)_volumeButtonMicaPackageState;
- (id)contentTransitionAction;
- (id)overflowMenuItemsForControlOverflowButton:(id)a3;
- (id)playButtonHandlerForLazyPlayerLoading;
- (id)playerViewControllerContentViewOverrideLayoutClass:(id)a3;
- (id)volumeControlsController:(id)a3 volumeButtonControl:(id)a4 viewContainingVolumeSlider:(id)a5;
- (int64_t)preferredUnobscuredArea;
- (int64_t)timeControlStatus;
- (int64_t)videoGravityButtonType;
- (unint64_t)userInteractingCount;
- (void)_autoHideControlsAfterDelay:(double)a3;
- (void)_bindEnabledStateOfControls:(id)a3 toKeyPath:(id)a4;
- (void)_bindInclusionOfControlItems:(id)a3 toKeyPath:(id)a4;
- (void)_handlePhotosensitiveRegions;
- (void)_hideContextMenusIfPresented;
- (void)_observeBoolForKeyPath:(id)a3 usingKeyValueObservationController:(id)a4 observationHandler:(id)a5;
- (void)_seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5;
- (void)_showOrHideDisplayModeControls;
- (void)_startObservingForPlaybackViewUpdates;
- (void)_startObservingPotentiallyUnimplementedPlayerControllerProperties;
- (void)_updateContainerInclusion;
- (void)_updateControlInclusion;
- (void)_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:(BOOL)a3 playing:(BOOL)a4 userDidEndTappingProminentPlayButton:(BOOL)a5;
- (void)_updateOrCreateTimeResolverIfNeeded;
- (void)_updatePhotosensitivityRegions;
- (void)_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:(BOOL)a3;
- (void)_updatePlaybackControlsVisibleAndObservingUpdates;
- (void)_updatePlaybackSpeedControlInclusion;
- (void)_updateRouteDetectionEnabled;
- (void)_updateScrubberAndTimeLabels;
- (void)_updateSkipButtonsEnableLongPress;
- (void)_updateTransportBarCustomMenuItemsIfNeeded;
- (void)_updateVideoGravityButtonType;
- (void)_updateVolumeButtonGlyph;
- (void)_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:(BOOL)a3;
- (void)_updateVolumeSliderValueWithSystemVolume:(float)a3 animated:(BOOL)a4;
- (void)beginChangingVolume;
- (void)beginHidingItemsForTransition;
- (void)beginScrubbing;
- (void)beginShowingItemsDueToIndirectUserInteraction;
- (void)beginUserInteraction;
- (void)dealloc;
- (void)endChangingVolume;
- (void)endHidingItemsForTransitionAndShowImmediately:(BOOL)a3;
- (void)endScrubbing;
- (void)endShowingItemsDueToIndirectUserInteraction;
- (void)endUserInteraction;
- (void)flashPlaybackControlsWithDuration:(double)a3;
- (void)flashVolumeControlsWithDuration:(double)a3;
- (void)handleCurrentRouteSupportsVolumeControlChanged:(id)a3;
- (void)handleVolumeChange:(id)a3;
- (void)mediaSelectionMenuController:(id)a3 didSelectOption:(id)a4;
- (void)playbackControlsViewDidLoad:(id)a3;
- (void)playbackSpeedButtonTapped:(id)a3;
- (void)playerViewControllerContentViewDidChangeVideoGravity:(id)a3;
- (void)playerViewControllerContentViewDidLayoutSubviews:(id)a3;
- (void)playerViewControllerContentViewDidMoveToSuperviewOrWindow:(id)a3;
- (void)playerViewControllerContentViewDidUpdateScrollingStatus:(id)a3;
- (void)playerViewControllerContentViewPlaybackContentContainerViewChanged:(id)a3;
- (void)prominentPlayButtonTouchUpInside:(id)a3;
- (void)routePickerViewDidEndPresentingRoutes:(id)a3;
- (void)routePickerViewWillBeginPresentingRoutes:(id)a3;
- (void)scrubToTime:(double)a3 resolution:(double)a4;
- (void)setAVRouteDetectorCoordinatorMultipleRoutesDetectedObserver:(id)a3;
- (void)setAllowsEnteringFullScreen:(BOOL)a3;
- (void)setCanHidePlaybackControls:(BOOL)a3;
- (void)setCanIncludePlaybackControlsWhenInline:(BOOL)a3;
- (void)setCanIncludeVideoGravityButton:(BOOL)a3;
- (void)setCollapseExpandSliderAnimator:(id)a3;
- (void)setContentTransitionAction:(id)a3;
- (void)setCoveringWindow:(BOOL)a3;
- (void)setCustomControlItems:(id)a3;
- (void)setEntersFullScreenWhenPlaybackBegins:(BOOL)a3;
- (void)setForcePlaybackControlsHidden:(BOOL)a3;
- (void)setHasBecomeReadyToPlay:(BOOL)a3;
- (void)setHasBegunObservingPotentiallyUnimplementedPlayerControllerProperties:(BOOL)a3;
- (void)setHasCustomPlaybackControls:(BOOL)a3;
- (void)setHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:(BOOL)a3;
- (void)setHasSeekableLiveStreamingContent:(BOOL)a3;
- (void)setHasStartedUpdates:(BOOL)a3;
- (void)setHidingItemsForTransition:(BOOL)a3;
- (void)setLoadingIndicatorTimer:(id)a3;
- (void)setLoadingIndicatorTimerDelay:(double)a3;
- (void)setMediaSelectionMenuController:(id)a3;
- (void)setMultipleRoutesDetected:(BOOL)a3;
- (void)setPendingOrientationChange:(id)a3;
- (void)setPictureInPictureActive:(BOOL)a3;
- (void)setPictureInPictureController:(id)a3;
- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3;
- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3;
- (void)setPlaybackControlsIncludeStartContentTransitionButtons:(BOOL)a3;
- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3;
- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3;
- (void)setPlaybackControlsObservationController:(id)a3;
- (void)setPlaybackControlsView:(id)a3;
- (void)setPlaybackControlsVisibilityTimer:(id)a3;
- (void)setPlaybackRateMenuController:(id)a3;
- (void)setPlaybackSpeedCollection:(id)a3;
- (void)setPlaybackSuspendedForScrubbing:(BOOL)a3;
- (void)setPlaybackViewFrame:(CGRect)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerMuteFadeAnimationID:(id)a3;
- (void)setPlayerViewControllerHasInvalidViewControllerHierarchy:(BOOL)a3;
- (void)setPlayerViewControllerIsBeingTransitionedWithResizing:(BOOL)a3;
- (void)setPlayerViewControllerIsPresentedFullScreen:(BOOL)a3;
- (void)setPlayerViewControllerIsPresentingFullScreen:(BOOL)a3;
- (void)setPopoverIsBeingPresented:(BOOL)a3;
- (void)setPreferredUnobscuredArea:(int64_t)a3;
- (void)setPrefersMuted:(BOOL)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setResumingUpdates:(BOOL)a3;
- (void)setRouteDetectorCoordinator:(id)a3;
- (void)setRoutePickerAlertController:(id)a3;
- (void)setScrubbingOrSeeking:(BOOL)a3;
- (void)setShouldIgnoreTimeResolverUpdates:(BOOL)a3;
- (void)setShowingPlaybackControls:(BOOL)a3;
- (void)setShowingVolumeControlInTransportBar:(BOOL)a3;
- (void)setShowsDoneButtonWhenFullScreen:(BOOL)a3;
- (void)setShowsLoadingIndicator:(BOOL)a3;
- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3;
- (void)setShowsPictureInPictureButton:(BOOL)a3;
- (void)setShowsPlaybackControls:(BOOL)a3;
- (void)setShowsPlaybackSpeedButton:(BOOL)a3;
- (void)setShowsTimecodes:(BOOL)a3;
- (void)setShowsVideoGravityButton:(BOOL)a3;
- (void)setShowsVolumeControlsForContentWithNoAudio:(BOOL)a3;
- (void)setStartLeftwardContentTransitionButtonEnabled:(BOOL)a3;
- (void)setStartRightwardContentTransitionButtonEnabled:(BOOL)a3;
- (void)setTimeControlStatus:(int64_t)a3;
- (void)setTimeResolver:(id)a3;
- (void)setTransportBarCustomMenuItems:(id)a3;
- (void)setTurboModePlaybackControlsPlaceholderView:(id)a3;
- (void)setUserInteractingCount:(unint64_t)a3;
- (void)setVideoGravityButtonType:(int64_t)a3;
- (void)setVideoScaled:(BOOL)a3;
- (void)setVolumeAnimator:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeControlsCanShowSlider:(BOOL)a3;
- (void)setWantsExternalPlaybackButtonShown:(BOOL)a3;
- (void)setWindowSceneSessionIdentifier:(id)a3;
- (void)showPlaybackControls:(BOOL)a3 immediately:(BOOL)a4;
- (void)skipButtonForcePressChanged:(id)a3;
- (void)skipButtonLongPressEnded:(id)a3;
- (void)skipButtonLongPressTriggered:(id)a3;
- (void)skipButtonTouchUpInside:(id)a3;
- (void)startContentTransitionButtonTouchUpInside:(id)a3;
- (void)startUpdatesIfNeeded;
- (void)toggleMuted;
- (void)togglePlaybackControlsVisibility;
- (void)transportControls:(id)a3 scrubberDidBeginScrubbing:(id)a4;
- (void)transportControls:(id)a3 scrubberDidEndScrubbing:(id)a4;
- (void)transportControls:(id)a3 scrubberDidScrub:(id)a4;
- (void)transportControlsNeedsLayoutIfNeeded:(id)a3;
- (void)turboModePlaybackControlsPlaceholderViewDidLoad:(id)a3;
- (void)updateVolumeSliderValue:(id)a3 volumeButtonControl:(id)a4;
- (void)volumeButtonLongPressTriggered:(id)a3;
- (void)volumeButtonPanChanged:(id)a3;
- (void)volumeButtonTapTriggered:(id)a3;
- (void)volumeSliderValueDidChange:(id)a3;
@end

@implementation AVPlaybackControlsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackControlsVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifer, 0);
  objc_storeStrong((id *)&self->_pendingOrientationChange, 0);
  objc_storeStrong((id *)&self->_playbackRateMenuController, 0);
  objc_storeStrong((id *)&self->_mediaSelectionMenuController, 0);
  objc_storeStrong((id *)&self->_playerMuteFadeAnimationID, 0);
  objc_storeStrong((id *)&self->_volumeAnimator, 0);
  objc_destroyWeak((id *)&self->_collapseExpandSliderAnimator);
  objc_destroyWeak((id *)&self->_loadingIndicatorTimer);
  objc_storeStrong(&self->_AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver, 0);
  objc_storeStrong((id *)&self->_routeDetectorCoordinator, 0);
  objc_destroyWeak((id *)&self->_routePickerAlertController);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeResolver, 0);
  objc_storeStrong((id *)&self->_playbackControlsObservationController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_turboModePlaybackControlsPlaceholderView);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_destroyWeak((id *)&self->_playerViewController);
  objc_storeStrong((id *)&self->_nowPlayingInfoControllerIfLoaded, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_pictureInPictureController, 0);
  objc_storeStrong(&self->_contentTransitionAction, 0);
  objc_storeStrong(&self->_playButtonHandlerForLazyPlayerLoading, 0);
  objc_storeStrong((id *)&self->_transportBarCustomMenuItems, 0);
  objc_storeStrong((id *)&self->_customControlItems, 0);
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_destroyWeak((id *)&self->_playerController);

  objc_storeStrong(&self->_selectedPlaybackSpeedObservationToken, 0);
}

- (void)setShowingVolumeControlInTransportBar:(BOOL)a3
{
  self->_showingVolumeControlInTransportBar = a3;
}

- (void)setShowingPlaybackControls:(BOOL)a3
{
  self->_showingPlaybackControls = a3;
}

- (BOOL)isShowingPlaybackControls
{
  return self->_showingPlaybackControls;
}

- (void)setHidingItemsForTransition:(BOOL)a3
{
  self->_hidingItemsForTransition = a3;
}

- (BOOL)isHidingItemsForTransition
{
  return self->_hidingItemsForTransition;
}

- (void)setUserInteractingCount:(unint64_t)a3
{
  self->_userInteractingCount = a3;
}

- (unint64_t)userInteractingCount
{
  return self->_userInteractingCount;
}

- (void)setPlaybackControlsVisibilityTimer:(id)a3
{
}

- (NSTimer)playbackControlsVisibilityTimer
{
  return self->_playbackControlsVisibilityTimer;
}

- (void)setWindowSceneSessionIdentifier:(id)a3
{
}

- (NSString)windowSceneSessionIdentifier
{
  return self->_windowSceneSessionIdentifier;
}

- (NSString)uniqueIdentifer
{
  return self->_uniqueIdentifer;
}

- (void)setVideoScaled:(BOOL)a3
{
  self->_videoScaled = a3;
}

- (BOOL)isVideoScaled
{
  return self->_videoScaled;
}

- (void)setPlaybackViewFrame:(CGRect)a3
{
  self->_playbackViewFrame = a3;
}

- (CGRect)playbackViewFrame
{
  double x = self->_playbackViewFrame.origin.x;
  double y = self->_playbackViewFrame.origin.y;
  double width = self->_playbackViewFrame.size.width;
  double height = self->_playbackViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVideoGravityButtonType:(int64_t)a3
{
  self->_videoGravityButtonType = a3;
}

- (int64_t)videoGravityButtonType
{
  return self->_videoGravityButtonType;
}

- (void)setHasBegunObservingPotentiallyUnimplementedPlayerControllerProperties:(BOOL)a3
{
  self->_hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties = a3;
}

- (BOOL)hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties
{
  return self->_hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties;
}

- (void)setShouldIgnoreTimeResolverUpdates:(BOOL)a3
{
  self->_shouldIgnoreTimeResolverUpdates = a3;
}

- (BOOL)shouldIgnoreTimeResolverUpdates
{
  return self->_shouldIgnoreTimeResolverUpdates;
}

- (void)setScrubbingOrSeeking:(BOOL)a3
{
  self->_scrubbingOrSeeking = a3;
}

- (BOOL)isScrubbingOrSeeking
{
  return self->_scrubbingOrSeeking;
}

- (void)setHasSeekableLiveStreamingContent:(BOOL)a3
{
  self->_hasSeekableLiveStreamingContent = a3;
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return self->_hasSeekableLiveStreamingContent;
}

- (void)setTimeControlStatus:(int64_t)a3
{
  self->_timeControlStatus = a3;
}

- (int64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (void)setPlaybackSuspendedForScrubbing:(BOOL)a3
{
  self->_playbackSuspendedForScrubbing = a3;
}

- (BOOL)isPlaybackSuspendedForScrubbing
{
  return self->_playbackSuspendedForScrubbing;
}

- (void)setPrefersMuted:(BOOL)a3
{
  self->_prefersMuted = a3;
}

- (BOOL)prefersMuted
{
  return self->_prefersMuted;
}

- (void)setResumingUpdates:(BOOL)a3
{
  self->_resumingUpdates = a3;
}

- (BOOL)isResumingUpdates
{
  return self->_resumingUpdates;
}

- (void)setLoadingIndicatorTimerDelay:(double)a3
{
  self->_loadingIndicatorTimerDeladouble y = a3;
}

- (double)loadingIndicatorTimerDelay
{
  return self->_loadingIndicatorTimerDelay;
}

- (void)setMultipleRoutesDetected:(BOOL)a3
{
  self->_multipleRoutesDetected = a3;
}

- (BOOL)multipleRoutesDetected
{
  return self->_multipleRoutesDetected;
}

- (void)setHasBecomeReadyToPlay:(BOOL)a3
{
  self->_hasBecomeReadyToPladouble y = a3;
}

- (BOOL)hasBecomeReadyToPlay
{
  return self->_hasBecomeReadyToPlay;
}

- (void)setHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:(BOOL)a3
{
  self->_hasPlaybackBegunSincePlayerControllerBecameReadyToPladouble y = a3;
}

- (BOOL)hasPlaybackBegunSincePlayerControllerBecameReadyToPlay
{
  return self->_hasPlaybackBegunSincePlayerControllerBecameReadyToPlay;
}

- (BOOL)isCoveringWindow
{
  return self->_coveringWindow;
}

- (void)setHasStartedUpdates:(BOOL)a3
{
  self->_hasStartedUpdates = a3;
}

- (BOOL)hasStartedUpdates
{
  return self->_hasStartedUpdates;
}

- (void)setPendingOrientationChange:(id)a3
{
}

- (NSNumber)pendingOrientationChange
{
  return self->_pendingOrientationChange;
}

- (BOOL)canIncludeVideoGravityButton
{
  return self->_canIncludeVideoGravityButton;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  self->_showsLoadingIndicator = a3;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void)setShowsPlaybackSpeedButton:(BOOL)a3
{
  self->_showsPlaybackSpeedButton = a3;
}

- (BOOL)showsPlaybackSpeedButton
{
  return self->_showsPlaybackSpeedButton;
}

- (void)setPlaybackRateMenuController:(id)a3
{
}

- (AVMobilePlaybackRateMenuController)playbackRateMenuController
{
  return self->_playbackRateMenuController;
}

- (void)setMediaSelectionMenuController:(id)a3
{
}

- (AVMediaSelectionMenuController)mediaSelectionMenuController
{
  return self->_mediaSelectionMenuController;
}

- (void)setPlayerMuteFadeAnimationID:(id)a3
{
}

- (NSUUID)playerMuteFadeAnimationID
{
  return self->_playerMuteFadeAnimationID;
}

- (void)setVolumeAnimator:(id)a3
{
}

- (AVPlayerControllerVolumeAnimator)volumeAnimator
{
  return self->_volumeAnimator;
}

- (void)setCollapseExpandSliderAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)collapseExpandSliderAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collapseExpandSliderAnimator);

  return (UIViewPropertyAnimator *)WeakRetained;
}

- (void)setLoadingIndicatorTimer:(id)a3
{
}

- (NSTimer)loadingIndicatorTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingIndicatorTimer);

  return (NSTimer *)WeakRetained;
}

- (void)setAVRouteDetectorCoordinatorMultipleRoutesDetectedObserver:(id)a3
{
}

- (id)AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver
{
  return self->_AVRouteDetectorCoordinatorMultipleRoutesDetectedObserver;
}

- (void)setRouteDetectorCoordinator:(id)a3
{
}

- (AVRouteDetectorCoordinator)routeDetectorCoordinator
{
  return self->_routeDetectorCoordinator;
}

- (void)setRoutePickerAlertController:(id)a3
{
}

- (UIAlertController)routePickerAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePickerAlertController);

  return (UIAlertController *)WeakRetained;
}

- (AVTimeFormatter)remainingTimeFormatter
{
  return self->_remainingTimeFormatter;
}

- (AVTimeFormatter)elapsedTimeFormatter
{
  return self->_elapsedTimeFormatter;
}

- (void)setTimeResolver:(id)a3
{
}

- (AVPlayerControllerTimeResolver)timeResolver
{
  return self->_timeResolver;
}

- (void)setPlaybackControlsObservationController:(id)a3
{
}

- (AVObservationController)playbackControlsObservationController
{
  return self->_playbackControlsObservationController;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setTurboModePlaybackControlsPlaceholderView:(id)a3
{
}

- (AVTurboModePlaybackControlsPlaceholderView)turboModePlaybackControlsPlaceholderView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_turboModePlaybackControlsPlaceholderView);

  return (AVTurboModePlaybackControlsPlaceholderView *)WeakRetained;
}

- (void)setPlaybackControlsView:(id)a3
{
}

- (AVPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (BOOL)isPopoverBeingPresented
{
  return self->_popoverIsBeingPresented;
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (void)setCanHidePlaybackControls:(BOOL)a3
{
  self->_canHidePlaybackControls = a3;
}

- (BOOL)canHidePlaybackControls
{
  return self->_canHidePlaybackControls;
}

- (AVNowPlayingInfoController)nowPlayingInfoControllerIfLoaded
{
  return self->_nowPlayingInfoControllerIfLoaded;
}

- (AVVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setPictureInPictureController:(id)a3
{
}

- (AVPictureInPictureController)pictureInPictureController
{
  return self->_pictureInPictureController;
}

- (void)setContentTransitionAction:(id)a3
{
}

- (id)contentTransitionAction
{
  return self->_contentTransitionAction;
}

- (void)setStartRightwardContentTransitionButtonEnabled:(BOOL)a3
{
  self->_startRightwardContentTransitionButtonEnabled = a3;
}

- (BOOL)isStartRightwardContentTransitionButtonEnabled
{
  return self->_startRightwardContentTransitionButtonEnabled;
}

- (void)setStartLeftwardContentTransitionButtonEnabled:(BOOL)a3
{
  self->_startLeftwardContentTransitionButtonEnabled = a3;
}

- (BOOL)isStartLeftwardContentTransitionButtonEnabled
{
  return self->_startLeftwardContentTransitionButtonEnabled;
}

- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3
{
}

- (id)playButtonHandlerForLazyPlayerLoading
{
  return self->_playButtonHandlerForLazyPlayerLoading;
}

- (BOOL)wantsExternalPlaybackButtonShown
{
  return self->_wantsExternalPlaybackButtonShown;
}

- (BOOL)showsTimecodes
{
  return self->_showsTimecodes;
}

- (BOOL)forcePlaybackControlsHidden
{
  return self->_forcePlaybackControlsHidden;
}

- (void)setPlaybackControlsIncludeStartContentTransitionButtons:(BOOL)a3
{
  self->_playbackControlsIncludeStartContentTransitionButtons = a3;
}

- (BOOL)playbackControlsIncludeStartContentTransitionButtons
{
  return self->_playbackControlsIncludeStartContentTransitionButtons;
}

- (BOOL)playbackControlsIncludeVolumeControls
{
  return self->_playbackControlsIncludeVolumeControls;
}

- (BOOL)playbackControlsIncludeDisplayModeControls
{
  return self->_playbackControlsIncludeDisplayModeControls;
}

- (BOOL)playbackControlsIncludeTransportControls
{
  return self->_playbackControlsIncludeTransportControls;
}

- (BOOL)showsDoneButtonWhenFullScreen
{
  return self->_showsDoneButtonWhenFullScreen;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (BOOL)showsVideoGravityButton
{
  return self->_showsVideoGravityButton;
}

- (BOOL)canIncludePlaybackControlsWhenInline
{
  return self->_canIncludePlaybackControlsWhenInline;
}

- (BOOL)hasCustomPlaybackControls
{
  return self->_hasCustomPlaybackControls;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (BOOL)showsPictureInPictureButton
{
  return self->_showsPictureInPictureButton;
}

- (NSArray)transportBarCustomMenuItems
{
  return self->_transportBarCustomMenuItems;
}

- (NSArray)customControlItems
{
  return self->_customControlItems;
}

- (BOOL)showsVolumeControlsForContentWithNoAudio
{
  return self->_showsVolumeControlsForContentWithNoAudio;
}

- (BOOL)volumeControlsCanShowSlider
{
  return self->_volumeControlsCanShowSlider;
}

- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline
{
  return self->_showsMinimalPlaybackControlsWhenEmbeddedInline;
}

- (BOOL)allowsEnteringFullScreen
{
  return self->_allowsEnteringFullScreen;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (void)setEntersFullScreenWhenPlaybackBegins:(BOOL)a3
{
  self->_entersFullScreenWhenPlaybackBegins = a3;
}

- (BOOL)entersFullScreenWhenPlaybackBegins
{
  return self->_entersFullScreenWhenPlaybackBegins;
}

- (void)setPlayerViewControllerHasInvalidViewControllerHierarchy:(BOOL)a3
{
  self->_playerViewControllerHasInvalidViewControllerHierarchdouble y = a3;
}

- (BOOL)playerViewControllerHasInvalidViewControllerHierarchy
{
  return self->_playerViewControllerHasInvalidViewControllerHierarchy;
}

- (BOOL)playerViewControllerIsPresentedFullScreen
{
  return self->_playerViewControllerIsPresentedFullScreen;
}

- (BOOL)playerViewControllerIsPresentingFullScreen
{
  return self->_playerViewControllerIsPresentingFullScreen;
}

- (BOOL)playerViewControllerIsBeingTransitionedWithResizing
{
  return self->_playerViewControllerIsBeingTransitionedWithResizing;
}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (AVPlayerController)playerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  return (AVPlayerController *)WeakRetained;
}

- (void)_updateTransportBarCustomMenuItemsIfNeeded
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v31 = self;
  v3 = self->_transportBarCustomMenuItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    unint64_t v7 = 0x1E4FB1000uLL;
    unint64_t v8 = 0x1EC51B000uLL;
    unint64_t v9 = 0x1E4FB1000uLL;
    do
    {
      uint64_t v10 = 0;
      uint64_t v32 = v5;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [v12 title];
          v14 = [(id)(v8 + 1656) buttonWithAccessibilityIdentifier:v13 isSecondGeneration:0];

          v15 = [v12 image];

          if (v15)
          {
            v16 = [v12 image];
            [v14 setImage:v16 forState:0];
          }
          v17 = [v12 title];

          if (v17)
          {
            v18 = [v12 title];
            [v14 setTitle:v18 forState:0];
          }
          [v14 addAction:v12 forControlEvents:0x2000];
          v19 = [v12 identifier];
          [v14 setMenuElementIdentifier:v19];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_16;
          }
          v20 = (void *)(v8 + 1656);
          id v21 = v11;
          [v21 title];
          uint64_t v22 = v6;
          v23 = v3;
          unint64_t v24 = v7;
          unint64_t v25 = v9;
          v27 = unint64_t v26 = v8;
          v14 = [v20 buttonWithAccessibilityIdentifier:v27 isSecondGeneration:0];

          unint64_t v8 = v26;
          unint64_t v9 = v25;
          unint64_t v7 = v24;
          v3 = v23;
          uint64_t v6 = v22;
          uint64_t v5 = v32;
          v28 = [v21 image];
          [v14 setImage:v28 forState:0];

          [v14 setMenu:v21];
          [v14 setShowsMenuAsPrimaryAction:1];
          id v12 = [v21 identifier];

          [v14 setMenuElementIdentifier:v12];
        }

        if (v14)
        {
          [v33 addObject:v14];
        }
LABEL_16:
        ++v10;
      }
      while (v5 != v10);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v5);
  }

  v29 = [(AVPlaybackControlsController *)v31 playbackControlsView];
  v30 = [v29 transportControlsView];
  [v30 setCustomMenuItemsViews:v33];
}

- (void)_updateRouteDetectionEnabled
{
  id v3 = [(AVPlaybackControlsController *)self routeDetectorCoordinator];
  objc_msgSend(v3, "setRouteDetectionEnabled:", -[AVPlaybackControlsController _wantsRouteDetectionEnabled](self, "_wantsRouteDetectionEnabled"));
}

- (void)_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:(BOOL)a3 playing:(BOOL)a4 userDidEndTappingProminentPlayButton:(BOOL)a5
{
  if (a4 || a5 || !a3) {
    [(AVPlaybackControlsController *)self setHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:a3];
  }
}

- (void)_updateVideoGravityButtonType
{
  if (![(AVPlaybackControlsController *)self showsVideoGravityButton]) {
    goto LABEL_9;
  }
  id v3 = [(AVPlaybackControlsController *)self playerController];
  if (![v3 hasVideo]
    || ![(AVPlaybackControlsController *)self isFullScreen])
  {
    goto LABEL_6;
  }
  uint64_t v4 = [(AVPlaybackControlsController *)self playerController];
  if ([v4 isPlayingOnExternalScreen])
  {

    goto LABEL_6;
  }
  uint64_t v6 = [(AVPlaybackControlsController *)self playerViewController];
  unint64_t v7 = [v6 contentTransitioningDelegate];

  if (!v7)
  {
    uint64_t v10 = [(AVPlaybackControlsController *)self playerController];
    [v10 contentDimensions];
    double v12 = v11;
    double v14 = v13;

    if ([(AVPlaybackControlsController *)self hasBecomeReadyToPlay])
    {
      BOOL v17 = ((*(void *)&v14 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v14 >= 0.0
         || (unint64_t)(*(void *)&v14 - 1) < 0xFFFFFFFFFFFFFLL;
      BOOL v19 = (v12 < 0.0 || ((*(void *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
         && (unint64_t)(*(void *)&v12 - 1) > 0xFFFFFFFFFFFFELL;
      uint64_t v5 = 1;
      if (!v19 && v17)
      {
        v20 = [(AVPlaybackControlsController *)self playerViewController];
        id v3 = [v20 contentView];

        [v3 bounds];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        double v29 = v12 / v14;
        [v3 frame];
        UIRectGetCenter();
        double v31 = v30;
        double v33 = v32;
        long long v34 = [v3 cacheLargestInscribedRect];
        objc_msgSend(v34, "getLargestInscribableRectForView:withCenter:aspectRatio:", v3, v31, v33, v29);
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;

        v48.origin.double x = v36;
        v48.origin.double y = v38;
        v48.size.double width = v40;
        v48.size.double height = v42;
        double MinX = CGRectGetMinX(v48);
        v49.origin.double x = v36;
        v49.origin.double y = v38;
        v49.size.double width = v40;
        v49.size.double height = v42;
        double MinY = CGRectGetMinY(v49);
        v50.origin.double x = v36;
        v50.origin.double y = v38;
        v50.size.double width = v40;
        v50.size.double height = v42;
        v52.origin.double x = v22;
        v52.origin.double y = v24;
        v52.size.double width = v26;
        v52.size.double height = v28;
        if (!CGRectEqualToRect(v50, v52))
        {
          v51.origin.double x = v36;
          v51.origin.double y = v38;
          v51.size.double width = v40;
          v51.size.double height = v42;
          if (CGRectGetMinX(v51) <= 0.0)
          {
            uint64_t v5 = 1;
            if (MinX != 0.0 || MinY <= 0.0) {
              goto LABEL_7;
            }
            BOOL v43 = ![(AVPlaybackControlsController *)self isVideoScaled];
            uint64_t v44 = 1;
          }
          else
          {
            BOOL v43 = ![(AVPlaybackControlsController *)self isVideoScaled];
            uint64_t v44 = 3;
          }
          if (v43) {
            uint64_t v5 = v44;
          }
          else {
            uint64_t v5 = v44 + 1;
          }
LABEL_7:

          goto LABEL_10;
        }
LABEL_6:
        uint64_t v5 = 0;
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
LABEL_9:
    uint64_t v5 = 0;
  }
LABEL_10:
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __61__AVPlaybackControlsController__updateVideoGravityButtonType__block_invoke;
  v47[3] = &unk_1E5FC41F8;
  v47[4] = self;
  v47[5] = v5;
  uint64_t v8 = MEMORY[0x1B3E963E0](v47);
  unint64_t v9 = (void (**)(void))v8;
  if (v5)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    [(AVPlaybackControlsController *)self setCanIncludeVideoGravityButton:1];
  }
  else
  {
    [(AVPlaybackControlsController *)self setCanIncludeVideoGravityButton:0];
    v9[2](v9);
  }
}

void __61__AVPlaybackControlsController__updateVideoGravityButtonType__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) videoGravityButtonType] != *(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setVideoGravityButtonType:");
  }
  unint64_t v2 = [*(id *)(a1 + 32) videoGravityButtonType];
  if (v2 > 4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = *off_1E5FC3698[v2];
  }
  id v3 = [*(id *)(a1 + 32) playbackControlsView];
  uint64_t v4 = [v3 videoGravityButton];
  uint64_t v5 = [v4 imageName];

  if (v8 != v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) playbackControlsView];
    unint64_t v7 = [v6 videoGravityButton];
    [v7 setImageName:v8];
  }
}

- (void)_updatePhotosensitivityRegions
{
  if (_AXSPhotosensitiveMitigationEnabled()
    && ([(AVPlaybackControlsController *)self playerController],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    uint64_t v5 = [(AVPlaybackControlsController *)self playerController];
    id v9 = [v5 photosensitivityRegions];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v6 = [(AVPlaybackControlsController *)self playbackControlsView];
  unint64_t v7 = [v6 transportControlsView];
  uint64_t v8 = [v7 scrubber];
  [v8 setPhotosensitiveDisplayTimes:v9];
}

- (void)_handlePhotosensitiveRegions
{
  id v3 = [(AVPlaybackControlsController *)self playerController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(AVPlaybackControlsController *)self observationController];
    id v5 = (id)[v6 startObserving:self keyPath:@"playerController.photosensitivityRegions" includeInitialValue:1 observationHandler:&__block_literal_global_405];
  }
}

uint64_t __60__AVPlaybackControlsController__handlePhotosensitiveRegions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updatePhotosensitivityRegions];
}

- (void)_updateScrubberAndTimeLabels
{
  id v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v89 = [v3 transportControlsView];

  if (![(AVPlaybackControlsController *)self needsTimeResolver]
    || ([(AVPlaybackControlsController *)self timeResolver],
        char v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    BOOL v17 = [(AVPlaybackControlsController *)self timeResolver];

    v15 = 0;
    v16 = 0;
    if (v17) {
      goto LABEL_26;
    }
    goto LABEL_18;
  }
  [(AVPlaybackControlsController *)self maximumTime];
  double v6 = v5;
  [(AVPlaybackControlsController *)self minimumTime];
  double v8 = v6 - v7;
  id v9 = [(AVPlaybackControlsController *)self elapsedTimeFormatter];
  [v9 setFormatTemplate:v8];

  uint64_t v10 = [(AVPlaybackControlsController *)self remainingTimeFormatter];
  [v10 setFormatTemplate:v8];

  if ([v89 liveStreamingControlsIncludeScrubber])
  {
    double v11 = [(AVPlaybackControlsController *)self elapsedTimeFormatter];
    [(AVPlaybackControlsController *)self minimumTime];
    double v13 = v12;
    [(AVPlaybackControlsController *)self maximumTime];
    v15 = [v11 stringFromSeconds:v13 - v14];
    v16 = &stru_1F09185C8;
  }
  else
  {
    if ([(AVPlaybackControlsController *)self showsTimecodes]
      && ([(AVPlaybackControlsController *)self playerController],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 hasReadableTimecodes],
          v18,
          v19))
    {
      v20 = [(AVPlaybackControlsController *)self playerController];
      v15 = [v20 timecodeForCurrentTime];

      double v11 = [(AVPlaybackControlsController *)self playerController];
      uint64_t v21 = [v11 maxTimecode];
    }
    else
    {
      CGFloat v22 = [(AVPlaybackControlsController *)self elapsedTimeFormatter];
      [(AVPlaybackControlsController *)self targetTime];
      v15 = objc_msgSend(v22, "stringFromSeconds:");

      double v11 = [(AVPlaybackControlsController *)self remainingTimeFormatter];
      [(AVPlaybackControlsController *)self maximumTime];
      double v24 = v23;
      [(AVPlaybackControlsController *)self targetTime];
      uint64_t v21 = [v11 stringFromSeconds:v24 - v25];
    }
    v16 = (__CFString *)v21;
  }

  [(AVPlaybackControlsController *)self minimumTime];
  [(AVPlaybackControlsController *)self minimumTime];
  if (fabs(v26) == INFINITY) {
    goto LABEL_18;
  }
  [(AVPlaybackControlsController *)self maximumTime];
  [(AVPlaybackControlsController *)self maximumTime];
  if (fabs(v27) == INFINITY) {
    goto LABEL_18;
  }
  [(AVPlaybackControlsController *)self currentTime];
  [(AVPlaybackControlsController *)self currentTime];
  if (fabs(v28) == INFINITY) {
    goto LABEL_18;
  }
  [(AVPlaybackControlsController *)self maximumTime];
  double v30 = v29;
  [(AVPlaybackControlsController *)self minimumTime];
  if (v30 - v31 <= 0.0
    || ([(AVPlaybackControlsController *)self currentTime],
        double v33 = v32,
        [(AVPlaybackControlsController *)self minimumTime],
        v33 < v34)
    && ([(AVPlaybackControlsController *)self currentTime],
        double v36 = v35,
        [(AVPlaybackControlsController *)self maximumTime],
        v36 > v37))
  {
LABEL_18:
    CGFloat v38 = [(AVPlaybackControlsController *)self elapsedTimeFormatter];
    uint64_t v39 = [v38 stringFromSeconds:NAN];

    CGFloat v40 = [(AVPlaybackControlsController *)self remainingTimeFormatter];
    uint64_t v41 = [v40 stringFromSeconds:NAN];

    CGFloat v42 = [v89 scrubber];
    [v42 setMinimumValue:0.0];

    BOOL v43 = [v89 scrubber];
    [v43 setValue:0 animated:0.0];

    uint64_t v44 = [v89 scrubber];
    LODWORD(v45) = 1.0;
    [v44 setMaximumValue:v45];
    v16 = (__CFString *)v41;
    v15 = (void *)v39;
    goto LABEL_19;
  }
  [(AVPlaybackControlsController *)self minimumTime];
  double v70 = v69;
  [(AVPlaybackControlsController *)self maximumTime];
  double v72 = v71;
  v73 = [v89 scrubber];
  *(float *)&double v74 = v70;
  [v73 setMinimumValue:v74];

  v75 = [v89 scrubber];
  *(float *)&double v76 = v72;
  [v75 setMaximumValue:v76];

  uint64_t v44 = [v89 scrubber];
  if (([v44 isTracking] & 1) == 0)
  {
    v77 = [(AVPlaybackControlsController *)self playerController];
    if ([v77 isPlayingOnExternalScreen])
    {
      v78 = [v89 scrubber];
      [v78 timeIntervalSinceTrackingEnded];
      double v80 = v79;

      if (v80 <= 0.5) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    [(AVPlaybackControlsController *)self targetTime];
    double v82 = v81;
    v83 = [(AVPlaybackControlsController *)self playerController];
    if ([v83 hasSeekableLiveStreamingContent])
    {
      v84 = [(AVPlaybackControlsController *)self playerController];
      int v85 = [v84 isPlaying];

      int v86 = v85 ^ 1;
    }
    else
    {
      int v86 = 1;
    }

    if (v82 < v72 + -5.0) {
      int v87 = 1;
    }
    else {
      int v87 = v86;
    }
    if (v87) {
      double v72 = v82;
    }
    uint64_t v44 = [v89 scrubber];
    *(float *)&double v88 = v72;
    [v44 setValue:0 animated:v88];
  }
LABEL_19:

LABEL_20:
  if (v15 && v16)
  {
    v46 = [v89 elapsedTimeLabel];
    v47 = [v46 text];

    CGRect v48 = [v89 elapsedTimeLabel];
    CGRect v49 = [v48 text];

    CGRect v50 = [v89 elapsedTimeLabel];
    [v50 setText:v15];

    CGRect v51 = [v89 timeRemainingLabel];
    [v51 setText:v16];

    uint64_t v52 = [v47 length];
    if (v52 != [v15 length]
      || (uint64_t v53 = [v49 length], v53 != -[__CFString length](v16, "length")))
    {
      [v89 setNeedsLayout];
    }
  }
LABEL_26:
  v54 = [(AVPlaybackControlsController *)self playerController];
  if (objc_opt_respondsToSelector())
  {
    v55 = [(AVPlaybackControlsController *)self playerController];
    v56 = [v55 interstitialController];
    v57 = [v56 currentInterstitialTimeRange];

    if (!v57)
    {
      v58 = [(AVPlaybackControlsController *)self playerController];
      v59 = [v58 player];
      v60 = [v59 currentItem];
      v61 = [v60 interstitialTimeRanges];
      if ([v61 count])
      {
        v62 = [v89 scrubber];
        v63 = [v62 interstitialDisplayTimes];

        v64 = v89;
        if (v63)
        {
LABEL_32:
          v66 = [v64 scrubber];
          v67 = v66;
          uint64_t v68 = 1;
          goto LABEL_35;
        }
        v58 = [v89 scrubber];
        v59 = [(AVPlaybackControlsController *)self playerController];
        v60 = [v59 player];
        v61 = [v60 currentItem];
        v65 = [v61 interstitialTimeRanges];
        [v58 setInterstitialDisplayTimes:v65];
      }
      v64 = v89;
      goto LABEL_32;
    }
  }
  else
  {
  }
  v66 = [v89 scrubber];
  v67 = v66;
  uint64_t v68 = 0;
LABEL_35:
  [v66 setShowsTimelineMarkers:v68];
}

- (void)_updatePlaybackSpeedControlInclusion
{
  id v7 = [(AVPlaybackControlsController *)self playerController];
  if ([v7 hasLiveStreamingContent]) {
    int v3 = [v7 hasSeekableLiveStreamingContent];
  }
  else {
    int v3 = 1;
  }
  char v4 = [(AVPlaybackControlsController *)self playbackSpeedCollection];
  if (v4)
  {
    double v5 = +[AVKitGlobalSettings shared];
    if ([v5 playbackSpeedControlEnabled]) {
      uint64_t v6 = v3 & ~[v7 isPlayingOnMatchPointDevice];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (v6 != [(AVPlaybackControlsController *)self showsPlaybackSpeedButton]) {
    [(AVPlaybackControlsController *)self setShowsPlaybackSpeedButton:v6];
  }
}

- (void)_updateOrCreateTimeResolverIfNeeded
{
  if (![(AVPlaybackControlsController *)self needsTimeResolver])
  {
    double v26 = [(AVPlaybackControlsController *)self timeResolver];
    [v26 setPlayerController:0];

    [(AVPlaybackControlsController *)self setTimeResolver:0];
    return;
  }
  int v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  char v4 = [v3 transportControlsView];
  double v5 = [v4 scrubber];
  double v6 = 1.0;
  if (([v5 isTracking] & 1) == 0)
  {
    id v7 = [(AVPlaybackControlsController *)self playbackControlsView];
    double v8 = [v7 volumeSlider];
    char v9 = [v8 isTracking];

    if (v9) {
      goto LABEL_6;
    }
    int v3 = [(AVPlaybackControlsController *)self playbackControlsView];
    char v4 = [v3 transportControlsView];
    double v5 = [v4 scrubber];
    [v5 frame];
    double Width = CGRectGetWidth(v37);
    double v11 = [(AVPlaybackControlsController *)self playbackControlsView];
    double v12 = [v11 traitCollection];
    [v12 displayScale];
    double v6 = Width * v13;
  }
LABEL_6:
  double v14 = 1.0;
  if ([(AVPlaybackControlsController *)self showsTimecodes])
  {
    v15 = [(AVPlaybackControlsController *)self playerController];
    int v16 = [v15 hasReadableTimecodes];

    if (v16)
    {
      BOOL v17 = [(AVPlaybackControlsController *)self playerController];
      [v17 timecodeObservationInterval];
      double v14 = v18;
    }
  }
  int v19 = [(AVPlaybackControlsController *)self timeResolver];
  v20 = [v19 playerController];
  uint64_t v21 = [(AVPlaybackControlsController *)self playerController];

  if (v20 != v21)
  {
    CGFloat v22 = objc_alloc_init(AVPlayerControllerTimeResolver);
    double v23 = [(AVPlaybackControlsController *)self playerController];
    [(AVPlayerControllerTimeResolver *)v22 setPlayerController:v23];

    [(AVPlayerControllerTimeResolver *)v22 setResolution:v6];
    [(AVPlayerControllerTimeResolver *)v22 setInterval:v14];
    double v24 = (void *)MEMORY[0x1E4FB1EB0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __67__AVPlaybackControlsController__updateOrCreateTimeResolverIfNeeded__block_invoke;
    v34[3] = &unk_1E5FC3D18;
    v34[4] = self;
    double v35 = v22;
    double v25 = v22;
    [v24 performWithoutAnimation:v34];

    return;
  }
  double v27 = [(AVPlaybackControlsController *)self timeResolver];
  [v27 resolution];
  if (v28 == v6)
  {
    double v29 = [(AVPlaybackControlsController *)self timeResolver];
    [v29 interval];
    double v31 = vabdd_f64(v30, v14);

    if (v31 < 2.22044605e-16) {
      return;
    }
  }
  else
  {
  }
  double v32 = [(AVPlaybackControlsController *)self timeResolver];
  [v32 setResolution:v6];

  id v33 = [(AVPlaybackControlsController *)self timeResolver];
  [v33 setInterval:v14];
}

void __67__AVPlaybackControlsController__updateOrCreateTimeResolverIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimeResolver:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) playbackControlsView];
  unint64_t v2 = [v4 transportControlsView];
  int v3 = [v2 scrubber];
  [v3 layoutIfNeeded];
}

- (void)_updateContainerInclusion
{
  int v3 = [(AVPlaybackControlsController *)self playbackControlsView];

  if (v3)
  {
    BOOL v4 = [(AVPlaybackControlsController *)self showsProminentPlayButton];
    BOOL v5 = [(AVPlaybackControlsController *)self playbackControlsIncludeTransportControls];
    BOOL v6 = [(AVPlaybackControlsController *)self playbackControlsIncludeDisplayModeControls];
    BOOL v7 = [(AVPlaybackControlsController *)self playbackControlsIncludeVolumeControls];
    if (![(AVPlaybackControlsController *)self isFullScreen]
      && [(AVPlaybackControlsController *)self showsMinimalPlaybackControlsWhenEmbeddedInline])
    {
      if (v4)
      {
        uint64_t v8 = 2;
        goto LABEL_22;
      }
      uint64_t v8 = 0;
LABEL_17:
      if (![(AVPlaybackControlsController *)self shouldShowVolumeControlInTransportBar])
      {
        char v9 = [(AVPlaybackControlsController *)self playerController];
        if ([v9 hasEnabledAudio])
        {
        }
        else
        {
          BOOL v10 = [(AVPlaybackControlsController *)self showsVolumeControlsForContentWithNoAudio];

          if (!v10) {
            goto LABEL_22;
          }
        }
        v8 |= 0x10uLL;
      }
LABEL_22:
      double v11 = [(AVPlaybackControlsController *)self playbackControlsView];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__AVPlaybackControlsController__updateContainerInclusion__block_invoke;
      v12[3] = &unk_1E5FC4698;
      v12[4] = self;
      [v11 setIncludedContainers:v8 animations:v12];

      return;
    }
    if (v4) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v5)
    {
      v8 |= 4uLL;
      if (!v6) {
        goto LABEL_11;
      }
    }
    else if (!v6)
    {
LABEL_11:
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_17;
    }
    v8 |= 8uLL;
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }
}

uint64_t __57__AVPlaybackControlsController__updateContainerInclusion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateControlInclusion];
}

- (void)_updateControlInclusion
{
  int v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  BOOL v4 = [v3 volumeSlider];
  -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", [v4 isIncluded]);

  [(AVPlaybackControlsController *)self _showOrHideDisplayModeControls];
}

- (void)_updateSkipButtonsEnableLongPress
{
  int v3 = [(AVPlaybackControlsController *)self playerController];

  if (v3)
  {
    BOOL v4 = [(AVPlaybackControlsController *)self playbackControlsView];
    BOOL v5 = [v4 skipBackButton];
    BOOL v6 = [(AVPlaybackControlsController *)self playerController];
    [v5 setTreatsForcePressAsLongPress:(objc_opt_respondsToSelector() & 1) == 0];

    id v9 = [(AVPlaybackControlsController *)self playbackControlsView];
    BOOL v7 = [v9 skipForwardButton];
    uint64_t v8 = [(AVPlaybackControlsController *)self playerController];
    [v7 setTreatsForcePressAsLongPress:(objc_opt_respondsToSelector() & 1) == 0];
  }
}

- (BOOL)_wantsRouteDetectionEnabled
{
  int v3 = [(AVPlaybackControlsController *)self playerViewController];
  if ([v3 isBeingPresented])
  {
  }
  else
  {
    BOOL v4 = [(AVPlaybackControlsController *)self playerViewController];
    BOOL v5 = [v4 fullScreenViewController];
    char v6 = [v5 isBeingPresented];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = [(AVPlaybackControlsController *)self playbackControlsView];
      int v8 = objc_msgSend(v7, "avkit_isInAWindowAndVisible");

      if (!v8)
      {
        LOBYTE(v9) = 0;
        return v9;
      }
    }
  }
  BOOL v9 = [(AVPlaybackControlsController *)self showsPlaybackControls];
  if (v9)
  {
    if ([(AVPlaybackControlsController *)self isFullScreen])
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = [(AVPlaybackControlsController *)self canIncludePlaybackControlsWhenInline];
    }
  }
  return v9;
}

- (void)_startObservingPotentiallyUnimplementedPlayerControllerProperties
{
  if (![(AVPlaybackControlsController *)self hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties])
  {
    [(AVPlaybackControlsController *)self setHasBegunObservingPotentiallyUnimplementedPlayerControllerProperties:1];
    objc_initWeak(&location, self);
    int v3 = [(AVPlaybackControlsController *)self playerController];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      BOOL v5 = [(AVPlaybackControlsController *)self observationController];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke;
      v24[3] = &unk_1E5FC4220;
      objc_copyWeak(&v25, &location);
      [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.hasSeekableLiveStreamingContent" usingKeyValueObservationController:v5 observationHandler:v24];

      objc_destroyWeak(&v25);
    }
    char v6 = [(AVPlaybackControlsController *)self playerController];
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(AVPlaybackControlsController *)self playerController];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        BOOL v9 = [(AVPlaybackControlsController *)self observationController];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_2;
        v22[3] = &unk_1E5FC4220;
        objc_copyWeak(&v23, &location);
        [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.seeking" usingKeyValueObservationController:v9 observationHandler:v22];

        BOOL v10 = [(AVPlaybackControlsController *)self observationController];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_3;
        v20[3] = &unk_1E5FC4220;
        objc_copyWeak(&v21, &location);
        [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.scrubbing" usingKeyValueObservationController:v10 observationHandler:v20];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v23);
      }
    }
    else
    {
    }
    double v11 = [(AVPlaybackControlsController *)self playerController];
    char v12 = objc_opt_respondsToSelector();

    double v13 = [(AVPlaybackControlsController *)self observationController];
    if (v12)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_4;
      v18[3] = &unk_1E5FC3490;
      double v14 = &v19;
      objc_copyWeak(&v19, &location);
      id v15 = (id)[v13 startObserving:self keyPath:@"playerController.timeControlStatus" includeInitialValue:1 observationHandler:v18];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_5;
      v16[3] = &unk_1E5FC4220;
      double v14 = &v17;
      objc_copyWeak(&v17, &location);
      [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.playing" usingKeyValueObservationController:v13 observationHandler:v16];
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasSeekableLiveStreamingContent:a2];
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_2(uint64_t a1, int a2)
{
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [v4 playerController];
  objc_msgSend(v4, "setScrubbingOrSeeking:", objc_msgSend(v3, "isScrubbing") | a2);
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_3(uint64_t a1, int a2)
{
  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    [WeakRetained setScrubbingOrSeeking:1];
  }
  else
  {
    id v4 = objc_loadWeakRetained(v3);
    BOOL v5 = [v4 playerController];
    objc_msgSend(WeakRetained, "setScrubbingOrSeeking:", objc_msgSend(v5, "isSeeking"));
  }
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  char v6 = [v5 value];
  uint64_t v7 = [v6 integerValue];

  char v8 = [v5 oldValue];

  uint64_t v9 = [v8 integerValue];
  BOOL v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained setTimeControlStatus:v7];

  id v12 = objc_loadWeakRetained(v10);
  if (![v12 hasPlaybackBegunSincePlayerControllerBecameReadyToPlay])
  {
LABEL_4:

    double v14 = 3.0;
    if (v7 == 2) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v13 = objc_loadWeakRetained(v10);
  if ([v13 isShowingPlaybackControls])
  {

    goto LABEL_4;
  }
  id v15 = objc_loadWeakRetained(v10);
  if (![v15 isShowingPlaybackControls] && v9 == 2 && v7 == 1)
  {
  }
  else
  {
    id v16 = objc_loadWeakRetained(v10);
    char v17 = [v16 isShowingPlaybackControls];

    if ((v17 & 1) != 0 || v7) {
      return;
    }
  }
LABEL_12:
  double v18 = [MEMORY[0x1E4F1C9C8] date];
  [v18 timeIntervalSince1970];
  double v14 = v19;

LABEL_13:
  id v20 = objc_loadWeakRetained(v10);
  [v20 flashPlaybackControlsWithDuration:v14];
}

void __97__AVPlaybackControlsController__startObservingPotentiallyUnimplementedPlayerControllerProperties__block_invoke_5(uint64_t a1, int a2)
{
  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  [WeakRetained setTimeControlStatus:v6];

  id v7 = objc_loadWeakRetained(v3);
  char v8 = [v7 playerController];
  double v9 = 3.0;
  if (([v8 isPlaying] & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSince1970];
    double v9 = v11;
  }
  id v12 = objc_loadWeakRetained(v3);
  [v12 flashPlaybackControlsWithDuration:v9];
}

- (void)_startObservingForPlaybackViewUpdates
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  int v3 = [(AVPlaybackControlsController *)self playbackControlsView];

  if (!v3)
  {
    id v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      double v72 = _AVMethodProem(self);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v72;
      _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Called %@ before creating playback controls view!", (uint8_t *)location, 0xCu);
    }
  }
  id v5 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v6 = [(AVPlaybackControlsController *)self playbackControlsView];
  objc_initWeak(location, v6);

  objc_initWeak(&from, self);
  [(AVPlaybackControlsController *)self setResumingUpdates:1];
  id v7 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke;
  v129[3] = &unk_1E5FC4220;
  v92 = &v130;
  objc_copyWeak(&v130, location);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"prominentPlayButtonCanShowPauseGlyph" usingKeyValueObservationController:v7 observationHandler:v129];

  char v8 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_2;
  v127[3] = &unk_1E5FC4220;
  v91 = &v128;
  objc_copyWeak(&v128, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"showsProminentPlayButton" usingKeyValueObservationController:v8 observationHandler:v127];

  double v9 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_3;
  v124[3] = &unk_1E5FC35A0;
  id v89 = &v125;
  objc_copyWeak(&v125, location);
  v90 = &v126;
  objc_copyWeak(&v126, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playButtonsShowPauseGlyph" usingKeyValueObservationController:v9 observationHandler:v124];

  BOOL v10 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_4;
  v122[3] = &unk_1E5FC4220;
  double v88 = &v123;
  objc_copyWeak(&v123, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.muted" usingKeyValueObservationController:v10 observationHandler:v122];

  double v11 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_5;
  v120[3] = &unk_1E5FC4220;
  int v87 = &v121;
  objc_copyWeak(&v121, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.hasEnabledAudio" usingKeyValueObservationController:v11 observationHandler:v120];

  id v12 = [(AVPlaybackControlsController *)self playerController];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v14 = [(AVPlaybackControlsController *)self observationController];
    id v15 = (id)[v14 startObserving:self keyPath:@"playerController.currentAssetIfReady" includeInitialValue:1 observationHandler:&__block_literal_global_258];
  }
  id v16 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_7;
  v117[3] = &unk_1E5FC35A0;
  int v85 = &v118;
  objc_copyWeak(&v118, &from);
  int v86 = &v119;
  objc_copyWeak(&v119, location);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"prefersMuted" usingKeyValueObservationController:v16 observationHandler:v117];

  char v17 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_10;
  v114[3] = &unk_1E5FC35A0;
  v83 = &v115;
  objc_copyWeak(&v115, &from);
  v84 = &v116;
  objc_copyWeak(&v116, location);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"fullScreen" usingKeyValueObservationController:v17 observationHandler:v114];

  double v18 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_11;
  v112[3] = &unk_1E5FC4220;
  double v82 = &v113;
  objc_copyWeak(&v113, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.playingOnExternalScreen" usingKeyValueObservationController:v18 observationHandler:v112];

  double v19 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_12;
  v109[3] = &unk_1E5FC35A0;
  double v79 = &v110;
  objc_copyWeak(&v110, location);
  double v81 = &v111;
  objc_copyWeak(&v111, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.hasLiveStreamingContent" usingKeyValueObservationController:v19 observationHandler:v109];

  id v20 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_13;
  v106[3] = &unk_1E5FC35A0;
  double v76 = &v107;
  objc_copyWeak(&v107, location);
  v78 = &v108;
  objc_copyWeak(&v108, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"hasSeekableLiveStreamingContent" usingKeyValueObservationController:v20 observationHandler:v106];

  id v21 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_14;
  v104[3] = &unk_1E5FC4220;
  v75 = &v105;
  objc_copyWeak(&v105, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"playerController.playingOnMatchPointDevice" usingKeyValueObservationController:v21 observationHandler:v104];

  CGFloat v22 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_15;
  v101[3] = &unk_1E5FC3638;
  v73 = &v102;
  objc_copyWeak(&v102, location);
  v77 = &v103;
  objc_copyWeak(&v103, &from);
  id v23 = (id)[v22 startObserving:self keyPath:@"playerController.loadedTimeRanges" includeInitialValue:1 observationHandler:v101];

  double v24 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_16;
  v98[3] = &unk_1E5FC35A0;
  double v80 = &v99;
  objc_copyWeak(&v99, location);
  objc_copyWeak(&v100, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"showsLoadingIndicator" usingKeyValueObservationController:v24 observationHandler:v98];

  v145[0] = @"playerController.contentDimensions";
  v145[1] = @"fullScreen";
  v145[2] = @"playerController.playingOnExternalScreen";
  v145[3] = @"playbackViewFrame";
  v145[4] = @"playerController.hasVideo";
  v145[5] = @"hasBecomeReadyToPlay";
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:6];
  double v26 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  id v27 = (id)[v26 startObserving:self keyPaths:v25 includeInitialValue:0 observationHandler:&__block_literal_global_296];

  double v28 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  uint64_t v93 = MEMORY[0x1E4F143A8];
  uint64_t v94 = 3221225472;
  v95 = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_18;
  v96 = &unk_1E5FC4220;
  objc_copyWeak(&v97, &from);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"canShowLoadingIndicator" usingKeyValueObservationController:v28 observationHandler:&v93];

  [(AVPlaybackControlsController *)self _updateVideoGravityButtonType];
  if (v5)
  {
    objc_msgSend(v5, "standardPlayPauseButton", &v102, &v105, &v107, &v103, &v108, &v110, &v99, &v111, &v113, &v115, &v116, &v118, &v119, &v121, &v123, &v125, &v126,
      &v128,
      &v130,
      v93,
      v94,
      v95,
    double v29 = v96);
    v144[0] = v29;
    double v30 = [v5 volumeButton];
    v144[1] = v30;
    double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:2];
    [(AVPlaybackControlsController *)self _bindEnabledStateOfControls:v31 toKeyPath:@"playerController.canTogglePlayback"];

    double v32 = [v5 scrubber];
    v143[0] = v32;
    id v33 = [v5 skipBackButton];
    v143[1] = v33;
    double v34 = [v5 skipForwardButton];
    v143[2] = v34;
    double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:3];
    [(AVPlaybackControlsController *)self _bindEnabledStateOfControls:v35 toKeyPath:@"seekingEnabled"];

    double v36 = [v5 startLeftwardContentTransitionButton];
    v142 = v36;
    CGRect v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v142 count:1];
    [(AVPlaybackControlsController *)self _bindEnabledStateOfControls:v37 toKeyPath:@"startLeftwardContentTransitionButtonEnabled"];

    CGFloat v38 = [v5 startRightwardContentTransitionButton];
    v141 = v38;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
    [(AVPlaybackControlsController *)self _bindEnabledStateOfControls:v39 toKeyPath:@"startRightwardContentTransitionButtonEnabled"];

    CGFloat v40 = [v5 scrubber];
    v140 = v40;
    uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v140 count:1];
    [(AVPlaybackControlsController *)self _bindEnabledStateOfControls:v41 toKeyPath:@"isSeekingEnabled"];

    CGFloat v42 = [v5 transportControlsView];
    v139 = v42;
    BOOL v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:1];
    [(AVPlaybackControlsController *)self _bindInclusionOfControlItems:v43 toKeyPath:@"showsTransportControls"];

    uint64_t v44 = [v5 skipBackButton];
    v138[0] = v44;
    double v45 = [v5 skipForwardButton];
    v138[1] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
    [(AVPlaybackControlsController *)self _bindInclusionOfControlItems:v46 toKeyPath:@"showsSkipButtons"];

    v47 = [v5 startLeftwardContentTransitionButton];
    v137[0] = v47;
    CGRect v48 = [v5 startRightwardContentTransitionButton];
    v137[1] = v48;
    CGRect v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:2];
    [(AVPlaybackControlsController *)self _bindInclusionOfControlItems:v49 toKeyPath:@"showsStartContentTransitionButtons"];

    CGRect v50 = [v5 routePickerView];
    v136 = v50;
    CGRect v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
    [(AVPlaybackControlsController *)self _bindInclusionOfControlItems:v51 toKeyPath:@"showsRoutePickerView"];

    uint64_t v52 = [v5 mediaSelectionButton];
    v135 = v52;
    uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
    [(AVPlaybackControlsController *)self _bindInclusionOfControlItems:v53 toKeyPath:@"showsMediaSelectionButton"];

    v54 = [v5 playbackSpeedButton];
    v134 = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
    [(AVPlaybackControlsController *)self _bindInclusionOfControlItems:v55 toKeyPath:@"showsPlaybackSpeedButton"];
  }
  v56 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v133[0] = @"minimumTime";
  v133[1] = @"maximumTime";
  v133[2] = @"currentTime";
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:3];
  id v58 = (id)[v56 startObserving:self keyPaths:v57 includeInitialValue:1 observationHandler:&__block_literal_global_340];

  v59 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  [v59 startObservingNotificationForName:*MEMORY[0x1E4FB3148] object:0 notificationCenter:0 observationHandler:&__block_literal_global_342];

  v60 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  [v60 startObservingNotificationForName:*MEMORY[0x1E4FB3100] object:0 notificationCenter:0 observationHandler:&__block_literal_global_344];

  v61 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v62 = [(AVPlaybackControlsController *)self playbackRateMenuController];
  id v63 = (id)[v61 startObserving:v62 keyPath:@"menu" observationHandler:&__block_literal_global_350];

  v64 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  id v65 = (id)[v64 startObserving:self keyPath:@"showsMediaSelectionButton" observationHandler:&__block_literal_global_352];

  v66 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v67 = [(AVPlaybackControlsController *)self playerController];
  v132[0] = @"audioMediaSelectionOptions";
  v132[1] = @"legibleMediaSelectionOptions";
  v132[2] = @"currentAudioMediaSelectionOption";
  v132[3] = @"currentLegibleMediaSelectionOption";
  uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:4];
  id v69 = (id)[v66 startObserving:v67 keyPaths:v68 observationHandler:&__block_literal_global_366];

  double v70 = [(AVPlaybackControlsController *)self volumeController];
  [v70 volume];
  -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0);

  double v71 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v71 setHidden:0];

  [(AVPlaybackControlsController *)self setResumingUpdates:0];
  objc_destroyWeak(&v97);

  objc_destroyWeak(&v100);
  objc_destroyWeak(v80);
  objc_destroyWeak(v77);
  objc_destroyWeak(v74);
  objc_destroyWeak(v75);
  objc_destroyWeak(v78);
  objc_destroyWeak(v76);
  objc_destroyWeak(v81);
  objc_destroyWeak(v79);
  objc_destroyWeak(v82);
  objc_destroyWeak(v84);
  objc_destroyWeak(v83);
  objc_destroyWeak(v86);
  objc_destroyWeak(v85);
  objc_destroyWeak(v87);
  objc_destroyWeak(v88);
  objc_destroyWeak(v90);
  objc_destroyWeak(v89);
  objc_destroyWeak(v91);
  objc_destroyWeak(v92);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained prominentPlayButton];
  id v4 = v3;
  if (a2) {
    id v5 = @"pause.fill";
  }
  else {
    id v5 = @"play.fill";
  }
  [v3 setAlternateImageName:v5];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContainerInclusion];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained prominentPlayButton];
  [v6 setNeedsLayout];

  id v7 = objc_loadWeakRetained(v4);
  char v8 = [v7 standardPlayPauseButton];
  [v8 setHasAlternateAppearance:a2];

  id v13 = objc_loadWeakRetained(v4);
  double v9 = [v13 prominentPlayButton];
  BOOL v10 = v9;
  if (a2)
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    if ([v11 prominentPlayButtonCanShowPauseGlyph]) {
      id v12 = @"pause.fill";
    }
    else {
      id v12 = @"play.fill";
    }
    [v10 setImageName:v12];
  }
  else
  {
    [v9 setImageName:@"play.fill"];
  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPrefersMuted:a2];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateControlInclusion];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained volumeController];
  if (([v6 isChangingVolume] & 1) == 0)
  {
    id v7 = (id *)(a1 + 40);
    id v8 = objc_loadWeakRetained(v7);
    double v9 = [v8 window];

    if (!v9) {
      goto LABEL_5;
    }
    id v10 = objc_loadWeakRetained(v7);
    id v11 = [v10 volumeSlider];
    uint64_t v12 = [v11 isHiddenOrHasHiddenAncestor] ^ 1;

    id WeakRetained = objc_loadWeakRetained(v4);
    uint64_t v6 = [WeakRetained volumeController];
    [v6 volume];
    objc_msgSend(WeakRetained, "_updateVolumeSliderValueWithSystemVolume:animated:", v12);
  }
LABEL_5:
  id v13 = objc_loadWeakRetained(v4);
  [v13 _updateVolumeButtonGlyph];

  id v14 = objc_loadWeakRetained(v4);
  id v15 = [v14 volumeAnimator];
  [v15 restoreVolumeIfNeeded];

  id v16 = objc_loadWeakRetained(v4);
  [v16 setVolumeAnimator:0];

  char v17 = [AVPlayerControllerVolumeAnimator alloc];
  id v18 = objc_loadWeakRetained(v4);
  double v19 = [v18 playerController];
  id v20 = [(AVPlayerControllerVolumeAnimator *)v17 initWithPlayerController:v19];

  id v21 = objc_loadWeakRetained(v4);
  CGFloat v22 = [v21 playerController];
  int v23 = [v22 isMuted] & a2;

  if (a2)
  {
    BOOL v24 = [(AVPlayerControllerVolumeAnimator *)v20 canAnimateVolumeTowardsZero];
    LOBYTE(v25) = 0;
  }
  else
  {
    id v26 = objc_loadWeakRetained(v4);
    id v27 = [v26 playerController];
    int v25 = [v27 isMuted] ^ 1;

    BOOL v24 = [(AVPlayerControllerVolumeAnimator *)v20 canAnimateVolumeAwayFromZero];
  }
  id v28 = objc_loadWeakRetained(v4);
  id v29 = v28;
  if (((v23 | v25) & 1) != 0 || !v24)
  {
    double v35 = [v28 playerController];
    [v35 setMuted:a2];
  }
  else
  {
    [v28 setVolumeAnimator:v20];

    double v30 = [MEMORY[0x1E4F29128] UUID];
    id v31 = objc_loadWeakRetained(v4);
    [v31 setPlayerMuteFadeAnimationID:v30];

    id v32 = objc_loadWeakRetained(v4);
    id v33 = [v32 volumeAnimator];
    double v34 = v33;
    if (a2) {
      [v33 setProgressTowardsZero:0.0];
    }
    else {
      [v33 setProgressAwayFromZero:0.0];
    }

    double v36 = objc_alloc_init(AVDisplayLink);
    id v37 = objc_loadWeakRetained(v4);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_8;
    v38[3] = &unk_1E5FC3610;
    id v29 = v30;
    id v39 = v29;
    objc_copyWeak(&v40, v4);
    char v41 = a2;
    [(AVDisplayLink *)v36 startDisplayLinkUpdatesForObserver:v37 framesPerSecond:36 usingBlock:v38];

    objc_destroyWeak(&v40);
  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_10(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContainerInclusion];

  id v6 = objc_loadWeakRetained(v4);
  id v7 = [v6 volumeController];
  [v7 setPrefersSystemVolumeHUDHidden:a2];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 setFullScreen:a2];

  id v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v9, "_prefersVolumeSliderExpandedAutomatically"));

  id v12 = objc_loadWeakRetained(v4);
  id v10 = [v12 playbackControlsView];
  id v11 = objc_loadWeakRetained(v4);
  objc_msgSend(v10, "setPrefersVolumeSliderExpandedAutomatically:", objc_msgSend(v11, "_prefersVolumeSliderExpandedAutomatically"));
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_11(uint64_t a1, uint64_t a2)
{
  int v3 = (id *)(a1 + 32);
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v4, "_prefersVolumeSliderExpandedAutomatically"));

  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:a2];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_12(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained transportControlsView];
  [v5 setShowsLiveStreamingControls:a2];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 _updatePlaybackSpeedControlInclusion];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_13(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained transportControlsView];
  [v6 setLiveStreamingControlsIncludeScrubber:a2];

  id v7 = objc_loadWeakRetained(v4);
  id v8 = [v7 skipForwardButton];
  [v8 setHasAlternateAppearance:a2];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 _updatePlaybackSpeedControlInclusion];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlaybackSpeedControlInclusion];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained transportControlsView];
  id v7 = [v6 scrubber];
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  if ([v8 hasSeekableLiveStreamingContent])
  {
    [v7 setLoadedTimeRanges:0];
  }
  else
  {
    id v9 = [v10 value];
    [v7 setLoadedTimeRanges:v9];
  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_16(uint64_t a1, uint64_t a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained transportControlsView];
  [v5 setShowsLoadingIndicator:a2];

  id v6 = (id *)(a1 + 40);
  id v7 = objc_loadWeakRetained(v6);
  LODWORD(v5) = [v7 showsLoadingIndicator];

  id v8 = objc_loadWeakRetained(v6);
  id v9 = v8;
  if (v5)
  {
    [v8 _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:1];
  }
  else
  {
    id v10 = [v8 playerController];
    double v11 = 3.0;
    if (([v10 isPlaying] & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSince1970];
      double v11 = v13;
    }
    id v9 = objc_loadWeakRetained(v6);
    [v9 _autoHideControlsAfterDelay:v11];
  }

  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v15 = objc_loadWeakRetained(v6);
  id v18 = @"AVPlaybackControlsControllerShowsLoadingIndicatorValueKey";
  id v16 = [NSNumber numberWithBool:a2];
  v19[0] = v16;
  char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v14 postNotificationName:@"AVPlaybackControlsControllsShowsLoadingIndicatorNotification" object:v15 userInfo:v17];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_18(uint64_t a1, uint64_t a2)
{
  if (a2
    && (id v4 = (id *)(a1 + 32),
        id v5 = objc_loadWeakRetained((id *)(a1 + 32)),
        [v5 loadingIndicatorTimerDelay],
        double v7 = v6,
        v5,
        v7 > 0.0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v9 = (void *)MEMORY[0x1E4F1CB00];
    id v10 = WeakRetained;
    [v10 loadingIndicatorTimerDelay];
    double v12 = v11;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_19;
    v18[3] = &unk_1E5FC4480;
    objc_copyWeak(&v19, v4);
    double v13 = [v9 scheduledTimerWithTimeInterval:0 repeats:v18 block:v12];
    [v10 setLoadingIndicatorTimer:v13];

    objc_destroyWeak(&v19);
  }
  else
  {
    id v14 = (id *)(a1 + 32);
    id v15 = objc_loadWeakRetained((id *)(a1 + 32));
    id v16 = [v15 loadingIndicatorTimer];
    [v16 invalidate];

    id v17 = objc_loadWeakRetained(v14);
    [v17 setShowsLoadingIndicator:a2];
  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = [a2 playbackControlsView];
  unint64_t v2 = [v3 controlOverflowButton];
  [v2 updateContextMenu];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = [a2 playbackControlsView];
  unint64_t v2 = [v3 controlOverflowButton];
  [v2 updateContextMenu];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = [a2 playbackControlsView];
  unint64_t v2 = [v3 controlOverflowButton];
  [v2 updateContextMenu];
}

uint64_t __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_22(uint64_t a1, void *a2)
{
  return [a2 setPendingOrientationChange:0];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v5 = a4;
  double v6 = [v5 userInfo];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB3128]];
  [v13 setPendingOrientationChange:v7];

  id v8 = [v5 object];

  id v9 = [v13 playerViewController];
  id v10 = [v9 contentView];
  double v11 = [v10 window];

  if (v8 == v11)
  {
    objc_msgSend(v13, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", objc_msgSend(v13, "_prefersVolumeSliderExpandedAutomatically"));
    double v12 = [v13 playbackControlsView];
    objc_msgSend(v12, "setPrefersVolumeSliderExpandedAutomatically:", objc_msgSend(v13, "_prefersVolumeSliderExpandedAutomatically"));
  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 shouldIgnoreTimeResolverUpdates] & 1) == 0) {
    [v2 _updateScrubberAndTimeLabels];
  }
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_19(uint64_t a1, void *a2)
{
  if ([a2 isValid])
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "setShowsLoadingIndicator:", objc_msgSend(v3, "canShowLoadingIndicator"));
  }
}

uint64_t __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 _updateVideoGravityButtonType];
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 runningTime];
  float v8 = v7 / 0.3;
  id v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  *(float *)&double v10 = v8;
  [v9 _solveForInput:v10];
  float v12 = v11;
  id v13 = *(void **)(a1 + 32);
  id v14 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v16 = [WeakRetained playerMuteFadeAnimationID];

  if (v13 != v16)
  {
    [v6 invalidate];
    id v17 = objc_loadWeakRetained((id *)(a1 + 40));
    id v18 = [v17 volumeAnimator];
    [v18 restoreVolumeIfNeeded];

    id v19 = objc_loadWeakRetained(v14);
    [v19 setVolumeAnimator:0];
LABEL_10:

    goto LABEL_11;
  }
  [v6 runningTime];
  if (v20 < 0.3)
  {
    int v21 = *(unsigned __int8 *)(a1 + 48);
    id v19 = objc_loadWeakRetained((id *)(a1 + 40));
    CGFloat v22 = [v19 volumeAnimator];
    int v23 = v22;
    double v24 = v12;
    if (v21) {
      [v22 setProgressTowardsZero:v24];
    }
    else {
      [v22 setProgressAwayFromZero:v24];
    }

    goto LABEL_10;
  }
  [v6 invalidate];
  int v25 = [v5 playerController];
  id v26 = v25;
  if (*(unsigned char *)(a1 + 48))
  {
    id v27 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v26, "setMuted:", objc_msgSend(v27, "prefersMuted"));
  }
  else
  {
    [v25 setMuted:0];
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_9;
  block[3] = &unk_1E5FC35E8;
  id v29 = *(id *)(a1 + 32);
  objc_copyWeak(&v30, (id *)(a1 + 40));
  char v31 = *(unsigned char *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v30);

LABEL_11:
}

void __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_9(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained playerMuteFadeAnimationID];

  if (v2 == v5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v6 = objc_loadWeakRetained(v3);
      int v7 = [v6 prefersMuted];

      if (v7)
      {
        id v8 = objc_loadWeakRetained(v3);
        id v9 = [v8 playerController];
        [v9 setMuted:1];
      }
    }
    id v10 = objc_loadWeakRetained(v3);
    float v11 = [v10 volumeAnimator];
    [v11 restoreVolumeIfNeeded];

    id v12 = objc_loadWeakRetained(v3);
    [v12 setPlayerMuteFadeAnimationID:0];

    id v13 = objc_loadWeakRetained(v3);
    [v13 setVolumeAnimator:0];
  }
}

uint64_t __69__AVPlaybackControlsController__startObservingForPlaybackViewUpdates__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 _updateOrCreateTimeResolverIfNeeded];
}

- (void)_updatePlaybackControlsVisibleAndObservingUpdates
{
  id v10 = [(AVPlaybackControlsController *)self playbackControlsView];
  if ([(AVPlaybackControlsController *)self showsPlaybackControls]
    && ![(AVPlaybackControlsController *)self playerViewControllerIsBeingTransitionedWithResizing]&& ![(AVPlaybackControlsController *)self forcePlaybackControlsHidden]&& ([(AVPlaybackControlsController *)self isFullScreen]|| [(AVPlaybackControlsController *)self canIncludePlaybackControlsWhenInline]))
  {
    if (!v10) {
      goto LABEL_13;
    }
    int v3 = 1;
  }
  else
  {
    if (![(AVPlaybackControlsController *)self hasCustomPlaybackControls] || !v10) {
      goto LABEL_23;
    }
    int v3 = 0;
  }
  id v4 = [(AVPlaybackControlsController *)self playbackControlsObservationController];

  if (v4)
  {
    if (v3) {
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = [[AVObservationController alloc] initWithOwner:self];
    [(AVPlaybackControlsController *)self setPlaybackControlsObservationController:v8];

    [(AVPlaybackControlsController *)self _startObservingForPlaybackViewUpdates];
    if (v3)
    {
LABEL_13:
      [v10 setHidden:0];
      [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:[(AVPlaybackControlsController *)self showsPlaybackControls]];
      if (![(AVPlaybackControlsController *)self isHidingItemsForTransition]) {
        goto LABEL_25;
      }
      if (![(AVPlaybackControlsController *)self isFullScreen]
        || [(AVPlaybackControlsController *)self timeControlStatus] != 2)
      {
        goto LABEL_20;
      }
      id v5 = [(AVPlaybackControlsController *)self playerController];
      if (([v5 isPlayingOnExternalScreen] & 1) == 0)
      {
        id v6 = [(AVPlaybackControlsController *)self playerViewController];
        if (![v6 isAudioOnlyContent])
        {
          BOOL v9 = [(AVPlaybackControlsController *)self canHidePlaybackControls];

          if (v9)
          {
            uint64_t v7 = 0;
            goto LABEL_21;
          }
LABEL_20:
          uint64_t v7 = [(AVPlaybackControlsController *)self isPictureInPictureActive] ^ 1;
LABEL_21:
          [(AVPlaybackControlsController *)self endHidingItemsForTransitionAndShowImmediately:v7];
          goto LABEL_25;
        }
      }
      goto LABEL_20;
    }
  }
LABEL_23:
  if (![(AVPlaybackControlsController *)self isHidingItemsForTransition]) {
    [(AVPlaybackControlsController *)self beginHidingItemsForTransition];
  }
LABEL_25:
  [(AVPlaybackControlsController *)self _updateRouteDetectionEnabled];
}

- (void)endHidingItemsForTransitionAndShowImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVPlaybackControlsController *)self setHidingItemsForTransition:0];
  [(AVPlaybackControlsController *)self showPlaybackControls:v3 immediately:1];
  id v5 = [(AVPlaybackControlsController *)self playerController];
  uint64_t v6 = [v5 timeControlStatus];

  if (v6 == 2 && v3)
  {
    [(AVPlaybackControlsController *)self flashPlaybackControlsWithDuration:3.0];
  }
}

- (void)_hideContextMenusIfPresented
{
  id v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v2 = [v4 controlOverflowButton];
  BOOL v3 = [v2 contextMenuInteraction];
  [v3 dismissMenu];
}

- (void)beginHidingItemsForTransition
{
  [(AVPlaybackControlsController *)self showPlaybackControls:0 immediately:1];

  [(AVPlaybackControlsController *)self setHidingItemsForTransition:1];
}

- (BOOL)isUserInteracting
{
  return [(AVPlaybackControlsController *)self userInteractingCount] != 0;
}

- (void)endUserInteraction
{
  [(AVPlaybackControlsController *)self setUserInteractingCount:[(AVPlaybackControlsController *)self userInteractingCount] - 1];
  if (![(AVPlaybackControlsController *)self userInteractingCount])
  {
    BOOL v3 = [(AVPlaybackControlsController *)self playerController];
    int v4 = [v3 isPlaying];

    if (v4)
    {
      [(AVPlaybackControlsController *)self _autoHideControlsAfterDelay:3.0];
    }
  }
}

- (void)beginUserInteraction
{
  [(AVPlaybackControlsController *)self setUserInteractingCount:[(AVPlaybackControlsController *)self userInteractingCount] + 1];
  id v3 = [(AVPlaybackControlsController *)self playbackControlsVisibilityTimer];
  [v3 invalidate];
}

- (BOOL)prefersStatusBarHidden
{
  if ([(AVPlaybackControlsController *)self isHidingItemsForTransition]) {
    return 1;
  }
  else {
    return ![(AVPlaybackControlsController *)self isShowingPlaybackControls];
  }
}

- (void)setPopoverIsBeingPresented:(BOOL)a3
{
  if (self->_popoverIsBeingPresented != a3)
  {
    self->_popoverIsBeingPresented = a3;
    if (a3)
    {
      [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:1];
    }
    else
    {
      int v4 = [(AVPlaybackControlsController *)self playerController];
      int v5 = [v4 isPlaying];

      if (v5)
      {
        [(AVPlaybackControlsController *)self flashPlaybackControlsWithDuration:3.0];
      }
    }
  }
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  if (self->_pictureInPictureActive != a3)
  {
    self->_pictureInPictureActive = a3;
    if (a3)
    {
      uint64_t v4 = 0;
    }
    else
    {
      int v5 = [(AVPlaybackControlsController *)self playerController];
      uint64_t v4 = [v5 isPlaying] ^ 1;
    }
    [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:v4];
  }
}

- (void)endShowingItemsDueToIndirectUserInteraction
{
  if ([(AVPlaybackControlsController *)self isPopoverBeingPresented]
    || [(AVPlaybackControlsController *)self isPictureInPictureActive])
  {
    return;
  }
  id v5 = [(AVPlaybackControlsController *)self playerController];
  if ([v5 isPlayingOnExternalScreen]) {
    goto LABEL_7;
  }
  id v3 = [(AVPlaybackControlsController *)self playerViewController];
  if ([v3 isAudioOnlyContent])
  {

LABEL_7:

    return;
  }
  BOOL v4 = [(AVPlaybackControlsController *)self canHidePlaybackControls];

  if (v4)
  {
    [(AVPlaybackControlsController *)self showPlaybackControls:0 immediately:0];
  }
}

- (void)beginShowingItemsDueToIndirectUserInteraction
{
  if (![(AVPlaybackControlsController *)self isPopoverBeingPresented]
    && ![(AVPlaybackControlsController *)self isPictureInPictureActive])
  {
    [(AVPlaybackControlsController *)self flashPlaybackControlsWithDuration:3.0];
  }
}

- (void)_autoHideControlsAfterDelay:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[AVPlaybackControlsController _autoHideControlsAfterDelay:]";
    __int16 v13 = 2048;
    double v14 = a3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s delay: %f", buf, 0x16u);
  }

  uint64_t v6 = [(AVPlaybackControlsController *)self playbackControlsVisibilityTimer];
  [v6 invalidate];

  objc_initWeak((id *)buf, self);
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__AVPlaybackControlsController__autoHideControlsAfterDelay___block_invoke;
  v9[3] = &unk_1E5FC4480;
  objc_copyWeak(&v10, (id *)buf);
  id v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v9 block:a3];
  [(AVPlaybackControlsController *)self setPlaybackControlsVisibilityTimer:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __60__AVPlaybackControlsController__autoHideControlsAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:0];
    id WeakRetained = v2;
  }
}

- (void)flashVolumeControlsWithDuration:(double)a3
{
  BOOL v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v5 = [v4 volumeControlsContainer];
  BOOL v6 = ([v5 isIncluded] & 1) != 0
    || [(AVPlaybackControlsController *)self _prefersVolumeSliderExpandedAutomatically];
  [(AVPlaybackControlsController *)self _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:v6];

  uint64_t v7 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v7 setShowsAudioControls:1];

  id v8 = [(AVPlaybackControlsController *)self playerController];
  if ([v8 isPlaying])
  {
  }
  else
  {
    BOOL v9 = [(AVPlaybackControlsController *)self playbackControlsView];
    char v10 = [v9 showsPlaybackControls];

    if (v10) {
      return;
    }
  }

  [(AVPlaybackControlsController *)self _autoHideControlsAfterDelay:2.0];
}

- (void)showPlaybackControls:(BOOL)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(AVPlaybackControlsController *)self playbackControlsVisibilityTimer];
  [v7 invalidate];

  id v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    float v11 = "-[AVPlaybackControlsController showPlaybackControls:immediately:]";
    __int16 v12 = 1024;
    BOOL v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 1024;
    BOOL v17 = [(AVPlaybackControlsController *)self isHidingItemsForTransition];
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s shouldShowPlaybackControls: %d {\n\tshowImmediately: %d\n\tisHidingItemsForTransition: %d}", (uint8_t *)&v10, 0x1Eu);
  }

  if (![(AVPlaybackControlsController *)self isHidingItemsForTransition])
  {
    [(AVPlaybackControlsController *)self setShowingPlaybackControls:v5];
    BOOL v9 = [(AVPlaybackControlsController *)self playbackControlsView];
    [v9 showPlaybackControls:v5 immediately:v4];
  }
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    BOOL v9 = "-[AVPlaybackControlsController flashPlaybackControlsWithDuration:]";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s duration: %f", (uint8_t *)&v8, 0x16u);
  }

  if (![(AVPlaybackControlsController *)self isPictureInPictureActive])
  {
    BOOL v6 = [(AVPlaybackControlsController *)self playerController];
    if ([v6 isPlayingOnExternalScreen])
    {
    }
    else
    {
      BOOL v7 = [(AVPlaybackControlsController *)self showsPlaybackControls];

      if (v7)
      {
        [(AVPlaybackControlsController *)self showPlaybackControls:1 immediately:0];
        [(AVPlaybackControlsController *)self _autoHideControlsAfterDelay:a3];
      }
    }
  }
}

- (void)_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(AVPlaybackControlsController *)self playerController];
  int v6 = [v5 isPlayingOnExternalScreen];

  BOOL v7 = [(AVPlaybackControlsController *)self playerViewController];
  unsigned int v8 = [v7 isAudioOnlyContent];

  if (([(AVPlaybackControlsController *)self isUserInteracting] || v3)
    && ![(AVPlaybackControlsController *)self isPictureInPictureActive])
  {
    uint64_t v9 = 1;
    if (v3) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = v6 | v8;
    if (v3) {
      goto LABEL_17;
    }
  }
  if (![(AVPlaybackControlsController *)self isUserInteracting]
    && ![(AVPlaybackControlsController *)self isPopoverBeingPresented]
    && ![(AVPlaybackControlsController *)self showsLoadingIndicator]
    && ![(AVPlaybackControlsController *)self isPictureInPictureActive]
    && (![(AVPlaybackControlsController *)self canHidePlaybackControls] | v6 | v8) != 1)
  {
    goto LABEL_27;
  }
  if (![(AVPlaybackControlsController *)self isPopoverBeingPresented]
    && ![(AVPlaybackControlsController *)self showsLoadingIndicator]
    && [(AVPlaybackControlsController *)self canHidePlaybackControls])
  {
    if (!v9) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_17:
  if ([(AVPlaybackControlsController *)self isPictureInPictureActive])
  {
    __int16 v10 = [(AVPlaybackControlsController *)self playerController];
    if ([v10 isPlayingOnExternalScreen])
    {

      goto LABEL_21;
    }
    double v11 = [(AVPlaybackControlsController *)self playerViewController];
    char v12 = [v11 isAudioOnlyContent];

    if (v12) {
      goto LABEL_21;
    }
LABEL_27:
    uint64_t v9 = 0;
    goto LABEL_24;
  }
LABEL_21:
  BOOL v13 = [(AVPlaybackControlsController *)self playbackControlsView];
  char v14 = [v13 showsAudioControls];

  if ((v14 & 1) == 0) {
    [(AVPlaybackControlsController *)self _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:[(AVPlaybackControlsController *)self _prefersVolumeSliderExpandedAutomatically]];
  }
  uint64_t v9 = 1;
LABEL_24:
  BOOL v15 = _AVLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136317442;
    BOOL v17 = "-[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:]";
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    __int16 v22 = 1024;
    BOOL v23 = [(AVPlaybackControlsController *)self isUserInteracting];
    __int16 v24 = 1024;
    BOOL v25 = [(AVPlaybackControlsController *)self isPictureInPictureActive];
    __int16 v26 = 1024;
    int v27 = v6;
    __int16 v28 = 1024;
    unsigned int v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = [(AVPlaybackControlsController *)self isPopoverBeingPresented];
    __int16 v32 = 1024;
    BOOL v33 = [(AVPlaybackControlsController *)self showsLoadingIndicator];
    __int16 v34 = 1024;
    BOOL v35 = [(AVPlaybackControlsController *)self canHidePlaybackControls];
    _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "%s shouldShowPlaybackControls: %d {\n\twantsPlaybackControlsVisible: %d\n\tisUserInteracting: %d\n\tisPictureInPictureActive: %d\n\tplayingOnExternalScreen: %d\n\taudioOnlyContent: %d\n\tisPopoverBeingPresented: %d\n\tshowsLoadingIndicator: %d\n\tcanHidePlaybackControls: %d\n}", (uint8_t *)&v16, 0x42u);
  }

  [(AVPlaybackControlsController *)self showPlaybackControls:v9 immediately:0];
}

- (void)togglePlaybackControlsVisibility
{
  BOOL v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  objc_msgSend(v3, "setPrefersVolumeSliderExpandedAutomatically:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));

  BOOL v4 = [(AVPlaybackControlsController *)self playerController];
  if ([v4 isPlaying])
  {
    BOOL v5 = [(AVPlaybackControlsController *)self isShowingPlaybackControls];

    if (!v5)
    {
      [(AVPlaybackControlsController *)self flashPlaybackControlsWithDuration:3.0];
      return;
    }
  }
  else
  {
  }
  uint64_t v6 = [(AVPlaybackControlsController *)self isShowingPlaybackControls] ^ 1;

  [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:v6];
}

- (void)setForcePlaybackControlsHidden:(BOOL)a3
{
  if (self->_forcePlaybackControlsHidden != a3)
  {
    self->_forcePlaybackControlsHidden = a3;
    [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibleAndObservingUpdates];
  }
}

- (void)_seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  uint64_t v9 = [(AVPlaybackControlsController *)self playerController];
  char v10 = objc_opt_respondsToSelector();

  id v12 = [(AVPlaybackControlsController *)self playerController];
  if (v10)
  {
    [v12 seekByTimeInterval:a3 toleranceBefore:a4 toleranceAfter:a5];
  }
  else
  {
    [(AVPlaybackControlsController *)self currentTime];
    [v12 seekToTime:v11 + a3];
  }
}

- (void)_observeBoolForKeyPath:(id)a3 usingKeyValueObservationController:(id)a4 observationHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (id)[(AVPlaybackControlsController *)self valueForKeyPath:v8];
  id v12 = (void *)[v10 copy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__AVPlaybackControlsController__observeBoolForKeyPath_usingKeyValueObservationController_observationHandler___block_invoke;
  v15[3] = &unk_1E5FC3578;
  id v13 = v12;
  id v16 = v13;
  id v14 = (id)[v9 startObserving:self keyPath:v8 includeInitialValue:1 observationHandler:v15];
}

void __109__AVPlaybackControlsController__observeBoolForKeyPath_usingKeyValueObservationController_observationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a4 value];
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [v5 BOOLValue]);
}

- (void)_bindInclusionOfControlItems:(id)a3 toKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__AVPlaybackControlsController__bindInclusionOfControlItems_toKeyPath___block_invoke;
  v10[3] = &unk_1E5FC3550;
  id v9 = v6;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:v7 usingKeyValueObservationController:v8 observationHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __71__AVPlaybackControlsController__bindInclusionOfControlItems_toKeyPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  uint64_t v19 = a1;
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v22;
    id v8 = (id *)(a1 + 40);
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "setIncluded:", a2, v19);
        id WeakRetained = objc_loadWeakRetained(v8);
        id v12 = [WeakRetained playbackControlsView];
        id v13 = [v12 transportControlsView];
        LOBYTE(v10) = [v10 isDescendantOfView:v13];

        v6 |= v10;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  id v14 = objc_loadWeakRetained((id *)(v19 + 40));
  BOOL v15 = [v14 playbackControlsView];
  [v15 setNeedsLayout];

  if (v6)
  {
    id v16 = objc_loadWeakRetained((id *)(v19 + 40));
    uint64_t v17 = [v16 playbackControlsView];
    __int16 v18 = [v17 transportControlsView];
    [v18 setNeedsLayout];
  }
}

- (void)_bindEnabledStateOfControls:(id)a3 toKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__AVPlaybackControlsController__bindEnabledStateOfControls_toKeyPath___block_invoke;
  v10[3] = &unk_1E5FC3528;
  id v11 = v6;
  id v9 = v6;
  [(AVPlaybackControlsController *)self _observeBoolForKeyPath:v7 usingKeyValueObservationController:v8 observationHandler:v10];
}

void __70__AVPlaybackControlsController__bindEnabledStateOfControls_toKeyPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setEnabled:", a2, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)startContentTransitionButtonTouchUpInside:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];

  uint64_t v6 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v7 = [v6 startLeftwardContentTransitionButton];

  if (v7 == v14)
  {
    if (v5) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
  }
  else
  {
    long long v8 = [(AVPlaybackControlsController *)self playbackControlsView];
    id v9 = [v8 startRightwardContentTransitionButton];

    uint64_t v10 = 1;
    if (v5) {
      uint64_t v10 = 2;
    }
    if (v9 == v14) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  id v12 = [(AVPlaybackControlsController *)self contentTransitionAction];

  if (v12)
  {
    uint64_t v13 = [(AVPlaybackControlsController *)self contentTransitionAction];
    v13[2](v13, v11);
  }
}

- (void)skipButtonForcePressChanged:(id)a3
{
  id v11 = a3;
  [v11 maximumForceSinceTrackingBegan];
  double v5 = v4;
  [v11 forceThreshold];
  if (v5 >= v6)
  {
    id v7 = [(AVPlaybackControlsController *)self playbackControlsView];
    id v8 = [v7 skipForwardButton];

    id v9 = [(AVPlaybackControlsController *)self playerController];
    [v11 force];
    if (v8 != v11) {
      double v10 = -v10;
    }
    [v9 setRateWithForce:v10];
  }
}

- (void)skipButtonLongPressEnded:(id)a3
{
  id v10 = a3;
  double v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v5 = [v4 skipBackButton];

  if (v5 == v10)
  {
    id v9 = [(AVPlaybackControlsController *)self playerController];
    [v9 endScanningBackward:v10];
  }
  else
  {
    double v6 = [(AVPlaybackControlsController *)self playbackControlsView];
    id v7 = [v6 skipForwardButton];

    id v8 = v10;
    if (v7 != v10) {
      goto LABEL_6;
    }
    id v9 = [(AVPlaybackControlsController *)self playerController];
    [v9 endScanningForward:v10];
  }

  id v8 = v10;
LABEL_6:
}

- (void)skipButtonLongPressTriggered:(id)a3
{
  id v10 = a3;
  double v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v5 = [v4 skipBackButton];

  if (v5 == v10)
  {
    id v9 = [(AVPlaybackControlsController *)self playerController];
    [v9 beginScanningBackward:v10];
  }
  else
  {
    double v6 = [(AVPlaybackControlsController *)self playbackControlsView];
    id v7 = [v6 skipForwardButton];

    id v8 = v10;
    if (v7 != v10) {
      goto LABEL_6;
    }
    id v9 = [(AVPlaybackControlsController *)self playerController];
    [v9 beginScanningForward:v10];
  }

  id v8 = v10;
LABEL_6:
}

- (void)skipButtonTouchUpInside:(id)a3
{
  id v16 = a3;
  if (([v16 wasLongPressed] & 1) == 0)
  {
    [v16 maximumForceSinceTrackingBegan];
    double v5 = v4;
    [v16 forceThreshold];
    if (v5 < v6)
    {
      id v7 = [(AVPlaybackControlsController *)self playbackControlsView];
      id v8 = [v7 skipForwardButton];
      if (v8 == v16)
      {
        id v9 = [(AVPlaybackControlsController *)self playbackControlsView];
        id v10 = [v9 transportControlsView];
        int v11 = [v10 liveStreamingControlsIncludeScrubber];

        if (v11)
        {
          id v12 = [(AVPlaybackControlsController *)self playerController];
          [v12 gotoEndOfSeekableRanges:v16];

          goto LABEL_10;
        }
      }
      else
      {
      }
      uint64_t v13 = [(AVPlaybackControlsController *)self playbackControlsView];
      id v14 = [v13 skipForwardButton];

      double v15 = -15.0;
      if (v14 == v16) {
        double v15 = 15.0;
      }
      [(AVPlaybackControlsController *)self _seekByTimeInterval:v15 toleranceBefore:0.5 toleranceAfter:0.5];
    }
  }
LABEL_10:
}

- (void)prominentPlayButtonTouchUpInside:(id)a3
{
  id v14 = a3;
  double v4 = [(AVPlaybackControlsController *)self playerController];
  if ([v4 canTogglePlayback])
  {
    double v5 = [(AVPlaybackControlsController *)self playerController];
    char v6 = [v5 isPlaying];

    if ((v6 & 1) == 0)
    {
      id v7 = [(AVPlaybackControlsController *)self playerViewController];
      [v7 togglePlayback:v14];

      [(AVPlaybackControlsController *)self _updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:1 playing:1 userDidEndTappingProminentPlayButton:1];
      goto LABEL_9;
    }
  }
  else
  {
  }
  if ([(AVPlaybackControlsController *)self isFullScreen]) {
    goto LABEL_8;
  }
  id v8 = [(AVPlaybackControlsController *)self playerController];
  if ([v8 status])
  {

LABEL_8:
    id v9 = [(AVPlaybackControlsController *)self playerController];
    BOOL v10 = [v9 status] == 2;
    int v11 = [(AVPlaybackControlsController *)self playerController];
    -[AVPlaybackControlsController _updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:](self, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", v10, [v11 isPlaying], 1);

    goto LABEL_9;
  }
  id v12 = [(AVPlaybackControlsController *)self playButtonHandlerForLazyPlayerLoading];

  if (!v12) {
    goto LABEL_8;
  }
  [(AVPlaybackControlsController *)self startUpdatesIfNeeded];
  uint64_t v13 = [(AVPlaybackControlsController *)self playButtonHandlerForLazyPlayerLoading];
  v13[2]();

LABEL_9:
}

- (void)playbackSpeedButtonTapped:(id)a3
{
  id v4 = [(AVPlaybackControlsController *)self playbackSpeedCollection];
  [v4 selectNextPlaybackSpeed:self];
}

- (id)overflowMenuItemsForControlOverflowButton:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA48] array];
  char v6 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v7 = [v6 mediaSelectionButton];
  if ([v7 isIncluded])
  {
    id v8 = [(AVPlaybackControlsController *)self playbackControlsView];
    id v9 = [v8 mediaSelectionButton];
    int v10 = [v9 isCollapsed];

    if (!v10) {
      goto LABEL_11;
    }
    int v11 = [(AVPlaybackControlsController *)self playerController];
    char v6 = [v11 audioMediaSelectionOptions];

    id v12 = [(AVPlaybackControlsController *)self playerController];
    id v7 = [v12 legibleMediaSelectionOptions];

    mediaSelectionMenuController = self->_mediaSelectionMenuController;
    id v61 = v4;
    if (mediaSelectionMenuController)
    {
      [(AVMediaSelectionMenuController *)mediaSelectionMenuController setAudibleOptions:v6];
      [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController setLegibleOptions:v7];
    }
    else
    {
      id v14 = [[AVMediaSelectionMenuController alloc] initWithAudibleOptions:v6 legibleOptions:v7];
      double v15 = self->_mediaSelectionMenuController;
      self->_mediaSelectionMenuController = v14;

      [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController setDelegate:self];
    }
    id v16 = [(AVPlaybackControlsController *)self playerController];
    uint64_t v17 = [v16 audioMediaSelectionOptions];
    __int16 v18 = [(AVPlaybackControlsController *)self playerController];
    uint64_t v19 = [v18 currentAudioMediaSelectionOption];
    uint64_t v20 = [v17 indexOfObject:v19];

    long long v21 = [(AVPlaybackControlsController *)self playerController];
    long long v22 = [v21 legibleMediaSelectionOptions];
    long long v23 = [(AVPlaybackControlsController *)self playerController];
    long long v24 = [v23 currentLegibleMediaSelectionOption];
    uint64_t v25 = [v22 indexOfObject:v24];

    [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController setCurrentAudibleOptionIndex:v20];
    [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController setCurrentLegibleOptionIndex:v25];
    uint64_t v26 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController audibleOptionsMenu];

    if (v26)
    {
      int v27 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController audibleOptionsMenu];
      [v5 addObject:v27];
    }
    __int16 v28 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController legibleOptionsMenu];

    id v4 = v61;
    if (v28)
    {
      unsigned int v29 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController legibleOptionsMenu];
      [v5 addObject:v29];
    }
  }

LABEL_11:
  __int16 v30 = [(AVPlaybackControlsController *)self playbackControlsView];
  BOOL v31 = [v30 playbackSpeedButton];
  if ([v31 isIncluded])
  {
    __int16 v32 = [(AVPlaybackControlsController *)self playbackControlsView];
    BOOL v33 = [v32 playbackSpeedButton];
    int v34 = [v33 isCollapsed];

    if (!v34) {
      goto LABEL_15;
    }
    __int16 v30 = [(AVPlaybackControlsController *)self playbackRateMenuController];
    BOOL v31 = [v30 menu];
    [v5 addObject:v31];
  }

LABEL_15:
  BOOL v35 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v36 = [v35 routePickerView];
  if ([v36 isIncluded])
  {
    id v37 = [(AVPlaybackControlsController *)self playbackControlsView];
    CGFloat v38 = [v37 routePickerView];
    int v39 = [v38 isCollapsed];

    if (v39)
    {
      id v40 = [(AVPlaybackControlsController *)self playbackControlsView];
      char v41 = [v40 routePickerView];

      CGFloat v42 = AVLocalizedString(@"EXTERNAL_PLAYBACK_OVERFLOW_MENU_ITEM_TITLE");
      BOOL v43 = objc_msgSend(MEMORY[0x1E4FB1818], "avkit_imageWithSymbolNamed:textStyle:scale:", @"airplayvideo", *MEMORY[0x1E4FB28C8], -1);
      if ([v41 isAirPlayActive])
      {
        uint64_t v44 = [MEMORY[0x1E4FB1618] colorWithRed:0.5 green:0.86 blue:1.0 alpha:1.0];
        uint64_t v45 = [v43 imageWithTintColor:v44 renderingMode:1];

        BOOL v43 = (void *)v45;
      }
      objc_initWeak(&location, self);
      v46 = (void *)MEMORY[0x1E4FB13F0];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke;
      v64[3] = &unk_1E5FC34B8;
      id v47 = v41;
      id v65 = v47;
      objc_copyWeak(&v66, &location);
      CGRect v48 = [v46 actionWithTitle:v42 image:v43 identifier:0 handler:v64];
      [v5 addObject:v48];

      objc_destroyWeak(&v66);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
  if (self->_transportBarCustomMenuItems)
  {
    CGRect v49 = [(AVPlaybackControlsController *)self playbackControlsView];
    CGRect v50 = [v49 transportControlsView];
    CGRect v51 = [v50 customMenuItemsViews];

    uint64_t v52 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
    uint64_t v53 = [v51 filteredArrayUsingPredicate:v52];

    id v54 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    transportBarCustomMenuItems = self->_transportBarCustomMenuItems;
    v56 = (void *)MEMORY[0x1E4F28F60];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke_3;
    v62[3] = &unk_1E5FC3500;
    id v63 = v53;
    id v57 = v53;
    id v58 = [v56 predicateWithBlock:v62];
    v59 = [(NSArray *)transportBarCustomMenuItems filteredArrayUsingPredicate:v58];

    [v5 addObjectsFromArray:v59];
  }

  return v5;
}

void __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 presentRoutePicker:WeakRetained];
}

BOOL __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v17 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        uint64_t v13 = [v5 identifier];
        id v14 = [v12 menuElementIdentifier];

        if (v13 == v14)
        {
          id v15 = v5;

          id v9 = v15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9 != 0;
}

uint64_t __74__AVPlaybackControlsController_overflowMenuItemsForControlOverflowButton___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v6 && [v6 isIncluded]) {
    uint64_t v8 = [v7 isCollapsed];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:(id)a3
{
  id v3 = [(AVPlaybackControlsController *)self playerController];
  char v4 = [v3 closedCaptionsEnabled];

  return v4;
}

- (void)mediaSelectionMenuController:(id)a3 didSelectOption:(id)a4
{
  id v10 = a4;
  id v6 = [a3 audibleOptions];
  int v7 = [v6 containsObject:v10];

  uint64_t v8 = [(AVPlaybackControlsController *)self playerController];
  id v9 = v8;
  if (v7) {
    [v8 setCurrentAudioMediaSelectionOption:v10];
  }
  else {
    [v8 setCurrentLegibleMediaSelectionOption:v10];
  }
}

- (void)routePickerViewDidEndPresentingRoutes:(id)a3
{
}

- (void)routePickerViewWillBeginPresentingRoutes:(id)a3
{
}

- (void)_updateVolumeSliderValueWithSystemVolume:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = 0.0;
  if (![(AVPlaybackControlsController *)self prefersMuted])
  {
    uint64_t v8 = [(AVPlaybackControlsController *)self volumeController];
    int v9 = [v8 currentRouteHasVolumeControl];

    if (v9) {
      float v7 = a3;
    }
    else {
      float v7 = 1.0;
    }
  }
  id v12 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v10 = [v12 volumeSlider];
  *(float *)&double v11 = v7;
  [v10 setValue:v4 animated:v11];
}

- (id)_volumeButtonMicaPackageState
{
  if ([(AVPlaybackControlsController *)self prefersMuted]) {
    goto LABEL_15;
  }
  BOOL v4 = [(AVPlaybackControlsController *)self volumeController];
  id v5 = (void *)[v4 currentRouteHasVolumeControl];

  id v6 = &AVVolumeGlyphStateNameMax;
  if (!v5) {
    goto LABEL_16;
  }
  float v7 = [(AVPlaybackControlsController *)self playbackControlsView];
  if (v7 && ![(AVPlaybackControlsController *)self isResumingUpdates])
  {
    id v5 = [(AVPlaybackControlsController *)self playbackControlsView];
    id v2 = [v5 volumeSlider];
    if (([v2 isHiddenOrHasHiddenAncestor] & 1) == 0)
    {
      id v12 = [(AVPlaybackControlsController *)self playbackControlsView];
      uint64_t v13 = [v12 volumeSlider];
      [v13 value];
      float v11 = v14;

      goto LABEL_11;
    }
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  int v9 = [(AVPlaybackControlsController *)self volumeController];
  [v9 volume];
  float v11 = v10;

  if (v8)
  {
LABEL_11:
  }
  if (v11 <= 0.0)
  {
LABEL_15:
    id v6 = AVVolumeGlyphStateNameMuted;
    goto LABEL_16;
  }
  double v15 = v11;
  if (v11 >= 0.33)
  {
    if (v15 >= 0.66)
    {
      if (v15 < 0.95) {
        id v6 = AVVolumeGlyphStateNameHigh;
      }
    }
    else
    {
      id v6 = AVVolumeGlyphStateNameMedium;
    }
  }
  else
  {
    id v6 = AVVolumeGlyphStateNameLow;
  }
LABEL_16:
  id v16 = *v6;

  return v16;
}

- (void)_updateVolumeButtonGlyph
{
  id v6 = [(AVPlaybackControlsController *)self _volumeButtonMicaPackageState];
  id v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  BOOL v4 = [v3 volumeButton];
  [v4 setMicaPackageStateName:v6];

  id v5 = [(AVPlaybackControlsController *)self turboModePlaybackControlsPlaceholderView];
  [v5 setVolumeButtonMicaPackageStateName:v6];
}

- (void)_showOrHideDisplayModeControls
{
  if (-[AVPlaybackControlsController playbackControlsIncludeDisplayModeControls](self, "playbackControlsIncludeDisplayModeControls")|| (-[AVPlaybackControlsController playbackControlsView](self, "playbackControlsView"), v3 = objc_claimAutoreleasedReturnValue(), [v3 customDisplayModeItems], BOOL v4 = objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "count"), v4, v3, !v5))
  {
    int v7 = ![(AVPlaybackControlsController *)self isFullScreen]
      && [(AVPlaybackControlsController *)self allowsEnteringFullScreen];
    if ([(AVPlaybackControlsController *)self showsDoneButtonWhenFullScreen]) {
      int v8 = [(AVPlaybackControlsController *)self isFullScreen];
    }
    else {
      int v8 = 0;
    }
    BOOL v6 = [(AVPlaybackControlsController *)self showsPictureInPictureButton];
    BOOL v9 = [(AVPlaybackControlsController *)self canIncludeVideoGravityButton];
  }
  else
  {
    BOOL v6 = 0;
    int v7 = 0;
    int v8 = 0;
    BOOL v9 = 0;
  }
  float v10 = [(AVPlaybackControlsController *)self playbackControlsView];
  float v11 = [v10 fullScreenButton];
  if (v7 != [v11 isIncluded]) {
    goto LABEL_16;
  }
  id v12 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v13 = [v12 doneButton];
  if (v8 != [v13 isIncluded])
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  int v32 = v8;
  [(AVPlaybackControlsController *)self playbackControlsView];
  v15 = int v14 = v6;
  id v16 = [v15 pictureInPictureButton];
  BOOL v33 = v14;
  if (v14 != [v16 isIncluded])
  {

    int v8 = v32;
    BOOL v6 = v33;
    goto LABEL_15;
  }
  __int16 v28 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v28 videoGravityButton];
  unsigned int v29 = v31 = v9;
  int v30 = [v29 isIncluded];

  BOOL v9 = v31;
  int v8 = v32;
  BOOL v6 = v33;
  if (v31 == v30) {
    return;
  }
LABEL_17:
  id v17 = [(AVPlaybackControlsController *)self playbackControlsView];

  if (!v17) {
    return;
  }
  id v34 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    long long v21 = [(AVPlaybackControlsController *)self playbackControlsView];
    [v21 fullScreenButton];
    v23 = int v22 = v8;
    [v34 addObject:v23];

    if (!v22)
    {
LABEL_20:
      if (!v6) {
        goto LABEL_21;
      }
LABEL_28:
      uint64_t v26 = [(AVPlaybackControlsController *)self playbackControlsView];
      int v27 = [v26 pictureInPictureButton];
      [v34 addObject:v27];

      if (!v9) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if (!v8)
  {
    goto LABEL_20;
  }
  long long v24 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v25 = [v24 doneButton];
  [v34 addObject:v25];

  if (v6) {
    goto LABEL_28;
  }
LABEL_21:
  if (v9)
  {
LABEL_22:
    long long v18 = [(AVPlaybackControlsController *)self playbackControlsView];
    long long v19 = [v18 videoGravityButton];
    [v34 addObject:v19];
  }
LABEL_23:
  long long v20 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v20 updateDisplayControlsVisibilityIncludedButtons:v34];
}

- (BOOL)_prefersVolumeSliderExpandedAutomatically
{
  id v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  BOOL v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  BOOL v6 = [(AVPlaybackControlsController *)self playerViewController];
  int v7 = [v6 contentView];
  int v8 = [v7 layoutClass];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v9 == 2)
  {
    float v10 = [(AVPlaybackControlsController *)self pendingOrientationChange];
    BOOL v11 = (unint64_t)([v10 integerValue] - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    BOOL v11 = 0;
  }
  id v12 = [(AVPlaybackControlsController *)self playerViewController];
  uint64_t v13 = [v12 contentView];
  int v14 = [v13 layoutClass];
  uint64_t v15 = [v14 unsignedIntegerValue];

  if (v15 == 1)
  {
    id v16 = [(AVPlaybackControlsController *)self pendingOrientationChange];
    BOOL v17 = (unint64_t)([v16 integerValue] - 3) < 2;
  }
  else
  {
    BOOL v17 = 0;
  }
  long long v18 = [(AVPlaybackControlsController *)self playbackControlsView];
  long long v19 = [v18 customAudioItems];
  uint64_t v20 = [v19 count];

  if (v20) {
    goto LABEL_8;
  }
  BOOL v21 = [(AVPlaybackControlsController *)self volumeControlsCanShowSlider];
  if (!v21) {
    return v21;
  }
  int v22 = [(AVPlaybackControlsController *)self playerController];
  char v23 = [v22 isPlayingOnExternalScreen];

  if (v23)
  {
LABEL_8:
    LOBYTE(v21) = 0;
  }
  else
  {
    LOBYTE(v21) = [(AVPlaybackControlsController *)self isFullScreen];
    if (v21 && v5 != 2) {
      LOBYTE(v21) = v17 || v11;
    }
  }
  return v21;
}

- (BOOL)shouldShowVolumeControlInTransportBar
{
  return 0;
}

- (void)updateVolumeSliderValue:(id)a3 volumeButtonControl:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  [v26 frame];
  double Width = CGRectGetWidth(v28);
  if (Width > 0.0)
  {
    double v8 = Width;
    uint64_t v9 = [(AVPlaybackControlsController *)self volumeController];
    int v10 = [v9 currentRouteHasVolumeControl];

    if (v10)
    {
      [v26 value];
      float v12 = v11;
      [v6 translationOfPanFromPreviousTouch];
      float v14 = v13 / v8;
      uint64_t v15 = [v6 window];
      [v15 bounds];
      double MaxX = CGRectGetMaxX(v29);
      [v6 locationOfTouchInWindow];
      double v18 = v17;

      if ([v6 effectiveUserInterfaceLayoutDirection] == 1)
      {
        [v6 locationOfTouchInWindow];
        double v21 = v20;
        int v22 = [v6 window];
        [v22 bounds];
        double v23 = v21 - CGRectGetMinX(v30);

        float v14 = -v14;
      }
      else
      {
        double v23 = MaxX - v18;
      }
      if (v14 > 0.0 && v23 > 0.0)
      {
        double v19 = fmin(fmax(v8 * (1.0 - v12) / v23, 1.0), 3.0) * v14;
        float v14 = v19;
      }
      float v24 = fminf(fmaxf(v12 + v14, 0.0), 1.0);
      *(float *)&double v19 = v24;
      [v26 setValue:v19];
      if (v12 != v24 && (v24 == 0.0 || v24 == 1.0)) {
        [v6 triggerSelectionChangedFeedback];
      }
      [(AVPlaybackControlsController *)self volumeSliderValueDidChange:v26];
    }
  }
}

- (void)volumeButtonPanChanged:(id)a3
{
  id v4 = a3;
  [(AVPlaybackControlsController *)self _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:1];
  [(AVPlaybackControlsController *)self setPrefersMuted:0];
  id v6 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v5 = [v6 volumeSlider];
  [(AVPlaybackControlsController *)self updateVolumeSliderValue:v5 volumeButtonControl:v4];
}

- (void)endChangingVolume
{
  id v2 = [(AVPlaybackControlsController *)self volumeController];
  [v2 endChangingVolume];
}

- (void)beginChangingVolume
{
  id v2 = [(AVPlaybackControlsController *)self volumeController];
  [v2 beginChangingVolume];
}

- (void)volumeButtonLongPressTriggered:(id)a3
{
}

- (void)volumeButtonTapTriggered:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVPlaybackControlsController *)self playerViewController];
  [v5 toggleMuted:v4];

  id v6 = [(AVPlaybackControlsController *)self turboModePlaybackControlsPlaceholderView];

  if (v6)
  {
    [(AVPlaybackControlsController *)self _updateVolumeButtonGlyph];
  }
}

- (void)volumeSliderValueDidChange:(id)a3
{
  id v4 = a3;
  [(AVPlaybackControlsController *)self beginChangingVolume];
  uint64_t v5 = [(AVPlaybackControlsController *)self volumeController];
  [v4 value];
  int v7 = v6;

  LODWORD(v8) = v7;
  [v5 setTargetVolume:v8];

  [(AVPlaybackControlsController *)self _updateVolumeButtonGlyph];
}

- (void)handleCurrentRouteSupportsVolumeControlChanged:(id)a3
{
  id v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  uint64_t v5 = [v4 volumeSlider];
  int v6 = [(AVPlaybackControlsController *)self volumeController];
  objc_msgSend((id)v5, "setEnabled:", objc_msgSend(v6, "currentRouteHasVolumeControl"));

  int v7 = [(AVPlaybackControlsController *)self volumeController];
  LOBYTE(v5) = [v7 currentRouteHasVolumeControl];

  if ((v5 & 1) == 0)
  {
    double v8 = [(AVPlaybackControlsController *)self volumeController];
    -[AVPlaybackControlsController _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:](self, "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", [v8 currentRouteHasVolumeControl]);
  }
  id v9 = [(AVPlaybackControlsController *)self volumeController];
  [v9 volume];
  -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0);
}

- (void)handleVolumeChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVPlaybackControlsController *)self playbackControlsView];
  int v6 = [v5 volumeSlider];
  int v7 = [(AVPlaybackControlsController *)self volumeController];
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "currentRouteHasVolumeControl"));

  double v8 = [(AVPlaybackControlsController *)self volumeController];
  [v8 volume];
  int v10 = v9;

  float v11 = [(AVPlaybackControlsController *)self playbackControlsView];
  float v12 = [v11 volumeSlider];
  if ([v12 isTracking])
  {
  }
  else
  {
    double v13 = [(AVPlaybackControlsController *)self playbackControlsView];
    float v14 = [v13 volumeButton];
    char v15 = [v14 isTracking];

    if ((v15 & 1) == 0)
    {
      LODWORD(v16) = v10;
      [(AVPlaybackControlsController *)self _updateVolumeSliderValueWithSystemVolume:0 animated:v16];
    }
  }
  [(AVPlaybackControlsController *)self _updateVolumeButtonGlyph];
  double v17 = [v4 userInfo];

  double v18 = [v17 objectForKeyedSubscript:@"AVVolumeControllerVolumeDidChangeNotificationIsInitialValueKey"];
  char v19 = [v18 BOOLValue];

  if ((v19 & 1) == 0)
  {
    if ([(AVPlaybackControlsController *)self isFullScreen]
      || ([(AVPlaybackControlsController *)self volumeController],
          double v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 isChangingVolume],
          v20,
          v21))
    {
      [(AVPlaybackControlsController *)self setPrefersMuted:0];
      int v22 = [(AVPlaybackControlsController *)self playerViewController];
      char v23 = [v22 isBeingPresented];

      if ((v23 & 1) == 0)
      {
        [(AVPlaybackControlsController *)self flashVolumeControlsWithDuration:2.0];
      }
    }
  }
}

- (void)endScrubbing
{
  id v3 = [(AVPlaybackControlsController *)self playerController];
  [v3 endScrubbing:self];

  [(AVPlaybackControlsController *)self setPlaybackSuspendedForScrubbing:0];
  [(AVPlaybackControlsController *)self _updateOrCreateTimeResolverIfNeeded];

  [(AVPlaybackControlsController *)self setShouldIgnoreTimeResolverUpdates:0];
}

- (void)scrubToTime:(double)a3 resolution:(double)a4
{
  int v7 = [(AVPlaybackControlsController *)self playerController];
  if ([v7 hasSeekableLiveStreamingContent])
  {
    double v8 = [(AVPlaybackControlsController *)self timeResolver];
    [v8 seekableTimeRangeDuration];
  }
  else
  {
    double v8 = [(AVPlaybackControlsController *)self playerController];
    [v8 contentDuration];
  }
  double v10 = v9;

  float v11 = [(AVPlaybackControlsController *)self timeResolver];
  [v11 targetTime];
  double v13 = v12;

  double v14 = v10 / a4;
  double v15 = 0.0;
  if (a4 > 0.0) {
    double v15 = v14;
  }
  if (vabdd_f64(a3, v13) > v15)
  {
    if (a4 > 0.0
      && ([(AVPlaybackControlsController *)self playerController],
          double v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = objc_opt_respondsToSelector(),
          v16,
          (v17 & 1) != 0))
    {
      double v18 = v14 * 10.0;
      if (v14 * 10.0 > 15.0) {
        double v18 = 15.0;
      }
      double v19 = (a3 - v13) * 0.5;
      double v20 = fmax(v19, 0.0);
      if (v20 >= v18) {
        double v21 = v18;
      }
      else {
        double v21 = v20;
      }
      if (v19 > 0.0) {
        double v19 = 0.0;
      }
      double v22 = -v19;
      if (v18 <= v22) {
        double v23 = v18;
      }
      else {
        double v23 = v22;
      }
      float v24 = [(AVPlaybackControlsController *)self playerController];
      [v24 seekToTime:a3 toleranceBefore:v21 toleranceAfter:v23];
    }
    else
    {
      float v24 = [(AVPlaybackControlsController *)self playerController];
      [v24 seekToTime:a3];
    }
  }

  [(AVPlaybackControlsController *)self _updateScrubberAndTimeLabels];
}

- (void)beginScrubbing
{
  [(AVPlaybackControlsController *)self setShouldIgnoreTimeResolverUpdates:1];
  [(AVPlaybackControlsController *)self setPlaybackSuspendedForScrubbing:[(AVPlaybackControlsController *)self playButtonsShowPauseGlyph]];
  id v3 = [(AVPlaybackControlsController *)self playerController];
  [v3 beginScrubbing:self];

  [(AVPlaybackControlsController *)self _updateOrCreateTimeResolverIfNeeded];
}

- (id)volumeControlsController:(id)a3 volumeButtonControl:(id)a4 viewContainingVolumeSlider:(id)a5
{
  return 0;
}

- (void)transportControls:(id)a3 scrubberDidEndScrubbing:(id)a4
{
  id v5 = a4;
  int v6 = [(AVPlaybackControlsController *)self playerController];
  [v6 endScrubbing:v5];

  [(AVPlaybackControlsController *)self setPlaybackSuspendedForScrubbing:0];
  [(AVPlaybackControlsController *)self _updateOrCreateTimeResolverIfNeeded];

  [(AVPlaybackControlsController *)self setShouldIgnoreTimeResolverUpdates:0];
}

- (void)transportControls:(id)a3 scrubberDidScrub:(id)a4
{
  id v12 = a4;
  [v12 value];
  double v6 = v5;
  if ([v12 isTracking])
  {
    [v12 resolution];
    double v8 = v7;
    double v9 = [(AVPlaybackControlsController *)self playbackControlsView];
    double v10 = [v9 traitCollection];
    [v10 displayScale];
    [(AVPlaybackControlsController *)self scrubToTime:v6 resolution:v8 * v11];
  }
  else
  {
    [(AVPlaybackControlsController *)self scrubToTime:v6 resolution:0.0];
  }
}

- (void)transportControls:(id)a3 scrubberDidBeginScrubbing:(id)a4
{
  id v5 = a4;
  [(AVPlaybackControlsController *)self beginScrubbing];
  id v6 = [(AVPlaybackControlsController *)self playerController];
  [v6 nominalFrameRate];
  objc_msgSend(v5, "setEstimatedFrameRate:");
}

- (void)transportControlsNeedsLayoutIfNeeded:(id)a3
{
  id v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v4 setNeedsLayout];

  id v5 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v5 layoutIfNeeded];
}

- (CGSize)playerViewControllerContentViewContentDimensions:(id)a3
{
  id v3 = [(AVPlaybackControlsController *)self playerController];
  [v3 contentDimensions];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)playerViewControllerContentViewDidUpdateScrollingStatus:(id)a3
{
  id v3 = [(AVPlaybackControlsController *)self playerViewController];
  [v3 performInitialSetupIfNeededAndPossible];
}

- (id)playerViewControllerContentViewOverrideLayoutClass:(id)a3
{
  id v3 = [(AVPlaybackControlsController *)self playerViewController];
  double v4 = [v3 presentationContext];

  if ([v4 hasActiveTransition])
  {
    double v5 = [v4 sourceView];

    double v6 = [v4 currentTransition];
    uint64_t v7 = [v6 initialInterfaceOrientation];

    double v8 = [v4 currentTransition];
    uint64_t v9 = [v8 finalInterfaceOrientation];

    char v10 = [v4 isPresenting];
    char v11 = [v4 isDismissing];
    id v12 = [v4 presentedViewController];
    double v13 = [v12 transitionCoordinator];
    int v14 = [v13 isCancelled];

    double v15 = [v4 presentedViewController];
    double v16 = [v15 transitionCoordinator];
    int v17 = [v16 isInteractive];

    if (v14 | v17) {
      char v18 = v10;
    }
    else {
      char v18 = v11;
    }
    if (!v5) {
      char v18 = 0;
    }
    if (v18)
    {
      id v19 = &unk_1F094A0B8;
    }
    else
    {
      if (v14 | v17) {
        uint64_t v20 = v7;
      }
      else {
        uint64_t v20 = v9;
      }
      if ((unint64_t)(v20 - 1) >= 2) {
        double v21 = &unk_1F094A0E8;
      }
      else {
        double v21 = &unk_1F094A0D0;
      }
      id v19 = v21;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (BOOL)playerViewControllerContentViewIsBeingTransitionedFromFullScreen:(id)a3
{
  double v4 = [(AVPlaybackControlsController *)self playerViewController];
  double v5 = [v4 fullScreenViewController];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(AVPlaybackControlsController *)self playerViewController];
  }
  double v8 = v7;

  char v9 = [v8 isBeingDismissed];
  return v9;
}

- (BOOL)playerViewControllerContentViewHasActiveTransition:(id)a3
{
  id v3 = [(AVPlaybackControlsController *)self playerViewController];
  char v4 = [v3 hasActiveTransition];

  return v4;
}

- (void)playerViewControllerContentViewDidChangeVideoGravity:(id)a3
{
  char v4 = [(AVPlaybackControlsController *)self playerViewController];
  double v5 = [v4 videoGravity];

  if (v5)
  {
    double v6 = [(AVPlaybackControlsController *)self playerViewController];
    id v7 = [v6 videoGravity];
    -[AVPlaybackControlsController setVideoScaled:](self, "setVideoScaled:", [v7 isEqualToString:*MEMORY[0x1E4F15AF0]] ^ 1);
  }

  [(AVPlaybackControlsController *)self _updateVideoGravityButtonType];
}

- (BOOL)playerViewControllerContentViewShouldApplyAutomaticVideoGravity:(id)a3
{
  id v4 = a3;
  if (![v4 canAutomaticallyZoomLetterboxVideos]) {
    goto LABEL_16;
  }
  if (![v4 isCoveringWindow]) {
    goto LABEL_16;
  }
  double v5 = [v4 traitCollection];
  [v5 displayCornerRadius];
  double v7 = v6;

  if (v7 <= 0.0) {
    goto LABEL_16;
  }
  double v8 = [(AVPlaybackControlsController *)self playerController];
  [v8 contentDimensions];
  double v10 = v9;
  double v12 = v11;

  double v13 = v12 <= 0.0 ? NAN : v10 / v12;
  [v4 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v4 edgeInsetsForLetterboxedContent];
  double v24 = v21 - (v22 + v23);
  double v27 = v19 - (v25 + v26);
  double v28 = v17 + v22;
  double v29 = v15 + v25;
  v37.origin.double x = v29;
  v37.origin.double y = v28;
  v37.size.double width = v27;
  v37.size.double height = v24;
  if (CGRectIsEmpty(v37)) {
    goto LABEL_16;
  }
  [v4 bounds];
  if (CGRectIsEmpty(v38)) {
    goto LABEL_16;
  }
  CGRect v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v30 nativeBounds];
  IsEmptdouble y = CGRectIsEmpty(v39);

  if (IsEmpty) {
    goto LABEL_16;
  }
  [v4 bounds];
  double Width = CGRectGetWidth(v40);
  [v4 bounds];
  double Height = CGRectGetHeight(v41);
  v42.origin.double x = v29;
  v42.origin.double y = v28;
  v42.size.double width = v27;
  v42.size.double height = v24;
  if (CGRectGetMinY(v42) <= 0.0)
  {
LABEL_16:
    BOOL v35 = 0;
  }
  else
  {
    BOOL v34 = v13 > 1.0;
    if (v13 < Width / Height) {
      BOOL v34 = 0;
    }
    BOOL v35 = v13 / (Width / Height) < 1.15 && v34;
  }

  return v35;
}

- (void)playerViewControllerContentViewDidLayoutSubviews:(id)a3
{
  id v15 = a3;
  id v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  int v5 = [v4 showsPlaybackControls];
  double v6 = [v4 volumeControlsContainer];
  int v7 = [v6 isCollapsed];

  double v8 = [v4 volumeButton];
  if ([v8 isTracking])
  {
    int v9 = 1;
  }
  else
  {
    double v10 = [v4 volumeSlider];
    int v9 = [v10 isTracking];
  }
  if ((v5 ^ 1 | v7) == 1) {
    uint64_t v11 = [(AVPlaybackControlsController *)self _prefersVolumeSliderExpandedAutomatically] | v9;
  }
  else {
    uint64_t v11 = 1;
  }
  if (objc_msgSend(v15, "avkit_isDescendantOfNonPagingScrollView")) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v15 isCoveringWindow];
  }
  [(AVPlaybackControlsController *)self setCoveringWindow:v12];
  [(AVPlaybackControlsController *)self _updateOrCreateTimeResolverIfNeeded];
  [(AVPlaybackControlsController *)self _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:v11];
  double v13 = [v15 playbackContentContainerView];
  [v13 frame];
  -[AVPlaybackControlsController setPlaybackViewFrame:](self, "setPlaybackViewFrame:");

  double v14 = [(AVPlaybackControlsController *)self pictureInPictureController];
  [v14 contentSourceVideoRectInWindowChanged];

  [(AVPlaybackControlsController *)self _updateRouteDetectionEnabled];
}

- (void)playerViewControllerContentViewDidMoveToSuperviewOrWindow:(id)a3
{
  id v4 = a3;
  int v5 = [(AVPlaybackControlsController *)self playerViewController];
  [v5 performInitialSetupIfNeededAndPossible];

  double v6 = [(AVPlaybackControlsController *)self pictureInPictureController];
  [v6 contentSourceVideoRectInWindowChanged];

  int v7 = [(AVPlaybackControlsController *)self windowSceneSessionIdentifier];
  double v8 = [v4 window];
  int v9 = [v8 windowScene];
  double v10 = [v9 session];
  uint64_t v11 = [v10 persistentIdentifier];
  [(AVPlaybackControlsController *)self setWindowSceneSessionIdentifier:v11];

  uint64_t v12 = [(AVPlaybackControlsController *)self volumeController];
  double v13 = [(AVPlaybackControlsController *)self uniqueIdentifer];
  [v12 setClientWithIdentifier:v13 forWindowSceneSessionWithIdentifier:v7];

  double v14 = [(AVPlaybackControlsController *)self volumeController];
  objc_msgSend(v14, "setPrefersSystemVolumeHUDHidden:", -[AVPlaybackControlsController isFullScreen](self, "isFullScreen"));

  id v15 = [v4 window];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4)
  {
    double v16 = _AVLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v17 = 0;
      _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "*** AVPlayerViewController cannot update status bar visibility while hosted in view service. ***", v17, 2u);
    }
  }
  [(AVPlaybackControlsController *)self _updateRouteDetectionEnabled];
}

- (void)playerViewControllerContentViewPlaybackContentContainerViewChanged:(id)a3
{
  id v3 = [(AVPlaybackControlsController *)self playerViewController];
  [v3 activeContentViewDidChange];
}

- (void)turboModePlaybackControlsPlaceholderViewDidLoad:(id)a3
{
  id v4 = a3;
  [(AVPlaybackControlsController *)self setTurboModePlaybackControlsPlaceholderView:v4];
  objc_msgSend(v4, "setPreferredUnobscuredArea:", -[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea"));
  int v5 = [(AVPlaybackControlsController *)self playerViewController];
  double v6 = v5;
  if (v5) {
    [v5 overrideTransformForProminentPlayButton];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  [v4 setOverrideTransformForProminentPlayButton:v10];

  int v7 = [(AVPlaybackControlsController *)self playerViewController];
  double v8 = [v7 overrideLayoutMarginsWhenEmbeddedInline];
  [v4 setOverrideLayoutMarginsWhenEmbeddedInline:v8];

  objc_msgSend(v4, "setHidden:", -[AVPlaybackControlsController showsPlaybackControls](self, "showsPlaybackControls") ^ 1);
  int v9 = [(AVPlaybackControlsController *)self playerController];
  [v4 setPlayerController:v9];
}

- (void)playbackControlsViewDidLoad:(id)a3
{
  id v4 = a3;
  [(AVPlaybackControlsController *)self setResumingUpdates:1];
  [(AVPlaybackControlsController *)self setPlaybackControlsView:v4];
  if (!self->_showsPlaybackControls
    && ![(AVPlaybackControlsController *)self isHidingItemsForTransition])
  {
    [(AVPlaybackControlsController *)self beginHidingItemsForTransition];
  }
  int v5 = [(AVPlaybackControlsController *)self turboModePlaybackControlsPlaceholderView];
  [v5 removeFromSuperview];

  double v6 = [(AVPlaybackControlsController *)self playerController];
  -[AVPlaybackControlsController _updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:](self, "_updatePlaybackControlsVisibilityWantsPlaybackControlsVisible:", [v6 isPlaying]);

  int v7 = objc_alloc_init(AVRouteDetectorCoordinator);
  routeDetectorCoordinator = self->_routeDetectorCoordinator;
  self->_routeDetectorCoordinator = v7;

  [(AVPlaybackControlsController *)self startUpdatesIfNeeded];
  objc_msgSend(v4, "setFullScreen:", -[AVPlaybackControlsController isFullScreen](self, "isFullScreen"));
  int v9 = [(AVPlaybackControlsController *)self playerViewController];
  double v10 = [v9 contentView];
  uint64_t v11 = [v10 playbackContentContainerView];
  [v11 frame];
  -[AVPlaybackControlsController setPlaybackViewFrame:](self, "setPlaybackViewFrame:");

  objc_msgSend(v4, "setPreferredUnobscuredArea:", -[AVPlaybackControlsController preferredUnobscuredArea](self, "preferredUnobscuredArea"));
  uint64_t v12 = [(AVPlaybackControlsController *)self playerViewController];
  [v4 setVisibilityDelegate:v12];

  double v13 = [v4 standardPlayPauseButton];
  [v13 setImageName:@"play.fill"];

  double v14 = [v4 standardPlayPauseButton];
  [v14 setAlternateImageName:@"pause.fill"];

  id v15 = [v4 standardPlayPauseButton];
  double v16 = *MEMORY[0x1E4FB09D0];
  double v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2988], *MEMORY[0x1E4FB09D0]);
  [v15 setAlternateFullScreenFont:v17];

  double v18 = [v4 standardPlayPauseButton];
  [v18 setFullscreenAlternateImagePadding:1.0];

  double v19 = [v4 standardPlayPauseButton];
  double v20 = [(AVPlaybackControlsController *)self playerViewController];
  double v21 = [v20 traitCollection];
  uint64_t v22 = [v21 userInterfaceIdiom];
  double v23 = 0.5;
  if (v22 == 5) {
    double v23 = 0.0;
  }
  [v19 setAlternateImagePadding:v23];

  double v24 = [v4 prominentPlayButton];
  [v24 setImageName:@"play.fill"];

  double v25 = [v4 prominentPlayButton];
  double v26 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2928], v16);
  [v25 setInlineFont:v26];

  double v27 = [v4 prominentPlayButton];
  [v27 setMultipleTouchesEndsTracking:1];

  double v28 = [v4 skipBackButton];
  [v28 setImageName:@"gobackward.15"];

  double v29 = [v4 skipForwardButton];
  [v29 setImageName:@"goforward.15"];

  CGRect v30 = [v4 skipForwardButton];
  [v30 setAlternateImageName:@"forward.end.alt.fill"];

  int v31 = [v4 skipForwardButton];
  int v32 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2998], v16);
  [v31 setAlternateFullScreenFont:v32];

  BOOL v33 = [v4 startLeftwardContentTransitionButton];
  [v33 setImageName:@"backward.end.fill"];

  BOOL v34 = [v4 startRightwardContentTransitionButton];
  [v34 setImageName:@"forward.end.fill"];

  BOOL v35 = [v4 mediaSelectionButton];
  [v35 setImageName:@"captions.bubble"];

  uint64_t v36 = [v4 pictureInPictureButton];
  [v36 setImageName:@"pip.enter"];

  CGRect v37 = [v4 fullScreenButton];
  [v37 setImageName:@"arrow.up.left.and.arrow.down.right"];

  CGRect v38 = [v4 doneButton];
  [v38 setImageName:@"xmark"];

  CGRect v39 = [v4 volumeButton];
  CGRect v40 = [(AVPlaybackControlsController *)self _volumeButtonMicaPackageState];
  [v39 setMicaPackageStateName:v40];

  CGRect v41 = [v4 routePickerView];
  [v41 setDelegate:self];

  CGRect v42 = [v4 controlOverflowButton];
  [v42 setDelegate:self];

  BOOL v43 = [v4 doneButton];
  uint64_t v44 = [(AVPlaybackControlsController *)self playerViewController];
  [v43 addTarget:v44 action:sel_doneButtonTapped_ forControlEvents:64];

  uint64_t v45 = [v4 fullScreenButton];
  v46 = [(AVPlaybackControlsController *)self playerViewController];
  [v45 addTarget:v46 action:sel_enterFullScreen_ forControlEvents:64];

  id v47 = [v4 videoGravityButton];
  CGRect v48 = [(AVPlaybackControlsController *)self playerViewController];
  [v47 addTarget:v48 action:sel_videoGravityButtonTapped_ forControlEvents:64];

  CGRect v49 = [v4 standardPlayPauseButton];
  CGRect v50 = [(AVPlaybackControlsController *)self playerViewController];
  [v49 addTarget:v50 action:sel_togglePlayback_ forControlEvents:64];

  CGRect v51 = [v4 pictureInPictureButton];
  uint64_t v52 = [(AVPlaybackControlsController *)self playerViewController];
  [v51 addTarget:v52 action:sel_pictureInPictureButtonTapped_ forControlEvents:64];

  uint64_t v53 = [v4 mediaSelectionButton];
  id v54 = [(AVPlaybackControlsController *)self playerViewController];
  [v53 addTarget:v54 action:sel_mediaSelectionButtonTapped_ forControlEvents:64];

  objc_initWeak(&location, self);
  v55 = (void *)MEMORY[0x1E4FB13F0];
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke;
  v116[3] = &unk_1E5FC3A10;
  objc_copyWeak(&v117, &location);
  v56 = [v55 actionWithHandler:v116];
  id v57 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v58 = [v57 playbackSpeedButton];
  [v58 setImageName:@"speedometer"];

  v59 = [(AVPlaybackControlsController *)self playbackControlsView];
  v60 = [v59 playbackSpeedButton];
  id v61 = objc_loadWeakRetained(&location);
  v62 = [v61 playbackRateMenuController];
  id v63 = [v62 menu];
  [v60 setMenu:v63];

  v64 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v65 = [v64 playbackSpeedButton];
  [v65 addAction:v56 forControlEvents:0x4000];

  id v66 = [(AVPlaybackControlsController *)self playbackControlsView];
  v67 = [v66 playbackSpeedButton];
  [v67 addTarget:self action:sel_playbackSpeedButtonTapped_ forControlEvents:64];

  uint64_t v68 = [v4 skipBackButton];
  [v68 addTarget:self action:sel_skipButtonTouchUpInside_ forControlEvents:64];

  id v69 = [v4 skipForwardButton];
  [v69 addTarget:self action:sel_skipButtonTouchUpInside_ forControlEvents:64];

  double v70 = [v4 skipBackButton];
  [v70 addTarget:self action:sel_skipButtonLongPressTriggered_ forControlEvents:0x400000];

  double v71 = [v4 skipForwardButton];
  [v71 addTarget:self action:sel_skipButtonLongPressTriggered_ forControlEvents:0x400000];

  double v72 = [v4 skipBackButton];
  [v72 addTarget:self action:sel_skipButtonLongPressEnded_ forControlEvents:0x800000];

  v73 = [v4 skipForwardButton];
  [v73 addTarget:self action:sel_skipButtonLongPressEnded_ forControlEvents:0x800000];

  double v74 = [v4 skipBackButton];
  [v74 addTarget:self action:sel_skipButtonForcePressChanged_ forControlEvents:0x2000000];

  v75 = [v4 skipForwardButton];
  [v75 addTarget:self action:sel_skipButtonForcePressChanged_ forControlEvents:0x2000000];

  [(AVPlaybackControlsController *)self _updateSkipButtonsEnableLongPress];
  double v76 = [v4 startLeftwardContentTransitionButton];
  [v76 addTarget:self action:sel_startContentTransitionButtonTouchUpInside_ forControlEvents:64];

  v77 = [v4 startRightwardContentTransitionButton];
  [v77 addTarget:self action:sel_startContentTransitionButtonTouchUpInside_ forControlEvents:64];

  v78 = [v4 prominentPlayButton];
  [v78 addTarget:self action:sel_prominentPlayButtonTouchUpInside_ forControlEvents:64];

  double v79 = [v4 volumeButton];
  [v79 addTarget:self action:sel_volumeButtonTapTriggered_ forControlEvents:0x400000];

  double v80 = [v4 volumeButton];
  [v80 addTarget:self action:sel_beginChangingVolume forControlEvents:0x1000000];

  double v81 = [v4 volumeButton];
  [v81 addTarget:self action:sel_volumeButtonLongPressTriggered_ forControlEvents:0x800000];

  double v82 = [v4 volumeButton];
  [v82 addTarget:self action:sel_volumeButtonPanChanged_ forControlEvents:0x2000000];

  v83 = [v4 volumeButton];
  [v83 addTarget:self action:sel_endChangingVolume forControlEvents:0x4000000];

  v84 = [v4 volumeSlider];
  [v84 addTarget:self action:sel_beginChangingVolume forControlEvents:1];

  int v85 = [v4 volumeSlider];
  [v85 addTarget:self action:sel_endChangingVolume forControlEvents:448];

  int v86 = [v4 volumeSlider];
  [v86 addTarget:self action:sel_volumeSliderValueDidChange_ forControlEvents:4096];

  int v87 = [v4 transportControlsView];
  [v87 setDelegate:self];

  double v88 = [v4 standardPlayPauseButton];
  [v88 setTintEffectStyle:0];

  id v89 = [v4 prominentPlayButton];
  [v89 setTintEffectStyle:0];

  v90 = [v4 skipBackButton];
  [v90 setTintEffectStyle:0];

  v91 = [v4 skipForwardButton];
  [v91 setTintEffectStyle:0];

  v92 = [v4 startLeftwardContentTransitionButton];
  [v92 setTintEffectStyle:0];

  uint64_t v93 = [v4 startRightwardContentTransitionButton];
  [v93 setTintEffectStyle:0];

  uint64_t v94 = [(AVPlaybackControlsController *)self customControlItems];
  [v4 setCustomControlItems:v94 animations:&__block_literal_global_212];

  v95 = [(AVPlaybackControlsController *)self playerViewController];
  v96 = v95;
  if (v95) {
    [v95 overrideTransformForProminentPlayButton];
  }
  else {
    memset(v115, 0, sizeof(v115));
  }
  [v4 setOverrideTransformForProminentPlayButton:v115];

  id v97 = [(AVPlaybackControlsController *)self playerViewController];
  v98 = [v97 overrideLayoutMarginsWhenEmbeddedInline];
  [v4 setOverrideLayoutMarginsWhenEmbeddedInline:v98];

  id v99 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v109 = MEMORY[0x1E4F143A8];
  uint64_t v110 = 3221225472;
  id v111 = __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke_3;
  v112 = &unk_1E5FC3D18;
  id v100 = v4;
  id v113 = v100;
  v114 = self;
  [v99 performWithoutAnimation:&v109];
  v101 = [(AVPlaybackControlsController *)self volumeController];
  id v102 = [(AVPlaybackControlsController *)self uniqueIdentifer];
  id v103 = [(AVPlaybackControlsController *)self windowSceneSessionIdentifier];
  [v101 setClientWithIdentifier:v102 forWindowSceneSessionWithIdentifier:v103];

  v104 = [(AVPlaybackControlsController *)self volumeController];
  objc_msgSend(v104, "setPrefersSystemVolumeHUDHidden:", -[AVPlaybackControlsController isFullScreen](self, "isFullScreen"));

  if (!self->_remainingTimeFormatter || !self->_elapsedTimeFormatter)
  {
    id v105 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E4F166B8]);
    elapsedTimeFormatter = self->_elapsedTimeFormatter;
    self->_elapsedTimeFormatter = v105;

    [(AVTimeFormatter *)self->_elapsedTimeFormatter setStyle:1];
    id v107 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E4F166B8]);
    remainingTimeFormatter = self->_remainingTimeFormatter;
    self->_remainingTimeFormatter = v107;

    [(AVTimeFormatter *)self->_remainingTimeFormatter setStyle:2];
  }
  [v100 setupInitialLayout];
  objc_msgSend(v100, "setPrefersVolumeSliderExpandedAutomatically:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));
  [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibleAndObservingUpdates];
  [(AVPlaybackControlsController *)self _updateContainerInclusion];
  [(AVPlaybackControlsController *)self _updateControlInclusion];
  [(AVPlaybackControlsController *)self _updateScrubberAndTimeLabels];
  [(AVPlaybackControlsController *)self _updateVolumeControllerView];
  [(AVPlaybackControlsController *)self _updateTransportBarCustomMenuItemsIfNeeded];

  objc_destroyWeak(&v117);
  objc_destroyWeak(&location);
}

void __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained playbackRateMenuController];
  id v7 = [v3 menu];

  id v4 = objc_loadWeakRetained(v1);
  int v5 = [v4 playbackControlsView];
  double v6 = [v5 playbackSpeedButton];
  [v6 setMenu:v7];
}

uint64_t __60__AVPlaybackControlsController_playbackControlsViewDidLoad___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transportControlsView];
  id v3 = [*(id *)(a1 + 40) playerViewController];
  id v4 = [v3 customContentTransitioningInfoPanel];
  [v2 setCustomContentTransitioningInfoPanel:v4];

  int v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v5 _prefersVolumeSliderExpandedAutomatically];

  return [v5 _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:v6];
}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  transportBarCustomMenuItems = self->_transportBarCustomMenuItems;
  self->_transportBarCustomMenuItems = v4;

  uint64_t v6 = [(AVPlaybackControlsController *)self playbackControlsView];
  id v7 = [v6 transportControlsView];
  double v8 = [v7 controlOverflowButton];
  [v8 updateContextMenu];

  [(AVPlaybackControlsController *)self _updateTransportBarCustomMenuItemsIfNeeded];
}

- (void)setCustomControlItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_customControlItems isEqualToArray:v4])
  {
    int v5 = (NSArray *)[v4 copy];
    customControlItems = self->_customControlItems;
    self->_customControlItems = v5;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = self->_customControlItems;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v11++) setSecondGenerationControl:0];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [(AVPlaybackControlsController *)self playbackControlsView];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__AVPlaybackControlsController_setCustomControlItems___block_invoke;
    v14[3] = &unk_1E5FC4698;
    v14[4] = self;
    [v12 setCustomControlItems:v4 animations:v14];

    double v13 = [(AVPlaybackControlsController *)self playbackControlsView];
    objc_msgSend(v13, "setPrefersVolumeSliderExpandedAutomatically:", -[AVPlaybackControlsController _prefersVolumeSliderExpandedAutomatically](self, "_prefersVolumeSliderExpandedAutomatically"));
  }
}

uint64_t __54__AVPlaybackControlsController_setCustomControlItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateControlInclusion];
}

- (BOOL)tapGestureRecognizersCanReceiveTouches
{
  if ([(AVPlaybackControlsController *)self showsPlaybackControls]
    || (BOOL v3 = [(AVPlaybackControlsController *)self hasCustomPlaybackControls]))
  {
    LOBYTE(v3) = ![(AVPlaybackControlsController *)self showsProminentPlayButton];
  }
  return v3;
}

- (BOOL)needsTimeResolver
{
  BOOL v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  if (v3)
  {
    id v4 = [(AVPlaybackControlsController *)self playbackControlsView];
    if ([v4 showsPlaybackControls]) {
      BOOL v5 = ![(AVPlaybackControlsController *)self isResumingUpdates];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)playButtonsShowPauseGlyph
{
  BOOL v3 = [(AVPlaybackControlsController *)self playerController];
  [v3 activeRate];
  double v5 = v4;
  if (objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
  {
    [v3 suspendedRate];
    double v7 = v6;
    char v8 = [v3 isPlaybackSuspended];
    BOOL v9 = v7 > 0.0 || v7 < 0.0;
    char v10 = v8 & v9;
  }
  else
  {
    char v10 = 0;
  }
  if ([(AVPlaybackControlsController *)self timeControlStatus])
  {
    char v11 = 1;
  }
  else
  {
    BOOL v12 = [(AVPlaybackControlsController *)self isPlaybackSuspendedForScrubbing];
    char v13 = v5 != 0.0 || v12;
    char v11 = v13 | v10;
  }

  return v11;
}

- (BOOL)canShowLoadingIndicator
{
  if ([(AVPlaybackControlsController *)self isResumingUpdates]
    || [(AVPlaybackControlsController *)self playerViewControllerIsBeingTransitionedWithResizing])
  {
    return 0;
  }
  double v4 = [(AVPlaybackControlsController *)self playbackControlsView];
  if (v4)
  {
    double v5 = [(AVPlaybackControlsController *)self playerController];
    BOOL v3 = [v5 status] == 1
      || [(AVPlaybackControlsController *)self timeControlStatus] == 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)showsStartContentTransitionButtons
{
  BOOL v3 = [(AVPlaybackControlsController *)self isFullScreen];
  if (v3)
  {
    LOBYTE(v3) = [(AVPlaybackControlsController *)self playbackControlsIncludeStartContentTransitionButtons];
  }
  return v3;
}

- (BOOL)showsSkipButtons
{
  if (![(AVPlaybackControlsController *)self isFullScreen]
    || [(AVPlaybackControlsController *)self playbackControlsIncludeStartContentTransitionButtons]|| [(AVPlaybackControlsController *)self playerViewControllerIsBeingTransitionedWithResizing])
  {
    return 0;
  }
  if (![(AVPlaybackControlsController *)self isSeekingEnabled])
  {
    if (![(AVPlaybackControlsController *)self requiresLinearPlayback])
    {
      double v5 = [(AVPlaybackControlsController *)self playerController];
      BOOL v3 = [v5 status] != 2;

      return v3;
    }
    return 0;
  }
  return 1;
}

- (BOOL)isSeekingEnabled
{
  if ([(AVPlaybackControlsController *)self requiresLinearPlayback]) {
    return 0;
  }
  double v4 = [(AVPlaybackControlsController *)self playerController];
  char v5 = [v4 canSeek];

  return v5;
}

- (double)maximumTime
{
  BOOL v3 = [(AVPlaybackControlsController *)self playerController];
  if ([v3 status] == 2)
  {
    double v4 = [(AVPlaybackControlsController *)self timeResolver];
    [v4 maxTime];
    double v6 = v5;
  }
  else
  {
    double v6 = NAN;
  }

  return v6;
}

- (double)minimumTime
{
  BOOL v3 = [(AVPlaybackControlsController *)self playerController];
  if ([v3 status] == 2)
  {
    double v4 = [(AVPlaybackControlsController *)self timeResolver];
    [v4 minTime];
    double v6 = v5;
  }
  else
  {
    double v6 = NAN;
  }

  return v6;
}

- (double)currentTime
{
  BOOL v3 = [(AVPlaybackControlsController *)self playerController];
  if ([v3 status] == 2)
  {
    double v4 = [(AVPlaybackControlsController *)self timeResolver];
    [v4 targetTime];
    double v6 = v5;
  }
  else
  {
    double v6 = NAN;
  }

  return v6;
}

- (double)targetTime
{
  BOOL v3 = [(AVPlaybackControlsController *)self playbackControlsView];
  double v4 = [v3 scrubber];
  int v5 = [v4 isTracking];

  if (v5)
  {
    double v6 = [(AVPlaybackControlsController *)self playbackControlsView];
    double v7 = [v6 scrubber];
    [v7 value];
    double v9 = v8;

LABEL_5:
    return v9;
  }
  char v10 = [(AVPlaybackControlsController *)self playerController];
  uint64_t v11 = [v10 externalPlaybackType];

  if (v11 == 1)
  {
    double v6 = [(AVPlaybackControlsController *)self timeResolver];
    [v6 currentTime];
    double v9 = v12;
    goto LABEL_5;
  }

  [(AVPlaybackControlsController *)self currentTime];
  return result;
}

- (BOOL)showsMediaSelectionButton
{
  id v2 = [(AVPlaybackControlsController *)self playerController];
  char v3 = [v2 hasMediaSelectionOptions];

  return v3;
}

- (BOOL)shouldEnterFullScreenWhenPlaybackBegins
{
  BOOL v3 = [(AVPlaybackControlsController *)self entersFullScreenWhenPlaybackBegins];
  if (v3)
  {
    if ([(AVPlaybackControlsController *)self hasPlaybackBegunSincePlayerControllerBecameReadyToPlay])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = ![(AVPlaybackControlsController *)self playerViewControllerHasInvalidViewControllerHierarchy];
    }
  }
  return v3;
}

- (BOOL)showsTransportControls
{
  if ([(AVPlaybackControlsController *)self isFullScreen]) {
    return 1;
  }
  if ([(AVPlaybackControlsController *)self preferredUnobscuredArea] == 2) {
    return 0;
  }
  return ![(AVPlaybackControlsController *)self shouldEnterFullScreenWhenPlaybackBegins];
}

- (BOOL)prominentPlayButtonCanShowPauseGlyph
{
  return [(AVPlaybackControlsController *)self preferredUnobscuredArea] == 2;
}

- (BOOL)showsProminentPlayButton
{
  BOOL v3 = [(AVPlaybackControlsController *)self shouldEnterFullScreenWhenPlaybackBegins]|| [(AVPlaybackControlsController *)self showsMinimalPlaybackControlsWhenEmbeddedInline];
  if ([(AVPlaybackControlsController *)self isFullScreen]
    || ![(AVPlaybackControlsController *)self playbackControlsIncludeTransportControls]|| [(AVPlaybackControlsController *)self hasPlaybackBegunSincePlayerControllerBecameReadyToPlay]&& !v3)
  {
    goto LABEL_27;
  }
  double v4 = [(AVPlaybackControlsController *)self pictureInPictureController];
  if ([v4 isPictureInPictureActive])
  {
    int v5 = 0;
  }
  else
  {
    double v6 = [(AVPlaybackControlsController *)self playerController];
    if ([v6 status] == 3)
    {
      int v5 = 0;
    }
    else
    {
      double v7 = [(AVPlaybackControlsController *)self playerController];
      if ([v7 isPlayingOnExternalScreen])
      {
        int v5 = 0;
      }
      else
      {
        float v8 = [(AVPlaybackControlsController *)self playerController];
        if ([v8 hasVideo])
        {
          int v5 = 1;
        }
        else
        {
          double v9 = [(AVPlaybackControlsController *)self playerController];
          int v5 = [v9 hasEnabledAudio] ^ 1;
        }
      }
    }
  }

  if ([(AVPlaybackControlsController *)self playButtonsShowPauseGlyph]) {
    goto LABEL_20;
  }
  if (!v3)
  {
    uint64_t v10 = [(AVPlaybackControlsController *)self playButtonHandlerForLazyPlayerLoading];
    if (!v10
      || (uint64_t v11 = (void *)v10,
          [(AVPlaybackControlsController *)self playerController],
          double v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 status],
          v12,
          v11,
          v13))
    {
LABEL_20:
      if ([(AVPlaybackControlsController *)self preferredUnobscuredArea] == 2)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if (![(AVPlaybackControlsController *)self hasPlaybackBegunSincePlayerControllerBecameReadyToPlay])return v5 & ~[(AVPlaybackControlsController *)self playButtonsShowPauseGlyph]; {
LABEL_27:
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)showsRoutePickerView
{
  if (![(AVPlaybackControlsController *)self multipleRoutesDetected]) {
    return 0;
  }
  BOOL v3 = [(AVPlaybackControlsController *)self playerController];
  if ([v3 allowsExternalPlayback]) {
    BOOL v4 = [(AVPlaybackControlsController *)self wantsExternalPlaybackButtonShown];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setWantsExternalPlaybackButtonShown:(BOOL)a3
{
  if (self->_wantsExternalPlaybackButtonShown != a3) {
    self->_wantsExternalPlaybackButtonShown = a3;
  }
}

- (BOOL)entersFullScreenWhenTapped
{
  BOOL v3 = [(AVPlaybackControlsController *)self showsMinimalPlaybackControlsWhenEmbeddedInline];
  if (v3)
  {
    if ([(AVPlaybackControlsController *)self showsProminentPlayButton])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      BOOL v3 = [(AVPlaybackControlsController *)self allowsEnteringFullScreen];
      if (v3) {
        LOBYTE(v3) = ![(AVPlaybackControlsController *)self isFullScreen];
      }
    }
  }
  return v3;
}

- (void)setShowsTimecodes:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_showsTimecodes != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v8 = 136315650;
      double v9 = "-[AVPlaybackControlsController setShowsTimecodes:]";
      uint64_t v11 = "showsTimecodes";
      __int16 v10 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v12 = 2080;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_showsTimecodes = v3;
    double v7 = [(AVPlaybackControlsController *)self playerController];
    [v7 hasReadableTimecodes];

    [(AVPlaybackControlsController *)self _updateOrCreateTimeResolverIfNeeded];
    [(AVPlaybackControlsController *)self _updateScrubberAndTimeLabels];
  }
}

- (void)setShowsPictureInPictureButton:(BOOL)a3
{
  if (self->_showsPictureInPictureButton != a3)
  {
    self->_showsPictureInPictureButton = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (void)setCanIncludeVideoGravityButton:(BOOL)a3
{
  if (self->_canIncludeVideoGravityButton != a3)
  {
    self->_canIncludeVideoGravityButton = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (void)setCoveringWindow:(BOOL)a3
{
  if (self->_coveringWindow != a3)
  {
    self->_coveringWindow = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (BOOL)isFullScreen
{
  if ([(AVPlaybackControlsController *)self playerViewControllerIsPresentingFullScreen]|| [(AVPlaybackControlsController *)self playerViewControllerIsPresentedFullScreen])
  {
    return 1;
  }

  return [(AVPlaybackControlsController *)self isCoveringWindow];
}

- (void)setVolumeController:(id)a3
{
  double v7 = (AVVolumeController *)a3;
  int v5 = self->_volumeController;
  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_volumeController, a3);
    if ([(AVPlaybackControlsController *)self isFullScreen])
    {
      [(AVVolumeController *)v5 setPrefersSystemVolumeHUDHidden:0];
      double v6 = [(AVPlaybackControlsController *)self volumeController];
      [v6 setPrefersSystemVolumeHUDHidden:1];
    }
  }
}

- (void)setShowsVideoGravityButton:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_showsVideoGravityButton != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlaybackControlsController setShowsVideoGravityButton:]";
      __int16 v10 = "showsVideoGravityButton";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_showsVideoGravityButton = v3;
    [(AVPlaybackControlsController *)self _updateVideoGravityButtonType];
  }
}

- (void)setShowsDoneButtonWhenFullScreen:(BOOL)a3
{
  if (self->_showsDoneButtonWhenFullScreen != a3)
  {
    self->_showsDoneButtonWhenFullScreen = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (void)setShowsVolumeControlsForContentWithNoAudio:(BOOL)a3
{
  if (self->_showsVolumeControlsForContentWithNoAudio != a3)
  {
    self->_showsVolumeControlsForContentWithNoAudio = a3;
    [(AVPlaybackControlsController *)self _updateContainerInclusion];
  }
}

- (void)setVolumeControlsCanShowSlider:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_volumeControlsCanShowSlider != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlaybackControlsController setVolumeControlsCanShowSlider:]";
      __int16 v10 = "volumeControlsCanShowSlider";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_volumeControlsCanShowSlider = v3;
    [(AVPlaybackControlsController *)self _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:v3];
  }
}

- (void)setCanIncludePlaybackControlsWhenInline:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_canIncludePlaybackControlsWhenInline != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlaybackControlsController setCanIncludePlaybackControlsWhenInline:]";
      __int16 v10 = "canIncludePlaybackControlsWhenInline";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_canIncludePlaybackControlsWhenInline = v3;
  }
}

- (void)setHasCustomPlaybackControls:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_hasCustomPlaybackControls != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlaybackControlsController setHasCustomPlaybackControls:]";
      __int16 v10 = "hasCustomPlaybackControls";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_hasCustomPlaybackControls = v3;
  }
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_showsPlaybackControls != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v8 = 136315650;
      __int16 v9 = "-[AVPlaybackControlsController setShowsPlaybackControls:]";
      __int16 v11 = "showsPlaybackControls";
      __int16 v10 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v12 = 2080;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_showsPlaybackControls = v3;
    [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibleAndObservingUpdates];
    int v7 = [(AVPlaybackControlsController *)self turboModePlaybackControlsPlaceholderView];
    [v7 setHidden:!v3];
  }
}

- (void)setPlayerViewControllerIsBeingTransitionedWithResizing:(BOOL)a3
{
  if (self->_playerViewControllerIsBeingTransitionedWithResizing != a3)
  {
    self->_playerViewControllerIsBeingTransitionedWithResizing = a3;
    [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibleAndObservingUpdates];
  }
}

- (void)setPlayerViewControllerIsPresentedFullScreen:(BOOL)a3
{
  if (self->_playerViewControllerIsPresentedFullScreen != a3)
  {
    self->_playerViewControllerIsPresentedFullScreen = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (void)setPlayerViewControllerIsPresentingFullScreen:(BOOL)a3
{
  if (self->_playerViewControllerIsPresentingFullScreen != a3)
  {
    self->_playerViewControllerIsPresentingFullScreen = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  int v5 = (AVPlaybackSpeedCollection *)a3;
  if (self->_playbackSpeedCollection != v5)
  {
    int v8 = v5;
    if (self->_selectedPlaybackSpeedObservationToken)
    {
      -[AVObservationController stopObserving:](self->_observationController, "stopObserving:");
      id selectedPlaybackSpeedObservationToken = self->_selectedPlaybackSpeedObservationToken;
      self->_id selectedPlaybackSpeedObservationToken = 0;
    }
    objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
    int v7 = [(AVPlaybackControlsController *)self playbackRateMenuController];
    [v7 setPlaybackSpeedCollection:v8];

    [(AVPlaybackControlsController *)self _updatePlaybackSpeedControlInclusion];
    int v5 = v8;
  }
}

- (void)setPlayerController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  int v5 = obj;
  if (WeakRetained != obj)
  {
    double v6 = [(AVPlaybackControlsController *)self volumeAnimator];
    [v6 restoreVolumeIfNeeded];

    [(AVPlaybackControlsController *)self setVolumeAnimator:0];
    id v7 = objc_storeWeak((id *)&self->_playerController, obj);

    if (obj) {
      [(AVPlaybackControlsController *)self _startObservingPotentiallyUnimplementedPlayerControllerProperties];
    }
    int v8 = [(AVPlaybackControlsController *)self volumeController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v10 = [(AVPlaybackControlsController *)self volumeController];
      id v11 = objc_loadWeakRetained((id *)&self->_playerController);
      [v10 setPlayerController:v11];
    }
    [(AVPlaybackControlsController *)self _updateOrCreateTimeResolverIfNeeded];
    [(AVPlaybackControlsController *)self _updateSkipButtonsEnableLongPress];
    __int16 v12 = [(AVPlaybackControlsController *)self turboModePlaybackControlsPlaceholderView];
    [v12 setPlayerController:obj];

    int v5 = obj;
  }
}

- (void)_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(AVPlaybackControlsController *)self playerViewController];
  double v6 = [v5 presentationContext];
  BOOL v49 = v3;
  if ([v6 isPresenting])
  {
    id v7 = [(AVPlaybackControlsController *)self playerViewController];
    int v8 = [v7 presentationContext];
    __int16 v9 = [v8 presentingTransition];
    BOOL v48 = (unint64_t)([v9 finalInterfaceOrientation] - 1) < 2;
  }
  else
  {
    BOOL v48 = 0;
  }

  __int16 v10 = [(AVPlaybackControlsController *)self playerViewController];
  id v11 = [v10 presentationContext];
  __int16 v12 = [v11 currentTransition];
  char v13 = [v12 isRotated];
  uint64_t v14 = [(AVPlaybackControlsController *)self playerViewController];
  long long v15 = [v14 presentingViewController];
  long long v16 = [v15 view];
  long long v17 = [v16 window];
  long long v18 = [v17 traitCollection];
  double v19 = v18;
  if (v13) {
    uint64_t v20 = [v18 verticalSizeClass];
  }
  else {
    uint64_t v20 = [v18 horizontalSizeClass];
  }
  uint64_t v21 = v20;

  BOOL v22 = [(AVPlaybackControlsController *)self shouldShowVolumeControlInTransportBar];
  if ([(AVPlaybackControlsController *)self playbackControlsIncludeVolumeControls])
  {
    BOOL v23 = v21 == 1 && v48;
    BOOL v24 = 0;
    if ([(AVPlaybackControlsController *)self volumeControlsCanShowSlider] && !v23)
    {
      double v25 = [(AVPlaybackControlsController *)self volumeController];
      if ([v25 currentRouteHasVolumeControl])
      {
        double v26 = [(AVPlaybackControlsController *)self playerController];
        if ([v26 isPlayingOnExternalScreen])
        {
          BOOL v24 = 0;
        }
        else
        {
          double v27 = [(AVPlaybackControlsController *)self playerController];
          BOOL v24 = ([v27 isPlayingOnSecondScreen] & 1) == 0
             && [(AVPlaybackControlsController *)self preferredUnobscuredArea] != 1;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
  }
  else
  {
    BOOL v24 = 0;
  }
  if ([(AVPlaybackControlsController *)self playbackControlsIncludeVolumeControls])
  {
    uint64_t v28 = v22 ^ 1;
  }
  else
  {
    double v29 = [(AVPlaybackControlsController *)self playbackControlsView];
    CGRect v30 = [v29 customAudioItems];
    if ([v30 count]) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = v22 ^ 1;
    }
  }
  int v31 = [(AVPlaybackControlsController *)self playbackControlsView];
  int v32 = [v31 transportControlsView];
  [v32 setTransportViewIncludesVolumeController:v22];

  if (v24) {
    uint64_t v33 = v49 & (v22 ^ 1);
  }
  else {
    uint64_t v33 = 0;
  }
  BOOL v34 = [(AVPlaybackControlsController *)self playbackControlsView];
  BOOL v35 = [v34 volumeSlider];
  if (v33 == [v35 isIncluded])
  {
    uint64_t v36 = [(AVPlaybackControlsController *)self playbackControlsView];
    CGRect v37 = [v36 volumeButton];
    int v38 = [v37 isIncluded];

    if (v28 == v38) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  if (v33)
  {
    CGRect v39 = [(AVPlaybackControlsController *)self volumeController];
    [v39 volume];
    -[AVPlaybackControlsController _updateVolumeSliderValueWithSystemVolume:animated:](self, "_updateVolumeSliderValueWithSystemVolume:animated:", 0);
  }
  if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled])
  {
    CGRect v40 = [(AVPlaybackControlsController *)self playbackControlsView];
    CGRect v41 = [v40 volumeControls];
    if ([v41 isHiddenOrHasHiddenAncestor])
    {
      uint64_t v42 = 0;
    }
    else
    {
      BOOL v43 = [(AVPlaybackControlsController *)self playbackControlsView];
      uint64_t v44 = [v43 volumeControls];
      if ([v44 _isInAWindow]
        && ![(AVPlaybackControlsController *)self isResumingUpdates])
      {
        uint64_t v45 = [(AVPlaybackControlsController *)self playbackControlsView];
        if (objc_msgSend(v45, "avkit_wantsAnimatedViewTransitions"))
        {
          v46 = [(AVPlaybackControlsController *)self playerViewController];
          uint64_t v42 = [v46 hasActiveTransition] ^ 1;
        }
        else
        {
          uint64_t v42 = 0;
        }
      }
      else
      {
        uint64_t v42 = 0;
      }
    }
  }
  else
  {
    uint64_t v42 = 0;
  }
  id v47 = [(AVPlaybackControlsController *)self playbackControlsView];
  [v47 setPrefersVolumeSliderExpanded:v33 prefersVolumeButtonIncluded:v28 animated:v42];

LABEL_52:

  [(AVPlaybackControlsController *)self _updateVolumeButtonGlyph];
}

- (void)setAllowsEnteringFullScreen:(BOOL)a3
{
  if (self->_allowsEnteringFullScreen != a3)
  {
    self->_allowsEnteringFullScreen = a3;
    [(AVPlaybackControlsController *)self _updateControlInclusion];
  }
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  if (self->_preferredUnobscuredArea != a3)
  {
    self->_preferredUnobscuredArea = a3;
    int v5 = [(AVPlaybackControlsController *)self playbackControlsView];
    [v5 setPreferredUnobscuredArea:a3];

    id v6 = [(AVPlaybackControlsController *)self playbackControlsView];
    [v6 setNeedsLayout];
  }
}

- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_showsMinimalPlaybackControlsWhenEmbeddedInline != a3)
  {
    BOOL v3 = a3;
    self->_showsMinimalPlaybackControlsWhenEmbeddedInline = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      int v8 = "-[AVPlaybackControlsController setShowsMinimalPlaybackControlsWhenEmbeddedInline:]";
      __int16 v10 = "showsMinimalPlaybackControlsWhenEmbeddedInline";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    [(AVPlaybackControlsController *)self _updateContainerInclusion];
  }
}

- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3
{
  self->_playbackControlsIncludeVolumeControls = a3;
  [(AVPlaybackControlsController *)self _updateContainerInclusion];
}

- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3
{
  self->_playbackControlsIncludeDisplayModeControls = a3;
  [(AVPlaybackControlsController *)self _updateContainerInclusion];
}

- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3
{
  self->_playbackControlsIncludeTransportControls = a3;
  [(AVPlaybackControlsController *)self _updateContainerInclusion];
}

- (void)toggleMuted
{
  uint64_t v3 = [(AVPlaybackControlsController *)self prefersMuted] ^ 1;

  [(AVPlaybackControlsController *)self setPrefersMuted:v3];
}

- (void)startUpdatesIfNeeded
{
  if (![(AVPlaybackControlsController *)self hasStartedUpdates])
  {
    uint64_t v3 = [(AVPlaybackControlsController *)self playbackControlsView];

    if (v3)
    {
      [(AVPlaybackControlsController *)self setHasStartedUpdates:1];
      BOOL v4 = self->_observationController;
      objc_initWeak(&location, self);
      [(AVPlaybackControlsController *)self _updateRouteDetectionEnabled];
      int v5 = [(AVPlaybackControlsController *)self routeDetectorCoordinator];
      -[AVPlaybackControlsController setMultipleRoutesDetected:](self, "setMultipleRoutesDetected:", [v5 multipleRoutesDetected]);

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke;
      v20[3] = &unk_1E5FC3448;
      objc_copyWeak(&v21, &location);
      [(AVObservationController *)v4 startObservingNotificationForName:@"AVRouteDetectorCoordinatorMultipleRoutesDetectedDidChangeNotification" object:0 notificationCenter:0 observationHandler:v20];
      [(AVObservationController *)v4 startObservingNotificationForName:@"AVVolumeControllerVolumeChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_16142];
      [(AVObservationController *)v4 startObservingNotificationForName:@"AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_28];
      id v6 = [(AVPlaybackControlsController *)self playerController];

      if (v6) {
        [(AVPlaybackControlsController *)self _startObservingPotentiallyUnimplementedPlayerControllerProperties];
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_4;
      v18[3] = &unk_1E5FC4220;
      objc_copyWeak(&v19, &location);
      [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"scrubbingOrSeeking" usingKeyValueObservationController:v4 observationHandler:v18];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_5;
      v16[3] = &unk_1E5FC3490;
      objc_copyWeak(&v17, &location);
      id v7 = [(AVObservationController *)v4 startObserving:self keyPath:@"timeControlStatus" includeInitialValue:1 observationHandler:v16];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_6;
      v14[3] = &unk_1E5FC3490;
      objc_copyWeak(&v15, &location);
      id v8 = [(AVObservationController *)v4 startObserving:self keyPath:@"playerController.status" includeInitialValue:1 observationHandler:v14];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      __int16 v11 = __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_7;
      __int16 v12 = &unk_1E5FC4220;
      objc_copyWeak(&v13, &location);
      [(AVPlaybackControlsController *)self _observeBoolForKeyPath:@"needsTimeResolver" usingKeyValueObservationController:v4 observationHandler:&v9];
      [(AVPlaybackControlsController *)self _updatePlaybackControlsVisibleAndObservingUpdates];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 routeDetectorCoordinator];
  objc_msgSend(v2, "setMultipleRoutesDetected:", objc_msgSend(v1, "multipleRoutesDetected"));
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setLoadingIndicatorTimerDelay:0.75];
  }
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = [a4 value];
  uint64_t v7 = [v6 integerValue];

  if (v7 != 1)
  {
    if (v7 == 2)
    {
      [v10 setLoadingIndicatorTimerDelay:0.0666666667];
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [WeakRetained playerController];
  objc_msgSend(v10, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", objc_msgSend(v9, "status") == 2, v7, 0);
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [v5 value];

  BOOL v8 = [v7 integerValue] == 2;
  id v9 = objc_loadWeakRetained(v4);
  id v10 = [v9 playerController];
  objc_msgSend(WeakRetained, "_updateHasPlaybackBegunSincePlayerControllerBecameReadyToPlay:playing:userDidEndTappingProminentPlayButton:", v8, objc_msgSend(v10, "isPlaying"), 0);

  id v11 = objc_loadWeakRetained(v4);
  __int16 v12 = [v11 playerController];
  uint64_t v13 = [v12 status];

  if (v13 == 2)
  {
    id v14 = objc_loadWeakRetained(v4);
    [v14 setHasBecomeReadyToPlay:1];
  }
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateOrCreateTimeResolverIfNeeded];
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = a4;
  id v6 = [v5 object];
  uint64_t v7 = [v8 volumeController];

  if (v6 == v7) {
    [v8 handleCurrentRouteSupportsVolumeControlChanged:v5];
  }
}

void __52__AVPlaybackControlsController_startUpdatesIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = a4;
  id v6 = [v5 object];
  uint64_t v7 = [v8 volumeController];

  if (v6 == v7) {
    [v8 handleVolumeChange:v5];
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[AVPlaybackControlsController dealloc]";
    __int16 v12 = 1024;
    int v13 = 227;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  BOOL v4 = [(AVPlaybackControlsController *)self playbackControlsObservationController];
  [v4 stopAllObservation];

  id v5 = [(AVPlaybackControlsController *)self observationController];
  [v5 stopAllObservation];

  [(AVPlaybackControlsController *)self setShowsTimecodes:0];
  id v6 = [(AVPlaybackControlsController *)self volumeController];
  [v6 setPrefersSystemVolumeHUDHidden:0];

  uint64_t v7 = [(AVPlaybackControlsController *)self timeResolver];
  [v7 setPlayerController:0];

  id v8 = [(AVPlaybackControlsController *)self routeDetectorCoordinator];
  [v8 setRouteDetectionEnabled:0];

  [(AVPlaybackControlsController *)self setPlayerController:0];
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackControlsController;
  [(AVPlaybackControlsController *)&v9 dealloc];
}

- (AVPlaybackControlsController)initWithPlayerViewController:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackControlsController;
  id v5 = [(AVPlaybackControlsController *)&v18 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
    uint64_t v7 = [v4 playerController];
    objc_storeWeak((id *)&v6->_playerController, v7);

    v6->_showsVideoGravityButton = 1;
    id v8 = [(AVPlaybackControlsController *)v6 playerViewController];
    v6->_showsPlaybackControls = [v8 showsPlaybackControls];

    *(_WORD *)&v6->_playbackControlsIncludeTransportControls = 257;
    v6->_playbackControlsIncludeVolumeControls = 1;
    v6->_allowsEnteringFullScreen = 1;
    *(_WORD *)&v6->_startRightwardContentTransitionButtonEnabled = 257;
    v6->_volumeControlsCanShowSlider = 1;
    *(_DWORD *)&v6->_forcePlaybackControlsHidden = 16842752;
    *(_WORD *)&v6->_hasBegunObservingPotentiallyUnimplementedPlayerControllerProperties = 0;
    v6->_loadingIndicatorTimerDeladouble y = 1.0;
    v6->_canIncludePlaybackControlsWhenInline = [v4 canIncludePlaybackControlsWhenInline];
    objc_super v9 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v10 = [v9 globallyUniqueString];
    uniqueIdentifer = v6->_uniqueIdentifer;
    v6->_uniqueIdentifer = (NSString *)v10;

    __int16 v12 = [[AVObservationController alloc] initWithOwner:v6];
    observationController = v6->_observationController;
    v6->_observationController = v12;

    uint64_t v14 = objc_alloc_init(AVMobilePlaybackRateMenuController);
    playbackRateMenuController = v6->_playbackRateMenuController;
    v6->_playbackRateMenuController = v14;

    [(AVPlaybackControlsController *)v6 _handlePhotosensitiveRegions];
    long long v16 = _AVLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[AVPlaybackControlsController initWithPlayerViewController:]";
      __int16 v21 = 1024;
      int v22 = 219;
      _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
    }
  }
  return v6;
}

+ (id)keyPathsForValuesAffectingNeedsTimeResolver
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playbackControlsView";
  v6[1] = @"resumingUpdates";
  v6[2] = @"playbackControlsView.showsPlaybackControls";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingPlayButtonsShowPauseGlyph
{
  v6[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"timeControlStatus";
  v6[1] = @"playerController.activeRate";
  v6[2] = @"playerController.suspendedRate";
  v6[3] = @"playerController.playbackSuspended";
  void v6[4] = @"playbackSuspendedForScrubbing";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingCanShowLoadingIndicator
{
  v6[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playerController.status";
  v6[1] = @"playbackControlsView";
  v6[2] = @"playerViewControllerIsBeingTransitionedWithResizing";
  v6[3] = @"resumingUpdates";
  void v6[4] = @"timeControlStatus";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsStartContentTransitionButtons
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playbackControlsIncludeStartContentTransitionButtons";
  v6[1] = @"fullScreen";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsSkipButtons
{
  void v6[6] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"seekingEnabled";
  v6[1] = @"playerController.status";
  v6[2] = @"playerViewControllerIsBeingTransitionedWithResizing";
  void v6[3] = @"requiresLinearPlayback";
  void v6[4] = @"playbackControlsIncludeStartContentTransitionButtons";
  v6[5] = @"fullScreen";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingSeekingEnabled
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playerController.canSeek";
  v6[1] = @"requiresLinearPlayback";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingMaximumTime
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playerController.status";
  v6[1] = @"timeResolver.maxTime";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingMinimumTime
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playerController.status";
  v6[1] = @"timeResolver.minTime";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingCurrentTime
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playerController.status";
  v6[1] = @"timeResolver.targetTime";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsMediaSelectionButton
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"playerController.hasMediaSelectionOptions"];
}

+ (id)keyPathsForValuesAffectingShouldEnterFullScreenWhenPlaybackBegins
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"entersFullScreenWhenPlaybackBegins";
  v6[1] = @"hasPlaybackBegunSincePlayerControllerBecameReadyToPlay";
  v6[2] = @"playerViewControllerHasInvalidViewControllerHierarchy";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsTransportControls
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"preferredUnobscuredArea";
  v6[1] = @"shouldEnterFullScreenWhenPlaybackBegins";
  v6[2] = @"fullScreen";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingProminentPlayButtonCanShowPauseGlyph
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"preferredUnobscuredArea";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsProminentPlayButton
{
  v6[14] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playbackControlsIncludeTransportControls";
  v6[1] = @"hasPlaybackBegunSincePlayerControllerBecameReadyToPlay";
  void v6[2] = @"fullScreen";
  void v6[3] = @"shouldEnterFullScreenWhenPlaybackBegins";
  void v6[4] = @"pictureInPictureController.pictureInPictureActive";
  v6[5] = @"preferredUnobscuredArea";
  void v6[6] = @"playerController.playingOnExternalScreen";
  void v6[7] = @"playerController.hasVideo";
  v6[8] = @"playerController.hasEnabledAudio";
  v6[9] = @"playButtonsShowPauseGlyph";
  v6[10] = @"playerController";
  v6[11] = @"playButtonHandlerForLazyPlayerLoading";
  v6[12] = @"showsMinimalPlaybackControlsWhenEmbeddedInline";
  v6[13] = @"playerController.status";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:14];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingShowsRoutePickerView
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"multipleRoutesDetected";
  v6[1] = @"playerController.allowsExternalPlayback";
  void v6[2] = @"wantsExternalPlaybackButtonShown";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingFullScreen
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"playerViewControllerIsPresentingFullScreen";
  v6[1] = @"playerViewControllerIsPresentedFullScreen";
  void v6[2] = @"coveringWindow";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

@end