@interface PHAudioCallViewController
+ (BOOL)posterSourceIsSyncedWithContacts:(unint64_t)a3;
+ (BOOL)prefersWhiteTextOnImageRef:(CGImage *)a3;
+ (BOOL)wallpaperContentIsSensitive:(id)a3;
+ (CGImage)imageRefFrom:(id)a3;
+ (NSArray)contactKeysToFetch;
+ (id)dismissalAssertionReason;
+ (void)fetchPrefersWhiteColorAtCropRect:(CGRect)a3 image:(id)a4 completion:(id)a5;
- (AVSpeechSynthesizer)speechSynthesizer;
- (BOOL)_isScreeningAnyCallGroup:(id)a3;
- (BOOL)_isScreeningCallGroup:(id)a3;
- (BOOL)alertTriggeredByAutoCountdown;
- (BOOL)allowsBanners;
- (BOOL)allowsMenuButtonDismissal;
- (BOOL)allowsOrientationChangeEvents;
- (BOOL)audioCallMutedTalkerIsSupported;
- (BOOL)callHasContactPosterWithHorizontalName;
- (BOOL)callHasContactPosterWithVerticalName;
- (BOOL)callHasNoContactPoster;
- (BOOL)callParticipantsViewControllerShouldShowLargeAvatar:(id)a3;
- (BOOL)callStateCanShowNewPoster:(id)a3;
- (BOOL)canDoInfoButtonCoinFlipWith:(id)a3 contactStore:(id)a4;
- (BOOL)canDumpHierarchy;
- (BOOL)canShowBackgroundImage;
- (BOOL)canShowPosterBadgeInAudioCallView:(id)a3;
- (BOOL)canShowPosterImage;
- (BOOL)conditions;
- (BOOL)currentCallStateCanShowNewPoster;
- (BOOL)desiresLockButtonEvents;
- (BOOL)desiresLockButtonEventsForCallContainer:(id)a3;
- (BOOL)didNotifyMutedCaller;
- (BOOL)didRequestToSpeakAlertUtterance;
- (BOOL)didTriggerAutoCountdownAlertBefore;
- (BOOL)hasInvertedUIElementColorsBasedOnPoster;
- (BOOL)hasKeypadUpdated;
- (BOOL)hasLastSeenPosterForCall:(id)a3;
- (BOOL)hasNoCallsOrOnlyEndedCalls;
- (BOOL)isPickedRouteReceiver;
- (BOOL)isPickedRouteSpeaker;
- (BOOL)isReadyToShowCallDetails;
- (BOOL)isShowSOSConfirmationSupported;
- (BOOL)isShowing6UP;
- (BOOL)isShowingBackgroundImage;
- (BOOL)isShowingPosterBadge;
- (BOOL)isUserInterfaceShowing;
- (BOOL)lastSeenPosterDataIsSensitiveForCall:(id)a3;
- (BOOL)needsDismissalAssertion;
- (BOOL)participantsViewControllersShouldIgnoreUpdates;
- (BOOL)participantsViewIsShowingMultipleLabel;
- (BOOL)participantsViewShouldShowParticipantLabel;
- (BOOL)prefersShowingCachedLastSeenPosterBeforeCallConnected:(id)a3;
- (BOOL)prioritizedCallIsInSameCallGroupAsCall:(id)a3;
- (BOOL)setCallForBackgroundImage:(id)a3 animated:(BOOL)a4 callDisplayStyleChanged:(BOOL)a5;
- (BOOL)shouldAddExtensionNumberButtonToViewHierarchy;
- (BOOL)shouldAddRTTButtonToViewHierarchy;
- (BOOL)shouldApplyNewGradientBlur;
- (BOOL)shouldAutoCountdownAlert;
- (BOOL)shouldEnableShareMediaButton;
- (BOOL)shouldEnableVideoStreamingButton;
- (BOOL)shouldPauseSOSCallBufferTimer;
- (BOOL)shouldPlayAudioInCallBufferScreen;
- (BOOL)shouldPresentAlertButton;
- (BOOL)shouldRenderAlertTextColor;
- (BOOL)shouldRenderAlertTextFont;
- (BOOL)shouldShowAnswerRTT;
- (BOOL)shouldShowCallDetailsViewButton;
- (BOOL)shouldShowCallTransfer;
- (BOOL)shouldShowCircularAvatar;
- (BOOL)shouldShowConferenceCallDetails;
- (BOOL)shouldShowContactOrLastSeenWallpaper;
- (BOOL)shouldShowEnableWiFiCallingAlertForCall:(id)a3;
- (BOOL)shouldShowHardPauseNumbers;
- (BOOL)shouldShowLargeAvatar;
- (BOOL)shouldShowLargeAvatarForCall:(id)a3;
- (BOOL)shouldShowLargeAvatarForCallWaiting;
- (BOOL)shouldShowNewPosterUpdates;
- (BOOL)shouldShowUseRTT;
- (BOOL)shouldUpdateBackgroundForEmergencyCall;
- (BOOL)shouldUseHeroImageLayout;
- (BOOL)usesCompactMulticallUI;
- (BOOL)videoStreamingIsGoingOn;
- (BOOL)waitingForFullScreenAudioRoutes;
- (BOOL)wasPresentedAsBanner;
- (CNKCallDetailsCoordinatorProtocol)callDetailsCoordinator;
- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory;
- (CNKCoreAnalyticsReporter)analyticsReporter;
- (CNKFeatures)features;
- (CNKMutedTalkerBannerViewControllerFactory)mutedTalkerViewControllerFactory;
- (CNKMutedTalkerBannerViewControllerProtocol)mutedTalkerBannerViewController;
- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory;
- (CNKTranscriptionViewComposerFactory)screeningViewControllerFactory;
- (FTConstraintsToggle)screeningConstraints;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (IMNicknameProvider)imNicknameProvider;
- (NSArray)callWaitingLayoutConstraints;
- (NSCache)configurationCache;
- (NSCache)contactsCache;
- (NSLayoutConstraint)bottomBarBottomConstraint;
- (NSLayoutConstraint)buttonsViewBottomConstraint;
- (NSLayoutConstraint)callRecordingLeadingConstraint;
- (NSLayoutConstraint)participantsViewBottomConstraint;
- (NSLayoutConstraint)participantsViewCenterXConstraint;
- (NSLayoutConstraint)participantsViewCenterYConstraint;
- (NSLayoutConstraint)participantsViewLeadingConstraint;
- (NSLayoutConstraint)participantsViewTopConstraint;
- (NSLayoutConstraint)participantsViewTrailingConstraint;
- (NSLayoutConstraint)participantsViewVerticalPosterNameTopConstraint;
- (NSMutableArray)callUUIDsThatPresentedSNaPHUD;
- (NSObject)stateChangeLockObservation;
- (NSString)UUIDForLocallyDisconnectedCall;
- (NSTimer)alertCountDownTimer;
- (NSTimer)callBufferTimer;
- (NSTimer)confirmationTimeoutTimer;
- (PHAudioCallControlsSupplementalButton)callTransferButton;
- (PHAudioCallControlsSupplementalButton)extensionNumberButton;
- (PHAudioCallControlsSupplementalButton)useRTTButton;
- (PHAudioCallControlsViewController)buttonsViewController;
- (PHAudioCallViewController)initWithCallDisplayStyleManager:(id)a3 callCenter:(id)a4 featureFlags:(id)a5;
- (PHAudioCallVoiceLoopViewController)voiceLoopViewController;
- (PHAudioRoutingMenuController)routeListController;
- (PHBackgroundGradientBlurView)backgroundImageView;
- (PHCallParticipantsViewController)callParticipantsViewController;
- (PHCallParticipantsViewController)callWaitingParticipantsViewController;
- (PHDeclineCallServiceProtocol)declineCallService;
- (PHEnhancedEmergencyCoordinator)emergencyCoordinator;
- (PHInCallKeypadViewController)keypadViewController;
- (PHPosterNameViewModel)alwaysOnDisplayPosterNameViewModel;
- (PHPosterNameViewModel)keypadPosterNameViewModel;
- (PHPosterNameViewModel)posterNameViewModel;
- (PHPosterNameViewModel)screeningPosterNameViewModel;
- (PHSingleCallParticipantLabelView)bufferSingleCallLabelView;
- (PRUISPosterRenderingViewController)renderingViewController;
- (SOSEmergencyCallVoiceLoopManager)voiceLoopManager;
- (SOSVoiceMessageManager)voiceMessageManager;
- (TUCall)activeCall;
- (TUCall)callForBackgroundImage;
- (TUCall)callToUseForWallpaper;
- (TUCall)frontmostCall;
- (TUCall)prioritizedCall;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (UIButton)blockButton;
- (UIButton)callDetailsViewButton;
- (UIImage)snapshottedPosterImageToUseForColorInversion;
- (UIImageView)unblurredBackgroundImageView;
- (UILabel)emergencyTextViaSatelliteLabel;
- (UILabel)enhancedEmergencyIntermittentStateLabel;
- (UILabel)enhancedEmergencySecondaryLabel;
- (UILayoutGuide)leadingSideLayoutGuide;
- (UILayoutGuide)recordingIndicatorLayoutGuide;
- (UILayoutGuide)trailingSideLayoutGuide;
- (UIScrollView)enhancedEmergencyIntermittentStateScrollView;
- (UIView)alwaysOnDisplayDimmingView;
- (UIView)ambientAudioRoutesControlView;
- (UIView)currentMiddleView;
- (UIView)defaultBackgroundGradientView;
- (UIView)emergencyPhotoPickerGrabberView;
- (UIView)heldCallControlsView;
- (UIView)middleSizingView;
- (UIView)posterBadgeView;
- (UIView)screeningBackgroundView;
- (UIViewController)callRecordingButtonViewController;
- (UIViewController)callRecordingPillViewController;
- (UIViewController)screeningBackgroundViewController;
- (UIViewController)screeningViewController;
- (UIVisualEffectView)keypadBackgroundView;
- (double)callDetailsButtonPaddingTop;
- (double)callDetailsButtonPaddingTop_PERCENT;
- (double)callDetailsButtonPaddingTrailing;
- (double)callDetailsButtonPaddingTrailing_PERCENT;
- (double)callWaitingAnimationDelay;
- (double)viewAlphaForPosterRenderingViewController;
- (id)ambientParticipantsViewConstraintsForView:(id)a3 largeAvatar:(BOOL)a4;
- (id)answerRequestForCall:(id)a3;
- (id)associatedCallGroupForCall:(id)a3;
- (id)audioRouteMenu;
- (id)bottomBarBottomConstraintToUse;
- (id)buttonsViewBottomConstraintToUse;
- (id)contactForCall:(id)a3;
- (id)contactImage;
- (id)contactImageDataForCall:(id)a3;
- (id)contactImageForCall:(id)a3;
- (id)contactToDisplayInCallWallpaperForCall:(id)a3;
- (id)contactWallpaperBackgroundColor;
- (id)contactWallpaperConfigurationForCall:(id)a3 shouldReadFromCache:(BOOL)a4;
- (id)contactWallpaperForCall:(id)a3;
- (id)createBlurryBackgroundView;
- (id)createContactFirstNameLabelViewModel;
- (id)currentIMNicknameMatchingContact:(id)a3;
- (id)customColorForParticipantLabelWithCall:(id)a3;
- (id)customColorForStatusLabelWithCall:(id)a3;
- (id)customFontForParticipantLabelWithCall:(id)a3;
- (id)customizedTitleForItemInBar:(id)a3 withActionType:(int64_t)a4;
- (id)fallbackHorizontalNameLabelString;
- (id)fallbackImageDataForCall:(id)a3;
- (id)getAudioRouteMenu;
- (id)getCurrentCall;
- (id)getParticipantsView_NotWaiting;
- (id)getParticipantsView_Waiting;
- (id)getParticipantsView_WaitingOrNot;
- (id)isolatedCall;
- (id)lastSeenOrCurrentPosterConfigurationForCall:(id)a3;
- (id)lastSeenPosterConfigurationForCall:(id)a3;
- (id)lastSeenPosterIMWallpaperMetadataForCall:(id)a3;
- (id)makeCallDetailsCoordinatorWithBannerPresentationManager:(id)a3 existingCoordinator:(id)a4 deferredPresentationManager:(id)a5;
- (id)makeHeldCallControlsViewWithCallCenter:(id)a3 style:(int64_t)a4;
- (id)makeLockObserverWithHandler:(id)a3;
- (id)newPosterConfigurationForCall:(id)a3;
- (id)pendingMiddleViewAnimations;
- (id)readCachedLastSeenPosterDataForCall:(id)a3;
- (id)routesForAudioRoutingMenuController:(id)a3;
- (id)sharedProfileStateOracleForCall:(id)a3;
- (id)snapshotUIImageView;
- (id)stateDisplayChangedObservation;
- (id)suspendPosterAfterDelayBlock;
- (id)wallpaperTitleStyleAttributes;
- (id)wallpaperTitleStyleAttributesForCall:(id)a3;
- (id)wallpaperTypeForBundleID:(id)a3;
- (id)wallpaperTypeForCNWallpaper:(id)a3;
- (id)wallpaperTypeForIMWallpaperMetadata:(id)a3;
- (int64_t)bottomBarCallStateInBar:(id)a3;
- (int64_t)bottomBarStateForCallWaitingCall;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)currentDisplayedPosterSourceForCall:(id)a3;
- (unint64_t)suggestedNewPosterSourceAfterCallConnects:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)middleViewState;
- (void)_leaveMessage;
- (void)_performPosterTransformationsIfNecessaryToState:(unsigned __int16)a3;
- (void)_testing_didTransitionToActiveCallState:(id)a3;
- (void)_testing_didTransitionToEndingCallState;
- (void)_testing_didTransitionToIdleCallState;
- (void)_testing_didTransitionToIncomingRingingCallState:(id)a3;
- (void)_testing_finishedAnimatingToActiveCallState:(id)a3;
- (void)_updatePosterNameAlpha;
- (void)_updatePosterStatusLabelForState:(unsigned __int16)a3;
- (void)_updateStatusLabelVisibility;
- (void)addBottomBarSubView;
- (void)addButton;
- (void)addCallParticipantsSubView;
- (void)addCallRecordingIfNeeded;
- (void)addDefaultBackgroundGradientView;
- (void)addEnhancedEmergencyIntermittentStateLabelWithState:(int64_t)a3;
- (void)addMediaRequestViewController:(id)a3;
- (void)addPosterBlurToPosterVC:(id)a3 nameLabelWrapper:(id)a4;
- (void)addRecordingIndicator;
- (void)addWebRTCViewController:(id)a3;
- (void)alertWillInvoke;
- (void)animateInfoButtonCoinFlipIfNeeded;
- (void)applyBlockButtonPositionAndSizeCapToElement:(id)a3;
- (void)applyCallDetailsViewButtonPositionAndSizeCapToElement:(id)a3;
- (void)applyCallWaitingConstraintsForAmbient;
- (void)applyParticipantsViewConstraints;
- (void)applyParticipantsViewConstraintsForAmbient;
- (void)applyParticipantsViewConstraintsForBanner;
- (void)applyParticipantsViewConstraintsForFullScreen;
- (void)applySizeToElement:(id)a3 usingThisElementAsGuide:(id)a4;
- (void)applyWallpaperTitleStyleAttributesToTextViewWrapper:(id)a3;
- (void)audioCallControlsViewControllerDidTapEndButton:(id)a3;
- (void)audioCallControlsViewControllerDidTapRTTButton;
- (void)audioCallControlsViewControllerDidTapVideoStreamingButton;
- (void)audioCallControlsViewControllerDidToggleMuteButton:(BOOL)a3;
- (void)audioCallControlsViewControllerRequestedAddCallPresentation:(id)a3 forView:(id)a4;
- (void)audioCallControlsViewControllerRequestedAudioRoutesPresentation:(id)a3;
- (void)audioCallControlsViewControllerRequestedContactsPresentation:(id)a3 forView:(id)a4;
- (void)audioCallControlsViewControllerRequestedInvokeAlert;
- (void)audioCallControlsViewControllerRequestedKeypadPresentation:(id)a3;
- (void)audioCallControlsViewControllerRequestedKeypadPresentationForFieldMode:(id)a3;
- (void)audioCallControlsViewControllerRequestedShareCardFromSourceView:(id)a3;
- (void)audioCallControlsViewControllerRequestedShareMedia;
- (void)audioCallControlsViewControllerRequestedVideoPresentation:(id)a3;
- (void)audioCallVoiceLoopViewControllerRequestedButtonPresentation;
- (void)audioDeviceControllerMutedTalkerDidStart:(id)a3;
- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4;
- (void)bannerDidGetTap;
- (void)blockButtonTapped;
- (void)blockWithHandle:(id)a3;
- (void)bottomBarActionPerformed:(int64_t)a3 withCompletionState:(int64_t)a4 fromBar:(id)a5;
- (void)bringWebRTCViewControllerToFront:(id)a3;
- (void)callCenterCallStatusChangedNotification:(id)a3;
- (void)callCenterScreeningStatusChangedNotification:(id)a3;
- (void)callContinuityStateChangedNotification:(id)a3;
- (void)callDetailsViewButtonTapped;
- (void)callDisplayContextChangedNotification:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)callIsEmergencyChangedNotification:(id)a3;
- (void)callIsScreenSharingChangedNotification:(id)a3;
- (void)callKeypadDataSourceChangedNotification:(id)a3;
- (void)callOnHoldChangedNotification:(id)a3;
- (void)callParticipantsViewController:(id)a3 didPerformActionType:(int64_t)a4;
- (void)callParticipantsViewController:(id)a3 didShowMultipleLabel:(BOOL)a4;
- (void)callParticipantsViewController:(id)a3 willShowMultipleLabel:(BOOL)a4;
- (void)callParticipantsViewControllerDidTapCallDetailsGestureRecognizer:(id)a3;
- (void)callTransferButtonTapped;
- (void)conferenceParticipantCallsChangedNotification:(id)a3;
- (void)constrainBottomBar;
- (void)constrainBottomBarBottom;
- (void)constrainButtonsViewBottom;
- (void)contactDidChange:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4;
- (void)copyCallWaitingConstraintsFromParticipantsView;
- (void)createContactWithHandle:(id)a3;
- (void)dealloc;
- (void)deleteAllUnarchivedPosterDirectories;
- (void)dismissNavigationController;
- (void)dismissNavigationControllerAndUpdateScene;
- (void)displayDialledNumberDetailsForCallBufferScreen;
- (void)extensionNumberButtonTapped;
- (void)fadeInBottomBar;
- (void)finishNewPosterUpdatesWithCompletion:(id)a3;
- (void)handleCancelPressedInCallBufferScreen;
- (void)handleDeviceLockEventWithSourceType:(int64_t)a3;
- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3;
- (void)handleTUCallTTYTypeChangedNotification:(id)a3;
- (void)handleViewDidAppear:(BOOL)a3;
- (void)handleViewDidDisappear:(BOOL)a3;
- (void)handleViewWillAppear:(BOOL)a3;
- (void)handleViewWillDisappear:(BOOL)a3;
- (void)hardPauseDigitsStateChangedNotification:(id)a3;
- (void)hardwareButtonEventNotification:(id)a3;
- (void)hideCallControls;
- (void)hideFirstNameLabelOnKeypad;
- (void)hideOrShowKeypadBackgroundView;
- (void)hideOrShowScreeningBackgroundView;
- (void)hideOrShowThirdPartyBackgroundImageWithImage:(id)a3;
- (void)hideRTTConversationIfNeeded;
- (void)hideWebRTCViewController:(id)a3;
- (void)insertWebViewUnderButtonControls:(id)a3;
- (void)invertColorCallRecordingButtonColor:(BOOL)a3;
- (void)invertColorForBottomButtonsBasedOn:(id)a3;
- (void)invertColorForCallDetailsButtonBasedOn:(id)a3;
- (void)invertColorForCallRecordingButtonBasedOn:(id)a3;
- (void)invertColorForPosterBadgeViewBasedOn:(id)a3;
- (void)invertColorForPosterBadgeViewIfSnapshotPoster;
- (void)invertNecessaryUIElementsBasedOnPosterImage:(id)a3;
- (void)layoutParticipantsViewAnimated:(BOOL)a3;
- (void)layoutParticipantsViewAnimated:(BOOL)a3 crossfade:(BOOL)a4;
- (void)loadView;
- (void)localAudioToggledWithIsMuted:(BOOL)a3;
- (void)lockScreenVisibilityDidChange:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)pauseCallBufferTimer;
- (void)performBottomBarActionType:(int64_t)a3;
- (void)positionParticipantsViewStatusLabelToBeHorizontallyCenteredToInfoButton:(id)a3;
- (void)positionPosterBadgeToBeHorizontallyCenteredToInfoButton:(id)a3;
- (void)presentDisconnectionAlert:(id)a3;
- (void)presentShareCard:(id)a3 source:(id)a4;
- (void)refreshCallDetailsViewButton;
- (void)refreshExtensionNumberButton;
- (void)refreshUseRTTButton;
- (void)releaseDismissalAssertion;
- (void)removeAllParticipantsViewConstraints;
- (void)removeBackgroundContactImageView;
- (void)removeDefaultBackgroundGradientView;
- (void)removeEmergencyTextViaSatelliteUI;
- (void)removeEnhancedEmergencyIntermittentStateLabel;
- (void)removeFirstNameLabelFromViewIfNeeded;
- (void)removeMediaRequestViewController:(id)a3;
- (void)removeNameLabelForAlwaysOnDisplay;
- (void)removePosterViewController:(BOOL)a3 completion:(id)a4;
- (void)removeWebRTCViewController:(id)a3;
- (void)removeWebRTCViewControllerForPIP:(id)a3;
- (void)reportWithCall:(id)a3;
- (void)requestAnimationToFullScreenWebView;
- (void)requestHapticForRequest;
- (void)requestToAddErrorLabelWithRetryable:(BOOL)a3;
- (void)requestToAddMitigationLabel;
- (void)requestToAddPhotoMitigationLabel;
- (void)requestToAddResumeCameraLabel;
- (void)requestToDisableMediaUploadButton;
- (void)requestToDisableVideoStreamingButton;
- (void)requestToEnableMediaUploadButton;
- (void)requestToEnableVideoStreamingButton;
- (void)requestToPresentMediaUploadRequestBanner;
- (void)requestToPresentMediaUploadRequestBannerDuringStreaming;
- (void)requestToPresentVideoStreamingRequestBanner;
- (void)requestToRemoveEnhancedEmergencyIntermittentStateLabel;
- (void)resetParticipantsViewConstraints;
- (void)restartCallBufferTimer;
- (void)restoreParticipantsViewStatusLabelForFullScreen;
- (void)resumeCallBufferTimer;
- (void)revealAudioRoutingDeviceListAnimated:(BOOL)a3;
- (void)revealAudioRoutingDeviceListAnimatedIfNeeded;
- (void)routesChangedForRouteController:(id)a3;
- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4;
- (void)setActiveState:(unsigned __int16)a3;
- (void)setAlertCountDownTimer:(id)a3;
- (void)setAlertModeNeededState:(unsigned __int16)a3;
- (void)setAlertTriggeredByAutoCountdown:(BOOL)a3;
- (void)setAlwaysOnDisplayDimmingView:(id)a3;
- (void)setAlwaysOnDisplayPosterNameViewModel:(id)a3;
- (void)setAmbientAudioRoutesControlView:(id)a3;
- (void)setAnalyticsReporter:(id)a3;
- (void)setBackgroundColor:(id)a3 animated:(BOOL)a4;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setBlockButton:(id)a3;
- (void)setBottomBarBottomConstraint:(id)a3;
- (void)setBufferSingleCallLabelView:(id)a3;
- (void)setButtonsViewBottomConstraint:(id)a3;
- (void)setButtonsViewController:(id)a3;
- (void)setCallBufferState:(unsigned __int16)a3;
- (void)setCallBufferTimer:(id)a3;
- (void)setCallDetailsCoordinator:(id)a3;
- (void)setCallDetailsViewButton:(id)a3;
- (void)setCallForBackgroundImage:(id)a3;
- (void)setCallParticipantsViewController:(id)a3;
- (void)setCallRecordingButtonViewController:(id)a3;
- (void)setCallRecordingLeadingConstraint:(id)a3;
- (void)setCallRecordingPillViewController:(id)a3;
- (void)setCallTransferButton:(id)a3;
- (void)setCallWaitingLayoutConstraints:(id)a3;
- (void)setCallWaitingParticipantsViewController:(id)a3;
- (void)setCanDumpHierarchy:(BOOL)a3;
- (void)setConfigurationCache:(id)a3;
- (void)setConfirmationTimeoutTimer:(id)a3;
- (void)setContactsCache:(id)a3;
- (void)setCurrentMiddleView:(id)a3;
- (void)setCurrentState:(unsigned __int16)a3;
- (void)setCurrentState:(unsigned __int16)a3 animated:(BOOL)a4;
- (void)setDeclineCallService:(id)a3;
- (void)setDefaultBackgroundGradientView:(id)a3;
- (void)setDidNotifyMutedCaller:(BOOL)a3;
- (void)setDidRequestToSpeakAlertUtterance:(BOOL)a3;
- (void)setDidTriggerAutoCountdownAlertBefore:(BOOL)a3;
- (void)setEmergencyCoordinator:(id)a3;
- (void)setEmergencyPhotoPickerGrabberView:(id)a3;
- (void)setEmergencyTextViaSatelliteLabel:(id)a3;
- (void)setEmergencyTextViaSatelliteUI;
- (void)setEndedState:(unsigned __int16)a3;
- (void)setEndingState:(unsigned __int16)a3;
- (void)setEnhancedEmergencyIntermittentStateLabel:(id)a3;
- (void)setEnhancedEmergencyIntermittentStateScrollView:(id)a3;
- (void)setEnhancedEmergencySecondaryLabel:(id)a3;
- (void)setExtensionNumberButton:(id)a3;
- (void)setHasInvertedUIElementColorsBasedOnPoster:(BOOL)a3;
- (void)setHasKeypadUpdated:(BOOL)a3;
- (void)setHeldCallControlsView:(id)a3;
- (void)setIdleState:(unsigned __int16)a3;
- (void)setImNicknameProvider:(id)a3;
- (void)setKeypadBackgroundView:(id)a3;
- (void)setKeypadPosterNameViewModel:(id)a3;
- (void)setKeypadViewController:(id)a3;
- (void)setLeadingSideLayoutGuide:(id)a3;
- (void)setMiddleSizingView:(id)a3;
- (void)setMiddleViewButtonsIfNecessary;
- (void)setMiddleViewState:(unsigned __int16)a3;
- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4;
- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setMutedTalkerBannerViewController:(id)a3;
- (void)setMutedTalkerViewControllerFactory:(id)a3;
- (void)setOutgoingRingingState:(unsigned __int16)a3;
- (void)setParticipantsViewBottomConstraint:(id)a3;
- (void)setParticipantsViewCenterXConstraint:(id)a3;
- (void)setParticipantsViewCenterYConstraint:(id)a3;
- (void)setParticipantsViewControllersShouldIgnoreUpdates:(BOOL)a3;
- (void)setParticipantsViewIsShowingMultipleLabel:(BOOL)a3;
- (void)setParticipantsViewLeadingConstraint:(id)a3;
- (void)setParticipantsViewShouldShowParticipantLabel:(BOOL)a3;
- (void)setParticipantsViewTopConstraint:(id)a3;
- (void)setParticipantsViewTrailingConstraint:(id)a3;
- (void)setParticipantsViewVerticalPosterNameTopConstraint:(id)a3;
- (void)setPendingMiddleViewAnimations:(id)a3;
- (void)setPosterBadgeView:(id)a3;
- (void)setPosterNameViewModel:(id)a3;
- (void)setPrioritizedCall:(id)a3;
- (void)setRecordingIndicatorLayoutGuide:(id)a3;
- (void)setRenderingViewController:(id)a3;
- (void)setRingingState:(unsigned __int16)a3;
- (void)setRootView;
- (void)setRouteListController:(id)a3;
- (void)setScreeningBackgroundView:(id)a3;
- (void)setScreeningBackgroundViewController:(id)a3;
- (void)setScreeningConstraints:(id)a3;
- (void)setScreeningPosterNameViewModel:(id)a3;
- (void)setScreeningState:(unsigned __int16)a3 animated:(BOOL)a4;
- (void)setScreeningState:(unsigned __int16)a3 animated:(BOOL)a4 overrideWithIsUnlocked:(BOOL)a5;
- (void)setScreeningViewController:(id)a3;
- (void)setScreeningViewControllerFactory:(id)a3;
- (void)setShouldAutoCountdownAlert:(BOOL)a3;
- (void)setShouldEnableShareMediaButton:(BOOL)a3;
- (void)setShouldEnableVideoStreamingButton:(BOOL)a3;
- (void)setShouldPauseSOSCallBufferTimer:(BOOL)a3;
- (void)setShouldPresentAlertButton:(BOOL)a3;
- (void)setShouldShowLargeAvatar:(BOOL)a3;
- (void)setShouldShowLargeAvatarForCallWaiting:(BOOL)a3;
- (void)setShowsBlockButton:(BOOL)a3;
- (void)setShowsCallDetailsViewButton:(BOOL)a3;
- (void)setShowsCallWaitingParticipantView:(BOOL)a3;
- (void)setSnapshottedPosterImageToUseForColorInversion:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)setStateChangeLockObservation:(id)a3;
- (void)setStateDisplayChangedObservation:(id)a3;
- (void)setSuspendPosterAfterDelayBlock:(id)a3;
- (void)setTrailingSideLayoutGuide:(id)a3;
- (void)setUUIDForLocallyDisconnectedCall:(id)a3;
- (void)setUnblurredBackgroundImageView:(id)a3;
- (void)setUpBlockButton;
- (void)setUpCallDetailsViewButton;
- (void)setUpLayoutGuidesForParticipantsViewController:(id)a3;
- (void)setUpPosterBadgeViewIfNecessary;
- (void)setUseRTTButton:(id)a3;
- (void)setViewsHiddenForAudioRoutes:(BOOL)a3 animated:(BOOL)a4;
- (void)setVoiceLoopManager:(id)a3;
- (void)setVoiceLoopViewController:(id)a3;
- (void)setVoiceMessageManager:(id)a3;
- (void)setWaitingForFullScreenAudioRoutes:(BOOL)a3;
- (void)setWaitingState:(unsigned __int16)a3;
- (void)setWasPresentedAsBanner:(BOOL)a3;
- (void)setupAmbientAudioRoutesControlViewIfNeeded;
- (void)setupDimmingViewForAlwaysOnDisplay;
- (void)setupHeldCallControlsViewIfNeeded;
- (void)setupNameLabelForAlwaysOnDisplay;
- (void)showBlockAlertForCall:(id)a3;
- (void)showBlockAlertForHandle:(id)a3;
- (void)showCallControls;
- (void)showCallDetailsIfNecessary;
- (void)showFirstNameLabelOnKeypad;
- (void)showNameAndPhotoHUDIfNecessaryWithBannerPresentationManager:(id)a3 callCenter:(id)a4;
- (void)showPosterBlurTransition;
- (void)showRTTConversation;
- (void)speakAlertUtteranceIfNecessary;
- (void)startAutoCountdownAlert;
- (void)startCallBufferScreenCountdown;
- (void)startMessagePlayback;
- (void)startSuppressionOfSTKAlerts;
- (void)startTracking;
- (void)stopCallBufferTimer;
- (void)stopMessagePlayback;
- (void)stopSuppressionOfSTKAlerts;
- (void)stopTracking;
- (void)suppressRingtoneForIncomingCall;
- (void)suspendPosterAndCancelDelay:(BOOL)a3;
- (void)synchronizeSingleLabelViewWithPosterText;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToFullScreenIfNecessary;
- (void)transitionToNewPoster:(id)a3 showingPosterTransition:(BOOL)a4 shouldBlurPoster:(BOOL)a5 completion:(id)a6;
- (void)triggerAutoCountdownIfAvailable;
- (void)triggerInversionColorUpdate:(id)a3;
- (void)updateAmbientAudioRoutesVisibility;
- (void)updateBackgroundContactImageViewWithImage:(id)a3 animated:(BOOL)a4;
- (void)updateBackgroundForEmergencyCall;
- (void)updateBottomBarAlphaWithCurrentState:(unsigned __int16)a3;
- (void)updateBottomBarButtonsWithCall:(id)a3;
- (void)updateCallParticipantsViewControllerCallGroups;
- (void)updateCallRecordingIfNeeded;
- (void)updateCallRecordingPositionIfNeeded;
- (void)updateCallRecordingViewBackgroundMaterialType:(unint64_t)a3;
- (void)updateCurrentState;
- (void)updateEnhancedEmergencyViewWhenKeypadPresented;
- (void)updateHardPauseDigitsState;
- (void)updateIncomingBottomBarControlState;
- (void)updateLayeredBackgroundWallpaper;
- (void)updateLayoutSupplementalButtons;
- (void)updateLegacyBackgroundImageVisibilityWithShouldShowWallpaper:(BOOL)a3;
- (void)updateParticipantConstraintsForPosterName:(id)a3;
- (void)updateParticipantsLabelForView:(id)a3 isHidden:(BOOL)a4;
- (void)updatePosterBadgeView:(BOOL)a3 to:(id)a4;
- (void)updatePosterViewModelForParticipantsView:(id)a3;
- (void)updatePresentationStateWithAllowed:(BOOL)a3;
- (void)updateScreenSharingDisableUpdateMask;
- (void)updateShareNameAndPhotoHUDPresentationIfNeeded;
- (void)updateShouldShowLargeAvatar;
- (void)updateViewForEmergencyCallIfNecessary;
- (void)updateViewsForHeldCallControlsViewIfNeeded;
- (void)useRTTButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)voiceLoopManagerDidStartLoopPlayback:(id)a3;
- (void)voiceLoopManagerDidStopLoopPlayback:(id)a3;
- (void)wantsHoldMusicChangedNotification:(id)a3;
- (void)writeToLastSeenPosterCacheIfNecessaryForCall:(id)a3;
@end

@implementation PHAudioCallViewController

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if (!+[PHUIConfiguration canAutoRotateInCallUIForFaceTimeAudio])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)PHAudioCallViewController;
  return [(PHAudioCallViewController *)&v4 preferredInterfaceOrientationForPresentation];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTimeAudio])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)_testing_finishedAnimatingToActiveCallState:(id)a3
{
  id v4 = a3;
  if ([UIApp isRunningTest:@"AnswerIncomingCall"])
  {
    [UIApp finishedSubTest:@"end-to-end" forTest:@"AnswerIncomingCall"];
    [(PHAudioCallViewController *)self bottomBarActionPerformed:15 withCompletionState:1 fromBar:v4];
  }
}

- (void)_testing_didTransitionToActiveCallState:(id)a3
{
  id v4 = a3;
  if ([UIApp isRunningTest:@"AnswerIncomingCall"])
  {
    [UIApp finishedSubTest:@"pre-animation-delay" forTest:@"AnswerIncomingCall"];
  }
  else if ([UIApp isRunningTest:@"EndActiveCall"])
  {
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100091E3C;
    v7[3] = &unk_1002CDDE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
  else if ([UIApp isRunningTest:@"PlaceOutgoingCall"])
  {
    v6 = +[TUCallCenter sharedInstance];
    [v6 disconnectAllCalls];
  }
}

- (void)_testing_didTransitionToIdleCallState
{
  if ([UIApp isRunningTest:@"EndActiveCall"])
  {
    [UIApp finishedSubTest:@"end-call" forTest:@"EndActiveCall"];
    v2 = (void *)UIApp;
    CFStringRef v3 = @"EndActiveCall";
  }
  else
  {
    unsigned int v4 = [UIApp isRunningTest:@"AnswerIncomingCall"];
    v2 = (void *)UIApp;
    if (v4)
    {
      CFStringRef v3 = @"AnswerIncomingCall";
    }
    else
    {
      if (![UIApp isRunningTest:@"PlaceOutgoingCall"]) {
        return;
      }
      v2 = (void *)UIApp;
      CFStringRef v3 = @"PlaceOutgoingCall";
    }
  }

  _[v2 finishedTest:v3];
}

- (void)_testing_didTransitionToEndingCallState
{
  if ([UIApp isRunningTest:@"EndActiveCall"])
  {
    v2 = (void *)UIApp;
    [v2 finishedSubTest:@"pre-transition-delay" forTest:@"EndActiveCall"];
  }
}

- (void)_testing_didTransitionToIncomingRingingCallState:(id)a3
{
  id v4 = a3;
  if ([UIApp isRunningTest:@"AnswerIncomingCall"])
  {
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000920B8;
    v6[3] = &unk_1002CDDE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setParticipantsViewControllersShouldIgnoreUpdates:(BOOL)a3
{
  if (self->_participantsViewControllersShouldIgnoreUpdates != a3)
  {
    BOOL v3 = a3;
    dispatch_time_t v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v9 = 138412290;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating the participants view and viewController shouldIgnoreUpdates: %@", (uint8_t *)&v9, 0xCu);
    }

    self->_participantsViewControllersShouldIgnoreUpdates = v3;
    id v7 = [(PHAudioCallViewController *)self callParticipantsViewController];
    [v7 setShouldIgnoreUpdates:v3];

    id v8 = [(PHAudioCallViewController *)self callWaitingParticipantsViewController];
    [v8 setShouldIgnoreUpdates:v3];
  }
}

- (PHAudioCallViewController)initWithCallDisplayStyleManager:(id)a3 callCenter:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v66.receiver = self;
  v66.super_class = (Class)PHAudioCallViewController;
  v12 = [(PHCallViewController *)&v66 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callCenter, a4);
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    uint64_t v14 = objc_opt_new();
    analyticsReporter = v13->_analyticsReporter;
    v13->_analyticsReporter = (CNKCoreAnalyticsReporter *)v14;

    v16 = objc_opt_new();
    uint64_t v17 = [v16 makeWithCallCenter:v10];
    declineCallService = v13->_declineCallService;
    v13->_declineCallService = (PHDeclineCallServiceProtocol *)v17;

    uint64_t v19 = objc_opt_new();
    labelDescriptorFactory = v13->_labelDescriptorFactory;
    v13->_labelDescriptorFactory = (CNKCallParticipantLabelDescriptorFactory *)v19;

    objc_storeStrong((id *)&v13->_callDisplayStyleManager, a3);
    v13->_wasPresentedAsBanner = [v9 callDisplayStyle] == 0;
    v13->_middleViewState = 0;
    v13->_canDumpHierarchy = 1;
    uint64_t v21 = objc_opt_new();
    mutedTalkerViewControllerFactory = v13->_mutedTalkerViewControllerFactory;
    v13->_mutedTalkerViewControllerFactory = (CNKMutedTalkerBannerViewControllerFactory *)v21;

    uint64_t v23 = [(CNKMutedTalkerBannerViewControllerFactory *)v13->_mutedTalkerViewControllerFactory makeViewController];
    mutedTalkerBannerViewController = v13->_mutedTalkerBannerViewController;
    v13->_mutedTalkerBannerViewController = (CNKMutedTalkerBannerViewControllerProtocol *)v23;

    [(CNKMutedTalkerBannerViewControllerProtocol *)v13->_mutedTalkerBannerViewController setDelegate:v13];
    v13->_didNotifyMutedCaller = 0;
    uint64_t v25 = objc_opt_new();
    screeningViewControllerFactory = v13->_screeningViewControllerFactory;
    v13->_screeningViewControllerFactory = (CNKTranscriptionViewComposerFactory *)v25;

    uint64_t v27 = +[CNKFeatures sharedInstance];
    features = v13->_features;
    v13->_features = (CNKFeatures *)v27;

    v13->_participantsViewShouldShowParticipantLabel = 1;
    v29 = (NSCache *)objc_alloc_init((Class)NSCache);
    contactsCache = v13->_contactsCache;
    v13->_contactsCache = v29;

    [(NSCache *)v13->_contactsCache setCountLimit:10];
    v31 = (NSCache *)objc_alloc_init((Class)NSCache);
    configurationCache = v13->_configurationCache;
    v13->_configurationCache = v31;

    uint64_t v33 = +[NSMutableArray array];
    callUUIDsThatPresentedSNaPHUD = v13->_callUUIDsThatPresentedSNaPHUD;
    v13->_callUUIDsThatPresentedSNaPHUD = (NSMutableArray *)v33;

    v35 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v13->_featureFlags;
    v13->_featureFlags = v35;

    uint64_t v37 = objc_opt_new();
    screenSharingInteractionControllerFactory = v13->_screenSharingInteractionControllerFactory;
    v13->_screenSharingInteractionControllerFactory = (CNKScreenSharingInteractionControllerFactory *)v37;

    v39 = +[NSNotificationCenter defaultCenter];
    [v39 addObserver:v13 selector:"callCenterCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v39 addObserver:v13 selector:"hardwareButtonEventNotification:" name:@"PHHardwareButtonEventNotification" object:0];
    [v39 addObserver:v13 selector:"hardPauseDigitsStateChangedNotification:" name:TUCallHardPauseDigitsStateChangedNotification object:0];
    [v39 addObserver:v13 selector:"callContinuityStateChangedNotification:" name:TUCallCenterCallContinuityStateChangedNotification object:0];
    [v39 addObserver:v13 selector:"wantsHoldMusicChangedNotification:" name:TUCallCenterCallWantsHoldMusicChangedNotification object:0];
    [v39 addObserver:v13 selector:"callOnHoldChangedNotification:" name:TUCallIsOnHoldChangedNotification object:0];
    [v39 addObserver:v13 selector:"handleTUCallSupportsTTYWithVoiceChangedNotification:" name:TUCallSupportsTTYWithVoiceChangedNotification object:0];
    [v39 addObserver:v13 selector:"handleTUCallTTYTypeChangedNotification:" name:TUCallTTYTypeChangedNotification object:0];
    [v39 addObserver:v13 selector:"callIsScreenSharingChangedNotification:" name:TUCallIsSharingScreenChangedNotification object:0];
    [v39 addObserver:v13 selector:"callKeypadDataSourceChangedNotification:" name:@"PHInCallKeypadDataSourceChangedNotification" object:0];
    [v39 addObserver:v13 selector:"callDisplayContextChangedNotification:" name:TUCallDisplayContextChangedNotification object:0];
    [v39 addObserver:v13 selector:"callIsEmergencyChangedNotification:" name:TUCallCenterIsEmergencyChangedNotification object:0];
    [v39 addObserver:v13 selector:"conferenceParticipantCallsChangedNotification:" name:TUCallCenterConferenceParticipantsChangedNotification object:0];
    v40 = [(PHAudioCallViewController *)v13 featureFlags];
    LODWORD(v16) = TUCallScreeningEnabledM3();

    if (v16) {
      [v39 addObserver:v13 selector:"callCenterScreeningStatusChangedNotification:" name:TUCallCenterIsScreeningChangedNotification object:0];
    }
    v41 = [v10 routeController];
    [v41 addDelegate:v13];

    v42 = [v10 audioDeviceController];
    [v42 addDelegate:v13];

    v43 = +[UIApplication sharedApplication];
    v44 = [v43 delegate];
    v45 = [v44 bannerPresentationManager];
    [v45 setLocalAudioTogglingDelegate:v13];

    v46 = [(CNKScreenSharingInteractionControllerFactory *)v13->_screenSharingInteractionControllerFactory sharedController];
    [v46 addDelegate:v13];
  }
  v47 = sub_1000D5130();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController is about to set shouldPresentAlertButton to NO", buf, 2u);
  }

  v13->_shouldPresentAlertButton = 0;
  v48 = +[UIApplication sharedApplication];
  v49 = [v48 delegate];
  v50 = [v49 alertCoordinator];

  if (!v50)
  {
    v51 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
    v52 = +[UIApplication sharedApplication];
    v53 = [v52 delegate];
    [v53 setAlertCoordinator:v51];
  }
  v54 = +[UIApplication sharedApplication];
  v55 = [v54 delegate];
  v56 = [v55 alertCoordinator];
  [v56 setDelegate:v13];

  v13->_shouldEnableVideoStreamingButton = 0;
  v13->_shouldEnableShareMediaButton = 0;
  v57 = [(PHAudioCallViewController *)v13 features];
  LODWORD(v55) = [v57 isEnhancedEmergencyEnabled];

  if (v55)
  {
    v58 = +[PHSOSDisconnectionConfirmation sharedInstance];
    [v58 addDelegate:v13];

    v59 = [v10 frontmostCall];
    if (![v59 isEmergency])
    {
LABEL_15:

      goto LABEL_16;
    }
    v60 = [(PHAudioCallViewController *)v13 emergencyCoordinator];

    if (!v60)
    {
      v61 = sub_1000D5130();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v13;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: going to create PHEnhancedEmergencyCoordinator from initing PHAudioCallViewController: %@", buf, 0xCu);
      }

      v62 = objc_alloc_init(PHEnhancedEmergencyCoordinator);
      [(PHAudioCallViewController *)v13 setEmergencyCoordinator:v62];

      v63 = [(PHAudioCallViewController *)v13 emergencyCoordinator];
      [v63 setDelegate:v13];

      v59 = [v10 frontmostCall];
      v64 = [(PHAudioCallViewController *)v13 emergencyCoordinator];
      [v64 setTuCall:v59];

      goto LABEL_15;
    }
  }
LABEL_16:
  [(PHAudioCallViewController *)v13 setupDimmingViewForAlwaysOnDisplay];
  [(PHAudioCallViewController *)v13 updateCallRecordingIfNeeded];

  return v13;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(PHCallViewController *)self bottomBar];
  [v4 setDelegate:0];

  dispatch_time_t v5 = [(PHAudioCallViewController *)self callCenter];
  CFStringRef v6 = [v5 audioDeviceController];
  [v6 removeDelegate:self];

  id v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v7 callDisplayStyle] != (id)3)
  {

    goto LABEL_5;
  }
  id v8 = [(PHAudioCallViewController *)self features];
  unsigned __int8 v9 = [v8 isDominoEnabled];

  if ((v9 & 1) == 0) {
LABEL_5:
  }
    [(PHAudioCallViewController *)self deleteAllUnarchivedPosterDirectories];
  [(PHAudioCallViewController *)self stopTracking];
  id v10 = [(PHAudioCallViewController *)self features];
  unsigned int v11 = [v10 isEnhancedEmergencyEnabled];

  if (v11)
  {
    v12 = +[PHSOSDisconnectionConfirmation sharedInstance];
    [v12 removeDelegate:self];
  }
  v13 = sub_1000D5130();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController deallocated %@", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v14 dealloc];
}

- (void)loadView
{
  [(PHAudioCallViewController *)self setRootView];
  [(PHAudioCallViewController *)self setupAmbientAudioRoutesControlViewIfNeeded];
  [(PHAudioCallViewController *)self addCallParticipantsSubView];
  [(PHAudioCallViewController *)self addBottomBarSubView];
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHAudioCallViewController *)self view];
    int v5 = 138412290;
    CFStringRef v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view loaded: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setRootView
{
  BOOL v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = (id)[(PHAudioCallViewController *)self preferredInterfaceOrientationForPresentation] == (id)1;
  BOOL v13 = v11 < v9;
  if (v12 && v13) {
    double v14 = v9;
  }
  else {
    double v14 = v11;
  }
  if (v12 && v13) {
    double v9 = v11;
  }
  id v17 = [objc_alloc((Class)UIView) initWithFrame:v5, v7, v9, v14];
  [(PHAudioCallViewController *)self setView:v17];
  v15 = [v17 layer];
  [v15 setAllowsGroupBlending:0];

  v16 = [v17 layer];
  [v16 setAllowsGroupOpacity:0];

  [v17 setAutoresizingMask:18];
}

- (void)addBottomBarSubView
{
  BOOL v3 = [PHBottomBar alloc];
  double v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  double v5 = [(PHBottomBar *)v3 initWithCallDisplayStyleManager:v4];
  [(PHCallViewController *)self setBottomBar:v5];

  double v6 = +[UIColor clearColor];
  double v7 = [(PHCallViewController *)self bottomBar];
  [v7 setBackgroundColor:v6];

  double v8 = [(PHCallViewController *)self bottomBar];
  [v8 setDelegate:self];

  double v9 = objc_opt_class();
  double v10 = [(PHAudioCallViewController *)self view];
  [v9 _bottomBarBottomMarginForView:v10];
  double v12 = v11;
  BOOL v13 = [(PHCallViewController *)self bottomBar];
  [v13 setBottomMargin:v12];

  double v14 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  id v15 = [v14 callDisplayStyle];

  if (!v15)
  {
    v16 = [(PHCallViewController *)self bottomBar];
    [v16 setAlpha:0.0];
  }
  [(PHAudioCallViewController *)self updateHardPauseDigitsState];
  id v17 = [(PHAudioCallViewController *)self view];
  v18 = [(PHCallViewController *)self bottomBar];
  [v17 addSubview:v18];

  [(PHAudioCallViewController *)self constrainBottomBar];
  uint64_t v19 = [(PHCallViewController *)self bottomBar];
  [v19 setCurrentState:11];

  objc_initWeak(&location, self);
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  uint64_t v27 = sub_1000D8E0C;
  v28 = &unk_1002CED28;
  objc_copyWeak(&v29, &location);
  v20 = objc_retainBlock(&v25);
  ((void (*)(void ***, uint64_t, uint64_t, uint64_t))v20[2])(v20, v21, v22, v23);
  v24 = [(PHCallViewController *)self bottomBar];
  [v24 setStatusChangedHandler:v20];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)constrainBottomBar
{
  BOOL v3 = [(PHCallViewController *)self bottomBar];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(PHAudioCallViewController *)self constrainBottomBarBottom];
  double v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v4 callDisplayStyle] == (id)3)
  {
    double v5 = [(PHAudioCallViewController *)self features];
    unsigned int v6 = [v5 isDominoEnabled];

    if (v6)
    {
      double v7 = [(PHCallViewController *)self bottomBar];
      double v8 = [v7 topAnchor];
      double v9 = [(PHAudioCallViewController *)self trailingSideLayoutGuide];
      v40 = [v9 bottomAnchor];
      v39 = [v8 constraintGreaterThanOrEqualToAnchor:v40 constant:11.0];
      v42[0] = v39;
      v38 = [(PHCallViewController *)self bottomBar];
      v36 = [v38 trailingAnchor];
      uint64_t v37 = [(PHAudioCallViewController *)self safeAreaLayoutGuide];
      v35 = [v37 trailingAnchor];
      +[PHUIConfiguration ambientHorizontalPadding];
      v34 = [v36 constraintEqualToAnchor:v35 constant:-v10];
      v42[1] = v34;
      uint64_t v33 = [(PHCallViewController *)self bottomBar];
      v32 = [v33 widthAnchor];
      +[PHBottomBar ambientWidth];
      v31 = [v32 constraintEqualToConstant:];
      v42[2] = v31;
      v30 = [(PHCallViewController *)self bottomBar];
      v28 = [v30 leadingAnchor];
      id v29 = [(PHAudioCallViewController *)self trailingSideLayoutGuide];
      uint64_t v27 = [v29 leadingAnchor];
      double v11 = [v28 constraintEqualToAnchor:v27];
      v42[3] = v11;
      double v12 = [(PHCallViewController *)self bottomBar];
      BOOL v13 = [v12 trailingAnchor];
      double v14 = [(PHAudioCallViewController *)self trailingSideLayoutGuide];
      id v15 = [v14 trailingAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];
      v42[4] = v16;
      id v17 = +[NSArray arrayWithObjects:v42 count:5];
      +[NSLayoutConstraint activateConstraints:v17];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v18 = [(PHCallViewController *)self bottomBar];
  uint64_t v19 = [v18 centerXAnchor];
  v20 = [(PHAudioCallViewController *)self view];
  uint64_t v21 = [v20 centerXAnchor];
  double v7 = [v19 constraintEqualToAnchor:v21];

  uint64_t v22 = [(PHAudioCallViewController *)self features];
  LODWORD(v21) = [v22 isButtonLayoutEnabled];

  uint64_t v23 = [(PHCallViewController *)self bottomBar];
  v24 = [v23 widthAnchor];
  if (v21)
  {
    uint64_t v25 = [(PHAudioCallViewController *)self view];
    [v25 frame];
    double v8 = [v24 constraintEqualToConstant:v26];
  }
  else
  {
    +[PHBottomBar defaultWidth];
    double v8 = [v24 constraintEqualToConstant:];
  }

  v41[0] = v7;
  v41[1] = v8;
  double v9 = +[NSArray arrayWithObjects:v41 count:2];
  +[NSLayoutConstraint activateConstraints:v9];
LABEL_9:
}

- (void)addCallParticipantsSubView
{
  if (!self->_callParticipantsViewController)
  {
    BOOL v3 = [PHCallParticipantsViewController alloc];
    double v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    double v5 = [(PHAudioCallViewController *)self contactsCache];
    unsigned int v6 = [(PHCallParticipantsViewController *)v3 initWithCallDisplayStyleManager:v4 contactsCache:v5];
    callParticipantsViewController = self->_callParticipantsViewController;
    self->_callParticipantsViewController = v6;

    double v8 = [(PHAudioCallViewController *)self prioritizedCall];
    [(PHCallParticipantsViewController *)self->_callParticipantsViewController setPrioritizedCall:v8];

    [(PHCallParticipantsViewController *)self->_callParticipantsViewController setDelegate:self];
    [(PHCallParticipantsViewController *)self->_callParticipantsViewController setShouldIgnoreUpdates:[(PHAudioCallViewController *)self participantsViewControllersShouldIgnoreUpdates]];
    [(PHAudioCallViewController *)self updateShouldShowLargeAvatar];
    [(PHAudioCallViewController *)self addChildViewController:self->_callParticipantsViewController];
    double v9 = [(PHAudioCallViewController *)self view];
    double v10 = [(PHCallParticipantsViewController *)self->_callParticipantsViewController view];
    [v9 addSubview:v10];

    [(PHAudioCallViewController *)self setUpLayoutGuidesForParticipantsViewController:self->_callParticipantsViewController];
    [(PHAudioCallViewController *)self applyParticipantsViewConstraints];
  }
}

- (void)layoutParticipantsViewAnimated:(BOOL)a3
{
}

- (void)layoutParticipantsViewAnimated:(BOOL)a3 crossfade:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(PHAudioCallViewController *)self shouldShowLargeAvatar];
  [(PHAudioCallViewController *)self updateShouldShowLargeAvatar];
  unsigned int v8 = [(PHAudioCallViewController *)self shouldShowLargeAvatar];
  if (v5)
  {
    if (v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000D96DC;
      v14[3] = &unk_1002CD518;
      v14[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000D974C;
      v13[3] = &unk_1002CD540;
      v13[4] = self;
      +[UIView animateWithDuration:v14 animations:v13 completion:0.400000006];
    }
    else
    {
      int v9 = v7 ^ v8;
      if (v9)
      {
        double v10 = [(PHAudioCallViewController *)self view];
        [v10 layoutIfNeeded];
      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000D9868;
      v11[3] = &unk_1002CD918;
      char v12 = v9;
      v11[4] = self;
      +[UIView animateWithDuration:0 delay:v11 usingSpringWithDamping:&stru_1002D0608 initialSpringVelocity:0.800000012 options:0.0 animations:1.0 completion:0.0];
    }
  }
  else
  {
    [(PHAudioCallViewController *)self resetParticipantsViewConstraints];
  }
}

- (void)resetParticipantsViewConstraints
{
  [(PHAudioCallViewController *)self removeAllParticipantsViewConstraints];
  [(PHAudioCallViewController *)self applyParticipantsViewConstraints];

  [(PHAudioCallViewController *)self copyCallWaitingConstraintsFromParticipantsView];
}

- (void)removeAllParticipantsViewConstraints
{
  id v15 = +[NSMutableArray array];
  BOOL v3 = [(PHAudioCallViewController *)self participantsViewTopConstraint];

  if (v3)
  {
    BOOL v4 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
    [v15 addObject:v4];
  }
  BOOL v5 = [(PHAudioCallViewController *)self participantsViewLeadingConstraint];

  if (v5)
  {
    unsigned int v6 = [(PHAudioCallViewController *)self participantsViewLeadingConstraint];
    [v15 addObject:v6];
  }
  unsigned int v7 = [(PHAudioCallViewController *)self participantsViewTrailingConstraint];

  if (v7)
  {
    unsigned int v8 = [(PHAudioCallViewController *)self participantsViewTrailingConstraint];
    [v15 addObject:v8];
  }
  int v9 = [(PHAudioCallViewController *)self participantsViewCenterXConstraint];

  if (v9)
  {
    double v10 = [(PHAudioCallViewController *)self participantsViewCenterXConstraint];
    [v15 addObject:v10];
  }
  double v11 = [(PHAudioCallViewController *)self participantsViewBottomConstraint];

  if (v11)
  {
    char v12 = [(PHAudioCallViewController *)self participantsViewBottomConstraint];
    [v15 addObject:v12];
  }
  BOOL v13 = [(PHAudioCallViewController *)self participantsViewCenterYConstraint];

  if (v13)
  {
    double v14 = [(PHAudioCallViewController *)self participantsViewCenterYConstraint];
    [v15 addObject:v14];
  }
  +[NSLayoutConstraint deactivateConstraints:v15];
}

- (void)applyParticipantsViewConstraints
{
  BOOL v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  id v4 = [v3 callDisplayStyle];

  switch((unint64_t)v4)
  {
    case 0uLL:
      [(PHAudioCallViewController *)self applyParticipantsViewConstraintsForBanner];
      break;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      [(PHAudioCallViewController *)self applyParticipantsViewConstraintsForFullScreen];
      break;
    case 3uLL:
      [(PHAudioCallViewController *)self applyParticipantsViewConstraintsForAmbient];
      break;
    default:
      return;
  }
}

- (void)applyParticipantsViewConstraintsForFullScreen
{
  BOOL v3 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  if (v3)
  {
    id v4 = [(PHAudioCallViewController *)self viewIfLoaded];

    if (v4)
    {
      [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHAudioCallViewController *)self setParticipantsViewCenterYConstraint:0];
      BOOL v5 = [v3 topAnchor];
      unsigned int v6 = [(PHAudioCallViewController *)self view];
      unsigned int v7 = [v6 safeAreaLayoutGuide];
      unsigned int v8 = [v7 topAnchor];
      +[TPIncomingCallMetricsProvider sixPercentOfDeviceHeight];
      int v9 = [v5 constraintEqualToAnchor:v8];
      [(PHAudioCallViewController *)self setParticipantsViewTopConstraint:v9];

      double v10 = [v3 centerXAnchor];
      double v11 = [(PHAudioCallViewController *)self view];
      char v12 = [v11 centerXAnchor];
      BOOL v13 = [v10 constraintEqualToAnchor:v12];
      [(PHAudioCallViewController *)self setParticipantsViewCenterXConstraint:v13];

      double v14 = [v3 leadingAnchor];
      id v15 = [(PHAudioCallViewController *)self view];
      v16 = [v15 readableContentGuide];
      id v17 = [v16 leadingAnchor];
      v18 = [v14 constraintEqualToAnchor:v17];
      [(PHAudioCallViewController *)self setParticipantsViewLeadingConstraint:v18];

      uint64_t v19 = [v3 trailingAnchor];
      v20 = [(PHAudioCallViewController *)self view];
      uint64_t v21 = [v20 readableContentGuide];
      uint64_t v22 = [v21 trailingAnchor];
      uint64_t v23 = [v19 constraintEqualToAnchor:v22];
      [(PHAudioCallViewController *)self setParticipantsViewTrailingConstraint:v23];

      v24 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
      v29[0] = v24;
      uint64_t v25 = [(PHAudioCallViewController *)self participantsViewCenterXConstraint];
      v29[1] = v25;
      double v26 = [(PHAudioCallViewController *)self participantsViewLeadingConstraint];
      v29[2] = v26;
      uint64_t v27 = [(PHAudioCallViewController *)self participantsViewTrailingConstraint];
      v29[3] = v27;
      v28 = +[NSArray arrayWithObjects:v29 count:4];
      +[NSLayoutConstraint activateConstraints:v28];
    }
  }
}

- (id)ambientParticipantsViewConstraintsForView:(id)a3 largeAvatar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  +[PHUIConfiguration ambientVerticalPadding];
  double v9 = v8;
  +[PHUIConfiguration ambientHorizontalPadding];
  double v11 = v10;
  if (v4)
  {
    char v12 = [v6 bottomAnchor];
    BOOL v13 = [(PHAudioCallViewController *)self view];
    double v14 = [v13 bottomAnchor];
    id v15 = [v12 constraintEqualToAnchor:v14 constant:-v9];
    [v7 setObject:v15 forKeyedSubscript:&off_1002DF0C0];

    v16 = [v6 trailingAnchor];
    id v17 = [(PHAudioCallViewController *)self view];
    v18 = [v17 safeAreaLayoutGuide];
    uint64_t v19 = [v18 trailingAnchor];
    v20 = [v16 constraintEqualToAnchor:v19 constant:-v11];
    [v7 setObject:v20 forKeyedSubscript:&off_1002DF0D8];
  }
  else
  {
    v16 = [v6 trailingAnchor];
    id v17 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
    v18 = [v17 leadingAnchor];
    uint64_t v19 = [v16 constraintEqualToAnchor:v18 constant:-20.0];
    [v7 setObject:v19 forKeyedSubscript:&off_1002DF0D8];
  }

  uint64_t v21 = [v6 topAnchor];
  uint64_t v22 = [(PHAudioCallViewController *)self view];
  uint64_t v23 = [v22 topAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:v9];
  [v7 setObject:v24 forKeyedSubscript:&off_1002DF0F0];

  uint64_t v25 = [v6 leadingAnchor];
  double v26 = [(PHAudioCallViewController *)self view];
  uint64_t v27 = [v26 safeAreaLayoutGuide];
  v28 = [v27 leadingAnchor];
  id v29 = [v25 constraintEqualToAnchor:v28 constant:v11];
  [v7 setObject:v29 forKeyedSubscript:&off_1002DF108];

  return v7;
}

- (void)applyParticipantsViewConstraintsForAmbient
{
  BOOL v3 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v5 = [(PHAudioCallViewController *)self ambientParticipantsViewConstraintsForView:v4 largeAvatar:[(PHAudioCallViewController *)self shouldShowLargeAvatar]];
    [(PHAudioCallViewController *)self setParticipantsViewCenterXConstraint:0];
    [(PHAudioCallViewController *)self setParticipantsViewCenterYConstraint:0];
    id v6 = [v5 objectForKeyedSubscript:&off_1002DF0F0];
    [(PHAudioCallViewController *)self setParticipantsViewTopConstraint:v6];

    id v7 = [v5 objectForKeyedSubscript:&off_1002DF0C0];
    [(PHAudioCallViewController *)self setParticipantsViewBottomConstraint:v7];

    double v8 = [v5 objectForKeyedSubscript:&off_1002DF108];
    [(PHAudioCallViewController *)self setParticipantsViewLeadingConstraint:v8];

    double v9 = [v5 objectForKeyedSubscript:&off_1002DF0D8];
    [(PHAudioCallViewController *)self setParticipantsViewTrailingConstraint:v9];

    double v10 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
    double v11 = [(PHAudioCallViewController *)self participantsViewLeadingConstraint];
    v16[1] = v11;
    char v12 = [(PHAudioCallViewController *)self participantsViewTrailingConstraint];
    v16[2] = v12;
    BOOL v13 = +[NSArray arrayWithObjects:v16 count:3];
    +[NSLayoutConstraint activateConstraints:v13];

    double v14 = [(PHAudioCallViewController *)self participantsViewBottomConstraint];

    if (v14)
    {
      id v15 = [(PHAudioCallViewController *)self participantsViewBottomConstraint];
      [v15 setActive:1];
    }
  }
}

- (void)applyParticipantsViewConstraintsForBanner
{
  BOOL v3 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PHAudioCallViewController *)self setParticipantsViewCenterXConstraint:0];
    BOOL v5 = [v4 centerYAnchor];
    id v6 = [(PHAudioCallViewController *)self view];
    id v7 = [v6 centerYAnchor];
    double v8 = [v5 constraintEqualToAnchor:v7];
    [(PHAudioCallViewController *)self setParticipantsViewCenterYConstraint:v8];

    double v9 = [v4 topAnchor];
    double v10 = [(PHAudioCallViewController *)self view];
    double v11 = [v10 topAnchor];
    char v12 = [v9 constraintGreaterThanOrEqualToAnchor:v11];
    [(PHAudioCallViewController *)self setParticipantsViewTopConstraint:v12];

    BOOL v13 = [v4 bottomAnchor];
    double v14 = [(PHAudioCallViewController *)self view];
    id v15 = [v14 bottomAnchor];
    v16 = [v13 constraintLessThanOrEqualToAnchor:v15];
    [(PHAudioCallViewController *)self setParticipantsViewBottomConstraint:v16];

    id v17 = [v4 leadingAnchor];
    v18 = [(PHAudioCallViewController *)self view];
    uint64_t v19 = [v18 leadingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [(PHAudioCallViewController *)self setParticipantsViewLeadingConstraint:v20];

    uint64_t v21 = [v4 trailingAnchor];
    uint64_t v22 = [(PHAudioCallViewController *)self view];
    uint64_t v23 = [v22 trailingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    [(PHAudioCallViewController *)self setParticipantsViewTrailingConstraint:v24];

    uint64_t v25 = [(PHAudioCallViewController *)self participantsViewCenterYConstraint];
    double v26 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
    v31[1] = v26;
    uint64_t v27 = [(PHAudioCallViewController *)self participantsViewBottomConstraint];
    v31[2] = v27;
    v28 = [(PHAudioCallViewController *)self participantsViewLeadingConstraint];
    v31[3] = v28;
    id v29 = [(PHAudioCallViewController *)self participantsViewTrailingConstraint];
    v31[4] = v29;
    v30 = +[NSArray arrayWithObjects:v31 count:5];
    +[NSLayoutConstraint activateConstraints:v30];
  }
}

- (void)setUpLayoutGuidesForParticipantsViewController:(id)a3
{
  id v28 = a3;
  BOOL v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v4 callDisplayStyle] == (id)3)
  {
    BOOL v5 = [(PHAudioCallViewController *)self features];
    unsigned int v6 = [v5 isDominoEnabled];

    if (!v6) {
      goto LABEL_8;
    }
    BOOL v4 = [v28 view];
    if (!self->_leadingSideLayoutGuide && !self->_trailingSideLayoutGuide)
    {
      id v7 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
      leadingSideLayoutGuide = self->_leadingSideLayoutGuide;
      self->_leadingSideLayoutGuide = v7;

      double v9 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
      trailingSideLayoutGuide = self->_trailingSideLayoutGuide;
      self->_trailingSideLayoutGuide = v9;

      double v11 = [(PHAudioCallViewController *)self view];
      char v12 = [(PHAudioCallViewController *)self leadingSideLayoutGuide];
      [v11 addLayoutGuide:v12];

      BOOL v13 = [(PHAudioCallViewController *)self view];
      double v14 = [(PHAudioCallViewController *)self trailingSideLayoutGuide];
      [v13 addLayoutGuide:v14];

      id v15 = [(PHAudioCallViewController *)self leadingSideLayoutGuide];
      v16 = [v15 leadingAnchor];
      id v17 = [(PHAudioCallViewController *)self view];
      v18 = [v17 safeAreaLayoutGuide];
      uint64_t v19 = [v18 leadingAnchor];
      v20 = [v16 constraintEqualToAnchor:v19];
      [v20 setActive:1];

      uint64_t v21 = [(PHAudioCallViewController *)self leadingSideLayoutGuide];
      uint64_t v22 = [v21 trailingAnchor];
      uint64_t v23 = [(PHAudioCallViewController *)self view];
      v24 = [v23 centerXAnchor];
      uint64_t v25 = [v22 constraintEqualToAnchor:v24];
      [v25 setActive:1];
    }
    double v26 = [(PHAudioCallViewController *)self leadingSideLayoutGuide];
    [v4 setLeadingSideLayoutGuide:v26];

    uint64_t v27 = [(PHAudioCallViewController *)self trailingSideLayoutGuide];
    [v4 setTrailingSideLayoutGuide:v27];
  }
LABEL_8:
}

- (void)updateScreenSharingDisableUpdateMask
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v3 = [(PHAudioCallViewController *)self callCenter];
  BOOL v4 = [v3 currentAudioAndVideoCalls];

  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * i) isSharingScreen])
        {
          unsigned int v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned int v9 = 0;
LABEL_11:

  double v10 = [(PHAudioCallViewController *)self screenSharingInteractionControllerFactory];
  double v11 = [v10 sharedController];
  id v12 = [v11 remoteControlStatus];

  if (v12 == (id)2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v9;
  }
  double v14 = sub_1000D5360();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"NO";
    if (v13) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    if (v9) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    CFStringRef v27 = v16;
    __int16 v28 = 2114;
    CFStringRef v29 = v17;
    if (v12 == (id)2) {
      CFStringRef v15 = @"YES";
    }
    __int16 v30 = 2114;
    CFStringRef v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Screen sharing audio call view controller shouldHideViewsFromScreenSharing: %{public}@ (isSharingScreenForAnyCall: %{public}@ isUnderRemoteControl: %{public}@)", buf, 0x20u);
  }
  if (v13) {
    uint64_t v18 = 16;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [(PHAudioCallViewController *)self view];
  v20 = [v19 layer];
  [v20 setDisableUpdateMask:v18];

  uint64_t v21 = [(PHAudioCallViewController *)self callDetailsCoordinator];
  [v21 setShouldHideViewsFromScreenSharing:v13];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v3 viewDidLoad];
  [(PHAudioCallViewController *)self updateCurrentState];
  [(PHAudioCallViewController *)self startTracking];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view will appear.", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v6 viewWillAppear:v3];
  [(PHAudioCallViewController *)self handleViewWillAppear:v3];
}

- (void)handleViewWillAppear:(BOOL)a3
{
  [(PHAudioCallViewController *)self setParticipantsViewControllersShouldIgnoreUpdates:0];
  [(PHAudioCallViewController *)self updateCurrentState];
  [(PHAudioCallViewController *)self updateScreenSharingDisableUpdateMask];
  id v8 = [(PHAudioCallViewController *)self features];
  if ([v8 isEnhancedEmergencyEnabled])
  {
    uint64_t v4 = [(PHAudioCallViewController *)self emergencyCoordinator];
    if (v4)
    {
      id v5 = (void *)v4;
      objc_super v6 = [(PHAudioCallViewController *)self emergencyCoordinator];
      id v7 = [v6 eedRTTState];

      if (v7 != (id)4) {
        return;
      }
      id v8 = [(PHAudioCallViewController *)self emergencyCoordinator];
      [v8 transitionToRTTState:2];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view did appear.", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v6 viewDidAppear:v3];
  [(PHAudioCallViewController *)self handleViewDidAppear:v3];
}

- (void)handleViewDidAppear:(BOOL)a3
{
  double v4 = 0.300000012;
  if (!a3) {
    double v4 = 0.0;
  }
  [(PHCallViewController *)self setStatusBarHidden:0 withDuration:v4];
  id v16 = [(PHAudioCallViewController *)self frontmostCall];
  id v5 = [v16 provider];
  if ([v5 isFaceTimeProvider])
  {
    unsigned __int8 v6 = [v16 isVideo];

    if (v6) {
      goto LABEL_7;
    }
    id v5 = +[CUTWiFiManager sharedInstance];
    [v5 addWiFiAutoAssociationClientToken:@"PHFaceTimeAudioWiFiAssertionKey"];
  }

LABEL_7:
  id v7 = [(PHAudioCallViewController *)self callCenter];
  [v7 enteredForegroundForCall:v16];

  id v8 = +[UIApplication sharedApplication];
  unsigned int v9 = [v8 delegate];
  double v10 = [v9 alertCoordinator];
  unsigned int v11 = [v10 isMonitoring];

  id v12 = +[UIApplication sharedApplication];
  uint64_t v13 = [v12 delegate];
  double v14 = [v13 alertCoordinator];
  CFStringRef v15 = v14;
  if (v11) {
    [v14 refreshDelegateWithState];
  }
  else {
    [v14 startMonitoring];
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v8 viewDidLayoutSubviews];
  uint64_t v3 = [(PHAudioCallViewController *)self callParticipantsViewController];
  if (v3)
  {
    double v4 = (void *)v3;
    unsigned int v5 = [(PHAudioCallViewController *)self canDumpHierarchy];

    if (v5)
    {
      unsigned __int8 v6 = [(PHAudioCallViewController *)self callParticipantsViewController];
      id v7 = [v6 view];
      +[ICSViewEvaluation processHierarchy:v7];

      [(PHAudioCallViewController *)self setCanDumpHierarchy:0];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view will disappear.", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v6 viewWillDisappear:v3];
  [(PHAudioCallViewController *)self handleViewWillDisappear:v3];
}

- (void)handleViewWillDisappear:(BOOL)a3
{
  id v3 = +[CUTWiFiManager sharedInstance];
  [v3 removeWiFiAutoAssociationClientToken:@"PHFaceTimeAudioWiFiAssertionKey"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view did disappear.", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallViewController;
  [(PHCallViewController *)&v6 viewDidDisappear:v3];
  [(PHAudioCallViewController *)self handleViewDidDisappear:v3];
  [(PHAudioCallViewController *)self setCanDumpHierarchy:1];
}

- (void)handleViewDidDisappear:(BOOL)a3
{
  double v4 = [(PHAudioCallViewController *)self callCenter];
  [v4 enteredBackgroundForAllCalls];

  [(PHAudioCallViewController *)self suspendPosterAndCancelDelay:1];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  id v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view did move to window %@, shouldAppearOrDisappear %d", buf, 0x12u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v38.receiver = self;
  v38.super_class = (Class)PHAudioCallViewController;
  id v4 = a3;
  [(PHAudioCallViewController *)&v38 traitCollectionDidChange:v4];
  id v5 = [v4 _backlightLuminance];

  id v6 = [(PHAudioCallViewController *)self traitCollection];
  id v7 = [v6 _backlightLuminance];

  if (v5 != v7)
  {
    objc_super v8 = [(PHAudioCallViewController *)self traitCollection];
    id v9 = [v8 _backlightLuminance];

    id v10 = [(PHAudioCallViewController *)self traitCollection];
    id v11 = [v10 _backlightLuminance];

    if (!v11)
    {
      BOOL v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Got trait collection callback saying display was off", v37, 2u);
      }

      [(PHAudioCallViewController *)self suspendPosterAndCancelDelay:1];
    }
    if (v9 != (id)1)
    {
      __int16 v28 = [(PHAudioCallViewController *)self alwaysOnDisplayDimmingView];
      [v28 setAlpha:0.0];

      uint64_t v29 = [(PHAudioCallViewController *)self renderingViewController];
      if (!v29) {
        goto LABEL_24;
      }
      __int16 v30 = (void *)v29;
      unsigned int v31 = [(PHAudioCallViewController *)self canShowPosterImage];

      if (!v31) {
        goto LABEL_24;
      }
      v32 = [(PHAudioCallViewController *)self renderingViewController];
      uint64_t v33 = [v32 view];
      [v33 setAlpha:1.0];

      goto LABEL_23;
    }
    uint64_t v13 = [(PHAudioCallViewController *)self view];
    double v14 = [(PHAudioCallViewController *)self alwaysOnDisplayDimmingView];
    [v13 bringSubviewToFront:v14];

    CFStringRef v15 = [(PHAudioCallViewController *)self view];
    id v16 = [(PHAudioCallViewController *)self callParticipantsViewController];
    CFStringRef v17 = [v16 view];
    [v15 bringSubviewToFront:v17];

    uint64_t v18 = [(PHAudioCallViewController *)self alwaysOnDisplayDimmingView];
    [v18 setAlpha:1.0];

    uint64_t v19 = [(PHAudioCallViewController *)self renderingViewController];

    if (v19)
    {
      v20 = [(PHAudioCallViewController *)self renderingViewController];
      uint64_t v21 = [v20 view];
      [v21 setAlpha:0.0];
    }
    long long v22 = [(PHAudioCallViewController *)self alwaysOnDisplayPosterNameViewModel];

    if (!v22)
    {
LABEL_19:
      if (![(PHAudioCallViewController *)self videoStreamingIsGoingOn]) {
        goto LABEL_24;
      }
      v34 = sub_1000D5130();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: pause video if necessary when going to AOD", v37, 2u);
      }

      v32 = [(PHAudioCallViewController *)self emergencyCoordinator];
      [v32 handleDeviceLockEvent];
LABEL_23:

LABEL_24:
      v35 = [(PHAudioCallViewController *)self stateDisplayChangedObservation];

      if (v35)
      {
        v36 = [(PHAudioCallViewController *)self stateDisplayChangedObservation];
        v36[2]();
      }
      return;
    }
    long long v23 = +[TUCallCenter sharedInstance];
    if ((unint64_t)[v23 currentCallCount] < 2)
    {
    }
    else
    {
      unsigned __int8 v24 = [(PHAudioCallViewController *)self usesCompactMulticallUI];

      if ((v24 & 1) == 0)
      {
        long long v25 = [(PHAudioCallViewController *)self alwaysOnDisplayPosterNameViewModel];
        double v26 = v25;
        double v27 = 0.0;
LABEL_18:
        [v25 updatePosterNameAlpha:v27];

        goto LABEL_19;
      }
    }
    long long v25 = [(PHAudioCallViewController *)self alwaysOnDisplayPosterNameViewModel];
    double v26 = v25;
    double v27 = 1.0;
    goto LABEL_18;
  }
}

- (BOOL)needsDismissalAssertion
{
  v2 = [(PHAudioCallViewController *)self callCenter];
  unsigned __int8 v3 = [v2 hasCurrentAudioCalls];

  return v3;
}

+ (id)dismissalAssertionReason
{
  return @"PHAudioCallViewControllerDismissalAssertionHandlingActiveCall";
}

- (void)releaseDismissalAssertion
{
  v2.receiver = self;
  v2.super_class = (Class)PHAudioCallViewController;
  [(PHCallViewController *)&v2 releaseDismissalAssertion];
  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"];
}

- (void)callIsEmergencyChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (PHAudioCallViewController *)objc_opt_class();
    id v7 = v6;
    objc_super v8 = [v4 name];
    int v14 = 138412546;
    CFStringRef v15 = v6;
    __int16 v16 = 2112;
    CFStringRef v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [v4 object];
  if (v9)
  {
    if ([(PHAudioCallViewController *)self shouldUpdateBackgroundForEmergencyCall])
    {
      [(PHAudioCallViewController *)self updateViewForEmergencyCallIfNecessary];
      id v10 = [(PHAudioCallViewController *)self emergencyCoordinator];

      if (!v10)
      {
        id v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          CFStringRef v15 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: going to create PHEnhancedEmergencyCoordinator from callIsEmergencyChangedNotification from PHAudioCallViewController: %@", (uint8_t *)&v14, 0xCu);
        }

        BOOL v12 = objc_alloc_init(PHEnhancedEmergencyCoordinator);
        [(PHAudioCallViewController *)self setEmergencyCoordinator:v12];

        uint64_t v13 = [(PHAudioCallViewController *)self emergencyCoordinator];
        [v13 setDelegate:self];
      }
    }
  }
}

- (void)updateViewForEmergencyCallIfNecessary
{
  unsigned __int8 v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: remove all the possile call UI because we are now in emergency call", v9, 2u);
  }

  id v4 = [(PHAudioCallViewController *)self renderingViewController];

  if (v4) {
    [(PHAudioCallViewController *)self removePosterViewController:1 completion:0];
  }
  id v5 = [(PHAudioCallViewController *)self backgroundImageView];

  if (v5) {
    [(PHAudioCallViewController *)self removeBackgroundContactImageView];
  }
  id v6 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];

  if (v6) {
    [(PHAudioCallViewController *)self removeDefaultBackgroundGradientView];
  }
  id v7 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];

  if (v7)
  {
    objc_super v8 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];
    [v8 removeFromSuperview];

    [(PHAudioCallViewController *)self setUnblurredBackgroundImageView:0];
  }
  [(PHAudioCallViewController *)self updateBackgroundForEmergencyCall];
  [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
}

- (void)wantsHoldMusicChangedNotification:(id)a3
{
  id v4 = [(PHAudioCallViewController *)self frontmostCall];
  unsigned int v5 = [v4 wantsHoldMusic];

  if (v5)
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "decline with reminder and decline with message unavailable due to call wanting hold music.", v9, 2u);
    }

    id v7 = [(PHCallViewController *)self bottomBar];
    [v7 setDeclineAndMessageIsAvailable:0];

    objc_super v8 = [(PHCallViewController *)self bottomBar];
    [v8 setDeclineAndRemindIsAvailable:0];
  }
}

- (void)callCenterScreeningStatusChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    objc_super v8 = [v4 name];
    int v11 = 138412546;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v11, 0x16u);
  }
  [(PHAudioCallViewController *)self updateCurrentState];
  id v9 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  id v10 = [v9 singleCallLabelView];
  [v10 updateLabelsOrderAndLayout];
}

- (void)callCenterCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (PHAudioCallViewController *)objc_opt_class();
    id v7 = v6;
    objc_super v8 = [v4 name];
    int v45 = 138412546;
    v46 = v6;
    __int16 v47 = 2112;
    v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v45, 0x16u);
  }
  id v9 = [v4 object];
  if (![(PHAudioCallViewController *)self usesCompactMulticallUI]) {
    goto LABEL_12;
  }
  id v10 = [(PHAudioCallViewController *)self prioritizedCall];
  uint64_t v11 = [v10 callUUID];
  if (!v11)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v12 = (void *)v11;
  __int16 v13 = [v9 callUUID];
  int v14 = [(PHAudioCallViewController *)self prioritizedCall];
  uint64_t v15 = [v14 callUUID];
  if (v13 == (void *)v15)
  {

    goto LABEL_11;
  }
  __int16 v16 = (void *)v15;
  unsigned __int8 v17 = [(PHAudioCallViewController *)self prioritizedCallIsInSameCallGroupAsCall:v9];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = sub_1000D5130();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "callCenterCallStatusChangedNotification - bail since we don't want to choose the call ourselves", (uint8_t *)&v45, 2u);
    }

    [(PHAudioCallViewController *)self refreshUseRTTButton];
    [(PHAudioCallViewController *)self _updatePosterStatusLabelForState:[(PHCallViewController *)self currentState]];
    goto LABEL_46;
  }
LABEL_12:
  if ([v9 status] == 1)
  {
    uint64_t v19 = [(PHAudioCallViewController *)self features];
    if (![v19 isEnhancedEmergencyEnabled])
    {
LABEL_20:

      goto LABEL_21;
    }
    v20 = [(PHAudioCallViewController *)self emergencyCoordinator];
    if (v20)
    {

      goto LABEL_20;
    }
    unsigned int v21 = [v9 isEmergency];

    if (v21)
    {
      long long v22 = sub_1000D5130();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = 138412290;
        v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: going to create PHEnhancedEmergencyCoordinator when call is active from PHAudioCallViewController: %@", (uint8_t *)&v45, 0xCu);
      }

      long long v23 = objc_alloc_init(PHEnhancedEmergencyCoordinator);
      [(PHAudioCallViewController *)self setEmergencyCoordinator:v23];

      uint64_t v19 = [(PHAudioCallViewController *)self emergencyCoordinator];
      [v19 setDelegate:self];
      goto LABEL_20;
    }
  }
LABEL_21:
  if ([v9 status] == 6)
  {
    unsigned __int8 v24 = +[UIApplication sharedApplication];
    long long v25 = [v24 delegate];
    [v25 setMostRecentlyDisconnectedAudioCall:v9];

    double v26 = [(PHAudioCallViewController *)self frontmostCall];
    if (([v9 isVideo] & 1) == 0
      && [v9 disconnectedReason] == 6)
    {
      if (v26)
      {
        double v27 = [(PHCallViewController *)self bottomBar];
        id v28 = [v27 currentState];

        if (v28 == (id)7)
        {
          uint64_t v29 = [(PHAudioCallViewController *)self analyticsReporter];
          [v29 reportMultipleCallsWaitingUIAction:0];
        }
      }
    }
    [(PHAudioCallViewController *)self writeToLastSeenPosterCacheIfNecessaryForCall:v9];
    __int16 v30 = [(PHAudioCallViewController *)self features];
    if (([v30 isEnhancedEmergencyEnabled] & 1) != 0
      && ([(PHAudioCallViewController *)self emergencyCoordinator],
          (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v32 = (void *)v31;
      unsigned int v33 = [v9 isEmergency];

      if (v33)
      {
        v34 = sub_1000D5130();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [(PHAudioCallViewController *)self emergencyCoordinator];
          int v45 = 138412290;
          v46 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: clean emergencyCoordinator: %@", (uint8_t *)&v45, 0xCu);
        }
        v36 = [(PHAudioCallViewController *)self emergencyCoordinator];
        [v36 cleanUpViewAndObjectWhenCallEnds];

        [(PHAudioCallViewController *)self setEmergencyCoordinator:0];
      }
    }
    else
    {
    }
  }
  uint64_t v37 = [(PHAudioCallViewController *)self emergencyCoordinator];

  if (v37)
  {
    objc_super v38 = [(PHAudioCallViewController *)self emergencyCoordinator];
    [v38 setTuCall:v9];
  }
  [(PHAudioCallViewController *)self updateViewsForHeldCallControlsViewIfNeeded];
  [(PHAudioCallViewController *)self updateCurrentState];
  [(PHAudioCallViewController *)self refreshUseRTTButton];
  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    v39 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    [(PHAudioCallViewController *)self setCallForBackgroundImage:v39 animated:1 callDisplayStyleChanged:0];
  }
  v40 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v41 = [v40 autoPunchOutBehaviorRequiredForCurrentCalls];

  if (v41)
  {
    v42 = sub_1000D5130();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Punch-out requested for current calls", (uint8_t *)&v45, 2u);
    }

    [(PHAudioCallViewController *)self setParticipantsViewControllersShouldIgnoreUpdates:1];
    [(PHCallViewController *)self punchOutToVoIPApplicationForCurrentCall];
  }
  else
  {
    v43 = [(PHAudioCallViewController *)self callCenter];
    unsigned int v44 = [v43 shouldActivateProviderInBackgroundForCall:v9];

    if (v44) {
      [(PHCallViewController *)self activateProviderInBackgroundForCall:v9];
    }
    else {
      [(PHAudioCallViewController *)self setParticipantsViewControllersShouldIgnoreUpdates:0];
    }
  }
LABEL_46:
}

- (void)conferenceParticipantCallsChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    objc_super v8 = [v4 name];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    BOOL v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallViewController *)self updateCurrentState];
}

- (void)callContinuityStateChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callContinuityStateChangedNotification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHAudioCallViewController *)self updateCurrentState];
}

- (void)hardPauseDigitsStateChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "hardPauseDigitsStateChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(PHCallViewController *)self bottomBar];
  [v6 refreshCustomizedActionTypeTitles];

  [(PHAudioCallViewController *)self updateHardPauseDigitsState];
  [(PHAudioCallViewController *)self refreshExtensionNumberButton];
}

- (void)callOnHoldChangedNotification:(id)a3
{
  id v3 = [(PHCallViewController *)self bottomBar];
  [v3 refreshEndCallButton];
}

- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    BOOL v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallViewController *)self refreshUseRTTButton];
}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v32 = 138412546;
    unsigned int v33 = v6;
    __int16 v34 = 2112;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v32, 0x16u);
  }
  [(PHAudioCallViewController *)self refreshUseRTTButton];
  int v9 = [(PHAudioCallViewController *)self features];
  if ([v9 isEnhancedEmergencyEnabled])
  {
    id v10 = [(PHAudioCallViewController *)self callCenter];
    __int16 v11 = [v10 frontmostCall];
    unsigned int v12 = [v11 isEmergency];

    if (!v12) {
      goto LABEL_7;
    }
    int v9 = [(PHAudioCallViewController *)self emergencyCoordinator];
    __int16 v13 = [(PHAudioCallViewController *)self callCenter];
    int v14 = [v13 frontmostCall];
    [v9 updateRTTEnabled:[v14 isRTT]];
  }
LABEL_7:
  uint64_t v15 = [(PHAudioCallViewController *)self featureFlags];
  int v16 = TUCallScreeningRTTEnabled();

  if (v16)
  {
    if ([(PHAudioCallViewController *)self middleViewState] == 4)
    {
      [(PHAudioCallViewController *)self setMiddleViewState:0];
      screeningViewController = self->_screeningViewController;
      self->_screeningViewController = 0;

      [(PHAudioCallViewController *)self setMiddleViewState:4];
    }
    uint64_t v18 = [(PHCallViewController *)self bottomBar];
    id v19 = [v18 currentState];

    if (v19 == (id)23)
    {
      v20 = [(PHCallViewController *)self bottomBar];
      [v20 setCurrentState:27];

      unsigned int v21 = [(PHCallViewController *)self bottomBar];
      [v21 setCurrentState:23];
    }
  }
  long long v22 = +[UIApplication sharedApplication];
  long long v23 = [v22 delegate];
  unsigned __int8 v24 = [v23 currentInCallScene];

  if (v24)
  {
    long long v25 = +[UIApplication sharedApplication];
    double v26 = [v25 delegate];
    double v27 = [v26 currentInCallScene];
    id v28 = [v27 delegate];
    uint64_t v29 = +[UIApplication sharedApplication];
    __int16 v30 = [v29 delegate];
    uint64_t v31 = [v30 currentInCallScene];
    [v28 updateSceneBackgroundMaterialWith:v31];
  }
}

- (void)callIsScreenSharingChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v4 name];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v8, 0x16u);
  }
  [(PHAudioCallViewController *)self updateScreenSharingDisableUpdateMask];
}

- (void)callKeypadDataSourceChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v4 name];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@, we are going to hide the name on keypad", (uint8_t *)&v8, 0x16u);
  }
  [(PHAudioCallViewController *)self hideFirstNameLabelOnKeypad];
  [(PHAudioCallViewController *)self setHasKeypadUpdated:1];
}

- (void)callDisplayContextChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v4 name];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    unsigned int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [v4 object];
  [(PHAudioCallViewController *)self updateBottomBarButtonsWithCall:v8];
}

- (void)refreshCallDetailsViewButton
{
  BOOL v3 = [(PHAudioCallViewController *)self shouldShowCallDetailsViewButton];

  [(PHAudioCallViewController *)self setShowsCallDetailsViewButton:v3];
}

- (void)setShowsCallDetailsViewButton:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHAudioCallViewController *)self callDetailsViewButton];
  uint64_t v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      [(PHAudioCallViewController *)self setUpCallDetailsViewButton];
    }
  }
  else
  {
    [v5 removeFromSuperview];

    [(PHAudioCallViewController *)self setCallDetailsViewButton:0];
  }
}

- (void)setUpCallDetailsViewButton
{
  BOOL v3 = +[UIButton buttonWithType:4];
  [(PHAudioCallViewController *)self setCallDetailsViewButton:v3];

  id v4 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v4 addTarget:self action:"callDetailsViewButtonTapped" forEvents:64];

  unsigned int v5 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v6 = [(PHAudioCallViewController *)self view];
  id v7 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v6 addSubview:v7];

  int v8 = +[UIColor whiteColor];
  int v9 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v9 setTintColor:v8];

  id v10 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [(PHAudioCallViewController *)self applyCallDetailsViewButtonPositionAndSizeCapToElement:v10];
}

- (double)callDetailsButtonPaddingTop
{
  +[TPIncomingCallMetricsProvider fullDeviceHeight];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTop_PERCENT];
  BOOL v3 = [(PHAudioCallViewController *)self view];
  UIRoundToViewScale();
  double v5 = v4;

  return v5;
}

- (double)callDetailsButtonPaddingTrailing
{
  +[TPIncomingCallMetricsProvider fullDeviceWidth];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTrailing_PERCENT];
  BOOL v3 = [(PHAudioCallViewController *)self view];
  UIRoundToViewScale();
  double v5 = v4;

  return v5;
}

- (double)callDetailsButtonPaddingTop_PERCENT
{
  if (+[TPIncomingCallMetricsProvider deviceHasHomeButton])
  {
    +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTopPercent_HomeButton];
  }
  else
  {
    BOOL v3 = [(PHAudioCallViewController *)self features];
    unsigned int v4 = [v3 isSystemApertureEnabled];

    if (v4)
    {
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTopPercent_DynamicIsland];
    }
    else
    {
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTopPercent_Notch];
    }
  }
  return result;
}

- (double)callDetailsButtonPaddingTrailing_PERCENT
{
  if (+[TPIncomingCallMetricsProvider deviceHasHomeButton])
  {
    +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrailingPercent_HomeButton];
  }
  else
  {
    BOOL v3 = [(PHAudioCallViewController *)self features];
    unsigned int v4 = [v3 isSystemApertureEnabled];

    if (v4)
    {
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrailingPercent_DynamicIsland];
    }
    else
    {
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrailingPercent_Notch];
    }
  }
  return result;
}

- (void)applyBlockButtonPositionAndSizeCapToElement:(id)a3
{
  id v4 = a3;
  double v5 = [v4 topAnchor];
  uint64_t v6 = [(PHAudioCallViewController *)self view];
  id v7 = [v6 topAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTop];
  int v8 = [v5 constraintEqualToAnchor:v7];
  v15[0] = v8;
  int v9 = [v4 leadingAnchor];
  id v10 = [(PHAudioCallViewController *)self view];
  __int16 v11 = [v10 leadingAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTrailing];
  unsigned int v12 = [v9 constraintEqualToAnchor:v11];
  v15[1] = v12;
  __int16 v13 = +[NSArray arrayWithObjects:v15 count:2];
  +[NSLayoutConstraint activateConstraints:v13];

  int v14 = +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize];
  [v4 setMaximumContentSizeCategory:v14];
}

- (void)blockButtonTapped
{
  id v3 = [(PHAudioCallViewController *)self frontmostCall];
  [(PHAudioCallViewController *)self showBlockAlertForCall:v3];
}

- (void)setShowsBlockButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PHAudioCallViewController *)self blockButton];
  uint64_t v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      [(PHAudioCallViewController *)self setUpBlockButton];
    }
  }
  else
  {
    [v5 removeFromSuperview];

    [(PHAudioCallViewController *)self setBlockButton:0];
  }
}

- (void)setUpBlockButton
{
  id v11 = +[UIButton buttonWithType:1];
  BOOL v3 = +[UIButtonConfiguration filledButtonConfiguration];
  [v3 setCornerStyle:4];
  [v3 contentInsets];
  [v3 setContentInsets:];
  id v4 = +[UIColor secondarySystemFillColor];
  [v3 setBaseBackgroundColor:v4];

  double v5 = +[UIColor whiteColor];
  [v3 setBaseForegroundColor:v5];

  [v11 setConfiguration:v3];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_BLOCK" value:&stru_1002D6110 table:@"InCallService"];
  [v11 setTitle:v7 forState:0];

  [v11 addTarget:self action:"blockButtonTapped" forEvents:64];
  [(PHAudioCallViewController *)self setBlockButton:v11];
  int v8 = [(PHAudioCallViewController *)self view];
  int v9 = [(PHAudioCallViewController *)self blockButton];
  [v8 addSubview:v9];

  id v10 = [(PHAudioCallViewController *)self blockButton];
  [(PHAudioCallViewController *)self applyBlockButtonPositionAndSizeCapToElement:v10];
}

- (void)updateParticipantConstraintsForPosterName:(id)a3
{
  id v9 = a3;
  id v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  id v5 = [v4 callDisplayStyle];

  if (v5)
  {
    if (![(PHAudioCallViewController *)self participantsViewIsShowingMultipleLabel])
    {
      uint64_t v6 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
      if (v6)
      {
      }
      else if ([(PHAudioCallViewController *)self callHasContactPosterWithVerticalName])
      {
        [(PHAudioCallViewController *)self positionParticipantsViewStatusLabelToBeHorizontallyCenteredToInfoButton:v9];
        id v7 = [(PHAudioCallViewController *)self callDetailsViewButton];
        int v8 = +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize];
        [v7 setMaximumContentSizeCategory:v8];

        goto LABEL_8;
      }
    }
    [(PHAudioCallViewController *)self restoreParticipantsViewStatusLabelForFullScreen];
  }
LABEL_8:
}

- (void)restoreParticipantsViewStatusLabelForFullScreen
{
  uint64_t v3 = [(PHAudioCallViewController *)self participantsViewVerticalPosterNameTopConstraint];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(PHAudioCallViewController *)self participantsViewVerticalPosterNameTopConstraint];
    unsigned int v6 = [v5 isActive];

    if (v6)
    {
      id v7 = [(PHAudioCallViewController *)self participantsViewVerticalPosterNameTopConstraint];
      [v7 setActive:0];

      [(PHAudioCallViewController *)self setParticipantsViewVerticalPosterNameTopConstraint:0];
    }
  }
  uint64_t v8 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
    unsigned __int8 v11 = [v10 isActive];

    if ((v11 & 1) == 0)
    {
      id v12 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
      [v12 setActive:1];
    }
  }
}

- (void)positionParticipantsViewStatusLabelToBeHorizontallyCenteredToInfoButton:(id)a3
{
  id v4 = a3;
  id v16 = +[NSMutableArray array];
  id v5 = [(PHAudioCallViewController *)self participantsViewTopConstraint];

  if (v5)
  {
    unsigned int v6 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
    [v16 addObject:v6];
  }
  id v7 = [(PHAudioCallViewController *)self participantsViewCenterYConstraint];

  if (v7)
  {
    uint64_t v8 = [(PHAudioCallViewController *)self participantsViewCenterYConstraint];
    [v16 addObject:v8];
  }
  id v9 = [(PHAudioCallViewController *)self participantsViewVerticalPosterNameTopConstraint];

  if (v9)
  {
    id v10 = [(PHAudioCallViewController *)self participantsViewVerticalPosterNameTopConstraint];
    [v16 addObject:v10];
  }
  +[NSLayoutConstraint deactivateConstraints:v16];
  unsigned __int8 v11 = [v4 topAnchor];

  id v12 = [(PHAudioCallViewController *)self view];
  __int16 v13 = [v12 topAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTop];
  int v14 = [v11 constraintEqualToAnchor:v13];
  [(PHAudioCallViewController *)self setParticipantsViewVerticalPosterNameTopConstraint:v14];

  uint64_t v15 = [(PHAudioCallViewController *)self participantsViewVerticalPosterNameTopConstraint];
  [v15 setActive:1];
}

- (void)positionPosterBadgeToBeHorizontallyCenteredToInfoButton:(id)a3
{
  id v4 = a3;
  id v5 = [v4 leadingAnchor];
  unsigned int v6 = [(PHAudioCallViewController *)self view];
  id v7 = [v6 leadingAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTrailing];
  uint64_t v8 = [v5 constraintEqualToAnchor:v7];
  v15[0] = v8;
  id v9 = [v4 topAnchor];

  id v10 = [(PHAudioCallViewController *)self view];
  unsigned __int8 v11 = [v10 topAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTop];
  __int16 v13 = [v9 constraintEqualToAnchor:v11 constant:v12 + 6.0];
  v15[1] = v13;
  int v14 = +[NSArray arrayWithObjects:v15 count:2];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)applySizeToElement:(id)a3 usingThisElementAsGuide:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 widthAnchor];
    uint64_t v8 = [v6 widthAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
    v16[0] = v9;
    id v10 = [v5 heightAnchor];
    unsigned __int8 v11 = [v6 heightAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11 constant:0.0];
    v16[1] = v12;
    __int16 v13 = +[NSArray arrayWithObjects:v16 count:2];
    +[NSLayoutConstraint activateConstraints:v13];

    int v14 = [v6 maximumContentSizeCategory];

    if (v14)
    {
      uint64_t v15 = [v6 maximumContentSizeCategory];
      [v5 setMaximumContentSizeCategory:v15];
    }
  }
}

- (void)applyCallDetailsViewButtonPositionAndSizeCapToElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 topAnchor];
  id v6 = [(PHAudioCallViewController *)self view];
  id v7 = [v6 topAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTop];
  uint64_t v8 = [v5 constraintEqualToAnchor:v7];
  v16[0] = v8;
  id v9 = [v4 trailingAnchor];
  id v10 = [(PHAudioCallViewController *)self view];
  unsigned __int8 v11 = [v10 trailingAnchor];
  [(PHAudioCallViewController *)self callDetailsButtonPaddingTrailing];
  __int16 v13 = [v9 constraintEqualToAnchor:v11 constant:-v12];
  v16[1] = v13;
  int v14 = +[NSArray arrayWithObjects:v16 count:2];
  +[NSLayoutConstraint activateConstraints:v14];

  uint64_t v15 = +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize];
  [v4 setMaximumContentSizeCategory:v15];
}

- (BOOL)shouldShowCallDetailsViewButton
{
  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout]) {
    goto LABEL_2;
  }
  id v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v4 callDisplayStyle] != (id)3)
  {
    BOOL v9 = 0;
LABEL_19:

    return v9;
  }
  id v10 = [(PHAudioCallViewController *)self features];
  id v2 = [v10 isDominoEnabled];

  if (v2)
  {
LABEL_2:
    id v4 = [(PHAudioCallViewController *)self frontmostCall];
    id v5 = [v4 provider];
    unsigned __int8 v6 = [v5 isFaceTimeProvider];
    if ((v6 & 1) != 0
      || ([v4 provider],
          id v2 = (id)objc_claimAutoreleasedReturnValue(),
          [v2 isTelephonyProvider]))
    {
      if ((([v4 isActive] & 1) != 0 || objc_msgSend(v4, "isOnHold"))
        && ([v4 isVideo] & 1) == 0)
      {
        id v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        if ([v7 callDisplayStyle])
        {
          uint64_t v8 = [(PHAudioCallViewController *)self callDisplayStyleManager];
          BOOL v9 = [v8 callDisplayStyle] != (id)3;

          if (v6) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
      }
      BOOL v9 = 0;
      if (v6)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  return 0;
}

- (void)callDetailsViewButtonTapped
{
  uint64_t v3 = [(PHAudioCallViewController *)self frontmostCall];
  if ([(PHAudioCallViewController *)self shouldShowConferenceCallDetails])
  {
    id v4 = objc_alloc_init(PHConferenceParticipantsViewController);
    id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
    unsigned __int8 v6 = +[UIColor grayColor];
    id v7 = [v5 view];
    [v7 setBackgroundColor:v6];

    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissNavigationController"];
    BOOL v9 = [(PHConferenceParticipantsViewController *)v4 navigationItem];
    [v9 setLeftBarButtonItem:v8];

    [(PHAudioCallViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v10 = [v3 provider];
    unsigned int v11 = [v10 isTelephonyProvider];

    if (v11)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000DE018;
      v22[3] = &unk_1002CDA70;
      id v23 = v3;
      unsigned __int8 v24 = self;
      double v12 = objc_retainBlock(v22);
      __int16 v13 = +[PHInCallUtilities sharedInstance];
      [v13 requestPasscodeUnlockWithCompletion:v12];
    }
    else
    {
      objc_initWeak(&location, self);
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_1000DE394;
      id v19 = &unk_1002CDBE0;
      objc_copyWeak(&v20, &location);
      int v14 = objc_retainBlock(&v16);
      uint64_t v15 = +[PHInCallUtilities sharedInstance];
      [v15 requestPasscodeUnlockWithCompletion:v14];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4
{
  id v5 = [(PHAudioCallViewController *)self activeCall];
  [(PHAudioCallViewController *)self reportWithCall:v5];
}

- (BOOL)shouldShowConferenceCallDetails
{
  uint64_t v3 = [(PHAudioCallViewController *)self callParticipantsViewController];
  id v4 = [v3 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  unsigned __int8 v6 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  id v7 = [(PHAudioCallViewController *)self callParticipantsViewController];
  unsigned __int8 v8 = [v7 shouldShowInfoButtonForParticipantAtIndex:0 inParticipantsView:v6];

  return v8;
}

- (BOOL)canDoInfoButtonCoinFlipWith:(id)a3 contactStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSUserDefaults standardUserDefaults];
  unsigned int v8 = [v7 BOOLForKey:@"PHInCallUIInfoButtonCoinFlipKey"];

  if (v8)
  {
    id v9 = [objc_alloc((Class)CNSharedProfileStateOracle) initWithContact:v5 contactStore:v6];
    BOOL v10 = [v9 avatarViewAnimationTypeForEffectiveState] == (id)1;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)animateInfoButtonCoinFlipIfNeeded
{
  unsigned int v4 = [(PHAudioCallViewController *)self shouldUseHeroImageLayout];
  if ((v4 & 1) == 0)
  {
    id v53 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v53 callDisplayStyle] != (id)3)
    {
LABEL_19:

      return;
    }
    id v2 = [(PHAudioCallViewController *)self features];
    if (([v2 isDominoEnabled] & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
  }
  id v5 = [(PHAudioCallViewController *)self features];
  if (![v5 isNameAndPhotoC3Enabled])
  {

    if (v4) {
      return;
    }
    goto LABEL_18;
  }
  id v6 = [(PHAudioCallViewController *)self callDetailsViewButton];

  if (!v4)
  {
  }
  if (v6)
  {
    id v7 = [(PHAudioCallViewController *)self frontmostCall];
    unsigned int v8 = [v7 contactIdentifier];

    if (!v8)
    {
LABEL_36:

      return;
    }
    id v9 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v7];
    id v10 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v9];
    unsigned int v11 = [v7 contactIdentifier];
    double v12 = +[PHAudioCallViewController contactKeysToFetch];
    __int16 v13 = [(PHAudioCallViewController *)self contactsCache];
    int v14 = [v10 contactForIdentifier:v11 keysToFetch:v12 usingCache:v13];

    if (!v14
      || ![(PHAudioCallViewController *)self canDoInfoButtonCoinFlipWith:v14 contactStore:v10])
    {
LABEL_35:

      goto LABEL_36;
    }
    id v15 = [objc_alloc((Class)CNSharedProfileStateOracle) initWithContact:v14 contactStore:v10];
    unsigned int v16 = +[CNSharedProfileStateOracle contactIsInAutoUpdateState:v14];
    uint64_t v17 = sub_1000D5130();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        id v19 = [v15 currentNickname];
        id v20 = [v14 imageData];
        *(_DWORD *)buf = 138412546;
        v63 = v19;
        __int16 v64 = 2112;
        v65 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SNAP: animateInfoButtonCoinFlipIfNeeded using currentNickname %@ contact.imageData: %@", buf, 0x16u);
      }
      unsigned int v21 = [v15 currentNickname];

      id v22 = objc_alloc((Class)CNSharedProfile);
      id v23 = v22;
      if (!v21)
      {
        id v27 = [v22 initWithContact:v14];
        goto LABEL_26;
      }
      uint64_t v24 = [v15 currentNickname];
    }
    else
    {
      if (v18)
      {
        long long v25 = [v15 pendingNickname];
        *(_DWORD *)buf = 138412290;
        v63 = v25;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SNAP: animateInfoButtonCoinFlipIfNeeded using pendingNickname %@", buf, 0xCu);
      }
      id v23 = objc_alloc((Class)CNSharedProfile);
      uint64_t v24 = [v15 pendingNickname];
    }
    double v26 = (void *)v24;
    id v27 = [v23 initWithNickname:v24];

LABEL_26:
    id v28 = [(PHAudioCallViewController *)self callDetailsViewButton];
    [v28 setAlpha:0.0];

    id v29 = objc_alloc_init((Class)UIView);
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int16 v30 = [(PHAudioCallViewController *)self view];
    [v30 addSubview:v29];

    uint64_t v31 = [v15 pendingNickname];
    int v32 = [v31 avatar];

    id v54 = v15;
    v51 = v32;
    if (+[SensitivityFeatureFlags isSensitivityAvatarTreatmentEnabled])
    {
      unsigned int v33 = [v32 contentIsSensitive];
      __int16 v34 = sub_1000D5130();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v63) = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for infoButton peekaboo returning %d", buf, 8u);
      }
    }
    else
    {
      __int16 v34 = sub_1000D5130();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for infoButton peekaboo not performing check", buf, 2u);
      }
      unsigned int v33 = 0;
    }

    v35 = +[ICSPreferences sharedPreferences];
    unsigned int v36 = [v35 forceBlurNewPoster];

    uint64_t v37 = v36 | v33;
    objc_super v38 = [_TtC13InCallService19BlurrableAvatarView alloc];
    v52 = v27;
    v39 = [v27 contact];
    v40 = [(BlurrableAvatarView *)v38 initWithContact:v39 wantsBlur:v37 isCommunicationSafetyEnabled:+[SensitivityFeatureFlags isCommunicationSafetyEnabled]];

    [(BlurrableAvatarView *)v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v29 addSubview:v40];
    unsigned int v41 = +[UIButton buttonWithType:4];
    [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v29 addSubview:v41];
    v42 = +[UIColor secondaryLabelColor];
    [v41 setTintColor:v42];

    [(PHAudioCallViewController *)self applyCallDetailsViewButtonPositionAndSizeCapToElement:v41];
    v43 = [(PHAudioCallViewController *)self wallpaperTitleStyleAttributes];
    unsigned int v44 = v43;
    if (v43)
    {
      int v45 = [v43 titleColor];
      [v41 setTintColor:v45];
    }
    v46 = +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize];
    [(BlurrableAvatarView *)v40 setMaximumContentSizeCategory:v46];

    [(PHAudioCallViewController *)self applySizeToElement:v40 usingThisElementAsGuide:v41];
    [(PHAudioCallViewController *)self applySizeToElement:v29 usingThisElementAsGuide:v41];
    [(PHAudioCallViewController *)self applyCallDetailsViewButtonPositionAndSizeCapToElement:v29];
    [(PHAudioCallViewController *)self applyCallDetailsViewButtonPositionAndSizeCapToElement:v40];
    [(BlurrableAvatarView *)v40 setAlpha:0.0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DECD0;
    block[3] = &unk_1002D0658;
    id v56 = v29;
    v57 = v40;
    id v58 = v41;
    v59 = self;
    id v60 = v14;
    id v61 = v54;
    id v47 = v54;
    id v48 = v41;
    v49 = v40;
    id v50 = v29;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_35;
  }
}

- (void)triggerInversionColorUpdate:(id)a3
{
  id v4 = a3;
  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout]
    && ![(PHAudioCallViewController *)self hasInvertedUIElementColorsBasedOnPoster])
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SNAP: We are going to update inversion color based on new configuration", (uint8_t *)buf, 2u);
    }

    id v6 = [objc_alloc((Class)TPInComingCallUISnapshotViewController) initWithConfiguration:v4 style:0 nameString:&stru_1002D6110];
    objc_initWeak(buf, self);
    id v7 = [(PHAudioCallViewController *)self view];
    unsigned int v8 = [v7 window];
    id v9 = [v8 windowScene];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000DF3D4;
    v10[3] = &unk_1002D0680;
    objc_copyWeak(&v11, buf);
    [v6 snapshotWithOptions:0 windowScene:v9 completionBlock:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)invertNecessaryUIElementsBasedOnPosterImage:(id)a3
{
  id v4 = a3;
  if (![(PHAudioCallViewController *)self hasInvertedUIElementColorsBasedOnPoster])
  {
    [(PHAudioCallViewController *)self invertColorForBottomButtonsBasedOn:v4];
    [(PHAudioCallViewController *)self invertColorForCallDetailsButtonBasedOn:v4];
    [(PHAudioCallViewController *)self invertColorForCallRecordingButtonBasedOn:v4];
    [(PHAudioCallViewController *)self invertColorForPosterBadgeViewBasedOn:v4];
  }
}

+ (void)fetchPrefersWhiteColorAtCropRect:(CGRect)a3 image:(id)a4 completion:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = (void (**)(id, BOOL, void))a5;
  id v11 = +[PHAudioCallViewController imageRefFrom:a4];
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGImageRef v12 = CGImageCreateWithImageInRect(v11, v20);
  if (v12)
  {
    __int16 v13 = v12;
    BOOL v14 = +[PHAudioCallViewController prefersWhiteTextOnImageRef:v12];
    CGImageRelease(v13);
    v10[2](v10, v14, 0);
  }
  else
  {
    id v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001EC1DC();
    }

    NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v19 = @"SNAP: croppedImageRef for snapshot is nil, can't invert the color";
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"com.apple.incallservice" code:-1 userInfo:v16];
    ((void (**)(id, BOOL, void *))v10)[2](v10, 0, v17);

    id v10 = (void (**)(id, BOOL, void))v16;
  }
}

- (void)invertColorForBottomButtonsBasedOn:(id)a3
{
  id v4 = a3;
  id v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  [v4 scale];
  double v11 = v10 * (v7 * 0.1);
  [v4 scale];
  double v13 = v9 * 0.6 * v12;
  [v4 scale];
  double v15 = v7 * 0.8 * v14;
  [v4 scale];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DF844;
  v17[3] = &unk_1002CEBF0;
  v17[4] = self;
  [objc_opt_class() fetchPrefersWhiteColorAtCropRect:v4 image:v17 completion:v11, v13, v15, v9 * 0.3 * v16];
}

- (void)invertColorForCallDetailsButtonBasedOn:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v5 origin];
  double v7 = v6;
  [v4 scale];
  double v9 = v7 * v8;
  double v10 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v10 origin];
  double v12 = v11;
  [v4 scale];
  double v14 = v12 * v13;
  double v15 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v15 frame];
  double v17 = v16;
  [v4 scale];
  double v19 = v18 * v17;
  CGRect v20 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v20 frame];
  double v22 = v21;
  [v4 scale];
  double v24 = v23 * v22;

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000DFAB0;
  v25[3] = &unk_1002CEBF0;
  v25[4] = self;
  [objc_opt_class() fetchPrefersWhiteColorAtCropRect:v4 image:v25 completion:v9, v14, v19, v24];
}

- (void)invertColorForCallRecordingButtonBasedOn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHAudioCallViewController *)self callRecordingButtonViewController];
  if (!v5) {
    goto LABEL_4;
  }
  double v6 = (void *)v5;
  double v7 = [(PHAudioCallViewController *)self callRecordingButtonViewController];
  double v8 = [v7 view];

  if (v8)
  {
    double v9 = [(PHAudioCallViewController *)self callRecordingButtonViewController];
    double v10 = [v9 view];
    [v10 origin];
    double v12 = v11;
    [v4 scale];
    double v14 = v12 * v13;
    double v15 = [(PHAudioCallViewController *)self callRecordingButtonViewController];
    double v16 = [v15 view];
    [v16 origin];
    double v18 = v17;
    [v4 scale];
    double v20 = v18 * v19;
    double v21 = [(PHAudioCallViewController *)self callRecordingButtonViewController];
    double v22 = [v21 view];
    [v22 frame];
    double v24 = v23;
    [v4 scale];
    double v26 = v25 * v24;
    id v27 = [(PHAudioCallViewController *)self callRecordingButtonViewController];
    id v28 = [v27 view];
    [v28 frame];
    double v30 = v29;
    [v4 scale];
    double v32 = v31 * v30;

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000DFDEC;
    v34[3] = &unk_1002CEBF0;
    v34[4] = self;
    [objc_opt_class() fetchPrefersWhiteColorAtCropRect:v4 image:v34 completion:v14];
  }
  else
  {
LABEL_4:
    unsigned int v33 = sub_1000D5130();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "SNAP: call recording button doesn't exist, can't invert its color", buf, 2u);
    }
  }
}

- (void)invertColorForPosterBadgeViewBasedOn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHAudioCallViewController *)self posterBadgeView];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(PHAudioCallViewController *)self posterBadgeView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v9 = [(PHAudioCallViewController *)self posterBadgeView];
      double v10 = [(PHAudioCallViewController *)self posterBadgeView];
      [v10 origin];
      double v12 = v11;
      [v4 scale];
      double v14 = v12 * v13;
      double v15 = [(PHAudioCallViewController *)self posterBadgeView];
      [v15 origin];
      double v17 = v16;
      [v4 scale];
      double v19 = v17 * v18;
      double v20 = [(PHAudioCallViewController *)self posterBadgeView];
      [v20 frame];
      double v22 = v21;
      [v4 scale];
      double v24 = v23 * v22;
      double v25 = [(PHAudioCallViewController *)self posterBadgeView];
      [v25 frame];
      double v27 = v26;
      [v4 scale];
      double v29 = v28 * v27;

      double v30 = objc_opt_class();
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000E0098;
      v32[3] = &unk_1002D0398;
      v32[4] = self;
      id v33 = v9;
      id v31 = v9;
      [v30 fetchPrefersWhiteColorAtCropRect:v4 image:v32 completion:v14 v19, v24, v29];
    }
  }
}

+ (BOOL)prefersWhiteTextOnImageRef:(CGImage *)a3
{
  uint64_t v3 = +[CNImageDerivedColorGenerator colorsForImageRef:a3];
  unsigned __int8 v4 = +[CNImageDerivedColorBackgroundUtilities backgroundColorsPreferWhiteForegroundText:v3];

  return v4;
}

+ (CGImage)imageRefFrom:(id)a3
{
  id v3 = a3;
  if ([v3 ioSurface])
  {
    unsigned __int8 v4 = (CGImage *)UICreateCGImageFromIOSurface();
    [v3 size];
    double v6 = v5;
    [v3 size];
    double v8 = v7;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v10 = CGBitmapContextCreate(0, (unint64_t)v6, (unint64_t)v8, 8uLL, vcvtd_n_u64_f64(v6, 2uLL), DeviceRGB, 1u);
    v14.origin.CGFloat x = 0.0;
    v14.origin.CGFloat y = 0.0;
    v14.size.CGFloat width = v6;
    v14.size.CGFloat height = v8;
    CGContextDrawImage(v10, v14, v4);
    CGImageRef Image = CGBitmapContextCreateImage(v10);
    double v12 = Image;
    if (Image) {
      CFAutorelease(Image);
    }
    if (v4) {
      CFRelease(v4);
    }
    CGColorSpaceRelease(DeviceRGB);
    if (v10) {
      CFRelease(v10);
    }
  }
  else
  {
    double v12 = (CGImage *)[v3 CGImage];
  }

  return v12;
}

- (void)useRTTButtonTapped
{
  id v4 = [(PHAudioCallViewController *)self frontmostCall];
  id v3 = [(PHAudioCallViewController *)self callCenter];
  [v3 setTTYType:1 forCall:v4];
}

- (void)extensionNumberButtonTapped
{
  id v2 = [(PHAudioCallViewController *)self frontmostCall];
  [v2 sendHardPauseDigits];
}

- (void)callTransferButtonTapped
{
  id v11 = objc_alloc_init((Class)TUCallProviderManager);
  id v3 = objc_alloc((Class)TUDialRequest);
  id v4 = [v11 telephonyProvider];
  id v5 = [v3 initWithProvider:v4];

  id v6 = [objc_alloc((Class)TUHandle) initWithType:2 value:@"4"];
  [v5 setHandle:v6];

  [v5 setOriginatingUIType:38];
  double v7 = [(PHAudioCallViewController *)self frontmostCall];
  double v8 = [v7 localSenderIdentityAccountUUID];
  [v5 setLocalSenderIdentityAccountUUID:v8];

  double v9 = [(PHAudioCallViewController *)self callCenter];
  id v10 = [v9 dialWithRequest:v5];
}

- (BOOL)shouldAddRTTButtonToViewHierarchy
{
  if (![(PHAudioCallViewController *)self shouldShowUseRTT]) {
    return 0;
  }
  id v3 = [(PHAudioCallViewController *)self features];
  if ([v3 isButtonLayoutEnabled])
  {
    id v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v4 callDisplayStyle] == (id)3)
    {
      id v5 = [(PHAudioCallViewController *)self features];
      BOOL v6 = ([v5 isDominoEnabled] & 1) == 0 && self->_middleViewState == 1;
    }
    else
    {
      BOOL v6 = self->_middleViewState == 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)refreshUseRTTButton
{
  [(PHAudioCallViewController *)self updateLayoutSupplementalButtons];
  id v3 = [(PHCallViewController *)self bottomBar];
  [v3 refreshUseRTTButton];
}

- (BOOL)shouldAddExtensionNumberButtonToViewHierarchy
{
  id v4 = [(PHAudioCallViewController *)self features];
  if ([v4 isButtonLayoutEnabled])
  {
    id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v6 = [v5 callDisplayStyle];
    if (v6 == (id)3)
    {
      id v2 = [(PHAudioCallViewController *)self features];
      if (([v2 isDominoEnabled] & 1) != 0 || self->_middleViewState != 1)
      {
        BOOL v7 = 0;
        goto LABEL_9;
      }
    }
    else if (self->_middleViewState != 1)
    {
      BOOL v7 = 0;
      goto LABEL_11;
    }
    double v8 = [(PHAudioCallViewController *)self frontmostCall];
    BOOL v7 = [v8 hardPauseDigitsState] == 2;

    if (v6 != (id)3)
    {
LABEL_11:

      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_11;
  }
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (void)refreshExtensionNumberButton
{
  id v3 = [(PHCallViewController *)self bottomBar];
  id v4 = [(PHAudioCallViewController *)self customizedTitleForItemInBar:v3 withActionType:23];

  [(PHAudioCallControlsSupplementalButton *)self->_extensionNumberButton setTitle:v4 forState:0];
  [(PHAudioCallViewController *)self updateLayoutSupplementalButtons];
}

- (void)updateLayoutSupplementalButtons
{
  id v3 = [(PHAudioCallViewController *)self callTransferButton];
  [v3 removeFromSuperview];

  id v4 = [(PHAudioCallViewController *)self extensionNumberButton];
  [v4 removeFromSuperview];

  id v5 = [(PHAudioCallViewController *)self useRTTButton];
  [v5 removeFromSuperview];

  id v6 = [(PHAudioCallViewController *)self buttonsViewController];
  BOOL v7 = [v6 view];

  uint64_t v8 = [v7 superview];
  if (v8)
  {
    double v9 = (void *)v8;
    unsigned int v10 = [(PHAudioCallViewController *)self middleViewState];

    if (v10 == 1)
    {
      id v11 = +[UIScreen mainScreen];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;

      if (v13 >= v15) {
        double v13 = v15;
      }
      id v16 = objc_alloc_init((Class)NSMutableArray);
      if ([(PHAudioCallViewController *)self shouldShowCallTransfer])
      {
        double v17 = [(PHAudioCallViewController *)self callTransferButton];
        [v16 addObject:v17];
      }
      if ([(PHAudioCallViewController *)self shouldAddExtensionNumberButtonToViewHierarchy])
      {
        double v18 = [(PHAudioCallViewController *)self extensionNumberButton];
        [v16 addObject:v18];
      }
      if ([(PHAudioCallViewController *)self shouldAddRTTButtonToViewHierarchy])
      {
        double v19 = [(PHAudioCallViewController *)self useRTTButton];
        [v16 addObject:v19];
      }
      double v20 = v13 * 0.102;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000E0C28;
      v46[3] = &unk_1002D06A8;
      v46[4] = self;
      id v21 = v7;
      id v47 = v21;
      [v16 __imForEach:v46];
      if ([v16 count] == (id)3)
      {
        v43 = [v16 objectAtIndexedSubscript:0];
        v42 = [v43 leadingAnchor];
        uint64_t v44 = [v21 leadingAnchor];
        uint64_t v40 = [v42 constraintEqualToAnchor:v44 constant:v20];
        v49[0] = v40;
        unsigned int v41 = [v16 objectAtIndexedSubscript:1];
        double v22 = [v41 centerXAnchor];
        double v23 = [v21 centerXAnchor];
        double v24 = [v22 constraintEqualToAnchor:v23];
        v49[1] = v24;
        double v25 = [v16 objectAtIndexedSubscript:2];
        double v26 = [v25 trailingAnchor];
        double v27 = [v21 trailingAnchor];
        double v28 = [v26 constraintEqualToAnchor:v27 constant:-v20];
        v49[2] = v28;
        double v29 = +[NSArray arrayWithObjects:v49 count:3];
        +[NSLayoutConstraint activateConstraints:v29];

        double v30 = (void *)v40;
        id v31 = (void *)v44;

        double v32 = v43;
        id v33 = v42;
      }
      else if ([v16 count] == (id)2)
      {
        double v32 = [v16 objectAtIndexedSubscript:0];
        id v33 = [v32 leadingAnchor];
        uint64_t v45 = [v21 leadingAnchor];
        uint64_t v34 = [v33 constraintEqualToAnchor:v45 constant:v20];
        v48[0] = v34;
        v35 = [v16 objectAtIndexedSubscript:1];
        unsigned int v36 = [v35 trailingAnchor];
        uint64_t v37 = [v21 trailingAnchor];
        objc_super v38 = [v36 constraintEqualToAnchor:v37 constant:-v20];
        v48[1] = v38;
        v39 = +[NSArray arrayWithObjects:v48 count:2];
        +[NSLayoutConstraint activateConstraints:v39];

        double v30 = (void *)v34;
        id v31 = (void *)v45;
      }
      else
      {
        if ([v16 count] != (id)1)
        {
LABEL_18:

          goto LABEL_19;
        }
        double v32 = [v16 objectAtIndexedSubscript:0];
        id v33 = [v32 centerXAnchor];
        id v31 = [v21 centerXAnchor];
        double v30 = [v33 constraintEqualToAnchor:v31];
        [v30 setActive:1];
      }

      goto LABEL_18;
    }
  }
LABEL_19:
}

- (void)dismissNavigationController
{
  id v2 = [(PHAudioCallViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)dismissNavigationControllerAndUpdateScene
{
  objc_initWeak(&location, self);
  id v3 = [(PHAudioCallViewController *)self navigationController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E0E08;
  v4[3] = &unk_1002CED28;
  objc_copyWeak(&v5, &location);
  [v3 dismissViewControllerAnimated:1 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateCurrentState
{
  [(PHAudioCallViewController *)self refreshCallDetailsViewButton];
  id v3 = [(PHAudioCallViewController *)self callCenter];
  id v4 = [v3 currentCallGroups];

  id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if (![v5 callDisplayStyle])
  {
    unsigned int v6 = [(PHAudioCallViewController *)self _isScreeningAnyCallGroup:v4];

    if (!v6) {
      goto LABEL_5;
    }
    id v5 = +[UIApplication sharedApplication];
    BOOL v7 = [v5 delegate];
    uint64_t v8 = [v7 currentInCallScene];
    [v8 requestTransitionToPresentationMode:0 shouldDismissCMASAlerts:0 analyticsSource:@"SBSUIInCallTransitionAnalyticsSourceCallScreeningBegin"];
  }
LABEL_5:
  if (+[PHSOSViewController isCallBufferDismissalAssertionActive])
  {
    if (![v4 count])
    {
      double v20 = sub_1000D5130();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v122 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController,UpdateCurrentState,invoking setCurrentState:PHInCallStateCallBuffer", v122, 2u);
      }

      [(PHAudioCallViewController *)self setCurrentState:10];
      goto LABEL_110;
    }
    +[PHSOSViewController releaseAllCallBufferDismissalAssertions];
  }
  double v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v122 = 138412290;
    *(void *)&v122[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Current Call Groups is %@", v122, 0xCu);
  }

  unsigned int v10 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v11 = [v10 allCallsPassTest:&stru_1002D06C8];

  double v12 = [(PHAudioCallViewController *)self callCenter];
  double v13 = [v12 routeController];
  double v14 = [v13 pickedRoute];
  id v15 = [v14 deviceType];

  if (!v11
    || [(PHCallViewController *)self currentState] != 1
    && [(PHCallViewController *)self currentState] != 3
    && v15 != (id)13)
  {
    goto LABEL_16;
  }
  id v16 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v16 callDisplayStyle] == (id)3)
  {
    double v17 = [(PHAudioCallViewController *)self features];
    unsigned int v18 = [v17 isDominoEnabled];

    if (v18)
    {
LABEL_16:
      [(PHCallViewController *)self obtainDismissalAssertionIfNeeded];
      int v19 = 0;
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v19 = 1;
LABEL_22:
  if ([v4 count])
  {
    if (([(PHAudioCallViewController *)self isViewLoaded] & 1) == 0) {
      [(PHAudioCallViewController *)self loadView];
    }
    id v21 = +[UIApplication sharedApplication];
    double v22 = [v21 delegate];
    double v23 = [v22 bannerPresentationManager];
    double v24 = [(PHAudioCallViewController *)self callDetailsCoordinator];
    double v25 = [(PHAudioCallViewController *)self makeCallDetailsCoordinatorWithBannerPresentationManager:v23 existingCoordinator:v24 deferredPresentationManager:self];

    id v26 = [v25 outcome];
    if (v26 == (id)1)
    {
      [(PHAudioCallViewController *)self setCallDetailsCoordinator:0];
    }
    else if (v26 == (id)2)
    {
      double v27 = [v25 coordinator];
      [(PHAudioCallViewController *)self setCallDetailsCoordinator:v27];
    }
  }
  if (![v4 count])
  {
    double v32 = +[UIApplication sharedApplication];
    id v33 = [v32 delegate];
    id v34 = [v33 mostRecentlyDisconnectedAudioCall];

    if (!v34) {
      goto LABEL_74;
    }
    unsigned int v35 = [v34 canDisplayAlertUI:[self shouldPresentAlertButton]];
    unsigned int v36 = sub_1000D5130();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v37)
      {
        *(_WORD *)v122 = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Emergency call has been disconnected, setting state to PHInCallStateAlertModeNeededIfAvailable", v122, 2u);
      }

      [(PHAudioCallViewController *)self setCurrentState:8 animated:1];
      [(PHAudioCallViewController *)self updateCallParticipantsViewControllerCallGroups];
      [(PHAudioCallViewController *)self setEmergencyTextViaSatelliteUI];
      objc_super v38 = [(PHAudioCallViewController *)self buttonsViewController];
      v39 = [v38 view];

      [v39 updateControls];
      [(PHAudioCallViewController *)self setMiddleViewState:1];
      uint64_t v40 = [(PHAudioCallViewController *)self currentMiddleView];
      char v41 = objc_opt_respondsToSelector();

      if (v41)
      {
        v42 = [(PHAudioCallViewController *)self currentMiddleView];
        [v42 setButtonsEnabled:1];
      }
    }
    else
    {
      if (v37)
      {
        *(_WORD *)v122 = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call has been disconnected, setting state to PHInCallStateEnded", v122, 2u);
      }

      if ([(PHCallViewController *)self currentState] == 8)
      {
        v69 = [(PHCallViewController *)self bottomBar];
        [v69 setCurrentState:11];
      }
      [(PHAudioCallViewController *)self setCurrentState:7 animated:0];
      [(PHAudioCallViewController *)self removeEmergencyTextViaSatelliteUI];
      [(PHAudioCallViewController *)self updateCallParticipantsViewControllerCallGroups];
    }
    if (([v34 disconnectedReasonRequiresCallBackUI] & 1) == 0) {
LABEL_74:
    }
      [(PHAudioCallViewController *)self removeEmergencyTextViaSatelliteUI];
    goto LABEL_108;
  }
  if (v19)
  {
    double v28 = sub_1000D5130();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = [(PHCallViewController *)self currentState];
      *(_DWORD *)v122 = 67109376;
      *(_DWORD *)&v122[4] = v29;
      *(_WORD *)&v122[8] = 1024;
      *(_DWORD *)&v122[10] = v15 == (id)13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: All calls are an endpoint elsewhere and previous state was %d OR shouldDismissForPickedRoute is %d, so setting state to PHInCallStateIdle", v122, 0xEu);
    }

    double v30 = self;
    uint64_t v31 = 0;
    goto LABEL_35;
  }
  if ([v4 count] == (id)1)
  {
    v43 = [(PHAudioCallViewController *)self callCenter];
    unsigned __int8 v44 = [v43 hasCurrentVideoCalls];

    if ((v44 & 1) == 0)
    {
      id v34 = [v4 lastObject];
      unsigned int v70 = [v34 isConnected];
      unsigned int v71 = [v34 canDisplayAlertUI:[self shouldPresentAlertButton]];
      if ((v71 & 1) == 0) {
        [(PHAudioCallViewController *)self removeEmergencyTextViaSatelliteUI];
      }
      v72 = sub_1000D5130();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v73 = [v34 callStatus];
        unsigned int v74 = [v34 isEmergency];
        unsigned int v75 = [v34 isFailureExpected];
        unsigned int v76 = [(PHAudioCallViewController *)self shouldPresentAlertButton];
        *(_DWORD *)v122 = 67110144;
        *(_DWORD *)&v122[4] = v71;
        *(_WORD *)&v122[8] = 1024;
        *(_DWORD *)&v122[10] = v73;
        __int16 v123 = 1024;
        unsigned int v124 = v74;
        __int16 v125 = 1024;
        unsigned int v126 = v75;
        __int16 v127 = 1024;
        unsigned int v128 = v76;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController will or will not update UI for alert: needsAlertUI = %d, callStatus = %d, isEmergencCGFloat y = %d, isFailureExpected = %d, alertServiceAvailable = %d", v122, 0x20u);
      }

      if (v71)
      {
        v77 = sub_1000D5130();
        BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
        if (v70)
        {
          if (v78)
          {
            *(_WORD *)v122 = 0;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is not TUCallStatusActive, setting state to PHInCallStateAlertModeNeededWhileConnectedIfAvailable", v122, 2u);
          }
          uint64_t v79 = 9;
        }
        else
        {
          if (v78)
          {
            *(_WORD *)v122 = 0;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is not TUCallStatusActive, setting state to PHInCallStateAlertModeNeededIfAvailable", v122, 2u);
          }
          uint64_t v79 = 8;
        }

        [(PHAudioCallViewController *)self setCurrentState:v79 animated:1];
        [(PHAudioCallViewController *)self updateCallParticipantsViewControllerCallGroups];
        [(PHAudioCallViewController *)self setEmergencyTextViaSatelliteUI];
LABEL_106:
        v95 = [(PHAudioCallViewController *)self buttonsViewController];
        v96 = [v95 view];

        [v96 updateControls];
        goto LABEL_107;
      }
      if ([v34 status] == 4 || objc_msgSend(v34, "wantsHoldMusic"))
      {
        v88 = sub_1000D5130();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusRinging, setting state to PHInCallStateIncomingRinging", v122, 2u);
        }

        v89 = self;
        uint64_t v90 = 1;
        uint64_t v91 = 0;
        goto LABEL_96;
      }
      if ([v34 status] == 1 || objc_msgSend(v34, "status") == 2)
      {
        unsigned int v100 = [(PHCallViewController *)self currentState];
        v101 = sub_1000D5130();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusActive, and the call was initiated on this device", v122, 2u);
        }

        v102 = [v34 calls];
        id v103 = [v102 count];

        v104 = sub_1000D5130();
        BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT);
        if ((unint64_t)v103 >= 2)
        {
          if (v105)
          {
            v106 = [v34 calls];
            id v107 = [v106 count];
            *(_DWORD *)v122 = 134217984;
            *(void *)&v122[4] = v107;
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "There are %lu calls in call group, so setting state to PHInCallStateMultipleCallsActive", v122, 0xCu);
          }
          [(PHAudioCallViewController *)self setCurrentState:5 animated:1];
          if (!v100)
          {
            [(PHAudioCallViewController *)self setMiddleViewState:1];
            goto LABEL_107;
          }
          goto LABEL_150;
        }
        if (v105)
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "There is only one call in call group, so setting state to PHInCallStateSingleCallActive", v122, 2u);
        }

        if (![(PHAudioCallViewController *)self _isScreeningCallGroup:v34])
        {
          [(PHAudioCallViewController *)self setCurrentState:4 animated:1];
          if (![(PHAudioCallViewController *)self hasKeypadUpdated]) {
            [(PHAudioCallViewController *)self showFirstNameLabelOnKeypad];
          }
          goto LABEL_150;
        }
        v112 = self;
        uint64_t v113 = 11;
LABEL_139:
        [(PHAudioCallViewController *)v112 setCurrentState:v113 animated:1];
LABEL_150:
        if ((v100 & 0xFFFE) != 8) {
          goto LABEL_107;
        }
        v115 = [(PHCallViewController *)self bottomBar];
        [v115 setCurrentState:11];

        [(PHAudioCallViewController *)self updateCallParticipantsViewControllerCallGroups];
        v116 = [(PHAudioCallViewController *)self features];
        if ([v116 isButtonLayoutEnabled])
        {
        }
        else
        {
          v117 = [(PHAudioCallViewController *)self callDisplayStyleManager];
          if ([v117 callDisplayStyle] != (id)3)
          {

            goto LABEL_107;
          }
          v118 = [(PHAudioCallViewController *)self features];
          unsigned int v119 = [v118 isDominoEnabled];

          if (!v119) {
            goto LABEL_107;
          }
        }
        goto LABEL_106;
      }
      if ([v34 status] == 5)
      {
        v114 = sub_1000D5130();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusDisconnecting, setting state to PHInCallStateEnding", v122, 2u);
        }

        v89 = self;
        uint64_t v90 = 6;
      }
      else
      {
        if ([v34 status] != 6)
        {
          if ([v34 status] != 3) {
            goto LABEL_107;
          }
          LOWORD(v100) = [(PHCallViewController *)self currentState];
          v121 = sub_1000D5130();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v122 = 0;
            _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is Sending, setting state to PHInCallStateOutgoingRinging", v122, 2u);
          }

          v112 = self;
          uint64_t v113 = 2;
          goto LABEL_139;
        }
        v120 = sub_1000D5130();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusDisconnected, setting state to PHInCallStateEnded", v122, 2u);
        }

        v89 = self;
        uint64_t v90 = 7;
      }
      uint64_t v91 = 1;
LABEL_96:
      [(PHAudioCallViewController *)v89 setCurrentState:v90 animated:v91];
LABEL_107:

LABEL_108:
      goto LABEL_109;
    }
  }
  uint64_t v45 = (char *)[v4 count];
  v46 = [(PHAudioCallViewController *)self callCenter];
  id v47 = &v45[(void)[v46 currentVideoCallCount]];

  if ((unint64_t)v47 < 2) {
    goto LABEL_109;
  }
  id v48 = sub_1000D5130();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v122 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: More than one call is active...", v122, 2u);
  }

  v49 = [(PHAudioCallViewController *)self callCenter];
  id v50 = [v49 incomingCall];

  if (!v50)
  {
    unsigned int v80 = [(PHAudioCallViewController *)self _isScreeningAnyCallGroup:v4];
    unsigned int v81 = [(PHAudioCallViewController *)self usesCompactMulticallUI];
    unsigned int v82 = v81;
    if (!v80)
    {
      v92 = sub_1000D5130();
      BOOL v93 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
      if (v82)
      {
        if (v93)
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... so setting state to PHInCallStateSingleCallActive", v122, 2u);
        }
        uint64_t v94 = 4;
      }
      else
      {
        if (v93)
        {
          *(_WORD *)v122 = 0;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... so setting state to PHInCallStateMultipleCallsActive", v122, 2u);
        }
        uint64_t v94 = 5;
      }

      [(PHAudioCallViewController *)self setCurrentState:v94 animated:1];
      [(PHAudioCallViewController *)self hideFirstNameLabelOnKeypad];
      goto LABEL_109;
    }
    if (!v81) {
      goto LABEL_88;
    }
    uint64_t v83 = [(PHAudioCallViewController *)self prioritizedCall];
    if (!v83
      || (v84 = (void *)v83,
          [(PHAudioCallViewController *)self prioritizedCall],
          v85 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v86 = [v85 isScreening],
          v85,
          v84,
          (v86 & 1) != 0))
    {
LABEL_88:
      v87 = sub_1000D5130();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v122 = 0;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... but no incoming call while one is being screened meaning the other was declined, so moving to PHInCallStateScreening", v122, 2u);
      }

      double v30 = self;
      uint64_t v31 = 11;
      goto LABEL_35;
    }
    v108 = sub_1000D5130();
    if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_143;
    }
    *(_WORD *)v122 = 0;
    v109 = "UpdateCurrentState: ... but no incoming call and the screening call isn't the prioritized one.";
    goto LABEL_142;
  }
  v51 = sub_1000D5130();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v122 = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... and we have an incoming audio call...", v122, 2u);
  }

  v52 = [(PHAudioCallViewController *)self callCenter];
  id v53 = [v52 callWithStatus:1];
  if (v53) {
    goto LABEL_56;
  }
  id v53 = [(PHAudioCallViewController *)self callCenter];
  id v54 = [v53 callWithStatus:3];
  if (v54)
  {
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  id v54 = [(PHAudioCallViewController *)self callCenter];
  v55 = [v54 callWithStatus:2];
  if (v55)
  {

    goto LABEL_55;
  }
  v110 = [(PHAudioCallViewController *)self callCenter];
  id v111 = [v110 currentVideoCallCount];

  if (!v111)
  {
    id v61 = sub_1000D5130();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v122 = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... but we don't also have an active call, so moving to PHInCallStateIncomingRinging", v122, 2u);
    }
LABEL_133:

LABEL_134:
    double v30 = self;
    uint64_t v31 = 1;
    goto LABEL_35;
  }
LABEL_57:
  unsigned __int8 v56 = [(PHAudioCallViewController *)self _isScreeningAnyCallGroup:v4];
  v57 = [(PHAudioCallViewController *)self callCenter];
  unsigned __int8 v58 = [v57 ics_hasTooManyCallsForCallWaitingBanner];

  v59 = [(PHAudioCallViewController *)self features];
  if (([v59 shouldShowFullScreenCallWaiting] & 1) != 0
    || (v56 & 1) != 0
    || (v58 & 1) != 0
    || [(PHAudioCallViewController *)self usesCompactMulticallUI])
  {

    goto LABEL_62;
  }
  v97 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v97 callDisplayStyle] != (id)3)
  {

LABEL_128:
    v108 = sub_1000D5130();
    if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
LABEL_143:

      double v30 = self;
      uint64_t v31 = 4;
      goto LABEL_35;
    }
    *(_WORD *)v122 = 0;
    v109 = "UpdateCurrentState: ... and we also have an active call, so moving to PHInCallStateSingleCallActive (EmbedSwapBanner)";
LABEL_142:
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, v109, v122, 2u);
    goto LABEL_143;
  }
  v98 = [(PHAudioCallViewController *)self features];
  unsigned int v99 = [v98 isDominoEnabled];

  if (!v99) {
    goto LABEL_128;
  }
LABEL_62:
  id v60 = sub_1000D5130();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v122 = 0;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... and we also have an active call, so moving to PHInCallStateCallWaiting", v122, 2u);
  }

  if (![(PHAudioCallViewController *)self usesCompactMulticallUI])
  {
    double v30 = self;
    uint64_t v31 = 3;
LABEL_35:
    -[PHAudioCallViewController setCurrentState:animated:](v30, "setCurrentState:animated:", v31, 1, *(void *)v122);
LABEL_109:
    [(PHAudioCallViewController *)self updateCallRecordingIfNeeded];
    goto LABEL_110;
  }
  id v61 = [(PHAudioCallViewController *)self prioritizedCall];
  uint64_t v62 = [v61 callUUID];
  if (!v62) {
    goto LABEL_133;
  }
  v63 = (void *)v62;
  __int16 v64 = [(PHAudioCallViewController *)self callCenter];
  v65 = [v64 incomingCall];
  objc_super v66 = [v65 callUUID];
  v67 = [(PHAudioCallViewController *)self prioritizedCall];
  v68 = [v67 callUUID];

  if (v66 == v68) {
    goto LABEL_134;
  }
LABEL_110:
}

- (BOOL)_isScreeningAnyCallGroup:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E2074;
  v4[3] = &unk_1002D06F0;
  void v4[4] = self;
  return [a3 tu_containsObjectPassingTest:v4];
}

- (BOOL)_isScreeningCallGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self featureFlags];
  if (TUCallScreeningEnabled())
  {
    unsigned int v6 = [v4 calls];
    BOOL v7 = [v6 firstObject];
    unsigned __int8 v8 = [v7 isScreening];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)setCurrentState:(unsigned __int16)a3
{
}

- (void)setIdleState:(unsigned __int16)a3
{
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 delegate];
  [v5 setMostRecentlyDisconnectedAudioCall:0];

  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAudioCallViewControllerDismissalAssertionWaitingForIdle"];
  [(PHAudioCallViewController *)self setCallForBackgroundImage:0 animated:1 callDisplayStyleChanged:0];
  [(PHAudioCallViewController *)self releaseDismissalAssertion];

  [(PHAudioCallViewController *)self _testing_didTransitionToIdleCallState];
}

- (void)setActiveState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v6 = [v5 routeController];

  if ([v6 hasAirPodsAvailable]) {
    unsigned int v7 = [v6 hasAirPodsInEar] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }
  unsigned __int8 v8 = sub_10000FA34(@"RevealAudioRoutesOnIncomingCall");
  if ([v8 BOOLValue])
  {
    LOBYTE(v7) = 1;
  }
  else if ([(PHCallViewController *)self currentState] != 1)
  {
    LOBYTE(v7) = 0;
  }

  if (![(PHAudioCallViewController *)self middleViewState]
    || [(PHAudioCallViewController *)self middleViewState] == 4)
  {
    objc_initWeak(location, self);
    v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472;
    char v41 = sub_1000E26FC;
    v42 = &unk_1002D0718;
    objc_copyWeak(&v43, location);
    char v44 = v7;
    [(PHAudioCallViewController *)self setMiddleViewState:1 animated:1 completion:&v39];
    objc_destroyWeak(&v43);
    objc_destroyWeak(location);
  }
  if (v3 == 5 || [(PHCallViewController *)self currentState] == 5) {
    [(PHAudioCallViewController *)self updateViewsForHeldCallControlsViewIfNeeded];
  }
  double v9 = [(PHCallViewController *)self bottomBar];
  [v9 setUserInteractionEnabled:1];

  unsigned int v10 = [(PHAudioCallViewController *)self currentMiddleView];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(PHAudioCallViewController *)self currentMiddleView];
    [v12 setButtonsEnabled:1];
  }
  double v13 = [(PHCallViewController *)self bottomBar];
  [(PHAudioCallViewController *)self _testing_didTransitionToActiveCallState:v13];

  [(PHCallViewController *)self setWantsApplicationDismissalStyle:v3 == 4];
  double v14 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v14 callDisplayStyle] == (id)3)
  {
    id v15 = [(PHAudioCallViewController *)self features];
    unsigned int v16 = [v15 isDominoEnabled];

    if (v16) {
      [(PHAudioCallViewController *)self layoutParticipantsViewAnimated:0];
    }
  }
  else
  {
  }
  if (v3 == 4)
  {
    double v17 = [(PHAudioCallViewController *)self isolatedCall];
    [(PHAudioCallViewController *)self setCallForBackgroundImage:v17 animated:1 callDisplayStyleChanged:0];
    if ([(PHAudioCallViewController *)self shouldShowNewPosterUpdates]) {
      [(PHAudioCallViewController *)self updateLayeredBackgroundWallpaper];
    }
    [(PHAudioCallViewController *)self animateInfoButtonCoinFlipIfNeeded];
  }
  else
  {
    double v17 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    [(PHAudioCallViewController *)self setCallForBackgroundImage:v17 animated:1 callDisplayStyleChanged:0];
  }
  if ([v17 originatingUIType] == 10)
  {
    unsigned int v18 = [(PHAudioCallViewController *)self callCenter];
    int v19 = [v18 routeController];
    double v20 = [v19 routeForSpeakerEnable];

    if (v20)
    {
      id v21 = [(PHAudioCallViewController *)self callCenter];
      double v22 = [v21 routeController];
      [v22 pickRoute:v20];
    }
    else
    {
      id v21 = sub_1000D5130();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1001EC210();
      }
    }

    double v25 = [(PHAudioCallViewController *)self voiceLoopManager];
    [v25 startLoopPlayback];
  }
  else
  {
    if ([v17 originatingUIType] != 12) {
      goto LABEL_35;
    }
    double v23 = [(PHAudioCallViewController *)self callCenter];
    double v24 = [v23 routeController];
    double v20 = [v24 routeForSpeakerDisable];

    if (v20)
    {
      double v25 = [(PHAudioCallViewController *)self callCenter];
      id v26 = [v25 routeController];
      [v26 pickRoute:v20];
    }
    else
    {
      double v25 = sub_1000D5130();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[WARN] PHAudioCallViewController: Could not find available route to pick for speaker disable", (uint8_t *)location, 2u);
      }
    }
  }

LABEL_35:
  double v27 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  id v28 = [v27 callDisplayStyle];

  if (!v28)
  {
    unsigned int v29 = [(PHAudioCallViewController *)self callParticipantsViewController];
    [v29 setBannerButtonsState:1];

    double v30 = [(PHAudioCallViewController *)self callCenter];
    uint64_t v31 = [v30 routeController];
    double v32 = [v31 pickedRoute];
    uint64_t v33 = [v32 isReceiver] ^ 1;

    id v34 = +[UIApplication sharedApplication];
    unsigned int v35 = [v34 delegate];
    unsigned int v36 = [v35 currentInCallScene];
    BOOL v37 = [v36 delegate];
    objc_super v38 = [v37 callAnalyticsLogger];
    [v38 createAnsweredBannerAnalyticsViewWithIsHandsfreeAudioRoute:v33];
  }
  [(PHAudioCallViewController *)self _performPosterTransformationsIfNecessaryToState:v3];
}

- (void)_performPosterTransformationsIfNecessaryToState:(unsigned __int16)a3
{
  int v3 = a3;
  id v10 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  id v5 = [v10 callDisplayStyle];
  if (v3 == 4
    && v5 == (id)2
    && ([(PHAudioCallViewController *)self renderingViewController],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v7 = (void *)v6;
    unsigned int v8 = [(PHAudioCallViewController *)self shouldShowContactOrLastSeenWallpaper];

    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000E28C8;
      v11[3] = &unk_1002CD778;
      v11[4] = self;
      __int16 v12 = 4;
      double v9 = objc_retainBlock(v11);
      +[UIView animateWithDuration:v9 animations:0.5];
    }
  }
  else
  {
  }
}

- (void)updateCallParticipantsViewControllerCallGroups
{
  if ([(PHAudioCallViewController *)self usesCompactMulticallUI]
    && ([(PHAudioCallViewController *)self prioritizedCall],
        int v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v5 = [(PHAudioCallViewController *)self prioritizedCall];
    id v4 = [(PHAudioCallViewController *)self callParticipantsViewController];
    [v4 setPrioritizedCall:v5];
  }
  else
  {
    id v5 = [(PHAudioCallViewController *)self callParticipantsViewController];
    [v5 updateCallGroups];
  }
}

- (void)_updateStatusLabelVisibility
{
  id v12 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
  int v3 = [v12 singleCallLabelView];
  [(PHAudioCallViewController *)self updatePosterBadgeView:[(PHAudioCallViewController *)self callHasNoContactPoster] ^ 1 to:v3];
  if ([(PHAudioCallViewController *)self callHasContactPosterWithHorizontalName]|| ([(PHAudioCallViewController *)self screeningPosterNameViewModel], id v4 = [(PHAudioCallViewController *)self updateCallRecordingPositionIfNeeded];
  {
    id v5 = v3;
    uint64_t v6 = 1;
LABEL_4:
    [v5 setHidesLabel:v6];
    goto LABEL_5;
  }
  if (![(PHAudioCallViewController *)self callHasContactPosterWithVerticalName])
  {
    id v5 = v3;
    uint64_t v6 = 0;
    goto LABEL_4;
  }
  unsigned int v7 = [(PHAudioCallViewController *)self posterNameViewModel];
  unsigned int v8 = [v7 posterNameTextView];
  unsigned int v9 = [v8 callIsActive];

  id v10 = [(PHAudioCallViewController *)self posterNameViewModel];
  char v11 = [v10 posterNameTextView];
  LODWORD(v8) = [v11 statusIsSuitableForVerticalLayout];

  [v3 setHidesLabel:v8 & ~v9];
  [v3 hideBadgesOnly];
LABEL_5:
}

- (BOOL)isShowingPosterBadge
{
  id v2 = [(PHAudioCallViewController *)self posterBadgeView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updatePosterBadgeView:(BOOL)a3 to:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (v4
    && [(PHAudioCallViewController *)self canShowPosterBadgeInAudioCallView:v9])
  {
    [(PHAudioCallViewController *)self setUpPosterBadgeViewIfNecessary];
  }
  else
  {
    uint64_t v6 = [(PHAudioCallViewController *)self posterBadgeView];

    if (v6)
    {
      unsigned int v7 = [(PHAudioCallViewController *)self posterBadgeView];
      [v7 removeFromSuperview];

      [(PHAudioCallViewController *)self setPosterBadgeView:0];
    }
  }
  unsigned int v8 = [(PHAudioCallViewController *)self posterBadgeView];
  [v9 setPosterBadgeView:v8];

  [(PHAudioCallViewController *)self synchronizeSingleLabelViewWithPosterText];
}

- (void)synchronizeSingleLabelViewWithPosterText
{
  id v5 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
  BOOL v3 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];

  if (v3)
  {
    BOOL v4 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
    [v4 updateViewModelForParticipantsView:v5];
  }
  else
  {
    [(PHAudioCallViewController *)self updatePosterViewModelForParticipantsView:v5];
  }
}

- (void)setUpPosterBadgeViewIfNecessary
{
  BOOL v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle] == (id)3)
  {
    BOOL v4 = [(PHAudioCallViewController *)self features];
    unsigned __int8 v5 = [v4 isDominoEnabled];

    if (v5) {
      return;
    }
  }
  else
  {
  }
  uint64_t v6 = [(PHAudioCallViewController *)self posterBadgeView];

  if (v6) {
    return;
  }
  id v14 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
  unsigned int v7 = [v14 singleCallLabelView];
  unsigned int v8 = [v7 iconView];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)UIImageView);
LABEL_10:
    id v10 = v9;
    goto LABEL_11;
  }
  id v10 = [v7 badgeView];

  if (v10)
  {
    id v9 = [objc_alloc((Class)TPBadgeView) initWithTitle:&stru_1002D6110 theme:1];
    goto LABEL_10;
  }
LABEL_11:
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v11 = [(PHAudioCallViewController *)self view];
  [v11 addSubview:v10];

  [(PHAudioCallViewController *)self positionPosterBadgeToBeHorizontallyCenteredToInfoButton:v10];
  [(PHAudioCallViewController *)self setPosterBadgeView:v10];
  id v12 = [(PHAudioCallViewController *)self posterBadgeView];
  double v13 = +[TPIncomingCallMetricsProvider posterBadgeMaxSize];
  [v12 setMaximumContentSizeCategory:v13];

  [(PHAudioCallViewController *)self invertColorForPosterBadgeViewIfSnapshotPoster];
}

- (void)invertColorForPosterBadgeViewIfSnapshotPoster
{
  BOOL v3 = [(PHAudioCallViewController *)self snapshottedPosterImageToUseForColorInversion];

  if (v3)
  {
    id v4 = [(PHAudioCallViewController *)self snapshottedPosterImageToUseForColorInversion];
    [(PHAudioCallViewController *)self invertColorForPosterBadgeViewBasedOn:v4];
  }
}

- (void)_updatePosterStatusLabelForState:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  unsigned __int8 v5 = [(PHAudioCallViewController *)self posterNameViewModel];

  if (v5)
  {
    uint64_t v6 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
    unsigned int v7 = [(PHAudioCallViewController *)self posterNameViewModel];
    [v7 updateStatusFromParticipantsView:v6];

    if (v3 <= 0xB && ((1 << v3) & 0x814) != 0)
    {
      [(PHAudioCallViewController *)self _updatePosterNameAlpha];
      unsigned int v8 = [(PHAudioCallViewController *)self view];
      id v9 = [v8 window];

      BOOL v10 = v9 != 0;
      if ([(PHAudioCallViewController *)self shouldShowNewPosterUpdates])
      {
        dispatch_time_t v11 = dispatch_time(0, 850000000);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000E3188;
        v13[3] = &unk_1002CD918;
        v13[4] = self;
        BOOL v14 = v10;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);
      }
      else
      {
        id v12 = [(PHAudioCallViewController *)self posterNameViewModel];
        [v12 transitionCallToActiveStateAnimated:v10];
      }
    }
    [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
  }
}

- (void)_updatePosterNameAlpha
{
  unsigned int v3 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
  if (v3
    || ([(PHAudioCallViewController *)self posterNameViewModel],
        (unsigned int v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v4 = 0.0;
    if (!self->_participantsViewIsShowingMultipleLabel) {
      double v4 = 1.0;
    }
    id v9 = v3;
    [v3 updatePosterNameAlpha:v4];
    uint64_t v5 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      unsigned int v7 = [(PHAudioCallViewController *)self posterNameViewModel];

      if (v7)
      {
        unsigned int v8 = [(PHAudioCallViewController *)self posterNameViewModel];
        [v8 updatePosterNameAlpha:0.0];
      }
    }
    unsigned int v3 = v9;
  }
}

- (void)setRingingState:(unsigned __int16)a3
{
  double v4 = [(PHAudioCallViewController *)self presentedViewController];

  if (v4) {
    [(PHAudioCallViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(PHAudioCallViewController *)self updateShouldShowLargeAvatar];
  uint64_t v5 = +[UIApplication sharedApplication];
  uint64_t v6 = [v5 delegate];
  unsigned int v7 = [v6 currentInCallScene];
  unsigned int v8 = [v7 isBeingShownAboveCoverSheet];

  id v9 = [(PHAudioCallViewController *)self callCenter];
  id v25 = [v9 incomingCall];

  unsigned int v10 = [(PHAudioCallViewController *)self setCallForBackgroundImage:v25 animated:1 callDisplayStyleChanged:0];
  uint64_t v11 = 4;
  if (v10) {
    uint64_t v11 = 5;
  }
  if (v8) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  double v13 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v13 callDisplayStyle] == (id)3)
  {
    BOOL v14 = [(PHAudioCallViewController *)self features];
    unsigned int v15 = [v14 isDominoEnabled];

    if (v15) {
      uint64_t v12 = 0;
    }
  }
  else
  {
  }
  id v16 = [v25 isMessagingAllowed];
  double v17 = [(PHCallViewController *)self bottomBar];
  [v17 setDeclineAndMessageIsAvailable:v16];

  id v18 = [v25 isReminderAllowed];
  int v19 = [(PHCallViewController *)self bottomBar];
  [v19 setDeclineAndRemindIsAvailable:v18];

  double v20 = [(PHCallViewController *)self bottomBar];
  [v20 setCurrentState:v12];

  [(PHAudioCallViewController *)self setMiddleViewState:0 animated:0];
  id v21 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  id v22 = [v21 callDisplayStyle];

  if (!v22)
  {
    double v23 = [(PHAudioCallViewController *)self callParticipantsViewController];
    [v23 setBannerButtonsState:0];
  }
  double v24 = [(PHCallViewController *)self bottomBar];
  [(PHAudioCallViewController *)self _testing_didTransitionToIncomingRingingCallState:v24];
}

- (void)setWaitingState:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  uint64_t v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134217984;
    uint64_t v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setWaitingState: %lu", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v6 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v7 = [v6 incomingCall];

  unsigned int v8 = +[UIApplication sharedApplication];
  id v9 = [v8 delegate];
  unsigned __int8 v10 = [v9 isPresentingAmbient];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [v7 provider];
    if ([v11 supportsDynamicSystemUI])
    {
      uint64_t v12 = [(PHAudioCallViewController *)self featureFlags];
      if ([v12 groupConversations])
      {
        char HasChinaSKU = TUDeviceHasChinaSKU();

        if (HasChinaSKU) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
LABEL_10:
    BOOL v14 = [(PHCallViewController *)self inCallRootViewController];
    [v14 requestInCallSceneTransitionToFullScreen];
  }
LABEL_11:
  [(PHAudioCallViewController *)self setShouldShowLargeAvatarForCallWaiting:[(PHAudioCallViewController *)self shouldShowLargeAvatarForCall:v7]];
  [(PHAudioCallViewController *)self setCallForBackgroundImage:v7 animated:1 callDisplayStyleChanged:0];
  if ([(PHAudioCallViewController *)self participantsViewControllersShouldIgnoreUpdates])
  {
    unsigned int v15 = [(PHAudioCallViewController *)self callCenter];
    unsigned __int8 v16 = [v15 autoPunchOutBehaviorRequiredForCurrentCalls];

    if ((v16 & 1) == 0) {
      [(PHAudioCallViewController *)self setParticipantsViewControllersShouldIgnoreUpdates:0];
    }
  }
  [(PHAudioCallViewController *)self setShowsCallWaitingParticipantView:1];
  id v17 = [v7 isMessagingAllowed];
  id v18 = [(PHCallViewController *)self bottomBar];
  [v18 setDeclineAndMessageIsAvailable:v17];

  id v19 = [v7 isReminderAllowed];
  double v20 = [(PHCallViewController *)self bottomBar];
  [v20 setDeclineAndRemindIsAvailable:v19];

  id v21 = [(PHCallViewController *)self bottomBar];
  [v21 setUserInteractionEnabled:1];

  id v22 = [(PHCallViewController *)self bottomBar];
  [v22 setCurrentState:[self bottomBarStateForCallWaitingCall] animated:0 animationCompletionBlock:0];

  [(PHAudioCallViewController *)self setMiddleViewState:0 animated:1];
  [(PHCallViewController *)self setWantsApplicationDismissalStyle:0];
}

- (void)setEndedState:(unsigned __int16)a3
{
  double v4 = +[UIApplication sharedApplication];
  uint64_t v5 = [v4 delegate];
  uint64_t v6 = [(id)v5 mostRecentlyDisconnectedAudioCall];

  unsigned int v7 = [(PHAudioCallViewController *)self currentMiddleView];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    unsigned int v8 = [(PHAudioCallViewController *)self currentMiddleView];
    [v8 setButtonsEnabled:0];
  }
  [(SOSEmergencyCallVoiceLoopManager *)self->_voiceLoopManager invalidate];
  id v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v6 contactIdentifiers];
    id v10 = [v28 count];
    unsigned int v11 = [v6 isOutgoing];
    uint64_t v12 = [v6 dateConnected];
    double v13 = [v12 description];
    BOOL v14 = [v6 provider];
    unsigned int v15 = [v14 isFaceTimeProvider];
    unsigned __int8 v16 = +[FTDeviceSupport sharedInstance];
    *(_DWORD *)buf = 134219010;
    id v30 = v10;
    __int16 v31 = 1024;
    unsigned int v32 = v11;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 1024;
    unsigned int v36 = v15;
    __int16 v37 = 1024;
    unsigned int v38 = [v16 isGreenTea];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(disconnectedCall.contactIdentifiers.count: %lu && \n\n !(disconnectedCall.isOutgoing: %d && disconnectedCall.dateConnected: %@) && \n\n disconnectedCall.provider.isFaceTimeProvider: %d \n\n [[FTDeviceSupport sharedInstance] isGreenTea]) : %d", buf, 0x28u);
  }
  if (![v6 disconnectedReasonRequiresCallBackUI]
    || ![(PHAudioCallViewController *)self isUserInterfaceShowing])
  {
    id v18 = [(PHAudioCallViewController *)self UUIDForLocallyDisconnectedCall];
    id v19 = [v6 callUUID];
    if ([v18 isEqualToString:v19])
    {
    }
    else
    {
      double v20 = +[UIApplication sharedApplication];
      id v21 = [v20 delegate];
      unsigned int v22 = [v21 hasExistingFullScreenInCallScene];

      if (v22) {
        +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHAudioCallViewControllerDismissalAssertionWaitingForIdle"];
      }
    }
    int v23 = [(PHCallViewController *)self bottomBar];
    [v23 setUserInteractionEnabled:0];

    [(PHCallViewController *)self transitionToIdleAfterDelay];
    uint64_t v24 = [(PHCallViewController *)self inCallRootViewController];
    [v24 showFailureOrFallbackAlertIfNecessaryForCall:v6];
    goto LABEL_15;
  }
  [(PHAudioCallViewController *)self transitionToFullScreenIfNecessary];
  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"];
  [(PHAudioCallViewController *)self setMiddleViewState:0];
  [(PHAudioCallViewController *)self setCallForBackgroundImage:v6 animated:1 callDisplayStyleChanged:0];
  if [v6 service] == 2 && (objc_msgSend(v6, "isMessagingAllowed"))
  {
    uint64_t v17 = 17;
  }
  else if ([v6 isCallbackAllowed])
  {
    uint64_t v17 = 13;
  }
  else
  {
    uint64_t v17 = 18;
  }
  id v26 = [(PHCallViewController *)self bottomBar];
  [v26 setCurrentState:v17 animated:1 animationCompletionBlock:0];

  double v27 = [(PHCallViewController *)self bottomBar];
  [v27 setUserInteractionEnabled:1];

  if ([(PHAudioCallViewController *)self shouldShowEnableWiFiCallingAlertForCall:v6])
  {
    uint64_t v24 = +[UIAlertController enableWiFiCallingAlertController];
    if (v24)
    {
      [(PHAudioCallViewController *)self presentViewController:v24 animated:1 completion:0];
      sub_10009228C();
    }
LABEL_15:
  }
  if ([v6 disconnectedReason] == 34)
  {
    [(PHAudioCallViewController *)self setMiddleViewState:0];
    id v25 = sub_1000D5130();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController is about to set shouldPresentAlertButton to NO", buf, 2u);
    }

    self->_shouldPresentAlertButton = 0;
  }
}

- (void)setEndingState:(unsigned __int16)a3
{
  double v4 = [(PHCallViewController *)self bottomBar];
  [v4 setUserInteractionEnabled:0];

  uint64_t v5 = [(PHAudioCallViewController *)self currentMiddleView];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unsigned int v7 = [(PHAudioCallViewController *)self currentMiddleView];
    [v7 setButtonsEnabled:0];
  }
  [(SOSEmergencyCallVoiceLoopManager *)self->_voiceLoopManager invalidate];
  unsigned int v8 = [(PHAudioCallViewController *)self isolatedCall];
  if (v8)
  {
    id v9 = v8;
    [(PHAudioCallViewController *)self setCallForBackgroundImage:v8 animated:0 callDisplayStyleChanged:0];
    unsigned int v8 = v9;
  }
}

- (void)setOutgoingRingingState:(unsigned __int16)a3
{
  double v4 = [(PHAudioCallViewController *)self callCenter];
  uint64_t v5 = [v4 currentCallGroups];

  char v6 = [v5 lastObject];
  if ([v6 originatingUIType] == 10)
  {
    unsigned int v7 = [(PHAudioCallViewController *)self callCenter];
    unsigned int v8 = [v7 routeController];
    id v9 = [v8 pickedRoute];
    unsigned __int8 v10 = [v9 isSpeaker];

    if ((v10 & 1) == 0)
    {
      id v19 = [(PHAudioCallViewController *)self callCenter];
      double v20 = [v19 routeController];
      uint64_t v17 = [v20 routeForSpeakerEnable];

      if (!v17)
      {
        id v18 = sub_1000D5130();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1001EC210();
        }
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  if ([v6 originatingUIType] == 12)
  {
    unsigned int v11 = [(PHAudioCallViewController *)self callCenter];
    uint64_t v12 = [v11 routeController];
    double v13 = [v12 pickedRoute];
    unsigned __int8 v14 = [v13 isReceiver];

    if ((v14 & 1) == 0)
    {
      unsigned int v15 = [(PHAudioCallViewController *)self callCenter];
      unsigned __int8 v16 = [v15 routeController];
      uint64_t v17 = [v16 routeForSpeakerDisable];

      if (!v17)
      {
        id v18 = sub_1000D5130();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] PHAudioCallViewController: Could not find available route to pick for speaker disable", buf, 2u);
        }
        goto LABEL_12;
      }
LABEL_9:
      id v18 = [(PHAudioCallViewController *)self callCenter];
      id v21 = [v18 routeController];
      [v21 pickRoute:v17];

LABEL_12:
    }
  }
  unsigned int v22 = [(PHAudioCallViewController *)self isolatedCall];
  [(PHAudioCallViewController *)self setCallForBackgroundImage:v22 animated:1 callDisplayStyleChanged:0];

  v39 = _NSConcreteStackBlock;
  uint64_t v40 = 3221225472;
  char v41 = sub_1000E40C4;
  v42 = &unk_1002CDA70;
  id v23 = v6;
  id v43 = v23;
  char v44 = self;
  uint64_t v24 = objc_retainBlock(&v39);
  -[PHAudioCallViewController setMiddleViewState:animated:completion:](self, "setMiddleViewState:animated:completion:", 1, objc_msgSend(v23, "isVoicemail", v39, v40, v41, v42) ^ 1, v24);
  id v25 = [(PHAudioCallViewController *)self currentMiddleView];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    double v27 = [(PHAudioCallViewController *)self currentMiddleView];
    [v27 setButtonsEnabled:1];
  }
  if ([v23 isVoicemail]) {
    [(PHAudioCallViewController *)self setMiddleViewState:2];
  }
  [(PHCallViewController *)self setWantsApplicationDismissalStyle:1];
  id v28 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v28 callDisplayStyle] != (id)3) {
    goto LABEL_24;
  }
  unsigned int v29 = [(PHAudioCallViewController *)self features];
  if (![v29 isDominoEnabled]) {
    goto LABEL_23;
  }
  id v30 = +[UIApplication sharedApplication];
  __int16 v31 = [v30 delegate];
  unsigned int v32 = [v31 currentInCallScene];
  id v33 = [v32 presentationMode];

  if (!v33)
  {
    id v34 = [(PHAudioCallViewController *)self callCenter];
    id v28 = [v34 routeController];

    uint64_t v35 = [v28 routeForSpeakerEnable];
    if (!v35) {
      goto LABEL_24;
    }
    unsigned int v36 = (void *)v35;
    __int16 v37 = [v28 pickedRoute];
    unsigned int v38 = [v37 isReceiver];

    if (!v38) {
      goto LABEL_24;
    }
    unsigned int v29 = [v28 routeForSpeakerEnable];
    [v28 pickRoute:v29];
LABEL_23:

LABEL_24:
  }
}

- (void)setCallBufferState:(unsigned __int16)a3
{
  double v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController,setCurrentState,PHInCallStateCallBuffer", (uint8_t *)buf, 2u);
  }

  if ([(PHAudioCallViewController *)self middleViewState] == 1)
  {
    uint64_t v5 = [(PHAudioCallViewController *)self currentMiddleView];
    [v5 setButtonsEnabled:0];

    char v6 = [(PHAudioCallViewController *)self currentMiddleView];
    unsigned int v7 = [v6 buttonForControlType:15];
    [v7 setEnabled:1];
  }
  else
  {
    objc_initWeak(buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E42D4;
    v9[3] = &unk_1002CDBE0;
    objc_copyWeak(&v10, buf);
    [(PHAudioCallViewController *)self setMiddleViewState:1 animated:1 completion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
  unsigned int v8 = [(PHCallViewController *)self bottomBar];
  [v8 setUserInteractionEnabled:1];

  [(PHAudioCallViewController *)self setCallForBackgroundImage:0 animated:1 callDisplayStyleChanged:0];
  [(PHAudioCallViewController *)self displayDialledNumberDetailsForCallBufferScreen];
  [(PHCallViewController *)self setWantsApplicationDismissalStyle:0];
  [(PHAudioCallViewController *)self startCallBufferScreenCountdown];
}

- (void)setAlertModeNeededState:(unsigned __int16)a3
{
  if ([(PHAudioCallViewController *)self shouldPresentAlertButton])
  {
    double v4 = [(PHCallViewController *)self bottomBar];
    [v4 setUserInteractionEnabled:1];

    if ([(PHAudioCallViewController *)self middleViewState] == 2)
    {
      uint64_t v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController skips updating bottomBarButton to alert style since keypad is expanded", v6, 2u);
      }
    }
    else
    {
      uint64_t v5 = [(PHCallViewController *)self bottomBar];
      [v5 setCurrentState:22];
    }

    [(PHAudioCallViewController *)self speakAlertUtteranceIfNecessary];
  }
}

- (void)setEmergencyTextViaSatelliteUI
{
  id v38 = [(PHAudioCallViewController *)self features];
  if ([v38 isButtonLayoutEnabled])
  {

LABEL_3:
    unsigned int v3 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
    double v4 = [v3 singleCallLabelView];
    uint64_t v5 = [v4 statusLabel];

    char v6 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];

    if (!v6)
    {
      unsigned int v7 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];
      [v7 removeFromSuperview];

      [(PHAudioCallViewController *)self setDefaultBackgroundGradientView:0];
      unsigned int v8 = +[UIColor blackColor];
      id v9 = [(PHAudioCallViewController *)self view];
      [v9 setBackgroundColor:v8];

      id v10 = objc_alloc_init((Class)UILabel);
      unsigned int v11 = [v5 text];
      [v10 setText:v11];

      uint64_t v12 = [v5 font];
      [v10 setFont:v12];

      [v10 setNumberOfLines:3];
      [v10 setTextAlignment:1];
      double v13 = [v5 textColor];
      [v10 setTextColor:v13];

      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHAudioCallViewController *)self setEmergencyTextViaSatelliteLabel:v10];
      unsigned __int8 v14 = [(PHAudioCallViewController *)self view];
      [v14 addSubview:v10];

      id v39 = [v10 leadingAnchor];
      __int16 v37 = [v3 leadingAnchor];
      unsigned int v36 = [v39 constraintEqualToAnchor:v37];
      v40[0] = v36;
      uint64_t v35 = [v10 trailingAnchor];
      id v34 = [v3 trailingAnchor];
      id v33 = [v35 constraintEqualToAnchor:v34];
      v40[1] = v33;
      __int16 v31 = [v10 centerXAnchor];
      unsigned int v32 = [(PHAudioCallViewController *)self view];
      id v30 = [v32 centerXAnchor];
      unsigned int v15 = [v31 constraintEqualToAnchor:v30];
      v40[2] = v15;
      unsigned __int8 v16 = [v10 centerYAnchor];
      uint64_t v17 = [(PHAudioCallViewController *)self view];
      id v18 = [v17 centerYAnchor];
      id v19 = [v16 constraintEqualToAnchor:v18];
      v40[3] = v19;
      +[NSArray arrayWithObjects:v40 count:4];
      id v21 = v20 = v3;
      +[NSLayoutConstraint activateConstraints:v21];

      unsigned int v3 = v20;
    }
    unsigned int v22 = [(PHCallViewController *)self bottomBar];
    if ([v22 currentState] == (id)19) {
      double v23 = 0.0;
    }
    else {
      double v23 = 1.0;
    }
    uint64_t v24 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];
    [v24 setAlpha:v23];

    id v25 = [(PHCallViewController *)self bottomBar];
    if ([v25 currentState] == (id)19) {
      double v26 = 1.0;
    }
    else {
      double v26 = 0.0;
    }
    [v5 setAlpha:v26];

    return;
  }
  double v27 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v27 callDisplayStyle] == (id)3)
  {
    id v28 = [(PHAudioCallViewController *)self features];
    unsigned int v29 = [v28 isDominoEnabled];

    if (!v29) {
      return;
    }
    goto LABEL_3;
  }
}

- (void)removeEmergencyTextViaSatelliteUI
{
  if (![(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    id v13 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v13 callDisplayStyle] != (id)3)
    {
LABEL_9:
      unsigned int v7 = v13;
      goto LABEL_10;
    }
    unsigned int v3 = [(PHAudioCallViewController *)self features];
    unsigned int v4 = [v3 isDominoEnabled];

    if (!v4) {
      return;
    }
  }
  uint64_t v5 = [(PHAudioCallViewController *)self frontmostCall];
  id v13 = v5;
  if (!v5 || (v6 = [v5 isEmergency], unsigned int v7 = v13, v6))
  {
    [(PHAudioCallViewController *)self addDefaultBackgroundGradientView];
    unsigned int v8 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
    id v9 = [v8 singleCallLabelView];
    id v10 = [v9 statusLabel];

    [v10 setAlpha:1.0];
    unsigned int v11 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];

    if (v11)
    {
      uint64_t v12 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];
      [v12 removeFromSuperview];

      [(PHAudioCallViewController *)self setEmergencyTextViaSatelliteLabel:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)setScreeningState:(unsigned __int16)a3 animated:(BOOL)a4
{
}

- (void)setScreeningState:(unsigned __int16)a3 animated:(BOOL)a4 overrideWithIsUnlocked:(BOOL)a5
{
  BOOL v6 = a5;
  BOOL v62 = a4;
  unsigned int v65 = a3;
  unsigned int v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v65;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Audio: setCurrentState: (existing state is %d) with unlockedOverride: %d", buf, 0xEu);
  }

  id v9 = [(PHAudioCallViewController *)self features];
  unsigned int v10 = [v9 lvm_stopEnabled];

  if (v10) {
    [(PHAudioCallViewController *)self setShowsBlockButton:0];
  }
  unsigned int v11 = [(PHCallViewController *)self bottomBar];
  [v11 setUserInteractionEnabled:1];

  uint64_t v12 = [(PHAudioCallViewController *)self presentedViewController];
  if (v12)
  {
    unsigned __int8 v13 = [(PHCallViewController *)self isPresentingCustomMessageController];

    if ((v13 & 1) == 0) {
      [(PHAudioCallViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  unsigned __int8 v14 = [(PHAudioCallViewController *)self traitCollection];
  if ([v14 _backlightLuminance] == (id)1)
  {
    BOOL v15 = 1;
  }
  else
  {
    unsigned __int8 v16 = [(PHAudioCallViewController *)self traitCollection];
    BOOL v15 = [v16 _backlightLuminance] == 0;
  }
  uint64_t v17 = +[UIApplication sharedApplication];
  id v18 = [v17 delegate];
  id v19 = [v18 currentInCallScene];
  unsigned int v20 = [v19 isBeingShownAboveCoverSheet];

  id v21 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  int v64 = v20 & !v6 | v15;
  if ([v21 callDisplayStyle] == (id)3)
  {
    unsigned int v22 = [(PHAudioCallViewController *)self features];
    unsigned int v23 = [v22 isDominoEnabled];
    uint64_t v24 = 23;
    if (v64) {
      uint64_t v25 = 24;
    }
    else {
      uint64_t v25 = 23;
    }
    if (!v23) {
      uint64_t v24 = v25;
    }
    uint64_t v63 = v24;
  }
  else
  {
    uint64_t v26 = 23;
    if ((v20 & !v6 | v15)) {
      uint64_t v26 = 24;
    }
    uint64_t v63 = v26;
  }

  double v27 = [(PHAudioCallViewController *)self callCenter];
  objc_super v66 = [v27 screeningCall];

  id v28 = sub_1000D5130();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (v64) {
      CFStringRef v29 = @"YES";
    }
    else {
      CFStringRef v29 = @"NO";
    }
    if (v15) {
      CFStringRef v30 = @"YES";
    }
    else {
      CFStringRef v30 = @"NO";
    }
    if (v20) {
      CFStringRef v31 = @"YES";
    }
    else {
      CFStringRef v31 = @"NO";
    }
    unsigned int v32 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v33 = [v32 callDisplayStyle];
    CFStringRef v34 = @"NO";
    if (v33 == (id)3)
    {
      uint64_t v5 = [(PHAudioCallViewController *)self features];
      if ([v5 isDominoEnabled]) {
        CFStringRef v34 = @"YES";
      }
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    unsigned int v76 = (void (*)(uint64_t, uint64_t))v31;
    LOWORD(v77[0]) = 2112;
    *(id *)((char *)v77 + 2) = (id)v34;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Audio: setCurrentState: showLockedState: %@, displayIsOff: %@, beingShownAboveCoverSheet: %@, isAmbient: %@", buf, 0x2Au);
    if (v33 == (id)3) {
  }
    }
  uint64_t v35 = [(PHAudioCallViewController *)self featureFlags];
  if (TUCallScreeningEnabledM3())
  {
    unsigned int v36 = [v66 contactIdentifiers];
    BOOL v37 = [v36 count] != 0;

    if (((v64 | v37) & 1) == 0)
    {
      id v38 = [(PHAudioCallViewController *)self features];
      unsigned int v39 = [v38 lvm_stopEnabled];

      if (v39) {
        [(PHAudioCallViewController *)self setShowsBlockButton:1];
      }
      uint64_t v63 = 25;
    }
  }
  else
  {
  }
  [(PHAudioCallViewController *)self setCallForBackgroundImage:v66 animated:1 callDisplayStyleChanged:0];
  id v40 = [v66 isMessagingAllowed];
  char v41 = [(PHCallViewController *)self bottomBar];
  [v41 setDeclineAndMessageIsAvailable:v40];

  id v42 = [v66 isReminderAllowed];
  id v43 = [(PHCallViewController *)self bottomBar];
  [v43 setDeclineAndRemindIsAvailable:v42];

  char v44 = [(PHCallViewController *)self bottomBar];
  uint64_t v45 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v45 callDisplayStyle] == (id)3)
  {
    v46 = [(PHAudioCallViewController *)self features];
    [v44 setCurrentState:v63 animated:[v46 isDominoEnabled] animationCompletionBlock:0];
  }
  else
  {
    [v44 setCurrentState:v63 animated:0 animationCompletionBlock:0];
  }

  id v47 = [(PHCallViewController *)self bottomBar];
  id v48 = [v47 controlForActionType:28];

  [(PHCallViewController *)self configureDeclineWithReminderButton:0 declineWithMessageButton:v48 forIncomingCall:v66];
  [(PHAudioCallViewController *)self setMiddleViewState:4 animated:1];
  v49 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  BOOL v50 = [v49 callDisplayStyle] == 0;

  if (v50)
  {
    v51 = [(PHAudioCallViewController *)self callParticipantsViewController];
    [v51 setBannerButtonsState:0];
  }
  v52 = [(PHCallViewController *)self bottomBar];
  [(PHAudioCallViewController *)self _testing_didTransitionToIncomingRingingCallState:v52];

  id v53 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v53 callDisplayStyle] == (id)3)
  {
    id v54 = [(PHAudioCallViewController *)self features];
    unsigned int v55 = [v54 isDominoEnabled];

    if (v55)
    {
      [(PHAudioCallViewController *)self layoutParticipantsViewAnimated:v62];
      [(PHAudioCallViewController *)self updateBottomBarAlphaWithCurrentState:v65];
    }
  }
  else
  {
  }
  unsigned __int8 v56 = [(PHAudioCallViewController *)self stateChangeLockObservation];
  if (!v56
    || ([(PHAudioCallViewController *)self stateDisplayChangedObservation],
        v57 = objc_claimAutoreleasedReturnValue(),
        BOOL v58 = v57 == 0,
        v57,
        v56,
        v58))
  {
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    char v74 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3042000000;
    unsigned int v76 = sub_1000E5288;
    v77[0] = sub_1000E5294;
    objc_initWeak(&v77[1], self);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1000E529C;
    v71[3] = &unk_1002D0740;
    v71[4] = buf;
    v71[5] = v73;
    __int16 v72 = v65;
    v59 = [(PHAudioCallViewController *)self makeLockObserverWithHandler:v71];
    [(PHAudioCallViewController *)self setStateChangeLockObservation:v59];

    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    id v70 = 0;
    id v60 = [(PHAudioCallViewController *)self traitCollection];
    id v61 = [v60 _backlightLuminance];

    id v70 = v61;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1000E53BC;
    v67[3] = &unk_1002D0768;
    v67[4] = buf;
    v67[5] = v69;
    v67[6] = v73;
    __int16 v68 = v65;
    [(PHAudioCallViewController *)self setStateDisplayChangedObservation:v67];
    _Block_object_dispose(v69, 8);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v77[1]);
    _Block_object_dispose(v73, 8);
  }
}

- (void)setCurrentState:(unsigned __int16)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  unsigned int v7 = [(PHCallViewController *)self currentState];
  unsigned int v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v38 = v5;
    __int16 v39 = 1024;
    unsigned int v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Audio: setCurrentState: %d (existing state is %d)", buf, 0xEu);
  }

  if (v7 != v5)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [(PHCallViewController *)self currentState];
      *(_DWORD *)buf = 67109376;
      unsigned int v38 = v10;
      __int16 v39 = 1024;
      unsigned int v40 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Audio: Setting current state: %d -> %d", buf, 0xEu);
    }

    v36.receiver = self;
    v36.super_class = (Class)PHAudioCallViewController;
    [(PHCallViewController *)&v36 setCurrentState:v5];
    [(PHAudioCallViewController *)self setStateChangeLockObservation:0];
    [(PHAudioCallViewController *)self setStateDisplayChangedObservation:0];
    unsigned int v11 = [(PHAudioCallViewController *)self features];
    unsigned int v12 = [v11 lvm_stopEnabled];

    if (v12) {
      [(PHAudioCallViewController *)self setShowsBlockButton:0];
    }
    switch((int)v5)
    {
      case 0:
        [(PHAudioCallViewController *)self setIdleState:0];
        goto LABEL_24;
      case 1:
        [(PHAudioCallViewController *)self setRingingState:1];
        goto LABEL_24;
      case 2:
        [(PHAudioCallViewController *)self setOutgoingRingingState:2];
        goto LABEL_24;
      case 3:
        [(PHAudioCallViewController *)self setWaitingState:3];
        goto LABEL_50;
      case 4:
      case 5:
        unsigned int v13 = [(PHAudioCallViewController *)self usesCompactMulticallUI];
        if (v5 == 5 && v13)
        {
          unsigned __int8 v14 = [(PHAudioCallViewController *)self callDisplayStyleManager];
          if ([v14 callDisplayStyle] == (id)3)
          {
            BOOL v15 = [(PHAudioCallViewController *)self features];
            unsigned __int8 v16 = [v15 isDominoEnabled];

            if (v16) {
              return;
            }
          }
          else
          {
          }
          [(PHAudioCallViewController *)self updateBottomBarAlphaWithCurrentState:5];
          return;
        }
        [(PHAudioCallViewController *)self setActiveState:v5];
LABEL_24:
        if (v7 == 3) {
          [(PHAudioCallViewController *)self setShowsCallWaitingParticipantView:0];
        }
        if (v5 <= 7 && ((1 << v5) & 0xC1) != 0) {
          goto LABEL_28;
        }
LABEL_50:
        unsigned int v32 = [(PHCallViewController *)self bottomBar];
        [v32 setUserInteractionEnabled:1];

        if (v5 == 1) {
          [(PHAudioCallViewController *)self startSuppressionOfSTKAlerts];
        }
        else {
LABEL_28:
        }
          [(PHAudioCallViewController *)self stopSuppressionOfSTKAlerts];
        uint64_t v17 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        if ([v17 callDisplayStyle] == (id)3)
        {
          id v18 = [(PHAudioCallViewController *)self features];
          unsigned __int8 v19 = [v18 isDominoEnabled];

          if (v19)
          {
LABEL_34:
            if (![(PHAudioCallViewController *)self shouldUseHeroImageLayout])
            {
              unsigned int v20 = [(PHAudioCallViewController *)self callDisplayStyleManager];
              if ([v20 callDisplayStyle] != (id)3)
              {
LABEL_41:

                goto LABEL_42;
              }
              id v21 = [(PHAudioCallViewController *)self features];
              if (![v21 isDominoEnabled])
              {
LABEL_40:

                goto LABEL_41;
              }
            }
            if (v5 != 7)
            {
LABEL_42:
              if ([(PHAudioCallViewController *)self shouldShowNewPosterUpdates])
              {
                dispatch_time_t v24 = dispatch_time(0, 950000000);
                v33[0] = _NSConcreteStackBlock;
                v33[1] = 3221225472;
                v33[2] = sub_1000E5AE0;
                v33[3] = &unk_1002CD778;
                v33[4] = self;
                __int16 v34 = v5;
                dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, v33);
              }
              else
              {
                [(PHAudioCallViewController *)self _updatePosterStatusLabelForState:v5];
                if ([(PHAudioCallViewController *)self hasNoCallsOrOnlyEndedCalls])
                {
                  uint64_t v25 = [(PHAudioCallViewController *)self renderingViewController];
                  if (v25)
                  {
                    uint64_t v26 = (void *)v25;
                    double v27 = [(PHAudioCallViewController *)self posterNameViewModel];
                    id v28 = [v27 priorityPosterNameTextView];

                    if (v28)
                    {
                      CFStringRef v29 = [(PHAudioCallViewController *)self renderingViewController];
                      CFStringRef v30 = [v29 view];
                      [v30 setAlpha:0.0];
                    }
                  }
                }
              }
              [(PHAudioCallViewController *)self updateAmbientAudioRoutesVisibility];
              [(PHAudioCallViewController *)self updateShareNameAndPhotoHUDPresentationIfNeeded];
              CFStringRef v31 = +[NSNotificationCenter defaultCenter];
              [v31 postNotificationName:@"PHCallViewControllerStateChangedNotification" object:0];

              return;
            }
            unsigned int v20 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
            id v21 = [v20 singleCallLabelView];
            unsigned int v22 = [v21 statusLabel];
            long long v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
            v35[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
            v35[1] = v23;
            v35[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
            [v22 setTransform:v35];

            goto LABEL_40;
          }
        }
        else
        {
        }
        [(PHAudioCallViewController *)self updateBottomBarAlphaWithCurrentState:v5];
        goto LABEL_34;
      case 6:
        [(PHAudioCallViewController *)self setEndingState:6];
        [(PHAudioCallViewController *)self _testing_didTransitionToEndingCallState];
        goto LABEL_24;
      case 7:
        [(PHAudioCallViewController *)self setEndedState:7];
        goto LABEL_24;
      case 8:
      case 9:
        [(PHAudioCallViewController *)self setAlertModeNeededState:v5];
        goto LABEL_24;
      case 10:
        [(PHAudioCallViewController *)self setCallBufferState:10];
        goto LABEL_24;
      case 11:
        [(PHAudioCallViewController *)self setScreeningState:11 animated:v4];
        goto LABEL_24;
      default:
        goto LABEL_24;
    }
  }
}

- (void)updateBottomBarAlphaWithCurrentState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v13 = [(PHAudioCallViewController *)self features];
  if ([v13 isButtonLayoutEnabled])
  {

    goto LABEL_5;
  }
  uint64_t v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v5 callDisplayStyle] == (id)3)
  {
    BOOL v6 = [(PHAudioCallViewController *)self features];
    unsigned int v7 = [v6 isDominoEnabled];

    if (!v7) {
      return;
    }
LABEL_5:
    unsigned int v8 = (unsigned __int16)(((unsigned __int16)(v3 - 1) >> 1) | (((_WORD)v3 - 1) << 15));
    BOOL v9 = v8 > 5 || ((1 << ((unsigned __int16)(v3 - 1) >> 1)) & 0x2B) == 0;
    if (v9
      || ([(PHAudioCallViewController *)self callDisplayStyleManager],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          ![(id)v3 callDisplayStyle]))
    {
      unsigned int v10 = [(PHAudioCallViewController *)self middleViewState];
      if (v8 <= 5 && ((1 << v8) & 0x2B) != 0) {

      }
      if (v10 != 2)
      {
        unsigned int v11 = [(PHCallViewController *)self bottomBar];
        id v13 = v11;
        double v12 = 0.0;
        goto LABEL_19;
      }
    }
    else
    {
    }
    unsigned int v11 = [(PHCallViewController *)self bottomBar];
    id v13 = v11;
    double v12 = 1.0;
LABEL_19:
    [v11 setAlpha:v12];
    goto LABEL_20;
  }

LABEL_20:
}

- (void)updateIncomingBottomBarControlState
{
  uint64_t v3 = [(PHCallViewController *)self bottomBar];
  id v4 = [v3 currentState];

  if (!v4)
  {
    uint64_t v5 = +[UIApplication sharedApplication];
    BOOL v6 = [v5 delegate];
    unsigned int v7 = [v6 currentInCallScene];
    if ([v7 isBeingShownAboveCoverSheet]) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 0;
    }

    id v9 = [(PHCallViewController *)self bottomBar];
    [v9 setCurrentState:v8];
  }
}

- (void)updateBottomBarButtonsWithCall:(id)a3
{
  id v4 = [a3 isMessagingAllowed];
  id v5 = [(PHCallViewController *)self bottomBar];
  [v5 setDeclineAndMessageIsAvailable:v4];
}

- (void)updateHardPauseDigitsState
{
  uint64_t v3 = [(PHAudioCallViewController *)self frontmostCall];
  BOOL v4 = [v3 hardPauseDigitsState] == 2;

  id v5 = [(PHCallViewController *)self bottomBar];
  [v5 setAction:23 enabled:v4];
}

- (void)transitionToFullScreenIfNecessary
{
  id v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if (![v7 callDisplayStyle])
  {
    uint64_t v3 = [(PHAudioCallViewController *)self view];
    BOOL v4 = [v3 window];
    id v5 = [v4 windowScene];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    id v7 = [(PHCallViewController *)self inCallRootViewController];
    [v7 requestInCallSceneTransitionToFullScreen];
  }
}

- (BOOL)isUserInterfaceShowing
{
  uint64_t v3 = +[ICSPreferences sharedPreferences];
  unsigned int v4 = [v3 hasAdoptedModernInCallAPI];

  if (!v4) {
    return [(PHAudioCallViewController *)self _appearState] == 2;
  }
  id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  BOOL v6 = [v5 callDisplayStyle] != (id)4;

  return v6;
}

- (id)isolatedCall
{
  id v2 = [(PHAudioCallViewController *)self callCenter];
  uint64_t v3 = [v2 currentCalls];

  if ([v3 count] == (id)1)
  {
    unsigned int v4 = [v3 firstObject];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (id)associatedCallGroupForCall:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(PHAudioCallViewController *)self callCenter];
  BOOL v6 = [v5 currentCallGroups];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v11 = [v10 calls];
        unsigned int v12 = [v11 containsObject:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)prioritizedCallIsInSameCallGroupAsCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self prioritizedCall];

  if (v5)
  {
    BOOL v6 = [(PHAudioCallViewController *)self associatedCallGroupForCall:v4];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 calls];
      id v9 = [(PHAudioCallViewController *)self prioritizedCall];
      unsigned __int8 v10 = [v8 containsObject:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)getParticipantsView_WaitingOrNot
{
  uint64_t v3 = [(PHAudioCallViewController *)self getParticipantsView_Waiting];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)getParticipantsView_Waiting
{
  id v2 = [(PHAudioCallViewController *)self callWaitingParticipantsViewController];
  uint64_t v3 = [v2 view];

  return v3;
}

- (id)getParticipantsView_NotWaiting
{
  id v2 = [(PHAudioCallViewController *)self callParticipantsViewController];
  uint64_t v3 = [v2 view];

  return v3;
}

- (BOOL)callHasNoContactPoster
{
  if (![(PHAudioCallViewController *)self canShowPosterImage]) {
    return 1;
  }
  uint64_t v3 = [(PHAudioCallViewController *)self renderingViewController];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)callHasContactPosterWithHorizontalName
{
  if ([(PHAudioCallViewController *)self callHasNoContactPoster]) {
    return 0;
  }
  else {
    return ![(PHAudioCallViewController *)self callHasContactPosterWithVerticalName];
  }
}

- (BOOL)callHasContactPosterWithVerticalName
{
  uint64_t v3 = [(PHAudioCallViewController *)self posterNameViewModel];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(PHAudioCallViewController *)self posterNameViewModel];
  id v5 = [v4 posterNameTextView];
  BOOL v6 = [v5 layout] == (id)1;

  return v6;
}

- (BOOL)canShowPosterBadgeInAudioCallView:(id)a3
{
  id v4 = a3;
  if ([(PHAudioCallViewController *)self participantsViewIsShowingMultipleLabel])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = [v4 badgeView];
    if (v6)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = [v4 iconView];
      BOOL v5 = v7 != 0;
    }
  }

  return v5;
}

- (BOOL)usesCompactMulticallUI
{
  uint64_t v3 = [(PHAudioCallViewController *)self features];
  if ([v3 callManagerEnabled])
  {
    id v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v4 callDisplayStyle] == (id)3)
    {
      BOOL v5 = [(PHAudioCallViewController *)self features];
      unsigned int v6 = [v5 isDominoEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)newPosterConfigurationForCall:(id)a3
{
  id v6 = a3;
  unsigned __int8 v7 = [(PHAudioCallViewController *)self shouldUseHeroImageLayout];
  if ((v7 & 1) == 0)
  {
    uint64_t v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v3 callDisplayStyle] == (id)3)
    {
      id v4 = [(PHAudioCallViewController *)self features];
      if ([v4 isDominoEnabled]) {
        goto LABEL_4;
      }
    }
    goto LABEL_20;
  }
LABEL_4:
  uint64_t v8 = [(PHAudioCallViewController *)self features];
  unsigned int v9 = [v8 isNameAndPhotoC3Enabled];

  if ((v7 & 1) == 0)
  {

    if (v9) {
      goto LABEL_8;
    }
LABEL_20:
    id v18 = 0;
    goto LABEL_21;
  }
  if (!v9) {
    goto LABEL_20;
  }
LABEL_8:
  unsigned __int8 v10 = [(PHAudioCallViewController *)self sharedProfileStateOracleForCall:v6];
  unsigned int v11 = [v10 pendingNickname];

  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = [v11 wallpaper];
  if (!v12) {
    goto LABEL_14;
  }
  id v13 = (void *)v12;
  long long v14 = [v11 wallpaper];
  long long v15 = [v14 wallpaperData];

  if (v15)
  {
    long long v16 = [v11 wallpaper];
    long long v17 = [v16 wallpaperData];

    id v18 = +[PRSPosterArchiver unarchiveConfigurationFromData:v17 error:0];
    unsigned __int8 v19 = sub_1000D5130();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [v6 uniqueProxyIdentifier];
      int v26 = 138412290;
      double v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: unarchived a pending PRSPosterConfiguration for %@", (uint8_t *)&v26, 0xCu);
    }
    id v21 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:v18 source:3];
    unsigned int v22 = [(PHAudioCallViewController *)self configurationCache];
    long long v23 = [v6 uniqueProxyIdentifier];
    [v22 setObject:v21 forKey:v23];
  }
  else
  {
LABEL_14:
    dispatch_time_t v24 = sub_1000D5130();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      double v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SNAP: there is no newPosterConfiguration, current pendingNickName is %@", (uint8_t *)&v26, 0xCu);
    }

    long long v17 = [(PHAudioCallViewController *)self configurationCache];
    id v21 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:0 source:3];
    unsigned int v22 = [v6 uniqueProxyIdentifier];
    [v17 setObject:v21 forKey:v22];
    id v18 = 0;
  }

LABEL_21:
  return v18;
}

- (id)sharedProfileStateOracleForCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 contactIdentifier];

  if (v5)
  {
    id v6 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v4];
    id v7 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v6];
    uint64_t v8 = [v4 contactIdentifier];
    unsigned int v9 = +[PHAudioCallViewController contactKeysToFetch];
    unsigned __int8 v10 = [(PHAudioCallViewController *)self contactsCache];
    unsigned int v11 = [v7 contactForIdentifier:v8 keysToFetch:v9 usingCache:v10];

    if (v11)
    {
      id v12 = [objc_alloc((Class)CNSharedProfileStateOracle) initWithContact:v11 contactStore:v7];
      id v13 = sub_1000D5130();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SNAP: current CNSharedProfileStateOracle is %@", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v4 uniqueProxyIdentifier];
      int v16 = 138412290;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: call doesn't have contactIdentifier %@", (uint8_t *)&v16, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

- (BOOL)currentCallStateCanShowNewPoster
{
  id v2 = self;
  uint64_t v3 = [(PHAudioCallViewController *)self frontmostCall];
  LOBYTE(v2) = [(PHAudioCallViewController *)v2 callStateCanShowNewPoster:v3];

  return (char)v2;
}

- (BOOL)callStateCanShowNewPoster:(id)a3
{
  id v6 = a3;
  unsigned __int8 v7 = [(PHAudioCallViewController *)self shouldUseHeroImageLayout];
  if (v7) {
    goto LABEL_2;
  }
  uint64_t v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle] != (id)3)
  {
LABEL_8:

    goto LABEL_13;
  }
  id v4 = [(PHAudioCallViewController *)self features];
  if (([v4 isDominoEnabled] & 1) == 0)
  {

    goto LABEL_8;
  }
LABEL_2:
  uint64_t v8 = [(PHAudioCallViewController *)self features];
  unsigned int v9 = [v8 isNameAndPhotoC3Enabled];

  if (v7)
  {
    if (!v9) {
      goto LABEL_13;
    }
  }
  else
  {

    if ((v9 & 1) == 0) {
      goto LABEL_13;
    }
  }
  if (v6)
  {
    if ([v6 status] == 1)
    {
      unsigned __int8 v10 = [(PHAudioCallViewController *)self callCenter];
      id v11 = [v10 currentCallCount];

      if ((unint64_t)v11 < 2)
      {
        BOOL v12 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)shouldShowNewPosterUpdates
{
  uint64_t v3 = [(PHAudioCallViewController *)self frontmostCall];
  if ([(PHAudioCallViewController *)self callStateCanShowNewPoster:v3]) {
    unsigned __int8 v4 = [objc_opt_class() posterSourceIsSyncedWithContacts:[self suggestedNewPosterSourceAfterCallConnects:v3]];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)finishNewPosterUpdatesWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  unsigned __int8 v7 = [(PHAudioCallViewController *)self shouldUseHeroImageLayout];
  if ((v7 & 1) == 0)
  {
    uint64_t v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v3 callDisplayStyle] == (id)3)
    {
      unsigned __int8 v4 = [(PHAudioCallViewController *)self features];
      if ([v4 isDominoEnabled]) {
        goto LABEL_4;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_4:
  uint64_t v8 = [(PHAudioCallViewController *)self features];
  unsigned int v9 = [v8 isNameAndPhotoC3Enabled];

  if (v7)
  {
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_8;
  }

  if (v9)
  {
LABEL_8:
    unsigned __int8 v10 = [(PHAudioCallViewController *)self frontmostCall];
    uint64_t v3 = v10;
    if (v10)
    {
      if ([v10 status] == 1)
      {
        id v11 = [(PHAudioCallViewController *)self callCenter];
        id v12 = [v11 currentCallCount];

        if ((unint64_t)v12 <= 1)
        {
          id v13 = [(PHAudioCallViewController *)self sharedProfileStateOracleForCall:v3];
          id v17 = 0;
          id v14 = [v13 updateContactAndNicknamesForAutoUpdateWithError:&v17];
          id v15 = v17;
          int v16 = sub_1000D5130();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v19 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SNAP: new poster update completed with error: %@", buf, 0xCu);
          }

          if (v6) {
            v6[2](v6, v13);
          }
        }
      }
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)canShowPosterImage
{
  if (![(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]
    || ([(PHAudioCallViewController *)self frontmostCall],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEmergency],
        v3,
        (v4 & 1) == 0))
  {
    if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout])
    {
LABEL_4:
      BOOL v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      BOOL v6 = [v5 callDisplayStyle] != 0;
LABEL_12:

      return v6;
    }
    unsigned __int8 v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v7 callDisplayStyle] == (id)3)
    {
      uint64_t v8 = [(PHAudioCallViewController *)self features];
      unsigned int v9 = [v8 isDominoEnabled];

      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    if (![(PHAudioCallViewController *)self wasPresentedAsBanner])
    {
      BOOL v5 = +[UIDevice currentDevice];
      BOOL v6 = [v5 userInterfaceIdiom] == 0;
      goto LABEL_12;
    }
  }
  return 0;
}

- (BOOL)canShowBackgroundImage
{
  if (![(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]
    || ([(PHAudioCallViewController *)self frontmostCall],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEmergency],
        v3,
        (v4 & 1) == 0))
  {
    BOOL v6 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v6 callDisplayStyle] == (id)3)
    {
      unsigned __int8 v7 = [(PHAudioCallViewController *)self features];
      unsigned int v8 = [v7 isDominoEnabled];

      if (v8)
      {
        unsigned int v9 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        BOOL v5 = [v9 callDisplayStyle] != 0;
LABEL_11:

        return v5;
      }
    }
    else
    {
    }
    unsigned int v9 = +[UIDevice currentDevice];
    if ([v9 userInterfaceIdiom])
    {
      BOOL v5 = 0;
    }
    else
    {
      unsigned __int8 v10 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      BOOL v5 = [v10 callDisplayStyle] != 0;
    }
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)shouldApplyNewGradientBlur
{
  if (![(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]
    || ([(PHAudioCallViewController *)self frontmostCall],
        unsigned __int8 v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEmergency],
        v4,
        (v5 & 1) == 0))
  {
    unsigned __int8 v7 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    unsigned int v8 = [v7 provider];
    unsigned __int8 v9 = [v8 isSystemProvider];
    if ((v9 & 1) != 0
      || ([(PHAudioCallViewController *)self callToUseForWallpaper],
          id v2 = objc_claimAutoreleasedReturnValue(),
          [v2 status] != 4))
    {
      unsigned __int8 v10 = [(PHAudioCallViewController *)self features];
      unsigned __int8 v6 = [v10 isHeroImageEnabled];

      if (v9)
      {
LABEL_9:

        return v6;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }

    goto LABEL_9;
  }
  return 0;
}

- (BOOL)isShowingBackgroundImage
{
  id v2 = [(PHAudioCallViewController *)self backgroundImageView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isShowing6UP
{
  return [(PHAudioCallViewController *)self middleViewState] == 1;
}

- (BOOL)shouldShowCircularAvatar
{
  if ([(CNKFeatures *)self->_features isEnhancedEmergencyEnabled])
  {
    BOOL v3 = [(PHAudioCallViewController *)self frontmostCall];
    if (!v3)
    {
      unsigned __int8 v4 = [(PHAudioCallViewController *)self callCenter];
      unsigned __int8 v5 = [v4 currentCalls];
      BOOL v3 = [v5 firstObject];

      if (!v3)
      {
        unsigned __int8 v6 = +[UIApplication sharedApplication];
        unsigned __int8 v7 = [v6 delegate];
        BOOL v3 = [v7 mostRecentlyDisconnectedAudioCall];
      }
    }
    unsigned __int8 v8 = [v3 isEmergency];

    if (v8) {
      return 0;
    }
  }
  unsigned __int8 v10 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v10 callDisplayStyle] == (id)3)
  {
    id v11 = [(PHAudioCallViewController *)self features];
    unsigned __int8 v12 = [v11 isDominoEnabled];

    if (v12) {
      return 1;
    }
  }
  else
  {
  }
  id v13 = +[UIDevice currentDevice];
  unint64_t v14 = (unint64_t)[v13 userInterfaceIdiom];

  id v15 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  unint64_t v16 = (unint64_t)[v15 callDisplayStyle];

  if ([(PHAudioCallViewController *)self shouldShowContactOrLastSeenWallpaper])
  {
    BOOL v17 = 1;
  }
  else
  {
    id v18 = [(PHAudioCallViewController *)self renderingViewController];
    BOOL v17 = v18 != 0;
  }
  id v19 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  unsigned int v20 = [(PHAudioCallViewController *)self contactImageForCall:v19];

  id v21 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  unsigned int v22 = [(PHAudioCallViewController *)self fallbackImageDataForCall:v21];

  if (!v17 && [(PHAudioCallViewController *)self shouldApplyNewGradientBlur]) {
    return 1;
  }
  if (v14 | v16) {
    int v23 = v17;
  }
  else {
    int v23 = 1;
  }
  if (v20) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v22 == 0;
  }
  BOOL v25 = !v24;
  if (v23) {
    return (v14 | v16) == 0;
  }
  else {
    return v25;
  }
}

- (id)contactToDisplayInCallWallpaperForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4
    && ([v4 contactIdentifier], unsigned __int8 v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    unsigned __int8 v7 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v5];
    id v8 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v7];
    unsigned __int8 v9 = [v5 contactIdentifier];
    unsigned __int8 v10 = +[PHAudioCallViewController contactKeysToFetch];
    id v11 = [(PHAudioCallViewController *)self contactsCache];
    unsigned __int8 v12 = [v8 contactForIdentifier:v9 keysToFetch:v10 usingCache:v11];

    if (v12)
    {
      id v13 = +[CNContactChangesNotifier sharedNotifier];
      [v13 unregisterObserver:self forContact:0];

      unint64_t v14 = +[CNContactChangesNotifier sharedNotifier];
      id v15 = +[PHAudioCallViewController contactKeysToFetch];
      [v14 registerObserver:self forContact:v12 keysToFetch:v15];
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)contactWallpaperForCall:(id)a3
{
  id v4 = a3;
  if ([(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]
    && ([v4 isEmergency] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
    goto LABEL_20;
  }
  unsigned __int8 v6 = [v4 contactIdentifier];

  if (v6)
  {
    unsigned __int8 v7 = [v4 handle];
    id v8 = [v7 siriDisplayName];
    if ([v8 length])
    {
      unsigned __int8 v9 = [v4 handle];
      unsigned int v10 = [v9 shouldHideContact];

      if (v10)
      {
        id v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412290;
          id v21 = v4;
          unsigned __int8 v12 = "SNAP: call initiated with Siri using a phone or email on a lock device, not showing the wallpaper %@";
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v20, 0xCu);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v11 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v4];
    id v13 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v11];
    unint64_t v14 = [v4 contactIdentifier];
    id v15 = +[PHAudioCallViewController contactKeysToFetch];
    unint64_t v16 = [(PHAudioCallViewController *)self contactsCache];
    BOOL v17 = [v13 contactForIdentifier:v14 keysToFetch:v15 usingCache:v16];

    id v18 = sub_1000D5130();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SNAP: the contact we used to fetch wallpaper for call is %@", (uint8_t *)&v20, 0xCu);
    }

    unsigned __int8 v5 = [v17 wallpaper];

    if (v5)
    {
      unsigned __int8 v5 = [v17 wallpaper];
    }

    goto LABEL_19;
  }
  id v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    unsigned __int8 v12 = "SNAP: call doesn't have contactIdentifier %@";
    goto LABEL_11;
  }
LABEL_12:
  unsigned __int8 v5 = 0;
LABEL_19:

LABEL_20:

  return v5;
}

- (id)wallpaperTypeForCNWallpaper:(id)a3
{
  id v4 = [a3 extensionBundleID];
  unsigned __int8 v5 = [(PHAudioCallViewController *)self wallpaperTypeForBundleID:v4];

  return v5;
}

- (id)wallpaperTypeForIMWallpaperMetadata:(id)a3
{
  id v4 = [a3 type];
  unsigned __int8 v5 = [(PHAudioCallViewController *)self wallpaperTypeForBundleID:v4];

  return v5;
}

- (id)wallpaperTypeForBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"])
  {
    id v4 = (id *)&CNWallpaperTypePhoto;
LABEL_7:
    id v5 = *v4;
    goto LABEL_8;
  }
  if ([v3 isEqual:@"com.apple.AvatarUI.AvatarPosterExtension"])
  {
    id v4 = (id *)&CNWallpaperTypeMemoji;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.ContactsUI.MonogramPosterExtension"])
  {
    id v4 = (id *)&CNWallpaperTypeMonogram;
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)shouldShowContactOrLastSeenWallpaper
{
  id v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle] == (id)3)
  {
    id v4 = [(PHAudioCallViewController *)self features];
    if ([v4 isDominoEnabled])
    {

      goto LABEL_13;
    }
    unsigned __int8 v10 = [(PHAudioCallViewController *)self shouldUseHeroImageLayout];

    if ((v10 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    unsigned int v5 = [(PHAudioCallViewController *)self shouldUseHeroImageLayout];

    if (!v5) {
      return 0;
    }
  }
  if (![(PHAudioCallViewController *)self hasNoCallsOrOnlyEndedCalls]
    || ([(PHAudioCallViewController *)self renderingViewController],
        unsigned __int8 v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    id v8 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    id v3 = v8;
    if (v8)
    {
      unsigned __int8 v9 = [v8 contactIdentifier];

      if (v9)
      {
        if ([(PHAudioCallViewController *)self callStateCanShowNewPoster:v3]
          || ![(PHAudioCallViewController *)self prefersShowingCachedLastSeenPosterBeforeCallConnected:v3])
        {
          unsigned __int8 v12 = [(PHAudioCallViewController *)self contactWallpaperForCall:v3];
          unsigned __int8 v7 = v12 != 0;
        }
        else
        {
          unsigned __int8 v7 = [(PHAudioCallViewController *)self hasLastSeenPosterForCall:v3];
        }
        goto LABEL_14;
      }
    }
LABEL_13:
    unsigned __int8 v7 = 0;
LABEL_14:

    return v7;
  }
  return 1;
}

- (id)lastSeenOrCurrentPosterConfigurationForCall:(id)a3
{
  id v4 = a3;
  if ([(PHAudioCallViewController *)self prefersShowingCachedLastSeenPosterBeforeCallConnected:v4])
  {
    [(PHAudioCallViewController *)self lastSeenPosterConfigurationForCall:v4];
  }
  else
  {
    [(PHAudioCallViewController *)self contactWallpaperConfigurationForCall:v4 shouldReadFromCache:1];
  unsigned int v5 = };

  return v5;
}

- (id)lastSeenPosterConfigurationForCall:(id)a3
{
  id v4 = a3;
  if (![(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    unsigned int v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v5 callDisplayStyle] == (id)3)
    {
      unsigned __int8 v6 = [(PHAudioCallViewController *)self features];
      unsigned int v7 = [v6 isDominoEnabled];

      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    id v14 = 0;
    goto LABEL_23;
  }
LABEL_4:
  id v8 = [(PHAudioCallViewController *)self configurationCache];
  unsigned __int8 v9 = [v4 uniqueProxyIdentifier];
  unsigned __int8 v10 = [v8 objectForKey:v9];
  id v11 = [v10 configuration];

  if (v11)
  {
    unsigned __int8 v12 = sub_1000D5130();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 callUUID];
      int v29 = 138412290;
      CFStringRef v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SNAP: Returning a cached PRSPosterConfiguration for %@", (uint8_t *)&v29, 0xCu);
    }
    id v14 = v11;
    goto LABEL_22;
  }
  id v15 = [v4 handle];
  unint64_t v16 = [v15 siriDisplayName];
  if ([v16 length])
  {
    BOOL v17 = [v4 handle];
    unsigned int v18 = [v17 shouldHideContact];

    if (v18)
    {
      id v19 = sub_1000D5130();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = [v4 uniqueProxyIdentifier];
        int v29 = 138412290;
        CFStringRef v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: call initiated with Siri using a phone or email on a lock device, not showing the wallpaper for callUUID %@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v21 = [(PHAudioCallViewController *)self readCachedLastSeenPosterDataForCall:v4];
  if (v21)
  {
    unsigned int v22 = (void *)v21;
    id v14 = +[PRSPosterArchiver unarchiveConfigurationFromData:v21 error:0];
    int v23 = sub_1000D5130();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = [v4 uniqueProxyIdentifier];
      int v29 = 138412290;
      CFStringRef v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SNAP: unarchived a lastSeen PRSPosterConfiguration for %@", (uint8_t *)&v29, 0xCu);
    }
    BOOL v25 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:v14 source:1];
    int v26 = [(PHAudioCallViewController *)self configurationCache];
    double v27 = [v4 uniqueProxyIdentifier];
    [v26 setObject:v25 forKey:v27];

    goto LABEL_21;
  }
LABEL_20:
  unsigned int v22 = [(PHAudioCallViewController *)self configurationCache];
  BOOL v25 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:0 source:1];
  int v26 = [v4 uniqueProxyIdentifier];
  [v22 setObject:v25 forKey:v26];
  id v14 = 0;
LABEL_21:

LABEL_22:
LABEL_23:

  return v14;
}

- (id)contactWallpaperConfigurationForCall:(id)a3 shouldReadFromCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout]) {
    goto LABEL_4;
  }
  unsigned int v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v7 callDisplayStyle] != (id)3)
  {

    goto LABEL_16;
  }
  id v8 = [(PHAudioCallViewController *)self features];
  unsigned int v9 = [v8 isDominoEnabled];

  if (!v9)
  {
LABEL_16:
    id v14 = 0;
    goto LABEL_25;
  }
LABEL_4:
  unsigned __int8 v10 = [(PHAudioCallViewController *)self contactWallpaperForCall:v6];
  if (v10)
  {
    if (!v4) {
      goto LABEL_9;
    }
    id v11 = [(PHAudioCallViewController *)self configurationCache];
    unsigned __int8 v12 = [v6 uniqueProxyIdentifier];
    id v13 = [v11 objectForKey:v12];
    id v14 = [v13 configuration];

    if (v14)
    {
      id v15 = sub_1000D5130();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = [v6 callUUID];
        int v28 = 138412290;
        int v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SNAP: Returning a cached PRSPosterConfiguration for %@", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
LABEL_9:
      id v15 = [v10 posterArchiveData];
      BOOL v17 = sub_1000D5130();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v18)
        {
          int v28 = 138412546;
          int v29 = v15;
          __int16 v30 = 2048;
          id v31 = [v15 length];
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SNAP: posterArchiveData in wallpaper is %@, length is %lu", (uint8_t *)&v28, 0x16u);
        }

        id v14 = +[PRSPosterArchiver unarchiveConfigurationFromData:v15 error:0];
        id v19 = sub_1000D5130();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [v6 uniqueProxyIdentifier];
          int v28 = 138412290;
          int v29 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: unarchived a contact (current) PRSPosterConfiguration for %@", (uint8_t *)&v28, 0xCu);
        }
        uint64_t v21 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:v14 source:2];
        unsigned int v22 = [(PHAudioCallViewController *)self configurationCache];
        int v23 = [v6 uniqueProxyIdentifier];
        [(ICSPosterConfigurationWrapper *)v22 setObject:v21 forKey:v23];
      }
      else
      {
        if (v18)
        {
          LOWORD(v28) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SNAP: there is no posterArchiveData in wallpaper", (uint8_t *)&v28, 2u);
        }

        uint64_t v21 = [(PHAudioCallViewController *)self configurationCache];
        unsigned int v22 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:0 source:2];
        int v23 = [v6 uniqueProxyIdentifier];
        [(ICSPosterConfigurationWrapper *)v21 setObject:v22 forKey:v23];
        id v14 = 0;
      }
    }
  }
  else
  {
    BOOL v24 = [(PHAudioCallViewController *)self configurationCache];
    BOOL v25 = [[ICSPosterConfigurationWrapper alloc] initWithConfiguration:0 source:2];
    int v26 = [v6 uniqueProxyIdentifier];
    [v24 setObject:v25 forKey:v26];

    id v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SNAP: contactWallpaperForCall is nil", (uint8_t *)&v28, 2u);
    }
    id v14 = 0;
  }

LABEL_25:

  return v14;
}

- (id)wallpaperTitleStyleAttributesForCall:(id)a3
{
  id v4 = a3;
  if (![(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    unsigned int v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v5 callDisplayStyle] == (id)3)
    {
      id v6 = [(PHAudioCallViewController *)self features];
      unsigned int v7 = [v6 isDominoEnabled];

      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    id v14 = 0;
    goto LABEL_18;
  }
LABEL_4:
  id v8 = [(PHAudioCallViewController *)self lastSeenOrCurrentPosterConfigurationForCall:v4];
  if (v8)
  {
    unsigned int v9 = [(PHAudioCallViewController *)self configurationCache];
    unsigned __int8 v10 = [v4 uniqueProxyIdentifier];
    id v11 = [v9 objectForKey:v10];

    if (v11)
    {
      unsigned __int8 v12 = [v11 configuration];
      if ([v12 isEqual:v8])
      {
        id v13 = [v11 titleStyleAttributes];

        if (v13)
        {
          id v14 = [v11 titleStyleAttributes];
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    uint64_t v18 = 0;
    id v14 = +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:v8 error:&v18];
    if (v11)
    {
      id v15 = [v11 configuration];
      unsigned int v16 = [v15 isEqual:v8];

      if (v16) {
        [v11 setTitleStyleAttributes:v14];
      }
    }
    goto LABEL_16;
  }
  id v14 = 0;
LABEL_17:

LABEL_18:

  return v14;
}

- (id)wallpaperTitleStyleAttributes
{
  id v3 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  id v4 = [(PHAudioCallViewController *)self wallpaperTitleStyleAttributesForCall:v3];

  return v4;
}

- (id)contactWallpaperBackgroundColor
{
  id v3 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  if (![(PHAudioCallViewController *)self callStateCanShowNewPoster:v3]
    && [(PHAudioCallViewController *)self prefersShowingCachedLastSeenPosterBeforeCallConnected:v3])
  {
    id v4 = [(PHAudioCallViewController *)self lastSeenPosterIMWallpaperMetadataForCall:v3];
    uint64_t v5 = [v4 backgroundColor];
LABEL_6:
    unsigned int v7 = (void *)v5;
    goto LABEL_8;
  }
  id v6 = [(PHAudioCallViewController *)self contactWallpaperForCall:v3];
  id v4 = v6;
  if (v6)
  {
    uint64_t v5 = [v6 backgroundColorDescription];
    goto LABEL_6;
  }
  unsigned int v7 = 0;
LABEL_8:

  id v8 = [v7 objectForKey:CNWallpaperColorDescriptionKeyRed];
  unsigned int v9 = [v7 objectForKey:CNWallpaperColorDescriptionKeyGreen];
  unsigned __int8 v10 = [v7 objectForKey:CNWallpaperColorDescriptionKeyBlue];
  uint64_t v11 = [v7 objectForKey:CNWallpaperColorDescriptionKeyAlpha];
  unsigned __int8 v12 = (void *)v11;
  if (v8) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || v10 == 0 || v11 == 0)
  {
    int v23 = 0;
  }
  else
  {
    [v8 doubleValue];
    double v17 = v16;
    [v9 doubleValue];
    double v19 = v18;
    [v10 doubleValue];
    double v21 = v20;
    [v12 doubleValue];
    int v23 = +[UIColor colorWithRed:v17 green:v19 blue:v21 alpha:v22];
  }

  return v23;
}

- (void)updateLegacyBackgroundImageVisibilityWithShouldShowWallpaper:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHAudioCallViewController *)self canShowBackgroundImage];
  double v6 = (double)!v3;
  if (!v5) {
    double v6 = 0.0;
  }
  [(PHBackgroundGradientBlurView *)self->_backgroundImageView setAlpha:v6];
  unsigned int v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [(PHBackgroundGradientBlurView *)self->_backgroundImageView alpha];
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SNAP: updated legacyBackgroundImageVisibility to %f", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)setCallForBackgroundImage:(id)a3 animated:(BOOL)a4 callDisplayStyleChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setCallForBackgroundImage to: %@", (uint8_t *)&v20, 0xCu);
  }

  int v9 = [(PHAudioCallViewController *)self callForBackgroundImage];
  if ([v9 isEqual:v7])
  {
    uint64_t v10 = [(PHAudioCallViewController *)self callForBackgroundImage];
    BOOL v11 = v10 == 0;
    BOOL v12 = v7 != 0;
    BOOL v13 = v12 && v11;
    if (v12 && v11) {
      id v14 = 0;
    }
    else {
      id v14 = (void *)v10;
    }

    if (!v13 && !v5)
    {
      id v15 = [(PHAudioCallViewController *)self backgroundImageView];
      id v16 = [v15 image];

      [(PHAudioCallViewController *)self hideOrShowThirdPartyBackgroundImageWithImage:v16];
      goto LABEL_18;
    }
  }
  else
  {
  }
  if (v7)
  {
    double v17 = [(PHAudioCallViewController *)self contactImageDataForCall:v7];
    if (v17) {
      id v16 = [objc_alloc((Class)UIImage) initWithData:v17];
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  [(PHAudioCallViewController *)self setBackgroundImage:v16];
  [(PHAudioCallViewController *)self setCallForBackgroundImage:v7];
LABEL_18:
  [(PHAudioCallViewController *)self updateLegacyBackgroundImageVisibilityWithShouldShowWallpaper:[(PHAudioCallViewController *)self callHasNoContactPoster] ^ 1];
  if (v16) {
    BOOL v18 = [(PHAudioCallViewController *)self canShowBackgroundImage];
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)contactImageDataForCall:(id)a3
{
  id v4 = [(PHAudioCallViewController *)self contactForCall:a3];
  BOOL v5 = v4;
  if (v4)
  {
    double v6 = [v4 fullscreenImageData];
    id v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v7 callDisplayStyle] == (id)3)
    {
      uint64_t v8 = [(PHAudioCallViewController *)self features];
      unsigned int v9 = [v8 isDominoEnabled];

      if (v9 && !v6)
      {
        double v6 = [v5 imageData];
      }
    }
    else
    {
    }
  }
  else
  {
    double v6 = 0;
  }
  uint64_t v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    BOOL v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SNAP: contactImageDataForCall is %@", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

- (id)contactForCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 handle];
  double v6 = [v5 siriDisplayName];
  if ([v6 length])
  {
    id v7 = [v4 handle];
    unsigned int v8 = [v7 shouldHideContact] ^ 1;
  }
  else
  {
    unsigned int v8 = 1;
  }

  unsigned int v9 = [v4 contactIdentifier];

  uint64_t v10 = 0;
  if (v9 && v8)
  {
    BOOL v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SNAP: trying to fetch contactImageData", v18, 2u);
    }

    int v12 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v4];
    id v13 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v12];
    id v14 = [v4 contactIdentifier];
    id v15 = +[PHAudioCallViewController contactKeysToFetch];
    id v16 = [(PHAudioCallViewController *)self contactsCache];
    uint64_t v10 = [v13 contactForIdentifier:v14 keysToFetch:v15 usingCache:v16];
  }

  return v10;
}

- (id)fallbackImageDataForCall:(id)a3
{
  BOOL v3 = [(PHAudioCallViewController *)self contactForCall:a3];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 imageData];
  }
  else
  {
    BOOL v5 = 0;
  }
  double v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    unsigned int v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: fallbackImageDataForContact is %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)contactImageForCall:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(PHAudioCallViewController *)self contactImageDataForCall:v4],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v6 = (void *)v5;
    id v7 = +[UIImage imageWithData:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)contactImage
{
  BOOL v3 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  id v4 = [(PHAudioCallViewController *)self contactImageForCall:v3];

  return v4;
}

- (void)setBackgroundImage:(id)a3
{
  id v28 = a3;
  id v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v4 callDisplayStyle] == (id)3)
  {
    uint64_t v5 = [(PHAudioCallViewController *)self features];
    unsigned int v6 = [v5 isDominoEnabled];

    if (v6)
    {
      id v7 = [(PHAudioCallViewController *)self callToUseForWallpaper];
      if ([(PHAudioCallViewController *)self callStateCanShowNewPoster:v7]
        || ![(PHAudioCallViewController *)self prefersShowingCachedLastSeenPosterBeforeCallConnected:v7])
      {
        int v8 = [(PHAudioCallViewController *)self contactWallpaperForCall:v7];
        uint64_t v9 = [(PHAudioCallViewController *)self wallpaperTypeForCNWallpaper:v8];
      }
      else
      {
        int v8 = [(PHAudioCallViewController *)self lastSeenPosterIMWallpaperMetadataForCall:v7];
        uint64_t v9 = [(PHAudioCallViewController *)self wallpaperTypeForIMWallpaperMetadata:v8];
      }
      id v15 = (void *)v9;

      id v16 = [(PHAudioCallViewController *)self callCenter];
      if ((unint64_t)[v16 currentCallCount] <= 1)
      {
      }
      else
      {
        double v17 = [(PHAudioCallViewController *)self callCenter];
        BOOL v18 = [v17 incomingCall];

        if (v18)
        {
          double v19 = &OBJC_IVAR___PHAudioCallViewController__shouldShowLargeAvatarForCallWaiting;
LABEL_24:
          int v21 = *((unsigned __int8 *)&self->super.super.super.super.isa + *v19);
          unsigned int v22 = [(PHCallViewController *)self currentState];
          if (v15 == (void *)CNWallpaperTypeMemoji || v15 == (void *)CNWallpaperTypeMonogram)
          {
            BOOL v25 = [(PHAudioCallViewController *)self contactWallpaperBackgroundColor];
            if (v25)
            {
              [(PHAudioCallViewController *)self setBackgroundColor:v25 animated:1];
            }
            else
            {
              double v27 = +[UIColor blackColor];
              [(PHAudioCallViewController *)self setBackgroundColor:v27 animated:1];
            }
            [(PHAudioCallViewController *)self removeBackgroundContactImageView];
          }
          else
          {
            if (v21) {
              BOOL v23 = 1;
            }
            else {
              BOOL v23 = v22 == 11;
            }
            int v24 = v23;
            if (v28 && v24)
            {
              [(PHAudioCallViewController *)self updateBackgroundContactImageViewWithImage:v28 animated:1];
            }
            else
            {
              int v26 = +[UIColor blackColor];
              [(PHAudioCallViewController *)self setBackgroundColor:v26 animated:1];
            }
          }

          goto LABEL_41;
        }
      }
      unsigned int v20 = [(PHAudioCallViewController *)self usesCompactMulticallUI];
      double v19 = &OBJC_IVAR___PHAudioCallViewController__shouldShowLargeAvatar;
      if (v20) {
        double v19 = &OBJC_IVAR___PHAudioCallViewController__shouldShowLargeAvatarForCallWaiting;
      }
      goto LABEL_24;
    }
  }
  else
  {
  }
  if (v28 && [(PHAudioCallViewController *)self canShowBackgroundImage]
    || [(PHAudioCallViewController *)self shouldShowContactOrLastSeenWallpaper])
  {
    [(PHAudioCallViewController *)self updateBackgroundContactImageViewWithImage:v28 animated:0];
    [(PHAudioCallViewController *)self updateLayeredBackgroundWallpaper];
    [(PHAudioCallViewController *)self removeDefaultBackgroundGradientView];
  }
  else
  {
    uint64_t v10 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v11 = [v10 callDisplayStyle];

    if (v11)
    {
      int v12 = +[UIApplication sharedApplication];
      id v13 = [v12 delegate];
      id v14 = [v13 mostRecentlyDisconnectedAudioCall];

      if (!v14
        || ![v14 isEmergency]
        || ([v14 disconnectedReasonRequiresCallBackUI] & 1) == 0)
      {
        [(PHAudioCallViewController *)self addDefaultBackgroundGradientView];
      }
      [(PHAudioCallViewController *)self updateLayeredBackgroundWallpaper];
      [(PHAudioCallViewController *)self removeBackgroundContactImageView];
    }
  }
LABEL_41:
}

- (void)setBackgroundColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E92CC;
  v10[3] = &unk_1002CDDE0;
  void v10[4] = self;
  id v5 = a3;
  id v11 = v5;
  unsigned int v6 = objc_retainBlock(v10);
  id v7 = v6;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E931C;
    v8[3] = &unk_1002CDA98;
    uint64_t v9 = v6;
    +[UIView animateWithDuration:v8 animations:0.5];
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)updateBackgroundContactImageViewWithImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SNAP: update backgroundContactImageView withImage: %@", buf, 0xCu);
  }

  if ([(PHAudioCallViewController *)self isShowingBackgroundImage])
  {
    if (v4)
    {
      backgroundImageView = self->_backgroundImageView;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000E98C4;
      v42[3] = &unk_1002CDDE0;
      v42[4] = self;
      id v43 = v6;
      +[UIView transitionWithView:backgroundImageView duration:5242880 options:v42 animations:0 completion:0.5];
    }
    else
    {
      [(PHBackgroundGradientBlurView *)self->_backgroundImageView setImage:v6];
      [(PHBackgroundGradientBlurView *)self->_backgroundImageView setAlpha:1.0];
    }
    goto LABEL_15;
  }
  uint64_t v9 = [[PHBackgroundGradientBlurView alloc] initWithImage:v6];
  uint64_t v10 = self->_backgroundImageView;
  self->_backgroundImageView = v9;

  [(PHBackgroundGradientBlurView *)self->_backgroundImageView setContentMode:2];
  [(PHBackgroundGradientBlurView *)self->_backgroundImageView setClipsToBounds:1];
  id v11 = [(PHAudioCallViewController *)self view];
  [v11 insertSubview:self->_backgroundImageView atIndex:0];

  int v12 = [(PHAudioCallViewController *)self buttonsViewController];
  id v13 = [v12 view];

  [v13 updateBackgroundMaterial:1];
  [(PHAudioCallViewController *)self updateCallRecordingViewBackgroundMaterialType:1];
  [(PHBackgroundGradientBlurView *)self->_backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v14 callDisplayStyle] != (id)3)
  {

    goto LABEL_11;
  }
  id v15 = [(PHAudioCallViewController *)self features];
  unsigned int v16 = [v15 isDominoEnabled];

  if (!v16)
  {
LABEL_11:
    BOOL v37 = [(PHBackgroundGradientBlurView *)self->_backgroundImageView topAnchor];
    id v31 = [(PHAudioCallViewController *)self view];
    uint64_t v32 = [v31 topAnchor];
    unsigned int v38 = [v37 constraintEqualToAnchor:v32];
    v45[0] = v38;
    uint64_t v35 = [(PHBackgroundGradientBlurView *)self->_backgroundImageView bottomAnchor];
    objc_super v36 = [(PHAudioCallViewController *)self view];
    __int16 v34 = [v36 bottomAnchor];
    id v33 = [v35 constraintEqualToAnchor:v34];
    v45[1] = v33;
    __int16 v30 = [(PHBackgroundGradientBlurView *)self->_backgroundImageView leadingAnchor];
    unsigned int v22 = [(PHAudioCallViewController *)self view];
    [v22 leadingAnchor];
    BOOL v23 = v41 = v6;
    [v30 constraintEqualToAnchor:v23];
    int v24 = v39 = v13;
    v45[2] = v24;
    [(PHBackgroundGradientBlurView *)self->_backgroundImageView trailingAnchor];
    BOOL v25 = v40 = v4;
    int v26 = [(PHAudioCallViewController *)self view];
    double v27 = [v26 trailingAnchor];
    id v28 = [v25 constraintEqualToAnchor:v27];
    v45[3] = v28;
    int v29 = +[NSArray arrayWithObjects:v45 count:4];
    +[NSLayoutConstraint activateConstraints:v29];

    unsigned int v20 = v31;
    int v21 = (void *)v32;

    BOOL v4 = v40;
    id v13 = v39;

    id v6 = v41;
    double v17 = v37;

    goto LABEL_12;
  }
  [(PHBackgroundGradientBlurView *)self->_backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v17 = _NSDictionaryOfVariableBindings(@"_backgroundImageView", self->_backgroundImageView, 0);
  BOOL v18 = [(PHAudioCallViewController *)self view];
  double v19 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backgroundImageView]|" options:0 metrics:0 views:v17];
  [v18 addConstraints:v19];

  unsigned int v20 = [(PHAudioCallViewController *)self view];
  int v21 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backgroundImageView]|" options:0 metrics:0 views:v17];
  [v20 addConstraints:v21];
LABEL_12:

  if (v4)
  {
    [(PHBackgroundGradientBlurView *)self->_backgroundImageView setAlpha:0.0];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000E98AC;
    v44[3] = &unk_1002CD518;
    v44[4] = self;
    +[UIView animateWithDuration:v44 animations:0.5];
  }

LABEL_15:
  [(PHAudioCallViewController *)self hideOrShowThirdPartyBackgroundImageWithImage:v6];
}

- (void)hideOrShowThirdPartyBackgroundImageWithImage:(id)a3
{
  id v24 = a3;
  if (![(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]
    || ([(PHAudioCallViewController *)self frontmostCall],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEmergency],
        v4,
        (v5 & 1) == 0))
  {
    if ([(PHAudioCallViewController *)self shouldApplyNewGradientBlur]
      || [(PHAudioCallViewController *)self shouldShowContactOrLastSeenWallpaper])
    {
      id v6 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];
      [v6 removeFromSuperview];

      [(PHAudioCallViewController *)self setUnblurredBackgroundImageView:0];
    }
    else
    {
      id v7 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];

      if (!v7)
      {
        int v8 = objc_opt_new();
        [(PHAudioCallViewController *)self setUnblurredBackgroundImageView:v8];

        uint64_t v9 = [(PHAudioCallViewController *)self view];
        [v9 frame];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        BOOL v18 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];
        [v18 setFrame:v11, v13, v15, v17];

        double v19 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];
        [v19 setContentMode:2];
      }
      unsigned int v20 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];
      [v20 setImage:v24];

      int v21 = [(PHAudioCallViewController *)self view];
      unsigned int v22 = [(PHAudioCallViewController *)self unblurredBackgroundImageView];
      BOOL v23 = [(PHAudioCallViewController *)self backgroundImageView];
      [v21 insertSubview:v22 above:v23];
    }
  }
}

- (id)fallbackHorizontalNameLabelString
{
  BOOL v3 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  BOOL v4 = [(PHAudioCallViewController *)self associatedCallGroupForCall:v3];

  unsigned __int8 v5 = [(PHAudioCallViewController *)self callParticipantsViewController];
  id v6 = [v5 nameForCallGroup:v4];

  return v6;
}

- (id)createContactFirstNameLabelViewModel
{
  BOOL v3 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  BOOL v4 = [(PHAudioCallViewController *)self contactToDisplayInCallWallpaperForCall:v3];
  unsigned __int8 v5 = [v3 handle];
  id v6 = [v5 value];
  id v7 = +[TPIncomingCallMetricsProvider appropriateCallerNameViewForContact:v4 callStatus:0 callIsActive:1 optionalBackupName:v6];

  [(PHAudioCallViewController *)self applyWallpaperTitleStyleAttributesToTextViewWrapper:v7];
  [v7 overrideTitleLayoutWith:0];
  int v8 = [[PHPosterNameViewModel alloc] initWithCall:v3 posterNameTextView:v7];

  return v8;
}

- (void)applyWallpaperTitleStyleAttributesToTextViewWrapper:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(PHAudioCallViewController *)self wallpaperTitleStyleAttributes];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = [v4 titleFont];
    [v7 setTextFontUsingDefaultFontSizes:v6];

    [v7 setPreferredAlignment:[v5 preferredTitleAlignment]];
    [v7 setPreferredLayout:0];
  }
}

- (void)removeFirstNameLabelFromViewIfNeeded
{
  BOOL v3 = [(PHAudioCallViewController *)self keypadPosterNameViewModel];

  if (v3)
  {
    [(PHAudioCallViewController *)self setKeypadPosterNameViewModel:0];
  }
}

- (void)hideFirstNameLabelOnKeypad
{
  BOOL v3 = [(PHAudioCallViewController *)self keypadPosterNameViewModel];

  if (v3)
  {
    id v4 = [(PHAudioCallViewController *)self keypadPosterNameViewModel];
    [v4 updatePosterNameAlpha:0.0];
  }
}

- (void)showFirstNameLabelOnKeypad
{
  BOOL v3 = [(PHAudioCallViewController *)self keypadPosterNameViewModel];

  if (v3)
  {
    id v4 = [(PHAudioCallViewController *)self keypadPosterNameViewModel];
    [v4 updatePosterNameAlpha:1.0];
  }
}

- (id)createBlurryBackgroundView
{
  BOOL v3 = +[UIColorEffect inCallControls];
  id v4 = +[UIBlurEffect effectWithBlurRadius:50.0];
  id v5 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:0];
  id v6 = [(PHAudioCallViewController *)self view];
  [v6 frame];
  [v5 setFrame:];

  id v7 = [(PHAudioCallViewController *)self renderingViewController];
  if (v7)
  {

LABEL_3:
    BOOL v18 = v4;
    double v19 = v3;
    int v8 = &v18;
    uint64_t v9 = 2;
    goto LABEL_7;
  }
  uint64_t v10 = [(PHAudioCallViewController *)self backgroundImageView];
  if (v10)
  {
    double v11 = (void *)v10;
    double v12 = [(PHAudioCallViewController *)self backgroundImageView];
    [v12 alpha];
    double v14 = v13;

    if (v14 != 0.0) {
      goto LABEL_3;
    }
  }
  double v17 = v4;
  int v8 = &v17;
  uint64_t v9 = 1;
LABEL_7:
  double v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, v9, v17, v18, v19);
  [v5 setBackgroundEffects:v15];

  return v5;
}

- (void)hideOrShowKeypadBackgroundView
{
  BOOL v3 = [(PHAudioCallViewController *)self features];
  unsigned int v4 = [v3 isDialPadEnabled];

  if (v4)
  {
    id v5 = [(PHCallViewController *)self bottomBar];
    id v6 = [v5 currentState];

    if (v6 != (id)19)
    {
      [(PHAudioCallViewController *)self removeFirstNameLabelFromViewIfNeeded];
      double v19 = [(PHAudioCallViewController *)self keypadBackgroundView];

      if (v19)
      {
        unsigned int v20 = [(PHAudioCallViewController *)self keypadBackgroundView];
        [v20 removeFromSuperview];

        [(PHAudioCallViewController *)self setKeypadBackgroundView:0];
      }
      int v21 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];

      if (!v21) {
        goto LABEL_26;
      }
      double v22 = (double)[(PHAudioCallViewController *)self shouldPresentAlertButton];
      goto LABEL_25;
    }
    id v7 = [(PHAudioCallViewController *)self keypadBackgroundView];

    if (v7)
    {
LABEL_23:
      __int16 v39 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];

      if (!v39) {
        goto LABEL_26;
      }
      double v22 = (double)([(PHAudioCallViewController *)self shouldPresentAlertButton] ^ 1);
LABEL_25:
      BOOL v40 = [(PHAudioCallViewController *)self emergencyTextViaSatelliteLabel];
      [v40 setAlpha:v22];

LABEL_26:
      [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
      if ([(CNKFeatures *)self->_features isEnhancedEmergencyEnabled]) {
        [(PHAudioCallViewController *)self removeEnhancedEmergencyIntermittentStateLabel];
      }
      return;
    }
    [(PHAudioCallViewController *)self setHasKeypadUpdated:0];
    int v8 = [(PHAudioCallViewController *)self createBlurryBackgroundView];
    uint64_t v9 = [(PHAudioCallViewController *)self renderingViewController];

    if (v9)
    {
      uint64_t v10 = [(PHAudioCallViewController *)self view];
      double v11 = [(PHAudioCallViewController *)self renderingViewController];
      double v12 = [v11 view];
      [v10 insertSubview:v8 above:v12];

      double v13 = [(PHAudioCallViewController *)self createContactFirstNameLabelViewModel];
      [(PHAudioCallViewController *)self setKeypadPosterNameViewModel:v13];

      double v14 = [(PHAudioCallViewController *)self keypadPosterNameViewModel];
      double v15 = [v14 posterNameTextView];
      double v16 = [v8 contentView];
      +[TPIncomingCallMetricsProvider addCallerNameView:v15 toContainerView:v16];

      double v17 = +[TUCallCenter sharedInstance];
      id v18 = [v17 currentCallCount];

      if ((unint64_t)v18 >= 2) {
        [(PHAudioCallViewController *)self hideFirstNameLabelOnKeypad];
      }
    }
    else
    {
      BOOL v23 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];

      if (v23)
      {
        id v24 = [(PHAudioCallViewController *)self view];
        BOOL v25 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];
        [v24 insertSubview:v8 above:v25];
      }
    }
    [(PHAudioCallViewController *)self setKeypadBackgroundView:v8];
    int v26 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    double v27 = v26;
    if (v26 && [v26 status] == 1)
    {
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeScale(&v43, 1.03, 1.03);
      CGAffineTransform v42 = v43;
      id v28 = [(PHAudioCallViewController *)self keypadBackgroundView];
      CGAffineTransform v41 = v42;
      [v28 setTransform:&v41];
    }
    int v29 = [(PHAudioCallViewController *)self renderingViewController];
    if (v29)
    {
    }
    else
    {
      uint64_t v33 = [(PHAudioCallViewController *)self backgroundImageView];
      if (!v33
        || (__int16 v34 = (void *)v33,
            [(PHAudioCallViewController *)self backgroundImageView],
            uint64_t v35 = objc_claimAutoreleasedReturnValue(),
            [v35 alpha],
            double v37 = v36,
            v35,
            v34,
            v37 == 0.0))
      {
        __int16 v30 = +[UIColorEffect inCallControlsButtonNoPhotoNoAvatar];
        id v31 = +[UIBlurEffect effectWithBlurRadius:30.0];
        uint64_t v32 = [(PHAudioCallViewController *)self keypadViewController];
        v44[0] = v30;
        v44[1] = v31;
        unsigned int v38 = +[NSArray arrayWithObjects:v44 count:2];
        [v32 updateKeypadButtonBackgroundMaterial:v38];

        goto LABEL_22;
      }
    }
    __int16 v30 = +[UIColorEffect inCallControlsKeypadButton];
    id v31 = [(PHAudioCallViewController *)self keypadViewController];
    uint64_t v45 = v30;
    uint64_t v32 = +[NSArray arrayWithObjects:&v45 count:1];
    [v31 updateKeypadButtonBackgroundMaterial:v32];
LABEL_22:

    goto LABEL_23;
  }
}

- (void)hideOrShowScreeningBackgroundView
{
  BOOL v3 = [(PHAudioCallViewController *)self featureFlags];
  int v4 = TUCallScreeningEnabled();

  if (v4)
  {
    id v5 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
    id v6 = [(PHCallViewController *)self bottomBar];
    if ([v6 currentState] == (id)23)
    {

LABEL_6:
      uint64_t v9 = [(PHAudioCallViewController *)self screeningBackgroundView];
      if (v9)
      {
      }
      else
      {
        double v14 = [(PHAudioCallViewController *)self renderingViewController];

        if (v14)
        {
          double v15 = [(PHAudioCallViewController *)self createBlurryBackgroundView];
          double v16 = objc_opt_new();
          double v17 = [v16 makeViewComposer];
          id v18 = [v17 composeBackgroundWithView:v15];
          [(PHAudioCallViewController *)self setScreeningBackgroundViewController:v18];

          double v19 = [(PHAudioCallViewController *)self screeningBackgroundViewController];
          [(PHAudioCallViewController *)self addChildViewController:v19];

          unsigned int v20 = [(PHAudioCallViewController *)self screeningBackgroundViewController];
          int v21 = [v20 view];
          [(PHAudioCallViewController *)self setScreeningBackgroundView:v21];

          double v22 = [(PHAudioCallViewController *)self view];
          BOOL v23 = [(PHAudioCallViewController *)self screeningBackgroundView];
          id v24 = [(PHAudioCallViewController *)self renderingViewController];
          BOOL v25 = [v24 view];
          [v22 insertSubview:v23 above:v25];

          int v26 = [(PHAudioCallViewController *)self screeningBackgroundViewController];
          [v26 didMoveToParentViewController:self];

          double v27 = [(PHAudioCallViewController *)self createContactFirstNameLabelViewModel];
          [(PHAudioCallViewController *)self setScreeningPosterNameViewModel:v27];

          id v28 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
          [v28 updatePosterNameAlpha:0.0];

          int v29 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
          [v29 updateStatusFromParticipantsView:v5];

          __int16 v30 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
          id v31 = [v30 posterNameTextView];
          uint64_t v32 = [(PHAudioCallViewController *)self screeningBackgroundView];
          +[TPIncomingCallMetricsProvider addCallerNameView:v31 toContainerView:v32];

          uint64_t v33 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
          __int16 v34 = [v33 posterNameTextView];
          uint64_t v35 = [v34 displayNameText];

          double v36 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
          double v37 = [v36 posterNameTextView];
          [(PHAudioCallViewController *)self applyWallpaperTitleStyleAttributesToTextViewWrapper:v37];

          unsigned int v38 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
          __int16 v39 = [v38 posterNameTextView];
          BOOL v40 = [v39 displayNameText];
          id v41 = [v40 length];

          if (!v41)
          {
            CGAffineTransform v42 = [(PHAudioCallViewController *)self screeningPosterNameViewModel];
            CGAffineTransform v43 = [v42 posterNameTextView];
            [v43 setDisplayNameText:v35];
          }
          objc_initWeak(&location, self);
          dispatch_time_t v44 = dispatch_time(0, 550000000);
          unsigned __int8 v56 = _NSConcreteStackBlock;
          uint64_t v57 = 3221225472;
          BOOL v58 = sub_1000EA9DC;
          v59 = &unk_1002CED28;
          objc_copyWeak(&v60, &location);
          dispatch_after(v44, (dispatch_queue_t)&_dispatch_main_q, &v56);
          objc_destroyWeak(&v60);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v45 = [(PHAudioCallViewController *)self renderingViewController];
      v46 = [v45 view];
      [v46 frame];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      unsigned int v55 = [(PHAudioCallViewController *)self screeningBackgroundView];
      [v55 setFrame:v48, v50, v52, v54];

LABEL_17:
      return;
    }
    id v7 = [(PHCallViewController *)self bottomBar];
    if ([v7 currentState] == (id)24)
    {
      unsigned int v8 = [(PHCallViewController *)self currentState];

      if (v8 == 11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    [(PHAudioCallViewController *)self setScreeningPosterNameViewModel:0];
    uint64_t v10 = [(PHAudioCallViewController *)self screeningBackgroundView];

    if (v10)
    {
      double v11 = [(PHAudioCallViewController *)self screeningBackgroundView];
      [v11 removeFromSuperview];

      [(PHAudioCallViewController *)self setScreeningBackgroundView:0];
      double v12 = [(PHAudioCallViewController *)self screeningBackgroundViewController];
      [v12 willMoveToParentViewController:0];

      double v13 = [(PHAudioCallViewController *)self screeningBackgroundViewController];
      [v13 removeFromParentViewController];

      [(PHAudioCallViewController *)self setScreeningBackgroundViewController:0];
    }
    [(PHAudioCallViewController *)self _updatePosterNameAlpha];
    [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
    [(PHAudioCallViewController *)self updateParticipantConstraintsForPosterName:v5];
    goto LABEL_17;
  }
}

- (void)removeBackgroundContactImageView
{
  [(PHBackgroundGradientBlurView *)self->_backgroundImageView removeFromSuperview];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;
}

- (void)addDefaultBackgroundGradientView
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SNAP: Adding default backgroundGradientView", buf, 2u);
  }

  if (![(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    int v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v4 callDisplayStyle] != (id)3)
    {
LABEL_14:

      return;
    }
    id v5 = [(PHAudioCallViewController *)self features];
    unsigned int v6 = [v5 isDominoEnabled];

    if (!v6) {
      return;
    }
  }
  id v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v7 callDisplayStyle] != (id)3)
  {

LABEL_10:
    uint64_t v10 = [(PHAudioCallViewController *)self buttonsViewController];
    int v4 = [v10 view];

    if ([(PHAudioCallViewController *)self shouldUpdateBackgroundForEmergencyCall])
    {
      [(PHAudioCallViewController *)self updateBackgroundForEmergencyCall];
    }
    else
    {
      double v11 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];

      if (!v11)
      {
        id v31 = objc_alloc_init(PHAudioCallBackgroundGradientViewController);
        double v12 = [(PHAudioCallBackgroundGradientViewController *)v31 view];
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        double v13 = [(PHAudioCallViewController *)self view];
        [v13 insertSubview:v12 atIndex:0];

        int v29 = [v12 leadingAnchor];
        __int16 v30 = [(PHAudioCallViewController *)self view];
        id v28 = [v30 leadingAnchor];
        double v27 = [v29 constraintEqualToAnchor:v28];
        v33[0] = v27;
        BOOL v25 = [v12 trailingAnchor];
        int v26 = [(PHAudioCallViewController *)self view];
        id v24 = [v26 trailingAnchor];
        BOOL v23 = [v25 constraintEqualToAnchor:v24];
        v33[1] = v23;
        int v21 = [v12 topAnchor];
        double v22 = [(PHAudioCallViewController *)self view];
        double v14 = [v22 topAnchor];
        double v15 = [v21 constraintEqualToAnchor:v14];
        v33[2] = v15;
        double v16 = [v12 bottomAnchor];
        double v17 = [(PHAudioCallViewController *)self view];
        id v18 = [v17 bottomAnchor];
        double v19 = [v16 constraintEqualToAnchor:v18];
        v33[3] = v19;
        unsigned int v20 = +[NSArray arrayWithObjects:v33 count:4];
        +[NSLayoutConstraint activateConstraints:v20];

        [(PHAudioCallViewController *)self setDefaultBackgroundGradientView:v12];
        [v4 updateBackgroundMaterial:2];
        [(PHAudioCallViewController *)self updateCallRecordingViewBackgroundMaterialType:2];
      }
    }
    goto LABEL_14;
  }
  unsigned int v8 = [(PHAudioCallViewController *)self features];
  unsigned __int8 v9 = [v8 isDominoEnabled];

  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
}

- (void)removeDefaultBackgroundGradientView
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SNAP: Removing default backgroundGradientView", v8, 2u);
  }

  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
LABEL_6:
    id v7 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];
    [v7 removeFromSuperview];

    [(PHAudioCallViewController *)self setDefaultBackgroundGradientView:0];
    return;
  }
  int v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v4 callDisplayStyle] == (id)3)
  {
    id v5 = [(PHAudioCallViewController *)self features];
    unsigned int v6 = [v5 isDominoEnabled];

    if (!v6) {
      return;
    }
    goto LABEL_6;
  }
}

- (void)setPosterNameViewModel:(id)a3
{
  int v4 = (PHPosterNameViewModel *)a3;
  posterNameViewModel = self->_posterNameViewModel;
  if (posterNameViewModel) {
    [(PHPosterNameViewModel *)posterNameViewModel removeFromSuperview];
  }
  unsigned int v6 = self->_posterNameViewModel;
  self->_posterNameViewModel = v4;
}

- (void)setKeypadPosterNameViewModel:(id)a3
{
  int v4 = (PHPosterNameViewModel *)a3;
  keypadPosterNameViewModel = self->_keypadPosterNameViewModel;
  if (keypadPosterNameViewModel) {
    [(PHPosterNameViewModel *)keypadPosterNameViewModel removeFromSuperview];
  }
  unsigned int v6 = self->_keypadPosterNameViewModel;
  self->_keypadPosterNameViewModel = v4;
}

- (void)setScreeningPosterNameViewModel:(id)a3
{
  int v4 = (PHPosterNameViewModel *)a3;
  screeningPosterNameViewModel = self->_screeningPosterNameViewModel;
  if (screeningPosterNameViewModel) {
    [(PHPosterNameViewModel *)screeningPosterNameViewModel removeFromSuperview];
  }
  unsigned int v6 = self->_screeningPosterNameViewModel;
  self->_screeningPosterNameViewModel = v4;
}

- (void)updatePosterViewModelForParticipantsView:(id)a3
{
  id v6 = a3;
  int v4 = [(PHAudioCallViewController *)self posterNameViewModel];

  if (v4)
  {
    id v5 = [(PHAudioCallViewController *)self posterNameViewModel];
    [v5 updateViewModelForParticipantsView:v6];
  }
  else
  {
    id v5 = [v6 singleCallLabelView];
    [v5 setPosterNameViewModel:0];
  }
}

- (void)showPosterBlurTransition
{
  BOOL v3 = +[UIBlurEffect effectWithBlurRadius:15.0];
  id v4 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:0];
  id v5 = [(PHAudioCallViewController *)self view];
  [v5 frame];
  [v4 setFrame:];

  id v6 = [(PHAudioCallViewController *)self view];
  id v7 = [(PHAudioCallViewController *)self buttonsViewController];
  unsigned int v8 = [v7 view];
  [v6 insertSubview:v4 below:v8];

  unsigned __int8 v9 = [(PHAudioCallViewController *)self view];
  uint64_t v10 = [(PHAudioCallViewController *)self callDetailsViewButton];
  [v9 bringSubviewToFront:v10];

  double v11 = [(PHAudioCallViewController *)self view];
  double v12 = [(PHAudioCallViewController *)self posterBadgeView];
  [v11 bringSubviewToFront:v12];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EB3F0;
  v17[3] = &unk_1002CDDE0;
  id v18 = v4;
  id v19 = v3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_1000EB478;
  v15[3] = &unk_1002CD540;
  id v16 = v18;
  id v13 = v18;
  id v14 = v3;
  +[UIView _animateUsingSpringWithDuration:0 delay:v17 options:v15 mass:0.25 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
}

- (void)removePosterViewController:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(PHAudioCallViewController *)self renderingViewController];
  [(PHAudioCallViewController *)self setRenderingViewController:0];
  [(PHAudioCallViewController *)self setPosterNameViewModel:0];
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000EB6F4;
    v11[3] = &unk_1002CE868;
    id v12 = v7;
    id v13 = self;
    id v14 = v6;
    unsigned int v8 = objc_retainBlock(v11);
    unsigned __int8 v9 = v8;
    if (v4)
    {
      [(PHAudioCallViewController *)self showPosterBlurTransition];
      dispatch_time_t v10 = dispatch_time(0, 0);
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v9);
    }
    else
    {
      ((void (*)(void *))v8[2])(v8);
    }
  }
  else
  {
    [(PHAudioCallViewController *)self setParticipantsViewShouldShowParticipantLabel:1];
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)transitionToNewPoster:(id)a3 showingPosterTransition:(BOOL)a4 shouldBlurPoster:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(PHAudioCallViewController *)self renderingViewController];
  [(PHAudioCallViewController *)self setRenderingViewController:v10];
  [(PHAudioCallViewController *)self addChildViewController:v10];
  id v13 = [v10 view];
  id v14 = sub_1000D5130();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SNAP: Going to swap old and new poster", buf, 2u);
    }

    id v16 = [(PHAudioCallViewController *)self screeningBackgroundView];

    if (v16)
    {
      [v13 frame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      BOOL v25 = [(PHAudioCallViewController *)self screeningBackgroundView];
      [v25 setFrame:v18, v20, v22, v24];

      int v26 = [(PHAudioCallViewController *)self view];
      double v27 = [(PHAudioCallViewController *)self screeningBackgroundView];
      [v26 insertSubview:v13 below:v27];
LABEL_16:

      goto LABEL_17;
    }
    __int16 v30 = [(PHAudioCallViewController *)self backgroundImageView];

    if (v30) {
      goto LABEL_14;
    }
    BOOL v40 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];

    if (v40) {
      goto LABEL_22;
    }
    int v26 = sub_1000D5130();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1001EC244();
    }
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SNAP: Going to set up a new poster, there isn't an old one", buf, 2u);
    }

    if (!v8
      || ([(PHAudioCallViewController *)self backgroundImageView],
          id v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          v28))
    {
LABEL_14:
      int v26 = [(PHAudioCallViewController *)self view];
      uint64_t v31 = [(PHAudioCallViewController *)self backgroundImageView];
LABEL_15:
      double v27 = (void *)v31;
      [v26 insertSubview:v13 above:v31];
      goto LABEL_16;
    }
    int v29 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];

    if (v29)
    {
LABEL_22:
      int v26 = [(PHAudioCallViewController *)self view];
      uint64_t v31 = [(PHAudioCallViewController *)self defaultBackgroundGradientView];
      goto LABEL_15;
    }
    int v26 = sub_1000D5130();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SNAP: Going to set up a new poster, but there is no backgroundImageView or defaultBackgroundGradientView", buf, 2u);
    }
  }
LABEL_17:

  [v10 didMoveToParentViewController:self];
  id v41 = _NSConcreteStackBlock;
  uint64_t v42 = 3221225472;
  CGAffineTransform v43 = sub_1000EBCDC;
  dispatch_time_t v44 = &unk_1002D07E0;
  LOBYTE(v50) = a5;
  uint64_t v45 = self;
  id v46 = v10;
  id v48 = v11;
  uint64_t v49 = 0x3FE0000000000000;
  id v47 = v12;
  id v32 = v11;
  id v33 = v12;
  id v34 = v10;
  uint64_t v35 = objc_retainBlock(&v41);
  double v36 = v35;
  if (v8)
  {
    [(PHAudioCallViewController *)self showPosterBlurTransition];
    dispatch_time_t v37 = dispatch_time(0, 0);
    dispatch_after(v37, (dispatch_queue_t)&_dispatch_main_q, v36);
  }
  else
  {
    ((void (*)(void ***))v35[2])(v35);
    unsigned int v38 = [(PHAudioCallViewController *)self buttonsViewController];
    __int16 v39 = [v38 view];

    [v39 updateBackgroundMaterial:0];
    [(PHAudioCallViewController *)self updateCallRecordingViewBackgroundMaterialType:0];
  }
}

- (double)viewAlphaForPosterRenderingViewController
{
  return (double)[(PHAudioCallViewController *)self canShowPosterImage];
}

- (void)updateLayeredBackgroundWallpaper
{
  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    BOOL v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v3 callDisplayStyle] == (id)3)
    {
      BOOL v4 = [(PHAudioCallViewController *)self features];
      unsigned __int8 v5 = [v4 isDominoEnabled];

      if (v5) {
        return;
      }
    }
    else
    {
    }
    if (![(PHAudioCallViewController *)self hasNoCallsOrOnlyEndedCalls])
    {
      v87 = [(PHAudioCallViewController *)self callToUseForWallpaper];
      v84 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v87];
      id v83 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v84];
      id v6 = [v87 contactIdentifier];
      id v7 = +[PHAudioCallViewController contactKeysToFetch];
      BOOL v8 = [(PHAudioCallViewController *)self contactsCache];
      unsigned int v80 = [v83 contactForIdentifier:v6 keysToFetch:v7 usingCache:v8];

      unsigned int v9 = [(PHAudioCallViewController *)self prefersShowingCachedLastSeenPosterBeforeCallConnected:v87];
      unint64_t v10 = [(PHAudioCallViewController *)self suggestedNewPosterSourceAfterCallConnects:v87];
      BOOL v78 = (void *)v10;
      if ([(PHAudioCallViewController *)self currentCallStateCanShowNewPoster]
        && [(id)objc_opt_class() posterSourceIsSyncedWithContacts:v10])
      {
        if (v10 == 2)
        {
          unsigned int v65 = sub_1000D5130();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - transitioning from cached last seen poster -> current wallpaper if available.", buf, 2u);
          }

          objc_super v66 = [(PHAudioCallViewController *)self contactsCache];
          v67 = [v87 contactIdentifier];
          __int16 v68 = [v66 objectForKey:v67];

          if (v68)
          {
            v69 = [(PHAudioCallViewController *)self contactsCache];
            id v70 = [v87 contactIdentifier];
            [v69 removeObjectForKey:v70];
          }
          BOOL v71 = (id)[(PHAudioCallViewController *)self currentDisplayedPosterSourceForCall:v87] != (id)1;
          [(PHAudioCallViewController *)self setSnapshottedPosterImageToUseForColorInversion:0];
          [(PHAudioCallViewController *)self setHasInvertedUIElementColorsBasedOnPoster:0];
          id v85 = [(PHAudioCallViewController *)self contactWallpaperConfigurationForCall:v87 shouldReadFromCache:v71];
          __int16 v72 = objc_opt_class();
          unsigned int v73 = [(PHAudioCallViewController *)self currentIMNicknameMatchingContact:v80];
          char v74 = [v73 wallpaper];
          unsigned int v22 = [v72 wallpaperContentIsSensitive:v74];
        }
        else
        {
          if (v10 != 3)
          {
            unsigned int v75 = sub_1000D5130();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
              sub_1001EC278();
            }

            unsigned __int8 v86 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
            char v82 = 1;
            goto LABEL_58;
          }
          id v11 = [(PHAudioCallViewController *)self frontmostCall];
          id v85 = [(PHAudioCallViewController *)self newPosterConfigurationForCall:v11];

          id v12 = sub_1000D5130();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v96 = v85;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - transitioning to show new poster updates (i.e. pendingIMNickname), new configuration: %@", buf, 0xCu);
          }

          id v13 = [(PHAudioCallViewController *)self contactsCache];
          id v14 = [v87 contactIdentifier];
          BOOL v15 = [v13 objectForKey:v14];

          if (v15)
          {
            id v16 = [(PHAudioCallViewController *)self contactsCache];
            double v17 = [v87 contactIdentifier];
            [v16 removeObjectForKey:v17];
          }
          [(PHAudioCallViewController *)self setSnapshottedPosterImageToUseForColorInversion:0];
          [(PHAudioCallViewController *)self setHasInvertedUIElementColorsBasedOnPoster:0];
          double v18 = [(PHAudioCallViewController *)self sharedProfileStateOracleForCall:v87];
          double v19 = [v18 pendingNickname];

          double v20 = objc_opt_class();
          double v21 = [v19 wallpaper];
          unsigned int v22 = [v20 wallpaperContentIsSensitive:v21];
        }
        char v82 = 1;
      }
      else
      {
        double v23 = sub_1000D5130();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - Going to show the last seen poster for this contact if available.", buf, 2u);
          }

          id v85 = [(PHAudioCallViewController *)self lastSeenPosterConfigurationForCall:v87];
          unsigned int v22 = [(PHAudioCallViewController *)self lastSeenPosterDataIsSensitiveForCall:v87];
        }
        else
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - Going to show the current wallpaper for this contact if available.", buf, 2u);
          }

          id v85 = [(PHAudioCallViewController *)self contactWallpaperConfigurationForCall:v87 shouldReadFromCache:1];
          BOOL v25 = objc_opt_class();
          int v26 = [(PHAudioCallViewController *)self currentIMNicknameMatchingContact:v80];
          double v27 = [v26 wallpaper];
          unsigned int v22 = [v25 wallpaperContentIsSensitive:v27];
        }
        char v82 = 0;
      }
      if (v87 && v85)
      {
        [(PHAudioCallViewController *)self triggerInversionColorUpdate:v85];
        unsigned __int8 v86 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
LABEL_28:
        id v79 = [objc_alloc((Class)PRUISIncomingCallPosterContext) initWithTitleString:&stru_1002D6110 horizontalTitleBoundingRect:0 verticalTitleBoundingRect:1 imageAssetID:CGRectZero.origin.x personalPoster:CGRectZero.origin.y CGRectZero.size.width CGRectZero.size.height CGRectZero.origin.x CGRectZero.origin.y CGRectZero.size.width CGRectZero.size.height];
        id v28 = [objc_alloc((Class)PRUISPosterRenderingViewController) initWithConfiguration:v85 context:v79];
        int v29 = [(PHAudioCallViewController *)self view];
        [v29 bounds];
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        unsigned int v38 = [v28 view];
        [v38 setFrame:v31, v33, v35, v37];

        __int16 v39 = [v28 view];
        [v39 setAutoresizingMask:18];

        if (objc_opt_respondsToSelector())
        {
          BOOL v40 = sub_1000D5130();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "SNAP: Setting poster renderingMode to .live and starting 30sec delay to set it back to .paused", buf, 2u);
          }

          [v28 setRenderingMode:2];
          id v41 = [(PHAudioCallViewController *)self suspendPosterAfterDelayBlock];
          BOOL v42 = v41 == 0;

          if (!v42)
          {
            CGAffineTransform v43 = [(PHAudioCallViewController *)self suspendPosterAfterDelayBlock];
            dispatch_block_cancel(v43);

            [(PHAudioCallViewController *)self setSuspendPosterAfterDelayBlock:0];
          }
          objc_initWeak((id *)buf, self);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000ECF60;
          block[3] = &unk_1002CED28;
          objc_copyWeak(v93, (id *)buf);
          dispatch_block_t v44 = dispatch_block_create((dispatch_block_flags_t)0, block);
          [(PHAudioCallViewController *)self setSuspendPosterAfterDelayBlock:v44];

          dispatch_time_t v45 = dispatch_time(0, 30000000000);
          id v46 = &_dispatch_main_q;
          id v47 = [(PHAudioCallViewController *)self suspendPosterAfterDelayBlock];
          dispatch_after(v45, (dispatch_queue_t)&_dispatch_main_q, v47);

          objc_destroyWeak(v93);
          objc_destroyWeak((id *)buf);
        }
        id v48 = [v86 singleCallLabelView];
        unsigned int v81 = [v48 statusLabel];

        if ([(PHAudioCallViewController *)self canShowPosterImage])
        {
          uint64_t v49 = +[ICSPreferences sharedPreferences];
          uint64_t v50 = v49;
          if (v82) {
            unsigned int v51 = [v49 forceBlurNewPoster];
          }
          else {
            unsigned int v51 = [v49 forceBlurCurrentPoster];
          }
          unsigned int v53 = v51;

          int v52 = v53 | v22;
        }
        else
        {
          int v52 = 0;
        }
        double v54 = [(PHAudioCallViewController *)self callToUseForWallpaper];
        unsigned int v55 = [v81 text];
        objc_initWeak((id *)buf, self);
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_1000ECFB4;
        v88[3] = &unk_1002D0858;
        objc_copyWeak(&v91, (id *)buf);
        id v56 = v54;
        id v89 = v56;
        id v57 = v55;
        id v90 = v57;
        BOOL v58 = objc_retainBlock(v88);
        v59 = ((void (*)(void *, void))v58[2])(v58, 0);
        if (v52)
        {
          id v60 = ((void (*)(void *, uint64_t))v58[2])(v58, 1);
        }
        else
        {
          id v60 = 0;
        }
        +[TPIncomingCallMetricsProvider addCallerNameView:v59 toViewController:v28];
        id v61 = [[PHPosterNameViewModel alloc] initWithCall:v56 posterNameTextView:v59 priorityPosterNameTextView:v60];
        [(PHAudioCallViewController *)self setPosterNameViewModel:v61];

        [(PHAudioCallViewController *)self updatePosterViewModelForParticipantsView:v86];
        [(PHAudioCallViewController *)self setupNameLabelForAlwaysOnDisplay];
        BOOL v62 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        BOOL v63 = [v62 callDisplayStyle] == 0;

        if (v63)
        {
          [(PHAudioCallViewController *)self setParticipantsViewShouldShowParticipantLabel:1];
          [v81 setAlpha:1.0];
        }
        else
        {
          [(PHAudioCallViewController *)self setParticipantsViewShouldShowParticipantLabel:0];
          int v64 = [(PHAudioCallViewController *)self getParticipantsView_Waiting];
          [(PHAudioCallViewController *)self updateParticipantsLabelForView:v64 isHidden:1];

          [(PHAudioCallViewController *)self _updatePosterStatusLabelForState:[(PHCallViewController *)self currentState]];
          [(PHAudioCallViewController *)self updateParticipantConstraintsForPosterName:v86];
          [(PHAudioCallViewController *)self _updatePosterNameAlpha];
        }
        -[PHAudioCallViewController transitionToNewPoster:showingPosterTransition:shouldBlurPoster:completion:](self, "transitionToNewPoster:showingPosterTransition:shouldBlurPoster:completion:", v28);

        objc_destroyWeak(&v91);
        objc_destroyWeak((id *)buf);

LABEL_47:
        return;
      }
      unsigned __int8 v86 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
      if (v85) {
        goto LABEL_28;
      }
LABEL_58:
      unsigned int v76 = sub_1000D5130();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v77 = [(PHAudioCallViewController *)self renderingViewController];
        *(_DWORD *)buf = 138412290;
        id v96 = v77;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "SNAP: There is no configuration now, we are going to fade out old poster %@", buf, 0xCu);
      }
      [(PHAudioCallViewController *)self removeNameLabelForAlwaysOnDisplay];
      v93[1] = _NSConcreteStackBlock;
      v93[2] = (id)3221225472;
      v93[3] = sub_1000ECCA4;
      v93[4] = &unk_1002D0830;
      char v94 = v82;
      v93[5] = self;
      v93[6] = v78;
      -[PHAudioCallViewController removePosterViewController:completion:](self, "removePosterViewController:completion:");
      if ((v82 & 1) == 0 && [(PHCallViewController *)self currentState] == 11) {
        [(PHAudioCallViewController *)self removeFirstNameLabelFromViewIfNeeded];
      }
      goto LABEL_47;
    }
  }
}

- (void)setupNameLabelForAlwaysOnDisplay
{
  [(PHAudioCallViewController *)self removeNameLabelForAlwaysOnDisplay];
  [(PHAudioCallViewController *)self setupDimmingViewForAlwaysOnDisplay];
  BOOL v3 = [(PHAudioCallViewController *)self createContactFirstNameLabelViewModel];
  [(PHAudioCallViewController *)self setAlwaysOnDisplayPosterNameViewModel:v3];

  id v6 = [(PHAudioCallViewController *)self alwaysOnDisplayPosterNameViewModel];
  BOOL v4 = [v6 posterNameTextView];
  unsigned __int8 v5 = [(PHAudioCallViewController *)self alwaysOnDisplayDimmingView];
  +[TPIncomingCallMetricsProvider addCallerNameView:v4 toContainerView:v5];
}

- (void)removeNameLabelForAlwaysOnDisplay
{
  BOOL v3 = [(PHAudioCallViewController *)self alwaysOnDisplayPosterNameViewModel];

  if (v3)
  {
    BOOL v4 = [(PHAudioCallViewController *)self alwaysOnDisplayPosterNameViewModel];
    [v4 removeFromSuperview];

    [(PHAudioCallViewController *)self setAlwaysOnDisplayPosterNameViewModel:0];
  }
}

- (void)setupDimmingViewForAlwaysOnDisplay
{
  BOOL v3 = [(PHAudioCallViewController *)self alwaysOnDisplayDimmingView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UIView);
    unsigned __int8 v5 = [(PHAudioCallViewController *)self view];
    [v5 frame];
    id v10 = [v4 initWithFrame:];

    id v6 = +[UIColor blackColor];
    id v7 = [v6 colorWithAlphaComponent:0.75];
    [v10 setBackgroundColor:v7];

    BOOL v8 = [(PHAudioCallViewController *)self view];
    [v8 addSubview:v10];

    [(PHAudioCallViewController *)self setAlwaysOnDisplayDimmingView:v10];
    unsigned int v9 = [(PHAudioCallViewController *)self alwaysOnDisplayDimmingView];
    [v9 setAlpha:0.0];
  }
}

- (id)snapshotUIImageView
{
  id v3 = objc_alloc((Class)UIImageView);
  id v4 = [(PHAudioCallViewController *)self backgroundImageView];
  unsigned __int8 v5 = [v4 image];
  id v6 = [v3 initWithImage:v5];

  id v7 = [(PHAudioCallViewController *)self view];
  [v7 frame];
  [v6 setFrame:];

  id v8 = objc_alloc_init((Class)UIVisualEffectView);
  unsigned int v9 = +[UIBlurEffect effectWithBlurRadius:100.0];
  double v18 = v9;
  id v10 = +[NSArray arrayWithObjects:&v18 count:1];
  [v8 setBackgroundEffects:v10];

  id v11 = [(PHAudioCallViewController *)self view];
  [v11 frame];
  [v8 setFrame:];

  [v6 addSubview:v8];
  id v12 = +[CALayer layer];
  id v13 = +[CAFilter filterWithType:kCAFilterPlusD];
  [v12 setCompositingFilter:v13];

  id v14 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.150000006];
  [v12 setBackgroundColor:[v14 CGColor]];

  BOOL v15 = [(PHAudioCallViewController *)self view];
  [v15 frame];
  [v12 setFrame:];

  id v16 = [v8 layer];
  [v16 addSublayer:v12];

  return v6;
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewController;
  [(PHAudioCallViewController *)&v4 viewSafeAreaInsetsDidChange];
  [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
  id v3 = [(PHAudioCallViewController *)self renderingViewController];

  if (v3) {
    [(PHAudioCallViewController *)self setupNameLabelForAlwaysOnDisplay];
  }
}

- (BOOL)shouldUseHeroImageLayout
{
  id v2 = [(PHAudioCallViewController *)self features];
  unsigned __int8 v3 = [v2 isHeroImageEnabled];

  return v3;
}

- (void)lockScreenVisibilityDidChange:(id)a3
{
  objc_super v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v4 callDisplayStyle] == (id)3)
  {
    unsigned __int8 v5 = [(PHAudioCallViewController *)self features];
    unsigned __int8 v6 = [v5 isDominoEnabled];

    if (v6) {
      return;
    }
  }
  else
  {
  }
  id v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lock screen visibility did change, refreshing UI", v17, 2u);
  }

  [(PHAudioCallViewController *)self setCallForBackgroundImage:0];
  id v8 = [(PHAudioCallViewController *)self callToUseForWallpaper];
  [(PHAudioCallViewController *)self setCallForBackgroundImage:v8 animated:1 callDisplayStyleChanged:0];

  [(PHAudioCallViewController *)self updateCallParticipantsViewControllerCallGroups];
  unsigned int v9 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  id v10 = [v9 singleCallLabelView];
  [v10 updateLabelsOrderAndLayout];
  uint64_t v11 = [(PHAudioCallViewController *)self middleViewState];
  [(PHAudioCallViewController *)self setMiddleViewState:0];
  screeningViewController = self->_screeningViewController;
  self->_screeningViewController = 0;

  [(PHAudioCallViewController *)self setMiddleViewState:v11];
  id v13 = [(PHCallViewController *)self bottomBar];
  id v14 = [v13 currentState];

  BOOL v15 = [(PHCallViewController *)self bottomBar];
  [v15 setCurrentState:-1];

  id v16 = [(PHCallViewController *)self bottomBar];
  [v16 setCurrentState:v14];
}

- (unint64_t)currentDisplayedPosterSourceForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 uniqueProxyIdentifier];

  if (v5)
  {
    unsigned __int8 v6 = [(PHAudioCallViewController *)self configurationCache];
    id v7 = [v4 uniqueProxyIdentifier];
    id v8 = [v6 objectForKey:v7];

    id v9 = [v8 source];
  }
  else
  {
    id v9 = 0;
  }

  return (unint64_t)v9;
}

+ (NSArray)contactKeysToFetch
{
  if (qword_100326350 != -1) {
    dispatch_once(&qword_100326350, &stru_1002D0878);
  }
  id v2 = (void *)qword_100326348;

  return (NSArray *)v2;
}

- (void)suspendPosterAndCancelDelay:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(PHAudioCallViewController *)self renderingViewController];

  if (v5)
  {
    unsigned __int8 v6 = [(PHAudioCallViewController *)self renderingViewController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      if (v3)
      {
        id v8 = [(PHAudioCallViewController *)self suspendPosterAfterDelayBlock];

        if (v8)
        {
          id v9 = [(PHAudioCallViewController *)self suspendPosterAfterDelayBlock];
          dispatch_block_cancel(v9);

          [(PHAudioCallViewController *)self setSuspendPosterAfterDelayBlock:0];
        }
      }
      id v10 = [(PHAudioCallViewController *)self renderingViewController];
      id v11 = [v10 renderingMode];

      if (v11 == (id)2)
      {
        id v12 = sub_1000D5130();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SNAP: Setting poster renderingMode to .paused", v14, 2u);
        }

        id v13 = [(PHAudioCallViewController *)self renderingViewController];
        [v13 setRenderingMode:1];
      }
    }
  }
}

- (void)setShowsCallWaitingParticipantView:(BOOL)a3
{
  callWaitingParticipantsViewController = self->_callWaitingParticipantsViewController;
  if (a3)
  {
    if (callWaitingParticipantsViewController) {
      return;
    }
    unsigned __int8 v5 = [PHCallParticipantsViewController alloc];
    unsigned __int8 v6 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    char v7 = [(PHAudioCallViewController *)self contactsCache];
    id v8 = [(PHCallParticipantsViewController *)v5 initWithCallDisplayStyleManager:v6 contactsCache:v7];
    id v9 = self->_callWaitingParticipantsViewController;
    self->_callWaitingParticipantsViewController = v8;

    [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController setShouldIgnoreUpdates:[(PHAudioCallViewController *)self participantsViewControllersShouldIgnoreUpdates]];
    [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController setHandlesCallWaitingCalls:1];
    [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController setDelegate:self];
    [(PHAudioCallViewController *)self addChildViewController:self->_callWaitingParticipantsViewController];
    id v10 = [(PHAudioCallViewController *)self view];
    id v11 = [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController view];
    [v10 addSubview:v11];

    id v12 = [(PHCallParticipantsViewController *)self->_callParticipantsViewController view];
    id v13 = [v12 singleCallLabelView];
    [v13 setPosterNameViewModel:0];

    id v14 = [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController view];
    [(PHAudioCallViewController *)self updatePosterViewModelForParticipantsView:v14];
    BOOL v15 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v15 callDisplayStyle] == (id)3)
    {
      id v16 = [(PHAudioCallViewController *)self features];
      unsigned int v17 = [v16 isDominoEnabled];

      if (v17)
      {
        double v18 = [(PHAudioCallViewController *)self view];
        double v19 = [(PHCallViewController *)self bottomBar];
        [v18 bringSubviewToFront:v19];

        double v20 = [(PHAudioCallViewController *)self view];
        double v21 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
        [v20 bringSubviewToFront:v21];

        [(PHAudioCallViewController *)self setUpLayoutGuidesForParticipantsViewController:self->_callWaitingParticipantsViewController];
        [(PHAudioCallViewController *)self applyCallWaitingConstraintsForAmbient];
        [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController updateCallGroups];
        [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController setShouldIgnoreUpdates:1];
LABEL_10:
        double v27 = [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController view];
        [v27 setAlpha:0.0];

        id v28 = [(PHCallParticipantsViewController *)self->_callParticipantsViewController view];
        [v28 setAlpha:1.0];

        [(PHAudioCallViewController *)self callWaitingAnimationDelay];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1000EDF98;
        v36[3] = &unk_1002CD518;
        v36[4] = self;
        +[UIView animateWithDuration:0 delay:v36 options:0 animations:0.5 completion:v29];
        goto LABEL_11;
      }
    }
    else
    {
    }
    [(PHAudioCallViewController *)self copyCallWaitingConstraintsFromParticipantsView];
    goto LABEL_10;
  }
  if (!callWaitingParticipantsViewController) {
    return;
  }
  unsigned int v22 = callWaitingParticipantsViewController;
  double v23 = [(PHCallParticipantsViewController *)v22 view];
  [v23 setAlpha:1.0];

  BOOL v24 = [(PHCallParticipantsViewController *)self->_callParticipantsViewController view];
  [v24 setAlpha:0.0];

  id v12 = [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController view];
  BOOL v25 = [v12 singleCallLabelView];
  [v25 setPosterNameViewModel:0];

  id v14 = [(PHCallParticipantsViewController *)self->_callParticipantsViewController view];
  [(PHAudioCallViewController *)self updatePosterViewModelForParticipantsView:v14];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000EE020;
  v33[3] = &unk_1002CDDE0;
  double v34 = v22;
  double v35 = self;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000EE09C;
  v30[3] = &unk_1002CDA70;
  double v31 = v34;
  double v32 = self;
  int v26 = v34;
  +[UIView animateWithDuration:v33 animations:v30 completion:0.5];

LABEL_11:
}

- (double)callWaitingAnimationDelay
{
  id v2 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v2 callDisplayStyle]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 0.5;
  }

  return v3;
}

- (int64_t)bottomBarStateForCallWaitingCall
{
  double v3 = [(PHAudioCallViewController *)self callCenter];
  if ([v3 currentVideoCallCount])
  {

LABEL_8:
    int64_t v11 = 9;
    goto LABEL_9;
  }
  id v4 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v5 = [v4 isHoldAndAnswerAllowed];

  if (!v5) {
    goto LABEL_8;
  }
  unsigned __int8 v6 = [(PHAudioCallViewController *)self callCenter];
  uint64_t v7 = [v6 callWithStatus:2];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(PHAudioCallViewController *)self callCenter];
    id v10 = [v9 callWithStatus:1];

    if (v10) {
      int64_t v11 = 8;
    }
    else {
      int64_t v11 = 7;
    }
  }
  else
  {

    int64_t v11 = 7;
  }
LABEL_9:
  id v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    int64_t v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AudioCallWaiting: Showing bottom bar state: %ld", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (void)copyCallWaitingConstraintsFromParticipantsView
{
  double v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle] == (id)3)
  {
    id v4 = [(PHAudioCallViewController *)self features];
    unsigned __int8 v5 = [v4 isDominoEnabled];

    if (v5) {
      return;
    }
  }
  else
  {
  }
  unsigned __int8 v6 = [(PHAudioCallViewController *)self getParticipantsView_Waiting];
  uint64_t v7 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
  if (v6)
  {
    id v8 = [v6 superview];

    if (v8)
    {
      if (v7)
      {
        [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v9 = [(PHAudioCallViewController *)self callWaitingLayoutConstraints];
        +[NSLayoutConstraint deactivateConstraints:v9];

        double v29 = [v6 centerYAnchor];
        id v28 = [v7 centerYAnchor];
        double v27 = [v29 constraintEqualToAnchor:v28];
        v30[0] = v27;
        int v26 = [v6 centerXAnchor];
        BOOL v25 = [v7 centerXAnchor];
        BOOL v24 = [v26 constraintEqualToAnchor:v25];
        v30[1] = v24;
        double v23 = [v6 topAnchor];
        unsigned int v22 = [v7 topAnchor];
        double v21 = [v23 constraintEqualToAnchor:v22];
        v30[2] = v21;
        double v20 = [v6 bottomAnchor];
        double v19 = [v7 bottomAnchor];
        double v18 = [v20 constraintEqualToAnchor:v19];
        v30[3] = v18;
        id v10 = [v6 leadingAnchor];
        int64_t v11 = [v7 leadingAnchor];
        id v12 = [v10 constraintEqualToAnchor:v11];
        void v30[4] = v12;
        id v13 = [v6 trailingAnchor];
        int v14 = [v7 trailingAnchor];
        int64_t v15 = [v13 constraintEqualToAnchor:v14];
        v30[5] = v15;
        id v16 = +[NSArray arrayWithObjects:v30 count:6];
        [(PHAudioCallViewController *)self setCallWaitingLayoutConstraints:v16];

        unsigned int v17 = [(PHAudioCallViewController *)self callWaitingLayoutConstraints];
        +[NSLayoutConstraint activateConstraints:v17];
      }
    }
  }
}

- (void)applyCallWaitingConstraintsForAmbient
{
  double v3 = [(PHAudioCallViewController *)self getParticipantsView_Waiting];
  if (v3)
  {
    id v10 = v3;
    id v4 = [v3 superview];
    double v3 = v10;
    if (v4)
    {
      unsigned __int8 v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      if ([v5 callDisplayStyle] == (id)3)
      {
        unsigned __int8 v6 = [(PHAudioCallViewController *)self features];
        unsigned int v7 = [v6 isDominoEnabled];

        double v3 = v10;
        if (!v7) {
          goto LABEL_7;
        }
        id v8 = [(PHCallParticipantsViewController *)self->_callWaitingParticipantsViewController view];
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v4 = [(PHAudioCallViewController *)self ambientParticipantsViewConstraintsForView:v10 largeAvatar:self->_shouldShowLargeAvatarForCallWaiting];
        id v9 = [v4 allValues];
        [(PHAudioCallViewController *)self setCallWaitingLayoutConstraints:v9];

        unsigned __int8 v5 = [(PHAudioCallViewController *)self callWaitingLayoutConstraints];
        +[NSLayoutConstraint activateConstraints:v5];
      }

      double v3 = v10;
    }
  }
LABEL_7:
}

- (void)audioCallControlsViewControllerRequestedKeypadPresentation:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested keypad presentation", v9, 2u);
  }

  unsigned __int8 v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v5 callDisplayStyle] == (id)3)
  {
    unsigned __int8 v6 = [(PHAudioCallViewController *)self features];
    unsigned int v7 = [v6 isDominoEnabled];

    if (v7)
    {
      id v8 = +[NSURL showKeypadURL];
      TUUnlockAndOpenURL();

      return;
    }
  }
  else
  {
  }
  [(PHAudioCallViewController *)self setMiddleViewState:2 animated:1];
}

- (void)audioCallControlsViewControllerRequestedKeypadPresentationForFieldMode:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested keypad presentation for field mode", v6, 2u);
  }

  [(PHAudioCallViewController *)self setMiddleViewState:2 animated:1];
  unsigned __int8 v5 = [(PHAudioCallViewController *)self callParticipantsViewController];
  [v5 setAllowsFieldModeSendButton:1];
}

- (void)audioCallControlsViewControllerRequestedContactsPresentation:(id)a3 forView:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Contacts presentation", buf, 2u);
  }

  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000EE9DC;
  id v13 = &unk_1002CDA70;
  int v14 = self;
  id v15 = v5;
  id v7 = v5;
  id v8 = objc_retainBlock(&v10);
  id v9 = +[PHInCallUtilities sharedInstance];
  [v9 requestPasscodeUnlockWithCompletion:v8];
}

- (void)audioCallControlsViewControllerRequestedAddCallPresentation:(id)a3 forView:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Add Call presentation", buf, 2u);
  }

  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000EEB78;
  id v13 = &unk_1002CDA70;
  int v14 = self;
  id v15 = v5;
  id v7 = v5;
  id v8 = objc_retainBlock(&v10);
  id v9 = +[PHInCallUtilities sharedInstance];
  [v9 requestPasscodeUnlockWithCompletion:v8];
}

- (void)audioCallControlsViewControllerRequestedAudioRoutesPresentation:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Audio Route presentation", v5, 2u);
  }

  [(PHAudioCallViewController *)self revealAudioRoutingDeviceListAnimated:1];
}

- (void)audioCallControlsViewControllerRequestedVideoPresentation:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Video presentation", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EED68;
  v7[3] = &unk_1002CD540;
  v7[4] = self;
  id v5 = objc_retainBlock(v7);
  unsigned __int8 v6 = +[PHInCallUtilities sharedInstance];
  [v6 requestPasscodeUnlockWithCompletion:v5];
}

- (void)audioCallControlsViewControllerRequestedInvokeAlert
{
  id v5 = +[UIApplication sharedApplication];
  double v3 = [v5 delegate];
  id v4 = [v3 alertCoordinator];
  [v4 invokeAlertWithRequestUnlock:[self alertTriggeredByAutoCountdown] automaticallyInvoked:[self alertTriggeredByAutoCountdown]];
}

- (void)audioCallControlsViewControllerDidTapVideoStreamingButton
{
  double v3 = [(PHAudioCallViewController *)self features];
  unsigned int v4 = [v3 isEnhancedEmergencyEnabled];

  if (v4)
  {
    [(PHAudioCallViewController *)self removeEnhancedEmergencyIntermittentStateLabel];
    id v5 = [(PHAudioCallViewController *)self emergencyCoordinator];
    [v5 handleVideoStreamingButtonTapped];

    unsigned __int8 v6 = [(PHAudioCallViewController *)self emergencyCoordinator];
    unsigned int v7 = [v6 videoStreamingIsOnScreen];

    if (v7)
    {
      id v8 = [(PHAudioCallViewController *)self buttonsViewController];
      id v11 = [v8 view];

      [v11 changeVideoStreamingButtonTitleWithIsSharing:1];
      id v9 = [(PHAudioCallViewController *)self emergencyCoordinator];
      unsigned int v10 = [v9 videoStreamingRequestHasBeenAccepted];

      if (v10) {
        [(PHAudioCallViewController *)self addEnhancedEmergencyIntermittentStateLabelWithState:1];
      }
    }
    else
    {
      [(PHAudioCallViewController *)self requestToAddResumeCameraLabel];
    }
  }
}

- (void)audioCallControlsViewControllerRequestedShareMedia
{
  double v3 = [(PHAudioCallViewController *)self features];
  unsigned int v4 = [v3 isEnhancedEmergencyEnabled];

  if (v4)
  {
    id v5 = [(PHAudioCallViewController *)self emergencyCoordinator];
    [v5 handleMediaUploadButtonTapped];
  }
}

- (void)audioCallControlsViewControllerDidTapRTTButton
{
  double v3 = [(PHAudioCallViewController *)self features];
  if ([v3 isEnhancedEmergencyEnabled]
    && ([(PHAudioCallViewController *)self emergencyCoordinator],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    unsigned __int8 v6 = [(PHAudioCallViewController *)self emergencyCoordinator];
    id v7 = [v6 eedRTTState];

    if (v7 == (id)3)
    {
      id v12 = [(PHAudioCallViewController *)self emergencyCoordinator];
      [v12 transitionToRTTState:2];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = sub_10010C700();
  if (!v8) {
    return;
  }
  id v9 = v8;
  unsigned int v10 = [(PHAudioCallViewController *)self activeCall];
  id v12 = [v9 viewControllerForCall:v10];

  id v11 = [(PHAudioCallViewController *)self navigationController];
  [v11 pushViewController:v12 animated:1];

LABEL_8:
}

- (void)audioCallControlsViewControllerRequestedShareCardFromSourceView:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: requested share card presentation", v9, 2u);
  }

  unsigned __int8 v6 = +[UIApplication sharedApplication];
  id v7 = [v6 delegate];
  id v8 = [v7 bannerPresentationManager];
  [(PHAudioCallViewController *)self presentShareCard:v8 source:v4];
}

- (BOOL)videoStreamingIsGoingOn
{
  double v3 = [(PHAudioCallViewController *)self features];
  if ([v3 isEnhancedEmergencyEnabled])
  {
    id v4 = [(PHAudioCallViewController *)self emergencyCoordinator];
    if (v4)
    {
      id v5 = [(PHAudioCallViewController *)self emergencyCoordinator];
      unsigned __int8 v6 = [v5 videoStreamingIsOnScreen];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)audioCallControlsViewControllerDidToggleMuteButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHAudioCallViewController *)self audioCallMutedTalkerIsSupported])
  {
    if (!v3) {
      [(PHAudioCallViewController *)self setDidNotifyMutedCaller:0];
    }
    id v5 = [(PHAudioCallViewController *)self mutedTalkerBannerViewController];
    [v5 updatePillViewWithIsMuted:v3];
  }
}

- (void)audioCallControlsViewControllerDidTapEndButton:(id)a3
{
  if ([(PHCallViewController *)self currentState] == 10)
  {
    [(PHAudioCallViewController *)self handleCancelPressedInCallBufferScreen];
  }
  else
  {
    id v4 = +[UIApplication sharedApplication];
    id v5 = [v4 delegate];
    id v11 = [v5 mostRecentlyDisconnectedAudioCall];

    if (v11 && [v11 isEmergency]) {
      char v6 = [v11 disconnectedReasonRequiresCallBackUI] ^ 1;
    }
    else {
      char v6 = 1;
    }
    unsigned int v7 = [v11 canDisplayAlertUI:[self shouldPresentAlertButton]];
    if ((v6 & 1) != 0 || !v7)
    {
      id v8 = [(PHAudioCallViewController *)self activeCall];
      id v9 = [v8 callUUID];
      [(PHAudioCallViewController *)self setUUIDForLocallyDisconnectedCall:v9];

      unsigned int v10 = [(PHAudioCallViewController *)self callCenter];
      [v10 disconnectCurrentCallAndActivateHeld];
    }
    else
    {
      [(PHAudioCallViewController *)self setCurrentState:0];
    }
  }
}

- (void)localAudioToggledWithIsMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHAudioCallViewController *)self audioCallMutedTalkerIsSupported])
  {
    if (!v3) {
      [(PHAudioCallViewController *)self setDidNotifyMutedCaller:0];
    }
    id v5 = [(PHAudioCallViewController *)self mutedTalkerBannerViewController];
    [v5 updatePillViewWithIsMuted:v3];
  }
}

- (void)voiceLoopManagerDidStartLoopPlayback:(id)a3
{
}

- (void)voiceLoopManagerDidStopLoopPlayback:(id)a3
{
}

- (void)audioCallVoiceLoopViewControllerRequestedButtonPresentation
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Voice loop controller requested button presentation", v5, 2u);
  }

  id v4 = [(PHAudioCallViewController *)self voiceLoopManager];
  [v4 stopLoopPlayback];
}

- (void)setMiddleViewState:(unsigned __int16)a3
{
}

- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4
{
}

- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v387 = a4;
  LODWORD(v5) = a3;
  id v7 = a5;
  id v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v470) = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setMiddleViewState: %d", buf, 8u);
  }

  id v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v385 = [(PHAudioCallViewController *)self buttonsViewController];
    unsigned int v10 = [v385 view];
    id v11 = [(PHAudioCallViewController *)self buttonsViewController];
    id v12 = [v11 view];
    [v12 alpha];
    uint64_t v14 = v13;
    id v15 = [(PHAudioCallViewController *)self buttonsViewController];
    [v15 view];
    unsigned int v17 = v16 = self;
    double v18 = [v17 superview];
    *(_DWORD *)buf = 138412802;
    v470 = v10;
    __int16 v471 = 2048;
    uint64_t v472 = v14;
    __int16 v473 = 2112;
    v474 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "current six-up is: %@, six-up view alpha is: %f, six-up view parent view is: %@", buf, 0x20u);

    self = v16;
  }

  double v19 = [(PHAudioCallViewController *)self currentMiddleView];
  v463[0] = _NSConcreteStackBlock;
  v463[1] = 3221225472;
  v463[2] = sub_1000F29E8;
  v463[3] = &unk_1002CE840;
  double v20 = (CGAffineTransform *)v7;
  v464 = v20;
  double v21 = objc_retainBlock(v463);
  p_cache = &OBJC_METACLASS___PHEmergencyHandsetDialerView.cache;
  if (+[PHUIConfiguration usesMiddleCenteringView])
  {
    double v23 = [(PHAudioCallViewController *)self middleSizingView];

    if (!v23)
    {
      id v24 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [(PHAudioCallViewController *)self setMiddleSizingView:v24];

      BOOL v25 = [(PHAudioCallViewController *)self middleSizingView];
      [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

      int v26 = [(PHAudioCallViewController *)self view];
      [(PHAudioCallViewController *)self middleSizingView];
      int v377 = (int)v5;
      v27 = id v5 = v21;
      [v26 addSubview:v27];

      id v28 = [(PHAudioCallViewController *)self view];
      double v29 = [(PHAudioCallViewController *)self middleSizingView];
      double v30 = [(PHAudioCallViewController *)self callParticipantsViewController];
      [v30 view];
      v32 = double v31 = v20;
      double v33 = +[NSLayoutConstraint constraintWithItem:v29 attribute:3 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:0.0];
      [v28 addConstraint:v33];

      double v34 = [(PHAudioCallViewController *)self view];
      double v35 = [(PHAudioCallViewController *)self middleSizingView];
      double v36 = [(PHCallViewController *)self bottomBar];
      double v37 = [v36 mainButtonLayoutGuide];
      unsigned int v38 = +[NSLayoutConstraint constraintWithItem:v35 attribute:4 relatedBy:0 toItem:v37 attribute:3 multiplier:1.0 constant:0.0];
      [v34 addConstraint:v38];

      double v20 = v31;
      p_cache = &OBJC_METACLASS___PHEmergencyHandsetDialerView.cache;

      __int16 v39 = [(PHAudioCallViewController *)self view];
      BOOL v40 = [(PHAudioCallViewController *)self middleSizingView];
      id v41 = +[NSLayoutConstraint constraintWithItem:v40 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
      [v39 addConstraint:v41];

      double v21 = v5;
      LODWORD(v5) = v377;
    }
  }
  if (self->_middleViewState != v5)
  {
    v386 = [(PHAudioCallViewController *)self frontmostCall];
    unsigned int v44 = [v386 canDisplayAlertUI:[self shouldPresentAlertButton]];
    v381 = v21;
    v384 = v20;
    double v20 = &v399;
    switch((int)v5)
    {
      case 0:
        dispatch_time_t v45 = [(PHAudioCallViewController *)self callParticipantsViewController];
        [v45 resetNameOverrideString];

        id v46 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        double v20 = v384;
        if ([v46 callDisplayStyle] != (id)3) {
          goto LABEL_45;
        }
        id v47 = [(PHAudioCallViewController *)self features];
        if ([v47 isDominoEnabled])
        {
          unsigned int v48 = [(PHAudioCallViewController *)self middleViewState];

          if (v48 == 1)
          {
            uint64_t v49 = [(PHCallViewController *)self bottomBar];
            [v49 setAlpha:1.0];

            uint64_t v50 = [(PHAudioCallViewController *)self buttonsViewController];
            [v50 setUpdatesPaused:1];

            unsigned int v51 = [(PHAudioCallViewController *)self buttonsViewController];
            int v52 = [(PHCallViewController *)self bottomBar];
            v406[0] = _NSConcreteStackBlock;
            v406[1] = 3221225472;
            v406[2] = sub_1000F325C;
            v406[3] = &unk_1002D0790;
            v406[4] = self;
            id v407 = v19;
            v408 = v384;
            +[AmbientAnimationCoordinator transitionFrom:v51 to:v52 allowRoll:0 completion:v406];

            id v43 = 0;
            BOOL v42 = 0;
            double v21 = v381;
LABEL_196:
            self->_middleViewState = (unsigned __int16)v5;
            [(PHAudioCallViewController *)self setCurrentMiddleView:v43];
            [(PHAudioCallViewController *)self refreshUseRTTButton];
            [(PHAudioCallViewController *)self refreshExtensionNumberButton];
            [(PHAudioCallViewController *)self hideOrShowScreeningBackgroundView];
            [(PHAudioCallViewController *)self updateCallRecordingIfNeeded];

            goto LABEL_197;
          }
        }
        else
        {

LABEL_45:
        }
        v404[0] = _NSConcreteStackBlock;
        v404[1] = 3221225472;
        v404[2] = sub_1000F32E4;
        v404[3] = &unk_1002CD518;
        id v180 = v19;
        id v405 = v180;
        BOOL v42 = objc_retainBlock(v404);
        v401[0] = _NSConcreteStackBlock;
        v401[1] = 3221225472;
        v401[2] = sub_1000F32F0;
        v401[3] = &unk_1002CE9D0;
        id v402 = v180;
        v403 = v384;
        double v21 = objc_retainBlock(v401);

        id v43 = 0;
        goto LABEL_187;
      case 1:
        unsigned int v53 = [(PHAudioCallViewController *)self buttonsViewController];
        double v54 = [v53 view];
        unsigned int v55 = [v54 superview];

        if (v55) {
          goto LABEL_116;
        }
        id v56 = [(PHAudioCallViewController *)self view];
        id v57 = [(PHAudioCallViewController *)self buttonsViewController];
        BOOL v58 = [v57 view];
        [v56 addSubview:v58];

        v59 = [(PHAudioCallViewController *)self buttonsViewController];
        id v60 = [v59 view];
        [v60 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v61 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        BOOL v62 = v19;
        if ([v61 callDisplayStyle] == (id)3)
        {
          BOOL v63 = [(PHAudioCallViewController *)self features];
          unsigned int v64 = [v63 isDominoEnabled];

          if (v64)
          {
            unsigned int v65 = [(PHAudioCallViewController *)self trailingSideLayoutGuide];
            objc_super v66 = [v65 centerXAnchor];
            v67 = [(PHAudioCallViewController *)self buttonsViewController];
            __int16 v68 = [v67 view];
            v69 = [v68 centerXAnchor];
            id v70 = [v66 constraintEqualToAnchor:v69];
            [v70 setActive:1];

            goto LABEL_60;
          }
        }
        else
        {
        }
        unsigned int v65 = [(PHAudioCallViewController *)self view];
        objc_super v66 = [(PHAudioCallViewController *)self buttonsViewController];
        v67 = [v66 view];
        __int16 v68 = [(PHAudioCallViewController *)self view];
        v69 = +[NSLayoutConstraint constraintWithItem:v67 attribute:9 relatedBy:0 toItem:v68 attribute:9 multiplier:1.0 constant:0.0];
        [v65 addConstraint:v69];
LABEL_60:

        [(PHAudioCallViewController *)self updateViewsForHeldCallControlsViewIfNeeded];
        v194 = [(PHAudioCallViewController *)self buttonsViewBottomConstraint];

        double v19 = v62;
        p_cache = &OBJC_METACLASS___PHEmergencyHandsetDialerView.cache;
        if (v194) {
          goto LABEL_116;
        }
        if (sub_100049888(0))
        {
          __int16 v195 = (__int16)v5;
          v196 = [(PHAudioCallViewController *)self view];
          v197 = [(PHAudioCallViewController *)self buttonsViewController];
          v198 = [v197 view];
          id v5 = self;
          v199 = [(PHAudioCallViewController *)self view];
          double v200 = 0.326797396;
          double v201 = 0.0;
          v202 = v198;
          uint64_t v203 = 3;
          v204 = v199;
          uint64_t v205 = 4;
        }
        else
        {
          if (sub_100049888((void *)3))
          {
            __int16 v195 = (__int16)v5;
            unsigned int v223 = +[PHUIConfiguration usesMiddleCenteringView];
            v196 = [(PHAudioCallViewController *)self view];
            v197 = [(PHAudioCallViewController *)self buttonsViewController];
            v198 = [v197 view];
            id v5 = self;
            if (v223)
            {
              v199 = [(PHAudioCallViewController *)self middleSizingView];
              double v200 = 1.0;
              double v201 = 0.0;
            }
            else
            {
              v199 = [(PHAudioCallViewController *)self view];
              double v200 = 1.0;
              double v201 = -12.0;
            }
          }
          else if (sub_100049888((void *)1))
          {
            __int16 v195 = (__int16)v5;
            v196 = [(PHAudioCallViewController *)self view];
            v197 = [(PHAudioCallViewController *)self buttonsViewController];
            v198 = [v197 view];
            id v5 = self;
            v199 = [(PHAudioCallViewController *)self view];
            double v200 = 1.0;
            double v201 = -2.0;
          }
          else
          {
            if (!sub_100049888((void *)2)) {
              goto LABEL_116;
            }
            __int16 v195 = (__int16)v5;
            v196 = [(PHAudioCallViewController *)self view];
            v197 = [(PHAudioCallViewController *)self buttonsViewController];
            v198 = [v197 view];
            id v5 = self;
            v199 = [(PHAudioCallViewController *)self view];
            double v200 = 1.0;
            double v201 = 2.0;
          }
          v202 = v198;
          uint64_t v203 = 10;
          v204 = v199;
          uint64_t v205 = 10;
        }
        v258 = +[NSLayoutConstraint constraintWithItem:v202 attribute:v203 relatedBy:0 toItem:v204 attribute:v205 multiplier:v200 constant:v201];
        [v196 addConstraint:v258];

        self = v5;
        LOWORD(v5) = v195;
        p_cache = (void **)(&OBJC_METACLASS___PHEmergencyHandsetDialerView + 16);
LABEL_116:
        v259 = [(PHAudioCallViewController *)self callParticipantsViewController];
        [v259 resetNameOverrideString];

        [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
        v260 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        if ([v260 callDisplayStyle] == (id)3)
        {
          v261 = [(PHAudioCallViewController *)self features];
          unsigned __int8 v262 = [v261 isDominoEnabled];

          if (v262)
          {
            [(PHAudioCallViewController *)self layoutParticipantsViewAnimated:0];
            goto LABEL_121;
          }
        }
        else
        {
        }
        v263 = [(PHAudioCallViewController *)self callParticipantsViewController];
        v264 = [v263 view];
        [v264 setNeedsLayout];

        v265 = [(PHAudioCallViewController *)self callParticipantsViewController];
        v266 = [v265 view];
        [v266 layoutIfNeeded];

LABEL_121:
        if (v44)
        {
          v267 = [(PHCallViewController *)self bottomBar];
          [v267 setCurrentState:22];

          v268 = [(PHAudioCallViewController *)self features];
          unsigned int v269 = [v268 isDialPadEnabled];

          if (!v269) {
            goto LABEL_144;
          }
LABEL_142:
          [(PHAudioCallViewController *)self hideOrShowKeypadBackgroundView];
          goto LABEL_144;
        }
        v270 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        if ([v270 callDisplayStyle])
        {
          v271 = [(PHAudioCallViewController *)self callDisplayStyleManager];
          if ([v271 callDisplayStyle] == (id)3)
          {
            v272 = [(PHAudioCallViewController *)self features];
            uint64_t v273 = [v272 isDominoEnabled] ^ 1;
          }
          else
          {
            uint64_t v273 = 1;
          }
        }
        else
        {
          uint64_t v273 = 0;
        }

        v274 = [(PHAudioCallViewController *)self features];
        if ([v274 isDialPadEnabled])
        {
          v275 = [(PHCallViewController *)self bottomBar];
          id v276 = [v275 currentState];

          if (v276 == (id)19) {
            uint64_t v273 = 0;
          }
          else {
            uint64_t v273 = v273;
          }
        }
        else
        {
        }
        v277 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        if ([v277 callDisplayStyle] == (id)3)
        {
          v278 = [(PHAudioCallViewController *)self features];
          unsigned __int8 v279 = [v278 isDominoEnabled];

          if (v279)
          {
LABEL_140:
            v281 = [(PHAudioCallViewController *)self features];
            if ([v281 isDialPadEnabled])
            {
              unsigned int v282 = [(PHAudioCallViewController *)self middleViewState];

              p_cache = (void **)(&OBJC_METACLASS___PHEmergencyHandsetDialerView + 16);
              if (!v282) {
                goto LABEL_144;
              }
              goto LABEL_142;
            }

            p_cache = &OBJC_METACLASS___PHEmergencyHandsetDialerView.cache;
LABEL_144:
            v283 = [(PHAudioCallViewController *)self buttonsViewController];
            id v43 = [v283 view];

            if ([(PHAudioCallViewController *)self middleViewState])
            {
              if ([(PHAudioCallViewController *)self middleViewState] == 2)
              {
                v284 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
                [p_cache + 213 yParticipantsViewAdjustmentForKeypad];
                double v286 = v285;
                [v284 constant];
                [v284 setConstant:v286 + v287];

                v288 = [(PHAudioCallViewController *)self features];
                unsigned __int8 v289 = [v288 isButtonLayoutEnabled];

                if ((v289 & 1) == 0)
                {
                  CGAffineTransformMakeScale(&v459, 1.20000005, 1.20000005);
                  CGAffineTransform v458 = v459;
                  [v43 setTransform:&v458];
                }
                [v43 setAlpha:0.0];
                v455[0] = _NSConcreteStackBlock;
                v455[1] = 3221225472;
                v455[2] = sub_1000F2A7C;
                v455[3] = &unk_1002CDFE8;
                v455[4] = self;
                id v43 = v43;
                id v456 = v43;
                id v290 = v19;
                id v457 = v290;
                BOOL v42 = objc_retainBlock(v455);
                v452[0] = _NSConcreteStackBlock;
                v452[1] = 3221225472;
                v452[2] = sub_1000F2B38;
                v452[3] = &unk_1002D0790;
                v452[4] = self;
                id v453 = v290;
                double v20 = v384;
                v454 = v384;
                double v21 = objc_retainBlock(v452);

                v291 = [(PHAudioCallViewController *)self features];
                if ([v291 isButtonLayoutEnabled])
                {
                }
                else
                {
                  v311 = [(PHAudioCallViewController *)self callDisplayStyleManager];
                  if ([v311 callDisplayStyle] != (id)3)
                  {

                    goto LABEL_176;
                  }
                  v312 = [(PHAudioCallViewController *)self features];
                  unsigned int v383 = [v312 isDominoEnabled];

                  if (!v383) {
                    goto LABEL_177;
                  }
                }
                v291 = [(PHCallViewController *)self bottomBar];
                [v291 setAlpha:0.0];
LABEL_176:

LABEL_177:
                v131 = v456;
LABEL_186:

                goto LABEL_187;
              }
              if ([(PHAudioCallViewController *)self middleViewState] == 4)
              {
                v303 = [(PHAudioCallViewController *)self callDisplayStyleManager];
                if ([v303 callDisplayStyle] == (id)3)
                {
                  v304 = [(PHAudioCallViewController *)self features];
                  unsigned int v305 = [v304 isDominoEnabled];

                  if (v305)
                  {
                    v306 = [(PHCallViewController *)self bottomBar];
                    v307 = [(PHAudioCallViewController *)self buttonsViewController];
                    v451[0] = _NSConcreteStackBlock;
                    v451[1] = 3221225472;
                    v451[2] = sub_1000F2BD8;
                    v451[3] = &unk_1002CD540;
                    v451[4] = self;
                    +[AmbientAnimationCoordinator transitionFrom:v306 to:v307 allowRoll:1 completion:v451];

                    v449[0] = _NSConcreteStackBlock;
                    v449[1] = 3221225472;
                    v449[2] = sub_1000F2C48;
                    v449[3] = &unk_1002CD518;
                    id v450 = v19;
                    BOOL v42 = objc_retainBlock(v449);

                    double v20 = v384;
LABEL_185:
                    v440[0] = _NSConcreteStackBlock;
                    v440[1] = 3221225472;
                    v440[2] = sub_1000F2CE8;
                    v440[3] = &unk_1002CE568;
                    id v441 = v19;
                    v443 = v20;
                    v442 = self;
                    double v21 = objc_retainBlock(v440);

                    v131 = v441;
                    goto LABEL_186;
                  }
                }
                else
                {
                }
                v315 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
                [p_cache + 213 yParticipantsViewAdjustmentForKeypad];
                double v317 = v316;
                [v315 constant];
                [v315 setConstant:v317 + v318];

                CGAffineTransformMakeScale(&v448, 1.20000005, 1.20000005);
                CGAffineTransform v447 = v448;
                [v43 setTransform:&v447];
                [v43 setAlpha:0.0];
                v444[0] = _NSConcreteStackBlock;
                v444[1] = 3221225472;
                v444[2] = sub_1000F2C54;
                v444[3] = &unk_1002CDDE0;
                id v445 = v43;
                id v446 = v19;
                v319 = objc_retainBlock(v444);
                v320 = [(PHAudioCallViewController *)self callDisplayStyleManager];
                id v321 = [v320 callDisplayStyle];

                if (v321)
                {
                  BOOL v42 = objc_retainBlock(v319);
                }
                else
                {
                  v323 = sub_1000D5130();
                  if (os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v323, OS_LOG_TYPE_DEFAULT, "The audio call UI is currently showing in a banner, animations on the middle view state will be queued up until we transition out of the banner.", buf, 2u);
                  }

                  [(PHAudioCallViewController *)self setPendingMiddleViewAnimations:v319];
                  BOOL v42 = 0;
                }
                double v20 = v384;

                goto LABEL_185;
              }
              double v21 = v381;
              if ([(PHAudioCallViewController *)self middleViewState] != 3)
              {
LABEL_167:
                BOOL v42 = 0;
                goto LABEL_195;
              }
              [v43 setAlpha:0.0];
              v437[0] = _NSConcreteStackBlock;
              v437[1] = 3221225472;
              v437[2] = sub_1000F2E98;
              v437[3] = &unk_1002CDDE0;
              id v313 = v19;
              id v438 = v313;
              id v43 = v43;
              id v439 = v43;
              BOOL v42 = objc_retainBlock(v437);
              v434[0] = _NSConcreteStackBlock;
              v434[1] = 3221225472;
              v434[2] = sub_1000F2EDC;
              v434[3] = &unk_1002CE9D0;
              id v435 = v313;
              double v20 = v384;
              v436 = v384;
              v178 = objc_retainBlock(v434);

              v179 = v438;
              goto LABEL_110;
            }
            v376 = v19;
            v292 = [(PHAudioCallViewController *)self callCenter];
            v293 = [v292 currentCallGroups];

            v294 = (char *)[v293 count];
            v295 = [(PHAudioCallViewController *)self callCenter];
            id v296 = [v295 currentVideoCallCount];

            v297 = [(PHAudioCallViewController *)self callDisplayStyleManager];
            if ([v297 callDisplayStyle] == (id)3)
            {
              v298 = [(PHAudioCallViewController *)self features];
              unsigned int v299 = [v298 isDominoEnabled];

              if (v299)
              {
                [v43 setAlpha:1.0];
                if (v387)
                {
                  BOOL v300 = &v294[(void)v296] < (char *)2;
                  v301 = [(PHCallViewController *)self bottomBar];
                  v302 = [(PHAudioCallViewController *)self buttonsViewController];
                  v462[0] = _NSConcreteStackBlock;
                  v462[1] = 3221225472;
                  v462[2] = sub_1000F2A04;
                  v462[3] = &unk_1002CD540;
                  v462[4] = self;
                  +[AmbientAnimationCoordinator transitionFrom:v301 to:v302 allowRoll:v300 completion:v462];
                }
                else
                {
                  v322 = [(PHCallViewController *)self bottomBar];
                  [v322 setCurrentState:11 animated:0 animationCompletionBlock:0];

                  [(PHAudioCallViewController *)self updateBottomBarAlphaWithCurrentState:[(PHCallViewController *)self currentState]];
                }
                BOOL v42 = 0;
                double v19 = v376;
                double v20 = v384;
LABEL_180:
                double v21 = v381;

                goto LABEL_187;
              }
            }
            else
            {
            }
            [v43 setAlpha:0.0];
            v460[0] = _NSConcreteStackBlock;
            v460[1] = 3221225472;
            v460[2] = sub_1000F2A70;
            v460[3] = &unk_1002CD518;
            id v461 = v43;
            v308 = objc_retainBlock(v460);
            v309 = [(PHAudioCallViewController *)self callDisplayStyleManager];
            id v310 = [v309 callDisplayStyle];

            double v20 = v384;
            if (v310)
            {
              BOOL v42 = objc_retainBlock(v308);
              double v19 = v376;
            }
            else
            {
              v314 = sub_1000D5130();
              double v19 = v376;
              if (os_log_type_enabled(v314, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v314, OS_LOG_TYPE_DEFAULT, "The audio call UI is currently showing in a banner, animations on the middle view state will be queued up until we transition out of the banner.", buf, 2u);
              }

              [(PHAudioCallViewController *)self setPendingMiddleViewAnimations:v308];
              BOOL v42 = 0;
            }

            goto LABEL_180;
          }
        }
        else
        {
        }
        v280 = [(PHCallViewController *)self bottomBar];
        [v280 setCurrentState:11 animated:v273 animationCompletionBlock:0];

        goto LABEL_140;
      case 2:
        BOOL v71 = [(PHAudioCallViewController *)self keypadViewController];
        __int16 v72 = [v71 view];
        unsigned int v73 = [v72 superview];

        if (v73) {
          goto LABEL_94;
        }
        char v74 = [(PHAudioCallViewController *)self view];
        unsigned int v75 = [(PHAudioCallViewController *)self keypadViewController];
        unsigned int v76 = [v75 view];
        [v74 addSubview:v76];

        v77 = +[UIColor clearColor];
        BOOL v78 = [(PHAudioCallViewController *)self keypadViewController];
        id v79 = [v78 view];
        [v79 setBackgroundColor:v77];

        unsigned int v80 = [(PHAudioCallViewController *)self keypadViewController];
        unsigned int v81 = [v80 view];
        [v81 setTranslatesAutoresizingMaskIntoConstraints:0];

        char v82 = [(PHAudioCallViewController *)self view];
        id v83 = [(PHAudioCallViewController *)self keypadViewController];
        v84 = [v83 view];
        id v85 = [(PHAudioCallViewController *)self view];
        unsigned __int8 v86 = +[NSLayoutConstraint constraintWithItem:v84 attribute:9 relatedBy:0 toItem:v85 attribute:9 multiplier:1.0 constant:0.0];
        [v82 addConstraint:v86];

        v87 = [(PHAudioCallViewController *)self features];
        LODWORD(v82) = [v87 isButtonLayoutEnabled];

        if (v82)
        {
          v88 = +[UIScreen mainScreen];
          [v88 bounds];
          double v90 = v89;
          double v92 = v91;

          if (v90 >= v92) {
            double v93 = v92;
          }
          else {
            double v93 = v90;
          }
          if (v90 < v92) {
            double v90 = v92;
          }
          +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio];
          double v95 = v94 * v90;
          *(float *)&double v94 = v93 * 0.1976;
          double v96 = roundf(*(float *)&v94);
          +[PHUIConfiguration distanceBetweenEndButtonAndKeyPadLastRow];
          double v98 = v90 * v97;
          +[TPNumberPadButton verticalPadding];
          double v100 = v98 + v95 + v96 - v99;
          v101 = [(PHAudioCallViewController *)self keypadViewController];
          v102 = [v101 view];
          id v103 = [(PHAudioCallViewController *)self view];
          v104 = +[NSLayoutConstraint constraintWithItem:v102 attribute:4 relatedBy:0 toItem:v103 attribute:4 multiplier:1.0 constant:-v100];

          goto LABEL_49;
        }
        if (+[PHUIConfiguration usesMiddleCenteringView])
        {
          v181 = [(PHAudioCallViewController *)self keypadViewController];
          v182 = [v181 view];
          v183 = [(PHAudioCallViewController *)self middleSizingView];
          v104 = +[NSLayoutConstraint constraintWithItem:v182 attribute:10 relatedBy:0 toItem:v183 attribute:10 multiplier:1.0 constant:0.0];

          LODWORD(v184) = 1144750080;
          [v104 setPriority:v184];
LABEL_49:
          v185 = [(PHAudioCallViewController *)self view];
          [v185 addConstraint:v104];
          goto LABEL_93;
        }
        v218 = [(PHAudioCallViewController *)self features];
        unsigned int v219 = [v218 isDialPadEnabled];

        unint64_t v220 = +[PHUIConfiguration inCallControlSpacing];
        BOOL v221 = v220 == 5;
        if (v219)
        {
          if (v220 == 5)
          {
            double v222 = 52.0;
LABEL_84:
            v374 = v19;
            __int16 v380 = (__int16)v5;
            if (v44)
            {
              if ((id)+[PHUIConfiguration inCallControlSpacing] == (id)5)double v222 = 32.0; {
              else
              }
                double v222 = 0.0;
            }
            [(PHAudioCallViewController *)self updateViewsForHeldCallControlsViewIfNeeded];
            v225 = [(PHAudioCallViewController *)self keypadViewController];
            v226 = [v225 view];
            v227 = [v226 centerYAnchor];
            v228 = [(PHAudioCallViewController *)self view];
            v229 = [v228 centerYAnchor];
            v104 = [v227 constraintEqualToAnchor:v229 constant:v222];

            v230 = [(PHAudioCallViewController *)self features];
            unsigned int v231 = [v230 shouldEmbedSwapBanner];
            LODWORD(v232) = 1144750080;
            if (v231) {
              *(float *)&double v232 = 250.0;
            }
            [v104 setPriority:v232];

            v468[0] = v104;
            v185 = [(PHAudioCallViewController *)self keypadViewController];
            v233 = [v185 view];
            v234 = [v233 bottomAnchor];
            v235 = [(PHCallViewController *)self bottomBar];
            v236 = [v235 topLayoutGuide];
            v237 = [v236 topAnchor];
            unint64_t v238 = +[PHUIConfiguration inCallControlSpacing];
            double v239 = -4.0;
            if (v238 > 1) {
              double v239 = -9.0;
            }
            [v234 constraintLessThanOrEqualToAnchor:v237 constant:v239];
            v240 = id v5 = self;
            v468[1] = v240;
            v241 = +[NSArray arrayWithObjects:v468 count:2];
            +[NSLayoutConstraint activateConstraints:v241];

            self = v5;
            LOWORD(v5) = v380;
            double v19 = v374;
LABEL_93:

LABEL_94:
            v242 = [(PHAudioCallViewController *)self features];
            unsigned int v243 = [v242 isDialPadEnabled];

            v244 = [(PHCallViewController *)self bottomBar];
            v245 = v244;
            if (v243)
            {
              [v244 setCurrentState:19 animated:0 animationCompletionBlock:0];

              [(PHAudioCallViewController *)self hideOrShowKeypadBackgroundView];
              [(PHAudioCallViewController *)self updateEnhancedEmergencyViewWhenKeypadPresented];
            }
            else
            {
              [v244 setCurrentState:19 animated:1 animationCompletionBlock:0];
            }
            v246 = [(PHAudioCallViewController *)self keypadViewController];
            id v43 = [v246 view];

            v247 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
            +[PHUIConfiguration yParticipantsViewAdjustmentForKeypad];
            double v249 = v248;
            [v247 constant];
            [v247 setConstant:v250 - v249];

            if ([(PHAudioCallViewController *)self middleViewState] != 1)
            {
              BOOL v42 = 0;
              double v21 = v381;
              double v20 = v384;
              goto LABEL_196;
            }
            v251 = [(PHAudioCallViewController *)self features];
            unsigned __int8 v252 = [v251 isButtonLayoutEnabled];

            if ((v252 & 1) == 0)
            {
              CGAffineTransformMakeScale(&v433, 0.100000001, 0.100000001);
              CGAffineTransform v432 = v433;
              [v43 setTransform:&v432];
            }
            [v43 setAlpha:0.0];
            v428[0] = _NSConcreteStackBlock;
            v428[1] = 3221225472;
            v428[2] = sub_1000F2F40;
            v428[3] = &unk_1002CDFE8;
            id v253 = v19;
            id v429 = v253;
            id v43 = v43;
            id v430 = v43;
            v431 = self;
            BOOL v42 = objc_retainBlock(v428);
            v425[0] = _NSConcreteStackBlock;
            v425[1] = 3221225472;
            v425[2] = sub_1000F2FFC;
            v425[3] = &unk_1002D0790;
            v425[4] = self;
            id v426 = v253;
            double v20 = v384;
            v427 = v384;
            v178 = objc_retainBlock(v425);

            v254 = [(PHAudioCallViewController *)self features];
            if ([v254 isButtonLayoutEnabled])
            {
            }
            else
            {
              v375 = v19;
              v255 = [(PHAudioCallViewController *)self callDisplayStyleManager];
              if ([v255 callDisplayStyle] != (id)3)
              {

                goto LABEL_108;
              }
              [(PHAudioCallViewController *)self features];
              v257 = v256 = v178;
              unsigned int v382 = [v257 isDominoEnabled];

              v178 = v256;
              double v19 = v375;
              if (!v382) {
                goto LABEL_109;
              }
            }
            v254 = [(PHCallViewController *)self bottomBar];
            [v254 setAlpha:1.0];
LABEL_108:

LABEL_109:
            v179 = v429;
LABEL_110:

            double v21 = v178;
LABEL_187:
            if (!v42) {
              goto LABEL_196;
            }
            if (!v387)
            {
              ((void (*)(void *))v42[2])(v42);
              if (v21) {
                ((void (*)(PHAudioCallViewController *, uint64_t))v21->super._senderIdentityClient)(v21, 1);
              }
              goto LABEL_196;
            }
            v324 = [(PHAudioCallViewController *)self features];
            unsigned int v325 = [v324 isButtonLayoutEnabled];

            if (v325)
            {
              v326 = [(PHAudioCallViewController *)self view];
              v390[0] = _NSConcreteStackBlock;
              v390[1] = 3221225472;
              v390[2] = sub_1000F3590;
              v390[3] = &unk_1002CDA98;
              BOOL v42 = v42;
              id v391 = v42;
              +[UIView transitionWithView:v326 duration:5242880 options:v390 animations:v21 completion:0.200000003];

              v327 = v391;
            }
            else
            {
              v388[0] = _NSConcreteStackBlock;
              v388[1] = 3221225472;
              v388[2] = sub_1000F35A0;
              v388[3] = &unk_1002CDA98;
              BOOL v42 = v42;
              id v389 = v42;
              +[UIView animateWithDuration:v388 animations:v21 completion:0.200000003];
              v327 = v389;
            }

LABEL_195:
            double v20 = v384;
            goto LABEL_196;
          }
          BOOL v221 = +[PHUIConfiguration inCallControlSpacing] == 0;
          double v224 = -5.0;
        }
        else
        {
          double v224 = 16.0;
        }
        if (v221) {
          double v222 = v224;
        }
        else {
          double v222 = 0.0;
        }
        goto LABEL_84;
      case 3:
        BOOL v105 = [(PHAudioCallViewController *)self voiceLoopViewController];
        v106 = [v105 view];
        id v107 = [v106 superview];

        if (!v107)
        {
          v108 = [(PHAudioCallViewController *)self view];
          v109 = [(PHAudioCallViewController *)self voiceLoopViewController];
          v110 = [v109 view];
          [v108 addSubview:v110];

          id v111 = [(PHAudioCallViewController *)self voiceLoopViewController];
          v112 = [v111 view];
          [v112 setTranslatesAutoresizingMaskIntoConstraints:0];

          v370 = [(PHAudioCallViewController *)self voiceLoopViewController];
          v368 = [v370 view];
          v364 = [v368 centerXAnchor];
          v366 = [(PHAudioCallViewController *)self view];
          v362 = [v366 centerXAnchor];
          v360 = [v364 constraintEqualToAnchor:v362];
          v467[0] = v360;
          v358 = [(PHAudioCallViewController *)self voiceLoopViewController];
          v356 = [v358 view];
          v352 = [v356 leadingAnchor];
          v354 = [(PHAudioCallViewController *)self view];
          v350 = [v354 leadingAnchor];
          v348 = [v352 constraintEqualToAnchor:v350];
          v467[1] = v348;
          v346 = [(PHAudioCallViewController *)self voiceLoopViewController];
          v344 = [v346 view];
          v339 = [v344 trailingAnchor];
          v341 = [(PHAudioCallViewController *)self view];
          v337 = [v341 trailingAnchor];
          v335 = [v339 constraintEqualToAnchor:v337];
          v467[2] = v335;
          v334 = [(PHAudioCallViewController *)self voiceLoopViewController];
          v333 = [v334 view];
          v331 = [v333 topAnchor];
          v332 = [(PHAudioCallViewController *)self callParticipantsViewController];
          v330 = [v332 view];
          v329 = [v330 bottomAnchor];
          v328 = [v331 constraintEqualToAnchor:v329];
          v467[3] = v328;
          [(PHAudioCallViewController *)self voiceLoopViewController];
          __int16 v378 = (__int16)v5;
          v113 = id v5 = self;
          v114 = [v113 view];
          v115 = [v114 bottomAnchor];
          v116 = [(PHCallViewController *)v5 bottomBar];
          v117 = [v116 topLayoutGuide];
          v118 = [v117 topAnchor];
          unsigned int v119 = [v115 constraintEqualToAnchor:v118];
          v467[4] = v119;
          v120 = +[NSArray arrayWithObjects:v467 count:5];
          +[NSLayoutConstraint activateConstraints:v120];

          self = v5;
          LOWORD(v5) = v378;
        }
        v121 = [(PHAudioCallViewController *)self callParticipantsViewController];
        [v121 resetNameOverrideString];

        v122 = [(PHAudioCallViewController *)self callParticipantsViewController];
        __int16 v123 = [v122 view];
        [v123 setNeedsLayout];

        unsigned int v124 = [(PHAudioCallViewController *)self callParticipantsViewController];
        __int16 v125 = [v124 view];
        [v125 layoutIfNeeded];

        unsigned int v126 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        BOOL v127 = [v126 callDisplayStyle] != 0;

        unsigned int v128 = [(PHCallViewController *)self bottomBar];
        [v128 setCurrentState:11 animated:v127 animationCompletionBlock:0];

        v129 = [(PHAudioCallViewController *)self voiceLoopViewController];
        id v43 = [v129 view];

        if (![(PHAudioCallViewController *)self middleViewState])
        {
          [v43 setAlpha:0.0];
          v423[0] = _NSConcreteStackBlock;
          v423[1] = 3221225472;
          v423[2] = sub_1000F309C;
          v423[3] = &unk_1002CD518;
          id v43 = v43;
          id v424 = v43;
          v170 = objc_retainBlock(v423);
          v171 = [(PHAudioCallViewController *)self callDisplayStyleManager];
          id v172 = [v171 callDisplayStyle];

          if (v172)
          {
            BOOL v42 = objc_retainBlock(v170);
            double v20 = v384;
          }
          else
          {
            v217 = sub_1000D5130();
            double v20 = v384;
            if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEFAULT, "The audio call UI is currently showing in a banner, animations on the middle view state will be queued up until we transition out of the banner.", buf, 2u);
            }

            [(PHAudioCallViewController *)self setPendingMiddleViewAnimations:v170];
            BOOL v42 = 0;
          }

          double v21 = v381;
          goto LABEL_187;
        }
        if ([(PHAudioCallViewController *)self middleViewState] == 1)
        {
          [v43 setAlpha:0.0];
          v420[0] = _NSConcreteStackBlock;
          v420[1] = 3221225472;
          v420[2] = sub_1000F30A8;
          v420[3] = &unk_1002CDDE0;
          id v130 = v19;
          id v421 = v130;
          id v43 = v43;
          id v422 = v43;
          BOOL v42 = objc_retainBlock(v420);
          v417[0] = _NSConcreteStackBlock;
          v417[1] = 3221225472;
          v417[2] = sub_1000F30EC;
          v417[3] = &unk_1002CE9D0;
          id v418 = v130;
          double v20 = v384;
          v419 = v384;
          double v21 = objc_retainBlock(v417);

          v131 = v421;
          goto LABEL_186;
        }
        double v21 = v381;
        if ([(PHAudioCallViewController *)self middleViewState] == 2)
        {
          v173 = [(PHAudioCallViewController *)self participantsViewTopConstraint];
          +[PHUIConfiguration yParticipantsViewAdjustmentForKeypad];
          double v175 = v174;
          [v173 constant];
          [v173 setConstant:v175 + v176];

          CGAffineTransformMakeScale(&v416, 1.20000005, 1.20000005);
          CGAffineTransform v415 = v416;
          [v43 setTransform:&v415];
          [v43 setAlpha:0.0];
          v412[0] = _NSConcreteStackBlock;
          v412[1] = 3221225472;
          v412[2] = sub_1000F3150;
          v412[3] = &unk_1002CDDE0;
          id v43 = v43;
          id v413 = v43;
          id v177 = v19;
          id v414 = v177;
          BOOL v42 = objc_retainBlock(v412);
          v409[0] = _NSConcreteStackBlock;
          v409[1] = 3221225472;
          v409[2] = sub_1000F31E4;
          v409[3] = &unk_1002CE9D0;
          id v410 = v177;
          double v20 = v384;
          v411 = v384;
          v178 = objc_retainBlock(v409);

          v179 = v413;
          goto LABEL_110;
        }
        goto LABEL_167;
      case 4:
        BOOL v132 = [(PHAudioCallViewController *)self middleViewState] != 1 && v387;
        BOOL v387 = v132;
        v133 = [(PHAudioCallViewController *)self screeningViewController];
        v134 = [v133 view];
        v135 = [v134 superview];

        if (v135) {
          goto LABEL_66;
        }
        v136 = [(PHAudioCallViewController *)self view];
        v137 = [(PHAudioCallViewController *)self screeningViewController];
        v138 = [v137 view];
        [v136 addSubview:v138];

        v139 = [(PHAudioCallViewController *)self screeningViewController];
        v140 = [v139 view];
        [v140 setTranslatesAutoresizingMaskIntoConstraints:0];

        v141 = [(PHAudioCallViewController *)self screeningViewController];
        v142 = [v141 view];
        [v142 setContentCompressionResistancePriority:0 forAxis:0.0];

        v143 = [(PHAudioCallViewController *)self screeningViewController];
        v144 = [v143 view];
        [v144 setContentCompressionResistancePriority:1 forAxis:0.0];

        v145 = [(PHAudioCallViewController *)self screeningViewController];
        v146 = [v145 view];
        [v146 setContentHuggingPriority:0 forAxis:0.0];

        v147 = [(PHAudioCallViewController *)self screeningViewController];
        v148 = [v147 view];
        [v148 setContentHuggingPriority:1 forAxis:0.0];

        v149 = objc_opt_new();
        [(PHAudioCallViewController *)self setScreeningConstraints:v149];

        v150 = [(PHAudioCallViewController *)self callDisplayStyleManager];
        v372 = self;
        if ([v150 callDisplayStyle] == (id)3)
        {
          v151 = [(PHAudioCallViewController *)self features];
          unsigned int v152 = [v151 isDominoEnabled];

          if (v152)
          {
            v338 = [(PHAudioCallViewController *)self screeningViewController];
            v336 = [v338 view];
            v153 = [v336 trailingAnchor];
            v371 = [(PHCallViewController *)self bottomBar];
            v369 = [v371 mainButtonLayoutGuide];
            [v369 leadingAnchor];
            v367 = v379 = v153;
            v365 = [v153 constraintEqualToAnchor:-20.0];
            v466[0] = v365;
            v363 = [(PHAudioCallViewController *)self screeningViewController];
            v361 = [v363 view];
            v154 = [v361 leadingAnchor];
            v357 = [(PHAudioCallViewController *)self view];
            v355 = [v357 safeAreaLayoutGuide];
            [v355 leadingAnchor];
            v353 = v359 = v154;
            v351 = [v154 constraintEqualToAnchor:];
            v466[1] = v351;
            v349 = [(PHAudioCallViewController *)self screeningViewController];
            v347 = [v349 view];
            v155 = [v347 topAnchor];
            v343 = [(PHAudioCallViewController *)self callParticipantsViewController];
            v342 = [v343 view];
            [v342 bottomAnchor];
            v340 = v345 = v155;
            v156 = [v155 constraintEqualToAnchor:];
            v466[2] = v156;
            v157 = [(PHAudioCallViewController *)self screeningViewController];
            v158 = [v157 view];
            v159 = [v158 bottomAnchor];
            [(PHAudioCallViewController *)self view];
            v373 = v19;
            __int16 v160 = (__int16)v5;
            v161 = id v5 = self;
            v162 = [v161 bottomAnchor];
            +[PHUIConfiguration ambientVerticalPadding];
            v164 = [v159 constraintEqualToAnchor:v162 constant:-v163];
            v466[3] = v164;
            v165 = +[NSArray arrayWithObjects:v466 count:4];
            v166 = v5;
            LOWORD(v5) = v160;
            v167 = [(PHAudioCallViewController *)v166 screeningConstraints];
            [v167 setConstraintsStatePrimary:v165];

            double v19 = v373;
            v168 = v338;

            v169 = v336;
            goto LABEL_65;
          }
        }
        else
        {
        }
        v186 = +[UIScreen mainScreen];
        [v186 bounds];
        double v188 = v187;
        double v190 = v189;

        if (v188 >= v190) {
          double v191 = v190;
        }
        else {
          double v191 = v188;
        }
        if (v188 >= v190) {
          double v190 = v188;
        }
        double v192 = v191 * 0.102;
        if (+[PHUIConfiguration usesMiddleCenteringView])
        {
          v193 = [(PHAudioCallViewController *)self middleSizingView];
          v168 = [v193 centerYAnchor];
        }
        else
        {
          v193 = [(PHAudioCallViewController *)self callParticipantsViewController];
          v206 = [v193 view];
          v168 = [v206 bottomAnchor];
        }
        v207 = [(PHAudioCallViewController *)self view];
        v208 = [(PHAudioCallViewController *)self screeningConstraints];
        [v208 setView:v207];

        v169 = [(PHAudioCallViewController *)self view];
        v209 = [v169 trailingAnchor];
        v371 = [(PHAudioCallViewController *)self screeningViewController];
        v369 = [v371 view];
        [v369 trailingAnchor];
        v367 = v379 = v209;
        v365 = [v209 constraintEqualToAnchor:v192];
        v465[0] = v365;
        v363 = [(PHAudioCallViewController *)self screeningViewController];
        v361 = [v363 view];
        v210 = [v361 leadingAnchor];
        v357 = [(PHAudioCallViewController *)self view];
        [v357 leadingAnchor];
        v355 = v359 = v210;
        v353 = [v210 constraintEqualToAnchor:v192];
        v465[1] = v353;
        v351 = [(PHCallViewController *)self bottomBar];
        v349 = [v351 mainButtonLayoutGuide];
        v211 = [v349 topAnchor];
        v345 = [(PHAudioCallViewController *)self screeningViewController];
        v343 = [v345 view];
        [v343 bottomAnchor];
        v342 = v347 = v211;
        v340 = [v211 constraintEqualToAnchor:v190 * 0.0425];
        v465[2] = v340;
        v156 = [(PHAudioCallViewController *)self screeningViewController];
        v157 = [v156 view];
        v158 = [v157 topAnchor];
        v159 = [v158 constraintEqualToAnchor:v168 constant:v190 * 0.0475];
        v465[3] = v159;
        uint64_t v212 = +[NSArray arrayWithObjects:v465 count:4];
        v213 = self;
        v161 = (void *)v212;
        v162 = [(PHAudioCallViewController *)v213 screeningConstraints];
        [v162 setConstraintsStatePrimary:v161];
LABEL_65:

        self = v372;
LABEL_66:
        [(PHAudioCallViewController *)self hideOrShowScreeningBackgroundView];
        v214 = [(PHAudioCallViewController *)self screeningViewController];
        v215 = [v214 view];

        CGAffineTransformMakeScale(&v400, 0.100000001, 0.100000001);
        CGAffineTransform v399 = v400;
        [v215 setTransform:&v399];
        [v215 setAlpha:0.0];
        v396[0] = _NSConcreteStackBlock;
        v396[1] = 3221225472;
        v396[2] = sub_1000F334C;
        v396[3] = &unk_1002CDDE0;
        id v216 = v19;
        id v397 = v216;
        id v43 = v215;
        id v398 = v43;
        BOOL v42 = objc_retainBlock(v396);
        v392[0] = _NSConcreteStackBlock;
        v392[1] = 3221225472;
        v392[2] = sub_1000F33E0;
        v392[3] = &unk_1002CE568;
        id v393 = v216;
        double v20 = v384;
        v394 = self;
        v395 = v384;
        double v21 = objc_retainBlock(v392);

        v131 = v397;
        goto LABEL_186;
      default:
        id v43 = 0;
        BOOL v42 = 0;
        goto LABEL_196;
    }
  }
  BOOL v42 = 0;
  id v43 = 0;
LABEL_197:
}

- (void)updateViewsForHeldCallControlsViewIfNeeded
{
  if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    BOOL v3 = [(PHAudioCallViewController *)self heldCallControlsView];
    [v3 removeFromSuperview];

    [(PHAudioCallViewController *)self setHeldCallControlsView:0];
    [(PHAudioCallViewController *)self setupHeldCallControlsViewIfNeeded];
    [(PHAudioCallViewController *)self constrainButtonsViewBottom];
    [(PHAudioCallViewController *)self constrainBottomBarBottom];
  }
}

- (void)constrainButtonsViewBottom
{
  id v4 = [(PHAudioCallViewController *)self buttonsViewBottomConstraintToUse];
  if (v4)
  {
    BOOL v3 = [(PHAudioCallViewController *)self buttonsViewBottomConstraint];
    [v3 setActive:0];

    [(PHAudioCallViewController *)self setButtonsViewBottomConstraint:v4];
    [v4 setActive:1];
  }
}

- (void)constrainBottomBarBottom
{
  id v4 = [(PHAudioCallViewController *)self bottomBarBottomConstraintToUse];
  if (v4)
  {
    BOOL v3 = [(PHAudioCallViewController *)self bottomBarBottomConstraint];
    [v3 setActive:0];

    [(PHAudioCallViewController *)self setBottomBarBottomConstraint:v4];
    [v4 setActive:1];
  }
}

- (id)buttonsViewBottomConstraintToUse
{
  id v4 = [(PHAudioCallViewController *)self buttonsViewController];
  id v5 = [v4 view];
  char v6 = [v5 superview];

  if (!v6) {
    goto LABEL_29;
  }
  id v7 = [(PHAudioCallViewController *)self emergencyPhotoPickerGrabberView];

  if (v7)
  {
    id v8 = [(PHAudioCallViewController *)self buttonsViewController];
    id v9 = [v8 view];
    unsigned int v10 = [v9 bottomAnchor];
    id v11 = [(PHAudioCallViewController *)self emergencyPhotoPickerGrabberView];
    id v12 = [v11 topAnchor];
    uint64_t v13 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v14 = [v13 callDisplayStyle];
    if (v14 == (id)3)
    {
      id v2 = [(PHAudioCallViewController *)self features];
      if ([v2 isDominoEnabled])
      {
        +[PHUIConfiguration ambientVerticalPadding];
        double v16 = (v15 + 32.0) * -2.5;
      }
      else
      {
        double v16 = -50.0;
      }
    }
    else
    {
      double v16 = -50.0;
    }
LABEL_20:
    id v28 = [v10 constraintEqualToAnchor:v12 constant:v16];
    if (v14 == (id)3) {

    }
LABEL_23:
    goto LABEL_30;
  }
  uint64_t v17 = [(PHAudioCallViewController *)self heldCallControlsView];
  if (v17)
  {
    double v18 = (void *)v17;
    double v19 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v19 callDisplayStyle] == (id)3)
    {
      double v20 = [(PHAudioCallViewController *)self features];
      unsigned __int8 v21 = [v20 isDominoEnabled];

      if (v21) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v8 = [(PHAudioCallViewController *)self buttonsViewController];
    id v9 = [v8 view];
    unsigned int v10 = [v9 bottomAnchor];
    id v11 = [(PHAudioCallViewController *)self heldCallControlsView];
    uint64_t v25 = [v11 topAnchor];
LABEL_16:
    id v12 = (void *)v25;
    uint64_t v13 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v14 = [v13 callDisplayStyle];
    double v26 = 20.0;
    if (v14 == (id)3)
    {
      id v2 = [(PHAudioCallViewController *)self features];
      if ([v2 isDominoEnabled])
      {
        +[PHUIConfiguration ambientVerticalPadding];
        double v26 = v27 + 32.0;
      }
    }
    double v16 = -v26;
    goto LABEL_20;
  }
LABEL_9:
  unsigned int v22 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v22 callDisplayStyle] == (id)3)
  {
    double v23 = [(PHAudioCallViewController *)self features];
    unsigned int v24 = [v23 isDominoEnabled];

    if (v24)
    {
      id v8 = [(PHAudioCallViewController *)self buttonsViewController];
      id v9 = [v8 view];
      unsigned int v10 = [v9 bottomAnchor];
      id v11 = [(PHAudioCallViewController *)self view];
      uint64_t v25 = [v11 bottomAnchor];
      goto LABEL_16;
    }
  }
  else
  {
  }
  double v29 = [(PHAudioCallViewController *)self features];
  unsigned int v30 = [v29 isButtonLayoutEnabled];

  if (v30)
  {
    double v31 = +[UIScreen mainScreen];
    [v31 bounds];
    double v33 = v32;
    double v35 = v34;

    if (v33 >= v35) {
      double v35 = v33;
    }
    +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio];
    double v37 = v36;
    id v8 = [(PHAudioCallViewController *)self buttonsViewController];
    id v9 = [v8 view];
    unsigned int v10 = [v9 bottomAnchor];
    id v11 = [(PHAudioCallViewController *)self view];
    id v12 = [v11 bottomAnchor];
    id v28 = [v10 constraintEqualToAnchor:v12 constant:-(v35 * v37)];
    goto LABEL_23;
  }
LABEL_29:
  id v28 = 0;
LABEL_30:

  return v28;
}

- (id)bottomBarBottomConstraintToUse
{
  uint64_t v4 = [(PHAudioCallViewController *)self heldCallControlsView];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v6 callDisplayStyle] == (id)3)
    {
      id v7 = [(PHAudioCallViewController *)self features];
      unsigned __int8 v8 = [v7 isDominoEnabled];

      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    id v11 = [(PHCallViewController *)self bottomBar];
    id v12 = [v11 bottomAnchor];
    uint64_t v13 = [(PHAudioCallViewController *)self heldCallControlsView];
    uint64_t v17 = [v13 topAnchor];
    goto LABEL_8;
  }
LABEL_4:
  id v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 == (id)1)
  {
    id v11 = [(PHCallViewController *)self bottomBar];
    id v12 = [v11 bottomAnchor];
    uint64_t v13 = [(PHAudioCallViewController *)self view];
    id v14 = [v13 safeAreaLayoutGuide];
    double v15 = [v14 bottomAnchor];
    double v16 = [v12 constraintEqualToAnchor:v15];
LABEL_13:

    goto LABEL_14;
  }
  unsigned int v22 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v22 callDisplayStyle] == (id)3)
  {
    double v23 = [(PHAudioCallViewController *)self features];
    unsigned int v24 = [v23 isDominoEnabled];

    if (v24)
    {
      id v11 = [(PHCallViewController *)self bottomBar];
      id v12 = [v11 bottomAnchor];
      uint64_t v13 = [(PHAudioCallViewController *)self view];
      uint64_t v17 = [v13 bottomAnchor];
LABEL_8:
      id v14 = (void *)v17;
      double v15 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      id v18 = [v15 callDisplayStyle];
      double v19 = 20.0;
      if (v18 == (id)3)
      {
        id v2 = [(PHAudioCallViewController *)self features];
        if ([v2 isDominoEnabled])
        {
          +[PHUIConfiguration ambientVerticalPadding];
          double v19 = v20 + 32.0;
        }
      }
      double v16 = [v12 constraintEqualToAnchor:v14 constant:-v19];
      if (v18 == (id)3) {

      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v25 = [(PHAudioCallViewController *)self features];
  [v25 isButtonLayoutEnabled];

  id v11 = [(PHCallViewController *)self bottomBar];
  id v12 = [v11 bottomAnchor];
  uint64_t v13 = [(PHAudioCallViewController *)self view];
  id v14 = [v13 bottomAnchor];
  double v16 = [v12 constraintEqualToAnchor:v14];
LABEL_14:

  return v16;
}

- (void)setupHeldCallControlsViewIfNeeded
{
  BOOL v3 = [(PHAudioCallViewController *)self heldCallControlsView];

  if (!v3)
  {
    uint64_t v4 = [(PHAudioCallViewController *)self callCenter];
    id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    char v6 = -[PHAudioCallViewController makeHeldCallControlsViewWithCallCenter:style:](self, "makeHeldCallControlsViewWithCallCenter:style:", v4, [v5 callDisplayStyle]);
    [(PHAudioCallViewController *)self setHeldCallControlsView:v6];

    id v7 = [(PHAudioCallViewController *)self heldCallControlsView];

    if (v7)
    {
      unsigned __int8 v8 = [(PHAudioCallViewController *)self view];
      id v9 = [(PHAudioCallViewController *)self heldCallControlsView];
      [v8 addSubview:v9];

      id v10 = [(PHAudioCallViewController *)self heldCallControlsView];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v11 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      if ([v11 callDisplayStyle] == (id)3)
      {
        id v12 = [(PHAudioCallViewController *)self features];
        unsigned int v13 = [v12 isDominoEnabled];

        if (v13)
        {
          id v14 = [(PHAudioCallViewController *)self heldCallControlsView];
          double v15 = [v14 leadingAnchor];
          double v16 = [(PHAudioCallViewController *)self view];
          uint64_t v17 = [v16 leadingAnchor];
          id v18 = [v15 constraintEqualToAnchor:v17 constant:10.0];
          v39[0] = v18;
          double v37 = [(PHAudioCallViewController *)self heldCallControlsView];
          double v19 = [v37 bottomAnchor];
          double v35 = [(PHAudioCallViewController *)self view];
          double v34 = [v35 safeAreaLayoutGuide];
          [v34 bottomAnchor];
          double v33 = v36 = v19;
          double v32 = [v19 constraintEqualToAnchor:];
          v39[1] = v32;
          double v31 = [(PHAudioCallViewController *)self heldCallControlsView];
          double v20 = [v31 trailingAnchor];
          unsigned __int8 v21 = [(PHAudioCallViewController *)self leadingSideLayoutGuide];
          unsigned int v22 = [v21 trailingAnchor];
          double v23 = [v20 constraintEqualToAnchor:v22 constant:20.0];
          v39[2] = v23;
          unsigned int v24 = +[NSArray arrayWithObjects:v39 count:3];
          +[NSLayoutConstraint activateConstraints:v24];
LABEL_8:

          return;
        }
      }
      else
      {
      }
      unsigned int v30 = [(PHAudioCallViewController *)self heldCallControlsView];
      double v29 = [v30 leadingAnchor];
      double v16 = [(PHAudioCallViewController *)self view];
      uint64_t v17 = [v16 layoutMarginsGuide];
      uint64_t v25 = [v17 leadingAnchor];
      double v37 = [v29 constraintEqualToAnchor:v25];
      v38[0] = v37;
      double v36 = [(PHAudioCallViewController *)self heldCallControlsView];
      double v26 = [v36 trailingAnchor];
      double v34 = [(PHAudioCallViewController *)self view];
      double v33 = [v34 layoutMarginsGuide];
      [v33 trailingAnchor];
      double v32 = v35 = v26;
      double v31 = [v26 constraintEqualToAnchor:];
      v38[1] = v31;
      double v20 = [(PHAudioCallViewController *)self heldCallControlsView];
      unsigned __int8 v21 = [v20 bottomAnchor];
      unsigned int v22 = [(PHAudioCallViewController *)self view];
      double v23 = [v22 safeAreaLayoutGuide];
      unsigned int v24 = [v23 bottomAnchor];
      double v27 = [v21 constraintEqualToAnchor:v24];
      v38[2] = v27;
      id v28 = +[NSArray arrayWithObjects:v38 count:3];
      +[NSLayoutConstraint activateConstraints:v28];

      id v18 = (void *)v25;
      id v14 = v30;
      double v15 = v29;
      goto LABEL_8;
    }
  }
}

- (void)updateShareNameAndPhotoHUDPresentationIfNeeded
{
  BOOL v3 = [(PHAudioCallViewController *)self features];
  unsigned int v4 = [v3 isNameAndPhotoC3Enabled];

  if (v4
    && ([(PHCallViewController *)self currentState] == 4
     || [(PHCallViewController *)self currentState] == 5))
  {
    id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v6 = [v5 callDisplayStyle];

    if (v6 == (id)2)
    {
      id v10 = +[UIApplication sharedApplication];
      id v7 = [v10 delegate];
      unsigned __int8 v8 = [v7 bannerPresentationManager];
      id v9 = [(PHAudioCallViewController *)self callCenter];
      [(PHAudioCallViewController *)self showNameAndPhotoHUDIfNecessaryWithBannerPresentationManager:v8 callCenter:v9];
    }
  }
}

- (PHAudioCallControlsViewController)buttonsViewController
{
  buttonsViewController = self->_buttonsViewController;
  if (!buttonsViewController)
  {
    unsigned int v4 = [PHAudioCallControlsViewController alloc];
    id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v6 = [(PHAudioCallControlsViewController *)v4 initWithCallDisplayStyleManager:v5];
    id v7 = self->_buttonsViewController;
    self->_buttonsViewController = v6;

    [(PHAudioCallViewController *)self addChildViewController:self->_buttonsViewController];
    [(PHAudioCallControlsViewController *)self->_buttonsViewController setDelegate:self];
    buttonsViewController = self->_buttonsViewController;
  }

  return buttonsViewController;
}

- (PHInCallKeypadViewController)keypadViewController
{
  keypadViewController = self->_keypadViewController;
  if (!keypadViewController)
  {
    unsigned int v4 = objc_alloc_init(PHInCallKeypadViewController);
    id v5 = self->_keypadViewController;
    self->_keypadViewController = v4;

    [(PHAudioCallViewController *)self addChildViewController:self->_keypadViewController];
    keypadViewController = self->_keypadViewController;
  }

  return keypadViewController;
}

- (UIViewController)screeningViewController
{
  screeningViewController = self->_screeningViewController;
  if (!screeningViewController)
  {
    unsigned int v4 = [(CNKTranscriptionViewComposerFactory *)self->_screeningViewControllerFactory makeViewComposer];
    id v5 = [v4 compose];
    id v6 = self->_screeningViewController;
    self->_screeningViewController = v5;

    [(PHAudioCallViewController *)self addChildViewController:self->_screeningViewController];
    screeningViewController = self->_screeningViewController;
  }

  return screeningViewController;
}

- (PHAudioCallControlsSupplementalButton)useRTTButton
{
  useRTTButton = self->_useRTTButton;
  if (!useRTTButton)
  {
    id v4 = sub_10010C7DC();
    id v5 = [(PHAudioCallViewController *)self frontmostCall];
    id v6 = -[PHAudioCallControlsSupplementalButton initWithFrame:]([PHAudioCallControlsSupplementalButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v7 = self->_useRTTButton;
    self->_useRTTButton = v6;

    unsigned __int8 v8 = [v5 localSenderIdentityUUID];
    id v9 = [v4 rttDisplayName:0 forSubscriptionContextUUID:v8];

    [(PHAudioCallControlsSupplementalButton *)self->_useRTTButton setTitle:v9 forState:0];
    id v10 = self->_useRTTButton;
    id v11 = +[UIImage symbolImageNamed:@"teletype"];
    [(PHAudioCallControlsSupplementalButton *)v10 setImage:v11 forState:0];

    [(PHAudioCallControlsSupplementalButton *)self->_useRTTButton addTarget:self action:"useRTTButtonTapped" forEvents:64];
    useRTTButton = self->_useRTTButton;
  }

  return useRTTButton;
}

- (PHAudioCallControlsSupplementalButton)extensionNumberButton
{
  extensionNumberButton = self->_extensionNumberButton;
  if (!extensionNumberButton)
  {
    id v4 = -[PHAudioCallControlsSupplementalButton initWithFrame:]([PHAudioCallControlsSupplementalButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_extensionNumberButton;
    self->_extensionNumberButton = v4;

    [(PHAudioCallControlsSupplementalButton *)self->_extensionNumberButton addTarget:self action:"extensionNumberButtonTapped" forEvents:64];
    extensionNumberButton = self->_extensionNumberButton;
  }

  return extensionNumberButton;
}

- (PHAudioCallControlsSupplementalButton)callTransferButton
{
  callTransferButton = self->_callTransferButton;
  if (!callTransferButton)
  {
    id v4 = -[PHAudioCallControlsSupplementalButton initWithFrame:]([PHAudioCallControlsSupplementalButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_callTransferButton;
    self->_callTransferButton = v4;

    [(PHAudioCallControlsSupplementalButton *)self->_callTransferButton addTarget:self action:"callTransferButtonTapped" forEvents:64];
    id v6 = self->_callTransferButton;
    id v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"TRANSFER" value:&stru_1002D6110 table:@"InCallService"];
    [(PHAudioCallControlsSupplementalButton *)v6 setTitle:v8 forState:0];

    id v9 = self->_callTransferButton;
    id v10 = +[UIImage symbolImageNamed:@"phone.arrow.right.fill"];
    [(PHAudioCallControlsSupplementalButton *)v9 setImage:v10 forState:0];

    callTransferButton = self->_callTransferButton;
  }

  return callTransferButton;
}

- (SOSEmergencyCallVoiceLoopManager)voiceLoopManager
{
  voiceLoopManager = self->_voiceLoopManager;
  if (!voiceLoopManager)
  {
    id v4 = (SOSEmergencyCallVoiceLoopManager *)[objc_alloc((Class)SOSEmergencyCallVoiceLoopManager) initWithReason:2];
    id v5 = self->_voiceLoopManager;
    self->_voiceLoopManager = v4;

    [(SOSEmergencyCallVoiceLoopManager *)self->_voiceLoopManager setDelegate:self];
    voiceLoopManager = self->_voiceLoopManager;
  }

  return voiceLoopManager;
}

- (PHAudioCallVoiceLoopViewController)voiceLoopViewController
{
  voiceLoopViewController = self->_voiceLoopViewController;
  if (!voiceLoopViewController)
  {
    id v4 = objc_alloc_init(PHAudioCallVoiceLoopViewController);
    id v5 = self->_voiceLoopViewController;
    self->_voiceLoopViewController = v4;

    [(PHAudioCallViewController *)self addChildViewController:self->_voiceLoopViewController];
    [(PHAudioCallVoiceLoopViewController *)self->_voiceLoopViewController setDelegate:self];
    voiceLoopViewController = self->_voiceLoopViewController;
  }

  return voiceLoopViewController;
}

- (void)bottomBarActionPerformed:(int64_t)a3 withCompletionState:(int64_t)a4 fromBar:(id)a5
{
  id v7 = a5;
  id v8 = [(PHCallViewController *)self bottomBar];

  if (v8 == v7)
  {
    [(PHAudioCallViewController *)self performBottomBarActionType:a3];
  }
  else
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      int64_t v11 = a3;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown bottom bar %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)performBottomBarActionType:(int64_t)a3
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PHCallViewController *)self bottomBar];
    id v7 = [v6 nameForActionType:a3];
    *(_DWORD *)buf = 138412290;
    v114 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BottomBarActionPerformed: %@", buf, 0xCu);
  }
  switch(a3)
  {
    case 1:
      goto LABEL_6;
    case 2:
      id v8 = [(PHCallViewController *)self inCallRootViewController];
      [v8 requestInCallSceneTransitionToFullScreen];

LABEL_6:
      id v9 = [(PHAudioCallViewController *)self frontmostCall];
      if ([v9 wantsHoldMusic])
      {
        [v9 resetWantsHoldMusic];
        [(PHAudioCallViewController *)self updateCurrentState];
      }
      else
      {
        unsigned int v73 = [(PHAudioCallViewController *)self callCenter];
        char v74 = [v73 screeningCall];

        if ([(PHAudioCallViewController *)self usesCompactMulticallUI])
        {
          unsigned int v75 = [(PHAudioCallViewController *)self prioritizedCall];
          unsigned __int8 v76 = [v74 isEqualToCall:v75];

          char v77 = v76 ^ 1;
        }
        else
        {
          char v77 = 0;
        }
        if (!v74 || (v77 & 1) != 0)
        {
          double v90 = [(PHAudioCallViewController *)self callCenter];
          v88 = [v90 incomingCall];

          double v91 = sub_1000D5130();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v88;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Answering incoming call: %@", buf, 0xCu);
          }

          if ([(PHAudioCallViewController *)self usesCompactMulticallUI]
            && ([(PHAudioCallViewController *)self callCenter],
                double v92 = objc_claimAutoreleasedReturnValue(),
                [v92 currentCallGroups],
                double v93 = objc_claimAutoreleasedReturnValue(),
                BOOL v94 = (unint64_t)[v93 count] > 1,
                v93,
                v92,
                v94))
          {
            double v89 = [(PHAudioCallViewController *)self answerRequestForCall:v88];
            double v95 = [(PHAudioCallViewController *)self callCenter];
            double v96 = v95;
            if (v74) {
              [v95 endActiveOrHeldAndAnswerWithRequest:v89];
            }
            else {
              [v95 holdActiveAndAnswerWithRequest:v89];
            }

            v108 = [(PHAudioCallViewController *)self analyticsReporter];
            [v108 reportMultipleCallsWaitingUIAction:3];
          }
          else
          {
            double v89 = [(PHAudioCallViewController *)self callCenter];
            v108 = [(PHAudioCallViewController *)self answerRequestForCall:v88];
            [v89 answerWithRequest:v108];
          }
        }
        else
        {
          v87 = sub_1000D5130();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v74;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Answering screened call: %@", buf, 0xCu);
          }

          v88 = [(PHAudioCallViewController *)self answerRequestForCall:v74];
          [v88 setBehavior:4];
          double v89 = [(PHAudioCallViewController *)self callCenter];
          [v89 answerWithRequest:v88];
        }
      }
      return;
    case 4:
      int v10 = [(PHAudioCallViewController *)self callCenter];
      int64_t v11 = [v10 incomingCall];
      __int16 v12 = [(PHAudioCallViewController *)self answerRequestForCall:v11];

      id v13 = [(PHAudioCallViewController *)self callCenter];
      id v14 = [v13 activeVideoCall];

      double v15 = [(PHAudioCallViewController *)self callCenter];
      double v16 = v15;
      if (v14)
      {
        [v15 endActiveOrHeldAndAnswerWithRequest:v12];
      }
      else
      {
        unsigned int v104 = [v15 isEndAndAnswerAllowed];

        BOOL v105 = sub_1000D5130();
        BOOL v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
        if (v104)
        {
          if (v106)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "BottomBar: Ending active and answering incoming call", buf, 2u);
          }

          id v107 = [(PHAudioCallViewController *)self callCenter];
          [v107 endActiveOrHeldAndAnswerWithRequest:v12];
        }
        else
        {
          if (v106)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "BottomBar: Disconnecting all calls", buf, 2u);
          }

          id v107 = [(PHAudioCallViewController *)self callCenter];
          [v107 disconnectAllCalls];
        }

        double v16 = [(PHAudioCallViewController *)self analyticsReporter];
        [v16 reportMultipleCallsWaitingUIAction:2];
      }

      return;
    case 5:
      uint64_t v17 = [(PHAudioCallViewController *)self callCenter];
      id v18 = [(PHAudioCallViewController *)self callCenter];
      double v19 = [v18 incomingCall];
      double v20 = [(PHAudioCallViewController *)self answerRequestForCall:v19];
      [v17 endHeldAndAnswerWithRequest:v20];

      return;
    case 6:
      unsigned __int8 v21 = [(PHAudioCallViewController *)self callCenter];
      unsigned int v22 = [(PHAudioCallViewController *)self callCenter];
      double v23 = [v22 incomingCall];
      unsigned int v24 = [(PHAudioCallViewController *)self answerRequestForCall:v23];
      [v21 holdActiveAndAnswerWithRequest:v24];

      uint64_t v25 = [(PHAudioCallViewController *)self analyticsReporter];
      [v25 reportMultipleCallsWaitingUIAction:3];

      return;
    case 7:
      double v26 = [(PHAudioCallViewController *)self declineCallService];
      [v26 declineAnsweringFrontMostCallViaUserActionWithCompletionHandler:&stru_1002D0898];

      return;
    case 10:
      double v27 = [(PHAudioCallViewController *)self frontmostCall];
      id v28 = [v27 handle];
      [(PHAudioCallViewController *)self showBlockAlertForHandle:v28];

      return;
    case 11:
      double v29 = [(PHAudioCallViewController *)self frontmostCall];
      unsigned int v30 = [(PHAudioCallViewController *)self callCenter];
      [v30 disconnectCall:v29 withReason:2];

      return;
    case 14:
    case 19:
    case 35:
      [(PHAudioCallViewController *)self setCurrentState:0];
      return;
    case 15:
      if ([(PHCallViewController *)self currentState] != 10) {
        goto LABEL_38;
      }
      [(PHAudioCallViewController *)self handleCancelPressedInCallBufferScreen];
      break;
    case 16:
      double v31 = [(PHAudioCallViewController *)self callCenter];
      [v31 disconnectAllCalls];

      return;
    case 17:
      [(PHAudioCallViewController *)self setMiddleViewState:1 animated:1];
      return;
    case 18:
      double v32 = +[UIApplication sharedApplication];
      double v33 = [v32 delegate];
      double v34 = [v33 mostRecentlyDisconnectedAudioCall];

      if (v34)
      {
        double v35 = [(PHAudioCallViewController *)self callCenter];
        double v36 = [v34 dialRequestForRedial];
        [v35 launchAppForDialRequest:v36 completion:0];
      }
      else
      {
        double v35 = sub_1000D5130();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_1001EC2AC();
        }
      }
      goto LABEL_82;
    case 22:
      double v37 = [(PHAudioCallViewController *)self callCenter];
      unsigned int v38 = [v37 routeController];
      unsigned int v39 = [v38 areAuxiliaryRoutesAvailable];

      if (v39)
      {
        BOOL v40 = +[UIApplication sharedApplication];
        id v41 = [v40 delegate];
        BOOL v42 = [v41 currentInCallScene];
        [v42 requestTransitionToPresentationMode:2 shouldDismissCMASAlerts:0 analyticsSource:@"SBSUIInCallTransitionAnalyticsSourceAudioRouteButtonPress"];

        [(PHAudioCallViewController *)self setWaitingForFullScreenAudioRoutes:1];
      }
      else
      {
        BOOL v78 = [(PHAudioCallViewController *)self callCenter];
        id v79 = [v78 routeController];
        unsigned int v80 = [v79 pickedRoute];
        unsigned int v81 = [v80 isSpeaker];

        char v82 = [(PHAudioCallViewController *)self callCenter];
        id v83 = [v82 routeController];
        v84 = v83;
        if (v81)
        {
          double v34 = [v83 routeForSpeakerDisable];

          if (v34)
          {
            id v85 = [(PHAudioCallViewController *)self callCenter];
            unsigned __int8 v86 = [v85 routeController];
            [v86 pickRoute:v34];

            double v35 = [(PHAudioCallViewController *)self callParticipantsViewController];
            [v35 setBannerAudioRouteButtonSelected:0];
          }
          else
          {
            double v35 = sub_1000D5130();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find available route to pick for speaker disable", buf, 2u);
            }
          }
        }
        else
        {
          double v34 = [v83 routeForSpeakerEnable];

          if (v34)
          {
            v109 = [(PHAudioCallViewController *)self callCenter];
            v110 = [v109 routeController];
            [v110 pickRoute:v34];

            double v35 = [(PHAudioCallViewController *)self callParticipantsViewController];
            [v35 setBannerAudioRouteButtonSelected:1];
          }
          else
          {
            double v35 = sub_1000D5130();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find available route to pick for speaker enable", buf, 2u);
            }
          }
        }
LABEL_82:
      }
      break;
    case 23:
      id v43 = [(PHAudioCallViewController *)self frontmostCall];
      [v43 sendHardPauseDigits];

      return;
    case 24:
      unsigned int v44 = [(PHAudioCallViewController *)self callCenter];
      BOOL v45 = (unint64_t)[v44 currentCallCount] > 1;

      if (v45)
      {
        id v46 = [(PHAudioCallViewController *)self analyticsReporter];
        [v46 reportMultipleCallsWaitingUIAction:4];
      }
      goto LABEL_26;
    case 25:
      uint64_t v50 = [(PHAudioCallViewController *)self featureFlags];
      int v51 = TUCallScreeningEnabledM3();

      if (!v51) {
        return;
      }
      if ([(PHAudioCallViewController *)self usesCompactMulticallUI]
        && ([(PHAudioCallViewController *)self callCenter],
            int v52 = objc_claimAutoreleasedReturnValue(),
            [v52 currentCallGroups],
            unsigned int v53 = objc_claimAutoreleasedReturnValue(),
            BOOL v54 = (unint64_t)[v53 count] > 1,
            v53,
            v52,
            v54))
      {
        unsigned int v55 = [(PHAudioCallViewController *)self callCenter];
        BOOL v56 = (unint64_t)[v55 currentCallCount] > 1;

        if (v56)
        {
          id v57 = [(PHAudioCallViewController *)self analyticsReporter];
          [v57 reportMultipleCallsWaitingUIAction:4];
        }
LABEL_26:
        id v47 = [(PHAudioCallViewController *)self callCenter];
        unsigned int v48 = [(PHAudioCallViewController *)self callCenter];
        uint64_t v49 = [v48 incomingCall];
        [v47 disconnectCall:v49 withReason:2];
      }
      else
      {
        double v97 = sub_1000D5130();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          double v98 = [(PHAudioCallViewController *)self frontmostCall];
          *(_DWORD *)buf = 138412290;
          v114 = v98;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Answering screened call: %@", buf, 0xCu);
        }
        double v99 = [(PHAudioCallViewController *)self frontmostCall];
        if (v99)
        {
          double v100 = +[UIApplication sharedApplication];
          v101 = [v100 delegate];
          v102 = [v101 answeringMachine];
          id v103 = [v99 callUUID];
          [v102 screenCallWithUUID:v103 manualScreening:1 completion:&stru_1002D08B8];
        }
      }
      break;
    case 27:
      [(PHAudioCallViewController *)self _leaveMessage];
      return;
    case 30:
      BOOL v58 = [(PHAudioCallViewController *)self callCenter];
      v59 = [(PHAudioCallViewController *)self frontmostCall];
      [v58 setTTYType:1 forCall:v59];

      return;
    case 33:
      id v60 = +[UIApplication sharedApplication];
      id v61 = [v60 delegate];
      BOOL v62 = [v61 mostRecentlyDisconnectedAudioCall];

      objc_initWeak((id *)buf, self);
      BOOL v63 = [(PHCallViewController *)self inCallRootViewController];
      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472;
      v111[2] = sub_1000F58E0;
      v111[3] = &unk_1002CDBE0;
      objc_copyWeak(&v112, (id *)buf);
      [v63 presentBlockAndReportAlertToBlockCall:v62 forViewController:self completion:v111];

      objc_destroyWeak(&v112);
      objc_destroyWeak((id *)buf);

      return;
    case 34:
      unsigned int v64 = +[UIApplication sharedApplication];
      unsigned int v65 = [v64 delegate];
      objc_super v66 = [v65 mostRecentlyDisconnectedAudioCall];

      v67 = [(PHCallViewController *)self inCallRootViewController];
      __int16 v68 = [v66 handle];
      [v67 presentCreateContactViewControllerWithHandle:v68 forViewController:self];

      return;
    case 36:
      v69 = +[UIApplication sharedApplication];
      id v70 = [v69 delegate];
      BOOL v71 = [v70 alertCoordinator];
      [v71 invokeAlertWithRequestUnlock:[self alertTriggeredByAutoCountdown] automaticallyInvoked:[self alertTriggeredByAutoCountdown]];

      return;
    case 37:
LABEL_38:
      __int16 v72 = [(PHAudioCallViewController *)self callCenter];
      [v72 disconnectCurrentCallAndActivateHeld];

      break;
    default:
      return;
  }
}

- (BOOL)shouldShowHardPauseNumbers
{
  return 1;
}

- (BOOL)shouldShowAnswerRTT
{
  id v2 = [(PHAudioCallViewController *)self frontmostCall];
  if ([v2 isRTT]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isTTY];
  }

  return v3;
}

- (BOOL)shouldShowUseRTT
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callCenter];
  id v4 = [v3 currentCallCount];

  if (v4 != (id)1)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Multiple calls are currently active; Use RTT button should not be presented.",
        (uint8_t *)&v13,
        2u);
    }
    goto LABEL_16;
  }
  id v5 = [(PHAudioCallViewController *)self frontmostCall];
  if (([v5 isRTT] & 1) != 0
    || ([v5 isTTY] & 1) != 0
    || ![v5 supportsTTYWithVoice])
  {
LABEL_16:
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  id v6 = [v5 localSenderIdentityUUID];
  if (!v6)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not retrieve a sender identity UUID from the frontmost call %@; checking if RTT is available anyway.",
        (uint8_t *)&v13,
        0xCu);
    }
  }
  id v8 = [(PHCallViewController *)self senderIdentityClient];
  unsigned int v9 = [v8 isRTTAvailableForSenderIdentityUUID:v6];

  int v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"should not";
    if (v9) {
      CFStringRef v11 = @"should";
    }
    int v13 = 138412546;
    id v14 = (void *)v11;
    __int16 v15 = 2112;
    double v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Determined that the Use RTT button %@ be presented for the frontmost call %@.", (uint8_t *)&v13, 0x16u);
  }

LABEL_17:
  return v9;
}

- (BOOL)shouldShowCallTransfer
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle] != (id)3)
  {

LABEL_5:
    id v7 = [(PHAudioCallViewController *)self callCenter];
    id v8 = [v7 callsPassingTest:&stru_1002D08D8];

    if ([v8 count] == (id)2)
    {
      unsigned int v9 = [v8 objectAtIndexedSubscript:0];
      if ([v9 isConferenced])
      {
      }
      else
      {
        int v10 = [v8 objectAtIndexedSubscript:0];
        CFStringRef v11 = [v10 provider];
        __int16 v12 = [v11 identifier];
        int v13 = [v8 objectAtIndexedSubscript:1];
        id v14 = [v13 provider];
        __int16 v15 = [v14 identifier];

        if (v12 == v15)
        {
          uint64_t v17 = [v8 firstObject];
          uint64_t v18 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v17];

          double v31 = (void *)v18;
          id v19 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v18];
          double v20 = +[CNPhoneNumber phoneNumberWithStringValue:@"4"];
          unsigned __int8 v21 = +[CNContact predicateForContactMatchingPhoneNumber:v20];

          uint64_t v39 = CNPhoneNumberStringValueKey;
          unsigned int v22 = +[NSArray arrayWithObjects:&v39 count:1];
          id v32 = 0;
          double v23 = [v19 unifiedContactsMatchingPredicate:v21 keysToFetch:v22 error:&v32];
          id v24 = v32;

          uint64_t v25 = [v8 firstObject];
          double v26 = [v25 localSenderIdentity];
          double v27 = [v26 accountUUID];
          id v28 = [v27 UUIDString];
          BOOL v6 = +[PHInCallUIUtilities isExplicitTransferSupportedForSubscriptionLabelIdentifier:v28];

          double v29 = sub_1000D5130();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = [v23 count];
            *(_DWORD *)buf = 134218498;
            id v34 = v30;
            __int16 v35 = 1024;
            BOOL v36 = v6;
            __int16 v37 = 2112;
            id v38 = v24;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "CallTransferButton: contacts with number 4 have count of %lu,  carrierWantsShowCallTransferButton = %d, error is %@", buf, 0x1Cu);
          }

          if (v24)
          {
            LOBYTE(v6) = 0;
          }
          else if ([v23 count])
          {
            LOBYTE(v6) = 1;
          }

          goto LABEL_10;
        }
      }
    }
    LOBYTE(v6) = 0;
LABEL_10:

    return v6;
  }
  id v4 = [(PHAudioCallViewController *)self features];
  unsigned __int8 v5 = [v4 isDominoEnabled];

  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (id)customizedTitleForItemInBar:(id)a3 withActionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PHCallViewController *)self bottomBar];

  id v8 = 0;
  if (a4 == 23 && v7 == v6)
  {
    unsigned int v9 = [(PHAudioCallViewController *)self frontmostCall];
    if ([v9 hardPauseDigitsState] == 2)
    {
      id v8 = [v9 hardPauseDigitsDisplayString];
    }
    else
    {
      id v8 = &stru_1002D6110;
    }
  }

  return v8;
}

- (int64_t)bottomBarCallStateInBar:(id)a3
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callCenter];
  id v4 = [v3 bottomBarCallState];

  return (int64_t)v4;
}

- (void)showBlockAlertForHandle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned __int8 v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"BLOCK_UNKNOWN_CALLER_ALERT_TITLE" value:&stru_1002D6110 table:@"InCallService"];
  id v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:0];

  id v8 = +[NSBundle mainBundle];
  unsigned int v9 = [v8 localizedStringForKey:@"BLOCK_UNKNOWN_CALLER_ALERT_ACTION_BLOCK" value:&stru_1002D6110 table:@"InCallService"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_1000F62D0;
  v15[3] = &unk_1002D0900;
  objc_copyWeak(&v17, &location);
  id v10 = v4;
  id v16 = v10;
  CFStringRef v11 = +[UIAlertAction actionWithTitle:v9 style:2 handler:v15];
  [v7 addAction:v11];

  __int16 v12 = +[NSBundle mainBundle];
  int v13 = [v12 localizedStringForKey:@"BLOCK_UNKNOWN_CALLER_ALERT_ACTION_CANCEL" value:&stru_1002D6110 table:@"InCallService"];
  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:&stru_1002D0920];
  [v7 addAction:v14];

  [(PHAudioCallViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (void)showBlockAlertForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHAudioCallViewController *)self features];
  unsigned int v6 = [v5 lvm_stopEnabled];

  if (v4 && v6)
  {
    id v7 = [v4 handle];
    objc_initWeak(location, self);
    id v8 = +[NSBundle mainBundle];
    unsigned int v9 = [v8 localizedStringForKey:@"BLOCK_UNKNOWN_CALLER_ALERT_TITLE" value:&stru_1002D6110 table:@"InCallService"];
    id v10 = +[UIAlertController alertControllerWithTitle:v9 message:0 preferredStyle:0];

    CFStringRef v11 = +[NSBundle mainBundle];
    __int16 v12 = [v11 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_BLOCK" value:&stru_1002D6110 table:@"InCallService"];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000F6764;
    v30[3] = &unk_1002D0948;
    objc_copyWeak(&v34, location);
    id v13 = v7;
    id v31 = v13;
    id v32 = self;
    id v14 = v4;
    id v33 = v14;
    __int16 v15 = +[UIAlertAction actionWithTitle:v12 style:2 handler:v30];
    [v10 addAction:v15];

    if ([v14 carrierAllowsReportVoiceCall])
    {
      id v16 = +[NSBundle mainBundle];
      id v17 = [v16 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_BLOCK_REPORT" value:&stru_1002D6110 table:@"InCallService"];
      unsigned int v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      id v24 = sub_1000F67DC;
      uint64_t v25 = &unk_1002D0948;
      objc_copyWeak(&v29, location);
      id v26 = v13;
      id v27 = v14;
      id v28 = self;
      uint64_t v18 = +[UIAlertAction actionWithTitle:v17 style:2 handler:&v22];
      [v10 addAction:v18, v22, v23, v24, v25];

      objc_destroyWeak(&v29);
    }
    id v19 = +[NSBundle mainBundle];
    double v20 = [v19 localizedStringForKey:@"BLOCK_REPORT_ALERT_ACTION_CANCEL" value:&stru_1002D6110 table:@"InCallService"];
    unsigned __int8 v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:&stru_1002D0968];
    [v10 addAction:v21];

    [(PHAudioCallViewController *)self presentViewController:v10 animated:1 completion:0];
    objc_destroyWeak(&v34);

    objc_destroyWeak(location);
  }
}

- (id)answerRequestForCall:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v4];

  unsigned int v6 = [(PHAudioCallViewController *)self callCenter];
  id v7 = [v6 routeController];
  id v8 = [v7 pickedRoute];

  unsigned int v9 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v9 callDisplayStyle] != (id)3)
  {

    goto LABEL_9;
  }
  id v10 = [(PHAudioCallViewController *)self features];
  unsigned int v11 = [v10 isDominoEnabled];
  if (!v11 || !v8)
  {

    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ([(PHAudioCallViewController *)self isPickedRouteSpeaker])
  {

LABEL_8:
    [v5 setSourceIdentifier:TUCallSourceIdentifierSpeakerRoute];
    goto LABEL_9;
  }
  unsigned __int8 v13 = [(PHAudioCallViewController *)self isPickedRouteReceiver];

  if (v13) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (void)_leaveMessage
{
  unsigned __int8 v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  id v5 = [v4 mostRecentlyDisconnectedAudioCall];

  unsigned int v6 = [(PHAudioCallViewController *)self featureFlags];
  LODWORD(v4) = TUCallScreeningEnabled();

  if (v4 && !v5)
  {
    id v7 = [(PHAudioCallViewController *)self callCenter];
    id v5 = [v7 screeningCall];
  }
  id v8 = [v5 handle];
  unsigned int v9 = [v8 value];

  id v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Call %@; Destination ID %@",
      (uint8_t *)&v16,
      0x16u);
  }

  if ([v9 destinationIdIsPhoneNumber])
  {
    unsigned int v11 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage();
    if (!v11)
    {
      unsigned int v11 = TUActiveCountryCode();
    }
    __int16 v12 = TUNetworkCountryCode();
    uint64_t v13 = TUNumberToDial();

    unsigned int v9 = (void *)v13;
  }
  if (v9 && [v9 length])
  {
    id v14 = objc_alloc_init((Class)MFMessageComposeViewController);
    __int16 v15 = +[NSArray arrayWithObject:v9];
    [v14 setRecipients:v15];

    [v14 setBody:&stru_1002D6110];
    [v14 setMessageComposeDelegate:self];
    [v14 _setCanEditRecipients:0];
    [(PHAudioCallViewController *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    id v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001EC2E0();
    }
  }
}

- (BOOL)allowsOrientationChangeEvents
{
  id v2 = +[UIDevice currentDevice];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = +[UIDevice currentDevice];
    id v4 = [v3 userInterfaceIdiom];

    BOOL v5 = v4 == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F6D00;
  v4[3] = &unk_1002CD518;
  void v4[4] = self;
  [(PHAudioCallViewController *)self dismissViewControllerAnimated:1 completion:v4];
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
}

- (BOOL)allowsMenuButtonDismissal
{
  id v2 = [(PHAudioCallViewController *)self callCenter];
  unsigned __int8 v3 = [v2 incomingCall];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)allowsBanners
{
  id v2 = [(PHAudioCallViewController *)self callCenter];
  unsigned __int8 v3 = [v2 incomingCall];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)desiresLockButtonEvents
{
  id v2 = self;
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callCenter];
  LOBYTE(v2) = [(PHAudioCallViewController *)v2 desiresLockButtonEventsForCallContainer:v3];

  return (char)v2;
}

- (BOOL)desiresLockButtonEventsForCallContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 incomingCall];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else if ([v4 currentCallCount])
  {
    BOOL v6 = [(PHAudioCallViewController *)self isPickedRouteReceiver];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setPrioritizedCall:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);
  unsigned __int8 v6 = [WeakRetained isEqualToCall:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring our own call management, told to take in prioritizedCall %@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = objc_storeWeak((id *)&self->_prioritizedCall, v4);
    [(PHCallParticipantsViewController *)self->_callParticipantsViewController setPrioritizedCall:v4];

    [(PHAudioCallViewController *)self updateCurrentState];
    if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout])
    {
      unsigned int v9 = [(PHAudioCallViewController *)self callToUseForWallpaper];
      id v10 = objc_loadWeakRetained((id *)&self->_prioritizedCall);
      -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v9, 1, [v10 status] == 4);
    }
    [(PHAudioCallViewController *)self _updatePosterStatusLabelForState:[(PHCallViewController *)self currentState]];
  }
}

- (TUCall)activeCall
{
  if ([(PHAudioCallViewController *)self usesCompactMulticallUI]
    && ([(PHAudioCallViewController *)self prioritizedCall],
        unsigned __int8 v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(PHAudioCallViewController *)self prioritizedCall];
  }
  else
  {
    BOOL v5 = [(PHAudioCallViewController *)self callCenter];
    id v4 = [v5 callWithStatus:1];

    if (!v4)
    {
      unsigned __int8 v6 = [(PHAudioCallViewController *)self callCenter];
      id v4 = [v6 callWithStatus:4];

      if (!v4)
      {
        id v7 = [(PHAudioCallViewController *)self callCenter];
        id v4 = [v7 callWithStatus:3];

        if (!v4)
        {
          id v8 = [(PHAudioCallViewController *)self callCenter];
          id v4 = [v8 callWithStatus:2];
        }
      }
    }
  }

  return (TUCall *)v4;
}

- (TUCall)frontmostCall
{
  if ([(PHAudioCallViewController *)self usesCompactMulticallUI])
  {
    unsigned __int8 v3 = [(PHAudioCallViewController *)self activeCall];
  }
  else
  {
    id v4 = [(PHAudioCallViewController *)self callCenter];
    unsigned __int8 v3 = [v4 frontmostCall];
  }

  return (TUCall *)v3;
}

- (void)hardwareButtonEventNotification:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 userInfo];
    int v33 = 138412290;
    *(void *)id v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController received a hardware button event (%@)", (uint8_t *)&v33, 0xCu);
  }
  id v8 = [(PHAudioCallViewController *)self activeCall];
  if (([v8 isRTT] & 1) != 0 || objc_msgSend(v8, "isTTY"))
  {
    id v9 = sub_10010C700();
    char isKindOfClass = (char)v9;
    if (v9)
    {
      int v11 = [(PHAudioCallViewController *)self navigationController];
      id v12 = [v11 visibleViewController];
      char isKindOfClass = objc_opt_isKindOfClass();

      unsigned __int8 v3 = sub_1000D5130();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 67109120;
        *(_DWORD *)id v34 = isKindOfClass & 1;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setting isShowingRTTConversationViewController: %d", (uint8_t *)&v33, 8u);
      }
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  unsigned int v13 = [(PHAudioCallViewController *)self isViewLoaded];
  char v14 = v13;
  if (v13)
  {
    unsigned __int8 v3 = [(PHAudioCallViewController *)self view];
    __int16 v15 = [v3 window];
    if ((v15 != 0) | isKindOfClass & 1)
    {

      goto LABEL_19;
    }
  }
  else if (isKindOfClass)
  {
    goto LABEL_19;
  }
  int v16 = [(PHCallViewController *)self inCallRootViewController];
  unsigned int v17 = [v16 isDisplayStyleMiniWindow];

  if (v14)
  {

    if ((v17 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_19:
    unsigned int v22 = [v5 userInfo];
    __int16 v18 = [v22 valueForKey:@"kPHHardwareButtonEventType"];

    uint64_t v23 = [(PHAudioCallViewController *)self callCenter];
    id v24 = [v23 incomingCall];

    if (v18 == @"kPHHardwareButtonEventTypeLockButton")
    {
      [(PHAudioCallViewController *)self handleDeviceLockEventWithSourceType:1];
    }
    else
    {
      if (v18 == @"kPHHardwareButtonEventTypeVolumeDownButton"
        || v18 == @"kPHHardwareButtonEventTypeVolumeUpButton")
      {
        id v29 = sub_1000D5130();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling kPHHardwareButtonEventTypeVolumeDownButton || kPHHardwareButtonEventTypeVolumeUpButton buttonType", (uint8_t *)&v33, 2u);
        }

        [v24 suppressRingtone];
        goto LABEL_35;
      }
      if (v18 == @"kPHHardwareButtonEventTypeHeadsetButton")
      {
        id v30 = sub_1000D5130();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [(PHAudioCallViewController *)self callCenter];
          id v32 = [v31 incomingCall];
          int v33 = 138412546;
          *(void *)id v34 = v32;
          *(_WORD *)&v34[8] = 2112;
          __int16 v35 = v8;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling kPHHardwareButtonEventTypeHeadsetButton buttonType (incoming call = %@, active call = %@)", (uint8_t *)&v33, 0x16u);
        }
        id v28 = [(PHAudioCallViewController *)self callCenter];
        [v28 handleActionForWiredHeadsetMiddleButtonPress];
        goto LABEL_34;
      }
      if (v18 == @"kPHHardwareButtonEventTypeHeadsetButtonLongPress")
      {
        uint64_t v25 = sub_1000D5130();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [(PHAudioCallViewController *)self callCenter];
          id v27 = [v26 incomingCall];
          int v33 = 138412290;
          *(void *)id v34 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling kPHHardwareButtonEventTypeHeadsetButtonLongPress buttonType (incoming call = %@)", (uint8_t *)&v33, 0xCu);
        }
        id v28 = [(PHAudioCallViewController *)self callCenter];
        [v28 handleActionForWiredHeadsetMiddleButtonLongPress];
LABEL_34:
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  if (v17) {
    goto LABEL_19;
  }
LABEL_16:
  sub_1000D5130();
  __int16 v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = [(PHAudioCallViewController *)self isViewLoaded];
    double v20 = [(PHAudioCallViewController *)self view];
    unsigned __int8 v21 = [v20 window];
    int v33 = 67109376;
    *(_DWORD *)id v34 = v19;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v21 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "[WARN] PHAudioCallViewController will not handle the hardware button event as the view is not loaded (viewLoaded = %d) or we have no window (window exists = %d)", (uint8_t *)&v33, 0xEu);
  }
LABEL_36:
}

- (void)handleDeviceLockEventWithSourceType:(int64_t)a3
{
  v26.receiver = self;
  v26.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController handleDeviceLockEventWithSourceType:](&v26, "handleDeviceLockEventWithSourceType:");
  id v5 = [(PHAudioCallViewController *)self activeCall];
  unsigned __int8 v6 = [(PHAudioCallViewController *)self callCenter];
  id v7 = [v6 incomingCall];

  unsigned int v8 = [(PHAudioCallViewController *)self isPickedRouteReceiver];
  id v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    unsigned int v28 = v8;
    __int16 v29 = 1024;
    BOOL v30 = v5 != 0;
    __int16 v31 = 1024;
    BOOL v32 = v7 != 0;
    __int16 v33 = 1024;
    int v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling device lock event isPickedRouteReceiver=%d, activeCall=%d, incomingCall=%d, sourceType=%d", buf, 0x1Au);
  }

  if (a3 == 2)
  {
    if (v7) {
      int v10 = 1;
    }
    else {
      int v10 = v8;
    }
    if (v10 == 1)
    {
      int v11 = [(PHAudioCallViewController *)self declineCallService];
      [v11 declineAnsweringCallDueToLockEventWithCurrentActiveCall:v5 completionHandler:&stru_1002D0988];
LABEL_34:

      goto LABEL_35;
    }
LABEL_18:
    if (v5) {
      unsigned int v15 = v8;
    }
    else {
      unsigned int v15 = 0;
    }
    if (v15 == 1) {
      goto LABEL_22;
    }
LABEL_16:
    char v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Not suppressing ringtone or declining call.", buf, 2u);
    }
    goto LABEL_24;
  }
  if (!v7) {
    goto LABEL_18;
  }
  if (([v7 shouldSuppressRingtone] & 1) == 0)
  {
    __int16 v18 = +[UIApplication sharedApplication];
    unsigned int v19 = [v18 delegate];
    double v20 = [v19 currentInCallScene];
    unsigned __int8 v21 = [v20 delegate];
    unsigned int v22 = [v21 callAnalyticsLogger];
    uint64_t v23 = [v7 uniqueProxyIdentifierUUID];
    [v22 ringerMutedForCallUUID:v23];

    [v7 suppressRingtone];
    goto LABEL_29;
  }
  unsigned __int8 v12 = [v7 shouldSuppressRingtone];
  if (v5) {
    char v13 = v8;
  }
  else {
    char v13 = 0;
  }
  if ((v12 & 1) == 0 && (v13 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_22:
  int v16 = +[PHInCallUtilities sharedInstance];
  unsigned int v17 = [v16 isLockToEndCallEnabled];

  if (v17)
  {
    char v14 = [(PHAudioCallViewController *)self declineCallService];
    [v14 declineAnsweringCallDueToLockEventWithCurrentActiveCall:v5 completionHandler:&stru_1002D09A8];
LABEL_24:

    goto LABEL_29;
  }
  id v24 = sub_1000D5130();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "... and requesting lock on next dismiss because Lock-to-End is disabled through accessibility setting.", buf, 2u);
  }

  +[PHInCallRootViewController setShouldLockDeviceOnNextDismiss];
LABEL_29:
  if (a3 == 1 && [(PHAudioCallViewController *)self videoStreamingIsGoingOn])
  {
    uint64_t v25 = sub_1000D5130();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: pause video if necessary when locking device", buf, 2u);
    }

    int v11 = [(PHAudioCallViewController *)self emergencyCoordinator];
    [v11 handleDeviceLockEvent];
    goto LABEL_34;
  }
LABEL_35:
}

- (BOOL)isPickedRouteReceiver
{
  id v2 = [(PHAudioCallViewController *)self callCenter];
  unsigned __int8 v3 = [v2 routeController];
  id v4 = [v3 pickedRoute];
  unsigned __int8 v5 = [v4 isReceiver];

  return v5;
}

- (BOOL)isPickedRouteSpeaker
{
  id v2 = [(PHAudioCallViewController *)self callCenter];
  unsigned __int8 v3 = [v2 routeController];
  id v4 = [v3 pickedRoute];
  unsigned __int8 v5 = [v4 isSpeaker];

  return v5;
}

- (void)setupAmbientAudioRoutesControlViewIfNeeded
{
  if (!self->_ambientAudioRoutesControlView)
  {
    id v19 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v19 callDisplayStyle] == (id)3)
    {
      unsigned __int8 v3 = [(PHAudioCallViewController *)self features];
      unsigned int v4 = [v3 isDominoEnabled];

      if (!v4) {
        return;
      }
      unsigned __int8 v5 = objc_alloc_init(PHAmbientAudioRoutesControlView);
      unsigned __int8 v6 = [(PHAudioCallViewController *)self buttonsViewController];
      [(PHAmbientAudioRoutesControlView *)v5 setDelegate:v6];

      [(PHAmbientAudioRoutesControlView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      ambientAudioRoutesControlView = self->_ambientAudioRoutesControlView;
      self->_ambientAudioRoutesControlView = &v5->super;
      unsigned int v8 = v5;

      id v9 = [(PHAudioCallViewController *)self view];
      [v9 addSubview:self->_ambientAudioRoutesControlView];

      int v10 = [(UIView *)self->_ambientAudioRoutesControlView topAnchor];
      int v11 = [(PHAudioCallViewController *)self view];
      unsigned __int8 v12 = [v11 topAnchor];
      +[PHUIConfiguration ambientAudioRoutesInset];
      char v13 = [v10 constraintEqualToAnchor:v12];
      [v13 setActive:1];

      id v19 = [(UIView *)self->_ambientAudioRoutesControlView trailingAnchor];
      char v14 = [(PHAudioCallViewController *)self view];
      unsigned int v15 = [v14 trailingAnchor];
      +[PHUIConfiguration ambientAudioRoutesInset];
      double v17 = v16;

      __int16 v18 = [v19 constraintEqualToAnchor:v15 constant:-v17];
      [v18 setActive:1];
    }
  }
}

- (void)updateAmbientAudioRoutesVisibility
{
  [(PHAudioCallViewController *)self setupAmbientAudioRoutesControlViewIfNeeded];
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle] != (id)3) {
    goto LABEL_7;
  }
  unsigned int v4 = [(PHAudioCallViewController *)self features];
  if (([v4 isDominoEnabled] & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  unsigned int v5 = [(PHAudioCallViewController *)self middleViewState];

  if (v5 != 1)
  {
LABEL_8:
    uint64_t v11 = 1;
    goto LABEL_9;
  }
  unsigned __int8 v6 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
  unsigned int v7 = [v6 isHidden];

  if (v7)
  {
    unsigned int v8 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
    +[AmbientAnimationCoordinator show:v8 completion:0];

    id v9 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
    [v9 setHidden:0];

    id v12 = [(PHAudioCallViewController *)self view];
    int v10 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
    [v12 bringSubviewToFront:v10];

    goto LABEL_10;
  }
  uint64_t v11 = 0;
LABEL_9:
  id v12 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
  [v12 setHidden:v11];
LABEL_10:
}

- (void)setViewsHiddenForAudioRoutes:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 != (id)1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000F7EF0;
    v11[3] = &unk_1002CD918;
    BOOL v12 = a3;
    void v11[4] = self;
    id v9 = objc_retainBlock(v11);
    int v10 = v9;
    if (v4) {
      +[UIView animateWithDuration:v9 animations:0.25];
    }
    else {
      ((void (*)(void *))v9[2])(v9);
    }
  }
}

- (void)revealAudioRoutingDeviceListAnimatedIfNeeded
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callCenter];
  id v9 = [v3 routeController];

  unsigned int v4 = [v9 areNonRelayAuxiliaryRoutesAvailable];
  unsigned int v5 = v9;
  if (v4)
  {
    unsigned __int8 v6 = [v9 pickedRoute];
    unsigned int v7 = v6;
    if (!v6
      || (unint64_t v8 = (unint64_t)[v6 deviceType], v8 > 0x1D)
      || ((1 << v8) & 0x24140002) == 0
      || ([v7 isPreferredAndActive] & 1) == 0)
    {
      [(PHAudioCallViewController *)self revealAudioRoutingDeviceListAnimated:1];
    }

    unsigned int v5 = v9;
  }
}

- (void)revealAudioRoutingDeviceListAnimated:(BOOL)a3
{
  unsigned int v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Revealing audio routing device list", buf, 2u);
  }

  unsigned int v5 = [(PHAudioCallViewController *)self buttonsViewController];
  if ([v5 isViewLoaded])
  {
    unsigned __int8 v6 = [(PHAudioCallViewController *)self buttonsViewController];
    unsigned int v7 = [v6 view];
    unint64_t v8 = [v7 window];

    if (v8)
    {
      id v9 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      if ([v9 callDisplayStyle] == (id)3)
      {
        int v10 = [(PHAudioCallViewController *)self features];
        if ([v10 isDominoEnabled])
        {
          uint64_t v11 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];

          if (v11)
          {
            BOOL v12 = [(PHAudioCallViewController *)self ambientAudioRoutesControlView];
            uint64_t v13 = [v12 button];
            goto LABEL_16;
          }
LABEL_14:
          double v20 = [(PHAudioCallViewController *)self currentMiddleView];
          char v21 = objc_opt_respondsToSelector();

          if ((v21 & 1) == 0)
          {
            char v14 = 0;
LABEL_18:
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            unsigned int v22 = [v14 interactions];
            id v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v36;
LABEL_20:
              uint64_t v26 = 0;
              while (1)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v27 = *(void **)(*((void *)&v35 + 1) + 8 * v26);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  break;
                }
                if (v24 == (id)++v26)
                {
                  id v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
                  if (v24) {
                    goto LABEL_20;
                  }
                  goto LABEL_26;
                }
              }
              unsigned int v15 = v27;

              if (!v15) {
                goto LABEL_29;
              }
              [v14 bounds];
              double v29 = v28;
              [v14 bounds];
              double v31 = v29 + v30 * 0.5;
              [v14 bounds];
              double v33 = v32;
              [v14 bounds];
              -[NSObject _presentMenuAtLocation:](v15, "_presentMenuAtLocation:", v31, v33 + v34 * 0.5);
            }
            else
            {
LABEL_26:

LABEL_29:
              unsigned int v15 = sub_1000D5130();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)id v41 = v14;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find menu interaction for audio routes button: %@", buf, 0xCu);
              }
            }
            goto LABEL_31;
          }
          BOOL v12 = [(PHAudioCallViewController *)self currentMiddleView];
          uint64_t v13 = [v12 buttonForControlType:3];
LABEL_16:
          char v14 = v13;

          goto LABEL_18;
        }
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  char v14 = sub_1000D5130();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [(PHAudioCallViewController *)self buttonsViewController];
    unsigned int v16 = [v15 isViewLoaded];
    double v17 = [(PHAudioCallViewController *)self buttonsViewController];
    __int16 v18 = [v17 view];
    id v19 = [v18 window];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v41 = v16;
    *(_WORD *)&v41[4] = 2112;
    *(void *)&v41[6] = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not presenting audio routing device list since isViewLoaded: %d; window: %@",
      buf,
      0x12u);

LABEL_31:
  }
}

- (id)audioRouteMenu
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self routeListController];

  if (!v3)
  {
    unsigned int v4 = +[PHAudioRoutingMenuController menuControllerWithCallStyle:1 dataSource:self delegate:self];
    [(PHAudioCallViewController *)self setRouteListController:v4];
  }
  unsigned int v5 = [(PHAudioCallViewController *)self routeListController];
  unsigned __int8 v6 = [v5 menu];

  return v6;
}

- (id)routesForAudioRoutingMenuController:(id)a3
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v4 = [v3 routeController];
  unsigned int v5 = [v4 sortedRoutes];

  return v5;
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(PHAudioCallViewController *)self callCenter];
  unsigned int v7 = [v6 routeController];
  [v7 pickRoute:v5];

  id v12 = [(PHAudioCallViewController *)self features];
  if ([v12 isEnhancedEmergencyEnabled])
  {
    uint64_t v8 = [(PHAudioCallViewController *)self emergencyCoordinator];
    if (v8)
    {
      id v9 = (void *)v8;
      int v10 = [(PHAudioCallViewController *)self emergencyCoordinator];
      id v11 = [v10 eedRTTState];

      if (!v11) {
        return;
      }
      id v12 = [(PHAudioCallViewController *)self emergencyCoordinator];
      [v12 updateRTTAudioRouteButton];
    }
  }
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController get notified audio routes changed", v18, 2u);
  }

  [(PHAudioCallViewController *)self updateCurrentState];
  unsigned __int8 v6 = [(PHAudioCallViewController *)self routeListController];
  [v6 reload];

  unsigned int v7 = +[UIApplication sharedApplication];
  uint64_t v8 = [v7 delegate];
  id v9 = [v8 currentInCallScene];
  int v10 = [v9 delegate];
  id v11 = [v10 callAnalyticsLogger];
  id v12 = [v4 pickedRoute];

  [v11 audioRouteIsHandsfree:[v12 isReceiver] ^ 1];
  uint64_t v13 = [(PHAudioCallViewController *)self features];
  if ([v13 isEnhancedEmergencyEnabled])
  {
    uint64_t v14 = [(PHAudioCallViewController *)self emergencyCoordinator];
    if (v14)
    {
      unsigned int v15 = (void *)v14;
      unsigned int v16 = [(PHAudioCallViewController *)self emergencyCoordinator];
      id v17 = [v16 eedRTTState];

      if (!v17) {
        return;
      }
      uint64_t v13 = [(PHAudioCallViewController *)self emergencyCoordinator];
      [v13 updateRTTAudioRouteButton];
    }
  }
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  v36.receiver = self;
  v36.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController callDisplayStyleDidChangeFromStyle:toStyle:](&v36, "callDisplayStyleDidChangeFromStyle:toStyle:");
  if (a4 == 4)
  {
    unsigned int v7 = [(PHAudioCallViewController *)self callCenter];
    unsigned __int8 v8 = [v7 hasCurrentCalls];

    if ((v8 & 1) == 0)
    {
      id v9 = sub_1000D5130();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController was dismissed with no current calls", (uint8_t *)buf, 2u);
      }

      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHFailureAlertShowingAssertionReason"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHFallbackToTelephonyAssertionReason"];
      [(PHAudioCallViewController *)self setCurrentState:0];
    }
  }
  if (!a3)
  {
    [(PHAudioCallViewController *)self resetParticipantsViewConstraints];
    int v10 = [(PHAudioCallViewController *)self pendingMiddleViewAnimations];

    if (v10)
    {
      id v11 = [(PHAudioCallViewController *)self pendingMiddleViewAnimations];
      v11[2]();

      [(PHAudioCallViewController *)self setPendingMiddleViewAnimations:0];
    }
    if ([(PHAudioCallViewController *)self waitingForFullScreenAudioRoutes])
    {
      id v12 = [(PHAudioCallViewController *)self callCenter];
      uint64_t v13 = [v12 routeController];
      unsigned int v14 = [v13 areAuxiliaryRoutesAvailable];

      if (v14)
      {
        objc_initWeak(buf, self);
        +[UIView _currentAnimationDuration];
        dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000F8CE8;
        block[3] = &unk_1002CED28;
        objc_copyWeak(&v34, buf);
        dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v34);
        objc_destroyWeak(buf);
      }
    }
    [(PHAudioCallViewController *)self setWaitingForFullScreenAudioRoutes:0];
    id v17 = [(PHAudioCallViewController *)self features];
    unsigned __int8 v18 = [v17 isButtonLayoutEnabled];

    if ((v18 & 1) == 0) {
      [(PHAudioCallViewController *)self fadeInBottomBar];
    }
    [(PHAudioCallViewController *)self updateBottomBarAlphaWithCurrentState:[(PHCallViewController *)self currentState]];
    if ([(PHAudioCallViewController *)self shouldUseHeroImageLayout]) {
      goto LABEL_17;
    }
    id v19 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v19 callDisplayStyle] != (id)3)
    {
LABEL_18:

      goto LABEL_19;
    }
    double v20 = [(PHAudioCallViewController *)self features];
    unsigned int v21 = [v20 isDominoEnabled];

    if (v21)
    {
LABEL_17:
      id v19 = [(PHAudioCallViewController *)self frontmostCall];
      [(PHAudioCallViewController *)self setCallForBackgroundImage:v19 animated:0 callDisplayStyleChanged:1];
      [(PHAudioCallViewController *)self updateCallParticipantsViewControllerCallGroups];
      goto LABEL_18;
    }
  }
LABEL_19:
  if (a3 == 1 || a4 != 1)
  {
    if (a3 == 2 && a4 == 4)
    {
      if ([(PHAudioCallViewController *)self videoStreamingIsGoingOn]) {
        [(PHAudioCallViewController *)self audioCallControlsViewControllerDidTapVideoStreamingButton];
      }
      goto LABEL_31;
    }
  }
  else
  {
    unsigned int v22 = sub_1000D5130();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling lock event due to mini window attached", (uint8_t *)buf, 2u);
    }

    [(PHAudioCallViewController *)self handleDeviceLockEventWithSourceType:1];
  }
  if (a3 != 4)
  {
    if (a4 != 4) {
      goto LABEL_40;
    }
LABEL_31:
    [(PHAudioCallViewController *)self handleViewWillDisappear:1];
    [(PHAudioCallViewController *)self handleViewDidDisappear:1];
    id v23 = [(PHAudioCallViewController *)self callCenter];
    id v24 = [v23 incomingCall];

    if (v24)
    {
      uint64_t v25 = [v24 provider];
      if ([v25 supportsDynamicSystemUI])
      {
        uint64_t v26 = [(PHAudioCallViewController *)self featureFlags];
        if ([v26 groupConversations])
        {
          char HasChinaSKU = TUDeviceHasChinaSKU();

          if (HasChinaSKU) {
            goto LABEL_39;
          }
          goto LABEL_38;
        }
      }
    }
LABEL_38:
    [(PHAudioCallViewController *)self suppressRingtoneForIncomingCall];
LABEL_39:

    goto LABEL_40;
  }
  [(PHAudioCallViewController *)self handleViewWillAppear:1];
  [(PHAudioCallViewController *)self handleViewDidAppear:1];
LABEL_40:
  double v28 = +[UIDevice currentDevice];
  double v29 = (char *)[v28 orientation];

  if (a3 || a4 != 2 || (unint64_t)(v29 - 3) > 1)
  {
    if (!UIAccessibilityIsReduceMotionEnabled()) {
      goto LABEL_50;
    }
  }
  else
  {
    double v30 = +[UIDevice currentDevice];
    if ([v30 userInterfaceIdiom])
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

      if (!IsReduceMotionEnabled) {
        goto LABEL_50;
      }
    }
    else
    {
    }
  }
  double v32 = [(PHAudioCallViewController *)self view];
  +[ICSBannerTransitionAnimation performBannerToFullScreenCrossFadeAnimationWithView:v32];

LABEL_50:
  [(PHAudioCallViewController *)self showCallDetailsIfNecessary];
  [(PHAudioCallViewController *)self refreshCallDetailsViewButton];
  [(PHAudioCallViewController *)self setupAmbientAudioRoutesControlViewIfNeeded];
  [(PHAudioCallViewController *)self updateShareNameAndPhotoHUDPresentationIfNeeded];
  [(PHAudioCallViewController *)self updateCallRecordingIfNeeded];
}

- (void)suppressRingtoneForIncomingCall
{
  id v2 = [(PHAudioCallViewController *)self callCenter];
  id v5 = [v2 incomingCall];

  unsigned __int8 v3 = v5;
  if (v5)
  {
    unsigned __int8 v4 = [v5 shouldSuppressRingtone];
    unsigned __int8 v3 = v5;
    if ((v4 & 1) == 0)
    {
      [v5 suppressRingtone];
      unsigned __int8 v3 = v5;
    }
  }
}

- (void)showCallDetailsIfNecessary
{
  uint64_t v3 = [(PHAudioCallViewController *)self callDetailsCoordinator];
  if (v3)
  {
    id v9 = (id)v3;
    unsigned __int8 v4 = +[UIApplication sharedApplication];
    id v5 = [v4 delegate];
    unsigned __int8 v6 = [v5 bannerPresentationManager];
    if ([v6 shouldShowCallDetailsWhenReady])
    {
      unsigned int v7 = [(PHAudioCallViewController *)self callDisplayStyleManager];
      id v8 = [v7 callDisplayStyle];

      if (v8 != (id)2) {
        return;
      }
      id v9 = [(PHAudioCallViewController *)self callDetailsCoordinator];
      [v9 startWithReason:@"Controls manager requested deferred call details presentation"];
    }
    else
    {
    }
  }
}

- (void)fadeInBottomBar
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000F8F2C;
  v2[3] = &unk_1002CD518;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.5];
}

- (void)setMiddleViewButtonsIfNecessary
{
  if ([(PHCallViewController *)self currentState] == 4
    || [(PHCallViewController *)self currentState] == 5)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000F9058;
    v3[3] = &unk_1002CDBE0;
    objc_copyWeak(&v4, &location);
    [(PHAudioCallViewController *)self setMiddleViewState:1 animated:1 completion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)callParticipantsViewController:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PHAudioCallViewController *)self callParticipantsViewController];

  if (v7 == v6)
  {
    [(PHAudioCallViewController *)self performBottomBarActionType:a4];
  }
  else
  {
    id v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      int64_t v10 = a4;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown call participants viewcontroller object %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)callParticipantsViewControllerDidTapCallDetailsGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self callParticipantsViewController];

  if (v5 == v4)
  {
    id v6 = [(PHAudioCallViewController *)self callDetailsCoordinator];
    [v6 startWithReason:@"Call participant view requested call details"];
  }
  else
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot handle call details disclosure button tap from unknown call participants viewcontroller object %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)callParticipantsViewController:(id)a3 willShowMultipleLabel:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PHAudioCallViewController *)self callParticipantsViewController];

  if (v7 != v6) {
    return;
  }
  self->_participantsViewIsShowingMultipleLabel = a4 & ~[(PHAudioCallViewController *)self usesCompactMulticallUI];
  [(PHAudioCallViewController *)self _updatePosterNameAlpha];
  [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
  id v11 = [(PHAudioCallViewController *)self getParticipantsView_WaitingOrNot];
  -[PHAudioCallViewController updateParticipantConstraintsForPosterName:](self, "updateParticipantConstraintsForPosterName:");
  id v8 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v8 callDisplayStyle] != (id)3) {
    goto LABEL_5;
  }
  int v9 = [(PHAudioCallViewController *)self features];
  unsigned int v10 = [v9 isDominoEnabled];

  if (v10)
  {
    [(PHAudioCallViewController *)self layoutParticipantsViewAnimated:0];
    id v8 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    [(PHAudioCallViewController *)self setCallForBackgroundImage:v8 animated:1 callDisplayStyleChanged:0];
LABEL_5:
  }
}

- (void)callParticipantsViewController:(id)a3 didShowMultipleLabel:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PHAudioCallViewController *)self callParticipantsViewController];

  if (v7 == v6)
  {
    id v8 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v8 callDisplayStyle] == (id)3)
    {
      int v9 = [(PHAudioCallViewController *)self features];
      unsigned __int8 v10 = [v9 isDominoEnabled];

      if ((v10 & 1) != 0 || a4) {
        return;
      }
    }
    else
    {

      if (a4) {
        return;
      }
    }
    id v11 = [(PHAudioCallViewController *)self posterNameViewModel];

    if (v11)
    {
      [(PHAudioCallViewController *)self _updateStatusLabelVisibility];
    }
  }
}

- (BOOL)callParticipantsViewControllerShouldShowLargeAvatar:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self callParticipantsViewController];

  if (v5 == v4)
  {
    unsigned __int8 v8 = [(PHAudioCallViewController *)self shouldShowLargeAvatar];
LABEL_6:
    BOOL v7 = v8;
    goto LABEL_7;
  }
  id v6 = [(PHAudioCallViewController *)self callWaitingParticipantsViewController];

  if (v6 == v4)
  {
    unsigned __int8 v8 = [(PHAudioCallViewController *)self shouldShowLargeAvatarForCallWaiting];
    goto LABEL_6;
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)shouldRenderAlertTextColor
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(PHCallViewController *)self currentState] == 8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController shouldRenderAlertTextColor = %d", (uint8_t *)v5, 8u);
  }

  return [(PHCallViewController *)self currentState] == 8;
}

- (BOOL)shouldRenderAlertTextFont
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(PHCallViewController *)self currentState] == 8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController shouldRenderAlertTextFont = %d", (uint8_t *)v5, 8u);
  }

  return [(PHCallViewController *)self currentState] == 8;
}

- (BOOL)shouldShowLargeAvatarForCall:(id)a3
{
  id v4 = a3;
  if ([(PHAudioCallViewController *)self callStateCanShowNewPoster:v4]
    || ![(PHAudioCallViewController *)self prefersShowingCachedLastSeenPosterBeforeCallConnected:v4])
  {
    id v5 = [(PHAudioCallViewController *)self contactWallpaperForCall:v4];
    uint64_t v6 = [(PHAudioCallViewController *)self wallpaperTypeForCNWallpaper:v5];
  }
  else
  {
    id v5 = [(PHAudioCallViewController *)self lastSeenPosterIMWallpaperMetadataForCall:v4];
    uint64_t v6 = [(PHAudioCallViewController *)self wallpaperTypeForIMWallpaperMetadata:v5];
  }
  BOOL v7 = (void *)v6;

  unsigned __int8 v8 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v8 callDisplayStyle] != (id)3)
  {
    BOOL v11 = 0;
    goto LABEL_11;
  }
  int v9 = [(PHAudioCallViewController *)self features];
  unsigned int v10 = [v9 isDominoEnabled];

  if (!v10)
  {
    BOOL v11 = 0;
    goto LABEL_13;
  }
  BOOL v11 = 1;
  if (v7 != (void *)CNWallpaperTypeMemoji && v7 != (void *)CNWallpaperTypeMonogram)
  {
    unsigned __int8 v8 = [(PHAudioCallViewController *)self contactImageForCall:v4];
    [v8 size];
    BOOL v11 = v12 > 300.0;
LABEL_11:
  }
LABEL_13:

  return v11;
}

- (void)updateShouldShowLargeAvatar
{
  id v11 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v11 callDisplayStyle] == (id)3)
  {
    uint64_t v3 = [(PHAudioCallViewController *)self features];
    unsigned int v4 = [v3 isDominoEnabled];

    if (!v4) {
      return;
    }
    if ([(PHAudioCallViewController *)self participantsViewIsShowingMultipleLabel]|| [(PHAudioCallViewController *)self middleViewState] == 4)
    {
      [(PHAudioCallViewController *)self setShouldShowLargeAvatar:0];
      return;
    }
    if ([(PHAudioCallViewController *)self usesCompactMulticallUI]
      && ([(PHAudioCallViewController *)self prioritizedCall],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v11 = [(PHAudioCallViewController *)self prioritizedCall];
      BOOL v6 = [(PHAudioCallViewController *)self shouldShowLargeAvatarForCall:v11];
    }
    else
    {
      BOOL v7 = [(PHAudioCallViewController *)self callParticipantsViewController];
      unsigned __int8 v8 = [v7 currentCallGroups];
      int v9 = [v8 firstObject];
      unsigned int v10 = [v9 calls];
      id v11 = [v10 firstObject];

      BOOL v6 = [(PHAudioCallViewController *)self shouldShowLargeAvatarForCall:v11];
    }
    [(PHAudioCallViewController *)self setShouldShowLargeAvatar:v6];
  }
}

- (id)customColorForStatusLabelWithCall:(id)a3
{
  id v4 = a3;
  if (![(PHAudioCallViewController *)self shouldUseHeroImageLayout])
  {
    id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    if ([v5 callDisplayStyle] != (id)3)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    BOOL v7 = [(PHAudioCallViewController *)self features];
    unsigned int v8 = [v7 isDominoEnabled];

    if (!v8)
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
  }
  id v5 = [(PHAudioCallViewController *)self wallpaperTitleStyleAttributesForCall:v4];
  BOOL v6 = [v5 titleColor];
LABEL_7:

LABEL_8:

  return v6;
}

- (id)customColorForParticipantLabelWithCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v5 callDisplayStyle] != (id)3)
  {
    unsigned int v8 = 0;
    goto LABEL_5;
  }
  BOOL v6 = [(PHAudioCallViewController *)self features];
  unsigned int v7 = [v6 isDominoEnabled];

  if (v7)
  {
    id v5 = [(PHAudioCallViewController *)self wallpaperTitleStyleAttributesForCall:v4];
    unsigned int v8 = [v5 titleColor];
LABEL_5:

    goto LABEL_7;
  }
  unsigned int v8 = 0;
LABEL_7:

  return v8;
}

- (id)customFontForParticipantLabelWithCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v5 callDisplayStyle] != (id)3)
  {
    unsigned int v8 = 0;
    goto LABEL_5;
  }
  BOOL v6 = [(PHAudioCallViewController *)self features];
  unsigned int v7 = [v6 isDominoEnabled];

  if (v7)
  {
    id v5 = [(PHAudioCallViewController *)self wallpaperTitleStyleAttributesForCall:v4];
    unsigned int v8 = [v5 titleFont];
LABEL_5:

    goto LABEL_7;
  }
  unsigned int v8 = 0;
LABEL_7:

  return v8;
}

- (void)setParticipantsViewShouldShowParticipantLabel:(BOOL)a3
{
  if (self->_participantsViewShouldShowParticipantLabel != a3)
  {
    BOOL v3 = a3;
    self->_participantsViewShouldShowParticipantLabel = a3;
    id v5 = [(PHAudioCallViewController *)self getParticipantsView_NotWaiting];
    [(PHAudioCallViewController *)self updateParticipantsLabelForView:v5 isHidden:!v3];
  }
}

- (void)updateParticipantsLabelForView:(id)a3 isHidden:(BOOL)a4
{
  if (a3)
  {
    double v4 = (double)!a4;
    id v6 = [a3 singleCallLabelView];
    id v5 = [v6 participantMarqueeLabel];
    [v5 setAlpha:v4];
  }
}

- (void)startSuppressionOfSTKAlerts
{
  id v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting Suppression of STK Alerts", v3, 2u);
  }

  if (!byte_10032635C && !notify_register_check("MPInCallAlertStateChangeNotification", &dword_100326358))
  {
    byte_10032635C = 1;
    if (!notify_set_state(dword_100326358, 1uLL)) {
      notify_post("MPInCallAlertStateChangeNotification");
    }
  }
}

- (void)stopSuppressionOfSTKAlerts
{
  id v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopping Suppression of STK Alerts", v3, 2u);
  }

  if (byte_10032635C)
  {
    notify_set_state(dword_100326358, 0);
    notify_post("MPInCallAlertStateChangeNotification");
    notify_cancel(dword_100326358);
    byte_10032635C = 0;
  }
}

- (BOOL)shouldShowEnableWiFiCallingAlertForCall:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEmergency] & 1) == 0
    && [v3 disconnectedReason] == 14
    && [v3 service] == 1
    && sub_100092134();
  id v5 = [v3 localSenderIdentityUUID];
  if (v5)
  {
    id v6 = +[TUCallCapabilities senderIdentityCapabilitiesWithUUID:v5];
    unsigned int v7 = v6;
    if (v6) {
      LOBYTE(v8) = 0;
    }
    else {
      LOBYTE(v8) = v4;
    }
    if (v6 && v4) {
      unsigned int v8 = [v6 isWiFiCallingEnabled] ^ 1;
    }

    LOBYTE(v4) = v8;
  }

  return v4;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    BOOL v4 = (AVSpeechSynthesizer *)objc_alloc_init((Class)AVSpeechSynthesizer);
    id v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    speechSynthesizer = self->_speechSynthesizer;
  }

  return speechSynthesizer;
}

- (void)alertWillInvoke
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHAlertDisconnectingCallsNotification" object:0];
}

- (void)updatePresentationStateWithAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHAudioCallViewController *)self shouldPresentAlertButton] != a3)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController is about to set shouldPresentAlertButton to %d", (uint8_t *)v6, 8u);
    }

    [(PHAudioCallViewController *)self setShouldPresentAlertButton:v3];
    [(PHAudioCallViewController *)self updateCurrentState];
    [(PHAudioCallViewController *)self triggerAutoCountdownIfAvailable];
  }
}

- (void)startAutoCountdownAlert
{
  [(PHAudioCallViewController *)self setShouldAutoCountdownAlert:1];

  [(PHAudioCallViewController *)self triggerAutoCountdownIfAvailable];
}

- (void)triggerAutoCountdownIfAvailable
{
  if ([(PHAudioCallViewController *)self shouldAutoCountdownAlert]
    && ([(PHCallViewController *)self currentState] == 9
     || [(PHCallViewController *)self currentState] == 8))
  {
    if ([(PHAudioCallViewController *)self didTriggerAutoCountdownAlertBefore])
    {
      BOOL v3 = sub_1000D5130();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Not triggering auto-countdown alert since we already triggered once before", buf, 2u);
      }
    }
    else
    {
      BOOL v4 = [(PHAudioCallViewController *)self alertCountDownTimer];

      if (!v4)
      {
        id v5 = sub_1000D5130();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting auto-countdown for alert", buf, 2u);
        }

        [(PHAudioCallViewController *)self setDidTriggerAutoCountdownAlertBefore:1];
        *(void *)buf = 0;
        id v23 = buf;
        uint64_t v24 = 0x2020000000;
        uint64_t v25 = 0;
        +[AlertCoordinator countdownDuration];
        uint64_t v25 = v6;
        unsigned int v7 = +[UIApplication sharedApplication];
        unsigned int v8 = [v7 delegate];
        int v9 = [v8 alertCoordinator];
        unsigned int v10 = [v9 isBackgroundCountdownRunning];

        if (v10)
        {
          id v11 = +[UIApplication sharedApplication];
          double v12 = [v11 delegate];
          uint64_t v13 = [v12 alertCoordinator];
          [v13 currentBackgroundCountdownDuration];
          *((void *)v23 + 3) = v14;

          double v15 = +[UIApplication sharedApplication];
          dispatch_time_t v16 = [v15 delegate];
          id v17 = [v16 alertCoordinator];
          [v17 stopBackgroundCountdown];
        }
        objc_initWeak(&location, self);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000FA404;
        v19[3] = &unk_1002CE300;
        objc_copyWeak(&v20, &location);
        v19[4] = buf;
        unsigned __int8 v18 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v19 block:1.0];
        [(PHAudioCallViewController *)self setAlertCountDownTimer:v18];

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);
      }
    }
  }
}

- (void)speakAlertUtteranceIfNecessary
{
  if ([(PHAudioCallViewController *)self shouldPresentAlertButton])
  {
    BOOL v3 = [(PHAudioCallViewController *)self frontmostCall];
    if ([v3 originatingUIType] == 11
      && ![(PHAudioCallViewController *)self didRequestToSpeakAlertUtterance])
    {
      BOOL v4 = +[UIScreen _carScreen];

      id v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      if (v4) {
        CFStringRef v7 = @"ALERT_ACTION_TEXT_BUTTON_UTTERANCE_CARPLAY";
      }
      else {
        CFStringRef v7 = @"ALERT_ACTION_TEXT_BUTTON_UTTERANCE";
      }
      unsigned int v8 = [v5 localizedStringForKey:v7 value:&stru_1002D6110 table:@"Localizable-Stewie"];

      int v9 = sub_1000D5130();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        double v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting to speak alert utterance: %@", (uint8_t *)&v14, 0xCu);
      }

      unsigned int v10 = +[UIScreen _carScreen];
      id v11 = [(PHAudioCallViewController *)self speechSynthesizer];
      [v11 setUsesApplicationAudioSession:v10 != 0];

      double v12 = +[AVSpeechUtterance speechUtteranceWithString:v8];
      uint64_t v13 = [(PHAudioCallViewController *)self speechSynthesizer];
      [v13 speakUtterance:v12];

      [(PHAudioCallViewController *)self setDidRequestToSpeakAlertUtterance:1];
    }
  }
}

- (BOOL)isReadyToShowCallDetails
{
  id v2 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)2;

  return v3;
}

- (void)audioDeviceControllerMutedTalkerDidStart:(id)a3
{
  if ([(PHAudioCallViewController *)self audioCallMutedTalkerIsSupported])
  {
    unsigned __int8 v4 = [(PHAudioCallViewController *)self didNotifyMutedCaller];
    id v5 = sub_1000D5130();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)unsigned int v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: received audioDeviceControllerMutedTalkerDidStart callback, but banner was presented before, skips updating", v8, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: received audioDeviceControllerMutedTalkerDidStart callback, presenting banner", buf, 2u);
      }

      [(PHAudioCallViewController *)self setDidNotifyMutedCaller:1];
      CFStringRef v7 = [(PHAudioCallViewController *)self mutedTalkerBannerViewController];
      [v7 showBanner];

      id v5 = [(PHAudioCallViewController *)self mutedTalkerBannerViewController];
      [v5 playBannerSound];
    }
  }
}

- (void)bannerDidGetTap
{
  if ([(PHAudioCallViewController *)self audioCallMutedTalkerIsSupported])
  {
    BOOL v3 = [(PHAudioCallViewController *)self buttonsViewController];
    [v3 handleMutedTalkerBannerTap];

    unsigned __int8 v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v5 = [v4 callDisplayStyle];

    if (v5 == (id)2)
    {
      id v6 = [(PHAudioCallViewController *)self mutedTalkerBannerViewController];
      [v6 dismissBanner];
    }
  }
}

- (BOOL)audioCallMutedTalkerIsSupported
{
  return 0;
}

- (void)contactDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 wallpaper];
    int v28 = 138412546;
    *(void *)double v29 = v4;
    *(_WORD *)&v29[8] = 2112;
    double v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "contactDidChange: %@ wallpaper: %@", (uint8_t *)&v28, 0x16u);
  }
  if ([(PHAudioCallViewController *)self shouldUpdateBackgroundForEmergencyCall])
  {
    CFStringRef v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "we are in emergency call, ignore contact change", (uint8_t *)&v28, 2u);
    }

    [(PHAudioCallViewController *)self updateViewForEmergencyCallIfNecessary];
    goto LABEL_25;
  }
  unsigned int v8 = [(PHAudioCallViewController *)self contactsCache];
  int v9 = [v4 identifier];
  unsigned int v10 = [v8 objectForKey:v9];

  id v11 = +[UIApplication sharedApplication];
  double v12 = [v11 delegate];
  unsigned int v13 = [v12 isShowingIncomingNameUpdate];

  int v14 = [(PHAudioCallViewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v15 = [v14 topViewController];
    if (v15)
    {
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      int isKindOfClass = 0;
    }

    if (!v10) {
      goto LABEL_22;
    }
  }
  else
  {
    int isKindOfClass = 0;
    double v15 = v14;
    if (!v10) {
      goto LABEL_22;
    }
  }
  id v17 = [(PHAudioCallViewController *)self contactsCache];
  unsigned __int8 v18 = [v4 identifier];
  [v17 setObject:v4 forKey:v18];

  if ((v13 | isKindOfClass))
  {
    id v19 = sub_1000D5130();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 67109376;
      *(_DWORD *)double v29 = v13;
      *(_WORD *)&void v29[4] = 1024;
      *(_DWORD *)&v29[6] = isKindOfClass & 1;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: going to render poster again since contact did change, isBannerPresented = %d, isContactCardPresented = %d", (uint8_t *)&v28, 0xEu);
    }

    id v20 = [(PHAudioCallViewController *)self configurationCache];
    [v20 removeAllObjects];

    [(PHAudioCallViewController *)self updateLayeredBackgroundWallpaper];
  }
  unsigned int v21 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  if ([v21 callDisplayStyle] != (id)3) {
    goto LABEL_21;
  }
  unsigned int v22 = [(PHAudioCallViewController *)self features];
  unsigned int v23 = [v22 isDominoEnabled];

  if (v23)
  {
    uint64_t v24 = [(PHAudioCallViewController *)self callToUseForWallpaper];
    unsigned int v21 = [(PHAudioCallViewController *)self contactImageDataForCall:v24];

    id v25 = [objc_alloc((Class)UIImage) initWithData:v21];
    [(PHAudioCallViewController *)self setBackgroundImage:v25];

LABEL_21:
  }
LABEL_22:
  if (v13)
  {
    uint64_t v26 = +[UIApplication sharedApplication];
    id v27 = [v26 delegate];
    [v27 setIsShowingIncomingNameUpdate:0];
  }
LABEL_25:
}

- (void)presentDisconnectionAlert:(id)a3
{
  id v4 = a3;
  id v5 = +[CNKFeatures sharedInstance];
  unsigned int v6 = [v5 isEnhancedEmergencyEnabled];

  if (v6)
  {
    uint64_t v7 = [(PHAudioCallViewController *)self emergencyCoordinator];
    if (v7)
    {
      unsigned int v8 = (void *)v7;
      int v9 = [(PHAudioCallViewController *)self emergencyCoordinator];
      unsigned int v10 = [v9 videoStreamingIsOnScreen];

      if (v10)
      {
        id v11 = +[NSBundle mainBundle];
        double v12 = [v11 localizedStringForKey:@"STOP_SHARING_LIVE_VIDEO_TITLE" value:&stru_1002D6110 table:@"InCallService"];
        [v4 setTitle:v12];

        unsigned int v13 = +[NSBundle mainBundle];
        int v14 = [v13 localizedStringForKey:@"STOP_SHARING_LIVE_VIDEO_SUBTITLE" value:&stru_1002D6110 table:@"InCallService"];
        [v4 setMessage:v14];

        objc_initWeak(&location, self);
        double v15 = +[NSBundle mainBundle];
        dispatch_time_t v16 = [v15 localizedStringForKey:@"STOP_SHARING_CAMERA" value:&stru_1002D6110 table:@"InCallService"];
        unsigned __int8 v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472;
        id v20 = sub_1000FAEF0;
        unsigned int v21 = &unk_1002D0000;
        objc_copyWeak(&v22, &location);
        id v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v18];
        [v4 addAction:v17, v18, v19, v20, v21];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
    }
    [(PHAudioCallViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (BOOL)isShowSOSConfirmationSupported
{
  id v2 = [(PHAudioCallViewController *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)2;

  return v3;
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = [(PHAudioCallViewController *)self featureFlags];
  unsigned int v7 = [v6 screenSharingRemoteControlEnabled];

  unsigned int v8 = sub_1000D5250();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      CFStringRef v10 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      int v11 = 138412290;
      CFStringRef v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating layer mask for remote control, remote control state is %@", (uint8_t *)&v11, 0xCu);
    }
    [(PHAudioCallViewController *)self updateScreenSharingDisableUpdateMask];
  }
  else if (v9)
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating layer mask for remote control, screen sharing remote control feature flag is disabled", (uint8_t *)&v11, 2u);
  }
}

- (void)handleCancelPressedInCallBufferScreen
{
  [(PHAudioCallViewController *)self pauseCallBufferTimer];
  BOOL v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  BOOL v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000FB338;
  v20[3] = &unk_1002CEE38;
  v20[4] = self;
  unsigned int v6 = +[UIAlertAction actionWithTitle:v5 style:1 handler:v20];
  [v3 addAction:v6];

  unsigned int v7 = +[NSBundle mainBundle];
  unsigned int v8 = [v7 localizedStringForKey:@"END_CALL_SOS" value:&stru_1002D6110 table:@"InCallService"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000FB3B8;
  v19[3] = &unk_1002CEE38;
  v19[4] = self;
  BOOL v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v19];
  [v3 addAction:v9];

  [(PHAudioCallViewController *)self presentViewController:v3 animated:1 completion:0];
  objc_initWeak(&location, self);
  CFStringRef v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  int v14 = sub_1000FB538;
  double v15 = &unk_1002CEE60;
  id v10 = v3;
  id v16 = v10;
  objc_copyWeak(&v17, &location);
  int v11 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v12 block:5.0];
  -[PHAudioCallViewController setConfirmationTimeoutTimer:](self, "setConfirmationTimeoutTimer:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)shouldPlayAudioInCallBufferScreen
{
  id v2 = +[PHInCallRootViewController dismissalAssertions];
  unsigned __int8 v3 = [v2 containsObject:@"PHSliderSwipeCallBufferScreenAssertionReason"];

  return v3 ^ 1;
}

- (void)startMessagePlayback
{
  [(PHAudioCallViewController *)self stopMessagePlayback];
  if (+[SOSUtilities shouldPlayAudioDuringCountdown])
  {
    unsigned __int8 v3 = [(PHAudioCallViewController *)self voiceMessageManager];
    if (v3)
    {
    }
    else if ([(PHAudioCallViewController *)self shouldPlayAudioInCallBufferScreen])
    {
      id v4 = [objc_alloc((Class)SOSVoiceMessageManager) initWithMessageType:101];
      [(PHAudioCallViewController *)self setVoiceMessageManager:v4];

      id v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "startMessagePlayback,starting call buffer voice message", v7, 2u);
      }

      unsigned int v6 = [(PHAudioCallViewController *)self voiceMessageManager];
      [v6 startMessagePlayback];
    }
  }
}

- (void)stopMessagePlayback
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self voiceMessageManager];

  if (v3)
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stopMessagePlayback", v6, 2u);
    }

    id v5 = [(PHAudioCallViewController *)self voiceMessageManager];
    [v5 stopMessagePlayback];

    [(PHAudioCallViewController *)self setVoiceMessageManager:0];
  }
}

- (void)startCallBufferScreenCountdown
{
  [(PHAudioCallViewController *)self stopCallBufferTimer];
  [(PHAudioCallViewController *)self startMessagePlayback];
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callBufferTimer];

  if (!v3)
  {
    objc_initWeak(&location, self);
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 5;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_1000FB970;
    v5[3] = &unk_1002CE300;
    objc_copyWeak(&v6, &location);
    v5[4] = v7;
    id v4 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v5 block:1.0];
    [(PHAudioCallViewController *)self setCallBufferTimer:v4];

    objc_destroyWeak(&v6);
    _Block_object_dispose(v7, 8);
    objc_destroyWeak(&location);
  }
}

- (void)stopCallBufferTimer
{
  unsigned __int8 v3 = [(PHAudioCallViewController *)self callBufferTimer];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController,stopCallBufferTimer", v7, 2u);
    }

    id v6 = [(PHAudioCallViewController *)self callBufferTimer];
    [v6 invalidate];

    [(PHAudioCallViewController *)self setCallBufferTimer:0];
  }
}

- (void)pauseCallBufferTimer
{
}

- (void)resumeCallBufferTimer
{
}

- (void)restartCallBufferTimer
{
  [(PHAudioCallViewController *)self setShouldPauseSOSCallBufferTimer:0];

  [(PHAudioCallViewController *)self startCallBufferScreenCountdown];
}

- (void)displayDialledNumberDetailsForCallBufferScreen
{
  if (!self->_bufferSingleCallLabelView)
  {
    unsigned __int8 v3 = [PHSingleCallParticipantLabelView alloc];
    unsigned int v4 = [(PHAudioCallViewController *)self callDisplayStyleManager];
    id v5 = [(PHSingleCallParticipantLabelView *)v3 initWithCallDisplayStyleManager:v4];
    bufferSingleCallLabelView = self->_bufferSingleCallLabelView;
    self->_bufferSingleCallLabelView = v5;

    [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView setPreservesSuperviewLayoutMargins:1];
    [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView setOverrideUserInterfaceStyle:2];
    unsigned int v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = self->_bufferSingleCallLabelView;
      *(_DWORD *)buf = 138412290;
      unsigned int v44 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding a new single-participant view to the view hierarchy: %@", buf, 0xCu);
    }

    BOOL v9 = [(PHAudioCallViewController *)self view];
    [v9 addSubview:self->_bufferSingleCallLabelView];

    id v41 = +[UIFont phPreferredFontForTextStyle:UIFontTextStyleLargeTitle];
    id v10 = self->_bufferSingleCallLabelView;
    [v41 pointSize];
    int v11 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    [(PHSingleCallParticipantLabelView *)v10 setParticipantMarqueeLabelFont:v11];

    CFStringRef v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"SOS_CALL_BUFFER_TITLE" value:&stru_1002D6110 table:@"InCallService"];
    int v14 = [(PHAbstractCallParticipantLabelView *)self->_bufferSingleCallLabelView participantMarqueeLabel];
    [v14 setText:v13];

    double v15 = self->_bufferSingleCallLabelView;
    id v16 = +[UIColor systemRedColor];
    [(PHSingleCallParticipantLabelView *)v15 setStatusLabelTextColor:v16];

    labelDescriptorFactorCGFloat y = self->_labelDescriptorFactory;
    unsigned __int8 v18 = +[NSBundle mainBundle];
    uint64_t v19 = [v18 localizedStringForKey:@"SOS_CALL_BUFFER_SUBTITLE" value:&stru_1002D6110 table:@"InCallService"];
    id v20 = [(CNKCallParticipantLabelDescriptorFactory *)labelDescriptorFactory makeLabelWithString:v19];

    [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView setLabelDescriptor:v20];
    unsigned int v21 = [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView topAnchor];
    id v22 = [(PHAudioCallViewController *)self view];
    unsigned int v23 = [v22 safeAreaLayoutGuide];
    uint64_t v24 = [v23 topAnchor];
    +[TPIncomingCallMetricsProvider sixPercentOfDeviceHeight];
    id v25 = [v21 constraintEqualToAnchor:v24];

    uint64_t v26 = [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView centerXAnchor];
    id v27 = [(PHAudioCallViewController *)self view];
    int v28 = [v27 centerXAnchor];
    double v29 = [v26 constraintEqualToAnchor:v28];

    double v30 = [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView leadingAnchor];
    double v31 = [(PHAudioCallViewController *)self view];
    double v32 = [v31 readableContentGuide];
    double v33 = [v32 leadingAnchor];
    id v34 = [v30 constraintEqualToAnchor:v33];

    long long v35 = [(PHSingleCallParticipantLabelView *)self->_bufferSingleCallLabelView trailingAnchor];
    objc_super v36 = [(PHAudioCallViewController *)self view];
    long long v37 = [v36 readableContentGuide];
    long long v38 = [v37 trailingAnchor];
    uint64_t v39 = [v35 constraintEqualToAnchor:v38];

    v42[0] = v25;
    v42[1] = v29;
    v42[2] = v34;
    v42[3] = v39;
    BOOL v40 = +[NSArray arrayWithObjects:v42 count:4];
    +[NSLayoutConstraint activateConstraints:v40];
  }
}

+ (BOOL)wallpaperContentIsSensitive:(id)a3
{
  id v3 = a3;
  if (+[SensitivityFeatureFlags isContactNudityDetectionEnabled])
  {
    unsigned int v4 = [v3 contentIsSensitive];
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SNAP: IMWallpaper.contentIsSensitive returning %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SNAP: IMWallpaper.contentIsSensitive not performing check", (uint8_t *)v7, 2u);
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (IMNicknameProvider)imNicknameProvider
{
  imNicknameProvider = self->_imNicknameProvider;
  if (!imNicknameProvider)
  {
    unsigned int v4 = (IMNicknameProvider *)objc_alloc_init((Class)IMNicknameProvider);
    id v5 = self->_imNicknameProvider;
    self->_imNicknameProvider = v4;

    imNicknameProvider = self->_imNicknameProvider;
  }

  return imNicknameProvider;
}

- (void)addPosterBlurToPosterVC:(id)a3 nameLabelWrapper:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v19 = v6;
    BOOL v7 = +[SensitivityFeatureFlags isCommunicationSafetyEnabled];
    unsigned int v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating posterSensitiveBlurView with isCommunicationSafetyEnabled: %d", buf, 8u);
    }

    BOOL v9 = [[_TtC13InCallService35PHContactWallpaperSensitiveBlurView alloc] initWithIsCommunicationSafety:v7];
    [(PHContactWallpaperSensitiveBlurView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (!v7)
    {
      objc_initWeak((id *)buf, v9);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000FC584;
      v29[3] = &unk_1002CED28;
      objc_copyWeak(&v30, (id *)buf);
      [(PHContactWallpaperSensitiveBlurView *)v9 setDidTapRevealButton:v29];
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    id v10 = [v5 view];
    [v10 addSubview:v9];

    id v27 = [(PHContactWallpaperSensitiveBlurView *)v9 topAnchor];
    int v28 = [v5 view];
    uint64_t v26 = [v28 topAnchor];
    id v25 = [v27 constraintEqualToAnchor:v26];
    v31[0] = v25;
    unsigned int v23 = [(PHContactWallpaperSensitiveBlurView *)v9 bottomAnchor];
    uint64_t v24 = [v5 view];
    id v22 = [v24 bottomAnchor];
    unsigned int v21 = [v23 constraintEqualToAnchor:v22];
    v31[1] = v21;
    id v20 = [(PHContactWallpaperSensitiveBlurView *)v9 trailingAnchor];
    int v11 = [v5 view];
    CFStringRef v12 = [v11 trailingAnchor];
    uint64_t v13 = [v20 constraintEqualToAnchor:v12];
    v31[2] = v13;
    int v14 = [(PHContactWallpaperSensitiveBlurView *)v9 leadingAnchor];
    double v15 = [v5 view];
    id v16 = [v15 leadingAnchor];
    id v17 = [v14 constraintEqualToAnchor:v16];
    v31[3] = v17;
    unsigned __int8 v18 = +[NSArray arrayWithObjects:v31 count:4];
    +[NSLayoutConstraint activateConstraints:v18];

    +[TPIncomingCallMetricsProvider addCallerNameView:v19 toContainerView:v9];
    id v6 = v19;
  }
}

- (BOOL)shouldEnableShareMediaButton
{
  return self->_shouldEnableShareMediaButton;
}

- (void)setShouldEnableShareMediaButton:(BOOL)a3
{
  self->_shouldEnableShareMediaButton = a3;
}

- (BOOL)shouldEnableVideoStreamingButton
{
  return self->_shouldEnableVideoStreamingButton;
}

- (void)setShouldEnableVideoStreamingButton:(BOOL)a3
{
  self->_shouldEnableVideoStreamingButton = a3;
}

- (UILabel)enhancedEmergencyIntermittentStateLabel
{
  return (UILabel *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEnhancedEmergencyIntermittentStateLabel:(id)a3
{
}

- (UILabel)enhancedEmergencySecondaryLabel
{
  return (UILabel *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEnhancedEmergencySecondaryLabel:(id)a3
{
}

- (UIScrollView)enhancedEmergencyIntermittentStateScrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEnhancedEmergencyIntermittentStateScrollView:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (BOOL)participantsViewIsShowingMultipleLabel
{
  return self->_participantsViewIsShowingMultipleLabel;
}

- (void)setParticipantsViewIsShowingMultipleLabel:(BOOL)a3
{
  self->_participantsViewIsShowingMultipleLabel = a3;
}

- (NSMutableArray)callUUIDsThatPresentedSNaPHUD
{
  return self->_callUUIDsThatPresentedSNaPHUD;
}

- (void)setImNicknameProvider:(id)a3
{
}

- (TUCall)prioritizedCall
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);

  return (TUCall *)WeakRetained;
}

- (void)setButtonsViewController:(id)a3
{
}

- (PHCallParticipantsViewController)callParticipantsViewController
{
  return (PHCallParticipantsViewController *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCallParticipantsViewController:(id)a3
{
}

- (void)setKeypadViewController:(id)a3
{
}

- (UIView)emergencyPhotoPickerGrabberView
{
  return self->_emergencyPhotoPickerGrabberView;
}

- (void)setEmergencyPhotoPickerGrabberView:(id)a3
{
}

- (UIButton)callDetailsViewButton
{
  return (UIButton *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCallDetailsViewButton:(id)a3
{
}

- (UIView)ambientAudioRoutesControlView
{
  return (UIView *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAmbientAudioRoutesControlView:(id)a3
{
}

- (UIViewController)callRecordingButtonViewController
{
  return self->_callRecordingButtonViewController;
}

- (void)setCallRecordingButtonViewController:(id)a3
{
}

- (UIViewController)callRecordingPillViewController
{
  return self->_callRecordingPillViewController;
}

- (void)setCallRecordingPillViewController:(id)a3
{
}

- (NSLayoutConstraint)callRecordingLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCallRecordingLeadingConstraint:(id)a3
{
}

- (UILayoutGuide)recordingIndicatorLayoutGuide
{
  return self->_recordingIndicatorLayoutGuide;
}

- (void)setRecordingIndicatorLayoutGuide:(id)a3
{
}

- (unsigned)middleViewState
{
  return self->_middleViewState;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (PHDeclineCallServiceProtocol)declineCallService
{
  return self->_declineCallService;
}

- (void)setDeclineCallService:(id)a3
{
}

- (CNKCoreAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (PHPosterNameViewModel)posterNameViewModel
{
  return self->_posterNameViewModel;
}

- (PHPosterNameViewModel)keypadPosterNameViewModel
{
  return self->_keypadPosterNameViewModel;
}

- (PHPosterNameViewModel)screeningPosterNameViewModel
{
  return self->_screeningPosterNameViewModel;
}

- (PHCallParticipantsViewController)callWaitingParticipantsViewController
{
  return (PHCallParticipantsViewController *)objc_getProperty(self, a2, 328, 1);
}

- (void)setCallWaitingParticipantsViewController:(id)a3
{
}

- (NSArray)callWaitingLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setCallWaitingLayoutConstraints:(id)a3
{
}

- (NSLayoutConstraint)participantsViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 344, 1);
}

- (void)setParticipantsViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 352, 1);
}

- (void)setParticipantsViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewCenterYConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 360, 1);
}

- (void)setParticipantsViewCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 368, 1);
}

- (void)setParticipantsViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 376, 1);
}

- (void)setParticipantsViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 384, 1);
}

- (void)setParticipantsViewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewVerticalPosterNameTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 392, 1);
}

- (void)setParticipantsViewVerticalPosterNameTopConstraint:(id)a3
{
}

- (BOOL)participantsViewShouldShowParticipantLabel
{
  return self->_participantsViewShouldShowParticipantLabel;
}

- (UILayoutGuide)leadingSideLayoutGuide
{
  return self->_leadingSideLayoutGuide;
}

- (void)setLeadingSideLayoutGuide:(id)a3
{
}

- (UILayoutGuide)trailingSideLayoutGuide
{
  return self->_trailingSideLayoutGuide;
}

- (void)setTrailingSideLayoutGuide:(id)a3
{
}

- (BOOL)shouldShowLargeAvatar
{
  return self->_shouldShowLargeAvatar;
}

- (void)setShouldShowLargeAvatar:(BOOL)a3
{
  self->_shouldShowLargeAvatar = a3;
}

- (BOOL)shouldShowLargeAvatarForCallWaiting
{
  return self->_shouldShowLargeAvatarForCallWaiting;
}

- (void)setShouldShowLargeAvatarForCallWaiting:(BOOL)a3
{
  self->_shouldShowLargeAvatarForCallWaiting = a3;
}

- (BOOL)hasKeypadUpdated
{
  return self->_hasKeypadUpdated;
}

- (void)setHasKeypadUpdated:(BOOL)a3
{
  self->_hasKeypadUpdated = a3;
}

- (void)setScreeningViewController:(id)a3
{
}

- (UIViewController)screeningBackgroundViewController
{
  return self->_screeningBackgroundViewController;
}

- (void)setScreeningBackgroundViewController:(id)a3
{
}

- (void)setUseRTTButton:(id)a3
{
}

- (void)setExtensionNumberButton:(id)a3
{
}

- (void)setCallTransferButton:(id)a3
{
}

- (CNKTranscriptionViewComposerFactory)screeningViewControllerFactory
{
  return self->_screeningViewControllerFactory;
}

- (void)setScreeningViewControllerFactory:(id)a3
{
}

- (void)setVoiceLoopManager:(id)a3
{
}

- (void)setVoiceLoopViewController:(id)a3
{
}

- (UIView)currentMiddleView
{
  return (UIView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setCurrentMiddleView:(id)a3
{
}

- (UIView)middleSizingView
{
  return (UIView *)objc_getProperty(self, a2, 488, 1);
}

- (void)setMiddleSizingView:(id)a3
{
}

- (id)pendingMiddleViewAnimations
{
  return self->_pendingMiddleViewAnimations;
}

- (void)setPendingMiddleViewAnimations:(id)a3
{
}

- (NSLayoutConstraint)buttonsViewBottomConstraint
{
  return self->_buttonsViewBottomConstraint;
}

- (void)setButtonsViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomBarBottomConstraint
{
  return self->_bottomBarBottomConstraint;
}

- (void)setBottomBarBottomConstraint:(id)a3
{
}

- (FTConstraintsToggle)screeningConstraints
{
  return self->_screeningConstraints;
}

- (void)setScreeningConstraints:(id)a3
{
}

- (UIView)heldCallControlsView
{
  return self->_heldCallControlsView;
}

- (void)setHeldCallControlsView:(id)a3
{
}

- (TUCall)callForBackgroundImage
{
  return self->_callForBackgroundImage;
}

- (void)setCallForBackgroundImage:(id)a3
{
}

- (PHBackgroundGradientBlurView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIImageView)unblurredBackgroundImageView
{
  return self->_unblurredBackgroundImageView;
}

- (void)setUnblurredBackgroundImageView:(id)a3
{
}

- (UIVisualEffectView)keypadBackgroundView
{
  return self->_keypadBackgroundView;
}

- (void)setKeypadBackgroundView:(id)a3
{
}

- (UIView)screeningBackgroundView
{
  return self->_screeningBackgroundView;
}

- (void)setScreeningBackgroundView:(id)a3
{
}

- (PRUISPosterRenderingViewController)renderingViewController
{
  return self->_renderingViewController;
}

- (void)setRenderingViewController:(id)a3
{
}

- (UIImage)snapshottedPosterImageToUseForColorInversion
{
  return self->_snapshottedPosterImageToUseForColorInversion;
}

- (void)setSnapshottedPosterImageToUseForColorInversion:(id)a3
{
}

- (BOOL)hasInvertedUIElementColorsBasedOnPoster
{
  return self->_hasInvertedUIElementColorsBasedOnPoster;
}

- (void)setHasInvertedUIElementColorsBasedOnPoster:(BOOL)a3
{
  self->_hasInvertedUIElementColorsBasedOnPoster = a3;
}

- (id)suspendPosterAfterDelayBlock
{
  return self->_suspendPosterAfterDelayBlock;
}

- (void)setSuspendPosterAfterDelayBlock:(id)a3
{
}

- (UIView)alwaysOnDisplayDimmingView
{
  return self->_alwaysOnDisplayDimmingView;
}

- (void)setAlwaysOnDisplayDimmingView:(id)a3
{
}

- (PHPosterNameViewModel)alwaysOnDisplayPosterNameViewModel
{
  return self->_alwaysOnDisplayPosterNameViewModel;
}

- (void)setAlwaysOnDisplayPosterNameViewModel:(id)a3
{
}

- (UIView)defaultBackgroundGradientView
{
  return self->_defaultBackgroundGradientView;
}

- (void)setDefaultBackgroundGradientView:(id)a3
{
}

- (PHAudioRoutingMenuController)routeListController
{
  return self->_routeListController;
}

- (void)setRouteListController:(id)a3
{
}

- (CNKMutedTalkerBannerViewControllerProtocol)mutedTalkerBannerViewController
{
  return self->_mutedTalkerBannerViewController;
}

- (void)setMutedTalkerBannerViewController:(id)a3
{
}

- (BOOL)didNotifyMutedCaller
{
  return self->_didNotifyMutedCaller;
}

- (void)setDidNotifyMutedCaller:(BOOL)a3
{
  self->_didNotifyMutedCaller = a3;
}

- (BOOL)participantsViewControllersShouldIgnoreUpdates
{
  return self->_participantsViewControllersShouldIgnoreUpdates;
}

- (BOOL)waitingForFullScreenAudioRoutes
{
  return self->_waitingForFullScreenAudioRoutes;
}

- (void)setWaitingForFullScreenAudioRoutes:(BOOL)a3
{
  self->_waitingForFullScreenAudioRoutes = a3;
}

- (BOOL)wasPresentedAsBanner
{
  return self->_wasPresentedAsBanner;
}

- (void)setWasPresentedAsBanner:(BOOL)a3
{
  self->_wasPresentedAsBanner = a3;
}

- (UIButton)blockButton
{
  return (UIButton *)objc_getProperty(self, a2, 640, 1);
}

- (void)setBlockButton:(id)a3
{
}

- (UIView)posterBadgeView
{
  return (UIView *)objc_getProperty(self, a2, 648, 1);
}

- (void)setPosterBadgeView:(id)a3
{
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (CNKCallDetailsCoordinatorProtocol)callDetailsCoordinator
{
  return self->_callDetailsCoordinator;
}

- (void)setCallDetailsCoordinator:(id)a3
{
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (BOOL)canDumpHierarchy
{
  return self->_canDumpHierarchy;
}

- (void)setCanDumpHierarchy:(BOOL)a3
{
  self->_canDumpHierarchCGFloat y = a3;
}

- (CNKMutedTalkerBannerViewControllerFactory)mutedTalkerViewControllerFactory
{
  return self->_mutedTalkerViewControllerFactory;
}

- (void)setMutedTalkerViewControllerFactory:(id)a3
{
}

- (NSCache)contactsCache
{
  return self->_contactsCache;
}

- (void)setContactsCache:(id)a3
{
}

- (NSCache)configurationCache
{
  return self->_configurationCache;
}

- (void)setConfigurationCache:(id)a3
{
}

- (BOOL)shouldPresentAlertButton
{
  return self->_shouldPresentAlertButton;
}

- (void)setShouldPresentAlertButton:(BOOL)a3
{
  self->_shouldPresentAlertButton = a3;
}

- (BOOL)shouldAutoCountdownAlert
{
  return self->_shouldAutoCountdownAlert;
}

- (void)setShouldAutoCountdownAlert:(BOOL)a3
{
  self->_shouldAutoCountdownAlert = a3;
}

- (BOOL)didTriggerAutoCountdownAlertBefore
{
  return self->_didTriggerAutoCountdownAlertBefore;
}

- (void)setDidTriggerAutoCountdownAlertBefore:(BOOL)a3
{
  self->_didTriggerAutoCountdownAlertBefore = a3;
}

- (BOOL)alertTriggeredByAutoCountdown
{
  return self->_alertTriggeredByAutoCountdown;
}

- (void)setAlertTriggeredByAutoCountdown:(BOOL)a3
{
  self->_alertTriggeredByAutoCountdown = a3;
}

- (BOOL)didRequestToSpeakAlertUtterance
{
  return self->_didRequestToSpeakAlertUtterance;
}

- (void)setDidRequestToSpeakAlertUtterance:(BOOL)a3
{
  self->_didRequestToSpeakAlertUtterance = a3;
}

- (NSTimer)alertCountDownTimer
{
  return self->_alertCountDownTimer;
}

- (void)setAlertCountDownTimer:(id)a3
{
}

- (UILabel)emergencyTextViaSatelliteLabel
{
  return (UILabel *)objc_getProperty(self, a2, 712, 1);
}

- (void)setEmergencyTextViaSatelliteLabel:(id)a3
{
}

- (PHEnhancedEmergencyCoordinator)emergencyCoordinator
{
  return self->_emergencyCoordinator;
}

- (void)setEmergencyCoordinator:(id)a3
{
}

- (NSTimer)callBufferTimer
{
  return self->_callBufferTimer;
}

- (void)setCallBufferTimer:(id)a3
{
}

- (NSTimer)confirmationTimeoutTimer
{
  return self->_confirmationTimeoutTimer;
}

- (void)setConfirmationTimeoutTimer:(id)a3
{
}

- (BOOL)shouldPauseSOSCallBufferTimer
{
  return self->_shouldPauseSOSCallBufferTimer;
}

- (void)setShouldPauseSOSCallBufferTimer:(BOOL)a3
{
  self->_shouldPauseSOSCallBufferTimer = a3;
}

- (PHSingleCallParticipantLabelView)bufferSingleCallLabelView
{
  return (PHSingleCallParticipantLabelView *)objc_getProperty(self, a2, 744, 1);
}

- (void)setBufferSingleCallLabelView:(id)a3
{
}

- (SOSVoiceMessageManager)voiceMessageManager
{
  return self->_voiceMessageManager;
}

- (void)setVoiceMessageManager:(id)a3
{
}

- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory
{
  return self->_screenSharingInteractionControllerFactory;
}

- (NSString)UUIDForLocallyDisconnectedCall
{
  return self->_UUIDForLocallyDisconnectedCall;
}

- (void)setUUIDForLocallyDisconnectedCall:(id)a3
{
}

- (NSObject)stateChangeLockObservation
{
  return self->_stateChangeLockObservation;
}

- (void)setStateChangeLockObservation:(id)a3
{
}

- (id)stateDisplayChangedObservation
{
  return self->_stateDisplayChangedObservation;
}

- (void)setStateDisplayChangedObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateDisplayChangedObservation, 0);
  objc_storeStrong((id *)&self->_stateChangeLockObservation, 0);
  objc_storeStrong((id *)&self->_UUIDForLocallyDisconnectedCall, 0);
  objc_storeStrong((id *)&self->_screenSharingInteractionControllerFactory, 0);
  objc_storeStrong((id *)&self->_voiceMessageManager, 0);
  objc_storeStrong((id *)&self->_bufferSingleCallLabelView, 0);
  objc_storeStrong((id *)&self->_confirmationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_callBufferTimer, 0);
  objc_storeStrong((id *)&self->_emergencyCoordinator, 0);
  objc_storeStrong((id *)&self->_emergencyTextViaSatelliteLabel, 0);
  objc_storeStrong((id *)&self->_alertCountDownTimer, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_mutedTalkerViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_callDetailsCoordinator, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_posterBadgeView, 0);
  objc_storeStrong((id *)&self->_blockButton, 0);
  objc_storeStrong((id *)&self->_mutedTalkerBannerViewController, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundGradientView, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisplayPosterNameViewModel, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisplayDimmingView, 0);
  objc_storeStrong(&self->_suspendPosterAfterDelayBlock, 0);
  objc_storeStrong((id *)&self->_snapshottedPosterImageToUseForColorInversion, 0);
  objc_storeStrong((id *)&self->_renderingViewController, 0);
  objc_storeStrong((id *)&self->_screeningBackgroundView, 0);
  objc_storeStrong((id *)&self->_keypadBackgroundView, 0);
  objc_storeStrong((id *)&self->_unblurredBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_callForBackgroundImage, 0);
  objc_storeStrong((id *)&self->_heldCallControlsView, 0);
  objc_storeStrong((id *)&self->_screeningConstraints, 0);
  objc_storeStrong((id *)&self->_bottomBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonsViewBottomConstraint, 0);
  objc_storeStrong(&self->_pendingMiddleViewAnimations, 0);
  objc_storeStrong((id *)&self->_middleSizingView, 0);
  objc_storeStrong((id *)&self->_currentMiddleView, 0);
  objc_storeStrong((id *)&self->_voiceLoopViewController, 0);
  objc_storeStrong((id *)&self->_voiceLoopManager, 0);
  objc_storeStrong((id *)&self->_screeningViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_callTransferButton, 0);
  objc_storeStrong((id *)&self->_extensionNumberButton, 0);
  objc_storeStrong((id *)&self->_useRTTButton, 0);
  objc_storeStrong((id *)&self->_screeningBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_screeningViewController, 0);
  objc_storeStrong((id *)&self->_trailingSideLayoutGuide, 0);
  objc_storeStrong((id *)&self->_leadingSideLayoutGuide, 0);
  objc_storeStrong((id *)&self->_participantsViewVerticalPosterNameTopConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_callWaitingLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_callWaitingParticipantsViewController, 0);
  objc_storeStrong((id *)&self->_screeningPosterNameViewModel, 0);
  objc_storeStrong((id *)&self->_keypadPosterNameViewModel, 0);
  objc_storeStrong((id *)&self->_posterNameViewModel, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_declineCallService, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorLayoutGuide, 0);
  objc_storeStrong((id *)&self->_callRecordingLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_callRecordingPillViewController, 0);
  objc_storeStrong((id *)&self->_callRecordingButtonViewController, 0);
  objc_storeStrong((id *)&self->_ambientAudioRoutesControlView, 0);
  objc_storeStrong((id *)&self->_callDetailsViewButton, 0);
  objc_storeStrong((id *)&self->_emergencyPhotoPickerGrabberView, 0);
  objc_storeStrong((id *)&self->_keypadViewController, 0);
  objc_storeStrong((id *)&self->_callParticipantsViewController, 0);
  objc_storeStrong((id *)&self->_buttonsViewController, 0);
  objc_destroyWeak((id *)&self->_prioritizedCall);
  objc_storeStrong((id *)&self->_imNicknameProvider, 0);
  objc_storeStrong((id *)&self->_callUUIDsThatPresentedSNaPHUD, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_enhancedEmergencyIntermittentStateScrollView, 0);
  objc_storeStrong((id *)&self->_enhancedEmergencySecondaryLabel, 0);

  objc_storeStrong((id *)&self->_enhancedEmergencyIntermittentStateLabel, 0);
}

- (id)makeLockObserverWithHandler:(id)a3
{
  unsigned int v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  PHAudioCallViewController.makeLockObserver(with:)((uint64_t)sub_100138B58, v5);

  swift_release();
  sub_10012CB98(v9, v9[3]);
  BOOL v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_100129FFC((uint64_t)v9);

  return v7;
}

- (id)makeCallDetailsCoordinatorWithBannerPresentationManager:(id)a3 existingCoordinator:(id)a4 deferredPresentationManager:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  unsigned int v8 = self;
  id v9 = PHAudioCallViewController.makeCallDetailsCoordinator(bannerPresentationManager:existingCoordinator:deferredPresentationManager:)((uint64_t)v7, (uint64_t)a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v9;
}

- (id)makeHeldCallControlsViewWithCallCenter:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  unsigned int v8 = (void *)PHAudioCallViewController.makeHeldCallControls(callCenter:style:)(v6, a4);

  return v8;
}

- (void)showNameAndPhotoHUDIfNecessaryWithBannerPresentationManager:(id)a3 callCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  sub_10012F904();
}

- (void)presentShareCard:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  sub_100130470((uint64_t)v6);
}

- (id)currentIMNicknameMatchingContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (void *)sub_100130D04();

  return v6;
}

- (BOOL)hasLastSeenPosterForCall:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = self;
  LOBYTE(v3) = sub_100130F58(v3);

  return v3 & 1;
}

- (BOOL)lastSeenPosterDataIsSensitiveForCall:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = self;
  LOBYTE(v3) = sub_100131110(v3);

  return v3 & 1;
}

- (id)readCachedLastSeenPosterDataForCall:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = sub_10013120C(a3);
  unint64_t v8 = v7;

  if (v8 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1001389EC(v6, v8);
  }

  return isa;
}

- (id)lastSeenPosterIMWallpaperMetadataForCall:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  unint64_t v7 = sub_1001315F8(a3);

  return v7;
}

+ (BOOL)posterSourceIsSyncedWithContacts:(unint64_t)a3
{
  return sub_1001317AC(a3);
}

- (unint64_t)suggestedNewPosterSourceAfterCallConnects:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  unint64_t v7 = sub_1001317DC(a3);

  return v7;
}

- (BOOL)prefersShowingCachedLastSeenPosterBeforeCallConnected:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  uint64_t v6 = self;
  LOBYTE(v3) = sub_100131EE4(v3);

  return v3 & 1;
}

- (void)writeToLastSeenPosterCacheIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001322F0();
}

- (void)deleteAllUnarchivedPosterDirectories
{
  id v2 = self;
  sub_1001345D8();
}

- (TUCall)callToUseForWallpaper
{
  id v2 = self;
  id v3 = sub_1001351A4();

  return (TUCall *)v3;
}

- (BOOL)hasNoCallsOrOnlyEndedCalls
{
  id v2 = self;
  char v3 = sub_100135AE4();

  return v3 & 1;
}

- (void)blockWithHandle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10013681C(v4);
}

- (void)reportWithCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100136BD4(v4);
}

- (void)createContactWithHandle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100136E64(v4);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  PHAudioCallViewController.contactViewController(_:didCompleteWith:)((CNContactViewController)v8, v10);
}

- (BOOL)shouldUpdateBackgroundForEmergencyCall
{
  id v2 = self;
  sub_100137700();
  char v4 = v3;

  return v4 & 1;
}

- (void)updateBackgroundForEmergencyCall
{
  id v2 = self;
  sub_1001378D8();
}

- (void)updateCallRecordingIfNeeded
{
  id v2 = self;
  PHAudioCallViewController.updateCallRecordingIfNeeded()();
}

- (BOOL)conditions
{
  id v2 = self;
  char v3 = sub_10013C6BC();

  return v3 & 1;
}

- (void)invertColorCallRecordingButtonColor:(BOOL)a3
{
  char v4 = self;
  PHAudioCallViewController.invertColorCallRecordingButtonColor(_:)(a3);
}

- (void)addCallRecordingIfNeeded
{
  id v2 = self;
  sub_10013CA38();
}

- (void)addRecordingIndicator
{
  id v2 = self;
  sub_10013CB14();
}

- (void)addButton
{
  id v2 = self;
  sub_10013D638();
}

- (void)updateCallRecordingPositionIfNeeded
{
  id v2 = self;
  PHAudioCallViewController.updateCallRecordingPositionIfNeeded()();
}

- (void)updateCallRecordingViewBackgroundMaterialType:(unint64_t)a3
{
  char v4 = self;
  PHAudioCallViewController.updateCallRecordingViewBackgroundMaterialType(_:)(a3);
}

- (void)startTracking
{
  id v2 = self;
  sub_10018A01C((uint64_t (*)(uint64_t))&ObjectTracker.Tracker.startTracking(object:));
}

- (void)stopTracking
{
  id v2 = self;
  sub_10018A01C((uint64_t (*)(uint64_t))&ObjectTracker.Tracker.stopTracking(object:));
}

- (void)addWebRTCViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018CCD8();
}

- (void)removeWebRTCViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018D61C();
}

- (void)requestToEnableVideoStreamingButton
{
  id v2 = self;
  sub_10018D890();
}

- (void)requestToDisableVideoStreamingButton
{
  id v2 = self;
  sub_10018DA64((SEL *)&selRef_setShouldEnableVideoStreamingButton_, 0);
}

- (void)requestToEnableMediaUploadButton
{
  id v2 = self;
  sub_10018DA64((SEL *)&selRef_setShouldEnableShareMediaButton_, 1);
}

- (void)requestToDisableMediaUploadButton
{
  id v2 = self;
  sub_10018DA64((SEL *)&selRef_setShouldEnableShareMediaButton_, 0);
}

- (void)hideWebRTCViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018DB80();
}

- (void)removeWebRTCViewControllerForPIP:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018DD6C(v4);
}

- (void)addMediaRequestViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018DF24();
}

- (void)removeMediaRequestViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018E4A0();
}

- (void)insertWebViewUnderButtonControls:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018E6A0();
}

- (void)bringWebRTCViewControllerToFront:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10018ECFC(v4);
}

- (void)requestAnimationToFullScreenWebView
{
  id v2 = self;
  sub_10018EEB4();
}

- (void)requestToRemoveEnhancedEmergencyIntermittentStateLabel
{
  id v2 = self;
  sub_10018F120();
}

- (void)requestToPresentMediaUploadRequestBanner
{
  id v2 = self;
  sub_10018F5F0("EnhancedEmergency: PHAudioCallViewController trying to request mediaUploadRequest banner", (void (*)(void))&BannerPresentationManager.showEnhancedEmergenctMediaUploadHUD(), (void (*)(void))&BannerPresentationManager.showEnhancedEmergencyRTTMediaUploadHUD());
}

- (void)requestToPresentMediaUploadRequestBannerDuringStreaming
{
  id v2 = self;
  sub_10018F2D8();
}

- (void)requestHapticForRequest
{
  id v2 = self;
  sub_10018F534();
}

- (void)requestToPresentVideoStreamingRequestBanner
{
  id v2 = self;
  sub_10018F5F0("EnhancedEmergency: PHAudioCallViewController trying to request videoStreaming banner", (void (*)(void))&BannerPresentationManager.showEnhancedEmergenctVideoStreamingHUD(), (void (*)(void))&BannerPresentationManager.showEnhancedEmergencyRTTVideoStreamingHUD());
}

- (void)requestToAddErrorLabelWithRetryable:(BOOL)a3
{
  char v3 = self;
  sub_10018F968();
}

- (void)requestToAddResumeCameraLabel
{
  id v2 = self;
  sub_10018F9CC();
}

- (void)requestToAddMitigationLabel
{
  id v2 = self;
  sub_10018FDD4(2, (uint64_t)&unk_1002D3B48, (uint64_t)sub_100191E70, (uint64_t)&unk_1002D3B60);
}

- (void)requestToAddPhotoMitigationLabel
{
  id v2 = self;
  sub_10018FDD4(3, (uint64_t)&unk_1002D3AF8, (uint64_t)sub_100191F40, (uint64_t)&unk_1002D3B10);
}

- (void)updateEnhancedEmergencyViewWhenKeypadPresented
{
  id v2 = self;
  sub_100190130();
}

- (void)addEnhancedEmergencyIntermittentStateLabelWithState:(int64_t)a3
{
  id v4 = self;
  sub_100190254((char **)a3);
}

- (void)removeEnhancedEmergencyIntermittentStateLabel
{
  id v2 = self;
  sub_1001914C0();
}

- (void)showCallControls
{
  id v2 = self;
  sub_10019160C();
}

- (void)hideCallControls
{
  id v2 = self;
  sub_1001917DC();
}

- (id)getCurrentCall
{
  id v2 = self;
  id v3 = sub_100191A8C();

  return v3;
}

- (void)showRTTConversation
{
  id v2 = self;
  sub_100191B08();
}

- (void)hideRTTConversationIfNeeded
{
  id v2 = self;
  sub_100191C20();
}

- (id)getAudioRouteMenu
{
  id v2 = self;
  id v3 = sub_100191D58();

  return v3;
}

@end