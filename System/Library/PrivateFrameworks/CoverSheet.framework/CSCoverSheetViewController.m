@interface CSCoverSheetViewController
- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext;
- (ACActivityCenter)activityCenter;
- (BOOL)_batteryCollection:(id)a3 containsDeviceWithIdentifier:(id)a4;
- (BOOL)_canPresentSwipeDismissableModal;
- (BOOL)_canShowEmbeddedRemoteContent;
- (BOOL)_canShowWhileLocked;
- (BOOL)_containsCachedBatteryDeviceWithIdenfifier:(id)a3;
- (BOOL)_gestureRecognizer:(id)a3 isLocatedOverHorizontalContentRegionInViewController:(id)a4;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleEventType:(int64_t)a3;
- (BOOL)_isAccessoryAnimationAllowedForAccessory:(id)a3;
- (BOOL)_isComplicationContainerVisible;
- (BOOL)_isFakeStatusBarEnabled;
- (BOOL)_isKnownTransitionConflictFrom:(id)a3 to:(id)a4;
- (BOOL)_isMainPageShowing;
- (BOOL)_isPageContentHidden;
- (BOOL)_isPresentingDismissableRemoteContent;
- (BOOL)_isPresentingModalRemoteContent;
- (BOOL)_isPresentingModalViewControllerWithIdentifier:(id)a3;
- (BOOL)_isPresentingPosterSwitcher;
- (BOOL)_isRemoteContentPresentedInUnlockMode;
- (BOOL)_isShowingChargingModal;
- (BOOL)_isShowingInlineContent;
- (BOOL)_isSlideableContentOffsetOnscreen:(CGPoint)a3;
- (BOOL)_isSlideableContentOnscreen;
- (BOOL)_isSourceForHorizontalScrolling:(id)a3;
- (BOOL)_isSpotlightBehaviorRestricted;
- (BOOL)_isTodayViewOverlayShowing;
- (BOOL)_isWakeAnimationInProgress;
- (BOOL)_overSlidingControlForLocation:(CGPoint)a3 inView:(id)a4;
- (BOOL)_quickActionButtonInterpretsLocation:(CGPoint)a3 asBesideContentForGestureView:(id)a4;
- (BOOL)_quickActionsSupported;
- (BOOL)_removeRemoteViewControllerForInvalidatedSession:(id)a3 completion:(id)a4;
- (BOOL)_shouldLoadComplications;
- (BOOL)_shouldReduceWhitePoint;
- (BOOL)_shouldReduceWhitePointForAppearance:(id)a3;
- (BOOL)_shouldSetUpWallpaperGesture;
- (BOOL)_shouldUpdateActiveAppearanceForReason:(id)a3;
- (BOOL)_showingAccessoryView;
- (BOOL)_transitionPrototypeChargingViewToVisible:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)_wallpaperGestureShouldRequireUserPresence;
- (BOOL)_wouldUpdateActiveAppearance;
- (BOOL)attachedAccessoriesContainsAccessoryType:(int64_t)a3;
- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3;
- (BOOL)canHostAnApp;
- (BOOL)containsCenteredDateTimeLayout;
- (BOOL)contentOccludesBackground;
- (BOOL)controller:(id)a3 shouldAllowPanScrollingWithSystemGestureRecognizer:(id)a4;
- (BOOL)didDetectBottomFaceOcclusionsSinceScreenOn;
- (BOOL)didDetectFaceOcclusionsSinceScreenOn;
- (BOOL)didDetectFaceRequirementsForPAU;
- (BOOL)didDismissSinceScreenOn;
- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3;
- (BOOL)dismissed;
- (BOOL)externalLockProvidersRequireUnlock;
- (BOOL)externalLockProvidersShowPasscode;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasContentAboveCoverSheet;
- (BOOL)hasPresentedForInterstitialTransitionSource;
- (BOOL)hasVisibleContentToReveal;
- (BOOL)hidesDimmingLayer;
- (BOOL)interceptDismissalGestureForOverlayController:(id)a3;
- (BOOL)irisPlayerIsInteracting;
- (BOOL)isAccessoryAnimationPresenting;
- (BOOL)isAlternateDateEnabled;
- (BOOL)isAuthenticated;
- (BOOL)isDepthEffectEnabled;
- (BOOL)isFloatingLayerFullscreen;
- (BOOL)isHostingAnApp;
- (BOOL)isInScreenOffMode;
- (BOOL)isInlinePasscodeLockVisible;
- (BOOL)isInteractingWithNotificationList;
- (BOOL)isLockScreenShowingDefaultContent;
- (BOOL)isLockScreenShowingDefaultContentExceptControlCenter;
- (BOOL)isMainPageVisible;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BOOL)isPasscodeLockVisible;
- (BOOL)isPresentingNotificationInLongLook;
- (BOOL)isRestToOpenAvailable;
- (BOOL)isShowingMediaControls;
- (BOOL)isShowingModalView;
- (BOOL)isShowingTodayView;
- (BOOL)isTouchLocation:(CGPoint)a3 inRestrictedRectForGestureView:(id)a4;
- (BOOL)isTransitioning;
- (BOOL)isTransitioningInteractively;
- (BOOL)isUnlockDisabled;
- (BOOL)lockOrientationWhileTransitioning;
- (BOOL)partiallyOnScreen;
- (BOOL)passcodeViewControllerShouldHideStatusBar:(id)a3;
- (BOOL)phoneUnlockWithWatchControllerShowRawErrorCodes:(id)a3;
- (BOOL)phoneUnlockWithWatchEnabled;
- (BOOL)preventsLaunchFromWidgetWithAction:(id)a3;
- (BOOL)proudLockViewControllerIsCoverSheetVisible;
- (BOOL)remoteContentSession:(id)a3 dismissWithReason:(int64_t)a4 completion:(id)a5;
- (BOOL)remoteContentSession:(id)a3 presentViewController:(id)a4;
- (BOOL)searchGestureShouldRecognize:(id)a3;
- (BOOL)sendAppearanceTransitionForChildViewControllers;
- (BOOL)shouldActivateRemoteContentSession:(id)a3;
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutorotate;
- (BOOL)shouldCompletePhoneAutoUnlockWithNotification;
- (BOOL)shouldDisableALS;
- (BOOL)shouldModifyPageScrolling;
- (BOOL)shouldPresentOrDismissCoverSheetSpotlight;
- (BOOL)shouldShowLockStatusBarTime;
- (BOOL)shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes;
- (BOOL)shouldUnlockUIOnKeyDownEvent;
- (BOOL)spotlightPresenterAllowsPullToSearch:(id)a3;
- (BOOL)suppressesBanners;
- (BOOL)suppressesControlCenter;
- (BOOL)suppressesScreenshots;
- (BOOL)userPresenceDetectedSinceWake;
- (BOOL)widgetGridViewControllerShouldPreventLaunchFromWidget:(id)a3;
- (BOOL)willUIUnlockFromSource:(int)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (BSInvalidatable)suspendWallpaperAnimationAssertion;
- (BSUIVibrancyConfiguration)effectiveVibrancyConfiguration;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (BSUIVibrancyConfiguration)vibrancyConfigurationOverride;
- (CAFrameRateRange)presentationPreferredFrameRateRange;
- (CGPoint)_slideableContentOffset;
- (CSAppearance)activeAppearance;
- (CSAppearance)localAppearance;
- (CSAppearance)previousAppearance;
- (CSApplicationLaunching)applicationLauncher;
- (CSBehavior)activeBehavior;
- (CSBehavior)irisBehavior;
- (CSBehavior)localBehavior;
- (CSCameraPrewarming)cameraPrewarmer;
- (CSCoverSheetContextProviding)coverSheetContext;
- (CSCoverSheetSpotlightPresenting)coverSheetSpotlightPresenter;
- (CSCoverSheetViewController)initWithPageViewControllers:(id)a3 mainPageContentViewController:(id)a4 context:(id)a5;
- (CSCoverSheetViewControllerDelegate)delegate;
- (CSCoverSheetViewPresenting)presenter;
- (CSCoverSheetViewTransitionSource)currentTransitionSource;
- (CSEmergencyCalling)emergencyCaller;
- (CSIdleTimerControlling)idleTimerController;
- (CSInlineWidgetContainerViewController)inlineComplicationContainerViewController;
- (CSInlineWidgetContainerViewController)landscapeInlineComplicationContainerViewController;
- (CSInterstitialTransitionSource)interstitialTransitionSource;
- (CSLayoutStrategy)layoutStrategy;
- (CSLegibilityProviding)legibilityProvider;
- (CSMagSafeAccessoryStatusObserver)accessoryAttachmentObserver;
- (CSMainPageContentViewController)mainPageContentViewController;
- (CSModalPresentationViewController)modalPresentationController;
- (CSNotificationDispatcher)dispatcher;
- (CSOrientationUpdateControlling)orientationUpdateController;
- (CSPosterSwitcherActivationManager)posterSwitcherActivationManager;
- (CSPosterSwitcherTransitionSource)posterSwitcherTransitionSource;
- (CSPosterSwitcherViewController)posterSwitcherViewController;
- (CSPowerChangeObserver)powerChangeObserver;
- (CSPresentation)activePresentation;
- (CSPresentation)externalPresentation;
- (CSQuickActionsConfiguration)quickActionsConfiguration;
- (CSTimerViewController)timerViewController;
- (CSWallpaperColorProvider)wallpaperColorProvider;
- (CSWidgetGridViewController)complicationContainerViewController;
- (CSWidgetGridViewController)sidebarComplicationContainerViewController;
- (CSWidgetURLHandling)widgetURLHandler;
- (NSArray)_allowedPageViewControllers;
- (NSArray)pageViewControllers;
- (NSArray)presentationRegions;
- (NSMutableSet)pendingModalViewControllers;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (NSString)coverSheetIdentifier;
- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer;
- (SBFLockOutStatusProvider)_lockOutController;
- (SBFLockScreenActionContext)_customLockScreenActionContext;
- (SBFLockScreenDateViewController)dateViewController;
- (SBFOverlayControlling)overlayController;
- (SBFScreenWakeAnimationControlling)_screenWakeAnimationController;
- (SBFScreenWakeAnimationTarget)legacyWallpaperWakeAnimator;
- (SBNotificationDestination)notificationDestination;
- (SBSWidgetMetricsProviding)widgetMetricsProvider;
- (SBSearchGesture)searchGesture;
- (SBSpotlightTransientOverlayInteractiveGestureTransaction)spotlightInteractiveGestureTransaction;
- (SBWallpaperAggdLogger)wallpaperAggdLogger;
- (UIGestureRecognizer)wallpaperGestureRecognizer;
- (UIStatusBar)fakeStatusBar;
- (UIView)statusBarBackgroundView;
- (double)_dateTimeAlphaForFade;
- (double)_dateTimeInsetXForPage:(id)a3;
- (double)_dateViewAlphaForCurrentWakeState;
- (double)_listInsetXForPage:(id)a3;
- (double)_minDateListSpacingForPage:(id)a3;
- (double)_timeLabelScrollPercentForDateTimeLayout:(unint64_t)a3;
- (double)backlightLevel;
- (double)bottomContentInset;
- (double)dateBaselineToComplicationY;
- (double)dateTimeMostExtremeLeadingX;
- (double)dateTimeMostExtremeTrailingX;
- (double)dateTimeSubtitleMaximumWidth;
- (double)focusActivityHeight;
- (double)initialOverlayPresentationProgress;
- (double)listMinY;
- (double)prominentBaselineToListY;
- (double)remoteContentComplicationHeightInset;
- (double)timeLabelBaselineY;
- (double)timeLabelOffsetForScrollPercent:(double)a3;
- (double)timeToSubtitleLabelBaselineDifferenceY;
- (double)windowedAccessoryInset;
- (id)__currentDesiredAppearanceWithStartIndex:(unint64_t *)a3 targetIndex:(unint64_t *)a4 targetAppearance:(id *)a5 targetPresentation:(id *)a6 modalAppearance:(id *)a7 proudLockAppearance:(id *)a8 poseidonAppearance:(id *)a9;
- (id)_activeRemoteContentAssertion;
- (id)_activeViewControllers;
- (id)_appearanceForParticipant:(id)a3;
- (id)_averageLockScreenWallpaperColor;
- (id)_batteryCenterInternalBattery;
- (id)_behaviorForParticipant:(id)a3;
- (id)_chargingInfo;
- (id)_coachingStringToUse;
- (id)_connectedExternalChargers;
- (id)_createFakeStatusBar;
- (id)_eligiblePageViewControllers;
- (id)_fakeStatusBarSettings;
- (id)_filterValuesForWhitePointReduced:(BOOL)a3 lighterReduction:(BOOL)a4;
- (id)_fullscreeNotificationViewControllerMatchingNotificationRequest:(id)a3;
- (id)_hostedRemoteContentViewController;
- (id)_overrideDate;
- (id)_pageForScrollPercent:(double)a3;
- (id)_passcodeViewController;
- (id)_presentationForParticipant:(id)a3;
- (id)_presentedModalViewControllerWithIdentifier:(id)a3;
- (id)_validatedComplicationDescriptorForDescriptor:(id)a3;
- (id)_whitePointReductionFilterFromValues:(id)a3;
- (id)_whitePointValues;
- (id)_whitePointValuesForAppearance:(id)a3;
- (id)_windowsFromViewControllers:(id)a3;
- (id)activityPickerViewControllerTransitionContainerView:(id)a3;
- (id)bestIconViewForApplicationBundleIdentifier:(id)a3;
- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress;
- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3;
- (id)dateView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayConfigurationForSpotlightPresenter:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)overlayControllerIfExists;
- (id)pageViewControllerAtIndex:(unint64_t)a3;
- (id)posterSwitcherPresentationStatus;
- (id)sceneHostEnvironmentEntriesForBacklightSession;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)transientSubtitleText;
- (id)visiblePageViewController;
- (int)wakeSource;
- (int64_t)_passcodePresentationMode;
- (int64_t)backlightLuminance;
- (int64_t)effectiveInterfaceOrientation;
- (int64_t)effectiveInterfaceOrientationOverride;
- (int64_t)participantState;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)presentationAltitude;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationTransition;
- (int64_t)presentationType;
- (int64_t)statusBarStyle;
- (unint64_t)_accessoryAnimationRestrictions;
- (unint64_t)_dateTimeLayoutForPage:(id)a3;
- (unint64_t)_indexOfCameraPage;
- (unint64_t)_indexOfMainPage;
- (unint64_t)_indexOfPageViewControllerForRole:(id)a3;
- (unint64_t)_indexOfTodayPage;
- (unint64_t)_lastSettledPageIndex;
- (unint64_t)_pageCapabilities;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)visibleNotificationCount;
- (unsigned)presentationFrameRateRangeReason;
- (void):(id)a3 withTransition:(int)a4 completion:(id)a5;
- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 actions:(id)a5 completion:(id)a6;
- (void)_actuallyUpdateUIForIrisNotPlaying;
- (void)_actuallyUpdateUIForIrisPlaying;
- (void)_actuallyUpdateUIForIrisPlaying:(BOOL)a3;
- (void)_addBackgroundContentOccludingViewsForAppearance:(id)a3;
- (void)_addBackgroundContentViewControllerForAction:(id)a3;
- (void)_addBedtimeGreetingBackgroundView;
- (void)_addOrRemoveBlockedViewIfNecessaryAnimated:(BOOL)a3;
- (void)_addOrRemoveRemoteContentViewIfNecessary;
- (void)_addOrRemoveRemoteContentViewIfNecessaryMaintainingState:(BOOL)a3;
- (void)_addOrRemoveResetRestoreViewIfNecessaryAnimated:(BOOL)a3;
- (void)_addOrRemoveThermalTrapViewIfNecessaryAnimated:(BOOL)a3;
- (void)_addRemoteViewControllerForAction:(id)a3;
- (void)_addStateCaptureHandlers;
- (void)_addVisiblePageViewController:(id)a3;
- (void)_addWhitePointAnimationForKeyPath:(id)a3 onLayer:(id)a4 toValues:(id)a5 withDuration:(double)a6 dispatchGroup:(id)a7;
- (void)_animateAccessory:(id)a3 toVisibleAnimated:(BOOL)a4;
- (void)_animateView:(id)a3 toWhitePointReduced:(BOOL)a4 withDuration:(double)a5 withDispatchGroup:(id)a6;
- (void)_beginAppearanceTransitionForPageViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_calculateAppearanceForCurrentOrientation;
- (void)_cleanupPosterSwitcherPresentationForCompleted:(BOOL)a3 withActivatingTouches:(id)a4;
- (void)_cleanupStaleRemoteContentWithCompletion:(id)a3;
- (void)_clearChargingModalStateIfNecessary;
- (void)_complicationSelected:(id)a3;
- (void)_createStatusBarBackgroundViewIfNeeded;
- (void)_dismissAccessoryViewController:(id)a3 animated:(BOOL)a4;
- (void)_dismissAllModalViewControllersExcept:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_dismissHostingModalsAnimated:(BOOL)a3 completion:(id)a4;
- (void)_dismissInlineContentOnSignificantScroll;
- (void)_dismissModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_dismissModalViewControllersWithIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_dismissPosterSwitcherViewController;
- (void)_dismissRemoteViewControllerForReason:(int64_t)a3;
- (void)_dismissRemoteViewControllerForReason:(int64_t)a3 completion:(id)a4;
- (void)_dismissToMainPageFromPageViewController:(id)a3;
- (void)_displayDidDisappearImplementation;
- (void)_displayWillAppearImplementation;
- (void)_displayWillDisappearImplementation;
- (void)_displayWillTurnOnWhileOnCoverSheet:(id)a3;
- (void)_endAppearanceTransitionForPageViewControllersToVisible:(BOOL)a3;
- (void)_finishFadeInAnimationForPowerSource:(int)a3 connectedToPower:(BOOL)a4 screenOn:(BOOL)a5;
- (void)_handleAddedAction;
- (void)_handleDismissalForAccessoryViewController:(id)a3 animated:(BOOL)a4;
- (void)_handlePosterSwitcherActivation:(id)a3;
- (void)_handleQuickNoteLaunch:(id)a3;
- (void)_invalidateStatusBarAssertions;
- (void)_liftToWakeGestureDetected;
- (void)_listenForDisplayLayoutChanges:(BOOL)a3;
- (void)_loadViewsForRestrictedPagesIfPossible;
- (void)_managedConfigurationEffectiveSettingsDidChange:(id)a3;
- (void)_migrateNotificationsToHistory;
- (void)_overrideNotificationDisplayStyleForInlineContent;
- (void)_overrideNotificationDisplayStyleWithRemotePreference:(int64_t)a3;
- (void)_performLocalAppearanceUpdatesWithReason:(id)a3 updates:(id)a4;
- (void)_powerStatusChangedToConnectedState:(BOOL)a3;
- (void)_preferredContentSizeDidChange;
- (void)_prepareForPosterSwitcherPresentation;
- (void)_prepareForViewWillAppearIfNecessary;
- (void)_presentInlineViewController:(id)a3;
- (void)_presentModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentModalViewController:(id)a3 shouldDismissOverlays:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_removeAllowedPageViewController:(id)a3;
- (void)_removeBackgroundContentOccludingViewsForAppearance:(id)a3;
- (void)_removeBackgroundContentViewController;
- (void)_removeBedtimeGreetingBackgroundViewAnimated:(BOOL)a3;
- (void)_removeReduceWhitePointAnimationForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_scrollPanGestureBegan:(id)a3;
- (void)_scrollPanGestureChanged:(id)a3;
- (void)_scrollPanGestureEnded:(id)a3;
- (void)_sendAuthenticationChangedEvent;
- (void)_setAllowedPageViewControllers:(id)a3;
- (void)_setAppearanceForLandscape:(BOOL)a3;
- (void)_setDidDismissSinceScreenOn:(BOOL)a3;
- (void)_setDismissed:(BOOL)a3;
- (void)_setFakeStatusBarEnabled:(BOOL)a3;
- (void)_setHasContentAboveCoverSheet:(BOOL)a3;
- (void)_setHasContentAboveCoverSheet:(BOOL)a3 isSignificantUserInteraction:(BOOL)a4;
- (void)_setLastSettledPageIndex:(unint64_t)a3;
- (void)_setLockOrientationWhileTransitioning:(BOOL)a3;
- (void)_setLockOutController:(id)a3;
- (void)_setMainPageContentViewController:(id)a3;
- (void)_setModalPresentationControllerVisibility:(BOOL)a3;
- (void)_setModalPresentationControllerVisibility:(BOOL)a3 cancelTouches:(BOOL)a4;
- (void)_setPageViewControllers:(id)a3;
- (void)_setScreenWakeAnimationController:(id)a3;
- (void)_setSuppressChargingUIForAmbient:(BOOL)a3;
- (void)_setupBackgroundContentGestureRecognizer;
- (void)_setupComplicationSelectionGestureRecognizer;
- (void)_setupPosterSwitcherGestureRecognizer;
- (void)_setupQuickNoteGestureRecognizer;
- (void)_setupSearchGesture;
- (void)_setupWallpaperGesture;
- (void)_showChargingSubtitleWithTimeout:(double)a3;
- (void)_startFadeInAnimationForSource:(int64_t)a3;
- (void)_transitionAccessoryChargingViewToVisible:(BOOL)a3;
- (void)_transitionAccessoryViewToVisible:(BOOL)a3 accessory:(id)a4 animated:(BOOL)a5;
- (void)_transitionChargingDateSubtitleToVisible:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)_transitionChargingViewToVisible:(BOOL)a3 showBattery:(BOOL)a4 animated:(BOOL)a5;
- (void)_transitionChargingViewToVisible:(BOOL)a3 suppressedByPack:(BOOL)a4 showBattery:(BOOL)a5 animated:(BOOL)a6;
- (void)_transitionTimerViewToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateAccessibilityContentSizesIfNeeded;
- (void)_updateAccessoryAnimationPresenting:(BOOL)a3 userInteractionDisabled:(BOOL)a4;
- (void)_updateActiveAppearanceForReason:(id)a3;
- (void)_updateActiveBehaviorsForReason:(id)a3;
- (void)_updateActiveBehaviorsForReason:(id)a3 updatingAppearanceIfNeeded:(BOOL)a4;
- (void)_updateAppearance:(id)a3 forComponentType:(int64_t)a4 shouldHide:(BOOL)a5;
- (void)_updateAppearanceForAODTransitionToInactive:(BOOL)a3;
- (void)_updateAppearanceForTransitionToOrientation:(int64_t)a3;
- (void)_updateBackground;
- (void)_updateBackgroundContentView;
- (void)_updateCaptureButtonRestriction;
- (void)_updateCoachingString;
- (void)_updateCoachingStringWithTimeout:(double)a3;
- (void)_updateComplicationSidebar;
- (void)_updateComplicationsContainerView;
- (void)_updateContent;
- (void)_updateControlCenterGrabber;
- (void)_updateDateSubtitleAppearanceForBattery:(BOOL)a3 animated:(BOOL)a4 chargingVisible:(BOOL)a5;
- (void)_updateDateTimeView;
- (void)_updateDimmingLayer;
- (void)_updateFixedFooterView;
- (void)_updateForegroundView;
- (void)_updateFullBleedContent;
- (void)_updateHomeAffordance;
- (void)_updateIdleTimerBehavior;
- (void)_updateIdleTimerForTransitionProgress:(double)a3;
- (void)_updateLegibilitySettings;
- (void)_updateLocalAppearanceForPresentation;
- (void)_updateLocalAppearanceForRequester:(id)a3 animationSettings:(id)a4 actions:(id)a5 completion:(id)a6;
- (void)_updateModalContent;
- (void)_updateModalPresentationControllerVisibility;
- (void)_updateNotificationClearingTriggerForEvent:(id)a3;
- (void)_updateOverrideDateIfNeeded;
- (void)_updatePageContent;
- (void)_updatePoseidon;
- (void)_updatePosterSwitcherBackgroundView;
- (void)_updatePosterSwitcherComplicationRowHidden;
- (void)_updatePosterSwitcherPresentationWithProgress:(double)a3;
- (void)_updateProudLockView;
- (void)_updateProudLockViewUpdateSuspension;
- (void)_updateQuickActions;
- (void)_updateRemoteInlineContentView;
- (void)_updateRestrictedBehavior;
- (void)_updateScrollingBehavior;
- (void)_updateStatusBar;
- (void)_updateStatusBarBackground;
- (void)_updateStatusBarGradient;
- (void)_updateTintingView;
- (void)_updateUIForPlaying:(BOOL)a3 immediately:(BOOL)a4;
- (void)_updateVibrancy;
- (void)_updateVisibilityForPageViewControllersWithVisiblePageViewController:(id)a3;
- (void)_updateWallpaper;
- (void)_updateWallpaperEffectView;
- (void)_updateWallpaperFloatingLayerContainerView;
- (void)_updateWhitePoint;
- (void)_validateAndUpdateInlineComplication;
- (void)accessoryAnimationStatusChanged:(BOOL)a3;
- (void)accessoryAttached:(id)a3;
- (void)accessoryDetached:(id)a3;
- (void)actionManager:(id)a3 addedAction:(id)a4;
- (void)actionManager:(id)a3 removedAction:(id)a4;
- (void)activateCameraViewAnimated:(BOOL)a3 sendingActions:(id)a4 completion:(id)a5;
- (void)activateCameraWithHostableEntity:(id)a3 animated:(BOOL)a4 sendingActions:(id)a5 completion:(id)a6;
- (void)activateMainPageWithCompletion:(id)a3;
- (void)activateOverlayWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)activatePage:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)activateTodayViewWithCompletion:(id)a3;
- (void)activityItemsMayHaveChanged;
- (void)addApplicationHoster:(id)a3;
- (void)addCoverSheetObserver:(id)a3;
- (void)addRemoteContentInlineProvidingManager:(id)a3;
- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4;
- (void)ambientPresentationControllerCancelledPossiblePresentation:(id)a3;
- (void)ambientPresentationControllerWillPossiblyPresent:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)attemptPhoneUnlockWithWatch;
- (void)backgroundContentActionManager:(id)a3 addedAction:(id)a4;
- (void)backgroundContentActionManager:(id)a3 removedAction:(id)a4;
- (void)cleanupInterstitialPresentationToPresented:(BOOL)a3 inPlace:(BOOL)a4;
- (void)combinedListViewController:(id)a3 didChangeVisibleBreakthroughContent:(BOOL)a4;
- (void)combinedListViewController:(id)a3 didUpdateVisibleNotificationCount:(unint64_t)a4;
- (void)combinedListViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)completePhoneAutoUnlockWithNotification:(BOOL)a3;
- (void)connectedDevicesDidChange:(id)a3;
- (void)contentRequestCancellingGesture;
- (void)controllerWillCancelHorizontalScrolling:(id)a3;
- (void)coverSheetLegibilityProviderDidUpdate:(id)a3;
- (void)coverSheetNotificationClearingTriggerDidFire:(id)a3;
- (void)deactivateTodayViewWithCompletion:(id)a3;
- (void)dealloc;
- (void)didAddNewActivityItemSceneHostEnvironment;
- (void)didPostNotificationRequest:(id)a3;
- (void)dismissHomeScreenOverlay;
- (void)dismissHostedAppsAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissOverlaysAnimated:(BOOL)a3;
- (void)externalAppearanceProviderBehaviorChanged:(id)a3;
- (void)externalBehaviorProviderBehaviorChanged:(id)a3;
- (void)externalLockProviderStateChanged:(id)a3;
- (void)externalPresentationProviderPresentationChanged:(id)a3;
- (void)fillRestToOpenWithDuration:(double)a3;
- (void)finishUIUnlockFromSource:(int)a3;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)handleAction:(id)a3 fromSender:(id)a4;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)handleReachabilityAnimationDidEnd;
- (void)handleReachabilityAnimationWillBegin;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)idleTimerDidExpire;
- (void)idleTimerDidRefresh;
- (void)idleTimerDidWarn;
- (void)idleTimerWillRefresh;
- (void)invalidateLockScreenActionContext;
- (void)irisWallpaperPlayer:(id)a3 didReplaceGestureRecognizer:(id)a4 withGestureRecognizer:(id)a5;
- (void)irisWallpaperPlayerIsInteractingDidChange:(id)a3;
- (void)irisWallpaperPlayerPlaybackStateDidChange:(id)a3;
- (void)isUnlockDisabled;
- (void)jiggleLockIcon;
- (void)loadView;
- (void)noteDeviceBlockedStatusUpdated;
- (void)noteWillPresentForUserGesture;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3;
- (void)overlayControllerRequestsDismissal:(id)a3;
- (void)passcodeViewControllerDidCancelPasscodeEntry:(id)a3;
- (void)phoneUnlockWithWatchControllerAttemptFailed:(id)a3 withError:(id)a4;
- (void)phoneUnlockWithWatchControllerAttemptSucceeded:(id)a3;
- (void)postNotificationRequest:(id)a3;
- (void)posterSwitcherActivationManager:(id)a3 didChangeToCoachingText:(id)a4;
- (void)prepareForInterstitialPresentation;
- (void)prepareForUIUnlock;
- (void)presentModalViewController:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 animated:(BOOL)a6;
- (void)presentModalViewController:(id)a3 withTransition:(int)a4;
- (void)presentOrDismissCoverSheetSpotlightAnimated:(BOOL)a3;
- (void)presentationViewController:(id)a3 didTransitionViewController:(id)a4 toPresented:(BOOL)a5;
- (void)proudLockDidChangeToCoachingText:(id)a3;
- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
- (void)registerExternalAppearanceProvider:(id)a3;
- (void)registerExternalBehaviorProvider:(id)a3;
- (void)registerExternalEventHandler:(id)a3;
- (void)registerExternalLockProvider:(id)a3;
- (void)registerExternalPresentationProvider:(id)a3;
- (void)remoteContentDidUpdateStyle;
- (void)remoteContentSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)removeApplicationHoster:(id)a3;
- (void)removeCoverSheetObserver:(id)a3;
- (void)removeRemoteContentInlineProvidingManager:(id)a3;
- (void)requestIdleTimerResetForPoster;
- (void)resetMainPageContentOffset;
- (void)resetRestToOpen;
- (void)respondToUIUnlockFromSource:(int)a3;
- (void)screenSleepCompletedForSource:(int)a3;
- (void)scrollPanGestureDidUpdate:(id)a3;
- (void)scrollablePageViewController:(id)a3 scrollViewDidScroll:(id)a4;
- (void)scrollablePageViewController:(id)a3 scrollViewWillBeginDragging:(id)a4;
- (void)scrollablePageViewController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5;
- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4;
- (void)searchGesture:(id)a3 completedShowing:(BOOL)a4;
- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4;
- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4;
- (void)setAccessoryAttachmentObserver:(id)a3;
- (void)setActiveAppearance:(id)a3;
- (void)setActiveBehavior:(id)a3;
- (void)setActivePresentation:(id)a3;
- (void)setActivityCenter:(id)a3;
- (void)setAlternateDateEnabled:(BOOL)a3;
- (void)setApplicationLauncher:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBacklightLevel:(double)a3;
- (void)setCameraPrewarmer:(id)a3;
- (void)setComplicationContainerViewController:(id)a3;
- (void)setCoverSheetIsVisible:(BOOL)a3;
- (void)setCoverSheetSpotlightPresenter:(id)a3;
- (void)setCurrentTransitionSource:(id)a3;
- (void)setCustomLockScreenActionContext:(id)a3;
- (void)setDateViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepthEffectDisabled:(BOOL)a3;
- (void)setDispatcher:(id)a3;
- (void)setEffectiveInterfaceOrientationOverride:(int64_t)a3;
- (void)setEffectiveVibrancyConfiguration:(id)a3;
- (void)setEmergencyCaller:(id)a3;
- (void)setFakeStatusBar:(id)a3;
- (void)setFloatingLayerFullscreen:(BOOL)a3;
- (void)setHasPresentedForInterstitialTransitionSource:(BOOL)a3;
- (void)setHidesDimmingLayer:(BOOL)a3;
- (void)setIdleTimerController:(id)a3;
- (void)setInScreenOffMode:(BOOL)a3;
- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5;
- (void)setInitialOverlayPresentationProgress:(double)a3;
- (void)setInlineComplicationContainerViewController:(id)a3;
- (void)setInterstitialTransitionSource:(id)a3;
- (void)setIrisBehavior:(id)a3;
- (void)setIrisPlayerIsInteracting:(BOOL)a3;
- (void)setIrisWallpaperPlayer:(id)a3;
- (void)setLandscapeInlineComplicationContainerViewController:(id)a3;
- (void)setLayoutStrategy:(id)a3;
- (void)setLegibilityProvider:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLocalAppearance:(id)a3;
- (void)setLocalBehavior:(id)a3;
- (void)setModalPresentationController:(id)a3;
- (void)setOrientationUpdateController:(id)a3;
- (void)setOverlayController:(id)a3;
- (void)setPartiallyOnScreen:(BOOL)a3;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 forceBiometricPresentation:(BOOL)a5 completion:(id)a6;
- (void)setPendingModalViewControllers:(id)a3;
- (void)setPosterSwitcherActivationManager:(id)a3;
- (void)setPosterSwitcherTransitionSource:(id)a3;
- (void)setPosterSwitcherViewController:(id)a3;
- (void)setPowerChangeObserver:(id)a3;
- (void)setPreviousAppearance:(id)a3;
- (void)setQuickActionsConfiguration:(id)a3;
- (void)setRestrictsTouchesForRemoteView:(BOOL)a3;
- (void)setScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setSearchGesture:(id)a3;
- (void)setShouldTransitionIrisWallpaperToStillWhenPlaybackFinishes:(BOOL)a3;
- (void)setShowingMediaControls:(BOOL)a3;
- (void)setSidebarComplicationContainerViewController:(id)a3;
- (void)setSpotlightInteractiveGestureTransaction:(id)a3;
- (void)setStatusBarBackgroundView:(id)a3;
- (void)setSuspendWallpaperAnimationAssertion:(id)a3;
- (void)setTimerViewController:(id)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setVibrancyConfigurationOverride:(id)a3;
- (void)setWallpaperAggdLogger:(id)a3;
- (void)setWallpaperColorProvider:(id)a3;
- (void)setWallpaperGestureRecognizer:(id)a3;
- (void)setWidgetURLHandler:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)spotlightPresenter:(id)a3 dismissDismissableModalViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)spotlightPresenter:(id)a3 presentDismissableModalViewController:(id)a4 completion:(id)a5;
- (void)spotlightPresenterAddContentView:(id)a3;
- (void)spotlightPresenterDidDismissSearch:(id)a3;
- (void)spotlightPresenterDidPresentSearch:(id)a3;
- (void)spotlightPresenterRemoveContentView:(id)a3;
- (void)startLockScreenFadeInAnimationForSource:(int)a3;
- (void)startObservingAmbientPresentationForController:(id)a3;
- (void)startRestToOpenCoachingWithCompletion:(id)a3;
- (void)timerControllerDidStartTimer:(id)a3;
- (void)timerControllerDidStopTimer:(id)a3;
- (void)timerControllerDidUpdateTimer:(id)a3;
- (void)transitionSource:(id)a3 didEndWithContext:(id *)a4;
- (void)transitionSource:(id)a3 didUpdateTransitionWithContext:(id *)a4;
- (void)transitionSource:(id)a3 willBeginWithType:(int64_t)a4;
- (void)unregisterExternalAppearanceProvider:(id)a3;
- (void)unregisterExternalBehaviorProvider:(id)a3;
- (void)unregisterExternalEventHandler:(id)a3;
- (void)unregisterExternalLockProvider:(id)a3;
- (void)unregisterExternalPresentationProvider:(id)a3;
- (void)updateAppearanceForController:(id)a3;
- (void)updateAppearanceForController:(id)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)updateBehaviorForController:(id)a3;
- (void)updateCallToActionForMesaMatchFailure;
- (void)updateFloatingLayerOrdering;
- (void)updateFont:(id)a3 vibrancyConfiguration:(id)a4 numberingSystem:(id)a5 contentStyle:(id)a6;
- (void)updateInterstitialPresentationWithProgress:(double)a3;
- (void)updateLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4;
- (void)updateNotificationRequest:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
- (void)updateQuickActionsVisibility;
- (void)updateScaleViewWithScale:(double)a3 withDuration:(double)a4;
- (void)updateStatusBarForLockScreenComeback;
- (void)updateStatusBarForLockScreenTeardown;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation CSCoverSheetViewController

- (void)updateBehaviorForController:(id)a3
{
  id v4 = a3;
  v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSCoverSheetViewController updateBehaviorForController:]((uint64_t)v4, v5);
  }

  if ([v4 participantState] == 2)
  {
    v6 = [v4 coverSheetIdentifier];
    [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v6];
  }
  else
  {
    v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewController updateBehaviorForController:]();
    }
  }
}

- (void)externalAppearanceProviderBehaviorChanged:(id)a3
{
  id v4 = [a3 coverSheetIdentifier];
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v4];
}

- (void)externalBehaviorProviderBehaviorChanged:(id)a3
{
  id v4 = [a3 coverSheetIdentifier];
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v4];
}

- (void)_updateActiveBehaviorsForReason:(id)a3 updatingAppearanceIfNeeded:(BOOL)a4
{
  BOOL v80 = a4;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CSCoverSheetViewController *)self isViewLoaded]
    && ![(CSCoverSheetViewController *)self isTransitioning]
    && [(CSCoverSheetViewController *)self participantState] == 2)
  {
    id v77 = v5;
    [(CSCoverSheetViewController *)self _updateScrollingBehavior];
    [(CSCoverSheetViewController *)self _updateRestrictedBehavior];
    [(CSCoverSheetViewController *)self _updateIdleTimerBehavior];
    v83 = self;
    v81 = [(CSCoverSheetViewController *)self activeBehavior];
    v82 = +[CSBehavior behavior];
    v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "---------------- [Behavior] Restricted capabilities: starting new ----------------", buf, 2u);
    }

    v79 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:self->_lastSettledPageIndex];
    uint64_t v7 = [v79 participantState];
    int64_t v8 = [(CSPresentationViewController *)self->_modalPresentationController participantState];
    v78 = [(CSCoverSheetViewController *)self _behaviorForParticipant:self->_modalPresentationController];
    if (v7 != 2 || v8 != 2)
    {
      if (v7 == 2 && v8 != 2)
      {
        [v82 unionBehavior:v79];
        v9 = SBLogDashBoard();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromCoverSheetCapability([v79 restrictedCapabilities]);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          id v11 = (id)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: %{public}@ from current page VC: %{public}@", buf, 0x16u);
        }
      }
    }
    else if ([v78 areRestrictedCapabilities:0x8000000])
    {
      v12 = [v79 activeBehavior];
      objc_msgSend(v82, "setRestrictedCapabilities:", objc_msgSend(v12, "restrictedCapabilities"));

      objc_msgSend(v82, "addRestrictedCapabilities:", objc_msgSend(v78, "restrictedCapabilities") - 0x8000000);
    }
    [v82 unionBehavior:self->_irisBehavior];
    v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCoverSheetCapability([(CSBehavior *)self->_irisBehavior restrictedCapabilities]);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: %{public}@ from iris", buf, 0xCu);
    }
    [v82 unionBehavior:self->_localBehavior];
    v15 = SBLogDashBoard();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCoverSheetCapability([(CSBehavior *)self->_localBehavior restrictedCapabilities]);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: %{public}@ from local", buf, 0xCu);
    }
    if (v8 == 2)
    {
      [v82 unionBehavior:v78];
      v17 = [(CSPresentationViewController *)self->_modalPresentationController presentedViewControllers];
      BOOL v18 = [v17 count] == 0;

      v19 = SBLogDashBoard();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          NSStringFromCoverSheetCapability([(CSCoverSheetViewControllerBase *)v83->_modalPresentationController restrictedCapabilities]);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v25;
          _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: %{public}@ from modal", buf, 0xCu);
        }
      }
      else if (v20)
      {
        NSStringFromCoverSheetCapability([(CSCoverSheetViewControllerBase *)v83->_modalPresentationController restrictedCapabilities]);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = [(CSPresentationViewController *)v83->_modalPresentationController presentedViewControllers];
        v23 = [v22 objectAtIndexedSubscript:0];
        id v24 = (id)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: %{public}@ from modal: %{public}@", buf, 0x16u);
      }
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v26 = v83->_externalBehaviorProviders;
    uint64_t v27 = [(NSHashTable *)v26 countByEnumeratingWithState:&v91 objects:v98 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v92 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          v31 = [(CSCoverSheetViewController *)v83 _behaviorForParticipant:v30];
          if (v31)
          {
            [v82 unionBehavior:v31];
            v32 = SBLogDashBoard();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromCoverSheetCapability([v30 restrictedCapabilities]);
              id v33 = (id)objc_claimAutoreleasedReturnValue();
              id v34 = (id)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v33;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v34;
              _os_log_impl(&dword_1D839D000, v32, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: %{public}@ from external provider: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v27 = [(NSHashTable *)v26 countByEnumeratingWithState:&v91 objects:v98 count:16];
      }
      while (v27);
    }

    [(CSCoverSheetViewController *)v83 setActiveBehavior:v82];
    v35 = SBLogDashBoard();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCoverSheetCapability([v82 restrictedCapabilities]);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_1D839D000, v35, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities: setting active - %{public}@", buf, 0xCu);
    }
    -[CSScrollGestureController setScrollingStrategy:](v83->_scrollGestureController, "setScrollingStrategy:", [v82 scrollingStrategy]);
    v37 = [(CSCoverSheetViewController *)v83 coverSheetView];
    v38 = [v37 scrollView];

    if ([v82 scrollingStrategy] == 3 && objc_msgSend(v38, "isScrolling")) {
      [v38 _stopScrollingAndZoomingAnimations];
    }
    uint64_t v39 = [v82 notificationBehavior];
    if (v39 != [v81 notificationBehavior])
    {
      v40 = SBLogDashBoard();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromCoverSheetNotificationBehavior([v81 notificationBehavior]);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromCoverSheetNotificationBehavior([v82 notificationBehavior]);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2114;
        id v97 = v77;
        _os_log_impl(&dword_1D839D000, v40, OS_LOG_TYPE_DEFAULT, "[Behavior] Notification behavior changed from %{public}@ to %{public}@ for reason: %{public}@", buf, 0x20u);
      }
      [(CSNotificationDispatcher *)v83->_notificationDispatcher setActiveBehavior:v82];
    }
    uint64_t v43 = [v82 restrictedCapabilities];
    if (v43 != [v81 restrictedCapabilities])
    {
      v44 = SBLogDashBoard();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromCoverSheetCapability([v81 restrictedCapabilities]);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromCoverSheetCapability([v82 restrictedCapabilities]);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2114;
        id v97 = v77;
        _os_log_impl(&dword_1D839D000, v44, OS_LOG_TYPE_DEFAULT, "[Behavior] Restricted capabilities changed from %{public}@ to %{public}@ for reason: %{public}@", buf, 0x20u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&v83->_delegate);
      int v48 = [v82 areRestrictedCapabilities:8];
      int v49 = [v81 areRestrictedCapabilities:8];
      int v50 = [v82 areRestrictedCapabilities:56];
      int v51 = v50 ^ [v81 areRestrictedCapabilities:56];
      if ((v48 ^ v49 | v51) == 1)
      {
        if ([v82 areRestrictedCapabilities:8]) {
          uint64_t v52 = 1;
        }
        else {
          uint64_t v52 = [v82 areRestrictedCapabilities:56];
        }
        [WeakRetained coverSheetViewController:v83 requestsTouchIDDisabled:v52 forReason:@"CSActiveBehavior"];
      }
      uint64_t v53 = [v82 areRestrictedCapabilities:16];
      if (v53 != [v81 areRestrictedCapabilities:16]) {
        [WeakRetained coverSheetViewController:v83 requestsPreArmDisabled:v53 forReason:@"CSActiveBehavior"];
      }
      uint64_t v54 = [v81 restrictedCapabilities];
      uint64_t v55 = [(CSCoverSheetViewController *)v83 _pageCapabilities];
      uint64_t v56 = [v82 restrictedCapabilities];
      if (([(CSCoverSheetViewController *)v83 _pageCapabilities] & v56) != (v55 & v54)) {
        [(CSCoverSheetViewController *)v83 _loadViewsForRestrictedPagesIfPossible];
      }
      int v57 = [v82 areRestrictedCapabilities:0x2000];
      if (v57 != [v81 areRestrictedCapabilities:0x2000]) {
        [(CSCoverSheetViewController *)v83 _setupQuickNoteGestureRecognizer];
      }
      int v58 = [v82 areRestrictedCapabilities:256];
      if (v58 != [v81 areRestrictedCapabilities:256]) {
        [(CSCoverSheetViewController *)v83 _setupWallpaperGesture];
      }
      int v59 = [v82 areRestrictedCapabilities:0x8000];
      if (v59 != [v81 areRestrictedCapabilities:0x8000]) {
        [(CSCoverSheetViewController *)v83 _updateProudLockViewUpdateSuspension];
      }
      int v60 = [v82 areRestrictedCapabilities:0x800000];
      if (v60 != [v81 areRestrictedCapabilities:0x800000]) {
        [(CSCoverSheetViewController *)v83 _setupPosterSwitcherGestureRecognizer];
      }
      if ([v82 areRestrictedCapabilities:64]
        && ([v81 areRestrictedCapabilities:64] & 1) == 0
        && [(CSCoverSheetViewController *)v83 isShowingTodayView])
      {
        [(CSCoverSheetViewController *)v83 deactivateTodayViewWithCompletion:0];
      }
      int v61 = [v82 areRestrictedCapabilities:0x4000000];
      if (v61 != [v81 areRestrictedCapabilities:0x4000000]) {
        [(CSCoverSheetViewController *)v83 _updateCaptureButtonRestriction];
      }
      if (v80)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v97) = 0;
        id v62 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __89__CSCoverSheetViewController__updateActiveBehaviorsForReason_updatingAppearanceIfNeeded___block_invoke;
        v88[3] = &unk_1E6AD9190;
        v90 = buf;
        id v63 = v62;
        id v89 = v63;
        v64 = (void (**)(void, void))MEMORY[0x1D9487300](v88);
        int v65 = [v82 areRestrictedCapabilities:128];
        if (v65 != [v81 areRestrictedCapabilities:128]) {
          ((void (**)(void, __CFString *))v64)[2](v64, @"Control Center Capability Changed");
        }
        int v66 = [v82 areRestrictedCapabilities:4096];
        if (v66 != [v81 areRestrictedCapabilities:4096]) {
          ((void (**)(void, __CFString *))v64)[2](v64, @"Dismiss CoverSheet Capability Changed");
        }
        if (v51) {
          ((void (**)(void, __CFString *))v64)[2](v64, @"Unlock disabled changed");
        }
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          [(CSCoverSheetViewController *)v83 _updateActiveAppearanceForReason:v63];
        }

        _Block_object_dispose(buf, 8);
      }
    }
    uint64_t v67 = [v82 proximityDetectionMode];
    if (v67 != [v81 proximityDetectionMode])
    {
      v68 = SBLogDashBoard();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromCoverSheetProximityDetectionMode([v81 proximityDetectionMode]);
        id v69 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromCoverSheetProximityDetectionMode([v82 proximityDetectionMode]);
        id v70 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v70;
        *(_WORD *)&buf[22] = 2112;
        id v97 = v77;
        _os_log_impl(&dword_1D839D000, v68, OS_LOG_TYPE_DEFAULT, "[Behavior] Proximity detection mode changed from %@ to %@ for reason: %@", buf, 0x20u);
      }
    }
    if (([v81 isEqual:v82] & 1) == 0)
    {
      v71 = SBLogDashBoard();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v82;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v77;
        _os_log_impl(&dword_1D839D000, v71, OS_LOG_TYPE_DEFAULT, "[Behavior] Aggregate behavior did change: %@ for reason: %@", buf, 0x16u);
      }

      [(CSCoverSheetViewController *)v83 _handleEventType:2];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v72 = (void *)[(NSHashTable *)v83->_observers copy];
      uint64_t v73 = [v72 countByEnumeratingWithState:&v84 objects:v95 count:16];
      if (v73)
      {
        uint64_t v74 = *(void *)v85;
        do
        {
          for (uint64_t j = 0; j != v73; ++j)
          {
            if (*(void *)v85 != v74) {
              objc_enumerationMutation(v72);
            }
            v76 = *(void **)(*((void *)&v84 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v76 coverSheetViewController:v83 didChangeActiveBehavior:v82];
            }
          }
          uint64_t v73 = [v72 countByEnumeratingWithState:&v84 objects:v95 count:16];
        }
        while (v73);
      }
    }
    id v5 = v77;
  }
}

- (int64_t)participantState
{
  return self->_participantState;
}

- (BOOL)isTransitioning
{
  return self->_transitionType != 0;
}

- (void)_updateActiveBehaviorsForReason:(id)a3
{
}

- (void)_updateActiveAppearanceForReason:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if ([(CSCoverSheetViewController *)self _shouldUpdateActiveAppearanceForReason:v4])
  {
    id v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_INFO, "Beginning appearance update for %@... --------", buf, 0xCu);
    }

    uint64_t v101 = 0;
    *(void *)buf = 0;
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    id v96 = 0;
    v6 = [(CSCoverSheetViewController *)self __currentDesiredAppearanceWithStartIndex:buf targetIndex:&v101 targetAppearance:&v100 targetPresentation:&v99 modalAppearance:&v98 proudLockAppearance:&v97 poseidonAppearance:&v96];
    id v7 = v100;
    id v8 = v99;
    id v9 = v98;
    id v10 = v97;
    id v11 = v96;
    if (v6)
    {
      long long v86 = v6;
      id v82 = v8;
      v12 = [(CSCoverSheetViewController *)self previousAppearance];
      v13 = v12;
      id v85 = v9;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [(CSCoverSheetViewController *)self activeAppearance];
      }
      long long v87 = v14;

      v78 = +[CSAppearance appearanceWithIdentifier:@"(active)"];
      currentTransitionSource = self->_currentTransitionSource;
      id v16 = [(CSCoverSheetViewController *)self coverSheetView];
      id v83 = v4;
      id v84 = v7;
      id v80 = v11;
      id v81 = v10;
      BOOL v75 = currentTransitionSource == v16
         || [(CSCoverSheetViewController *)self _isPresentingPosterSwitcher];

      appearanceResolver = self->_appearanceResolver;
      v17 = [(CSCoverSheetViewController *)self activeBehavior];
      uint64_t v19 = v101;
      uint64_t v18 = *(void *)buf;
      unint64_t v20 = [(CSCoverSheetViewController *)self _indexOfMainPage];
      id v21 = self->_currentTransitionSource;
      legibilityProvider = self->_legibilityProvider;
      v23 = [(CSCoverSheetViewController *)self view];
      [v23 bounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v32 = [(CSCoverSheetViewController *)self _whitePointValues];
      LOBYTE(v73) = self->_hasContentAboveCoverSheet;
      v72 = legibilityProvider;
      LOBYTE(v71) = v75;
      id v7 = v84;
      id v33 = -[CSCoverSheetAppearanceResolver newActiveAppearanceGivenDesiredAppearance:oldAppearance:activeAppearance:activeBehavior:startIndex:targetIndex:indexOfMainPage:targetAppearance:modalAppearance:currentTransitionSource:contentTransitionIsAtCoverSheetLevel:legibilityProvider:bounds:whitePointValues:hasContentAboveCoverSheet:](appearanceResolver, "newActiveAppearanceGivenDesiredAppearance:oldAppearance:activeAppearance:activeBehavior:startIndex:targetIndex:indexOfMainPage:targetAppearance:modalAppearance:currentTransitionSource:contentTransitionIsAtCoverSheetLevel:legibilityProvider:bounds:whitePointValues:hasContentAboveCoverSheet:", v86, v87, v78, v17, v18, v19, v25, v27, v29, v31, v20, v84, v85, v21, v71,
              v72,
              v32,
              v73);

      objc_msgSend(v33, "setTransitional:", -[CSCoverSheetViewTransitionSource isTransitioning](self->_currentTransitionSource, "isTransitioning"));
      id v34 = [(CSCoverSheetViewController *)self previousAppearance];
      v35 = v34;
      if (v34)
      {
        id v36 = v34;
      }
      else
      {
        id v36 = [(CSCoverSheetViewController *)self activeAppearance];
      }
      v37 = v36;

      [(CSCoverSheetViewController *)self setActiveAppearance:v33];
      if (([v37 isEqualToAppearance:v33] & 1) == 0)
      {
        v38 = SBLogDashBoard();
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);

        if (v39)
        {
          v40 = (void *)MEMORY[0x1E4F1CA80];
          id v41 = [v37 components];
          id v42 = [v40 setWithSet:v41];

          uint64_t v43 = (void *)MEMORY[0x1E4F1CA80];
          v44 = [v33 components];
          id v45 = [v43 setWithSet:v44];

          [(__CFString *)v45 minusSet:v42];
          id v46 = [v33 components];
          [(__CFString *)v42 minusSet:v46];

          v47 = SBLogDashBoard();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            -[CSCoverSheetViewController _updateActiveAppearanceForReason:]();
          }

          int v48 = SBLogDashBoard();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[CSCoverSheetViewController _updateActiveAppearanceForReason:](v45, v48);
          }

          int v49 = SBLogDashBoard();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
            -[CSCoverSheetViewController _updateActiveAppearanceForReason:](v42, v49);
          }
        }
        [(CSCoverSheetViewController *)self _handleEventType:1];
        unsigned int v76 = [MEMORY[0x1E4F42FF0] _isInAnimationBlock];
        int v50 = [v87 componentForType:4 identifier:@"(active)"];
        int v51 = [v33 componentForType:4 identifier:@"(active)"];
        uint64_t v52 = [v87 componentForType:4 identifier:@"(active)"];
        uint64_t v53 = [v33 componentForType:4 identifier:@"(active)"];
        [v52 offset];
        double v55 = v54;
        double v57 = v56;
        [v53 offset];
        BOOL v60 = v57 != v59 || v55 != v58;
        v79 = v50;
        int v61 = [v50 isHidden];
        int v62 = v61 ^ [v51 isHidden];
        BOOL v63 = [(CSPresentationViewController *)self->_modalPresentationController isTransitioning];
        if (![(CSCoverSheetViewController *)self isTransitioning] && v62 | v63 | v60)
        {
          uint64_t v74 = v37;
          char v64 = [v51 isHidden];
          [v53 offset];
          BOOL v65 = -[CSCoverSheetViewController _isSlideableContentOffsetOnscreen:](self, "_isSlideableContentOffsetOnscreen:");
          BOOL v66 = [(CSPresentationViewController *)self->_modalPresentationController isPresentingContent];
          BOOL v67 = (v64 & 1) == 0 && v65 && !v66;
          [(CSCoverSheetViewController *)self _beginAppearanceTransitionForPageViewControllersToVisible:v67 animated:v76];
          v37 = v74;
        }
        [(CSCoverSheetViewController *)self _updateHomeAffordance];
        v68 = (void *)MEMORY[0x1E4F4F898];
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __63__CSCoverSheetViewController__updateActiveAppearanceForReason___block_invoke;
        v95[3] = &unk_1E6AD87F8;
        v95[4] = self;
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __63__CSCoverSheetViewController__updateActiveAppearanceForReason___block_invoke_2;
        v88[3] = &unk_1E6AD9168;
        void v88[4] = self;
        char v92 = v62;
        id v89 = v33;
        id v90 = v51;
        BOOL v93 = v60;
        id v91 = v53;
        BOOL v94 = v63;
        id v69 = v53;
        id v70 = v51;
        [v68 addAlongsideAnimations:v95 completion:v88];

        id v7 = v84;
      }

      id v8 = v82;
      id v4 = v83;
      id v9 = v85;
      v6 = v86;
      id v11 = v80;
      id v10 = v81;
    }
  }
}

- (BOOL)_shouldUpdateActiveAppearanceForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  if ([(CSCoverSheetViewController *)self _appearState]
    && v5
    && ([v5 scrollView],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 visiblePageRange],
        uint64_t v8 = v7,
        v6,
        v8))
  {
    if (!self->_preventAppearanceUpdatesForRotation)
    {
      BOOL v11 = 1;
      goto LABEL_11;
    }
    id v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      id v10 = "Ignoring appearance update for %@ because we are in a rotation.";
LABEL_9:
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      id v10 = "Ignoring appearance update for %@ because we have no view.";
      goto LABEL_9;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isHostingAnApp
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_applicationHosters;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "isHostingAnApp", (void)v9))
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(CSPresentationViewController *)self->_modalPresentationController isHostingAnApp];
}

- (CSCoverSheetViewController)initWithPageViewControllers:(id)a3 mainPageContentViewController:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 containsObject:v10] & 1) == 0)
  {
    v182 = [MEMORY[0x1E4F28B00] currentHandler];
    [v182 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:526 description:@"The centerViewController must be part of viewControllers."];
  }
  v186.receiver = self;
  v186.super_class = (Class)CSCoverSheetViewController;
  long long v12 = [(CSCoverSheetViewController *)&v186 init];
  int v13 = v12;
  if (v12)
  {
    p_coverSheetContext = (id *)&v12->_coverSheetContext;
    objc_storeStrong((id *)&v12->_coverSheetContext, a5);
    uint64_t v15 = +[CSLockScreenDomain rootSettings];
    prototypeSettings = v13->_prototypeSettings;
    v13->_prototypeSettings = (CSLockScreenSettings *)v15;

    [(PTSettings *)v13->_prototypeSettings addKeyObserver:v13];
    v17 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B0]);
    lockScreenDefaults = v13->_lockScreenDefaults;
    v13->_lockScreenDefaults = v17;

    uint64_t v19 = (SBAlwaysOnDefaults *)objc_alloc_init(MEMORY[0x1E4FA5E40]);
    alwaysOnDefaults = v13->_alwaysOnDefaults;
    v13->_alwaysOnDefaults = v19;

    uint64_t v21 = objc_opt_new();
    activityCenter = v13->_activityCenter;
    v13->_activityCenter = (ACActivityCenter *)v21;

    id v183 = v9;
    [(CSCoverSheetViewController *)v13 _setPageViewControllers:v9];
    [(CSCoverSheetViewController *)v13 _setAllowedPageViewControllers:MEMORY[0x1E4F1CBF0]];
    [(CSCoverSheetViewController *)v13 _setMainPageContentViewController:v10];
    v23 = [[CSMagSafeAccessoryStatusObserver alloc] initWithCoverSheetContext:*p_coverSheetContext];
    accessoryAttachmentObserver = v13->_accessoryAttachmentObserver;
    v13->_accessoryAttachmentObserver = v23;

    [(CSMagSafeAccessoryStatusObserver *)v13->_accessoryAttachmentObserver setDelegate:v13];
    uint64_t v25 = objc_opt_new();
    attachedAccessories = v13->_attachedAccessories;
    v13->_attachedAccessories = (NSMutableArray *)v25;

    v13->_isAccessoryAnimationPresenting = 0;
    v13->_isAccessoryAnimationAllowed = 0;
    uint64_t v27 = +[CSBehavior behavior];
    localBehavior = v13->_localBehavior;
    v13->_localBehavior = (CSBehavior *)v27;

    uint64_t v29 = +[CSBehavior behavior];
    irisBehavior = v13->_irisBehavior;
    v13->_irisBehavior = (CSBehavior *)v29;

    uint64_t v31 = +[CSAppearance appearanceWithIdentifier:@"(default)"];
    localAppearance = v13->_localAppearance;
    v13->_localAppearance = (CSAppearance *)v31;

    id v33 = v13->_localAppearance;
    id v34 = objc_opt_new();
    v35 = [v34 priority:-100];
    id v36 = [v35 style:&unk_1F306BDD0];
    [(CSAppearance *)v33 addComponent:v36];

    v37 = v13->_localAppearance;
    v38 = +[CSComponent dateView];
    BOOL v39 = [v38 priority:-100];
    v40 = [v39 hidden:0];
    [(CSAppearance *)v37 addComponent:v40];

    id v41 = v13->_localAppearance;
    id v42 = objc_opt_new();
    uint64_t v43 = [v42 priority:-100];
    v44 = [v43 hidden:0];
    id v45 = [v44 fakeStatusBarLevel:&unk_1F306BDE8];
    [(CSAppearance *)v41 addComponent:v45];

    id v46 = v13->_localAppearance;
    v47 = +[CSComponent statusBarBackground];
    int v48 = [v47 priority:-100];
    int v49 = [v48 hidden:1];
    [(CSAppearance *)v46 addComponent:v49];

    int v50 = v13->_localAppearance;
    int v51 = +[CSComponent pageControl];
    uint64_t v52 = [v51 priority:-100];
    uint64_t v53 = [v52 hidden:0];
    [(CSAppearance *)v50 addComponent:v53];

    double v54 = v13->_localAppearance;
    double v55 = +[CSComponent pageContent];
    double v56 = [v55 priority:-100];
    double v57 = [v56 hidden:0];
    [(CSAppearance *)v54 addComponent:v57];

    double v58 = v13->_localAppearance;
    double v59 = +[CSComponent slideableContent];
    BOOL v60 = [v59 priority:-100];
    int v61 = [v60 hidden:0];
    [(CSAppearance *)v58 addComponent:v61];

    int v62 = v13->_localAppearance;
    BOOL v63 = +[CSComponent wallpaper];
    char v64 = [v63 priority:-100];
    BOOL v65 = [v64 hidden:1];
    [(CSAppearance *)v62 addComponent:v65];

    BOOL v66 = v13->_localAppearance;
    BOOL v67 = +[CSComponent tinting];
    v68 = [v67 priority:-100];
    id v69 = [v68 hidden:1];
    [(CSAppearance *)v66 addComponent:v69];

    id v70 = v13->_localAppearance;
    uint64_t v71 = +[CSComponent footerStatusLabel];
    v72 = [v71 priority:-100];
    uint64_t v73 = [v72 hidden:0];
    [(CSAppearance *)v70 addComponent:v73];

    uint64_t v74 = v13->_localAppearance;
    BOOL v75 = +[CSComponent footerCallToActionLabel];
    unsigned int v76 = [v75 priority:-100];
    id v77 = [v76 hidden:0];
    [(CSAppearance *)v74 addComponent:v77];

    v78 = v13->_localAppearance;
    v79 = objc_opt_new();
    id v80 = [v79 priority:-100];
    id v81 = [v80 hidden:0];
    id v82 = [v81 prefersInlineCoaching:0];
    [(CSAppearance *)v78 addComponent:v82];

    id v83 = v13->_localAppearance;
    id v84 = +[CSComponent content];
    id v85 = [v84 priority:-100];
    long long v86 = [v85 hidden:0];
    [(CSAppearance *)v83 addComponent:v86];

    long long v87 = v13->_localAppearance;
    v88 = +[CSComponent statusBarGradient];
    id v89 = [v88 priority:-100];
    id v90 = [v89 hidden:0];
    [(CSAppearance *)v87 addComponent:v90];

    id v91 = v13->_localAppearance;
    char v92 = objc_opt_new();
    BOOL v93 = [v92 priority:-100];
    BOOL v94 = [v93 hidden:1];
    v95 = [v94 lighterReduction:1];
    [(CSAppearance *)v91 addComponent:v95];

    id v96 = v13->_localAppearance;
    id v97 = +[CSComponent dimmingLayer];
    id v98 = [v97 priority:-100];
    id v99 = [v98 hidden:0];
    [(CSAppearance *)v96 addComponent:v99];

    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2 || !_os_feature_enabled_impl()) {
        goto LABEL_12;
      }
    }
    else
    {
      id v100 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v100 userInterfaceIdiom] != 1)
      {
LABEL_11:

        goto LABEL_12;
      }
      char v101 = _os_feature_enabled_impl();

      if ((v101 & 1) == 0)
      {
LABEL_12:
        v105 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v105 addObserver:v13 selector:sel__displayWillTurnOnWhileOnCoverSheet_ name:*MEMORY[0x1E4FA7A30] object:0];
        [v105 addObserver:v13 selector:sel__preferredContentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
        [v105 addObserver:v13 selector:sel__liftToWakeGestureDetected name:*MEMORY[0x1E4FA7A68] object:0];
        [v105 addObserver:v13 selector:sel__managedConfigurationEffectiveSettingsDidChange_ name:*MEMORY[0x1E4F73EC0] object:0];
        v106 = [CSPowerChangeObserver alloc];
        v107 = [*p_coverSheetContext powerStatusProvider];
        v108 = [*p_coverSheetContext powerStatusChangeNotificationName];
        v184[0] = MEMORY[0x1E4F143A8];
        v184[1] = 3221225472;
        v184[2] = __96__CSCoverSheetViewController_initWithPageViewControllers_mainPageContentViewController_context___block_invoke;
        v184[3] = &unk_1E6AD8A40;
        v109 = v13;
        v185 = v109;
        uint64_t v110 = [(CSPowerChangeObserver *)v106 initWithStatusProvider:v107 notificationName:v108 updateBlock:v184];
        powerChangeObserver = v109->_powerChangeObserver;
        v109->_powerChangeObserver = (CSPowerChangeObserver *)v110;

        v112 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
        batteryDeviceController = v109->_batteryDeviceController;
        v109->_batteryDeviceController = v112;

        v114 = [[CSEmbeddedContentActionManager alloc] initWithDelegate:v109];
        embeddedContentActionManager = v109->_embeddedContentActionManager;
        v109->_embeddedContentActionManager = v114;

        v116 = v109->_embeddedContentActionManager;
        v117 = [*p_coverSheetContext contentActionProvider];
        [(CSEmbeddedContentActionManager *)v116 setContentActionProvider:v117];

        v118 = objc_alloc_init(CSBackgroundPresentationManager);
        backgroundPresentationManager = v109->_backgroundPresentationManager;
        v109->_backgroundPresentationManager = v118;

        v120 = [[CSBackgroundContentActionManager alloc] initWithDelegate:v109];
        backgroundContentActionManager = v109->_backgroundContentActionManager;
        v109->_backgroundContentActionManager = v120;

        v122 = v109->_backgroundContentActionManager;
        v123 = [*p_coverSheetContext contentActionProvider];
        [(CSBackgroundContentActionManager *)v122 setContentActionProvider:v123];

        v124 = [CSRemoteContentSessionManager alloc];
        v125 = [*p_coverSheetContext authenticationStatusProvider];
        uint64_t v126 = [(CSRemoteContentSessionManager *)v124 initWithAuthenticationStatusProvider:v125];
        remoteContentSessionManager = v109->_remoteContentSessionManager;
        v109->_remoteContentSessionManager = (CSRemoteContentSessionManager *)v126;

        [(CSRemoteContentSessionManager *)v109->_remoteContentSessionManager setForwardingHostDelegate:v109];
        uint64_t v128 = [MEMORY[0x1E4F1CA80] set];
        remoteContentInlineProvidingManagers = v109->_remoteContentInlineProvidingManagers;
        v109->_remoteContentInlineProvidingManagers = (NSMutableSet *)v128;

        v130 = [v10 combinedListViewController];
        [v130 setRemoteContentInlineProvider:v109];

        v131 = [v10 combinedListViewController];
        [v131 setCoverSheetGestureHandling:v109];
        [v131 setActivityItemObserver:v109];
        [v131 setAudioCategoriesObserver:v109];
        v132 = objc_alloc_init(CSModalPresentationViewController);
        modalPresentationController = v109->_modalPresentationController;
        v109->_modalPresentationController = v132;

        [(CSPresentationViewController *)v109->_modalPresentationController setPresentationDelegate:v109];
        uint64_t v134 = [MEMORY[0x1E4F1CA80] set];
        pendingModalViewControllers = v109->_pendingModalViewControllers;
        v109->_pendingModalViewControllers = (NSMutableSet *)v134;

        v136 = [[CSTimerViewController alloc] initWithNibName:0 bundle:0];
        timerViewController = v109->_timerViewController;
        v109->_timerViewController = v136;

        [(CSTimerViewController *)v109->_timerViewController setDelegate:v109];
        [(CSTimerViewController *)v109->_timerViewController setEnabled:1];
        v138 = objc_alloc_init(CSNotificationDispatcher);
        notificationDispatcher = v109->_notificationDispatcher;
        v109->_notificationDispatcher = v138;

        [(CSNotificationDispatcher *)v109->_notificationDispatcher setModalDestination:v109];
        v140 = v109->_notificationDispatcher;
        v141 = [*p_coverSheetContext carPlayStatusProvider];
        [(CSNotificationDispatcher *)v140 setCarPlayStatusProvider:v141];

        [(CSNotificationDispatcher *)v109->_notificationDispatcher setListDestination:v10];
        [v10 setDispatcher:v109->_notificationDispatcher];
        v142 = [v10 combinedListViewController];
        v143 = [*p_coverSheetContext contentActionProvider];
        [v142 setContentActionProvider:v143];

        uint64_t v144 = [*p_coverSheetContext legibilityProvider];
        legibilityProvider = v109->_legibilityProvider;
        v109->_legibilityProvider = (CSLegibilityProviding *)v144;

        [(CSLegibilityProviding *)v109->_legibilityProvider setLegibilityProviderDelegate:v109];
        v146 = [*p_coverSheetContext lockOutStatusProvider];
        [(CSCoverSheetViewController *)v109 _setLockOutController:v146];

        v147 = objc_alloc_init(CSLayoutStrategy);
        [(CSLayoutStrategy *)v147 setPersistentLayout:v109];
        [(CSCoverSheetViewController *)v109 setLayoutStrategy:v147];
        v148 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        exemptFromInactiveAppearanceParticipants = v109->_exemptFromInactiveAppearanceParticipants;
        v109->_exemptFromInactiveAppearanceParticipants = v148;

        uint64_t v150 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        externalAppearanceProviders = v109->_externalAppearanceProviders;
        v109->_externalAppearanceProviders = (NSHashTable *)v150;

        uint64_t v152 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        externalBehaviorProviders = v109->_externalBehaviorProviders;
        v109->_externalBehaviorProviders = (NSHashTable *)v152;

        uint64_t v154 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        externalEventHandlers = v109->_externalEventHandlers;
        v109->_externalEventHandlers = (NSHashTable *)v154;

        uint64_t v156 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        externalLockProviders = v109->_externalLockProviders;
        v109->_externalLockProviders = (NSHashTable *)v156;

        uint64_t v158 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        externalPresentationProviders = v109->_externalPresentationProviders;
        v109->_externalPresentationProviders = (NSHashTable *)v158;

        uint64_t v160 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        applicationHosters = v109->_applicationHosters;
        v109->_applicationHosters = (NSHashTable *)v160;

        v162 = [[CSNotificationClearingTrigger alloc] initWithDelegate:v109];
        notificationClearingTrigger = v109->_notificationClearingTrigger;
        v109->_notificationClearingTrigger = v162;

        uint64_t v164 = [*p_coverSheetContext screenWakeAnimationController];
        screenWakeAnimationController = v109->_screenWakeAnimationController;
        v109->_screenWakeAnimationController = (SBFScreenWakeAnimationControlling *)v164;

        v166 = (SBFLegacyWallpaperWakeAnimator *)objc_alloc_init(MEMORY[0x1E4FA5F30]);
        legacyWallpaperWakeAnimator = v109->_legacyWallpaperWakeAnimator;
        v109->_legacyWallpaperWakeAnimator = v166;

        [(SBFLegacyWallpaperWakeAnimator *)v109->_legacyWallpaperWakeAnimator setWakeState:0];
        v109->_lastAppearState = 0;
        [(CSCoverSheetViewController *)v109 _preferredContentSizeDidChange];
        [(CSCoverSheetViewController *)v109 _addStateCaptureHandlers];
        uint64_t v168 = [MEMORY[0x1E4FA7CD0] sharedInstance];
        phoneUnlockWithWatchController = v109->_phoneUnlockWithWatchController;
        v109->_phoneUnlockWithWatchController = (SBUIPhoneUnlockWithWatchController *)v168;

        [(SBUIPhoneUnlockWithWatchController *)v109->_phoneUnlockWithWatchController setDelegate:v109];
        v170 = v109->_phoneUnlockWithWatchController;
        v171 = [*p_coverSheetContext biometricResource];
        [(SBUIPhoneUnlockWithWatchController *)v170 setBiometricResource:v171];

        [(SBUIPhoneUnlockWithWatchController *)v109->_phoneUnlockWithWatchController addObserver:v109];
        v172 = objc_alloc_init(CSCoverSheetAppearanceResolver);
        appearanceResolver = v109->_appearanceResolver;
        v109->_appearanceResolver = v172;

        v174 = [CSPosterSwitcherActivationManager alloc];
        v175 = [*p_coverSheetContext unlockRequester];
        uint64_t v176 = [(CSPosterSwitcherActivationManager *)v174 initWithSource:v109 delegate:v109 unlockRequester:v175];
        posterSwitcherActivationManager = v109->_posterSwitcherActivationManager;
        v109->_posterSwitcherActivationManager = (CSPosterSwitcherActivationManager *)v176;

        v178 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
        uint64_t v179 = [v178 addMonitor:v109 subjectMask:1 subscriptionOptions:1];
        appProtectionSubjectMonitorSubscription = v109->_appProtectionSubjectMonitorSubscription;
        v109->_appProtectionSubjectMonitorSubscription = (APSubjectMonitorSubscription *)v179;

        id v9 = v183;
        goto LABEL_13;
      }
    }
    v102 = v13->_localAppearance;
    id v100 = +[CSComponent fullBleedContent];
    uint64_t v103 = [v100 priority:40];
    v104 = [v103 flag:1];
    [(CSAppearance *)v102 addComponent:v104];

    goto LABEL_11;
  }
LABEL_13:

  return v13;
}

uint64_t __96__CSCoverSheetViewController_initWithPageViewControllers_mainPageContentViewController_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _powerStatusChangedToConnectedState:a2];
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_accessoryViewControllerTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_accessoryViewControllerChargingTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_chargingViewControllerTimer invalidate];
  [(APSubjectMonitorSubscription *)self->_appProtectionSubjectMonitorSubscription invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  v7[1] = (id)MEMORY[0x1E4F143A8];
  v7[2] = (id)3221225472;
  v7[3] = __54__CSCoverSheetViewController__addStateCaptureHandlers__block_invoke;
  v7[4] = &unk_1E6AD8948;
  objc_copyWeak(&v8, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  v6[1] = (id)MEMORY[0x1E4F143A8];
  v6[2] = (id)3221225472;
  v6[3] = __54__CSCoverSheetViewController__addStateCaptureHandlers__block_invoke_2;
  v6[4] = &unk_1E6AD8948;
  objc_copyWeak(v7, &location);
  id v4 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_copyWeak(v6, &location);
  id v5 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __54__CSCoverSheetViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained descriptionWithMultilinePrefix:0];

  return v2;
}

id __54__CSCoverSheetViewController__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_msgSend(WeakRetained, "__currentDesiredAppearanceWithStartIndex:targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:", 0, 0, 0, 0, 0, 0, 0);
  id v3 = [v2 description];

  return v3;
}

id __54__CSCoverSheetViewController__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained activeBehavior];
  id v3 = NSStringFromCoverSheetScrollingStrategy([v2 scrollingStrategy]);

  id v4 = [WeakRetained activeBehavior];
  id v5 = NSStringFromCoverSheetCapability([v4 restrictedCapabilities]);

  uint64_t v6 = [NSString stringWithFormat:@"Scrolling Strategy: %@\nRestricted Capabilities: %@", v3, v5];

  return v6;
}

- (void)setIrisWallpaperPlayer:(id)a3
{
  id v5 = (PBUIIrisWallpaperPlaying *)a3;
  if (self->_irisWallpaperPlayer != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_irisWallpaperPlayer, a3);
    [(PBUIIrisWallpaperPlaying *)self->_irisWallpaperPlayer setIrisDelegate:self];
    id v5 = v6;
  }
}

- (void)setWallpaperGestureRecognizer:(id)a3
{
  id v5 = (UIGestureRecognizer *)a3;
  p_wallpaperGestureRecognizer = &self->_wallpaperGestureRecognizer;
  if (self->_wallpaperGestureRecognizer != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_wallpaperGestureRecognizer, a3);
    p_wallpaperGestureRecognizer = (UIGestureRecognizer **)[(CSCoverSheetViewController *)self _setupWallpaperGesture];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_wallpaperGestureRecognizer, v5);
}

- (void)setWallpaperColorProvider:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperColorProvider, obj);
    [(CSMainPageContentViewController *)self->_mainPageContentViewController setWallpaperColorProvider:obj];
  }
}

- (void)setCameraPrewarmer:(id)a3
{
  id v5 = (CSCameraPrewarming *)a3;
  if (self->_cameraPrewarmer != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_cameraPrewarmer, a3);
    [(CSQuickActionsViewController *)self->_quickActionsViewController setCameraPrewarmer:self->_cameraPrewarmer];
    id v5 = v6;
  }
}

- (void)setEffectiveInterfaceOrientationOverride:(int64_t)a3
{
  if (self->_effectiveInterfaceOrientationOverride != a3)
  {
    self->_effectiveInterfaceOrientationOverride = a3;
    id v3 = [(CSCoverSheetViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (SBNotificationDestination)notificationDestination
{
  return (SBNotificationDestination *)self->_notificationDispatcher;
}

- (BOOL)isShowingTodayView
{
  id v3 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  id v4 = v3;
  if (v3 && ([v3 presentationProgress], v5 > 0.0))
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = [(CSCoverSheetViewController *)self _indexOfTodayPage];
    if ([(CSCoverSheetViewController *)self isTransitioning]) {
      unint64_t value = (unint64_t)self->_transitionContext.interval.end.value;
    }
    else {
      unint64_t value = self->_lastSettledPageIndex;
    }
    BOOL v6 = value == v7;
  }

  return v6;
}

- (int64_t)_passcodePresentationMode
{
  if (![(CSCoverSheetViewController *)self isShowingTodayView]
    && (![(CSCoverSheetViewController *)self isShowingModalView]
     || [(CSCoverSheetViewController *)self isPasscodeLockVisible]))
  {
    return 0;
  }
  if ([(CSCoverSheetViewController *)self _isRemoteContentPresentedInUnlockMode])
  {
    return 2;
  }
  return 1;
}

- (void)activateTodayViewWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  double v5 = [(CSCoverSheetViewController *)self activeBehavior];
  int v6 = [v5 areRestrictedCapabilities:64];

  if (v4 && v6) {
    v4[2](v4);
  }
  unint64_t v7 = [(CSCoverSheetViewController *)self overlayController];
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__CSCoverSheetViewController_activateTodayViewWithCompletion___block_invoke;
    v14[3] = &unk_1E6AD8B48;
    id v8 = (id *)&v15;
    uint64_t v15 = v4;
    id v9 = v4;
    [v7 setPresentationProgress:0 interactive:1 animated:v14 completionHandler:1.0];
  }
  else
  {
    unint64_t v10 = [(CSCoverSheetViewController *)self _indexOfTodayPage];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CSCoverSheetViewController_activateTodayViewWithCompletion___block_invoke_2;
    v12[3] = &unk_1E6AD8B78;
    id v8 = (id *)&v13;
    int v13 = v4;
    id v11 = v4;
    [(CSCoverSheetViewController *)self activatePage:v10 animated:1 withCompletion:v12];
  }
}

uint64_t __62__CSCoverSheetViewController_activateTodayViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__CSCoverSheetViewController_activateTodayViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deactivateTodayViewWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  double v5 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  int v6 = v5;
  if (v5)
  {
    if ([v5 isPresented])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __64__CSCoverSheetViewController_deactivateTodayViewWithCompletion___block_invoke;
      v7[3] = &unk_1E6AD8B48;
      id v8 = v4;
      [v6 setPresentationProgress:0 interactive:1 animated:v7 completionHandler:0.0];
    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
}

uint64_t __64__CSCoverSheetViewController_deactivateTodayViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)activateMainPageWithCompletion:(id)a3
{
  id v4 = a3;
  [(CSCoverSheetViewController *)self activatePage:[(CSCoverSheetViewController *)self _indexOfMainPage] animated:1 withCompletion:v4];
}

- (void)activateCameraViewAnimated:(BOOL)a3 sendingActions:(id)a4 completion:(id)a5
{
}

- (void)activateCameraWithHostableEntity:(id)a3 animated:(BOOL)a4 sendingActions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke;
  v28[3] = &unk_1E6AD8BC8;
  v28[4] = self;
  id v13 = v10;
  id v29 = v13;
  BOOL v32 = a4;
  id v14 = v11;
  id v30 = v14;
  id v15 = v12;
  id v31 = v15;
  id v16 = (void (**)(void))MEMORY[0x1D9487300](v28);
  if (![(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource isTransitioning])goto LABEL_3; {
  currentTransitionSource = self->_currentTransitionSource;
  }
  uint64_t v18 = [(CSCoverSheetViewController *)self coverSheetView];

  if (currentTransitionSource != v18) {
    goto LABEL_3;
  }
  uint64_t v21 = self->_currentTransitionSource;
  if (v21)
  {
    [(CSCoverSheetViewTransitionSource *)v21 transitionContext];
    double v22 = *((double *)&v26 + 1);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    double v22 = 0.0;
  }
  if (v22 == (double)[(CSCoverSheetViewController *)self _indexOfMainPage]) {
    int v19 = 1;
  }
  else {
LABEL_3:
  }
    int v19 = 0;
  [(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource cancelTransition];
  [(CSCoverSheetViewController *)self dismissHomeScreenOverlay];
  if ([(CSCoverSheetViewController *)self _isPresentingModalRemoteContent])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke_118;
    v23[3] = &unk_1E6AD8B48;
    double v24 = v16;
    [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:5 completion:v23];
  }
  else
  {
    if (self->_spotlightModalViewController)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
      [WeakRetained dismissSpotlightAnimated:1];
    }
    else if (v19)
    {
      self->_transitionType = 0;
      [(CSCoverSheetViewController *)self setCurrentTransitionSource:0];
      [(CSCoverSheetViewController *)self activatePage:[(CSCoverSheetViewController *)self _indexOfMainPage] animated:0 withCompletion:0];
    }
    v16[2](v16);
  }
}

void __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke_2;
  v5[3] = &unk_1E6AD8BA0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v1 _activateCameraEntity:v2 animated:v3 actions:v4 completion:v5];
}

void __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke_2_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, a2 == 0);
  }
}

void __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke_118(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Dismissing remote modal VC failed; not activating camera",
        v4,
        2u);
    }
  }
}

- (void)setCoverSheetIsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSCoverSheetViewController *)self isShowingTodayView])
  {
    id v5 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:[(CSCoverSheetViewController *)self _indexOfTodayPage]];
    if (!v3) {
      [(CSCoverSheetViewController *)self dismissHomeScreenOverlay];
    }
    [v5 setDisplayLayoutElementActive:v3];
  }
  if (v3)
  {
    if ([(CSCoverSheetViewController *)self _isShowingInlineContent])
    {
      [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleForInlineContent];
    }
  }
  else
  {
    if ([(CSCoverSheetViewController *)self _isPresentingDismissableRemoteContent])
    {
      [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:7 completion:0];
    }
    if (self->_spotlightModalViewController)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
      [WeakRetained dismissSpotlightAnimated:0];
    }
    if ([(CSCoverSheetViewController *)self isPasscodeLockVisible])
    {
      [(CSCoverSheetViewController *)self setPasscodeLockVisible:0 animated:0];
    }
  }
}

- (BOOL)isShowingModalView
{
  uint64_t v2 = [(CSCoverSheetViewController *)self modalPresentationController];
  char v3 = [v2 isPresentingContent];

  return v3;
}

- (BOOL)shouldPresentOrDismissCoverSheetSpotlight
{
  if (self->_spotlightModalViewController)
  {
    LOBYTE(v2) = 1;
  }
  else if ([(CSCoverSheetViewController *)self isMainPageVisible] {
         && ![(CSCoverSheetViewController *)self isShowingModalView])
  }
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (([WeakRetained coverSheetViewControllerHasSecureApp:self] & 1) != 0
      || [(CSCoverSheetViewController *)self isPresentingNotificationInLongLook])
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      BOOL v2 = ![(CSCoverSheetViewController *)self _isSpotlightBehaviorRestricted];
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)presentOrDismissCoverSheetSpotlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSCoverSheetViewController *)self shouldPresentOrDismissCoverSheetSpotlight])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
    id v6 = WeakRetained;
    if (self->_spotlightModalViewController) {
      [WeakRetained dismissSpotlightAnimated:v3];
    }
    else {
      [WeakRetained presentSpotlightAnimated:v3];
    }
  }
}

- (void)updateScaleViewWithScale:(double)a3 withDuration:(double)a4
{
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  CSComponentTransitionInputsMake(0, (uint64_t)&v32, a4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3, 0.0);
  localAppearance = self->_localAppearance;
  id v6 = [(CSAppearance *)localAppearance componentForType:1 identifier:@"Spotlight"];
  [(CSAppearance *)localAppearance removeComponent:v6];

  uint64_t v7 = self->_localAppearance;
  id v8 = [(CSAppearance *)v7 componentForType:11 identifier:@"Spotlight"];
  [(CSAppearance *)v7 removeComponent:v8];

  id v9 = self->_localAppearance;
  id v10 = [(CSAppearance *)v9 componentForType:15 identifier:@"Spotlight"];
  [(CSAppearance *)v9 removeComponent:v10];

  id v11 = self->_localAppearance;
  id v12 = objc_opt_new();
  id v13 = [v12 identifier:@"Spotlight"];
  id v14 = [v13 priority:40];
  id v15 = [v14 transitionModifiers:16];
  long long v29 = v32;
  long long v30 = v33;
  long long v31 = v34;
  id v16 = [v15 transitionInputs:&v29];
  [(CSAppearance *)v11 addComponent:v16];

  v17 = self->_localAppearance;
  uint64_t v18 = objc_opt_new();
  int v19 = [v18 identifier:@"Spotlight"];
  unint64_t v20 = [v19 priority:40];
  uint64_t v21 = [v20 transitionModifiers:16];
  long long v29 = v32;
  long long v30 = v33;
  long long v31 = v34;
  double v22 = [v21 transitionInputs:&v29];
  [(CSAppearance *)v17 addComponent:v22];

  v23 = self->_localAppearance;
  double v24 = objc_opt_new();
  long long v25 = [v24 identifier:@"Spotlight"];
  long long v26 = [v25 priority:40];
  long long v27 = [v26 transitionModifiers:16];
  long long v29 = v32;
  long long v30 = v33;
  long long v31 = v34;
  double v28 = [v27 transitionInputs:&v29];
  [(CSAppearance *)v23 addComponent:v28];

  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"Spotlight"];
}

- (void)noteWillPresentForUserGesture
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(CSCoverSheetViewController *)self setPasscodeLockVisible:0 animated:1];
  [(CSCoverSheetViewController *)self _setDidDismissSinceScreenOn:1];
  [(CSFixedFooterViewController *)self->_fixedFooterViewController updateCallToActionForReversingInteractiveTransition];
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    BOOL v9 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[Charge UI][User Gesture] visible NO, showBattery NO – isAlreadyShowingChargingModal: %d", (uint8_t *)&v8, 8u);
  }

  [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:0 showBattery:0 animated:1];
  uint64_t v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
    int v8 = 67109120;
    BOOL v9 = v5;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "[Charge UI][User Gesture] – endedShowingChargingModal: %d", (uint8_t *)&v8, 8u);
  }

  id v6 = [(SBFLockScreenDateViewController *)self->_dateViewController dateViewIfExists];
  [v6 setAlpha:1.0];

  [(CSCoverSheetViewController *)self _addOrRemoveRemoteContentViewIfNecessaryMaintainingState:1];
  uint64_t v7 = +[CSEvent eventWithType:36];
  [(CSCoverSheetViewController *)self _handleEvent:v7];
}

- (void)setLayoutStrategy:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (CSLayoutStrategy *)a3;
  if (self->_layoutStrategy != v5)
  {
    objc_storeStrong((id *)&self->_layoutStrategy, a3);
    id v6 = [(CSCoverSheetViewController *)self coverSheetView];
    [v6 setLayoutStrategy:v5];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(CSCoverSheetViewController *)self pageViewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) setLayoutStrategy:v5];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (int64_t)effectiveInterfaceOrientation
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1) {
    return 0;
  }
LABEL_3:
  int64_t result = [(CSCoverSheetViewController *)self effectiveInterfaceOrientationOverride];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (void)resetMainPageContentOffset
{
  id v2 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  [v2 resetContentOffset];
}

- (void)setPartiallyOnScreen:(BOOL)a3
{
  if (self->_partiallyOnScreen != a3)
  {
    self->_partiallyOnScreen = a3;
    [(CSCoverSheetViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (BOOL)isAlternateDateEnabled
{
  return [(SBFLockScreenDateViewController *)self->_dateViewController isAlternateDateEnabled];
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
}

- (void)updateFont:(id)a3 vibrancyConfiguration:(id)a4 numberingSystem:(id)a5 contentStyle:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (_os_feature_enabled_impl())
  {
    [(CSCoverSheetViewController *)self setVibrancyConfiguration:v10];
    long long v13 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v13 setCustomTimeFont:v19];

    long long v14 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v14 setCustomTimeNumberingSystem:v11];

    long long v15 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v15 setContentStyle:v12];

    [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController setContentStyle:v12];
  }
  else
  {
    [(CSCoverSheetViewController *)self setVibrancyConfiguration:0];
    id v16 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v16 setCustomTimeFont:0];

    uint64_t v17 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v17 setTextColor:0];

    uint64_t v18 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v18 setCustomTimeNumberingSystem:0];
  }
}

- (void)_updateVibrancy
{
  BOOL v3 = [(CSCoverSheetViewController *)self vibrancyConfigurationOverride];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CSCoverSheetViewController *)self vibrancyConfiguration];
  }
  id v25 = v5;

  id v6 = [(CSCoverSheetViewController *)self effectiveVibrancyConfiguration];
  uint64_t v7 = [(CSCoverSheetViewController *)self activeAppearance];
  uint64_t v8 = [v7 componentForType:19 identifier:@"(active)"];

  if ([v25 backgroundType] == 1)
  {
    if (v8)
    {
      uint64_t v9 = [v8 value];
      BOOL IsDarkAffectingLegibility = CSBackgroundStyleIsDarkAffectingLegibility([v9 integerValue]);

      if (IsDarkAffectingLegibility)
      {
        uint64_t v11 = [v25 copyWithWithBackgroundType:0];

        id v25 = (id)v11;
      }
    }
  }
  id v12 = [(CSCoverSheetViewController *)self traitCollection];
  uint64_t v13 = [v12 _backlightLuminance];

  if (v13 == 1)
  {
    uint64_t v14 = objc_msgSend(v25, "cs_adjustedForReducedBacklight");

    id v15 = (id)v14;
  }
  else
  {
    id v15 = v25;
  }
  id v26 = v15;
  if ((BSEqualObjects() & 1) != 0
    || ![(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource isTransitioning])
  {
    id v24 = v26;
  }
  else
  {
    [v8 transitionProgress];
    double v17 = v16;
    id v18 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    uint64_t v19 = [v6 effectType];
    uint64_t v20 = [v6 backgroundType];
    uint64_t v21 = [v6 color];
    double v22 = [v6 groupName];
    v23 = [v26 alternativeVibrancyEffectLUT];
    id v24 = (id)[v18 initWithEffectType:v19 backgroundType:v20 color:v21 groupName:v22 blendConfiguration:v26 blendAmount:v23 alternativeVibrancyEffectLUT:v17];
  }
  [(CSCoverSheetViewController *)self setEffectiveVibrancyConfiguration:v24];
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v9 = (id)[v4 copyWithGroupName:v6];

  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v7 = (BSUIVibrancyConfiguration *)[v9 copy];
    vibrancyConfiguration = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v7;

    [(CSCoverSheetViewController *)self _updateVibrancy];
  }
}

- (void)setVibrancyConfigurationOverride:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v9 = (id)[v4 copyWithGroupName:v6];

  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v7 = (BSUIVibrancyConfiguration *)[v9 copy];
    vibrancyConfigurationOverride = self->_vibrancyConfigurationOverride;
    self->_vibrancyConfigurationOverride = v7;

    [(CSCoverSheetViewController *)self _updateVibrancy];
  }
}

- (void)setEffectiveVibrancyConfiguration:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (BSUIVibrancyConfiguration *)[v7 copy];
    effectiveVibrancyConfiguration = self->_effectiveVibrancyConfiguration;
    self->_effectiveVibrancyConfiguration = v4;

    id v6 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
    [v6 setVibrancyConfiguration:self->_effectiveVibrancyConfiguration];

    [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController setVibrancyConfiguration:self->_effectiveVibrancyConfiguration];
    [(CSPosterSwitcherViewController *)self->_posterSwitcherViewController setVibrancyConfiguration:self->_effectiveVibrancyConfiguration];
  }
}

- (void)updateLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4
{
}

- (void)updateFloatingLayerOrdering
{
  floatingLayerView = self->_floatingLayerView;
  if (floatingLayerView)
  {
    [(BSInvalidatable *)floatingLayerView invalidate];
    [(BSInvalidatable *)self->_floatingLayerView removeFromSuperview];
    id v4 = self->_floatingLayerView;
    self->_floatingLayerView = 0;

    [(CSCoverSheetViewController *)self _updateWallpaperFloatingLayerContainerView];
  }
}

- (void)handleReachabilityAnimationWillBegin
{
  int v3 = [(CSCoverSheetViewController *)self _appearState];
  id v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext reachabilityController];
  [v4 effectiveReachabilityYOffset];
  int IsZero = BSFloatIsZero();

  if (IsZero) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    localAppearance = self->_localAppearance;
    uint64_t v8 = objc_opt_new();
    id v9 = [v8 identifier:@"ReachabilityOverride"];
    id v10 = [v9 priority:20];
    uint64_t v11 = [v10 hidden:0];
    [(CSAppearance *)localAppearance addComponent:v11];

    id v12 = self->_localAppearance;
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = [v13 identifier:@"ReachabilityOverride"];
    id v15 = [v14 priority:20];
    double v16 = [v15 shouldMatchMove:0];
    [(CSAppearance *)v12 addComponent:v16];

    [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"ReachabilityOverride"];
  }
}

- (void)handleReachabilityAnimationDidEnd
{
  int v3 = [(CSAppearance *)self->_localAppearance componentForType:6 identifier:@"ReachabilityOverride"];

  if (v3)
  {
    id v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext reachabilityController];
    [v4 effectiveReachabilityYOffset];
    int IsZero = BSFloatIsZero();

    if (IsZero)
    {
      [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"ReachabilityOverride"];
      [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"ReachabilityOverride"];
    }
  }
}

- (void)startObservingAmbientPresentationForController:(id)a3
{
}

- (void)requestIdleTimerResetForPoster
{
  id v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
  if ([v4 hasPasscodeSet])
  {
    BOOL v3 = [(CSCoverSheetViewController *)self isAuthenticated];

    if (!v3) {
      return;
    }
    id v4 = +[CSAction actionWithType:3];
    -[CSCoverSheetViewController handleAction:fromSender:](self, "handleAction:fromSender:");
  }
}

- (void)setQuickActionsConfiguration:(id)a3
{
}

- (CSQuickActionsConfiguration)quickActionsConfiguration
{
  return [(CSQuickActionsViewController *)self->_quickActionsViewController quickActionsConfiguration];
}

- (id)bestIconViewForApplicationBundleIdentifier:(id)a3
{
  return [(CSQuickActionsViewController *)self->_quickActionsViewController bestIconViewForApplicationBundleIdentifier:a3];
}

- (void)_setLastSettledPageIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_lastSettledPageIndex = a3;
  id v4 = -[CSCoverSheetViewController pageViewControllerAtIndex:](self, "pageViewControllerAtIndex:");
  id v5 = [(CSCoverSheetViewController *)self mainPageContentViewController];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 coverSheetViewControllerDidSettleOnPage:self mainPage:v4 == v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)setScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(CSAppearance *)self->_localAppearance componentForType:15 identifier:@"SwitcherZoomingPresentation"];
  uint64_t v10 = v9;
  if (!v9 || ([v9 transitionInputs], (BSFloatEqualToFloat() & 1) == 0))
  {
    uint64_t v11 = [(CSLockScreenSettings *)self->_prototypeSettings cameraExtensionSettings];
    long long v12 = [v11 coverSheetContentScaleSettings];

    double v13 = 0.0;
    if ((unint64_t)(a4 - 3) <= 2) {
      objc_msgSend(MEMORY[0x1E4F42FF0], "inheritedAnimationDuration", 0.0);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    CSComponentTransitionInputsMake(0, (uint64_t)&v46, v13, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3, 0.0);
    char IsOne = BSFloatIsOne();
    [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"SwitcherZoomingPresentation"];
    if ((IsOne & 1) == 0)
    {
      v40 = v12;
      localAppearance = self->_localAppearance;
      double v16 = objc_opt_new();
      uint64_t v17 = [v16 identifier:@"SwitcherZoomingPresentation"];
      id v18 = [v17 priority:40];
      uint64_t v19 = [v18 transitionModifiers:16];
      long long v43 = v46;
      long long v44 = v47;
      long long v45 = v48;
      uint64_t v20 = [v19 transitionInputs:&v43];
      [(CSAppearance *)localAppearance addComponent:v20];

      uint64_t v21 = self->_localAppearance;
      double v22 = objc_opt_new();
      v23 = [v22 identifier:@"SwitcherZoomingPresentation"];
      id v24 = [v23 priority:40];
      id v25 = [v24 transitionModifiers:16];
      long long v43 = v46;
      long long v44 = v47;
      long long v45 = v48;
      id v26 = [v25 transitionInputs:&v43];
      [(CSAppearance *)v21 addComponent:v26];

      long long v27 = self->_localAppearance;
      double v28 = objc_opt_new();
      long long v29 = [v28 identifier:@"SwitcherZoomingPresentation"];
      long long v30 = [v29 priority:40];
      long long v31 = [v30 transitionModifiers:16];
      long long v43 = v46;
      long long v44 = v47;
      long long v45 = v48;
      long long v32 = [v31 transitionInputs:&v43];
      [(CSAppearance *)v27 addComponent:v32];

      long long v33 = self->_localAppearance;
      long long v34 = objc_opt_new();
      v35 = [v34 identifier:@"SwitcherZoomingPresentation"];
      id v36 = [v35 priority:40];
      v37 = [v36 transitionModifiers:16];
      long long v43 = v46;
      long long v44 = v47;
      long long v45 = v48;
      v38 = [v37 transitionInputs:&v43];
      [(CSAppearance *)v33 addComponent:v38];

      long long v12 = v40;
    }
    BOOL v39 = objc_msgSend(v12, "BSAnimationSettings", v40);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __63__CSCoverSheetViewController_setScale_behaviorMode_completion___block_invoke;
    v41[3] = &unk_1E6AD8B48;
    id v42 = v8;
    [(CSCoverSheetViewController *)self updateAppearanceForController:self withAnimationSettings:v39 completion:v41];
  }
}

uint64_t __63__CSCoverSheetViewController_setScale_behaviorMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)registerExternalAppearanceProvider:(id)a3
{
  externalAppearanceProviders = self->_externalAppearanceProviders;
  id v5 = a3;
  [(NSHashTable *)externalAppearanceProviders addObject:v5];
  id v6 = [v5 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v6];
}

- (void)unregisterExternalAppearanceProvider:(id)a3
{
  externalAppearanceProviders = self->_externalAppearanceProviders;
  id v5 = a3;
  [(NSHashTable *)externalAppearanceProviders removeObject:v5];
  id v6 = [v5 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v6];
}

- (void)registerExternalBehaviorProvider:(id)a3
{
  externalBehaviorProviders = self->_externalBehaviorProviders;
  id v5 = a3;
  [(NSHashTable *)externalBehaviorProviders addObject:v5];
  id v6 = [v5 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v6];
}

- (void)unregisterExternalBehaviorProvider:(id)a3
{
  externalBehaviorProviders = self->_externalBehaviorProviders;
  id v5 = a3;
  [(NSHashTable *)externalBehaviorProviders removeObject:v5];
  id v6 = [v5 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v6];
}

- (void)registerExternalEventHandler:(id)a3
{
}

- (void)unregisterExternalEventHandler:(id)a3
{
}

- (void)registerExternalLockProvider:(id)a3
{
}

- (void)externalLockProviderStateChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 coverSheetViewControllerExternalLockProviderStateDidChange:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)unregisterExternalLockProvider:(id)a3
{
}

- (void)registerExternalPresentationProvider:(id)a3
{
  externalPresentationProviders = self->_externalPresentationProviders;
  id v5 = a3;
  [(NSHashTable *)externalPresentationProviders addObject:v5];
  uint64_t v6 = [(CSCoverSheetViewController *)self visiblePageViewController];
  [v6 updatePresentationAnimated:1];

  id v7 = [v5 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v7];
}

- (void)externalPresentationProviderPresentationChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSCoverSheetViewController *)self visiblePageViewController];
  [v5 updatePresentationAnimated:1];

  id v6 = [v4 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v6];
}

- (void)unregisterExternalPresentationProvider:(id)a3
{
  externalPresentationProviders = self->_externalPresentationProviders;
  id v5 = a3;
  [(NSHashTable *)externalPresentationProviders removeObject:v5];
  id v6 = [(CSCoverSheetViewController *)self visiblePageViewController];
  [v6 updatePresentationAnimated:1];

  id v7 = [v5 coverSheetIdentifier];

  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v7];
}

- (void)addCoverSheetObserver:(id)a3
{
  id v7 = a3;
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:"))
  {
    observers = self->_observers;
    if (!observers)
    {
      id v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v6 = self->_observers;
      self->_observers = v5;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v7];
  }
}

- (void)removeCoverSheetObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:")) {
    [(NSHashTable *)self->_observers removeObject:v4];
  }
}

- (void)loadView
{
  BOOL v3 = [CSCoverSheetView alloc];
  id v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  uint64_t v9 = -[CSCoverSheetView initWithFrame:](v3, "initWithFrame:");

  [(CSCoverSheetView *)v9 setAutoresizingMask:18];
  [(CSCoverSheetView *)v9 setAutoresizesSubviews:1];
  id v5 = [(CSCoverSheetView *)v9 layer];
  [v5 setHitTestsAsOpaque:1];

  [(CSCoverSheetView *)v9 setLayoutStrategy:self->_layoutStrategy];
  [(CSCoverSheetView *)v9 _setLockScreenDefaults:self->_lockScreenDefaults];
  id v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext homeScreenOverlayProvider];
  LODWORD(v4) = [v6 wantsHomeScreenOverlay];

  if (v4)
  {
    id v7 = [(CSCoverSheetView *)v9 scrollView];
    uint64_t v8 = [v7 panGestureRecognizer];
    [v8 addTarget:self action:sel_scrollPanGestureDidUpdate_];

    [(CSCoverSheetView *)v9 setIgnoresOverscrollOnMainPage:1];
  }
  [(CSCoverSheetViewController *)self setActiveAppearance:0];
  [(CSCoverSheetViewController *)self setView:v9];
  [(CSCoverSheetView *)v9 setDelegate:self];
}

- (void)viewDidLoad
{
  v112[1] = *MEMORY[0x1E4F143B8];
  v111.receiver = self;
  v111.super_class = (Class)CSCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v111 viewDidLoad];
  CFPreferencesSetAppValue(@"SBIconVisibility", MEMORY[0x1E4F1CC38], @"com.apple.springboard.SensitiveUIModule");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
  [(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource cancelTransition];
  self->_transitionType = 0;
  [(CSCoverSheetViewController *)self setCurrentTransitionSource:0];
  id v4 = [(CSCoverSheetViewController *)self coverSheetView];
  if ([(CSCoverSheetViewController *)self _shouldLoadComplications])
  {
    id v5 = [CSComplicationManager alloc];
    id v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext applicationInformer];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetURLHandler);
    uint64_t v8 = [(CSComplicationManager *)v5 initWithApplicationInformer:v6 urlHandler:WeakRetained];
    complicationManager = self->_complicationManager;
    self->_complicationManager = v8;

    long long v10 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
    {
      long long v12 = [CSWidgetGridViewController alloc];
      long long v13 = self->_complicationManager;
      long long v14 = [(CSCoverSheetContextProviding *)self->_coverSheetContext applicationInformer];
      uint64_t v15 = [(CSWidgetGridViewController *)v12 initWithComplicationManager:v13 type:1 applicationInformer:v14];
      sidebarComplicationContainerViewController = self->_sidebarComplicationContainerViewController;
      self->_sidebarComplicationContainerViewController = v15;

      [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController setDelegate:self];
    }
    uint64_t v17 = [CSWidgetGridViewController alloc];
    id v18 = self->_complicationManager;
    uint64_t v19 = [(CSCoverSheetContextProviding *)self->_coverSheetContext applicationInformer];
    uint64_t v20 = [(CSWidgetGridViewController *)v17 initWithComplicationManager:v18 type:0 applicationInformer:v19];
    complicationContainerViewController = self->_complicationContainerViewController;
    self->_complicationContainerViewController = v20;

    [(CSWidgetGridViewController *)self->_complicationContainerViewController setDelegate:self];
    objc_initWeak(&location, self);
    double v22 = self->_complicationManager;
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke;
    v108[3] = &unk_1E6AD8C10;
    objc_copyWeak(&v109, &location);
    [(CSComplicationManager *)v22 setOnWidgetUpdate:v108];
    v23 = self->_complicationManager;
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_2;
    v106[3] = &unk_1E6AD8C10;
    objc_copyWeak(&v107, &location);
    [(CSComplicationManager *)v23 setOnSidebarWidgetUpdate:v106];
    id v24 = self->_complicationManager;
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_2_166;
    v104[3] = &unk_1E6AD8C38;
    objc_copyWeak(&v105, &location);
    [(CSComplicationManager *)v24 setOnInlineComplicationUpdate:v104];
    objc_destroyWeak(&v105);
    objc_destroyWeak(&v107);
    objc_destroyWeak(&v109);
    objc_destroyWeak(&location);
  }
  if (self->_dateViewController)
  {
    id v84 = [MEMORY[0x1E4F28B00] currentHandler];
    [v84 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:1400 description:@"We never cleaned up the old _dateViewController"];
  }
  id v25 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E4FA5F60]);
  dateViewController = self->_dateViewController;
  self->_dateViewController = v25;

  [(SBFLockScreenDateViewController *)self->_dateViewController setShouldApplyVibrancyToComplications:1];
  [(SBFLockScreenDateViewController *)self->_dateViewController setComplicationContainerViewController:self->_complicationContainerViewController];
  long long v27 = self->_dateViewController;
  double v28 = [(CSCoverSheetContextProviding *)self->_coverSheetContext dateProvider];
  [(SBFLockScreenDateViewController *)v27 setDateProvider:v28];

  long long v29 = self->_dateViewController;
  long long v30 = [(CSCoverSheetViewController *)self activeAppearance];
  long long v31 = [v30 legibilitySettings];
  [(SBFLockScreenDateViewController *)v29 setLegibilitySettings:v31];

  long long v32 = self->_dateViewController;
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_172;
  v101[3] = &unk_1E6AD8AF8;
  id v33 = v4;
  id v102 = v33;
  uint64_t v103 = self;
  [(CSCoverSheetViewController *)self bs_addChildViewController:v32 animated:0 transitionBlock:v101];
  defaultsDerivedOverrideDate = self->_defaultsDerivedOverrideDate;
  self->_defaultsDerivedOverrideDate = 0;

  [(CSCoverSheetViewController *)self _updateOverrideDateIfNeeded];
  v35 = objc_alloc_init(CSFixedFooterViewController);
  fixedFooterViewController = self->_fixedFooterViewController;
  self->_fixedFooterViewController = v35;

  v37 = self->_fixedFooterViewController;
  v38 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
  [(CSFixedFooterViewController *)v37 setAuthenticationStatusProvider:v38];

  BOOL v39 = self->_fixedFooterViewController;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_2_175;
  v98[3] = &unk_1E6AD8AF8;
  id v40 = v33;
  id v99 = v40;
  id v100 = self;
  [(CSCoverSheetViewController *)self bs_addChildViewController:v39 animated:0 transitionBlock:v98];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v41 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v42 = [v41 userInterfaceIdiom] == 1;

  if (v42)
  {
LABEL_12:
    long long v43 = self->_sidebarComplicationContainerViewController;
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_3;
    v95[3] = &unk_1E6AD8AF8;
    id v96 = v40;
    id v97 = self;
    [(CSCoverSheetViewController *)self bs_addChildViewController:v43 animated:0 transitionBlock:v95];
  }
LABEL_13:
  long long v44 = [(CSCoverSheetContextProviding *)self->_coverSheetContext biometricResource];
  if (SBFEffectiveHomeButtonType() == 2
    || ([MEMORY[0x1E4F42948] currentDevice],
        long long v45 = objc_claimAutoreleasedReturnValue(),
        uint64_t v46 = [v45 userInterfaceIdiom],
        v45,
        (v46 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    long long v47 = [[CSTeachableMomentsContainerViewController alloc] initWithCoverSheetContext:self->_coverSheetContext];
    teachableMomentsContainerViewController = self->_teachableMomentsContainerViewController;
    self->_teachableMomentsContainerViewController = v47;

    [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController setBiometricResource:v44];
    int v49 = self->_teachableMomentsContainerViewController;
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_4;
    v92[3] = &unk_1E6AD8AF8;
    id v93 = v40;
    BOOL v94 = self;
    [(CSCoverSheetViewController *)self bs_addChildViewController:v49 animated:0 transitionBlock:v92];
  }
  int v50 = [[CSUserPresenceMonitor alloc] initWithBiometricResource:v44];
  userPresenceMonitor = self->_userPresenceMonitor;
  self->_userPresenceMonitor = v50;

  [(CSMainPageContentViewController *)self->_mainPageContentViewController setUserPresenceMonitor:self->_userPresenceMonitor];
  uint64_t v52 = objc_alloc_init(CSFaceOcclusionMonitor);
  faceOcclusionMonitor = self->_faceOcclusionMonitor;
  self->_faceOcclusionMonitor = v52;

  double v54 = [CSQuickActionsViewController alloc];
  lockScreenDefaults = self->_lockScreenDefaults;
  double v56 = [(CSCoverSheetContextProviding *)self->_coverSheetContext applicationInformer];
  double v57 = [(CSQuickActionsViewController *)v54 initWithLockScreenDefaults:lockScreenDefaults applicationInformer:v56];
  quickActionsViewController = self->_quickActionsViewController;
  self->_quickActionsViewController = v57;

  [(CSQuickActionsViewController *)self->_quickActionsViewController setCameraPrewarmer:self->_cameraPrewarmer];
  [(CSQuickActionsViewController *)self->_quickActionsViewController setLockOutController:self->_lockOutController];
  [(CSCoverSheetViewController *)self updateQuickActionsVisibility];
  if ([v44 hasPearlSupport]) {
    int v59 = 1;
  }
  else {
    int v59 = MGGetBoolAnswer();
  }
  int v60 = [v44 hasPoseidonSupport];
  uint64_t v61 = SBFEffectiveArtworkSubtype();
  int v62 = v59 | v60;
  char v63 = 1;
  if (v61 <= 2795)
  {
    if (v61 != 2556 && v61 != 2622) {
      goto LABEL_32;
    }
LABEL_25:
    if (!v62) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v61 == 2796 || v61 == 2868) {
    goto LABEL_25;
  }
LABEL_32:
  char v63 = 0;
  if (v62)
  {
LABEL_26:
    char v64 = objc_alloc_init(CSProudLockViewController);
    proudLockViewController = self->_proudLockViewController;
    self->_proudLockViewController = v64;

    BOOL v66 = self->_proudLockViewController;
    BOOL v67 = [MEMORY[0x1E4FA7C68] sharedInstance];
    [(CSProudLockViewController *)v66 setBiometricResource:v67];

    v68 = self->_proudLockViewController;
    id v69 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
    [(CSProudLockViewController *)v68 setAuthenticationStatusProvider:v69];

    [(CSProudLockViewController *)self->_proudLockViewController setDelegate:self];
    id v70 = self->_proudLockViewController;
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_5;
    v89[3] = &unk_1E6AD8C60;
    v89[4] = self;
    char v91 = v63;
    id v90 = v40;
    [(CSCoverSheetViewController *)self bs_addChildViewController:v70 animated:0 transitionBlock:v89];
  }
LABEL_27:
  self->_wantsStatusBarLockItemDisabled = v62;
  if ((v63 & 1) == 0)
  {
    uint64_t v71 = [(CSProudLockViewController *)self->_proudLockViewController cameraCoveredView];
    [v40 setCameraCoveredView:v71];
  }
  if (v60)
  {
    v72 = objc_alloc_init(CSPoseidonViewController);
    poseidonViewController = self->_poseidonViewController;
    self->_poseidonViewController = v72;

    uint64_t v74 = self->_poseidonViewController;
    BOOL v75 = [(CSCoverSheetContextProviding *)self->_coverSheetContext biometricResource];
    [(CSPoseidonViewController *)v74 setBiometricResource:v75];

    unsigned int v76 = self->_poseidonViewController;
    id v77 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
    [(CSPoseidonViewController *)v76 setAuthenticationStatusProvider:v77];

    v78 = self->_poseidonViewController;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __41__CSCoverSheetViewController_viewDidLoad__block_invoke_6;
    v86[3] = &unk_1E6AD8AF8;
    id v87 = v40;
    v88 = self;
    [(CSCoverSheetViewController *)self bs_addChildViewController:v78 animated:0 transitionBlock:v86];
  }
  id v79 = objc_alloc(MEMORY[0x1E4F43028]);
  [v40 bounds];
  id v80 = objc_msgSend(v79, "initWithFrame:");
  [v80 setAutoresizingMask:18];
  [(SBFLegacyWallpaperWakeAnimator *)self->_legacyWallpaperWakeAnimator setWakeEffectView:v80];
  [v40 setWakeEffectView:v80];
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"ViewDidLoad"];
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"ViewDidLoad"];
  [(CSCoverSheetViewController *)self _loadViewsForRestrictedPagesIfPossible];
  [v40 resetScrollViewToMainPageAnimated:0 withCompletion:0];
  id v81 = self;
  v112[0] = v81;
  id v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:1];
  id v83 = (id)[(CSCoverSheetViewController *)self registerForTraitChanges:v82 withHandler:&__block_literal_global_194];
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SBLogDashBoard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Received portrait widget update: %@", (uint8_t *)&v15, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = objc_msgSend(v5, "bs_map:", &__block_literal_global_2);
    [WeakRetained[257] setComplicationDescriptors:v9 iconLayout:v6];
    if ([v5 count])
    {
      [WeakRetained dateBaselineToComplicationY];
      double v11 = v10;
      [getCSProminentLayoutControllerClass() boundsForElements:8];
      double v13 = v11 + v12;
    }
    else
    {
      double v13 = 0.0;
    }
    *((double *)WeakRetained + 202) = v13;
    [WeakRetained[197] hostDidChangeContentBounds];
    long long v14 = [WeakRetained[246] combinedListViewController];
    [v14 layoutListView];
  }
}

id __41__CSCoverSheetViewController_viewDidLoad__block_invoke_159(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F92560];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 uniqueIdentifier];
  id v6 = [v3 widget];

  id v7 = (void *)[v4 initWithUniqueIdentifier:v5 widget:v6 suggestedComplication:0];

  return v7;
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SBLogDashBoard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Received sidebar widget update: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = objc_msgSend(v5, "bs_map:", &__block_literal_global_165);
    [WeakRetained[258] setComplicationDescriptors:v9 iconLayout:v6];
  }
}

id __41__CSCoverSheetViewController_viewDidLoad__block_invoke_163(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F92560];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 uniqueIdentifier];
  id v6 = [v3 widget];

  id v7 = (void *)[v4 initWithUniqueIdentifier:v5 widget:v6 suggestedComplication:0];

  return v7;
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_2_166(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SBLogDashBoard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Received inline widget update: %@ / %@", (uint8_t *)&v12, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = (void *)WeakRetained[219];
  WeakRetained[219] = v5;
  id v10 = v5;

  id v11 = (void *)WeakRetained[220];
  WeakRetained[220] = v6;

  [WeakRetained _validateAndUpdateInlineComplication];
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_172(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 2032);
  id v5 = a2;
  id v4 = [v3 dateView];
  [v2 setDateView:v4];

  v5[2]();
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_2_175(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 1360);
  id v5 = a2;
  id v4 = [v3 fixedFooterView];
  [v2 setFixedFooterView:v4];

  v5[2]();
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 2064);
  id v5 = a2;
  id v4 = [v3 view];
  [v2 setSidebarComplicationContainerView:v4];

  v5[2]();
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 1392);
  id v5 = a2;
  id v4 = [v3 teachableMomentsContainerView];
  [v2 setTeachableMomentsContainerView:v4];

  v5[2]();
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1368);
  id v4 = a2;
  id v5 = [v3 view];
  [v5 setHidden:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) setProudLockContainerView:v5];
  v4[2](v4);
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 1384);
  id v5 = a2;
  id v4 = [v3 view];
  [v2 setPoseidonContainerView:v4];

  v5[2]();
}

void __41__CSCoverSheetViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  BOOL v4 = [a3 _backlightLuminance] != 1;
  id v5 = [v7 traitCollection];
  uint64_t v6 = [v5 _backlightLuminance];

  if (((v4 ^ (v6 == 1)) & 1) == 0) {
    [v7 _updateAppearanceForAODTransitionToInactive:v6 == 1];
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)sendAppearanceTransitionForChildViewControllers
{
  return 0;
}

- (void)updateQuickActionsVisibility
{
  if (self->_quickActionsViewController)
  {
    if ([(CSCoverSheetViewController *)self _quickActionsSupported])
    {
      id v3 = [(CSCoverSheetViewController *)self childViewControllers];
      char v4 = [v3 containsObject:self->_quickActionsViewController];

      if ((v4 & 1) == 0)
      {
        quickActionsViewController = self->_quickActionsViewController;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __58__CSCoverSheetViewController_updateQuickActionsVisibility__block_invoke;
        v8[3] = &unk_1E6AD8820;
        v8[4] = self;
        [(CSCoverSheetViewController *)self bs_addChildViewController:quickActionsViewController animated:0 transitionBlock:v8];
      }
    }
    else
    {
      uint64_t v6 = [(CSQuickActionsViewController *)self->_quickActionsViewController parentViewController];

      if (v6)
      {
        id v7 = self->_quickActionsViewController;
        [(CSCoverSheetViewController *)self bs_removeChildViewController:v7];
      }
    }
  }
}

uint64_t __58__CSCoverSheetViewController_updateQuickActionsVisibility__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coverSheetView];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1408) quickActionsView];
  [v2 setQuickActionsView:v3];

  char v4 = *(void **)(*(void *)(a1 + 32) + 1408);

  return objc_msgSend(v4, "setCoverSheetViewController:");
}

- (void)_prepareForViewWillAppearIfNecessary
{
  if (!self->_lastAppearState)
  {
    id v3 = [(CSCoverSheetViewController *)self coverSheetView];
    [v3 viewControllerWillAppear];

    [(CSCoverSheetViewController *)self setActiveAppearance:0];
    [(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource cancelTransition];
    self->_transitionType = 0;
    [(CSCoverSheetViewController *)self setCurrentTransitionSource:0];
    id v6 = [(CSCoverSheetViewController *)self coverSheetView];
    char v4 = [[CSScrollGestureController alloc] initWithScrollableView:v6];
    scrollGestureController = self->_scrollGestureController;
    self->_scrollGestureController = v4;

    [(CSScrollGestureController *)self->_scrollGestureController setDelegate:self];
    [(CSCoverSheetViewController *)self _loadViewsForRestrictedPagesIfPossible];
    [v6 resetScrollViewToMainPageAnimated:0 withCompletion:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSCoverSheetViewController *)self _prepareForViewWillAppearIfNecessary];
  v6.receiver = self;
  v6.super_class = (Class)CSCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewWillAppear:v3];
  [(CSCoverSheetViewController *)self _handleEventType:3];
  [(CSCoverSheetViewController *)self updateQuickActionsVisibility];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_dateViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_fixedFooterViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_teachableMomentsContainerViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_inlineComplicationContainerViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_landscapeInlineComplicationContainerViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_complicationContainerViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_sidebarComplicationContainerViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_backgroundContentViewController toVisible:1 animated:v3];
  if ([(CSCoverSheetViewController *)self _quickActionsSupported]) {
    [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_quickActionsViewController toVisible:1 animated:v3];
  }
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_proudLockViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_poseidonViewController toVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self _beginAppearanceTransitionForPageViewControllersToVisible:1 animated:v3];
  [(CSCoverSheetViewController *)self noteDeviceBlockedStatusUpdated];
  [(CSCoverSheetViewController *)self _updateScrollingBehavior];
  [(CSCoverSheetViewController *)self _updateAppearanceForTransitionToOrientation:[(CSCoverSheetViewController *)self interfaceOrientation]];
  [(CSCoverSheetViewController *)self _calculateAppearanceForCurrentOrientation];
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"viewWillAppear"];
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"viewWillAppear"];
  [(CSCoverSheetViewController *)self _addOrRemoveRemoteContentViewIfNecessaryMaintainingState:1];
  [(CSCoverSheetViewController *)self _displayWillAppearImplementation];
  [(CSCoverSheetViewController *)self _sendAuthenticationChangedEvent];
  [(CSCoverSheetViewController *)self setPasscodeLockVisible:0 animated:v3];
  self->_lastAppearState = [(CSCoverSheetViewController *)self _appearState];
  [(CSCoverSheetViewController *)self _setDismissed:0];
  id v5 = [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController hostViewController];
  [v5 hostDidChangeContentBounds];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidAppear:a3];
  [(CSCoverSheetViewController *)self _handleEventType:4];
  [(CSCoverSheetViewController *)self _setupWallpaperGesture];
  [(CSCoverSheetViewController *)self _setupBackgroundContentGestureRecognizer];
  [(CSCoverSheetViewController *)self _setupQuickNoteGestureRecognizer];
  [(CSCoverSheetViewController *)self _setupPosterSwitcherGestureRecognizer];
  [(CSCoverSheetViewController *)self _setupComplicationSelectionGestureRecognizer];
  [(CSCoverSheetViewController *)self _setupSearchGesture];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_dateViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_fixedFooterViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_teachableMomentsContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_inlineComplicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_landscapeInlineComplicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_complicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_sidebarComplicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_backgroundContentViewController];
  if ([(CSCoverSheetViewController *)self _quickActionsSupported]) {
    [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_quickActionsViewController];
  }
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_proudLockViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_poseidonViewController];
  [(CSCoverSheetViewController *)self _endAppearanceTransitionForPageViewControllersToVisible:1];
  self->_statusBarInLockdownForTeardown = 0;
  [(CSNotificationClearingTrigger *)self->_notificationClearingTrigger setUiLocked:1];
  self->_lastAppearState = [(CSCoverSheetViewController *)self _appearState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CSCoverSheetViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(CSCoverSheetViewController *)self _handleEventType:5];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_dateViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_fixedFooterViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_teachableMomentsContainerViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_inlineComplicationContainerViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_landscapeInlineComplicationContainerViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_complicationContainerViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_sidebarComplicationContainerViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_backgroundContentViewController toVisible:0 animated:v3];
  if ([(CSCoverSheetViewController *)self _quickActionsSupported]) {
    [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_quickActionsViewController toVisible:0 animated:v3];
  }
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_proudLockViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_poseidonViewController toVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self _beginAppearanceTransitionForPageViewControllersToVisible:0 animated:v3];
  [(CSCoverSheetViewController *)self _displayWillDisappearImplementation];
  self->_lastAppearState = [(CSCoverSheetViewController *)self _appearState];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource cancelTransition];
  v6.receiver = self;
  v6.super_class = (Class)CSCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:v3];
  [(CSCoverSheetViewController *)self _handleEventType:6];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_dateViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_fixedFooterViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_teachableMomentsContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_inlineComplicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_landscapeInlineComplicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_complicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_sidebarComplicationContainerViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_backgroundContentViewController];
  if ([(CSCoverSheetViewController *)self _quickActionsSupported]) {
    [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_quickActionsViewController];
  }
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_proudLockViewController];
  [(CSCoverSheetViewController *)self bs_endAppearanceTransitionForChildViewController:self->_poseidonViewController];
  [(CSCoverSheetViewController *)self _endAppearanceTransitionForPageViewControllersToVisible:0];
  [(BCBatteryDeviceController *)self->_batteryDeviceController removeBatteryDeviceObserver:self];
  [(CSCoverSheetViewController *)self _displayDidDisappearImplementation];
  objc_super v5 = [(CSCoverSheetViewController *)self coverSheetView];
  [v5 removeContentView];

  [(CSCoverSheetViewController *)self _clearChargingModalStateIfNecessary];
  [(CSCoverSheetViewController *)self _updateWallpaperFloatingLayerContainerView];
  self->_statusBarInLockdownForTeardown = 0;
  if ([(CSCoverSheetViewController *)self _isPresentingDismissableRemoteContent])
  {
    [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:7];
  }
  self->_lastAppearState = [(CSCoverSheetViewController *)self _appearState];
  [(CSCoverSheetViewController *)self _setDismissed:1];
  if ([(CSCoverSheetViewController *)self _isShowingInlineContent]) {
    [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleForInlineContent];
  }
}

- (void)presentModalViewController:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 animated:(BOOL)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:1722 description:@"DashBoard does not support modal view controller presentations."];
}

- (void)presentModalViewController:(id)a3 withTransition:(int)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, *(void *)&a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:1726 description:@"DashBoard does not support modal view controller presentations."];
}

- (void):(id)a3 withTransition:(int)a4 completion:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, *(void *)&a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:1730 description:@"DashBoard does not support modal view controller presentations."];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_shouldLoadComplications
{
  int v2 = CSAutobahnEnabledForPlatform();
  if (v2)
  {
    LOBYTE(v2) = CSFeatureEnabled(4);
  }
  return v2;
}

- (void)setHidesDimmingLayer:(BOOL)a3
{
  if (self->_hidesDimmingLayer != a3)
  {
    BOOL v3 = a3;
    self->_hidesDimmingLayer = a3;
    [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"HidesDimmingLayer"];
    if (v3)
    {
      objc_super v5 = +[CSComponent dimmingLayer];
      id v6 = [v5 identifier:@"HidesDimmingLayer"];

      [v6 setHidden:1];
      [(CSAppearance *)self->_localAppearance addComponent:v6];
    }
    [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"HidesDimmingLayer"];
  }
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  int v2 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  BOOL v3 = [v2 audioCategoriesDisablingVolumeHUD];

  return (NSSet *)v3;
}

- (void)_updateAppearanceForAODTransitionToInactive:(BOOL)a3
{
  uint64_t v3 = 98;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__CSCoverSheetViewController__updateAppearanceForAODTransitionToInactive___block_invoke;
  v4[3] = &unk_1E6AD8CD0;
  if (a3) {
    uint64_t v3 = 96;
  }
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:v3 delay:v4 options:0 mass:0.9 stiffness:0.0 damping:1.0 initialVelocity:130.507 animations:32.319 completion:0.0];
}

uint64_t __74__CSCoverSheetViewController__updateAppearanceForAODTransitionToInactive___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 1704);
  [*(id *)(*(void *)(a1 + 32) + 2016) setLegibilitySettings:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(v2 + 2016) removeAllComponentsWithIdentifier:@"_UIBacklightLuminance"];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v98 = 0u;
    [MEMORY[0x1E4F42FF0] inheritedAnimationDuration];
    CSComponentTransitionInputsMake(0, (uint64_t)&v98, v3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.97, 10.0);
    objc_super v4 = *(void **)(*(void *)(a1 + 32) + 2016);
    BOOL v5 = objc_opt_new();
    id v6 = [v5 identifier:@"_UIBacklightLuminance"];
    id v7 = [v6 fakeStatusBar:1];
    id v8 = [v7 priority:80];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    uint64_t v9 = [v8 transitionInputs:&v95];
    [v4 addComponent:v9];

    [*(id *)(a1 + 32) _updateActiveAppearanceForReason:@"_UIBacklightLuminance"];
    id v10 = *(void **)(*(void *)(a1 + 32) + 2016);
    id v11 = objc_opt_new();
    int v12 = [v11 viewStyle:3];
    id v13 = [v12 identifier:@"_UIBacklightLuminance"];
    __int16 v14 = [*(id *)(*(void *)(a1 + 32) + 1048) touchEnvironmentStatusProvider];
    id v15 = objc_msgSend(v13, "hidden:", objc_msgSend(v14, "tapToWakeEnabled") ^ 1);
    uint64_t v16 = [v15 priority:80];
    [v10 addComponent:v16];

    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 2016);
    id v18 = objc_opt_new();
    uint64_t v19 = [v18 hidden:1];
    uint64_t v20 = [v19 identifier:@"_UIBacklightLuminance"];
    uint64_t v21 = [v20 priority:80];
    double v22 = [v21 transitionModifiers:48];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    v23 = [v22 transitionInputs:&v95];
    [v17 addComponent:v23];

    id v24 = *(void **)(*(void *)(a1 + 32) + 2016);
    id v25 = objc_opt_new();
    id v26 = [v25 hidden:1];
    long long v27 = [v26 identifier:@"_UIBacklightLuminance"];
    double v28 = [v27 priority:80];
    long long v29 = [v28 transitionModifiers:48];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    long long v30 = [v29 transitionInputs:&v95];
    [v24 addComponent:v30];

    long long v31 = *(void **)(*(void *)(a1 + 32) + 2016);
    long long v32 = objc_opt_new();
    id v33 = [v32 hidden:1];
    long long v34 = [v33 identifier:@"_UIBacklightLuminance"];
    v35 = [v34 fakeStatusBar:1];
    id v36 = [v35 priority:80];
    v37 = [v36 transitionModifiers:48];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    v38 = [v37 transitionInputs:&v95];
    [v31 addComponent:v38];

    BOOL v39 = *(void **)(*(void *)(a1 + 32) + 2016);
    id v40 = objc_opt_new();
    id v41 = [v40 identifier:@"_UIBacklightLuminance"];
    BOOL v42 = [v41 priority:80];
    long long v43 = [v42 transitionModifiers:16];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    long long v44 = [v43 transitionInputs:&v95];
    [v39 addComponent:v44];

    long long v45 = *(void **)(*(void *)(a1 + 32) + 2016);
    uint64_t v46 = objc_opt_new();
    long long v47 = [v46 identifier:@"_UIBacklightLuminance"];
    long long v48 = [v47 priority:80];
    int v49 = [v48 transitionModifiers:16];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    int v50 = [v49 transitionInputs:&v95];
    [v45 addComponent:v50];

    int v51 = *(void **)(*(void *)(a1 + 32) + 2016);
    uint64_t v52 = objc_opt_new();
    uint64_t v53 = [v52 identifier:@"_UIBacklightLuminance"];
    double v54 = [v53 priority:80];
    double v55 = [v54 transitionModifiers:16];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    double v56 = [v55 transitionInputs:&v95];
    [v51 addComponent:v56];

    double v57 = *(void **)(*(void *)(a1 + 32) + 2016);
    double v58 = objc_opt_new();
    int v59 = [v58 identifier:@"_UIBacklightLuminance"];
    int v60 = [v59 priority:80];
    uint64_t v61 = [v60 transitionModifiers:16];
    long long v95 = v98;
    long long v96 = v99;
    long long v97 = v100;
    int v62 = [v61 transitionInputs:&v95];
    [v57 addComponent:v62];

    if (([*(id *)(*(void *)(a1 + 32) + 1544) showWallpaperInAlwaysOn] & 1) == 0)
    {
      char v63 = *(void **)(*(void *)(a1 + 32) + 2016);
      char v64 = objc_opt_new();
      BOOL v65 = [v64 identifier:@"_UIBacklightLuminance"];
      BOOL v66 = [v65 priority:80];
      BOOL v67 = [v66 style:&unk_1F306BDD0];
      v68 = [MEMORY[0x1E4F428B8] blackColor];
      id v69 = [v67 color:v68];
      [v63 addComponent:v69];

      id v70 = *(void **)(*(void *)(a1 + 32) + 2016);
      id v71 = objc_alloc(MEMORY[0x1E4F43228]);
      v72 = [MEMORY[0x1E4F428B8] whiteColor];
      uint64_t v73 = (void *)[v71 initWithStyle:1 contentColor:v72];
      [v70 setLegibilitySettings:v73];
    }
    uint64_t v74 = [*(id *)(*(void *)(a1 + 32) + 1968) combinedListViewController];
    objc_msgSend(v74, "setShowNotificationsInAlwaysOn:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1544), "showNotificationsInAlwaysOn"));

    BOOL v75 = [*(id *)(a1 + 32) coverSheetView];
    [v75 addContentView];
  }
  else
  {
    char v76 = [*(id *)(v2 + 1544) showWallpaperInAlwaysOn];
    char v77 = [*(id *)(a1 + 32) isDepthEffectEnabled];
    char v78 = [*(id *)(a1 + 32) isFloatingLayerFullscreen];
    if ((v76 & 1) == 0 && (v77 & 1) == 0 && (v78 & 1) == 0)
    {
      id v79 = *(void **)(*(void *)(a1 + 32) + 2016);
      id v80 = [v79 componentForType:19 identifier:@"_UIBacklightLuminance"];
      [v79 removeComponent:v80];

      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __74__CSCoverSheetViewController__updateAppearanceForAODTransitionToInactive___block_invoke_2;
      v93[3] = &unk_1E6AD88C0;
      v93[4] = *(void *)(a1 + 32);
      BOOL v94 = @"_UIBacklightLuminance";
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v93];
    }
    [*(id *)(*(void *)(a1 + 32) + 2016) removeAllComponentsWithIdentifier:@"_UIBacklightLuminance"];
    id v81 = *(void **)(*(void *)(a1 + 32) + 2016);
    id v82 = objc_opt_new();
    id v83 = [v82 identifier:@"_UIBacklightLuminance"];
    id v84 = [v83 hidden:0];
    id v85 = [v84 fakeStatusBar:1];
    long long v86 = [v85 priority:80];
    [v81 addComponent:v86];

    uint64_t v87 = *(void *)(a1 + 32);
    uint64_t v88 = *(void *)(v87 + 1704);
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __74__CSCoverSheetViewController__updateAppearanceForAODTransitionToInactive___block_invoke_3;
    v90[3] = &unk_1E6AD8CA8;
    char v91 = @"_UIBacklightLuminance";
    uint64_t v92 = v88;
    v90[4] = v87;
    [MEMORY[0x1E4F4F898] addAlongsideAnimations:0 completion:v90];
  }
  return [*(id *)(a1 + 32) _updateActiveAppearanceForReason:@"_UIBacklightLuminance"];
}

uint64_t __74__CSCoverSheetViewController__updateAppearanceForAODTransitionToInactive___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveAppearanceForReason:*(void *)(a1 + 40)];
}

void __74__CSCoverSheetViewController__updateAppearanceForAODTransitionToInactive___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coverSheetView];
  [v2 foregroundViewPositionOffset];
  int IsZero = BSFloatIsZero();

  if (IsZero)
  {
    objc_super v4 = [*(id *)(a1 + 32) coverSheetView];
    [v4 removeContentView];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 48) == *(void *)(v5 + 1704))
  {
    id v6 = *(void **)(v5 + 2016);
    uint64_t v7 = *(void *)(a1 + 40);
    [v6 removeAllComponentsWithIdentifier:v7];
  }
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  uint64_t v5 = [(CSCoverSheetViewController *)self activeAppearance];
  [v5 flagForComponentType:26];
  int IsYes = BSSettingFlagIsYes();

  if (a3)
  {
    if (IsYes) {
      a3->var6 = 0;
    }
  }
}

- (BOOL)shouldAutorotate
{
  double v3 = [(CSCoverSheetViewController *)self delegate];
  char v4 = [v3 coverSheetViewControllerTraitsArbiterOrientationActuationEnabled:self];

  if (v4) {
    return 1;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return 0;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 != 1) {
      return 0;
    }
  }
  return ![(CSCoverSheetViewController *)self isTransitioningInteractively];
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if (![(CSCoverSheetViewController *)self shouldAutorotate]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewController;
  return [(CSCoverSheetViewController *)&v4 preferredInterfaceOrientationForPresentation];
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v4 = [(CSCoverSheetViewController *)self delegate];
  char v5 = [v4 coverSheetViewControllerTraitsArbiterOrientationActuationEnabled:self];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained coverSheetViewControllerShouldPreserveOrientationForExternalTransition:self])
    {
LABEL_3:
      uint64_t v7 = [(CSCoverSheetViewController *)self coverSheetView];
      id v8 = [v7 window];
      [v8 interfaceOrientation];
      unint64_t v9 = XBInterfaceOrientationMaskForInterfaceOrientation();

LABEL_4:
      return v9;
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2
        && ![WeakRetained coverSheetViewControllerHasBeenDismissedSinceKeybagLock:self])
      {
        goto LABEL_28;
      }
    }
    else
    {
      id v15 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v15 userInterfaceIdiom] == 1)
      {
      }
      else
      {
        uint64_t v2 = [WeakRetained coverSheetViewControllerHasBeenDismissedSinceKeybagLock:self];

        if ((v2 & 1) == 0)
        {
LABEL_28:
          unint64_t v9 = 2;
          goto LABEL_4;
        }
      }
    }
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      if (SBFEffectiveDeviceClass() == 2) {
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(id)v2 userInterfaceIdiom] == 1)
      {

        goto LABEL_30;
      }
    }
    id v18 = [(CSCoverSheetViewController *)self coverSheetView];
    uint64_t v19 = [v18 window];

    if (v17)
    {
      if (!v19) {
        goto LABEL_39;
      }
    }
    else
    {

      if (!v19) {
        goto LABEL_39;
      }
    }
LABEL_30:
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2 && ![(CSCoverSheetViewController *)self dismissed]) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v20 userInterfaceIdiom] == 1)
      {
      }
      else
      {
        BOOL v21 = [(CSCoverSheetViewController *)self dismissed];

        if (!v21) {
          goto LABEL_3;
        }
      }
    }
    if ([(CSCoverSheetViewController *)self partiallyOnScreen]
      || [(CSCoverSheetViewController *)self lockOrientationWhileTransitioning])
    {
      goto LABEL_3;
    }
LABEL_39:
    unint64_t v9 = 30;
    goto LABEL_4;
  }
  [(CSCoverSheetViewController *)self effectiveInterfaceOrientation];
  unint64_t v9 = XBInterfaceOrientationMaskForInterfaceOrientation();
  if (![(CSCoverSheetViewController *)self shouldAutorotate]) {
    return v9;
  }
  if (![(CSCoverSheetViewController *)self isHostingAnApp]) {
    goto LABEL_15;
  }
  id v10 = [(CSCoverSheetViewController *)self hostedAppSceneHandle];
  id v11 = [v10 sceneIfExists];
  int v12 = [v11 uiSettings];
  int v13 = [v12 deviceOrientationEventsEnabled];

  if (!v13)
  {
LABEL_15:
    v22.receiver = self;
    v22.super_class = (Class)CSCoverSheetViewController;
    return [(CSCoverSheetViewController *)&v22 supportedInterfaceOrientations];
  }
  [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];

  return XBInterfaceOrientationMaskForInterfaceOrientation();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _fromWindowOrientation];

  id v10 = SBFWindowForViewControllerTransition();
  uint64_t v11 = [v10 _toWindowOrientation];

  int v12 = [(CSCoverSheetViewController *)self visiblePageViewController];
  int v13 = [(CSCoverSheetViewController *)self coverSheetView];
  __int16 v14 = [v13 scrollView];
  [v14 contentOffset];
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  uint64_t v19 = +[CSAction actionWithType:3];
  [(CSCoverSheetViewController *)self handleAction:v19 fromSender:self];

  self->_preventAppearanceUpdatesForRotation = 1;
  if ([(CSCoverSheetViewController *)self _appearState] == 2)
  {
    [v7 transitionDuration];
    -[CSOrientationUpdateControlling noteInterfaceOrientationChanged:duration:logMessage:](self->_orientationUpdateController, "noteInterfaceOrientationChanged:duration:logMessage:", v11, @"Cover Sheet is transitioning");
  }
  v41.receiver = self;
  v41.super_class = (Class)CSCoverSheetViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v41, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [v7 transitionDuration];
  double v21 = v20;
  objc_super v22 = [(CSCoverSheetContextProviding *)self->_coverSheetContext wallpaperProvider];
  [v22 wallpaperClientWillRotateToInterfaceOrientation:v11 duration:v21];
  if ((unint64_t)(v9 - 3) > 1)
  {
    BOOL v24 = 0;
    BOOL v23 = (unint64_t)(v9 - 1) <= 1 && (unint64_t)(v11 - 1) < 2;
  }
  else
  {
    BOOL v23 = 0;
    BOOL v24 = (unint64_t)(v11 - 3) < 2;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __81__CSCoverSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v35[3] = &unk_1E6AD8CF8;
  BOOL v39 = v23;
  BOOL v40 = v24;
  v35[4] = self;
  uint64_t v37 = v11;
  id v36 = v22;
  double v38 = v21;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__CSCoverSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v27[3] = &unk_1E6AD8D20;
  id v28 = v36;
  long long v29 = self;
  uint64_t v31 = v9;
  uint64_t v32 = v11;
  id v30 = v12;
  uint64_t v33 = v16;
  uint64_t v34 = v18;
  id v25 = v12;
  id v26 = v36;
  [v7 animateAlongsideTransition:v35 completion:v27];
}

void __81__CSCoverSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissHomeScreenOverlay];
  if (*(unsigned char *)(a1 + 64) || *(unsigned char *)(a1 + 65))
  {
    uint64_t v2 = [*(id *)(a1 + 32) coverSheetView];
    [v2 _layoutWallpaperFloatingLayerContainerView];
  }
  double v3 = [*(id *)(a1 + 32) coverSheetView];
  [v3 updateContainerOrientationForBackgroundViews:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) wallpaperClientWillAnimateRotationToInterfaceOrientation:*(void *)(a1 + 48) duration:*(double *)(a1 + 56)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1067) = 0;
  [*(id *)(a1 + 32) _updateAppearanceForTransitionToOrientation:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateActiveAppearanceForReason:@"Rotation"];
  *(unsigned char *)(*(void *)(a1 + 32) + 1067) = 1;
  objc_super v4 = [*(id *)(a1 + 32) visiblePageViewController];
  long long v6 = *(_OWORD *)(*(void *)(a1 + 32) + 1160);
  long long v7 = *(_OWORD *)(*(void *)(a1 + 32) + 1176);
  BSIntervalFractionForValue();
  objc_msgSend(v4, "updateTransitionToVisible:progress:mode:", 1, *(void *)(*(void *)(a1 + 32) + 1192), v6, v7);
  char v5 = [*(id *)(*(void *)(a1 + 32) + 1576) hostViewController];
  [v5 hostDidChangeContentBounds];
}

void __81__CSCoverSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) wallpaperClientDidRotateFromInterfaceOrientation:*(void *)(a1 + 56)];
  uint64_t v2 = [*(id *)(a1 + 40) visiblePageViewController];
  double v3 = [*(id *)(a1 + 40) coverSheetView];
  objc_super v4 = [v3 scrollView];
  [v4 contentOffset];
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  *(unsigned char *)(*(void *)(a1 + 40) + 1067) = 0;
  *(void *)(*(void *)(a1 + 40) + 1376) = 0;
  uint64_t v9 = [*(id *)(a1 + 40) coverSheetView];
  [v9 _layoutWallpaperFloatingLayerContainerView];

  if ([*(id *)(a1 + 40) _wouldUpdateActiveAppearance]) {
    [*(id *)(a1 + 40) _calculateAppearanceForCurrentOrientation];
  }
  [*(id *)(a1 + 40) _updateActiveAppearanceForReason:@"CompleteRotation"];
  id v10 = [*(id *)(a1 + 40) mainPageContentViewController];
  uint64_t v11 = [v10 combinedListViewController];
  [v11 layoutListView];

  int v12 = SBLogDashBoard();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = MEMORY[0x1D9486920](*(void *)(a1 + 56));
    __int16 v14 = MEMORY[0x1D9486920](*(void *)(a1 + 64));
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    uint64_t v19 = NSStringFromCGPoint(*(CGPoint *)(a1 + 72));
    v34.x = v6;
    v34.y = v8;
    double v20 = NSStringFromCGPoint(v34);
    int v21 = 138544642;
    objc_super v22 = v13;
    __int16 v23 = 2114;
    BOOL v24 = v14;
    __int16 v25 = 2114;
    id v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    id v30 = v19;
    __int16 v31 = 2114;
    uint64_t v32 = v20;
    _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "DashBoard has transitioned from orientation %{public}@ to %{public}@. \nVisible page: %{public}@ -> %{public}@. \nScrollView content offset: %{public}@ -> %{public}@", (uint8_t *)&v21, 0x3Eu);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSCoverSheetViewController;
  [(CSCoverSheetViewController *)&v9 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  double v5 = [(CSCoverSheetViewController *)self view];
  CGFloat v6 = [v5 window];
  uint64_t v7 = [v6 _windowInterfaceOrientation];

  CGFloat v8 = [(CSCoverSheetViewController *)self coverSheetView];
  [v8 updateContainerOrientationForBackgroundViews:v7];
}

- (void)_updateAppearanceForTransitionToOrientation:(int64_t)a3
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return;
    }
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 != 1) {
      return;
    }
  }
  if (_os_feature_enabled_impl())
  {
    [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"ActiveComplicationContainer"];
    if ((unint64_t)(a3 - 3) > 1) {
      +[CSComponent complicationSidebar];
    }
    else {
    uint64_t v7 = +[CSComponent complicationContainer];
    }
    CGFloat v8 = [v7 identifier:@"ActiveComplicationContainer"];

    [v8 setHidden:1];
    [(CSAppearance *)self->_localAppearance addComponent:v8];
  }
  self->_finalInterfaceOrientationForInProgressTransition = a3;
}

- (void)_setAppearanceForLandscape:(BOOL)a3
{
  double v3 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
LABEL_4:
        objc_super v4 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_13;
      }
    }
    else
    {
      double v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 == 1) {
        goto LABEL_4;
      }
    }
    if (_os_feature_enabled_impl()) {
      objc_super v4 = &unk_1F306B218;
    }
    else {
      objc_super v4 = &unk_1F306B230;
    }
LABEL_13:
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = *(id *)v37;
      unint64_t v10 = 0x1EA88C000uLL;
      id v34 = *(id *)v37;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(id *)v37 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) integerValue];
          uint64_t v13 = *(int *)(v10 + 2444);
          __int16 v14 = [*(id *)((char *)&v3->super.super.super.super.isa + v13) componentForType:v12 identifier:@"SBDashBoardThingsToHideInLandscape"];

          if (!v14)
          {
            uint64_t v15 = +[CSComponent componentWithType:v12];
            uint64_t v16 = [v15 identifier:@"SBDashBoardThingsToHideInLandscape"];
            [v16 priority:20];
            uint64_t v17 = v8;
            v19 = uint64_t v18 = v3;
            [v19 hidden:1];
            unint64_t v20 = v10;
            v22 = int v21 = v4;

            double v3 = v18;
            uint64_t v8 = v17;

            [*(id *)((char *)&v3->super.super.super.super.isa + v13) addComponent:v22];
            objc_super v4 = v21;
            unint64_t v10 = v20;
            id v9 = v34;
          }
        }
        uint64_t v8 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v8);
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2 || !_os_feature_enabled_impl()) {
        return;
      }
    }
    else
    {
      __int16 v23 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v23 userInterfaceIdiom] == 1)
      {
LABEL_37:

        return;
      }
      char v24 = _os_feature_enabled_impl();

      if ((v24 & 1) == 0) {
        return;
      }
    }
    __int16 v25 = objc_opt_new();
    uint64_t v26 = [v25 identifier:@"SBDashBoardThingsToHideInLandscape"];
    __int16 v27 = [(id)v26 priority:20];
    __int16 v23 = [v27 shouldRenderInline:1];

    [(CSAppearance *)v3->_localAppearance addComponent:v23];
    [(SBFLockScreenDateViewController *)v3->_dateViewController setDateTimeAlignment:0];
    [(CSBehavior *)v3->_localBehavior addRestrictedCapabilities:2097220];
    id v28 = [(SBFLockScreenDateViewController *)v3->_dateViewController inlineComplicationViewController];
    LOBYTE(v26) = BSEqualObjects();

    if ((v26 & 1) == 0) {
      [(SBFLockScreenDateViewController *)v3->_dateViewController setInlineComplicationViewController:v3->_landscapeInlineComplicationContainerViewController];
    }
    if ([(CSCoverSheetViewController *)v3 _isShowingInlineContent])
    {
      if ([(CSCoverSheetViewController *)v3 isShowingMediaControls]) {
        [(CSCoverSheetViewController *)v3 _dismissRemoteViewControllerForReason:4];
      }
    }
    goto LABEL_37;
  }
  [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"SBDashBoardThingsToHideInLandscape"];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2 || !_os_feature_enabled_impl()) {
      return;
    }
    goto LABEL_40;
  }
  id v35 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v35 userInterfaceIdiom] != 1)
  {
    char v29 = _os_feature_enabled_impl();

    if ((v29 & 1) == 0) {
      return;
    }
LABEL_40:
    [(SBFLockScreenDateViewController *)v3->_dateViewController setDateTimeAlignment:1];
    [(CSBehavior *)v3->_localBehavior removeRestrictedCapabilities:2097220];
    id v30 = [(SBFLockScreenDateViewController *)v3->_dateViewController inlineComplicationViewController];
    char v31 = BSEqualObjects();

    if ((v31 & 1) == 0)
    {
      dateViewController = v3->_dateViewController;
      inlineComplicationContainerViewController = v3->_inlineComplicationContainerViewController;
      [(SBFLockScreenDateViewController *)dateViewController setInlineComplicationViewController:inlineComplicationContainerViewController];
    }
    return;
  }
}

- (void)_calculateAppearanceForCurrentOrientation
{
  int v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      int v4 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v14 userInterfaceIdiom] == 1)
    {
      int v4 = 1;
      goto LABEL_8;
    }
  }
  int v4 = v3 ^ 1;
  if (_os_feature_enabled_impl())
  {
    BOOL v5 = 1;
    goto LABEL_19;
  }
LABEL_8:
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    {
      BOOL v5 = SBFEffectiveHomeButtonType() == 2;
      uint64_t v6 = v14;
      if (!v4) {
        goto LABEL_12;
      }
LABEL_20:

      if (!v5) {
        return;
      }
      goto LABEL_21;
    }
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v7 userInterfaceIdiom])
    {

      uint64_t v8 = v14;
      if ((v4 & 1) == 0) {
        return;
      }
      goto LABEL_29;
    }
    BOOL v5 = SBFEffectiveHomeButtonType() == 2;
  }
LABEL_19:
  uint64_t v6 = v14;
  if (v4) {
    goto LABEL_20;
  }
LABEL_12:
  if (!v5) {
    return;
  }
LABEL_21:
  BOOL v9 = (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) < 2;
  [(CSCoverSheetViewController *)self _setAppearanceForLandscape:v9];
  id v15 = [(CSAppearance *)self->_localAppearance componentForType:2 identifier:@"D22_OVERRIDE"];
  unint64_t v10 = [(CSCoverSheetViewController *)self traitCollection];
  if ([v10 verticalSizeClass] != 1) {
    LODWORD(v9) = 0;
  }

  uint64_t v8 = v15;
  if ((v15 == 0) == v9)
  {
    if (v9)
    {
      uint64_t v11 = +[CSComponent statusBar];
      uint64_t v12 = [v11 priority:20];
      uint64_t v13 = [v12 identifier:@"D22_OVERRIDE"];

      [v13 setHidden:1];
      [v13 setFlag:0];
      [v13 setAlpha:0.0];
      [(CSAppearance *)self->_localAppearance addComponent:v13];
    }
    else
    {
      [(CSAppearance *)self->_localAppearance removeComponent:v15];
    }
    uint64_t v8 = v15;
  }
LABEL_29:
}

- (void)_displayWillAppearImplementation
{
  int v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "DashBoard switching to CSCoverSheetParticipantStateActive", v5, 2u);
  }

  self->_participantState = 2;
  id v4 = (id)[(CSCoverSheetViewController *)self view];
  [(CSCoverSheetViewController *)self _setHasContentAboveCoverSheet:0];
  [(CSCoverSheetViewController *)self _listenForDisplayLayoutChanges:1];
  [(CSNotificationDispatcher *)self->_notificationDispatcher setActive:1];
  [(CSCoverSheetViewController *)self _handleEventType:8];
}

- (void)_displayWillDisappearImplementation
{
  [(CSCoverSheetViewController *)self _listenForDisplayLayoutChanges:0];
  notificationClearingTrigger = self->_notificationClearingTrigger;
  id v4 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  -[CSNotificationClearingTrigger setHadNotificationContentAtDisappearance:](notificationClearingTrigger, "setHadNotificationContentAtDisappearance:", [v4 hasContent]);
}

- (void)_displayDidDisappearImplementation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(CSCoverSheetViewController *)self _setHasContentAboveCoverSheet:0];
  int v3 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 resetScrollViewToMainPageAnimated:0 withCompletion:0];

  [(CSCoverSheetViewController *)self _handleEventType:9];
  [(CSNotificationClearingTrigger *)self->_notificationClearingTrigger setUiLocked:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v8++) dismissPresentationAnimated:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  if ([(CSCoverSheetViewController *)self _isPresentingDismissableRemoteContent])
  {
    [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:7];
  }
  [(CSPresentationViewController *)self->_modalPresentationController dismissPresentationAnimated:0];
  [(CSNotificationDispatcher *)self->_notificationDispatcher setActive:0];
  BOOL v9 = [(CSCoverSheetViewController *)self coverSheetView];
  [v9 viewControllerDidDisappear];

  [(CSCoverSheetViewController *)self setActiveAppearance:0];
  [(CSScrollGestureController *)self->_scrollGestureController setDelegate:0];
  [(CSScrollGestureController *)self->_scrollGestureController invalidate];
  scrollGestureController = self->_scrollGestureController;
  self->_scrollGestureController = 0;

  uint64_t v11 = [(CSCoverSheetViewController *)self coverSheetView];
  [v11 setStatusBarBackgroundView:0];

  statusBarBackgroundView = self->_statusBarBackgroundView;
  self->_statusBarBackgroundView = 0;

  [(CSCoverSheetViewController *)self _invalidateStatusBarAssertions];
  [(CSCoverSheetViewController *)self dismissHomeScreenOverlay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained coverSheetViewController:self requestsTouchIDDisabled:0 forReason:@"CSActiveBehavior"];
  [WeakRetained coverSheetViewController:self requestsPreArmDisabled:0 forReason:@"CSActiveBehavior"];
  id v14 = SBLogDashBoard();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "DashBoard switching to CSCoverSheetParticipantStateInactive", v15, 2u);
  }

  self->_participantState = 1;
}

- (void)_listenForDisplayLayoutChanges:(BOOL)a3
{
  if (self->_listeningForDisplayLayoutChanges != a3)
  {
    BOOL v3 = a3;
    self->_listeningForDisplayLayoutChanges = a3;
    uint64_t v5 = [(CSCoverSheetViewControllerBase *)self _displayLayoutPublisher];
    id v6 = v5;
    if (v3) {
      [v5 addObserver:self];
    }
    else {
      [v5 removeObserver:self];
    }
  }
}

- (void)coverSheetNotificationClearingTriggerDidFire:(id)a3
{
  id v4 = +[CSEvent eventWithType:35];
  [(CSCoverSheetViewController *)self _handleEvent:v4];
}

- (void)passcodeViewControllerDidCancelPasscodeEntry:(id)a3
{
  if ([(CSInterstitialTransitionSource *)self->_interstitialTransitionSource isTransitioning])
  {
    id v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "[CSViewController] Cancel button pressed while interstitial was transitioning", buf, 2u);
    }

    [(CSCoverSheetViewController *)self updateInterstitialPresentationWithProgress:self->_initialInterstitialTransitionProgress];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__CSCoverSheetViewController_passcodeViewControllerDidCancelPasscodeEntry___block_invoke;
    v6[3] = &unk_1E6AD87F8;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__CSCoverSheetViewController_passcodeViewControllerDidCancelPasscodeEntry___block_invoke_2;
    v5[3] = &unk_1E6AD8D48;
    void v5[4] = self;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithTension:0 friction:v6 interactive:v5 animations:9300.0 completion:196.0];
  }
}

uint64_t __75__CSCoverSheetViewController_passcodeViewControllerDidCancelPasscodeEntry___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInterstitialPresentationWithProgress:0.0];
}

uint64_t __75__CSCoverSheetViewController_passcodeViewControllerDidCancelPasscodeEntry___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupInterstitialPresentationToPresented:0 inPlace:0];
}

- (BOOL)passcodeViewControllerShouldHideStatusBar:(id)a3
{
  BOOL v3 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  char v4 = [v3 coachingActive];

  BOOL v5 = 1;
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = SBFEffectiveArtworkSubtype();
    if (v7 > 2795)
    {
      if (v7 == 2796 || v7 == 2868) {
        return v5;
      }
    }
    else if (v7 == 2556 || v7 == 2622)
    {
      return v5;
    }
    return 0;
  }
  return v5;
}

- (BOOL)suppressesBanners
{
  if (self->_participantState != 2) {
    return 0;
  }
  uint64_t v2 = [(CSCoverSheetViewController *)self activeBehavior];
  BOOL v3 = [v2 notificationBehavior] != 2;

  return v3;
}

- (BOOL)suppressesControlCenter
{
  if (self->_participantState != 2) {
    return 0;
  }
  uint64_t v2 = [(CSCoverSheetViewController *)self activeBehavior];
  char v3 = [v2 areRestrictedCapabilities:128];

  return v3;
}

- (BOOL)suppressesScreenshots
{
  uint64_t v2 = [(CSCoverSheetViewController *)self activeBehavior];
  char v3 = [v2 areRestrictedCapabilities:0x4000];

  return v3;
}

- (BOOL)handleHomeButtonPress
{
  return [(CSCoverSheetViewController *)self _handleEventType:27];
}

- (BOOL)handleHomeButtonDoublePress
{
  return 1;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return [(CSCoverSheetViewController *)self _handleEventType:28];
}

- (BOOL)handleVoiceCommandButtonPress
{
  return [(CSCoverSheetViewController *)self _handleEventType:29];
}

- (BOOL)handleVolumeUpButtonPress
{
  return [(CSCoverSheetViewController *)self _handleEventType:30];
}

- (BOOL)handleVolumeDownButtonPress
{
  return [(CSCoverSheetViewController *)self _handleEventType:31];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 33;
  }
  else {
    uint64_t v3 = 32;
  }
  return [(CSCoverSheetViewController *)self _handleEventType:v3];
}

- (int64_t)statusBarStyle
{
  uint64_t v2 = [(CSCoverSheetViewControllerBase *)self legibilitySettings];
  int64_t v3 = [v2 style] != 2;

  return v3;
}

- (BOOL)externalLockProvidersRequireUnlock
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_externalLockProviders;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
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
          char v5 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isLocked", (void)v9);
        }
      }
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)externalLockProvidersShowPasscode
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_externalLockProviders;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "participantState", (void)v8) == 2
          && [v6 isLocked]
          && ([v6 showPasscode] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (BOOL)isInlinePasscodeLockVisible
{
  return self->_interstitialTransitionSource && self->_hasPresentedForInterstitialTransitionSource
      || [(CSCoverSheetViewController *)self isPasscodeLockVisible];
}

- (BOOL)isPasscodeLockVisible
{
  uint64_t v3 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  LOBYTE(self) = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v3];

  return (char)self;
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 forceBiometricPresentation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  long long v11 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  uint64_t v12 = [(CSCoverSheetViewController *)self delegate];
  uint64_t v13 = (void *)v12;
  if (v8)
  {
    if (![(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v11]&& ![(CSCoverSheetViewController *)self isUnlockDisabled])
    {
      id v34 = v13;
      uint64_t v14 = [(CSCoverSheetViewController *)self activeAppearance];
      id v15 = [v14 componentForType:19 property:64];
      uint64_t v16 = [v15 color];

      long long v17 = [(CSCoverSheetViewController *)self _customLockScreenActionContext];
      long long v18 = [[CSPasscodeViewController alloc] initWithOptions:0];
      [(CSPasscodeViewController *)v18 setCoverSheetContext:self->_coverSheetContext];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
      [(CSPasscodeViewController *)v18 setWallpaperColorProvider:WeakRetained];

      uint64_t v33 = (void *)v16;
      [(CSPasscodeViewController *)v18 setWallpaperAverageColorOverride:v16];
      if (a5) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = [v17 wantsBiometricPresentation];
      }
      [(CSPasscodeViewController *)v18 setUseBiometricPresentation:v20];
      [(CSPasscodeViewController *)v18 setFaceOcclusionMonitor:self->_faceOcclusionMonitor];
      [(CSPasscodeViewController *)v18 setDelegate:self];
      id v28 = [MEMORY[0x1E4FA7C68] sharedInstance];
      if ([v28 hasPearlSupport]) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = MGGetBoolAnswer() ^ 1;
      }
      [(CSPasscodeViewController *)v18 setBiometricButtonsInitiallyVisible:v29];
      uint64_t v30 = 1;
      [(CSPasscodeViewController *)v18 setShowProudLock:1];
      char v31 = [(CSProudLockViewController *)self->_proudLockViewController proudLockContainerViewController];
      [(CSPasscodeViewController *)v18 setProudLockContainerViewControllerToUpdate:v31];

      uint64_t v32 = [v17 unlockDestination];
      [(CSPasscodeViewController *)v18 setUnlockDestination:v32];

      if (!a5) {
        uint64_t v30 = [v17 confirmedNotInPocket];
      }
      [(CSPasscodeViewController *)v18 setConfirmedNotInPocket:v30];
      [(CSCoverSheetViewController *)self _presentModalViewController:v18 animated:v7 completion:v10];

      uint64_t v13 = v34;
    }
  }
  else
  {
    id v35 = (void *)v12;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __100__CSCoverSheetViewController_setPasscodeLockVisible_animated_forceBiometricPresentation_completion___block_invoke;
    v40[3] = &unk_1E6AD8B20;
    v40[4] = self;
    id v21 = v10;
    id v41 = v10;
    [(CSCoverSheetViewController *)self _dismissModalViewControllersWithIdentifier:v11 animated:v7 completion:v40];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    objc_super v22 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = *(void **)(*((void *)&v36 + 1) + 8 * v26);
          if (objc_opt_respondsToSelector()) {
            [v27 coverSheetViewControllerDidDismissPasscodeLockView:self];
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v24);
    }

    uint64_t v13 = v35;
    [v35 coverSheetViewControllerDidDismissInlinePasscode:self];

    id v10 = v21;
  }
}

void __100__CSCoverSheetViewController_setPasscodeLockVisible_animated_forceBiometricPresentation_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) interstitialTransitionSource];
  if ([v3 isTransitioning]) {
    [v3 cancelTransition];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSCoverSheetViewController *)self isAuthenticated] != a3)
  {
    self->_authenticated = v3;
    [(CSCoverSheetViewController *)self _sendAuthenticationChangedEvent];
    if (v3)
    {
      [(CSCoverSheetViewController *)self _updateCoachingString];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__CSCoverSheetViewController_setAuthenticated___block_invoke;
      v7[3] = &unk_1E6AD87F8;
      void v7[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
      if ([(CSCoverSheetViewController *)self _isSpotlightBehaviorRestricted]
        && self->_spotlightModalViewController)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
        [WeakRetained dismissSpotlightAnimated:1];
      }
    }
  }
  [(CSHomeButtonShowPasscodeRecognizer *)self->_homeButtonShowPasscodeRecognizer noteAuthenticated:v3];
  uint64_t v6 = [(CSCoverSheetViewController *)self coverSheetView];
  [v6 updateUIForAuthenticated:v3];

  if (v3) {
    [(CSCoverSheetViewController *)self _setupQuickNoteGestureRecognizer];
  }
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"UserAuthenticationChanged"];
  [(CSNotificationClearingTrigger *)self->_notificationClearingTrigger setAuthenticated:v3];
}

uint64_t __47__CSCoverSheetViewController_setAuthenticated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)_sendAuthenticationChangedEvent
{
  id v4 = +[CSEvent eventWithType:13];
  BOOL v3 = [NSNumber numberWithBool:self->_authenticated];
  [v4 setValue:v3];

  [(CSCoverSheetViewController *)self _handleEvent:v4];
}

- (BOOL)isUnlockDisabled
{
  uint64_t v2 = [(CSCoverSheetViewController *)self activeBehavior];
  int v3 = [v2 areRestrictedCapabilities:56];
  if (v3)
  {
    id v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewController isUnlockDisabled]();
    }
  }
  return v3;
}

- (void)respondToUIUnlockFromSource:(int)a3
{
  char v4 = a3 - 1;
  if (a3 - 1) <= 0x28 && ((0x10101010297uLL >> v4))
  {
    unint64_t v5 = 0xFFFEFFFD79uLL >> v4;
    id v6 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
    [v6 handleDisplayWake:v5 & 1];
  }
}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v32 = v3;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[UIUnlock] Can UIUnlock from source %ld?", buf, 0xCu);
  }

  if ([(CSCoverSheetViewController *)self isUnlockDisabled])
  {
    SBLogDashBoard();
    id v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, &v6->super, OS_LOG_TYPE_DEFAULT, "[UIUnlock] Returning NO because unlock is disabled.", buf, 2u);
    }
    goto LABEL_24;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = self->_externalLockProviders;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v28;
LABEL_8:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v28 != v9) {
      objc_enumerationMutation(v6);
    }
    long long v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
    if (objc_msgSend(v11, "participantState", (void)v27) == 2
      && [v11 isLocked]
      && ([v11 unlockFromSource:v3] & 1) == 0)
    {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (!v8)
      {
LABEL_16:

        BOOL v12 = [(CSCoverSheetViewController *)self isPasscodeLockVisible];
        uint64_t v13 = [(CSCoverSheetViewController *)self activeBehavior];
        id v6 = v13;
        int v14 = v3 - 1;
        char v15 = 1;
        switch(v14)
        {
          case 0:
          case 16:
            uint64_t v23 = +[CSLockScreenDomain rootSettings];
            char v15 = [v23 autoDismissUnlockedLockScreen];

            goto LABEL_17;
          case 1:
          case 2:
          case 3:
          case 7:
          case 8:
          case 9:
          case 10:
          case 12:
          case 17:
          case 18:
          case 23:
          case 24:
          case 25:
          case 28:
          case 29:
          case 32:
          case 33:
          case 40:
            goto LABEL_17;
          case 14:
            uint64_t v24 = +[CSEvent eventWithType:27];
            BOOL v25 = [(CSCoverSheetViewController *)self wouldHandleButtonEvent:v24];

            if (v25)
            {
              char v15 = 0;
              uint64_t v26 = @"the home button is being handled manually";
              goto LABEL_35;
            }
            char v15 = 1;
            goto LABEL_17;
          case 22:
            if (v12)
            {
              uint64_t v26 = @"we're showing the passcode UI";
            }
            else
            {
              if (([(NSHashTable *)v13 areRestrictedCapabilities:8] & 1) == 0)
              {
LABEL_17:
                uint64_t v16 = SBLogDashBoard();
                if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_20;
                }
                long long v17 = NSStringFromBOOL();
                *(_DWORD *)buf = 138412290;
                unint64_t v32 = (unint64_t)v17;
                long long v18 = "[UIUnlock] Returning %@.";
                long long v19 = v16;
                uint32_t v20 = 12;
                goto LABEL_19;
              }
              char v15 = 0;
              uint64_t v26 = @"CSCapabilityTouchID is restricted";
            }
LABEL_35:
            uint64_t v16 = SBLogDashBoard();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
LABEL_20:

              goto LABEL_25;
            }
            long long v17 = NSStringFromBOOL();
            *(_DWORD *)buf = 138412546;
            unint64_t v32 = (unint64_t)v17;
            __int16 v33 = 2112;
            id v34 = v26;
            long long v18 = "[UIUnlock] Returning %@ because %@.";
            long long v19 = v16;
            uint32_t v20 = 22;
LABEL_19:
            _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

            goto LABEL_20;
          default:
            char v15 = 0;
            goto LABEL_17;
        }
      }
      goto LABEL_8;
    }
  }
  id v21 = SBLogDashBoard();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v32 = (unint64_t)v11;
    _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEFAULT, "[UIUnlock] Returning NO because external lock provider said so: %@", buf, 0xCu);
  }

LABEL_24:
  char v15 = 0;
LABEL_25:

  return v15;
}

- (void)prepareForUIUnlock
{
}

- (void)finishUIUnlockFromSource:(int)a3
{
  unint64_t v5 = [(CSCoverSheetViewController *)self activeBehavior];
  int v6 = [v5 areRestrictedCapabilities:56];

  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[self activeBehavior] areRestrictedCapabilities:CSCapabilityUnlock] == NO"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSCoverSheetViewController finishUIUnlockFromSource:](a2);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    [(CSCoverSheetViewController *)self _handleEventType:12];
  }
}

- (void)_setDidDismissSinceScreenOn:(BOOL)a3
{
  if (self->_didDismissSinceScreenOn != a3)
  {
    self->_didDismissSinceScreenOn = a3;
    [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"didDismissSinceScreenOn"];
    char v4 = +[CSComponent componentWithType:12];
    unint64_t v5 = [v4 identifier:@"didDismissSinceScreenOn"];
    id v6 = [v5 priority:10];

    [v6 setSuppressTeachableMomentsAnimation:BSSettingFlagIfYes()];
    [(CSAppearance *)self->_localAppearance addComponent:v6];
    [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"didDismissSinceScreenOn"];
  }
}

- (void)_setDismissed:(BOOL)a3
{
  if (self->_dismissed != a3)
  {
    self->_dismissed = a3;
    if (a3) {
      [(CSCoverSheetViewController *)self _setDidDismissSinceScreenOn:1];
    }
    [(CSCoverSheetViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  char v4 = [(CSCoverSheetViewController *)self activeBehavior];
  char v5 = [v4 areRestrictedCapabilities:56];

  if (v5) {
    return 0;
  }
  else {
    return ![(CSCoverSheetViewController *)self externalLockProvidersRequireUnlock];
  }
}

- (void)jiggleLockIcon
{
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] statusBar];
  [v3 jiggleLockIcon];

  proudLockViewController = self->_proudLockViewController;

  [(CSProudLockViewController *)proudLockViewController updateLockForBiometricMatchFailure];
}

- (unint64_t)visibleNotificationCount
{
  uint64_t v2 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  unint64_t v3 = [v2 visibleNotificationCount];

  return v3;
}

- (BOOL)isInteractingWithNotificationList
{
  uint64_t v2 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  char v3 = [v2 isInteractingWithNotificationList];

  return v3;
}

- (BOOL)contentOccludesBackground
{
  BOOL v3 = [(CSCoverSheetViewController *)self isPasscodeLockVisible];
  if (v3) {
    LOBYTE(v3) = ![(CSInterstitialTransitionSource *)self->_interstitialTransitionSource isTransitioning];
  }
  return v3;
}

- (void)prepareForInterstitialPresentation
{
  BOOL v3 = [(CSCoverSheetViewController *)self currentTransitionSource];
  char v4 = [v3 isTransitioning];

  if ((v4 & 1) == 0)
  {
    char v5 = [(CSCoverSheetViewController *)self _passcodeViewController];
    self->_interstitialTransitionStartedFromPasscodePresented = v5 != 0;
    id v6 = objc_alloc_init(CSInterstitialTransitionSource);
    [(CSInterstitialTransitionSource *)v6 setTransitioningDelegate:self];
    [(CSCoverSheetViewController *)self setInterstitialTransitionSource:v6];
    [(CSInterstitialTransitionSource *)v6 prepareForPresentation];
    [(CSCoverSheetViewController *)self attemptPhoneUnlockWithWatch];
    [(CSCoverSheetViewController *)self setPasscodeLockVisible:1 animated:0 forceBiometricPresentation:1 completion:0];
    if (!v5)
    {
      char v5 = [(CSCoverSheetViewController *)self _passcodeViewController];
    }
    [v5 beginInteractivePresentationTransitionForInitialTransition:!self->_interstitialTransitionStartedFromPasscodePresented];
    uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CSCoverSheetViewController_prepareForInterstitialPresentation__block_invoke;
    v9[3] = &unk_1E6AD88C0;
    id v10 = v5;
    long long v11 = self;
    id v8 = v5;
    [v7 _performWithoutRetargetingAnimations:v9];
    self->_initialInterstitialTransitionProgress = -1.0;
  }
}

uint64_t __64__CSCoverSheetViewController_prepareForInterstitialPresentation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInteractiveTransitionWithPercent:*(unsigned char *)(*(void *)(a1 + 40) + 1528) == 0 forInitialTransition:0.0];
}

- (void)updateInterstitialPresentationWithProgress:(double)a3
{
  double initialInterstitialTransitionProgress = self->_initialInterstitialTransitionProgress;
  if (initialInterstitialTransitionProgress < 0.0)
  {
    self->_double initialInterstitialTransitionProgress = a3;
    double initialInterstitialTransitionProgress = a3;
  }
  id v6 = [(CSCoverSheetViewController *)self interstitialTransitionSource];
  if ([v6 isTransitioning])
  {
    [v6 updatePresentationWithProgress:a3 - initialInterstitialTransitionProgress + a3 - initialInterstitialTransitionProgress];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F4F630] + 16);
    long long v17 = *MEMORY[0x1E4F4F630];
    long long v18 = v7;
    BSUIConstrainValueToIntervalWithRubberBand();
    uint64_t v9 = v8;
    id v10 = [(CSCoverSheetViewController *)self _passcodeViewController];
    long long v11 = (void *)MEMORY[0x1E4F42FF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__CSCoverSheetViewController_updateInterstitialPresentationWithProgress___block_invoke;
    v13[3] = &unk_1E6AD8D70;
    uint64_t v16 = v9;
    id v14 = v10;
    char v15 = self;
    id v12 = v10;
    [v11 _animateUsingSpringWithTension:0 friction:v13 interactive:&__block_literal_global_290 animations:9300.0 completion:196.0];
  }
}

void __73__CSCoverSheetViewController_updateInterstitialPresentationWithProgress___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CSCoverSheetViewController_updateInterstitialPresentationWithProgress___block_invoke_2;
  v10[3] = &unk_1E6AD8D70;
  id v6 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v10, COERCE_DOUBLE(__PAIR64__(HIDWORD(v13), LODWORD(minimum))), v8, v9);
}

uint64_t __73__CSCoverSheetViewController_updateInterstitialPresentationWithProgress___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInteractiveTransitionWithPercent:*(unsigned char *)(*(void *)(a1 + 40) + 1528) == 0 forInitialTransition:*(double *)(a1 + 48)];
}

- (void)cleanupInterstitialPresentationToPresented:(BOOL)a3 inPlace:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(CSCoverSheetViewController *)self interstitialTransitionSource];
  if ([v7 isTransitioning])
  {
    if (v5) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    if (v5 && !self->_hasPresentedForInterstitialTransitionSource)
    {
      self->_hasPresentedForInterstitialTransitionSource = 1;
      double v9 = [(CSCoverSheetViewController *)self delegate];
      [v9 coverSheetViewControllerWillPresentInlinePasscode:self];
    }
    id v10 = [(CSCoverSheetViewController *)self _passcodeViewController];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke;
    v22[3] = &unk_1E6AD8DB8;
    id v11 = v7;
    id v23 = v11;
    uint64_t v24 = self;
    id v12 = v10;
    id v25 = v12;
    BOOL v26 = v5;
    uint64_t v13 = (void (**)(void))MEMORY[0x1D9487300](v22);
    [v12 commitingToEndTransitionToPresented:v5 forInitialTransition:!self->_interstitialTransitionStartedFromPasscodePresented];
    if (v4)
    {
      v13[2](v13);
    }
    else
    {
      CAFrameRateRange v14 = (void *)MEMORY[0x1E4F42FF0];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke_2;
      v17[3] = &unk_1E6AD8740;
      double v21 = v8;
      id v18 = v12;
      long long v19 = self;
      id v20 = v11;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke_4;
      v15[3] = &unk_1E6AD8DE0;
      uint64_t v16 = v13;
      [v14 _animateUsingSpringWithTension:0 friction:v17 interactive:v15 animations:240.0 completion:30.0];
    }
  }
  self->_double initialInterstitialTransitionProgress = -1.0;
}

void __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupPresentation];
  [*(id *)(a1 + 40) setInterstitialTransitionSource:0];
  [*(id *)(a1 + 48) endInteractiveTransitionToPresented:*(unsigned __int8 *)(a1 + 56) forInitialTransition:*(unsigned char *)(*(void *)(a1 + 40) + 1528) == 0];
  uint64_t v2 = *(unsigned char **)(a1 + 40);
  if (!*(unsigned char *)(a1 + 56) && !v2[1528])
  {
    [v2 setPasscodeLockVisible:0 animated:0];
    uint64_t v2 = *(unsigned char **)(a1 + 40);
  }
  id v3 = [v2 delegate];
  [v3 coverSheetViewControllerDidDismissInlinePasscode:*(void *)(a1 + 40)];
}

void __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v17.minimum;
  float maximum = v17.maximum;
  float preferred = v17.preferred;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke_3;
  v12[3] = &unk_1E6AD8740;
  id v6 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  double v8 = *(void **)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = v8;
  *(float *)&double v9 = minimum;
  *(float *)&double v10 = maximum;
  *(float *)&double v11 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v12, v9, v10, v11);
}

uint64_t __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) updateInteractiveTransitionWithPercent:*(unsigned char *)(*(void *)(a1 + 40) + 1528) == 0 forInitialTransition:*(double *)(a1 + 56)];
  uint64_t v2 = *(void **)(a1 + 48);
  double v3 = *(double *)(a1 + 56);

  return [v2 updatePresentationWithProgress:v3];
}

uint64_t __81__CSCoverSheetViewController_cleanupInterstitialPresentationToPresented_inPlace___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setInterstitialTransitionSource:(id)a3
{
  p_interstitialTransitionSource = &self->_interstitialTransitionSource;
  id v6 = (CSInterstitialTransitionSource *)a3;
  if (*p_interstitialTransitionSource != v6)
  {
    -[CSCoverSheetViewController unregisterExternalAppearanceProvider:](self, "unregisterExternalAppearanceProvider:");
    [(CSCoverSheetViewController *)self unregisterExternalBehaviorProvider:*p_interstitialTransitionSource];
    objc_storeStrong((id *)&self->_interstitialTransitionSource, a3);
    self->_hasPresentedForInterstitialTransitionSource = 0;
    if (*p_interstitialTransitionSource)
    {
      -[CSCoverSheetViewController registerExternalAppearanceProvider:](self, "registerExternalAppearanceProvider:");
      [(CSCoverSheetViewController *)self registerExternalBehaviorProvider:*p_interstitialTransitionSource];
    }
  }
}

- (void)setBacklightLevel:(double)a3
{
  [(CSCoverSheetViewController *)self backlightLevel];
  if (v5 != a3)
  {
    id v7 = +[CSEvent eventWithType:16];
    id v6 = [NSNumber numberWithDouble:a3];
    [v7 setValue:v6];

    [(CSCoverSheetViewController *)self _handleEvent:v7];
    self->_backlightLevel = a3;
  }
}

- (BOOL)isInScreenOffMode
{
  return self->_screenOffMode;
}

- (void)setInScreenOffMode:(BOOL)a3
{
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self->_screenOffMode == a3) {
    return;
  }
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a3;
  self->_screenOffMode = a3;
  unint64_t v8 = 0x1EA88C000uLL;
  if (a3)
  {
    -[CSCoverSheetViewController _setDidDismissSinceScreenOn:](self, "_setDidDismissSinceScreenOn:", 0, a4);
    [(CSOrientationUpdateControlling *)self->_orientationUpdateController deferOrientationUpdatesWithReason:@"CSCoverSheetScreenOffReason"];
    [(SBUIPhoneUnlockWithWatchController *)self->_phoneUnlockWithWatchController handleScreenOff];
    chargingViewControllerTimer = self->_chargingViewControllerTimer;
    if (chargingViewControllerTimer && self->_chargingViewTimerHandler)
    {
      [(BSAbsoluteMachTimer *)chargingViewControllerTimer invalidate];
      (*((void (**)(void))self->_chargingViewTimerHandler + 2))();
      double v10 = self->_chargingViewControllerTimer;
      self->_chargingViewControllerTimer = 0;

      id chargingViewTimerHandler = self->_chargingViewTimerHandler;
      self->_id chargingViewTimerHandler = 0;
    }
    accessoryViewControllerTimer = self->_accessoryViewControllerTimer;
    if (accessoryViewControllerTimer && self->_accessoryViewControllerTimerHandler)
    {
      [(BSAbsoluteMachTimer *)accessoryViewControllerTimer invalidate];
      (*((void (**)(void))self->_accessoryViewControllerTimerHandler + 2))();
      id v13 = self->_accessoryViewControllerTimer;
      self->_accessoryViewControllerTimer = 0;

      id accessoryViewControllerTimerHandler = self->_accessoryViewControllerTimerHandler;
      self->_id accessoryViewControllerTimerHandler = 0;

      self->_accessoryViewPresentationDelayed = 0;
    }
    accessoryViewControllerChargingTimer = self->_accessoryViewControllerChargingTimer;
    if (accessoryViewControllerChargingTimer && self->_accessoryViewControllerChargingTimerHandler)
    {
      [(BSAbsoluteMachTimer *)accessoryViewControllerChargingTimer invalidate];
      (*((void (**)(void))self->_accessoryViewControllerChargingTimerHandler + 2))();
      uint64_t v16 = self->_accessoryViewControllerChargingTimer;
      self->_accessoryViewControllerChargingTimer = 0;

      id accessoryViewControllerChargingTimerHandler = self->_accessoryViewControllerChargingTimerHandler;
      self->_id accessoryViewControllerChargingTimerHandler = 0;
    }
    id v18 = SBLogDashBoard();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 67109120;
      BOOL v42 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      _os_log_impl(&dword_1D839D000, v18, OS_LOG_TYPE_DEFAULT, "[Charge UI][Screen Off Mode] visible NO, showBattery NO – isAlreadyShowingChargingModal: %d", (uint8_t *)&v41, 8u);
    }

    [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:0 showBattery:0 animated:0];
    long long v19 = SBLogDashBoard();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      int v41 = 67109120;
      BOOL v42 = v20;
      _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, "[Charge UI][Screen Off Mode] – endedShowingChargingModal: %d", (uint8_t *)&v41, 8u);
    }

    double v21 = [(CSCoverSheetViewController *)self coverSheetView];
    [v21 resetScrollViewToMainPageAnimated:0 withCompletion:0];

    [(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource cancelTransition];
    [(CSTimerViewController *)self->_timerViewController setEnabled:0];
    [(CSCoverSheetViewController *)self _addOrRemoveRemoteContentViewIfNecessary];
    [(CSCoverSheetViewController *)self dismissHomeScreenOverlay];
  }
  else
  {
    [(CSCoverSheetViewController *)self _updateOverrideDateIfNeeded];
    [(CSOrientationUpdateControlling *)self->_orientationUpdateController cancelOrientationUpdateDeferral];
    if (([(SBFScreenWakeAnimationControlling *)self->_screenWakeAnimationController isWakeAnimationInProgress] & 1) == 0)[(SBFLockScreenDateViewController *)self->_dateViewController updateTimeNow]; {
    objc_super v22 = +[CSAction actionWithType:3];
    }
    [(CSCoverSheetViewController *)self handleAction:v22 fromSender:self];

    [(CSTimerViewController *)self->_timerViewController setEnabled:1];
  }
  unint64_t v23 = 0x1E4F4F000uLL;
  uint64_t v24 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
  if ([v24 backlightState] != 1)
  {

    goto LABEL_24;
  }
  int v25 = [(CSCoverSheetViewController *)self _appearState];

  if (v25 == 2)
  {
LABEL_24:
    [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"HiddenAODTransitionElement"];
    goto LABEL_25;
  }
  localAppearance = self->_localAppearance;
  long long v27 = objc_opt_new();
  long long v28 = [v27 hidden:1];
  long long v29 = [v28 identifier:@"HiddenAODTransitionElement"];
  long long v30 = [v29 priority:80];
  [(CSAppearance *)localAppearance addComponent:v30];

  char v31 = self->_localAppearance;
  unint64_t v32 = objc_opt_new();
  __int16 v33 = [v32 hidden:1];
  id v34 = [v33 identifier:@"HiddenAODTransitionElement"];
  id v35 = [v34 priority:80];
  [(CSAppearance *)v31 addComponent:v35];

  unint64_t v23 = 0x1E4F4F000;
  unint64_t v8 = 0x1EA88C000;

LABEL_25:
  [*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v8 + 2628)) setScreenOff:self->_screenOffMode];
  [(CSInlineWidgetContainerViewController *)self->_inlineComplicationContainerViewController setScreenOff:self->_screenOffMode];
  [(CSInlineWidgetContainerViewController *)self->_landscapeInlineComplicationContainerViewController setScreenOff:self->_screenOffMode];
  [(CSWidgetGridViewController *)self->_complicationContainerViewController setScreenOff:self->_screenOffMode];
  [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController setScreenOff:self->_screenOffMode];
  if (v6) {
    uint64_t v36 = @"ScreenOff";
  }
  else {
    uint64_t v36 = @"ScreenOn";
  }
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v36];
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"ScreenOffModeUpdate"];
  if (self->_screenOffMode)
  {
    long long v37 = +[CSEvent eventWithType:25];
  }
  else
  {
    long long v37 = +[CSEvent eventWithType:24];
    long long v38 = [NSNumber numberWithUnsignedInt:v5];
    [v37 setValue:v38];
  }
  [(CSCoverSheetViewController *)self _handleEvent:v37];
  [(CSNotificationClearingTrigger *)self->_notificationClearingTrigger setScreenOff:v6];
  notificationClearingTrigger = self->_notificationClearingTrigger;
  BOOL v40 = [*(id *)(v23 + 1232) sharedBacklight];
  -[CSNotificationClearingTrigger setScreenInactive:](notificationClearingTrigger, "setScreenInactive:", [v40 backlightState] == 1);
}

- (int64_t)backlightLuminance
{
  uint64_t v2 = [(CSCoverSheetViewController *)self traitCollection];
  int64_t v3 = [v2 _backlightLuminance];

  return v3;
}

- (BOOL)shouldDisableALS
{
  return 1;
}

- (BOOL)_isTodayViewOverlayShowing
{
  uint64_t v2 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  char v3 = [v2 isPresented];

  return v3;
}

- (BOOL)isMainPageVisible
{
  char v3 = [(CSCoverSheetViewController *)self visiblePageViewController];
  BOOL v4 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  if (v3 == v4) {
    BOOL v5 = ![(CSCoverSheetViewController *)self _isTodayViewOverlayShowing];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)noteDeviceBlockedStatusUpdated
{
  [(CSCoverSheetViewController *)self _addOrRemoveThermalTrapViewIfNecessaryAnimated:1];
  [(CSCoverSheetViewController *)self _addOrRemoveBlockedViewIfNecessaryAnimated:1];
  [(CSCoverSheetViewController *)self _addOrRemoveResetRestoreViewIfNecessaryAnimated:1];

  [(CSCoverSheetViewController *)self _updateModalPresentationControllerVisibility];
}

- (BOOL)shouldUnlockUIOnKeyDownEvent
{
  if ([(CSCoverSheetViewController *)self isPasscodeLockVisible]) {
    return 0;
  }
  char v3 = [(CSCoverSheetViewController *)self modalPresentationController];
  char v4 = [v3 isPresentingContent];

  if (v4) {
    return 0;
  }
  else {
    return ![(CSCoverSheetViewController *)self isHostingAnApp];
  }
}

- (BOOL)isShowingMediaControls
{
  uint64_t v2 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  char v3 = [v2 isShowingMediaControls];

  return v3;
}

- (void)setShowingMediaControls:(BOOL)a3
{
  if (a3
    && [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController shouldDismissInlineContentForNowPlaying])
  {
    [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:4];
  }
}

- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 actions:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t, __CFString *))a6;
  id v13 = [(CSCoverSheetViewController *)self coverSheetView];
  unint64_t v14 = [(CSCoverSheetViewController *)self _indexOfCameraPage];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12[2](v12, 5, @"Camera page not accessible");
    goto LABEL_20;
  }
  id v15 = (void *)v14;
  BOOL v29 = v8;
  uint64_t v16 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:v14];
  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      CAFrameRateRange v17 = [v16 hostedEntity];
      id v18 = [v17 applicationBundleIdentifier];
      [v10 applicationBundleIdentifier];
      long long v19 = v13;
      v21 = id v20 = v11;
      int v28 = [v18 isEqualToString:v21];

      id v11 = v20;
      id v13 = v19;

      if (!v28)
      {
        objc_super v22 = 0;
        goto LABEL_12;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_super v22 = 0;
    if (!v10) {
      goto LABEL_14;
    }
LABEL_12:
    if (objc_opt_respondsToSelector()) {
      [v16 setHostedEntity:v10];
    }
    goto LABEL_14;
  }
  objc_super v22 = [v16 acquireLiveContentAssertionForReason:@"Camera Activation"];
  if (v10) {
    goto LABEL_12;
  }
LABEL_14:
  char v23 = objc_opt_respondsToSelector() & 1;
  if (v23) {
    [v16 setActionsToDeliver:v11];
  }
  objc_initWeak(location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __80__CSCoverSheetViewController__activateCameraEntity_animated_actions_completion___block_invoke;
  v35[3] = &unk_1E6AD8E08;
  objc_copyWeak(v41, location);
  id v24 = v13;
  v41[1] = v15;
  id v36 = v24;
  long long v37 = self;
  char v42 = v23;
  id v25 = v16;
  id v38 = v25;
  id v26 = v22;
  id v39 = v26;
  BOOL v40 = v12;
  long long v27 = (void *)MEMORY[0x1D9487300](v35);
  if ([(CSCoverSheetViewController *)self isPasscodeLockVisible])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __80__CSCoverSheetViewController__activateCameraEntity_animated_actions_completion___block_invoke_2;
    v30[3] = &unk_1E6AD8E30;
    id v31 = v24;
    __int16 v33 = v15;
    BOOL v34 = v29;
    id v32 = v27;
    [(CSCoverSheetViewController *)self setPasscodeLockVisible:0 animated:v29 completion:v30];
  }
  else
  {
    [v24 scrollToPageAtIndex:v15 animated:v29 withCompletion:v27];
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(location);

LABEL_20:
}

void __80__CSCoverSheetViewController__activateCameraEntity_animated_actions_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v2 = [*(id *)(a1 + 32) scrollView];
  [v2 contentOffset];
  double v4 = v3;
  BOOL v5 = [*(id *)(a1 + 32) scrollView];
  [v5 contentOffsetForPageAtIndex:*(void *)(a1 + 80)];
  double v7 = v6;

  if (v4 >= v7)
  {
    BOOL v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 2128) cancelTransition];
    *(void *)(*(void *)(a1 + 40) + 1144) = 0;
    [*(id *)(a1 + 40) setCurrentTransitionSource:0];
    [WeakRetained activateMainPageWithCompletion:0];
    if (*(unsigned char *)(a1 + 88)) {
      [*(id *)(a1 + 48) setActionsToDeliver:0];
    }
    BOOL v8 = @"Camera presentation interrupted existing scroll.";
    uint64_t v9 = 1;
  }
  [*(id *)(*(void *)(a1 + 40) + 1912) cancelOrientationUpdateDeferral];
  [*(id *)(a1 + 56) invalidate];
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v10 + 16))(v10, v9, v8);
  }
}

uint64_t __80__CSCoverSheetViewController__activateCameraEntity_animated_actions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scrollToPageAtIndex:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56) withCompletion:*(void *)(a1 + 40)];
}

- (void)activateOverlayWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = SBLogDashBoard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to activate overlay with view controller: %@", buf, 0xCu);
  }

  if (self->_spotlightModalViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
    [WeakRetained dismissSpotlightAnimated:1];
  }
  unint64_t v12 = [(CSCoverSheetViewController *)self _indexOfMainPage];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__CSCoverSheetViewController_activateOverlayWithViewController_animated_completion___block_invoke;
  v15[3] = &unk_1E6AD8E58;
  void v15[4] = self;
  id v16 = v8;
  BOOL v18 = v6;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [(CSCoverSheetViewController *)self activatePage:v12 animated:v6 withCompletion:v15];
}

void __84__CSCoverSheetViewController_activateOverlayWithViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(CSDismissableModalViewController);
  double v3 = [*(id *)(*(void *)(a1 + 32) + 1048) modalHomeAffordanceController];
  [(CSDismissableModalViewController *)v2 setHomeAffordanceController:v3];

  [(CSDismissableModalViewController *)v2 setDelegate:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__CSCoverSheetViewController_activateOverlayWithViewController_animated_completion___block_invoke_2;
  v6[3] = &unk_1E6AD8E58;
  double v7 = v2;
  double v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v10 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  BOOL v5 = v2;
  [v4 _presentModalViewController:v5 shouldDismissOverlays:0 animated:0 completion:v6];
}

void __84__CSCoverSheetViewController_activateOverlayWithViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__CSCoverSheetViewController_activateOverlayWithViewController_animated_completion___block_invoke_3;
  v4[3] = &unk_1E6AD8B78;
  id v5 = *(id *)(a1 + 48);
  [v1 presentContentViewController:v2 animated:v3 completion:v4];
}

uint64_t __84__CSCoverSheetViewController_activateOverlayWithViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)dismissHostedAppsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(CSCoverSheetViewController *)self isMainPageVisible])
  {
    [(CSCoverSheetViewController *)self _dismissHostingModalsAnimated:v4 completion:v6];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__CSCoverSheetViewController_dismissHostedAppsAnimated_completion___block_invoke;
    v7[3] = &unk_1E6AD8E80;
    void v7[4] = self;
    BOOL v9 = v4;
    id v8 = v6;
    [(CSCoverSheetViewController *)self _dismissHostingModalsAnimated:0 completion:v7];
  }
}

uint64_t __67__CSCoverSheetViewController_dismissHostedAppsAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _indexOfMainPage];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v2 activatePage:v3 animated:v4 withCompletion:v5];
}

- (void)_dismissHostingModalsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v16 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CSCoverSheetViewController__dismissHostingModalsAnimated_completion___block_invoke;
  block[3] = &unk_1E6AD8B78;
  id v15 = v5;
  id v24 = v15;
  dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v7 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v13 = v12;
          if (objc_msgSend(v13, "isHostingAnApp", v15))
          {
            dispatch_group_enter(v6);
            modalPresentationController = self->_modalPresentationController;
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __71__CSCoverSheetViewController__dismissHostingModalsAnimated_completion___block_invoke_2;
            v17[3] = &unk_1E6AD87F8;
            BOOL v18 = v6;
            [(CSPresentationViewController *)modalPresentationController dismissContentViewController:v13 animated:v16 completion:v17];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  dispatch_group_leave(v6);
}

uint64_t __71__CSCoverSheetViewController__dismissHostingModalsAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__CSCoverSheetViewController__dismissHostingModalsAnimated_completion___block_invoke_2(uint64_t a1)
{
}

- (void)idleTimerDidRefresh
{
  id v3 = +[CSEvent eventWithType:18];
  [(CSCoverSheetViewController *)self _handleEvent:v3];
}

- (void)idleTimerDidExpire
{
  id v3 = +[CSEvent eventWithType:20];
  [(CSCoverSheetViewController *)self _handleEvent:v3];
}

- (void)idleTimerDidWarn
{
  id v3 = +[CSEvent eventWithType:19];
  [(CSCoverSheetViewController *)self _handleEvent:v3];
}

- (void)idleTimerWillRefresh
{
  id v3 = +[CSEvent eventWithType:17];
  [(CSCoverSheetViewController *)self _handleEvent:v3];
}

- (SBFOverlayControlling)overlayController
{
  overlayController = self->_overlayController;
  if (!overlayController)
  {
    uint64_t v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext homeScreenOverlayProvider];
    id v5 = (SBFOverlayControlling *)[v4 newOverlayController];
    id v6 = self->_overlayController;
    self->_overlayController = v5;

    [(SBFOverlayControlling *)self->_overlayController addHomeScreenOverlayObserver:self];
    [(SBFOverlayControlling *)self->_overlayController setDismissalDelegate:self];
    overlayController = self->_overlayController;
  }

  return overlayController;
}

- (id)overlayControllerIfExists
{
  return self->_overlayController;
}

- (void)scrollPanGestureDidUpdate:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CSCoverSheetViewController *)self activeBehavior];
  char v5 = [v4 areRestrictedCapabilities:64];

  if ((v5 & 1) == 0)
  {
    switch([v8 state])
    {
      case 1:
        [(CSCoverSheetViewController *)self _scrollPanGestureBegan:v8];
        id v6 = self;
        id v7 = v8;
        goto LABEL_6;
      case 2:
        id v6 = self;
        id v7 = v8;
LABEL_6:
        [(CSCoverSheetViewController *)v6 _scrollPanGestureChanged:v7];
        break;
      case 3:
        [(CSCoverSheetViewController *)self _scrollPanGestureEnded:v8];
        break;
      case 4:
      case 5:
        [(CSCoverSheetViewController *)self dismissHomeScreenOverlay];
        [(CSWidgetGridViewController *)self->_complicationContainerViewController endCancellingTouches];
        break;
      default:
        break;
    }
  }
}

- (void)_scrollPanGestureBegan:(id)a3
{
  [(CSWidgetGridViewController *)self->_complicationContainerViewController beginCancellingTouches];
  uint64_t v4 = [(CSCoverSheetViewController *)self overlayControllerIfExists];

  if (v4)
  {
    id v6 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
    [v6 layerPresentationProgress];
    self->_initialOverlayPresentationProgress = v5;
  }
  else
  {
    self->_initialOverlayPresentationProgress = 0.0;
  }
}

- (void)_scrollPanGestureChanged:(id)a3
{
  id v4 = a3;
  double v5 = [(CSCoverSheetViewController *)self coverSheetView];
  [v4 translationInView:v5];
  double v7 = v6;

  uint64_t v8 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  BOOL v9 = v7 > 0.0;
  if (v8 == 1) {
    BOOL v9 = v7 < 0.0;
  }
  if (v9)
  {
    uint64_t v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewController _scrollPanGestureChanged:]();
    }

    id v11 = [(CSCoverSheetViewController *)self overlayController];
    [v11 presentationProgressForTranslation:1 initialPresentationProgress:v7 fromLeading:self->_initialOverlayPresentationProgress];
    double v13 = v12;
    objc_msgSend(v11, "setPresentationProgress:interactive:animated:completionHandler:", 1, 1, 0);
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        goto LABEL_11;
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      if (v15 == 1)
      {
LABEL_11:

        return;
      }
    }
    [(CSCoverSheetViewController *)self _updateIdleTimerForTransitionProgress:v13];
    goto LABEL_11;
  }
}

- (void)_scrollPanGestureEnded:(id)a3
{
  id v4 = a3;
  [(CSWidgetGridViewController *)self->_complicationContainerViewController endCancellingTouches];
  double v5 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  double v6 = v5;
  if (v5)
  {
    [v5 presentationProgress];
    double v7 = [(CSCoverSheetViewController *)self coverSheetView];
    [v4 velocityInView:v7];
    double v9 = v8;

    uint64_t v10 = [(CSCoverSheetViewController *)self coverSheetView];
    [v4 translationInView:v10];
    double v12 = v11;

    [v6 finalPresentationProgressForTranslation:1 velocity:v12 initialPresentationProgress:v9 fromLeading:self->_initialOverlayPresentationProgress];
    double v14 = v13;
    if ((BSFloatIsZero() & 1) == 0 && (BSFloatIsZero() & 1) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      v17[0] = (double)[(CSCoverSheetViewController *)self _indexOfMainPage];
      v17[2] = v17[0];
      *(void *)&v17[1] = 1;
      *(void *)&v17[3] = 1;
      uint64_t v15 = [(CSCoverSheetViewController *)self coverSheetView];
      v16[0] = v18;
      v16[1] = v19;
      v16[2] = v20;
      [(CSCoverSheetViewController *)self transitionSource:v15 didEndWithContext:v16];
    }
    [v6 setPresentationProgress:0 interactive:1 animated:0 completionHandler:v14];
  }
}

- (void)dismissHomeScreenOverlay
{
  uint64_t v2 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  if (v2)
  {
    id v3 = v2;
    [v2 dismissAnimated:1 completionHandler:0];
    uint64_t v2 = v3;
  }
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  if ([(CSCoverSheetViewController *)self bs_isAppearingOrAppeared])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained coverSheetViewControllerShouldDismissContextMenu:self];
  }
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  id v10 = a3;
  id v8 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  if (v8 == v10)
  {
    [v10 presentationProgress];
    if (a4 > 0.0 || v9 <= 0.0)
    {
      if (a4 > 0.0 && v9 <= 0.0)
      {
        [(CSCoverSheetViewController *)self unregisterExternalBehaviorProvider:v10];
        [(CSCoverSheetViewController *)self unregisterExternalEventHandler:v10];
      }
    }
    else
    {
      [(CSCoverSheetViewController *)self registerExternalBehaviorProvider:v10];
      [(CSCoverSheetViewController *)self registerExternalEventHandler:v10];
    }
  }
}

- (BOOL)interceptDismissalGestureForOverlayController:(id)a3
{
  if (self->_overlayController != a3) {
    return 0;
  }
  id v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext homeScreenOverlayProvider];
  char v5 = [v4 dismissModalContentIfVisibleAnimated:1];

  return v5;
}

- (void)overlayControllerRequestsDismissal:(id)a3
{
  if (self->_overlayController == a3) {
    [(CSCoverSheetViewController *)self dismissHomeScreenOverlay];
  }
}

- (BOOL)isLockScreenShowingDefaultContent
{
  BOOL v3 = [(CSCoverSheetViewController *)self isMainPageVisible];
  if (v3) {
    LOBYTE(v3) = ![(CSCoverSheetViewController *)self hasContentAboveCoverSheet];
  }
  return v3;
}

- (BOOL)isLockScreenShowingDefaultContentExceptControlCenter
{
  BOOL v3 = [(CSCoverSheetViewController *)self isMainPageVisible];
  if (v3)
  {
    if ([(CSCoverSheetViewController *)self hasContentAboveCoverSheet]) {
      LOBYTE(v3) = self->_contentAboveIsControlCenter;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)updateCallToActionForMesaMatchFailure
{
}

- (BOOL)shouldShowLockStatusBarTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained coverSheetViewControllerIsShowingSecureApp:self];

  if ((v4 & 1) != 0 || self->_hasContentAboveCoverSheet && !self->_contentAboveIsControlCenter) {
    return 1;
  }
  if ([(CSCoverSheetViewController *)self isTransitioning]) {
    [(CSCoverSheetViewController *)self previousAppearance];
  }
  else {
  double v6 = [(CSCoverSheetViewController *)self activeAppearance];
  }
  double v7 = [v6 componentForType:1 identifier:@"(active)"];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  if ([v11 isHidden]) {
    char v5 = 1;
  }
  else {
    char v5 = [v11 hidesTime];
  }

  return v5;
}

- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress
{
  char v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
  int v5 = [v4 isAuthenticated];

  if (v5)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:3326 description:@"We shouldn't get asked for this if we're already authenticated."];
  }
  double v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext biometricResource];
  if (([v6 hasBiometricAuthenticationCapabilityEnabled] & 1) == 0)
  {
    double v7 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "Not creating home button passcode recognizer because mesa unlock is disabled.";
      id v9 = buf;
      goto LABEL_9;
    }
LABEL_10:

    id v10 = 0;
    goto LABEL_11;
  }
  if ([v6 biometricLockoutState])
  {
    double v7 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      uint64_t v8 = "Not creating home button passcode recognizer because we're already in bio-lockout status.";
      id v9 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v10 = -[CSHomeButtonShowPasscodeRecognizer initWithFingerOn:]([CSHomeButtonShowPasscodeRecognizer alloc], "initWithFingerOn:", [v6 isFingerOn]);
LABEL_11:
  objc_storeStrong((id *)&self->_homeButtonShowPasscodeRecognizer, v10);

  return v10;
}

- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3
{
  char v4 = objc_alloc_init(CSHomeButtonSuppressAfterUnlockRecognizer);
  objc_storeWeak((id *)&self->_homeButtonSuppressAfterUnlockRecognizer, v4);

  return v4;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return [(CSMainPageContentViewController *)self->_mainPageContentViewController widgetMetricsProvider];
}

- (BOOL)_isComplicationContainerVisible
{
  int v2 = CSAutobahnEnabledForPlatform();
  if (v2)
  {
    LOBYTE(v2) = CSFeatureEnabled(4);
  }
  return v2;
}

- (id)_validatedComplicationDescriptorForDescriptor:(id)a3
{
  id v4 = a3;
  int v5 = [v4 widget];
  double v6 = [v5 containerBundleIdentifier];

  double v7 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v6];
  if ([v7 isLocked] & 1) != 0 || (objc_msgSend(v7, "isHidden"))
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(CSCoverSheetContextProviding *)self->_coverSheetContext applicationInformer];
    char v10 = [v9 isInstallingApplicationWithBundleIdentifier:v6];
    int v11 = [v9 applicationExistsForBundleIdentifier:v6];
    if ((v10 & 1) != 0 || v11) {
      id v8 = v4;
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_validateAndUpdateInlineComplication
{
  id v18 = [(CSCoverSheetViewController *)self _validatedComplicationDescriptorForDescriptor:self->_posterPortraitDescriptor];
  BOOL v3 = [(CSCoverSheetViewController *)self _validatedComplicationDescriptorForDescriptor:self->_posterLandscapeDescriptor];
  id v4 = [(CSInlineWidgetContainerViewController *)self->_inlineComplicationContainerViewController widgetDescriptor];
  int v5 = BSEqualObjects();

  if (!v5
    || ([(CSInlineWidgetContainerViewController *)self->_landscapeInlineComplicationContainerViewController widgetDescriptor], v6 = objc_claimAutoreleasedReturnValue(), char v7 = BSEqualObjects(), v6, (v7 & 1) == 0))
  {
    inlineComplicationContainerViewController = self->_inlineComplicationContainerViewController;
    if (v18)
    {
      if (!inlineComplicationContainerViewController)
      {
        id v9 = [[CSInlineWidgetContainerViewController alloc] initWithComplicationManager:self->_complicationManager];
        char v10 = self->_inlineComplicationContainerViewController;
        self->_inlineComplicationContainerViewController = v9;

        [(CSInlineWidgetContainerViewController *)self->_inlineComplicationContainerViewController setDelegate:self];
        inlineComplicationContainerViewController = self->_inlineComplicationContainerViewController;
      }
      [(CSInlineWidgetContainerViewController *)inlineComplicationContainerViewController setWidgetDescriptor:v18];
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() != 2
          && (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 1) > 1)
        {
          goto LABEL_15;
        }
LABEL_14:
        __int16 v13 = self->_inlineComplicationContainerViewController;
        goto LABEL_16;
      }
      int v11 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v11 userInterfaceIdiom] == 1)
      {

        goto LABEL_14;
      }
      unint64_t v12 = [(CSCoverSheetViewController *)self interfaceOrientation] - 1;

      if (v12 < 2) {
        goto LABEL_14;
      }
    }
    else
    {
      self->_inlineComplicationContainerViewController = 0;
    }
LABEL_15:
    __int16 v13 = 0;
LABEL_16:
    landscapeInlineComplicationContainerViewController = self->_landscapeInlineComplicationContainerViewController;
    if (v3)
    {
      if (!landscapeInlineComplicationContainerViewController)
      {
        uint64_t v15 = [[CSInlineWidgetContainerViewController alloc] initWithComplicationManager:self->_complicationManager inlineTextAlignment:1];
        BOOL v16 = self->_landscapeInlineComplicationContainerViewController;
        self->_landscapeInlineComplicationContainerViewController = v15;

        [(CSInlineWidgetContainerViewController *)self->_landscapeInlineComplicationContainerViewController setDelegate:self];
        landscapeInlineComplicationContainerViewController = self->_landscapeInlineComplicationContainerViewController;
      }
      [landscapeInlineComplicationContainerViewController setWidgetDescriptor:v3];
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2
          || (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) > 1)
        {
          goto LABEL_28;
        }
LABEL_26:
        landscapeInlineComplicationContainerViewController = v13;
        __int16 v13 = self->_landscapeInlineComplicationContainerViewController;
        goto LABEL_27;
      }
      landscapeInlineComplicationContainerViewController = [MEMORY[0x1E4F42948] currentDevice];
      if ([landscapeInlineComplicationContainerViewController userInterfaceIdiom] != 1)
      {
        unint64_t v17 = [(CSCoverSheetViewController *)self interfaceOrientation] - 3;

        if (v17 >= 2)
        {
LABEL_28:
          [(SBFLockScreenDateViewController *)self->_dateViewController setInlineComplicationViewController:v13];

          goto LABEL_29;
        }
        goto LABEL_26;
      }
    }
    else
    {
      self->_landscapeInlineComplicationContainerViewController = 0;
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:
}

- (id)succinctDescription
{
  int v2 = [(CSCoverSheetViewController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(CSCoverSheetViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  int v5 = [(CSCoverSheetViewController *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AD88C0;
  void v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  char v7 = v11;
  id v8 = v6;

  return v8;
}

id __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTransitioning])
  {
    int v2 = (void *)MEMORY[0x1E4F4F718];
    BOOL v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) currentTransitionSource];
    int v5 = [v2 descriptionForObject:v4];
    id v6 = (id)[v3 appendObject:v5 withName:@"transitionSource"];

    char v7 = *(void **)(a1 + 40);
    long long v8 = *(_OWORD *)(*(void *)(a1 + 32) + 1152);
    long long v9 = *(_OWORD *)(*(void *)(a1 + 32) + 1184);
    v52[1] = *(_OWORD *)(*(void *)(a1 + 32) + 1168);
    v52[2] = v9;
    v52[0] = v8;
    char v10 = NSStringFromCoverSheetTransitionContext(v52);
    id v11 = (id)[v7 appendObject:v10 withName:@"transitionContext"];
  }
  unint64_t v12 = *(void **)(a1 + 40);
  __int16 v13 = [*(id *)(a1 + 32) coverSheetView];
  id v14 = (id)[v12 appendObject:v13 withName:@"view"];

  uint64_t v15 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) _appearState];
  BOOL v16 = SBFStringForAppearState();
  id v17 = (id)[v15 appendObject:v16 withName:@"appearState"];

  id v18 = *(void **)(a1 + 40);
  long long v19 = [*(id *)(a1 + 32) pageViewControllers];
  [v18 appendArraySection:v19 withName:@"pageControllers" skipIfEmpty:0];

  long long v20 = *(void **)(a1 + 40);
  long long v21 = [*(id *)(a1 + 32) modalPresentationController];
  id v22 = (id)[v20 appendObject:v21 withName:@"modalPresentationController" skipIfNil:1];

  id v23 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 1136) withName:@"notificationDispatcher"];
  id v24 = *(void **)(a1 + 40);
  id v25 = [*(id *)(*(void *)(a1 + 32) + 1120) allObjects];
  uint64_t v26 = [*(id *)(a1 + 40) activeMultilinePrefix];
  [v24 appendArraySection:v25 withName:@"observers" multilinePrefix:v26 skipIfEmpty:1 objectTransformer:&__block_literal_global_358];

  long long v27 = *(void **)(a1 + 40);
  int v28 = [*(id *)(*(void *)(a1 + 32) + 1080) allObjects];
  BOOL v29 = [*(id *)(a1 + 40) activeMultilinePrefix];
  [v27 appendArraySection:v28 withName:@"externalAppearanceProviders" multilinePrefix:v29 skipIfEmpty:1 objectTransformer:&__block_literal_global_363];

  long long v30 = *(void **)(a1 + 40);
  id v31 = [*(id *)(*(void *)(a1 + 32) + 1088) allObjects];
  id v32 = [*(id *)(a1 + 40) activeMultilinePrefix];
  [v30 appendArraySection:v31 withName:@"externalBehaviorProviders" multilinePrefix:v32 skipIfEmpty:1 objectTransformer:&__block_literal_global_368];

  __int16 v33 = *(void **)(a1 + 40);
  BOOL v34 = [*(id *)(*(void *)(a1 + 32) + 1096) allObjects];
  id v35 = [*(id *)(a1 + 40) activeMultilinePrefix];
  [v33 appendArraySection:v34 withName:@"externalEventHandlers" multilinePrefix:v35 skipIfEmpty:1 objectTransformer:&__block_literal_global_373];

  id v36 = *(void **)(a1 + 40);
  long long v37 = [*(id *)(*(void *)(a1 + 32) + 1112) allObjects];
  id v38 = [*(id *)(a1 + 40) activeMultilinePrefix];
  [v36 appendArraySection:v37 withName:@"externalLockProviders" multilinePrefix:v38 skipIfEmpty:1 objectTransformer:&__block_literal_global_378];

  id v39 = *(void **)(a1 + 40);
  BOOL v40 = [*(id *)(*(void *)(a1 + 32) + 1104) allObjects];
  int v41 = [*(id *)(a1 + 40) activeMultilinePrefix];
  [v39 appendArraySection:v40 withName:@"externalPresentationProviders" multilinePrefix:v41 skipIfEmpty:1 objectTransformer:&__block_literal_global_383];

  char v42 = *(void **)(a1 + 40);
  uint64_t v43 = [*(id *)(a1 + 32) activeAppearance];
  id v44 = (id)[v42 appendObject:v43 withName:@"activeAppearance"];

  long long v45 = *(void **)(a1 + 40);
  uint64_t v46 = [*(id *)(a1 + 32) activeBehavior];
  id v47 = (id)[v45 appendObject:v46 withName:@"activeBehavior"];

  long long v48 = *(void **)(a1 + 40);
  int v49 = [*(id *)(a1 + 32) activePresentation];
  id v50 = (id)[v48 appendObject:v49 withName:@"activePresentation"];

  return (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 1416) withName:@"scrollGestureController"];
}

uint64_t __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

uint64_t __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

uint64_t __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

uint64_t __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

uint64_t __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

uint64_t __68__CSCoverSheetViewController_descriptionBuilderWithMultilinePrefix___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

- (NSString)coverSheetIdentifier
{
  int v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CSPresentation)externalPresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(CSCoverSheetViewController *)self isViewLoaded])
  {
    BOOL v3 = [(CSCoverSheetViewController *)self view];
    id v4 = [v3 window];
    int v5 = +[CSPresentation presentationWithCoordinateSpace:v4];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_externalPresentationProviders;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = -[CSCoverSheetViewController _presentationForParticipant:](self, "_presentationForParticipant:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 unionPresentation:v11];
        }
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    int v5 = 0;
  }

  return (CSPresentation *)v5;
}

- (void)updateAppearanceForController:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (a3 == self)
  {
    uint64_t v7 = [v5 coverSheetIdentifier];
    [v8 _updateActiveAppearanceForReason:v7];

    id v6 = (void *)v7;
  }
  else
  {
    [(CSCoverSheetViewController *)self updateAppearanceForController:v5 withAnimationSettings:0 completion:0];
    id v6 = v8;
  }
}

- (void)updateAppearanceForController:(id)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(id, void))a5;
  id v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CSCoverSheetViewController updateAppearanceForController:withAnimationSettings:completion:]((uint64_t)v8, v11);
  }

  unint64_t v12 = NSString;
  long long v13 = (objc_class *)objc_opt_class();
  long long v14 = NSStringFromClass(v13);
  long long v15 = [v12 stringWithFormat:@"%@:%p", v14, v8];

  if ([v8 participantState] == 2
    || ([(NSMutableArray *)self->_exemptFromInactiveAppearanceParticipants containsObject:v8] & 1) != 0)
  {
    if (![(CSCoverSheetViewController *)self isTransitioning])
    {
      if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock]
        && (!v9
         || ([MEMORY[0x1E4F42FF0] _currentAnimationSettings],
             long long v16 = objc_claimAutoreleasedReturnValue(),
             int v17 = [v9 isEqual:v16],
             v16,
             v17)))
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F4F898];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __93__CSCoverSheetViewController_updateAppearanceForController_withAnimationSettings_completion___block_invoke;
        v24[3] = &unk_1E6AD88C0;
        v24[4] = self;
        id v25 = v15;
        [v18 addAlongsideAnimations:v24 completion:v10];
        long long v19 = v25;
      }
      else
      {
        long long v21 = (void *)MEMORY[0x1E4F4F898];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __93__CSCoverSheetViewController_updateAppearanceForController_withAnimationSettings_completion___block_invoke_2;
        v22[3] = &unk_1E6AD88C0;
        void v22[4] = self;
        id v23 = v15;
        [v21 animateWithSettings:v9 actions:v22 completion:v10];
        long long v19 = v23;
      }

      goto LABEL_17;
    }
  }
  else
  {
    long long v20 = SBLogDashBoard();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewController updateBehaviorForController:]();
    }
  }
  if (v10) {
    v10[2](v10, 0);
  }
LABEL_17:
}

uint64_t __93__CSCoverSheetViewController_updateAppearanceForController_withAnimationSettings_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveAppearanceForReason:*(void *)(a1 + 40)];
}

uint64_t __93__CSCoverSheetViewController_updateAppearanceForController_withAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveAppearanceForReason:*(void *)(a1 + 40)];
}

- (CSCoverSheetViewPresenting)presenter
{
  return 0;
}

- (int64_t)presentationStyle
{
  return 0;
}

- (int64_t)presentationType
{
  return 0;
}

- (int64_t)presentationPriority
{
  return 0;
}

- (int64_t)presentationTransition
{
  return 0;
}

- (int64_t)presentationAltitude
{
  return 0;
}

- (CAFrameRateRange)presentationPreferredFrameRateRange
{
  float v2 = *MEMORY[0x1E4F39AF0];
  float v3 = *(float *)(MEMORY[0x1E4F39AF0] + 4);
  float v4 = *(float *)(MEMORY[0x1E4F39AF0] + 8);
  result.float preferred = v4;
  result.float maximum = v3;
  result.float minimum = v2;
  return result;
}

- (unsigned)presentationFrameRateRangeReason
{
  return 0;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (NSArray)presentationRegions
{
  return 0;
}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (CSRemoteContentModalViewController *)a4;
  if ([(CSCoverSheetViewController *)self participantState] == 2)
  {
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = _SBFLoggingMethodProem();
      id v47 = [MEMORY[0x1E4F4F718] descriptionForObject:v7];
      *(_DWORD *)buf = 138412802;
      uint64_t v73 = v46;
      __int16 v74 = 2112;
      id v75 = v6;
      __int16 v76 = 2112;
      char v77 = v47;
      _os_log_debug_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ fromSender: %@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerController);
    switch([v6 type])
    {
      case 0:
        char v10 = [v6 context];
        id v11 = v10;
        if (v10 && [v10 intent])
        {
          unint64_t v12 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
          long long v13 = [v12 createUnlockRequestForActionContext:v11];

          [(CSCoverSheetViewController *)self setCustomLockScreenActionContext:v11];
          long long v14 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke;
          v70[3] = &unk_1E6AD8EC8;
          v70[4] = self;
          id v71 = v11;
          [v14 unlockWithRequest:v13 completion:v70];

          long long v15 = v71;
          goto LABEL_57;
        }
        long long v48 = [v11 action];

        if (!v48) {
          goto LABEL_28;
        }
        long long v13 = [v11 action];
        v13[2]();
        goto LABEL_58;
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_68;
        }
        if ((CSRemoteContentModalViewController *)self->_modalPresentationController == v7)
        {
          [(CSCoverSheetViewController *)self _setModalPresentationControllerVisibility:0];
        }
        else if ((CSRemoteContentModalViewController *)self->_posterSwitcherViewController == v7)
        {
          [(CSCoverSheetViewController *)self _dismissPosterSwitcherViewController];
        }
        else if (self->_remoteContentModalViewController == v7 {
               || (CSRemoteContentModalViewController *)self->_remoteContentInlineViewController == v7)
        }
        {
          [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:2];
        }
        else
        {
          long long v16 = [(CSCoverSheetViewController *)self pageViewControllers];
          int v17 = [v16 containsObject:v7];

          if (v17)
          {
            uint64_t v18 = objc_opt_class();
            id v11 = __BSSafeCast(v7, v18);
            [(CSCoverSheetViewController *)self _dismissToMainPageFromPageViewController:v11];
LABEL_28:
          }
          else
          {
            char v64 = [(CSCoverSheetViewController *)self mainPageContentViewController];
            [v64 dismissContentViewController:v7 animated:1];

            [(CSCoverSheetViewController *)self _dismissModalViewController:v7 animated:1 completion:0];
          }
        }
LABEL_68:

        break;
      case 2:
        long long v19 = objc_loadWeakRetained((id *)&self->_emergencyCaller);
        [v19 launchEmergencyDialer];
        goto LABEL_30;
      case 3:
        [WeakRetained resetIdleTimerIfTopMost];
        goto LABEL_68;
      case 4:
        [(SBUIPhoneUnlockWithWatchController *)self->_phoneUnlockWithWatchController setSignificantUserInteractionOccuredSinceScreenOn:1];
        long long v20 = [(CSLockScreenSettings *)self->_prototypeSettings idleTimerSettings];
        int v21 = [v20 increaseNotificationScrollLogging];

        if (v21)
        {
          id v22 = SBLogIdleTimer();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D839D000, v22, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] trying idle timer reset", buf, 2u);
          }
        }
        [WeakRetained resetIdleTimerIfTopMost];
        uint64_t v23 = 21;
        goto LABEL_27;
      case 5:
        uint64_t v23 = 22;
        goto LABEL_27;
      case 6:
        uint64_t v23 = 23;
        goto LABEL_27;
      case 7:
        [(CSCoverSheetViewController *)self _addBedtimeGreetingBackgroundView];
        goto LABEL_68;
      case 8:
        -[CSCoverSheetViewController _removeBedtimeGreetingBackgroundViewAnimated:](self, "_removeBedtimeGreetingBackgroundViewAnimated:", [v6 animated]);
        goto LABEL_68;
      case 9:
        uint64_t v23 = 37;
LABEL_27:
        id v11 = +[CSEvent eventWithType:v23];
        [(CSCoverSheetViewController *)self _handleEvent:v11];
        goto LABEL_28;
      case 10:
        long long v19 = [(CSCoverSheetContextProviding *)self->_coverSheetContext reachabilityController];
        [v19 deactivateReachability];
LABEL_30:

        goto LABEL_68;
      case 11:
        id v24 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
        id v25 = [v24 createUnlockRequest];

        [v25 setIntent:3];
        [v25 setSource:15];
        uint64_t v26 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
        [v26 unlockWithRequest:v25 completion:0];

        goto LABEL_68;
      case 12:
        uint64_t v27 = objc_opt_class();
        int v28 = v7;
        if (v27)
        {
          if (objc_opt_isKindOfClass()) {
            BOOL v29 = v28;
          }
          else {
            BOOL v29 = 0;
          }
        }
        else
        {
          BOOL v29 = 0;
        }
        int v49 = v29;

        activityViewController = self->_activityViewController;
        self->_activityViewController = v49;

        int v51 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v52 = [v51 userInterfaceIdiom];

        if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1
          || ![(CSUserPresenceMonitor *)self->_userPresenceMonitor isUserPresenceDetectionSupported])
        {
          int v53 = 0;
        }
        else
        {
          int v53 = ![(CSUserPresenceMonitor *)self->_userPresenceMonitor userPresenceDetectedSinceWake];
        }
        if (!self->_activityViewController
          || ((![(CSCoverSheetViewController *)self _canPresentSwipeDismissableModal] | v53) & 1) != 0)
        {
          goto LABEL_68;
        }
        double v54 = [(CSCoverSheetViewController *)self activeBehavior];
        int v55 = [v54 areRestrictedCapabilities:0x400000];

        double v56 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v57 = [v56 userInterfaceIdiom];

        int v58 = (v57 & 0xFFFFFFFFFFFFFFFBLL) != 1;
        if ((v57 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v55)
        {
          int v59 = +[CSLockScreenDomain rootSettings];
          int v60 = [v59 focusSettings];
          int v58 = [v60 requiresAuthWithoutControlCenterAccess];
        }
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_406;
        v69[3] = &unk_1E6AD87F8;
        v69[4] = self;
        uint64_t v61 = MEMORY[0x1D9487300](v69);
        id v11 = (void *)v61;
        if (v58)
        {
          int v62 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
          long long v13 = [v62 createUnlockRequest];

          [v13 setIntent:2];
          [v13 setSource:24];
          [v13 setName:@"FocusPicker"];
          [v13 setWantsBiometricPresentation:1];
          [v13 setConfirmedNotInPocket:1];
          char v63 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_2;
          v67[3] = &unk_1E6AD8B48;
          id v68 = v11;
          [v63 unlockWithRequest:v13 completion:v67];

          long long v15 = v68;
LABEL_57:

LABEL_58:
        }
        else
        {
          (*(void (**)(uint64_t))(v61 + 16))(v61);
        }
        goto LABEL_28;
      case 13:
        long long v30 = [(CSCoverSheetViewController *)self viewIfLoaded];
        uint64_t v31 = [v30 window];
        id v11 = [(id)v31 windowScene];

        id v32 = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v31) = [v32 coverSheetViewControllerIsShowingSecureApp:self];

        if ((v31 & 1) == 0)
        {
          if (v11)
          {
            __int16 v33 = [(CSCoverSheetViewController *)self traitCollection];
            uint64_t v34 = [v33 _backlightLuminance];

            if (v34 == 1)
            {
              id v35 = NSString;
              id v36 = (objc_class *)objc_opt_class();
              long long v37 = NSStringFromClass(v36);
              id v38 = [v35 stringWithFormat:@"Inactive content update from <%@: %p>", v37, v7];

              int v39 = [v6 animated];
              BOOL v40 = SBLogLiveRendering();
              BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
              if (v39)
              {
                if (v41)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v73 = v38;
                  _os_log_impl(&dword_1D839D000, v40, OS_LOG_TYPE_DEFAULT, "Will request live-rendering assertion with reason: '%@'", buf, 0xCu);
                }

                char v42 = [MEMORY[0x1E4FA5E68] sharedInstance];
                uint64_t v43 = [v42 acquireLiveRenderingAssertionForUIScene:v11 reason:v38];

                dispatch_time_t v44 = dispatch_time(0, 1000000000);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_415;
                block[3] = &unk_1E6AD87F8;
                id v66 = v43;
                id v45 = v43;
                dispatch_after(v44, MEMORY[0x1E4F14428], block);
              }
              else
              {
                if (v41)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v73 = v38;
                  _os_log_impl(&dword_1D839D000, v40, OS_LOG_TYPE_DEFAULT, "Will invalidate timelines with reason '%@'", buf, 0xCu);
                }

                id v45 = [v11 _backlightSceneEnvironment];
                [v45 invalidateAllTimelinesForReason:v38];
              }
            }
          }
        }
        goto LABEL_28;
      default:
        goto LABEL_68;
    }
  }
}

void __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    float v3 = [*(id *)(a1 + 32) _customLockScreenActionContext];
    float v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      id v5 = *(void **)(a1 + 32);
      [v5 setCustomLockScreenActionContext:0];
    }
  }
}

void __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_406(uint64_t a1)
{
  float v2 = [*(id *)(*(void *)(a1 + 32) + 1728) activityPickerViewController];
  [v2 setParentContainer:*(void *)(a1 + 32)];
  float v3 = objc_alloc_init(CSDismissableModalViewController);
  float v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "[ZStack-Participant] adding activity picker modal home affordance", buf, 2u);
  }

  id v5 = [*(id *)(*(void *)(a1 + 32) + 1048) modalHomeAffordanceController];
  [(CSDismissableModalViewController *)v3 setHomeAffordanceController:v5];

  [(CSDismissableModalViewController *)v3 setDelegate:v2];
  [v2 setModalPresenter:v3];
  id v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_407;
  v9[3] = &unk_1E6AD88C0;
  char v10 = v3;
  id v11 = v2;
  id v7 = v2;
  id v8 = v3;
  [v6 _presentModalViewController:v8 shouldDismissOverlays:0 animated:0 completion:v9];
}

uint64_t __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_407(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentContentViewController:*(void *)(a1 + 40) animated:1];
}

uint64_t __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __54__CSCoverSheetViewController_handleAction_fromSender___block_invoke_415(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_addBedtimeGreetingBackgroundView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  float v3 = [(CSCoverSheetViewController *)self coverSheetView];
  float v4 = [v3 bedtimeGreetingViewBackgroundView];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA7998]);
    id v6 = [MEMORY[0x1E4F42D90] mainScreen];
    [v6 bounds];
    id v7 = objc_msgSend(v5, "initWithFrame:");

    [v7 setAutoresizingMask:18];
    id v8 = [(CSCoverSheetViewController *)self activeAppearance];
    id v9 = [v8 legibilitySettings];
    uint64_t v10 = [v9 style];

    if (v10 == 1) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 2;
    }
    [v7 setBackgroundStyle:v11];
    unint64_t v12 = [(CSCoverSheetViewController *)self _averageLockScreenWallpaperColor];
    [v7 setReduceTransparencyBackingColor:v12];

    long long v13 = SBLogDoNotDisturbBedtime();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      long long v16 = v7;
      _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "Adding greeting view background: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    long long v14 = [(CSCoverSheetViewController *)self coverSheetView];
    [v14 setBedtimeGreetingViewBackgroundView:v7];
  }
}

- (void)_removeBedtimeGreetingBackgroundViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  id v6 = [v5 bedtimeGreetingViewBackgroundView];

  if (v6)
  {
    id v7 = SBLogDoNotDisturbBedtime();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(CSCoverSheetViewController *)self coverSheetView];
      id v9 = [v8 bedtimeGreetingViewBackgroundView];
      *(_DWORD *)buf = 138543362;
      long long v14 = v9;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Removing greeting view background: %{public}@", buf, 0xCu);
    }
    double v10 = 0.6;
    if (!v3) {
      double v10 = 0.0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__CSCoverSheetViewController__removeBedtimeGreetingBackgroundViewAnimated___block_invoke;
    v12[3] = &unk_1E6AD87F8;
    void v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__CSCoverSheetViewController__removeBedtimeGreetingBackgroundViewAnimated___block_invoke_2;
    v11[3] = &unk_1E6AD8A40;
    v11[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v12 animations:v11 completion:v10];
  }
}

void __75__CSCoverSheetViewController__removeBedtimeGreetingBackgroundViewAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coverSheetView];
  v1 = [v2 bedtimeGreetingViewBackgroundView];
  [v1 setBackgroundStyle:1];
}

void __75__CSCoverSheetViewController__removeBedtimeGreetingBackgroundViewAnimated___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) coverSheetView];
  [v1 setBedtimeGreetingViewBackgroundView:0];
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  id v4 = a3;
  p_modalPresentationController = &self->_modalPresentationController;
  if ([(CSPresentationViewController *)self->_modalPresentationController participantState] == 2)
  {
    if ([(CSPresentationViewController *)*p_modalPresentationController wouldHandleButtonEvent:v4])
    {
      id v6 = *p_modalPresentationController;
      if (v6) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    id v7 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:self->_lastSettledPageIndex];
    if ([v7 wouldHandleButtonEvent:v4]) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }

    if (v6) {
      goto LABEL_12;
    }
  }
  id v8 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  id v6 = v8;
  if (!v8
    || ([(CSModalPresentationViewController *)v8 presentationProgress], v9 <= 0.0)
    || ![(CSPresentationViewController *)v6 wouldHandleButtonEvent:v4])
  {

    BOOL v11 = 0;
    goto LABEL_16;
  }
LABEL_12:
  double v10 = SBLogDashBoard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(CSCoverSheetViewController *)(uint64_t)p_modalPresentationController wouldHandleButtonEvent:v10];
  }

  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (void)coverSheetLegibilityProviderDidUpdate:(id)a3
{
}

- (BOOL)isTransitioningInteractively
{
  currentTransitionSource = self->_currentTransitionSource;
  if (currentTransitionSource)
  {
    [(CSCoverSheetViewTransitionSource *)currentTransitionSource transitionContext];
    LOBYTE(currentTransitionSource) = v4 == 3;
  }
  return (char)currentTransitionSource;
}

- (BOOL)shouldModifyPageScrolling
{
  id v2 = [(CSCoverSheetViewController *)self activeBehavior];
  BOOL v3 = [v2 scrollingStrategy] != 2;

  return v3;
}

- (BOOL)isTouchLocation:(CGPoint)a3 inRestrictedRectForGestureView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  char v9 = objc_msgSend(v8, "isTouchLocationInRestrictedRect:", x, y);

  double v10 = [(CSCoverSheetViewController *)self view];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v35.origin.double x = v12;
  v35.origin.double y = v14;
  v35.size.double width = v16;
  v35.size.double height = v18;
  CGFloat Width = CGRectGetWidth(v35);
  v36.origin.double x = v12;
  v36.origin.double y = v14;
  v36.size.double width = v16;
  v36.size.double height = v18;
  double Height = CGRectGetHeight(v36);
  int v21 = [(CSCoverSheetViewController *)self view];
  [v21 safeAreaInsets];
  CGFloat v23 = v22;
  double v25 = v24;

  uint64_t v26 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];

  if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    LOBYTE(v28) = 0;
  }
  else
  {
    v37.origin.double x = 0.0;
    v37.origin.double y = 0.0;
    v37.size.double width = Width;
    v37.size.double height = v23;
    v33.double x = x;
    v33.double y = y;
    BOOL v29 = CGRectContainsPoint(v37, v33);
    v38.origin.double y = Height - v25;
    v38.origin.double x = 0.0;
    v38.size.double width = Width;
    v38.size.double height = v25;
    v34.double x = x;
    v34.double y = y;
    int v28 = v29 | CGRectContainsPoint(v38, v34);
  }
  BOOL v30 = -[CSCoverSheetViewController _quickActionButtonInterpretsLocation:asBesideContentForGestureView:](self, "_quickActionButtonInterpretsLocation:asBesideContentForGestureView:", v7, x, y);
  if (v9) {
    char v31 = 1;
  }
  else {
    char v31 = v28 | v30;
  }

  return v31;
}

- (void)setRestrictsTouchesForRemoteView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  [v4 setRestrictsTouchesForRemoteView:v3];
}

- (void)transitionSource:(id)a3 willBeginWithType:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = (CSCoverSheetViewTransitionSource *)a3;
  if (self->_transitionType
    && ![(CSCoverSheetViewController *)self _isKnownTransitionConflictFrom:self->_currentTransitionSource to:v7])
  {
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      char v31 = (objc_class *)objc_opt_class();
      CGRect v38 = NSStringFromClass(v31);
      id v32 = NSStringFromCoverSheetTransitionType(self->_transitionType);
      CGPoint v33 = (objc_class *)objc_opt_class();
      CGPoint v34 = NSStringFromClass(v33);
      NSStringFromCoverSheetTransitionType(a4);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v34;
      *(void *)((char *)&v40 + 2) = LOWORD(v40) = 2112;
      CGRect v35 = *(void **)((char *)&v40 + 2);
      _os_log_fault_impl(&dword_1D839D000, v8, OS_LOG_TYPE_FAULT, "[Transition] Nested transitions are not supported. Current source: %@ | type: %@; new source: %@ | type: %@",
        buf,
        0x2Au);
    }
  }
  currentTransitionSource = self->_currentTransitionSource;
  if (currentTransitionSource) {
    BOOL v10 = currentTransitionSource == v7;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!a4)
    {
      CGRect v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2, self, @"CSCoverSheetViewController.m", 3907, @"Invalid parameter not satisfying: %@", @"type != CSCoverSheetTransitionTypeNone" object file lineNumber description];
    }
    double v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v12 = (objc_class *)objc_opt_class();
      double v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[Transition] Will begin from %@", buf, 0xCu);
    }
    if (!self->_currentTransitionSource)
    {
      CGFloat v14 = [(CSCoverSheetViewController *)self activeAppearance];
      [(CSCoverSheetViewController *)self setPreviousAppearance:v14];

      double v15 = NSString;
      CGFloat v16 = [(CSCoverSheetViewTransitionSource *)v7 coverSheetIdentifier];
      double v17 = [v15 stringWithFormat:@"beginTransition-%@", v16];

      [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v17 updatingAppearanceIfNeeded:0];
      [(CSCoverSheetViewController *)self setCurrentTransitionSource:v7];
      self->_transitionType = a4;
      if ([(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:v7])
      {
        CGFloat v18 = self->_currentTransitionSource;
        if (v18)
        {
          [(CSCoverSheetViewTransitionSource *)v18 transitionContext];
        }
        else
        {
          long long v40 = 0u;
          memset(buf, 0, sizeof(buf));
        }
        long long v25 = *(_OWORD *)&buf[16];
        *(_OWORD *)&self->_transitionContext.unint64_t value = *(_OWORD *)buf;
        *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v25;
        *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v40;
      }
      [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v17];
    }
    if ([(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:v7]) {
      uint64_t v26 = @"com.apple.springboard.lock-screen.scroll";
    }
    else {
      uint64_t v26 = @"CSCoverSheetViewController";
    }
    long long v19 = [(CSCoverSheetViewControllerBase *)self _displayLayoutPublisher];
    if (!v19)
    {
      CGRect v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:3937 description:@"No publisher"];
    }
    displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
    if (displayLayoutTransitionAssertion)
    {
      [(BSInvalidatable *)displayLayoutTransitionAssertion invalidate];
      int v28 = self->_displayLayoutTransitionAssertion;
      self->_displayLayoutTransitionAssertion = 0;
    }
    BOOL v29 = [v19 transitionAssertionWithReason:v26];
    BOOL v30 = self->_displayLayoutTransitionAssertion;
    self->_displayLayoutTransitionAssertion = v29;
  }
  else
  {
    long long v19 = SBLogDashBoard();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = (objc_class *)objc_opt_class();
      double v22 = NSStringFromClass(v21);
      CGFloat v23 = (objc_class *)objc_opt_class();
      double v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, "[Transition] Ignoring transition began from %@ since there is an active transition from %@", buf, 0x16u);
    }
  }
}

- (void)transitionSource:(id)a3 didUpdateTransitionWithContext:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = (CSCoverSheetViewTransitionSource *)a3;
  currentTransitionSource = self->_currentTransitionSource;
  id v8 = SBLogDashBoard();
  char v9 = v8;
  if (currentTransitionSource == v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      int v28 = NSStringFromClass(v27);
      long long v29 = *(_OWORD *)&a4->var1.var0.var1;
      *(_OWORD *)buf = *(_OWORD *)&a4->var0;
      *(_OWORD *)&uint8_t buf[16] = v29;
      long long v38 = *(_OWORD *)&a4->var1.var1.var1;
      BOOL v30 = NSStringFromCoverSheetTransitionContext((long long *)buf);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_debug_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEBUG, "[Transition] Update from %@ with context %@", buf, 0x16u);
    }
    $06DF839FA51B3C3CDB187C0923524556 var1 = a4->var1.var1;
    *($06DF839FA51B3C3CDB187C0923524556 *)buf = a4->var1.var0;
    *($06DF839FA51B3C3CDB187C0923524556 *)&uint8_t buf[16] = var1;
    if (BSIntervalOrder()
      || self->_transitionContext.mode
      && ($DCA72CBAB2CDF67DA9370D0153CCCF3D end = self->_transitionContext.interval.end,
          *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)buf = self->_transitionContext.interval.start,
          *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)&uint8_t buf[16] = end,
          BSIntervalOrder()))
    {
      $06DF839FA51B3C3CDB187C0923524556 v15 = a4->var1.var1;
      *($06DF839FA51B3C3CDB187C0923524556 *)buf = a4->var1.var0;
      *($06DF839FA51B3C3CDB187C0923524556 *)&uint8_t buf[16] = v15;
      BSIntervalFractionForValue();
      double v17 = v16;
      if ([(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:v6])
      {
        long long v19 = *(_OWORD *)&a4->var1.var0.var1;
        long long v18 = *(_OWORD *)&a4->var1.var1.var1;
        *(_OWORD *)&self->_transitionContext.unint64_t value = *(_OWORD *)&a4->var0;
        *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v19;
        *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v18;
        unint64_t var0 = (unint64_t)a4->var1.var1.var0;
        BOOL v21 = (a4->var2 & 0xFFFFFFFFFFFFFFFELL) == 2;
        double v22 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        long long v23 = *(_OWORD *)&a4->var1.var0.var1;
        long long v32 = *(_OWORD *)&a4->var0;
        long long v33 = v23;
        v31[2] = __78__CSCoverSheetViewController_transitionSource_didUpdateTransitionWithContext___block_invoke_2;
        v31[3] = &unk_1E6AD8F10;
        v31[4] = self;
        v31[5] = var0;
        BOOL v35 = v21;
        *(double *)&v31[6] = v17;
        long long v34 = *(_OWORD *)&a4->var1.var1.var1;
        [v22 enumerateObjectsUsingBlock:v31];
      }
      [(CSCoverSheetViewController *)self _updateIdleTimerForTransitionProgress:v17];
      [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"TransitionSourceDidUpdate"];
    }
    else if ([(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:v6])
    {
      unint64_t v25 = (unint64_t)a4->var1.var1.var0;
      uint64_t v26 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __78__CSCoverSheetViewController_transitionSource_didUpdateTransitionWithContext___block_invoke;
      v36[3] = &__block_descriptor_40_e37_v32__0__CSPageViewController_8Q16_B24l;
      v36[4] = v25;
      [v26 enumerateObjectsUsingBlock:v36];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      CGFloat v12 = (objc_class *)objc_opt_class();
      double v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Transition] Ignoring transition update from %@ since there is an active transition from %@", buf, 0x16u);
    }
  }
}

uint64_t __78__CSCoverSheetViewController_transitionSource_didUpdateTransitionWithContext___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (*(void *)(result + 32) == a3) {
    return [a2 updateTransitionWhileRubberBandingInProgress:1];
  }
  return result;
}

void __78__CSCoverSheetViewController_transitionSource_didUpdateTransitionWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (*(void *)(a1 + 40) == a3)
  {
    int v6 = [*(id *)(a1 + 32) _isPageContentHidden];
    id v7 = v9;
    uint64_t v8 = v6 ^ 1u;
  }
  else
  {
    id v7 = v5;
    uint64_t v8 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v7, v8, *(unsigned __int8 *)(a1 + 104)))
  {
    [v9 setTransitioning:1];
    [v9 willTransitionToVisible:v8];
    if (v8) {
      [v9 rebuildAppearance];
    }
  }
  if ([v9 isTransitioning]) {
    [v9 updateTransitionToVisible:v8 progress:*(void *)(a1 + 96) mode:*(double *)(a1 + 48)];
  }
}

- (void)transitionSource:(id)a3 didEndWithContext:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  int v6 = (CSCoverSheetViewTransitionSource *)a3;
  BOOL v7 = self->_currentTransitionSource == v6;
  uint64_t v8 = SBLogDashBoard();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      CGFloat v14 = (objc_class *)objc_opt_class();
      $06DF839FA51B3C3CDB187C0923524556 v15 = NSStringFromClass(v14);
      long long v16 = *(_OWORD *)&a4->var1.var0.var1;
      *(_OWORD *)buf = *(_OWORD *)&a4->var0;
      *(_OWORD *)&uint8_t buf[16] = v16;
      long long v57 = *(_OWORD *)&a4->var1.var1.var1;
      double v17 = NSStringFromCoverSheetTransitionContext((long long *)buf);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[Transition] Will end from %@ with context %@", buf, 0x16u);
    }
    $06DF839FA51B3C3CDB187C0923524556 var1 = a4->var1.var1;
    *($06DF839FA51B3C3CDB187C0923524556 *)buf = a4->var1.var0;
    *($06DF839FA51B3C3CDB187C0923524556 *)&uint8_t buf[16] = var1;
    if (!BSIntervalOrder())
    {
      if (!self->_transitionContext.mode
        || ($DCA72CBAB2CDF67DA9370D0153CCCF3D end = self->_transitionContext.interval.end,
            *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)buf = self->_transitionContext.interval.start,
            *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)&uint8_t buf[16] = end,
            !BSIntervalOrder()))
      {
        if ([(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:v6])
        {
          double var0 = a4->var1.var1.var0;
          BOOL v30 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __65__CSCoverSheetViewController_transitionSource_didEndWithContext___block_invoke;
          v55[3] = &__block_descriptor_40_e37_v32__0__CSPageViewController_8Q16_B24l;
          v55[4] = (unint64_t)var0;
          [v30 enumerateObjectsUsingBlock:v55];
        }
      }
    }
    if ([(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:v6])
    {
      long long v19 = [(CSCoverSheetViewController *)self coverSheetView];
      long long v20 = [v19 scrollView];
      uint64_t v21 = [v20 visiblePageRange];
      uint64_t v23 = v22;

      double v24 = SBLogDashBoard();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v21 + v23;
        _os_log_impl(&dword_1D839D000, v24, OS_LOG_TYPE_DEFAULT, "[Transition] New visible pages indexes: [%lu..%lu]", buf, 0x16u);
      }

      if (v23 == 1)
      {
        unint64_t v25 = [(CSCoverSheetViewController *)self coverSheetView];
        uint64_t v26 = [v25 scrollView];
        -[CSCoverSheetViewController _setLastSettledPageIndex:](self, "_setLastSettledPageIndex:", [v26 currentPageIndex]);

        v54[0] = (double)self->_lastSettledPageIndex;
        v54[2] = v54[0];
        *(void *)&v54[1] = 1;
        *(void *)&v54[3] = 1;
        CSCoverSheetTransitionContextMake((uint64_t)v54, 0, (uint64_t)buf);
        long long v27 = *(_OWORD *)&buf[16];
        *(_OWORD *)&self->_transitionContext.unint64_t value = *(_OWORD *)buf;
        *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v27;
        *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v57;
      }
      else
      {
        long long v32 = *(_OWORD *)&a4->var1.var0.var1;
        long long v31 = *(_OWORD *)&a4->var1.var1.var1;
        *(_OWORD *)&self->_transitionContext.unint64_t value = *(_OWORD *)&a4->var0;
        *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v32;
        *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v31;
      }
      long long v33 = SBLogDashBoard();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        long long v34 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
        *(_OWORD *)buf = *(_OWORD *)&self->_transitionContext.value;
        *(_OWORD *)&uint8_t buf[16] = v34;
        long long v57 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
        BOOL v35 = NSStringFromCoverSheetTransitionContext((long long *)buf);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v35;
        _os_log_impl(&dword_1D839D000, v33, OS_LOG_TYPE_DEFAULT, "[Transition] Updated internal transition context: %@", buf, 0xCu);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      unsigned char buf[24] = 0;
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      char v53 = 0;
      $DCA72CBAB2CDF67DA9370D0153CCCF3D v36 = self->_transitionContext.interval.end;
      $DCA72CBAB2CDF67DA9370D0153CCCF3D start = self->_transitionContext.interval.start;
      $DCA72CBAB2CDF67DA9370D0153CCCF3D v51 = v36;
      uint64_t v37 = BSIntervalOrder();
      double v38 = a4->var1.var1.var0;
      uint64_t v39 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __65__CSCoverSheetViewController_transitionSource_didEndWithContext___block_invoke_442;
      v48[3] = &unk_1E6AD8F38;
      BOOL v49 = v37 == 0;
      v48[4] = self;
      v48[5] = buf;
      v48[6] = v52;
      v48[7] = (unint64_t)v38;
      [v39 enumerateObjectsUsingBlock:v48];

      _Block_object_dispose(v52, 8);
      _Block_object_dispose(buf, 8);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerController);
    uint64_t v8 = WeakRetained;
    if (self->_transitionDisabledIdleTimer) {
      [WeakRetained removeIdleTimerDisabledAssertionReason:@"CSCoverSheetTransitioningReason"];
    }
    [(BSInvalidatable *)self->_displayLayoutTransitionAssertion invalidate];
    displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
    self->_displayLayoutTransitionAssertion = 0;

    self->_transitionType = 0;
    [(CSCoverSheetViewController *)self setCurrentTransitionSource:0];
    self->_transitionDisabledIdleTimer = 0;
    char v42 = SBLogDashBoard();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = (objc_class *)objc_opt_class();
      dispatch_time_t v44 = NSStringFromClass(v43);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v44;
      _os_log_impl(&dword_1D839D000, v42, OS_LOG_TYPE_DEFAULT, "[Transition] Did end transition from %@", buf, 0xCu);
    }
    [v8 removeIdleTimerDisabledAssertionReason:@"CSCoverSheetTransitioningReason"];
    id v45 = NSString;
    uint64_t v46 = [(CSCoverSheetViewTransitionSource *)v6 coverSheetIdentifier];
    id v47 = [v45 stringWithFormat:@"endTransition-%@", v46];

    [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:v47];
    [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v47];
    [(CSCoverSheetViewController *)self setPreviousAppearance:0];
  }
  else if (v9)
  {
    BOOL v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    CGFloat v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[Transition] Ignoring transition ended from %@ since there is an active transition from %@", buf, 0x16u);
  }
}

uint64_t __65__CSCoverSheetViewController_transitionSource_didEndWithContext___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (*(void *)(result + 32) == a3) {
    return [a2 updateTransitionWhileRubberBandingInProgress:0];
  }
  return result;
}

uint64_t __65__CSCoverSheetViewController_transitionSource_didEndWithContext___block_invoke_442(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v13 = v5;
  if (*(void *)(a1 + 56) == a3)
  {
    int v6 = [*(id *)(a1 + 32) _isPageContentHidden];
    BOOL v7 = v13;
    uint64_t v8 = v6 ^ 1u;
  }
  else
  {
    BOOL v7 = v5;
    uint64_t v8 = 0;
  }
  if ([v7 isTransitioning])
  {
    [v13 setTransitioning:0];
    objc_msgSend(*(id *)(a1 + 32), "bs_endAppearanceTransitionForChildViewController:toVisible:", v13, v8);
    uint64_t v9 = [v13 didTransitionToVisible:v8];
    if ((v8 & 1) == 0 && *(unsigned char *)(a1 + 64))
    {
      [v13 rebuildAppearance];
      uint64_t v9 = [v13 rebuildBehavior];
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      BOOL v10 = (objc_opt_respondsToSelector() & 1) == 0;
      double v11 = v13;
      if (v10) {
        double v11 = 0;
      }
      uint64_t v9 = [v11 canHostAnApp];
      if (v9)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        if (v8) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
      }
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "bs_endAppearanceTransitionForChildViewController:toVisible:", v13, v8);
  }

  return MEMORY[0x1F4181820](v9);
}

- (void)irisWallpaperPlayerPlaybackStateDidChange:(id)a3
{
  switch([a3 irisPlaybackState])
  {
    case -1:
      int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:4129 description:@"unknown is not a valid state"];

      break;
    case 0:
      BOOL v7 = [(CSCoverSheetViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v7 coverSheetViewControllerIrisPlayingDidFinish:self];
      }

      goto LABEL_7;
    case 1:
    case 2:
    case 3:
      id v5 = [(CSCoverSheetViewController *)self irisBehavior];
      [v5 setIdleTimerMode:3];

      break;
    case 4:
      double v11 = [(CSCoverSheetViewController *)self irisBehavior];
      [v11 setIdleTimerMode:3];

      CGFloat v12 = [(CSCoverSheetContextProviding *)self->_coverSheetContext wallpaperLogger];
      [v12 incrementIrisPlayCount];

      uint64_t v9 = self;
      uint64_t v10 = 1;
      goto LABEL_9;
    case 5:
LABEL_7:
      uint64_t v8 = [(CSCoverSheetViewController *)self irisBehavior];
      [v8 setIdleTimerMode:0];

      uint64_t v9 = self;
      uint64_t v10 = 0;
LABEL_9:
      [(CSCoverSheetViewController *)v9 _updateUIForPlaying:v10 immediately:1];
      break;
    default:
      break;
  }

  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"iris"];
}

- (void)irisWallpaperPlayerIsInteractingDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 irisPlaybackState];
  int v6 = [v4 isIrisInteracting];

  BOOL v7 = SBLogDashBoard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL irisPlayerIsInteracting = self->_irisPlayerIsInteracting;
    uint64_t v9 = PBUIIrisWallpaperPlaybackStateDescription();
    v14[0] = 67109634;
    v14[1] = v6;
    __int16 v15 = 1024;
    BOOL v16 = irisPlayerIsInteracting;
    __int16 v17 = 2112;
    long long v18 = v9;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Iris wallpaper view interaction changed: isIrisInteracting: %{BOOL}u, wasInteracting: %{BOOL}u, playbackState: %@", (uint8_t *)v14, 0x18u);
  }
  if (v5 == 4)
  {
    if (self->_irisPlayerIsInteracting || v6 == 0)
    {
      if (!self->_irisPlayerIsInteracting || (v6 & 1) != 0) {
        goto LABEL_13;
      }
      double v11 = self;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    else
    {
      double v11 = self;
      uint64_t v12 = 1;
      uint64_t v13 = 1;
    }
    [(CSCoverSheetViewController *)v11 _updateUIForPlaying:v12 immediately:v13];
LABEL_13:
    self->_BOOL irisPlayerIsInteracting = v6;
  }
}

- (void)irisWallpaperPlayer:(id)a3 didReplaceGestureRecognizer:(id)a4 withGestureRecognizer:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  if ([(CSCoverSheetViewController *)self _shouldSetUpWallpaperGesture])
  {
    [v13 setDelegate:0];
    [v7 setDelegate:self];
    uint64_t v8 = [(CSCoverSheetViewController *)self irisBehavior];
    int v9 = [v8 areRestrictedCapabilities:256];

    uint64_t v10 = [(CSCoverSheetViewController *)self coverSheetView];
    double v11 = v10;
    if (v9) {
      id v12 = 0;
    }
    else {
      id v12 = v7;
    }
    [v10 setWallpaperGestureRecognizer:v12];
  }
}

- (void)addRemoteContentInlineProvidingManager:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSMutableSet *)self->_remoteContentInlineProvidingManagers addObject:v4];
}

- (void)removeRemoteContentInlineProvidingManager:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSMutableSet *)self->_remoteContentInlineProvidingManagers removeObject:v4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  if ((UITapGestureRecognizer *)self->_wallpaperGestureRecognizer != v4) {
    goto LABEL_2;
  }
  BOOL v16 = [(CSWidgetGridViewController *)self->_complicationContainerViewController view];
  [(UITapGestureRecognizer *)v4 locationInView:v16];
  __int16 v17 = objc_msgSend(v16, "hitTest:withEvent:", 0);
  BOOL v18 = [(CSWidgetGridViewController *)self->_complicationContainerViewController interpretsViewAsContent:v17];

  uint64_t v19 = [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController view];
  [(UITapGestureRecognizer *)v4 locationInView:v19];
  long long v20 = objc_msgSend(v19, "hitTest:withEvent:", 0);
  BOOL v21 = [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController interpretsViewAsContent:v20];

  if (!_os_feature_enabled_impl() || !v18 && !v21)
  {
LABEL_2:
    uint64_t v5 = [(CSCoverSheetViewController *)self view];
    [(UITapGestureRecognizer *)v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __59__CSCoverSheetViewController_gestureRecognizerShouldBegin___block_invoke;
    v108[3] = &unk_1E6AD8F60;
    void v108[4] = self;
    uint64_t v10 = MEMORY[0x1D9487300](v108);
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __59__CSCoverSheetViewController_gestureRecognizerShouldBegin___block_invoke_2;
    v107[3] = &unk_1E6AD8F88;
    v107[4] = self;
    uint64_t v104 = MEMORY[0x1D9487300](v107);
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __59__CSCoverSheetViewController_gestureRecognizerShouldBegin___block_invoke_3;
    v106[3] = &unk_1E6AD8F60;
    void v106[4] = self;
    uint64_t v103 = MEMORY[0x1D9487300](v106);
    double v11 = [(SBFLockScreenDateViewController *)self->_dateViewController inlineComplicationViewController];
    uint64_t v12 = objc_opt_class();
    id v13 = v11;
    CGFloat v14 = (unsigned int (**)(void, double, double))v10;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        __int16 v15 = v13;
      }
      else {
        __int16 v15 = 0;
      }
    }
    else
    {
      __int16 v15 = 0;
    }
    id v23 = v15;

    double v24 = [v23 view];
    [(UITapGestureRecognizer *)v4 locationInView:v24];
    double v26 = v25;
    double v28 = v27;

    long long v29 = [v23 view];
    uint64_t v30 = objc_msgSend(v29, "hitTest:forEvent:", 0, v26, v28);

    long long v31 = [(CSCoverSheetViewController *)self complicationContainerViewController];
    long long v32 = [v31 view];
    [(UITapGestureRecognizer *)v4 locationInView:v32];
    double v34 = v33;
    double v36 = v35;

    uint64_t v37 = [v31 view];
    uint64_t v38 = objc_msgSend(v37, "hitTest:forEvent:", 0, v34, v36);

    id v102 = (void *)v30;
    int v39 = [v23 interpretsViewAsContent:v30];

    char v101 = (void *)v38;
    int v40 = [v31 interpretsViewAsContent:v38];
    uint64_t v41 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
    int v42 = [v41 hasUserInteraction];

    uint64_t v43 = v14;
    if ((UITapGestureRecognizer *)self->_wallpaperGestureRecognizer == v4
      && CSAutobahnEnabledForPlatform()
      && (v14[2](v14, v7, v9) | v42) != 1)
    {
      LOBYTE(v22) = 1;
      goto LABEL_33;
    }
    if (self->_backgroundContentGestureRecognizer == v4)
    {
      dispatch_time_t v44 = (uint64_t (**)(void, void, double, double))v104;
      if (self->_backgroundContentViewController)
      {
        uint64_t v46 = (void *)v103;
        int v22 = ((*(uint64_t (**)(uint64_t, double, double))(v103 + 16))(v103, v7, v9) | v42) ^ 1;
LABEL_63:
        id v45 = v102;
        goto LABEL_64;
      }
      goto LABEL_61;
    }
    if ([(UITapGestureRecognizer *)v4 isEqual:self->_wallpaperGestureRecognizer])
    {
      if ((unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) >= 2)
      {
        dispatch_time_t v44 = (uint64_t (**)(void, void, double, double))v104;
        id v45 = v102;
        if (![(CSCoverSheetViewController *)self _wallpaperGestureShouldRequireUserPresence]|| ![(CSUserPresenceMonitor *)self->_userPresenceMonitor isUserPresenceDetectionSupported]|| [(CSUserPresenceMonitor *)self->_userPresenceMonitor userPresenceDetectedSinceWake])
        {
          if ((v43[2](v43, v7, v9) | v42)) {
            goto LABEL_43;
          }
LABEL_31:
          LOBYTE(v22) = 1;
LABEL_44:
          uint64_t v46 = (void *)v103;
LABEL_64:

          goto LABEL_65;
        }
        id v75 = SBLogDashBoard();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          __int16 v76 = "Live wallpaper gesture not beginning due to no user presence.";
          char v77 = v75;
          os_log_type_t v78 = OS_LOG_TYPE_INFO;
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      goto LABEL_29;
    }
    int v47 = v39 | v40;
    if (![(UITapGestureRecognizer *)v4 isEqual:self->_posterSwitcherGestureRecognizer])
    {
      dispatch_time_t v44 = (uint64_t (**)(void, void, double, double))v104;
      id v45 = v102;
      if (([(UITapGestureRecognizer *)v4 isEqual:self->_complicationSelectionRecognizer] ^ 1 | v47)) {
        goto LABEL_31;
      }
      id v75 = SBLogDashBoard();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v76 = "Complication Selection gesture not beginning because location for the gesture is not in a complication";
        char v77 = v75;
        os_log_type_t v78 = OS_LOG_TYPE_DEFAULT;
LABEL_41:
        _os_log_impl(&dword_1D839D000, v77, v78, v76, buf, 2u);
      }
LABEL_42:

LABEL_43:
      LOBYTE(v22) = 0;
      goto LABEL_44;
    }
    long long v48 = v14;
    BOOL v49 = [(CSCoverSheetViewController *)self activeBehavior];
    int v50 = [v49 areRestrictedCapabilities:0x800000];

    if (v50)
    {
      $DCA72CBAB2CDF67DA9370D0153CCCF3D v51 = SBLogDashBoard();
      uint64_t v43 = v14;
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

LABEL_29:
        LOBYTE(v22) = 0;
LABEL_33:
        dispatch_time_t v44 = (uint64_t (**)(void, void, double, double))v104;
LABEL_62:
        uint64_t v46 = (void *)v103;
        goto LABEL_63;
      }
      *(_WORD *)buf = 0;
      uint64_t v52 = "Rejecting Poster Switcher gesture – capability is restricted.";
LABEL_27:
      _os_log_impl(&dword_1D839D000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
      goto LABEL_28;
    }
    char v53 = [(CSCoverSheetViewController *)self view];
    [v53 bounds];
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    CGFloat v59 = v58;
    CGFloat v61 = v60;

    v113.origin.double x = v55;
    v113.origin.double y = v57;
    v113.size.double width = v59;
    v113.size.double height = v61;
    double Width = CGRectGetWidth(v113);
    v114.origin.double x = v55;
    v114.origin.double y = v57;
    v114.size.double width = v59;
    v114.size.double height = v61;
    double Height = CGRectGetHeight(v114);
    char v64 = [(CSCoverSheetViewController *)self view];
    [v64 safeAreaInsets];
    CGFloat v66 = v65;
    double v68 = v67;

    id v69 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v70 = [v69 userInterfaceIdiom];

    if ((v70 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v115.origin.double x = 0.0;
      v115.origin.double y = 0.0;
      v115.size.double width = Width;
      v115.size.double height = v66;
      v109.double x = v7;
      v109.double y = v9;
      BOOL v71 = CGRectContainsPoint(v115, v109);
      v116.origin.double y = Height - v68;
      v116.origin.double x = 0.0;
      v116.size.double width = Width;
      v116.size.double height = v68;
      v110.double x = v7;
      v110.double y = v9;
      BOOL v72 = CGRectContainsPoint(v116, v110);
      if (v71 || v72)
      {
        $DCA72CBAB2CDF67DA9370D0153CCCF3D v51 = SBLogDashBoard();
        uint64_t v43 = v14;
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        *(_WORD *)buf = 0;
        uint64_t v52 = "Rejecting Poster Switcher gesture – location is in safe area";
        goto LABEL_27;
      }
    }
    uint64_t v73 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v74 = [v73 userInterfaceIdiom];

    if ((v74 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      uint64_t v43 = v14;
      dispatch_time_t v44 = (uint64_t (**)(void, void, double, double))v104;
    }
    else
    {
      uint64_t v79 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
      [(id)v79 horizontalInsetMargin];
      double v81 = v80;

      v117.origin.double x = 0.0;
      v117.origin.double y = 0.0;
      v117.size.double width = v81;
      v117.size.double height = Height;
      v111.double x = v7;
      v111.double y = v9;
      LOBYTE(v79) = CGRectContainsPoint(v117, v111);
      v118.origin.double x = Width - v81;
      v118.origin.double y = 0.0;
      v118.size.double width = v81;
      v118.size.double height = Height;
      v112.double x = v7;
      v112.double y = v9;
      BOOL v82 = CGRectContainsPoint(v118, v112);
      uint64_t v43 = v14;
      dispatch_time_t v44 = (uint64_t (**)(void, void, double, double))v104;
      if ((v79 & 1) != 0 || v82)
      {
        id v83 = SBLogDashBoard();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v84 = "Rejecting Poster Switcher gesture – location is in notification list gutter";
          goto LABEL_59;
        }
LABEL_60:

LABEL_61:
        LOBYTE(v22) = 0;
        goto LABEL_62;
      }
    }
    if (v43[2](v43, v7, v9))
    {
      id v83 = SBLogDashBoard();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v84 = "Rejecting Poster Switcher gesture – location is in combined list";
LABEL_59:
        _os_log_impl(&dword_1D839D000, v83, OS_LOG_TYPE_DEFAULT, v84, buf, 2u);
        goto LABEL_60;
      }
      goto LABEL_60;
    }
    id v85 = [(UITapGestureRecognizer *)v4 view];
    int v86 = ((uint64_t (**)(void, void *, double, double))v44)[2](v44, v85, v7, v9);

    if (v86)
    {
      uint64_t v87 = SBLogDashBoard();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v88 = "Rejecting Poster Switcher gesture – location is over a quick action button";
LABEL_72:
        _os_log_impl(&dword_1D839D000, v87, OS_LOG_TYPE_DEFAULT, v88, buf, 2u);
      }
    }
    else
    {
      id v90 = [(UITapGestureRecognizer *)v4 view];
      BOOL v91 = -[CSCoverSheetViewController _quickActionButtonInterpretsLocation:asBesideContentForGestureView:](self, "_quickActionButtonInterpretsLocation:asBesideContentForGestureView:", v90, v7, v9);

      if (!v91)
      {
        if (!v47)
        {
          uint64_t v92 = [(CSCoverSheetViewController *)self sidebarComplicationContainerViewController];
          id v93 = [v92 view];
          [(UITapGestureRecognizer *)v4 locationInView:v93];
          double v95 = v94;
          double v97 = v96;

          long long v98 = [v92 view];
          long long v99 = objc_msgSend(v98, "hitTest:forEvent:", 0, v95, v97);

          if ([v92 interpretsViewAsContent:v99])
          {
            long long v100 = SBLogDashBoard();
            uint64_t v43 = v48;
            id v45 = v102;
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D839D000, v100, OS_LOG_TYPE_DEFAULT, "Poster Switcher gesture not beginning because location for the gesture is in a sidebar complication", buf, 2u);
            }

            goto LABEL_43;
          }

          uint64_t v43 = v48;
          id v45 = v102;
          goto LABEL_31;
        }
        uint64_t v87 = SBLogDashBoard();
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_73;
        }
        *(_WORD *)buf = 0;
        uint64_t v88 = "Rejecting Poster Switcher gesture – location is in a complication";
        goto LABEL_72;
      }
      uint64_t v87 = SBLogDashBoard();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v88 = "Rejecting Poster Switcher gesture – location is beside the quick action buttons";
        goto LABEL_72;
      }
    }
LABEL_73:

    LOBYTE(v22) = 0;
    uint64_t v43 = v48;
    goto LABEL_62;
  }
  LOBYTE(v22) = 0;
LABEL_65:

  return v22;
}

uint64_t __59__CSCoverSheetViewController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, double a2, double a3)
{
  double v6 = [*(id *)(a1 + 32) view];
  double v7 = objc_msgSend(v6, "hitTest:withEvent:", 0, a2, a3);

  double v8 = [*(id *)(*(void *)(a1 + 32) + 1968) combinedListViewController];
  uint64_t v9 = [v8 interpretsViewAsContent:v7];

  return v9;
}

uint64_t __59__CSCoverSheetViewController_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  double v8 = [*(id *)(a1 + 32) activeAppearance];
  uint64_t v9 = [v8 componentForType:14 identifier:@"(active)"];

  if ([v9 isHidden] & 1) != 0 || (objc_msgSend(v9, "alpha"), (BSFloatIsZero())) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1408), "interpretsLocationAsContent:inView:", v7, a3, a4);
  }

  return v10;
}

uint64_t __59__CSCoverSheetViewController_gestureRecognizerShouldBegin___block_invoke_3(uint64_t a1, double a2, double a3)
{
  double v6 = [*(id *)(a1 + 32) view];
  id v7 = objc_msgSend(v6, "hitTest:withEvent:", 0, a2, a3);

  double v8 = [*(id *)(*(void *)(a1 + 32) + 1968) combinedListViewController];
  if ([v8 interpretsViewAsContent:v7]) {
    uint64_t v9 = [v8 interpretsViewAsAdjunctContent:v7] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_quickActionButtonInterpretsLocation:(CGPoint)a3 asBesideContentForGestureView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(CSCoverSheetViewController *)self _quickActionsSupported])
  {
    double v8 = [(CSCoverSheetViewController *)self activeAppearance];
    uint64_t v9 = [v8 componentForType:14 identifier:@"(active)"];

    BOOL v10 = ([v9 isHidden] & 1) == 0
       && ([v9 alpha], (BSFloatIsZero() & 1) == 0)
       && -[CSQuickActionsViewController interpretsLocationAsBesideButtons:inView:](self->_quickActionsViewController, "interpretsLocationAsBesideButtons:inView:", v7, x, y);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5 = (UILongPressGestureRecognizer *)a3;
  BOOL v6 = ([(UILongPressGestureRecognizer *)v5 isEqual:self->_quickNoteGestureRecognizer] & 1) == 0
    && ((UILongPressGestureRecognizer *)self->_wallpaperGestureRecognizer != v5
     || (CSAutobahnEnabledForPlatform() & 1) == 0)
    && self->_posterSwitcherGestureRecognizer != v5;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  BOOL v6 = (UITapGestureRecognizer *)a3;
  id v7 = (UILongPressGestureRecognizer *)a4;
  BOOL v8 = (UITapGestureRecognizer *)self->_wallpaperGestureRecognizer == v6 && (CSAutobahnEnabledForPlatform() & 1) != 0
    || self->_backgroundContentGestureRecognizer == v6 && self->_posterSwitcherGestureRecognizer == v7;

  return v8;
}

- (void)invalidateLockScreenActionContext
{
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4FB3750];
  BOOL v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    BOOL v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    BOOL v10 = [v4 notificationIdentifier];
    double v11 = objc_msgSend(v10, "un_logDigest");
    int v30 = 138543618;
    long long v31 = v9;
    __int16 v32 = 2114;
    double v33 = v11;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ posting notification %{public}@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v12 = [(CSCoverSheetViewController *)self _fullscreeNotificationViewControllerMatchingNotificationRequest:v4];
  if (v12)
  {
    os_log_t v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v14 = v13;
      __int16 v15 = (objc_class *)objc_opt_class();
      BOOL v16 = NSStringFromClass(v15);
      __int16 v17 = [v4 notificationIdentifier];
      BOOL v18 = objc_msgSend(v17, "un_logDigest");
      uint64_t v19 = (objc_class *)objc_opt_class();
      long long v20 = NSStringFromClass(v19);
      int v30 = 138543874;
      long long v31 = v16;
      __int16 v32 = 2114;
      double v33 = v18;
      __int16 v34 = 2114;
      double v35 = v20;
      _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification %{public}@ to %{public}@", (uint8_t *)&v30, 0x20u);
    }
    [v12 updateNotificationRequest:v4];
  }
  else
  {
    BOOL v21 = objc_alloc_init(CSFullscreenNotificationViewController);
    [(CSFullscreenNotificationViewController *)v21 setDispatcher:self->_notificationDispatcher];
    [(CSFullscreenNotificationViewController *)v21 postNotificationRequest:v4];
    os_log_t v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      double v24 = (objc_class *)objc_opt_class();
      double v25 = NSStringFromClass(v24);
      double v26 = [v4 notificationIdentifier];
      double v27 = objc_msgSend(v26, "un_logDigest");
      double v28 = (objc_class *)objc_opt_class();
      long long v29 = NSStringFromClass(v28);
      int v30 = 138543874;
      long long v31 = v25;
      __int16 v32 = 2114;
      double v33 = v27;
      __int16 v34 = 2114;
      double v35 = v29;
      _os_log_impl(&dword_1D839D000, v23, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presenting notification %{public}@ to %{public}@", (uint8_t *)&v30, 0x20u);
    }
    [(CSCoverSheetViewController *)self _presentModalViewController:v21 shouldDismissOverlays:0 animated:1 completion:0];
  }
}

- (void)updateNotificationRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    BOOL v10 = objc_msgSend(v9, "un_logDigest");
    int v12 = 138543618;
    os_log_t v13 = v8;
    __int16 v14 = 2114;
    __int16 v15 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification %{public}@", (uint8_t *)&v12, 0x16u);
  }
  double v11 = [(CSCoverSheetViewController *)self _fullscreeNotificationViewControllerMatchingNotificationRequest:v4];
  [v11 updateNotificationRequest:v4];
}

- (id)_fullscreeNotificationViewControllerMatchingNotificationRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  BOOL v6 = objc_msgSend(v5, "bs_objectsOfClass:", objc_opt_class());

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v6;
  id v7 = (id)[obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v11 = [v10 notificationRequest];
        int v12 = [v11 sectionIdentifier];
        os_log_t v13 = [v4 sectionIdentifier];
        if ([v12 isEqualToString:v13])
        {
          __int16 v14 = [v11 notificationIdentifier];
          [v4 notificationIdentifier];
          id v15 = v7;
          uint64_t v16 = v8;
          BOOL v18 = v17 = v4;
          int v21 = [v14 isEqualToString:v18];

          id v4 = v17;
          uint64_t v8 = v16;
          id v7 = v15;

          if (v21)
          {
            id v7 = v10;

            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v7 = (id)[obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
LABEL_12:

  return v7;
}

- (void)withdrawNotificationRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    BOOL v10 = objc_msgSend(v9, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    int v30 = v8;
    __int16 v31 = 2114;
    __int16 v32 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", buf, 0x16u);
  }
  long long v23 = self;
  double v11 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  int v12 = objc_msgSend(v11, "bs_objectsOfClass:", objc_opt_class());

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        BOOL v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = [v18 notificationRequest];
        long long v20 = [v19 notificationIdentifier];
        int v21 = [v4 notificationIdentifier];
        int v22 = [v20 isEqualToString:v21];

        if (v22)
        {
          [v18 withdrawNotificationRequest:v4];
          [(CSCoverSheetViewController *)v23 _dismissModalViewController:v18 animated:1 completion:0];
          goto LABEL_13;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  uint64_t v9 = objc_msgSend(v8, "bs_objectsOfClass:", objc_opt_class());

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "updateNotificationSectionSettings:previousSectionSettings:", v6, v7, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  uint64_t v9 = objc_msgSend(v8, "bs_objectsOfClass:", objc_opt_class());

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "updateNotificationSystemSettings:previousSystemSettings:", v6, v7, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  id v6 = objc_msgSend(v5, "bs_objectsOfClass:", objc_opt_class());

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "notificationsLoadedForSectionIdentifier:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSCoverSheetViewController *)self notificationDestination];
  char v6 = [v5 isNotificationContentExtensionVisible:v4];

  return v6;
}

- (BOOL)isPresentingNotificationInLongLook
{
  id v2 = [(CSCoverSheetViewController *)self notificationDestination];
  char v3 = [v2 isPresentingNotificationInLongLook];

  return v3;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  id v4 = [(CSCoverSheetViewController *)self notificationDestination];
  LOBYTE(v3) = [v4 dismissNotificationInLongLookAnimated:v3];

  return v3;
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_applicationHosters;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hostedAppSceneHandle", (void)v11);
        if (v8)
        {
          uint64_t v9 = (void *)v8;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = [(CSPresentationViewController *)self->_modalPresentationController hostedAppSceneHandle];
LABEL_11:

  return v9;
}

- (id)hostedAppSceneHandles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_applicationHosters;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hostedAppSceneHandles", (void)v14);
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(CSPresentationViewController *)self->_modalPresentationController hostedAppSceneHandles];
  long long v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend(v3, "addObjectsFromArray:", v12, (void)v14);

  return v3;
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CSCoverSheetViewController *)self supportedInterfaceOrientations];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_applicationHosters;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = v5 & (1 << a3);
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "isHostingAnApp", (void)v17);
        int v14 = [v12 handlesRotationIndependentOfCoverSheet];
        if (v9) {
          int v15 = 1;
        }
        else {
          int v15 = v14;
        }
        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          [v12 hostedAppWillRotateToInterfaceOrientation:a3];
        }
      }
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  int v6 = 1;
  if (a3 != 3 && a3 != 41)
  {
    id v3 = +[CSLockScreenDomain rootSettings];
    int v6 = [v3 autoDismissUnlockedLockScreen];
  }
  if (a3 != 3 && a3 != 41) {

  }
  if (v6
    && ![(CSPresentationViewController *)self->_modalPresentationController isPresentingContent])
  {
    uint64_t v8 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
    int v7 = [v8 hasContent] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)startRestToOpenCoachingWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_hasContentAboveCoverSheet)
  {
    unint64_t v5 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__CSCoverSheetViewController_startRestToOpenCoachingWithCompletion___block_invoke;
    v6[3] = &unk_1E6AD8B48;
    id v7 = v4;
    [v5 startRestToOpenCoaching:1 withCompletion:v6];
  }
}

uint64_t __68__CSCoverSheetViewController_startRestToOpenCoachingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)fillRestToOpenWithDuration:(double)a3
{
  id v4 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  [v4 fillRestToOpenWithDuration:a3];
}

- (void)resetRestToOpen
{
  id v2 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  [v2 resetRestToOpen];
}

- (BOOL)isRestToOpenAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_externalLockProviders;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "participantState", (void)v9) == 2 && (objc_msgSend(v7, "isLocked") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (v4 | [(CSCoverSheetViewController *)self isPasscodeLockVisible]) ^ 1;
}

- (BOOL)hasVisibleContentToReveal
{
  id v2 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  char v3 = [v2 hasVisibleContentToReveal];

  return v3;
}

- (BOOL)phoneUnlockWithWatchEnabled
{
  return [(SBUIPhoneUnlockWithWatchController *)self->_phoneUnlockWithWatchController phoneUnlockWithWatchEnabled];
}

- (void)attemptPhoneUnlockWithWatch
{
}

- (BOOL)didDetectFaceRequirementsForPAU
{
  return [(SBUIPhoneUnlockWithWatchController *)self->_phoneUnlockWithWatchController didDetectFaceRequirementsForPAU];
}

- (BOOL)didDetectFaceOcclusionsSinceScreenOn
{
  return ([(CSFaceOcclusionMonitor *)self->_faceOcclusionMonitor faceOcclusionsSinceScreenOn] >> 1) & 1;
}

- (BOOL)didDetectBottomFaceOcclusionsSinceScreenOn
{
  return [(CSFaceOcclusionMonitor *)self->_faceOcclusionMonitor faceOcclusionsSinceScreenOn] & 1;
}

- (void)completePhoneAutoUnlockWithNotification:(BOOL)a3
{
}

- (BOOL)shouldCompletePhoneAutoUnlockWithNotification
{
  char v3 = [(CSCoverSheetViewController *)self activeBehavior];
  if ([v3 areRestrictedCapabilities:8])
  {

    return 0;
  }
  uint64_t v4 = [(CSCoverSheetViewController *)self activeBehavior];
  char v5 = [v4 areRestrictedCapabilities:56];

  if (v5) {
    return 0;
  }
  phoneUnlockWithWatchController = self->_phoneUnlockWithWatchController;

  return [(SBUIPhoneUnlockWithWatchController *)phoneUnlockWithWatchController shouldPhoneCompleteAutoUnlockWithNotification];
}

- (BOOL)phoneUnlockWithWatchControllerShowRawErrorCodes:(id)a3
{
  char v3 = +[CSLockScreenDomain rootSettings];
  char v4 = [v3 showRawErrorCodes];

  return v4;
}

- (void)phoneUnlockWithWatchControllerAttemptSucceeded:(id)a3
{
  id v4 = [(CSCoverSheetViewController *)self delegate];
  if (([v4 coverSheetViewControllerIsPasscodeVisible:self] & 1) == 0) {
    [v4 coverSheetViewControllerHandleUnlockAttemptSucceeded:self];
  }
}

- (void)phoneUnlockWithWatchControllerAttemptFailed:(id)a3 withError:(id)a4
{
  id v6 = a4;
  if ([(CSCoverSheetViewController *)self proudLockViewControllerIsCoverSheetVisible])
  {
    char v5 = [(CSProudLockViewController *)self->_proudLockViewController proudLockContainerViewController];
    [v5 handlePhoneUnlockWithWatchError:v6];
  }
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v6 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
      [v6 setFingerOffSinceWake:1];
      goto LABEL_4;
    case 1uLL:
      long long v9 = +[CSAction actionWithType:3];
      [(CSCoverSheetViewController *)self handleAction:v9 fromSender:self];

      id v6 = +[CSEvent eventWithType:34];
      [(CSCoverSheetViewController *)self _handleEvent:v6];
      goto LABEL_4;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
      goto LABEL_5;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0xBuLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
      goto LABEL_2;
    case 0xDuLL:
      goto LABEL_3;
    default:
      if (a3 != 33) {
        goto LABEL_5;
      }
LABEL_2:
      char v5 = +[CSEvent eventWithType:14];
      [(CSCoverSheetViewController *)self _handleEvent:v5];

      if (a3 == 13)
      {
LABEL_3:
        id v6 = +[CSAction actionWithType:4];
        [(CSCoverSheetViewController *)self handleAction:v6 fromSender:self];
LABEL_4:
      }
LABEL_5:
      id v10 = +[CSEvent eventWithType:15];
      id v7 = [NSNumber numberWithUnsignedInteger:a3];
      [v10 setValue:v7];

      [(CSCoverSheetViewController *)self _handleEvent:v10];
      [(CSHomeButtonShowPasscodeRecognizer *)self->_homeButtonShowPasscodeRecognizer handleBiometricEvent:a3];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_homeButtonSuppressAfterUnlockRecognizer);
      [WeakRetained handleBiometricEvent:a3];

      return;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  [(CSCoverSheetViewController *)self noteDeviceBlockedStatusUpdated];
  int v6 = [v5 isEqualToString:@"showRegionsDebugView"];

  if (v6)
  {
    if ([(CSLockScreenSettings *)self->_prototypeSettings showRegionsDebugView])
    {
      id v7 = objc_alloc_init(CSRegionsDebugView);
      uint64_t v8 = [(CSCoverSheetViewController *)self coverSheetView];
      [v8 setRegionsDebugView:v7];
    }
    else
    {
      id v7 = [(CSCoverSheetViewController *)self coverSheetView];
      [(CSRegionsDebugView *)v7 setRegionsDebugView:0];
    }
  }
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"PrototypeSettingsChanged"];

  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"PrototypeSettingsChanged"];
}

- (BOOL)controller:(id)a3 shouldAllowPanScrollingWithSystemGestureRecognizer:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(CSCoverSheetViewController *)self _activeViewControllers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if (-[CSCoverSheetViewController _gestureRecognizer:isLocatedOverHorizontalContentRegionInViewController:](self, "_gestureRecognizer:isLocatedOverHorizontalContentRegionInViewController:", v5, v11, (void)v18))
      {
        break;
      }
      long long v12 = [v11 viewIfLoaded];
      _UISystemGestureLocationInView();
      if (-[CSCoverSheetViewController _overSlidingControlForLocation:inView:](self, "_overSlidingControlForLocation:inView:", v12))
      {
        int v15 = SBLogDashBoard();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v16 = [v12 description];
          *(_DWORD *)buf = 138412290;
          long long v23 = v16;
          _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "Preventing panning scroll for sliding control in view: %@", buf, 0xCu);
        }
LABEL_15:

        goto LABEL_16;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    long long v12 = SBLogDashBoard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v11 description];
      *(_DWORD *)buf = 138412290;
      long long v23 = v15;
      _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "Preventing panning scroll for horizontal content region in view controller: %@", buf, 0xCu);
      goto LABEL_15;
    }
LABEL_16:

    LOBYTE(v14) = 0;
    int v13 = v6;
    goto LABEL_17;
  }
LABEL_10:

  int v13 = [(CSCoverSheetViewController *)self viewIfLoaded];
  _UISystemGestureLocationInView();
  BOOL v14 = !-[CSCoverSheetViewController _overSlidingControlForLocation:inView:](self, "_overSlidingControlForLocation:inView:", v13);
LABEL_17:

  return v14;
}

- (void)controllerWillCancelHorizontalScrolling:(id)a3
{
  id v4 = [(CSCoverSheetViewController *)self coverSheetView];
  objc_msgSend(v4, "setTargetPageIndexForDraggingEnded:", -[CSCoverSheetViewController _lastSettledPageIndex](self, "_lastSettledPageIndex"));
}

- (id)dateView
{
  return (id)[(SBFLockScreenDateViewController *)self->_dateViewController dateViewIfExists];
}

- (void)presentationViewController:(id)a3 didTransitionViewController:(id)a4 toPresented:(BOOL)a5
{
  BOOL v5 = a5;
  id v23 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 coverSheetIdentifier];
  uint64_t v10 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    id v12 = v8;
    int v13 = [v12 contentViewControllers];
    BOOL v14 = v13;
    if (v5)
    {
      int v15 = [v13 containsObject:self->_remoteContentModalViewController];

      if (v15)
      {
        BOOL v16 = [(CSCoverSheetViewController *)self coverSheetView];
        long long v17 = [v23 view];
        [v16 addContentViewWithCustomContentView:v17];

LABEL_10:
      }
    }
    else
    {
      long long v19 = [(CSCoverSheetViewController *)self posterSwitcherViewController];
      int v20 = [v14 containsObject:v19];

      if (v20)
      {
        BOOL v16 = [(CSCoverSheetViewController *)self coverSheetView];
        [v16 removeContentView];
        goto LABEL_10;
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  if (![v8 needsContentView]) {
    goto LABEL_12;
  }
  long long v18 = [(CSCoverSheetViewController *)self coverSheetView];
  id v12 = v18;
  if (v5)
  {
    [v18 addContentView];
    goto LABEL_11;
  }
  [v18 foregroundViewPositionOffset];
  int IsZero = BSFloatIsZero();

  if (IsZero)
  {
    uint64_t v22 = [(CSCoverSheetViewController *)self coverSheetView];
    [v22 removeContentView];
  }
  else
  {
    [(CSAppearance *)self->_localAppearance removeAllComponentsWithIdentifier:@"SwitcherZoomingPresentation"];
  }
LABEL_12:
}

- (void)contentRequestCancellingGesture
{
  char v3 = [(CSCoverSheetViewController *)self coverSheetView];
  id v4 = [v3 scrollView];
  BOOL v5 = [v4 panGestureRecognizer];
  [v5 setEnabled:0];

  id v8 = [(CSCoverSheetViewController *)self coverSheetView];
  id v6 = [v8 scrollView];
  uint64_t v7 = [v6 panGestureRecognizer];
  [v7 setEnabled:1];
}

- (void)_updateOverrideDateIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [(CSCoverSheetViewController *)self _overrideDate];
  p_defaultsDerivedOverrideDate = &self->_defaultsDerivedOverrideDate;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v5 = SBLogDashBoard();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        int v11 = 138543362;
        id v12 = v3;
        uint64_t v7 = "[Date Override] Adding override for date: %{public}@.";
        id v8 = v5;
        uint32_t v9 = 12;
LABEL_7:
        _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
      }
    }
    else if (v6)
    {
      LOWORD(v11) = 0;
      uint64_t v7 = "[Date Override] Removing override.";
      id v8 = v5;
      uint32_t v9 = 2;
      goto LABEL_7;
    }

    objc_storeStrong((id *)p_defaultsDerivedOverrideDate, v3);
    uint64_t v10 = [MEMORY[0x1E4FA5EE8] sharedInstance];
    [v10 setOverrideDate:v3];
  }
}

- (id)_overrideDate
{
  if (![(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForDateTimeOverrides])goto LABEL_18; {
  uint64_t v3 = [(SBLockScreenDefaults *)self->_lockScreenDefaults dateTimeOverridesIntervalSince1970];
  }
  if (!v3)
  {
    if ([(SBLockScreenDefaults *)self->_lockScreenDefaults overridesDateTimeToDefaultToday])
    {
      uint64_t v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[Date Override] Enforcing Hero override.", v18, 2u);
      }

      id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint32_t v9 = [MEMORY[0x1E4F1C9C8] date];
      BOOL v6 = [v8 dateBySettingHour:9 minute:41 second:0 ofDate:v9 options:0];

LABEL_14:
      goto LABEL_19;
    }
    int v10 = [(SBLockScreenDefaults *)self->_lockScreenDefaults overridesDateTimeToDefaultPast];
    int v11 = SBLogDashBoard();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[Date Override] Enforcing Historical override.", v17, 2u);
      }

      id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1168335660.0];
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      double v14 = 1168335660.0 - (double)[v13 secondsFromGMTForDate:v8];

      BOOL v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v14];
      goto LABEL_14;
    }
    if (v12)
    {
      *(_WORD *)BOOL v16 = 0;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[Date Override] Couldn't find override.", v16, 2u);
    }

LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  double v4 = (double)v3;
  BOOL v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[Date Override] Enforcing Custom override.", buf, 2u);
  }

  BOOL v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v4];
LABEL_19:

  return v6;
}

- (void)_addBackgroundContentViewControllerForAction:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [a3 configurationObject];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (a3)
  {
    if (!self->_backgroundContentViewController && v9 != 0)
    {
      int v11 = [(CSCoverSheetViewController *)self view];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      id v29 = v9;
      -[CSBackgroundPresentationManager createBackgroundViewControllerForDefinition:frame:](self->_backgroundPresentationManager, "createBackgroundViewControllerForDefinition:frame:", v9, v13, v15, v17, v19);
      int v20 = (CSBackgroundContentViewController *)objc_claimAutoreleasedReturnValue();
      backgroundContentViewController = self->_backgroundContentViewController;
      self->_backgroundContentViewController = v20;

      uint64_t v22 = self->_backgroundContentViewController;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __75__CSCoverSheetViewController__addBackgroundContentViewControllerForAction___block_invoke;
      v35[3] = &unk_1E6AD8820;
      void v35[4] = self;
      [(CSCoverSheetViewController *)self bs_addChildViewController:v22 animated:0 transitionBlock:v35];
      [(UITapGestureRecognizer *)self->_backgroundContentGestureRecognizer addTarget:self->_backgroundContentViewController action:sel_tapGestureRecognizerAction_];
      [(CSCoverSheetViewController *)self _updatePosterSwitcherBackgroundView];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __75__CSCoverSheetViewController__addBackgroundContentViewControllerForAction___block_invoke_2;
      v34[3] = &unk_1E6AD8FB0;
      v34[4] = self;
      [(CSCoverSheetViewController *)self _performLocalAppearanceUpdatesWithReason:@"Background content added" updates:v34];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v23 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v31;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v31 != v26) {
              objc_enumerationMutation(v23);
            }
            double v28 = *(void **)(*((void *)&v30 + 1) + 8 * v27);
            if (objc_opt_respondsToSelector()) {
              [v28 coverSheetViewControllerDidAddNewSceneHostEnvironment:self];
            }
            if (objc_opt_respondsToSelector()) {
              [v28 coverSheetViewControllerDidObscureWallpaper:self obscured:1];
            }
            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v25);
      }

      id v9 = v29;
    }
  }
}

void __75__CSCoverSheetViewController__addBackgroundContentViewControllerForAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1680);
  double v4 = a2;
  id v6 = [v3 backgroundContentView];
  BOOL v5 = [*(id *)(a1 + 32) coverSheetView];
  [v5 setBackgroundContentView:v6];

  v4[2](v4);
}

void __75__CSCoverSheetViewController__addBackgroundContentViewControllerForAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F4F8E8];
  id v4 = a2;
  id v6 = objc_alloc_init(v3);
  [*(id *)(a1 + 32) setVibrancyConfigurationOverride:v6];
  [*(id *)(a1 + 32) _removeBackgroundContentOccludingViewsForAppearance:v4];
  BOOL v5 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
  [v4 setLegibilitySettings:v5];
}

- (void)_removeBackgroundContentViewController
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_backgroundContentViewController)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__CSCoverSheetViewController__removeBackgroundContentViewController__block_invoke;
    _OWORD v16[3] = &unk_1E6AD8FB0;
    v16[4] = self;
    [(CSCoverSheetViewController *)self _performLocalAppearanceUpdatesWithReason:@"Background content removed" updates:v16];
    [(UITapGestureRecognizer *)self->_backgroundContentGestureRecognizer removeTarget:self->_backgroundContentViewController action:0];
    backgroundContentViewController = self->_backgroundContentViewController;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__CSCoverSheetViewController__removeBackgroundContentViewController__block_invoke_2;
    v15[3] = &unk_1E6AD8820;
    void v15[4] = self;
    [(CSCoverSheetViewController *)self bs_removeChildViewController:backgroundContentViewController animated:0 transitionBlock:v15];
    id v4 = self->_backgroundContentViewController;
    self->_backgroundContentViewController = 0;

    [(CSCoverSheetViewController *)self _updatePosterSwitcherBackgroundView];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v5 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 coverSheetViewControllerDidObscureWallpaper:self obscured:0];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

void __68__CSCoverSheetViewController__removeBackgroundContentViewController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setVibrancyConfigurationOverride:0];
  [*(id *)(a1 + 32) _addBackgroundContentOccludingViewsForAppearance:v4];
  [v4 setLegibilitySettings:0];
}

void __68__CSCoverSheetViewController__removeBackgroundContentViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v3 = [v2 coverSheetView];
  [v3 setBackgroundContentView:0];

  v4[2]();
}

- (void)_performLocalAppearanceUpdatesWithReason:(id)a3 updates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSCoverSheetViewController *)self localAppearance];
  uint64_t v9 = (void *)MEMORY[0x1E4F4F898];
  int v10 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __79__CSCoverSheetViewController__performLocalAppearanceUpdatesWithReason_updates___block_invoke;
  v14[3] = &unk_1E6AD8FD8;
  id v15 = v8;
  double v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v6;
  id v12 = v8;
  id v13 = v7;
  [v9 animateWithSettings:v10 actions:v14 completion:0];
}

uint64_t __79__CSCoverSheetViewController__performLocalAppearanceUpdatesWithReason_updates___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[7] + 16))();
  id v2 = (void *)a1[5];
  uint64_t v3 = a1[6];

  return [v2 _updateActiveAppearanceForReason:v3];
}

- (void)_addBackgroundContentOccludingViewsForAppearance:(id)a3
{
  if (self->_backgroundContentViewController) {
    [a3 removeAllComponentsWithIdentifier:@"BackgroundContent"];
  }
}

- (void)_removeBackgroundContentOccludingViewsForAppearance:(id)a3
{
  id v4 = a3;
  if (self->_backgroundContentViewController)
  {
    id v19 = v4;
    BOOL v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      id v7 = +[CSComponent complicationContainer];
      uint64_t v8 = [v7 identifier:@"BackgroundContent"];
      uint64_t v9 = [v8 priority:-100];
      int v10 = [v9 hidden:1];
      [v19 addComponent:v10];
    }
    id v11 = +[CSComponent remoteInlineContent];
    id v12 = [v11 identifier:@"BackgroundContent"];
    id v13 = [v12 priority:-100];
    long long v14 = [v13 hidden:1];
    [v19 addComponent:v14];

    id v15 = objc_opt_new();
    double v16 = [v15 identifier:@"BackgroundContent"];
    id v17 = [v16 priority:-100];
    id v18 = [v17 shouldRenderInline:1];
    [v19 addComponent:v18];

    id v4 = v19;
  }
}

- (void)_setupBackgroundContentGestureRecognizer
{
  if (!self->_backgroundContentViewController
    || ([(CSCoverSheetViewController *)self coverSheetView],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 backgroundContentGestureRecognizer],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    BOOL v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
    backgroundContentGestureRecognizer = self->_backgroundContentGestureRecognizer;
    self->_backgroundContentGestureRecognizer = v5;

    [(UITapGestureRecognizer *)self->_backgroundContentGestureRecognizer setDelegate:self];
    id v7 = [(CSCoverSheetViewController *)self coverSheetView];
    [v7 setBackgroundContentGestureRecognizer:self->_backgroundContentGestureRecognizer];
  }
}

- (id)_activeRemoteContentAssertion
{
  return [(CSEmbeddedContentActionManager *)self->_embeddedContentActionManager validActionWithIdentifierIfExists:*MEMORY[0x1E4FA6D20]];
}

- (void)_addOrRemoveRemoteContentViewIfNecessary
{
}

- (void)_addOrRemoveRemoteContentViewIfNecessaryMaintainingState:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CSCoverSheetViewController *)self _activeRemoteContentAssertion];
  if (v5)
  {
    self->_suppressModalRemotePresentation = a3;
    BOOL v6 = [(CSCoverSheetViewController *)self _canShowEmbeddedRemoteContent];
    id v7 = SBLogDashBoard();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Reinstating content", (uint8_t *)v9, 2u);
      }

      [(CSCoverSheetViewController *)self _addRemoteViewControllerForAction:v5];
    }
    else
    {
      if (v8)
      {
        v9[0] = 67109120;
        v9[1] = 0;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Not reinstating content: canShowContent: %d", (uint8_t *)v9, 8u);
      }
    }
  }
  else
  {
    [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:6];
  }
}

- (void)_cleanupStaleRemoteContentWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = self->_remoteContentInlineProvidingManagers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v9++) removeInlineRemoteContentWithAnimatedDismissal:0];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CSCoverSheetViewController__cleanupStaleRemoteContentWithCompletion___block_invoke;
  v11[3] = &unk_1E6AD8B20;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __71__CSCoverSheetViewController__cleanupStaleRemoteContentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1560) existingSessions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = SBLogDashBoard();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 sessionID];
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v9;
          _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Forcefully removing stale remote session %{public}@", buf, 0xCu);
        }
        [v7 forceDisconnect];
        id v10 = *(void **)(*(void *)(a1 + 32) + 1560);
        id v11 = [v7 sessionID];
        [v10 didInvalidateSessionWithSessionID:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v4);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

- (BOOL)_canShowEmbeddedRemoteContent
{
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  int v4 = [(CSCoverSheetViewController *)self bs_isAppearingOrAppeared];
  if (v4 && (unint64_t)(v3 - 3) < 0xFFFFFFFFFFFFFFFELL)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_11:
        uint64_t v7 = SBLogDashBoard();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v8 = "[RemoteContent] Cannot show content: isAppearingOrAppeared";
          uint64_t v9 = buf;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v11 = [v10 userInterfaceIdiom];

      if (v11 != 1) {
        goto LABEL_11;
      }
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_11;
  }
  uint64_t v5 = [(CSCoverSheetViewController *)self activeBehavior];
  int v6 = [v5 areRestrictedCapabilities:0x80000];

  if (v6)
  {
    uint64_t v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      uint64_t v8 = "[RemoteContent] Cannot show content: hosted remote content is restricted";
      uint64_t v9 = (uint8_t *)&v19;
LABEL_13:
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    if (![(CSCoverSheetViewController *)self isLockScreenShowingDefaultContentExceptControlCenter])
    {
      uint64_t v7 = SBLogDashBoard();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v18 = 0;
      uint64_t v8 = "[RemoteContent] Cannot show content: !isLockScreenShowingDefaultContentExceptControlCenter";
      uint64_t v9 = (uint8_t *)&v18;
      goto LABEL_13;
    }
    long long v13 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    BOOL v14 = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v13];

    if (v14)
    {
      uint64_t v7 = SBLogDashBoard();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v17 = 0;
      uint64_t v8 = "[RemoteContent] Cannot show content: presenting modal VC";
      uint64_t v9 = (uint8_t *)&v17;
      goto LABEL_13;
    }
    if (self->_remoteContentInlineViewController)
    {
      uint64_t v7 = SBLogDashBoard();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v16 = 0;
      uint64_t v8 = "[RemoteContent] Cannot show content: already have inline VC";
      uint64_t v9 = (uint8_t *)&v16;
      goto LABEL_13;
    }
    if (![(CSCoverSheetViewController *)self isPresentingNotificationInLongLook]) {
      return 1;
    }
    uint64_t v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      uint64_t v8 = "[RemoteContent] Cannot show content: presenting notification in long look";
      uint64_t v9 = (uint8_t *)&v15;
      goto LABEL_13;
    }
  }
LABEL_14:

  return 0;
}

- (void)_addRemoteViewControllerForAction:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 configurationObject];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if ([(CSCoverSheetViewController *)self _isShowingInlineContent])
  {
    [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleForInlineContent];
  }
  else
  {
    id v10 = [(CSCoverSheetViewController *)self _hostedRemoteContentViewController];
    if (!a3 || v10)
    {
    }
    else if (v9)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v11 = [(CSRemoteContentSessionManager *)self->_remoteContentSessionManager existingSessionsWithDefinition:v9];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
LABEL_13:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          __int16 v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
          if ([v16 isValid]) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
            if (v13) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
        }
        __int16 v17 = [v16 sessionID];

        if (!v17) {
          goto LABEL_24;
        }
        __int16 v18 = SBLogDashBoard();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v25 = v17;
          _os_log_impl(&dword_1D839D000, v18, OS_LOG_TYPE_DEFAULT, "Already have valid existing session ID %{public}@; not adding remote VC",
            buf,
            0xCu);
        }
      }
      else
      {
LABEL_19:

LABEL_24:
        __int16 v19 = [(CSRemoteContentSessionManager *)self->_remoteContentSessionManager createSessionWithDefinition:v9];
        [v19 setHostDelegate:self];
        __int16 v17 = v19;
        BSDispatchMain();
        __int16 v18 = v19;
      }
    }
  }
}

uint64_t __64__CSCoverSheetViewController__addRemoteViewControllerForAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

- (void)_dismissRemoteViewControllerForReason:(int64_t)a3
{
}

- (void)_dismissRemoteViewControllerForReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssertMain();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__CSCoverSheetViewController__dismissRemoteViewControllerForReason_completion___block_invoke;
  v20[3] = &unk_1E6AD9000;
  v20[4] = self;
  id v7 = v6;
  id v21 = v7;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x1D9487300](v20);
  id v9 = [(CSCoverSheetViewController *)self _hostedRemoteContentViewController];
  if (v9)
  {
    id v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSStringFromSBSRemoteContentDismissType();
      *(_DWORD *)buf = 138543618;
      long long v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Dismissing remote content because of \"%{public}@\": %{public}@", buf, 0x16u);
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    __int16 v16 = __79__CSCoverSheetViewController__dismissRemoteViewControllerForReason_completion___block_invoke_490;
    __int16 v17 = &unk_1E6AD9028;
    id v12 = v8;
    __int16 v18 = self;
    id v19 = v12;
    uint64_t v13 = (void *)MEMORY[0x1D9487300](&v14);
    self->_isRemovingLockScreenContentAction = 1;
    if ((objc_msgSend(v9, "dismissForDismissType:completion:", a3, v13, v14, v15, v16, v17) & 1) == 0) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    v8[2](v8, 0);
  }
}

void __79__CSCoverSheetViewController__dismissRemoteViewControllerForReason_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__CSCoverSheetViewController__dismissRemoteViewControllerForReason_completion___block_invoke_2;
  v4[3] = &unk_1E6AD8E80;
  void v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  [v3 _cleanupStaleRemoteContentWithCompletion:v4];
}

uint64_t __79__CSCoverSheetViewController__dismissRemoteViewControllerForReason_completion___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1593) = 0;
  uint64_t v1 = *(void *)(result + 40);
  if (v1) {
    return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)(result + 40), *(unsigned __int8 *)(result + 48));
  }
  return result;
}

void __79__CSCoverSheetViewController__dismissRemoteViewControllerForReason_completion___block_invoke_490(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) _activeRemoteContentAssertion];

  if (v2)
  {
    uint64_t v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] After dismissing remote content we still have an active assertion; adding remote view",
        v4,
        2u);
    }

    [*(id *)(a1 + 32) _handleAddedAction];
  }
}

- (BOOL)_removeRemoteViewControllerForInvalidatedSession:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __90__CSCoverSheetViewController__removeRemoteViewControllerForInvalidatedSession_completion___block_invoke;
  v35[3] = &unk_1E6AD8B78;
  id v8 = v7;
  id v36 = v8;
  uint64_t v9 = MEMORY[0x1D9487300](v35);
  id v10 = (void (**)(void))v9;
  if (self->_remoteContentModalViewController)
  {
    uint64_t v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 sessionID];
      remoteContentModalViewController = self->_remoteContentModalViewController;
      *(_DWORD *)buf = 138543618;
      int v39 = v12;
      __int16 v40 = 2114;
      uint64_t v41 = remoteContentModalViewController;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Removing content for session %{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v14 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    uint64_t v15 = [(CSCoverSheetViewController *)self _presentedModalViewControllerWithIdentifier:v14];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __90__CSCoverSheetViewController__removeRemoteViewControllerForInvalidatedSession_completion___block_invoke_491;
    v31[3] = &unk_1E6AD9050;
    id v32 = v6;
    long long v33 = self;
    __int16 v34 = v10;
    BOOL v16 = 1;
    [(CSCoverSheetViewController *)self _dismissModalViewController:v15 animated:1 completion:v31];
  }
  else if (self->_remoteContentInlineViewController)
  {
    __int16 v17 = SBLogDashBoard();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v6 sessionID];
      remoteContentInlineViewController = self->_remoteContentInlineViewController;
      *(_DWORD *)buf = 138543618;
      int v39 = v18;
      __int16 v40 = 2114;
      uint64_t v41 = remoteContentInlineViewController;
      _os_log_impl(&dword_1D839D000, v17, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Removing content for session %{public}@: %{public}@", buf, 0x16u);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v20 = self->_remoteContentInlineProvidingManagers;
    uint64_t v21 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "removeInlineRemoteContentWithAnimatedDismissal:", 1, (void)v27);
        }
        uint64_t v22 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v22);
    }

    [(CSMainPageContentViewController *)self->_mainPageContentViewController removeInlineContentSupport];
    [(CSCoverSheetViewControllerBase *)self->_remoteContentInlineViewController setPresenter:0];
    uint64_t v25 = self->_remoteContentInlineViewController;
    self->_remoteContentInlineViewController = 0;

    [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleWithRemotePreference:0];
    v10[2](v10);
    BOOL v16 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t __90__CSCoverSheetViewController__removeRemoteViewControllerForInvalidatedSession_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __90__CSCoverSheetViewController__removeRemoteViewControllerForInvalidatedSession_completion___block_invoke_491(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) sessionID];
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Did remove content for session %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 1568);
  *(void *)(v4 + 1568) = 0;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v6 = [*(id *)(a1 + 40) coverSheetView];
  [v6 removeContentView];
}

- (BOOL)_isRemoteContentPresentedInUnlockMode
{
  uint64_t v3 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  uint64_t v4 = [(CSCoverSheetViewController *)self _presentedModalViewControllerWithIdentifier:v3];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      int v7 = v6;
    }
    else {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v8 presentedViewControllers];

  int v10 = [v9 containsObject:self->_remoteContentModalViewController];
  if (v10)
  {
    remoteContentModalViewController = self->_remoteContentModalViewController;
  }
  else
  {
    remoteContentModalViewController = self->_remoteContentInlineViewController;
    if (!remoteContentModalViewController) {
      return (char)remoteContentModalViewController;
    }
  }

  LOBYTE(remoteContentModalViewController) = [remoteContentModalViewController isInUnlockGestureMode];
  return (char)remoteContentModalViewController;
}

- (id)_hostedRemoteContentViewController
{
  remoteContentModalViewController = self->_remoteContentModalViewController;
  if (!remoteContentModalViewController) {
    remoteContentModalViewController = self->_remoteContentInlineViewController;
  }
  return remoteContentModalViewController;
}

- (BOOL)_isPresentingModalRemoteContent
{
  uint64_t v3 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  if ([(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v3])
  {
    BOOL v4 = self->_remoteContentModalViewController != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_isPresentingDismissableRemoteContent
{
  BOOL v3 = [(CSCoverSheetViewController *)self _isPresentingModalRemoteContent];
  return v3 | [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController shouldDismissInlineContentForUnlock];
}

- (void)_overrideNotificationDisplayStyleForInlineContent
{
  if ([(CSCoverSheetViewController *)self didDismissSinceScreenOn]) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController preferredNotificationListMode];
  }

  [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleWithRemotePreference:v3];
}

- (void)_overrideNotificationDisplayStyleWithRemotePreference:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  remoteOverrideNotificationDisplayStyleAssertion = self->_remoteOverrideNotificationDisplayStyleAssertion;
  if (!remoteOverrideNotificationDisplayStyleAssertion)
  {
LABEL_6:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  BOOL v6 = [(CSOverrideNotificationListDisplayStyleAssertion *)remoteOverrideNotificationDisplayStyleAssertion hideNotificationCount];
  int64_t v7 = [(CSOverrideNotificationListDisplayStyleAssertion *)self->_remoteOverrideNotificationDisplayStyleAssertion displayStyle];
  switch(v7)
  {
    case 2:
      uint64_t v8 = 3;
      if (!v6) {
        uint64_t v8 = 4;
      }
      break;
    case 1:
      uint64_t v8 = 2;
      break;
    case 0:
      uint64_t v8 = 1;
      break;
    default:
      goto LABEL_6;
  }
LABEL_11:
  if (v8 != a3)
  {
    uint64_t v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = NSStringFromPreferredNotificationListMode();
      int v18 = 138543362;
      id v19 = v10;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Setting notification list display style override: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    switch(a3)
    {
      case 0:
        uint64_t v11 = self->_remoteOverrideNotificationDisplayStyleAssertion;
        self->_remoteOverrideNotificationDisplayStyleAssertion = 0;
        goto LABEL_22;
      case 1:
        id v12 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
        uint64_t v11 = v12;
        uint64_t v13 = *MEMORY[0x1E4FB38A0];
        uint64_t v14 = 0;
        goto LABEL_20;
      case 2:
        id v12 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
        uint64_t v11 = v12;
        uint64_t v13 = *MEMORY[0x1E4FB38A0];
        uint64_t v14 = 1;
        goto LABEL_20;
      case 3:
        id v12 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
        uint64_t v11 = v12;
        uint64_t v13 = *MEMORY[0x1E4FB38A0];
        uint64_t v14 = 2;
        uint64_t v15 = 1;
        goto LABEL_21;
      case 4:
        id v12 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
        uint64_t v11 = v12;
        uint64_t v13 = *MEMORY[0x1E4FB38A0];
        uint64_t v14 = 2;
LABEL_20:
        uint64_t v15 = 0;
LABEL_21:
        BOOL v16 = [(CSOverrideNotificationListDisplayStyleAssertion *)v12 acquireOverrideNotificationListDisplayStyleAssertionWithStyle:v14 hideNotificationCount:v15 reason:v13];
        __int16 v17 = self->_remoteOverrideNotificationDisplayStyleAssertion;
        self->_remoteOverrideNotificationDisplayStyleAssertion = v16;

LABEL_22:
        break;
      default:
        return;
    }
  }
}

- (void)_dismissInlineContentOnSignificantScroll
{
  if ([(CSCoverSheetViewController *)self _isShowingInlineContent]
    && [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController inlineContentDismissesOnSignificantScroll])
  {
    int64_t v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent]  Dismissing remote content for significant scroll", v4, 2u);
    }

    [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:8];
  }
}

- (BOOL)_isShowingInlineContent
{
  return self->_remoteContentInlineViewController != 0;
}

- (BOOL)shouldActivateRemoteContentSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CSCoverSheetViewController *)self activeBehavior];
  int v6 = [v5 areRestrictedCapabilities:0x80000];

  int64_t v7 = [(CSCoverSheetViewController *)self _hostedRemoteContentViewController];
  if (v7) {
    int v8 = 1;
  }
  else {
    int v8 = v6;
  }
  if (v8 == 1)
  {
    uint64_t v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v4 sessionID];
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 1026;
      int v17 = v6;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Should not activate for session: %{public}@, controller: %{public}@, restricted: %{public}d", (uint8_t *)&v12, 0x1Cu);
    }
  }

  return v8 ^ 1;
}

- (void)_presentInlineViewController:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_remoteContentInlineViewController, a3);
    BOOL v6 = [(CSCoverSheetViewController *)self _isMainPageShowing];
    int64_t v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Telling remote inline content managers to present", buf, 2u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v8 = self->_remoteContentInlineProvidingManagers;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "presentInlineRemoteContent:animatePresentation:", v5, v6, (void)v15);
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    uint64_t v13 = +[CSAction actionWithType:3];
    [(CSCoverSheetViewController *)self handleAction:v13 fromSender:self];

    [v5 setPresenter:self];
    if (self->_lastAppearState == 2 && [v5 presentationCancelsTouches]) {
      BKSHIDServicesCancelTouchesOnMainDisplay();
    }
    __int16 v14 = [(CSCoverSheetViewController *)self mainPageContentViewController];
    [v14 addInlineContentSupportForDelegate:v5];

    [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleForInlineContent];
    [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"PresentedInlineContentViewController"];
    [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"PresentedInlineContentViewController"];
  }
}

- (BOOL)remoteContentSession:(id)a3 presentViewController:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_remoteContentModalViewController == 0)
  {
    uint64_t v12 = [(CSCoverSheetViewController *)self activeBehavior];
    int v13 = [v12 areRestrictedCapabilities:0x80000];

    SBLogDashBoard();
    int v8 = (CSDismissableModalViewController *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = os_log_type_enabled(&v8->super.super.super.super.super, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (!v14) {
        goto LABEL_5;
      }
      LOWORD(v31) = 0;
      uint64_t v9 = "[CSCSVC][RemoteContent] capability restricted";
      goto LABEL_4;
    }
    if (v14)
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1D839D000, &v8->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "[CSCSVS][RemoteContent] Being asked to present remote session", (uint8_t *)&v31, 2u);
    }

    uint64_t v15 = [v7 contentPresentationType];
    if (v15)
    {
      if (v15 != 1)
      {
        BOOL v10 = 1;
        goto LABEL_7;
      }
      uint64_t v16 = objc_opt_class();
      id v17 = v7;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          long long v18 = v17;
        }
        else {
          long long v18 = 0;
        }
      }
      else
      {
        long long v18 = 0;
      }
      int v8 = v18;

      if ([(CSCoverSheetViewController *)self isShowingMediaControls]
        && [(CSDismissableModalViewController *)v8 shouldDismissInlineContentForNowPlaying])
      {
        id v19 = SBLogDashBoard();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] showing media controls; not presenting inline",
            (uint8_t *)&v31,
            2u);
        }

        goto LABEL_5;
      }
      [(CSCoverSheetViewController *)self _presentInlineViewController:v8];
      uint64_t v20 = SBLogDashBoard();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v6 sessionID];
        remoteContentInlineViewController = self->_remoteContentInlineViewController;
        int v31 = 138543618;
        id v32 = v21;
        __int16 v33 = 2114;
        __int16 v34 = remoteContentInlineViewController;
LABEL_40:
        _os_log_impl(&dword_1D839D000, v20, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Added content for session %{public}@: %{public}@", (uint8_t *)&v31, 0x16u);
      }
    }
    else
    {
      if (self->_suppressModalRemotePresentation)
      {
        SBLogDashBoard();
        int v8 = (CSDismissableModalViewController *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v8->super.super.super.super.super, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_5;
        }
        LOWORD(v31) = 0;
        uint64_t v9 = "[CSCSVC][RemoteContent] not reinstating modal content";
        goto LABEL_4;
      }
      uint64_t v23 = [(CSCoverSheetViewController *)self mainPageContentViewController];
      int v24 = [v23 hasVisibleBreakthroughContent];

      if (v24)
      {
        SBLogDashBoard();
        int v8 = (CSDismissableModalViewController *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v8->super.super.super.super.super, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_5;
        }
        LOWORD(v31) = 0;
        uint64_t v9 = "[CSCSVC][RemoteContent] has visible breakthrough content; not showing modal";
        goto LABEL_4;
      }
      uint64_t v25 = objc_opt_class();
      __BSSafeCast(v7, v25);
      uint64_t v26 = (CSRemoteContentModalViewController *)objc_claimAutoreleasedReturnValue();
      remoteContentModalViewController = self->_remoteContentModalViewController;
      self->_remoteContentModalViewController = v26;

      int v8 = objc_alloc_init(CSDismissableModalViewController);
      [(CSPresentationViewController *)v8 presentContentViewController:self->_remoteContentModalViewController animated:0];
      if ([(CSRemoteContentModalViewController *)self->_remoteContentModalViewController shouldCaptureHomeGesture])
      {
        long long v28 = SBLogDashBoard();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1D839D000, v28, OS_LOG_TYPE_DEFAULT, "[ZStack-Participant] adding remote content modal home affordance", (uint8_t *)&v31, 2u);
        }

        long long v29 = [(CSCoverSheetContextProviding *)self->_coverSheetContext modalHomeAffordanceController];
        [(CSDismissableModalViewController *)v8 setHomeAffordanceController:v29];
      }
      [(CSDismissableModalViewController *)v8 setDelegate:self->_remoteContentModalViewController];
      [(CSCoverSheetViewController *)self _presentModalViewController:v8 shouldDismissOverlays:0 animated:1 completion:0];
      uint64_t v20 = SBLogDashBoard();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v6 sessionID];
        long long v30 = self->_remoteContentModalViewController;
        int v31 = 138543618;
        id v32 = v21;
        __int16 v33 = 2114;
        __int16 v34 = v30;
        goto LABEL_40;
      }
    }

    BOOL v10 = 1;
    goto LABEL_6;
  }
  SBLogDashBoard();
  int v8 = (CSDismissableModalViewController *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v8->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    uint64_t v9 = "[CSCSVC][RemoteContent] remote content existed";
LABEL_4:
    _os_log_impl(&dword_1D839D000, &v8->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v31, 2u);
  }
LABEL_5:
  BOOL v10 = 0;
LABEL_6:

LABEL_7:
  return v10;
}

- (BOOL)remoteContentSession:(id)a3 dismissWithReason:(int64_t)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = SBLogDashBoard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = [v7 sessionID];
    uint64_t v11 = NSStringFromSBSRemoteContentDismissType();
    int v16 = 138543618;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_INFO, "[CSCSVC][RemoteContent] Dismiss remote content session %{public}@ for reason \"%{pubic}@\"", (uint8_t *)&v16, 0x16u);
  }
  remoteContentSessionManager = self->_remoteContentSessionManager;
  int v13 = [v7 sessionID];
  [(CSRemoteContentSessionManager *)remoteContentSessionManager didInvalidateSessionWithSessionID:v13];

  BOOL v14 = [(CSCoverSheetViewController *)self _removeRemoteViewControllerForInvalidatedSession:v7 completion:v8];
  return v14;
}

- (void)remoteContentSession:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogDashBoard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 sessionID];
    BOOL v10 = [v7 descriptionWithMultilinePrefix:0];
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_INFO, "[CSCSVC][RemoteContent] Invalidate remote content session %{public}@ for error: %{pubic}@", buf, 0x16u);
  }
  remoteContentSessionManager = self->_remoteContentSessionManager;
  uint64_t v12 = [v6 sessionID];
  [(CSRemoteContentSessionManager *)remoteContentSessionManager didInvalidateSessionWithSessionID:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __74__CSCoverSheetViewController_remoteContentSession_didInvalidateWithError___block_invoke;
  v14[3] = &unk_1E6AD88C0;
  id v15 = v7;
  int v16 = self;
  id v13 = v7;
  [(CSCoverSheetViewController *)self _removeRemoteViewControllerForInvalidatedSession:v6 completion:v14];
}

void __74__CSCoverSheetViewController_remoteContentSession_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2
    && ([v2 domain],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqualToString:@"CSRemoteContentSessionErrorDomain"],
        v3,
        v4))
  {
    id v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) descriptionWithMultilinePrefix:0];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_INFO, "[CSCSVC][RemoteContent] Not re-adding remote content view given error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    [v7 _addOrRemoveRemoteContentViewIfNecessary];
  }
}

- (void)remoteContentDidUpdateStyle
{
  int64_t v3 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  int v4 = [(CSCoverSheetViewController *)self _presentedModalViewControllerWithIdentifier:v3];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    BOOL v9 = [(CSRemoteContentModalViewController *)self->_remoteContentModalViewController shouldCaptureHomeGesture];
    uint64_t v10 = SBLogDashBoard();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[ZStack-Participant] adding remote content modal home affordance for style update", buf, 2u);
      }

      uint64_t v12 = [(CSCoverSheetContextProviding *)self->_coverSheetContext modalHomeAffordanceController];
      [v8 setHomeAffordanceController:v12];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[ZStack-Participant] removing remote content modal home affordance for style update", v13, 2u);
      }

      [v8 setHomeAffordanceController:0];
    }
  }
  if ([(CSCoverSheetViewController *)self _isShowingInlineContent])
  {
    if ([(CSCoverSheetViewController *)self isShowingMediaControls]
      && [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController shouldDismissInlineContentForNowPlaying])
    {
      [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:4];
    }
    else
    {
      [(CSCoverSheetViewController *)self _overrideNotificationDisplayStyleForInlineContent];
      [(CSMainPageContentViewController *)self->_mainPageContentViewController inlineContentDidChange];
    }
  }
}

- (double)remoteContentComplicationHeightInset
{
  return self->_portraitComplicationContainerHeight;
}

- (void)combinedListViewController:(id)a3 didChangeVisibleBreakthroughContent:(BOOL)a4
{
  id v6 = [(CSCoverSheetViewController *)self _activeRemoteContentAssertion];

  if (v6 && !a4)
  {
    id v7 = [(CSCoverSheetViewController *)self _hostedRemoteContentViewController];
    if (v7)
    {
    }
    else if ([(CSCoverSheetViewController *)self isInScreenOffMode])
    {
      id v8 = SBLogDashBoard();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_INFO, "[CSCSVC][RemoteContent] Breakthrough content is gone and screen is off while sleep assertion is active; attemp"
          "t to show remote content",
          v9,
          2u);
      }

      [(CSCoverSheetViewController *)self _addOrRemoveRemoteContentViewIfNecessary];
    }
  }
}

- (void)didAddNewActivityItemSceneHostEnvironment
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 coverSheetViewControllerDidAddNewSceneHostEnvironment:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)activityItemsMayHaveChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 coverSheetViewControllerActivityItemsMayHaveChanged:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)preventsLaunchFromWidgetWithAction:(id)a3
{
  int64_t v3 = [(CSCoverSheetViewController *)self activeBehavior];
  char v4 = [v3 areRestrictedCapabilities:0x1000000];

  return v4;
}

- (BOOL)widgetGridViewControllerShouldPreventLaunchFromWidget:(id)a3
{
  int64_t v3 = [(CSCoverSheetViewController *)self activeBehavior];
  char v4 = [v3 areRestrictedCapabilities:0x1000000];

  return v4;
}

- (void)actionManager:(id)a3 addedAction:(id)a4
{
  uint64_t v6 = (CSEmbeddedContentActionManager *)a3;
  id v7 = a4;
  if (self->_embeddedContentActionManager == v6)
  {
    if (self->_isRemovingLockScreenContentAction)
    {
      id v8 = SBLogDashBoard();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v9 = 0;
        _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[CSCSVC][RemoteContent] Pending removing remote content; not adding just yet",
          v9,
          2u);
      }
    }
    else
    {
      [(CSCoverSheetViewController *)self _handleAddedAction];
    }
  }
}

- (void)_handleAddedAction
{
  [(CSCoverSheetViewController *)self _addOrRemoveRemoteContentViewIfNecessary];
  id v4 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  int64_t v3 = [v4 combinedListViewController];
  [v3 addVisibleBreakthroughContentObserver:self];
}

- (void)actionManager:(id)a3 removedAction:(id)a4
{
  if (self->_embeddedContentActionManager == a3)
  {
    uint64_t v5 = [(CSCoverSheetViewController *)self mainPageContentViewController];
    uint64_t v6 = [v5 combinedListViewController];
    [v6 removeVisibleBreakthroughContentObserver:self];

    [(CSCoverSheetViewController *)self _addOrRemoveRemoteContentViewIfNecessary];
  }
}

- (void)backgroundContentActionManager:(id)a3 addedAction:(id)a4
{
  if (self->_backgroundContentActionManager == a3) {
    [(CSCoverSheetViewController *)self _addBackgroundContentViewControllerForAction:a4];
  }
}

- (void)backgroundContentActionManager:(id)a3 removedAction:(id)a4
{
  if (self->_backgroundContentActionManager == a3) {
    [(CSCoverSheetViewController *)self _removeBackgroundContentViewController];
  }
}

- (void)didPostNotificationRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  uint64_t v6 = [(CSCoverSheetViewController *)self _presentedModalViewControllerWithIdentifier:v5];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      long long v9 = v8;
    }
    else {
      long long v9 = 0;
    }
  }
  else
  {
    long long v9 = 0;
  }
  id v10 = v9;

  long long v11 = [v10 presentedViewControllers];

  int v12 = [v11 containsObject:self->_remoteContentModalViewController];
  if (v12)
  {
    id v13 = [v4 sectionIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.cmas"];

    unint64_t v15 = [v4 interruptionLevel];
    if ([v4 isCriticalAlert])
    {
      int v16 = 1;
    }
    else if (v15 > 1)
    {
      int v16 = 1;
    }
    else
    {
      int v16 = v14;
    }
    BOOL v22 = [(CSRemoteContentModalViewController *)self->_remoteContentModalViewController suppressesDismissalForNotification];
    BOOL v23 = v22;
    if ((v16 & 1) != 0 || !v22)
    {
      __int16 v18 = SBLogDashBoard();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 67240448;
        v24[1] = v16;
        __int16 v25 = 1026;
        BOOL v26 = v23;
        __int16 v19 = "[CSCSVC][RemoteContent] Dismissing modal due to notification isBreakthrough: %{public}d, suppressDismissal: %{public}d";
        uint64_t v20 = v18;
        uint32_t v21 = 14;
        goto LABEL_20;
      }
      goto LABEL_21;
    }
  }
  else
  {
    remoteContentInlineViewController = self->_remoteContentInlineViewController;
    if (remoteContentInlineViewController
      && ![(CSRemoteContentInlineViewController *)remoteContentInlineViewController suppressesDismissalForNotification])
    {
      __int16 v18 = SBLogDashBoard();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24[0]) = 0;
        __int16 v19 = "[CSCSVC][RemoteContent] Dismissing inline due to notification";
        uint64_t v20 = v18;
        uint32_t v21 = 2;
LABEL_20:
        _os_log_impl(&dword_1D839D000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v24, v21);
      }
LABEL_21:

      [(CSCoverSheetViewController *)self _dismissRemoteViewControllerForReason:4];
    }
  }
}

- (void)combinedListViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
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
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 coverSheetViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    uint64_t v44 = *MEMORY[0x1E4F4F9D8];
    double v8 = *MEMORY[0x1E4FA6F00] * 0.4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ([v10 isPowerSource])
        {
          if (([v10 isInternal] & 1) == 0 && objc_msgSend(v10, "productIdentifier") == v44)
          {
            long long v11 = [v10 identifier];
            BOOL v12 = [(CSCoverSheetViewController *)self _containsCachedBatteryDeviceWithIdenfifier:v11];

            if (!v12) {
              [v43 addObject:v10];
            }
          }
        }
        if ([v10 isInternal])
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v13 = self->_cachedBatteryDevices;
          uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v52;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v52 != v16) {
                  objc_enumerationMutation(v13);
                }
                __int16 v18 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                if ([v18 isInternal])
                {
                  uint64_t v19 = [v18 percentCharge];
                  uint64_t v20 = [v10 percentCharge];

                  if (v19 != v20)
                  {
                    uint32_t v21 = [(BSAbsoluteMachTimer *)self->_chargingViewControllerTimer identifier];
                    int v22 = [v21 isEqualToString:@"CSCoverSheetViewController.chargingViewControllerTimer.subtitleOnly"];

                    if (v22) {
                      [(CSCoverSheetViewController *)self _showChargingSubtitleWithTimeout:v8];
                    }
                  }
                  goto LABEL_24;
                }
              }
              uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v51 objects:v62 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
LABEL_24:
        ;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v6);
  }

  if ([v43 count])
  {
    BOOL v23 = SBLogDashBoard();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      *(_DWORD *)buf = 67109120;
      BOOL v61 = v24;
      _os_log_impl(&dword_1D839D000, v23, OS_LOG_TYPE_DEFAULT, "[Charge UI][Novel Packs] visible YES, showBattery YES – isAlreadyShowingChargingModal: %d", buf, 8u);
    }

    [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:1 suppressedByPack:0 showBattery:1 animated:1];
    __int16 v25 = SBLogDashBoard();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v26 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      *(_DWORD *)buf = 67109120;
      BOOL v61 = v26;
      _os_log_impl(&dword_1D839D000, v25, OS_LOG_TYPE_DEFAULT, "[Charge UI][Novel Packs] – endedShowingChargingModal: %d", buf, 8u);
    }
  }
  id v45 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v27 = [(BCBatteryDeviceController *)self->_batteryDeviceController connectedDevices];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v42 = 1352;
  long long v28 = self->_cachedBatteryDevices;
  uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    uint64_t v32 = *MEMORY[0x1E4F4F9D8];
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        __int16 v34 = *(void **)(*((void *)&v47 + 1) + 8 * k);
        if (objc_msgSend(v34, "productIdentifier", v42) == v32)
        {
          uint64_t v35 = [v34 identifier];
          BOOL v36 = [(CSCoverSheetViewController *)self _batteryCollection:v27 containsDeviceWithIdentifier:v35];

          if (!v36) {
            [v45 addObject:v34];
          }
        }
      }
      uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v30);
  }

  if ([v45 count])
  {
    uint64_t v37 = SBLogDashBoard();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v38 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      *(_DWORD *)buf = 67109120;
      BOOL v61 = v38;
      _os_log_impl(&dword_1D839D000, v37, OS_LOG_TYPE_DEFAULT, "[Charge UI][Removed Packs] visible YES, showBattery NO – isAlreadyShowingChargingModal: %d", buf, 8u);
    }

    [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:1 suppressedByPack:0 showBattery:0 animated:1];
    int v39 = SBLogDashBoard();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v40 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      *(_DWORD *)buf = 67109120;
      BOOL v61 = v40;
      _os_log_impl(&dword_1D839D000, v39, OS_LOG_TYPE_DEFAULT, "[Charge UI][Removed Packs] – endedShowingChargingModal: %d", buf, 8u);
    }
  }
  uint64_t v41 = *(Class *)((char *)&self->super.super.super.super.isa + v42);
  *(Class *)((char *)&self->super.super.super.super.isa + v42) = (Class)obj;
}

- (BOOL)_containsCachedBatteryDeviceWithIdenfifier:(id)a3
{
  return [(CSCoverSheetViewController *)self _batteryCollection:self->_cachedBatteryDevices containsDeviceWithIdentifier:a3];
}

- (BOOL)_batteryCollection:(id)a3 containsDeviceWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "identifier", (void)v14);
        char v12 = [v11 isEqualToString:v6];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)proudLockViewControllerIsCoverSheetVisible
{
  int64_t v3 = [(CSCoverSheetViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && !self->_hasContentAboveCoverSheet) {
    int v4 = [v3 coverSheetViewControllerIsPasscodeVisible:self] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)proudLockDidChangeToCoachingText:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  currentCoachingString = self->_currentCoachingString;
  self->_currentCoachingString = v4;

  [(CSCoverSheetViewController *)self _updateCoachingString];
}

- (id)_coachingStringToUse
{
  if (self->_screenOffMode || self->_authenticated) {
    id v2 = 0;
  }
  else {
    id v2 = self->_currentCoachingString;
  }

  return v2;
}

- (id)transientSubtitleText
{
  return (id)[(SBFLockScreenDateViewController *)self->_dateViewController transientSubtitleText];
}

- (void)_updateCoachingString
{
  dateViewController = self->_dateViewController;
  id v3 = [(CSCoverSheetViewController *)self _coachingStringToUse];
  [(SBFLockScreenDateViewController *)dateViewController setCustomSubtitle:v3];
}

- (void)_updateCoachingStringWithTimeout:(double)a3
{
  dateViewController = self->_dateViewController;
  id v5 = [(CSCoverSheetViewController *)self _coachingStringToUse];
  [(SBFLockScreenDateViewController *)dateViewController setCustomSubtitle:v5 withTimeout:a3];
}

- (void)scrollablePageViewController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
  [WeakRetained scrollViewWillBeginDragging:v6];

  id v8 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  if (v8 == v10)
  {
    BOOL v9 = [(CSCoverSheetViewController *)self _isShowingInlineContent];

    if (v9) {
      [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController beginCancelTouchesForCurrentEventInHostedContent];
    }
  }
  else
  {
  }
}

- (void)scrollablePageViewController:(id)a3 scrollViewDidScroll:(id)a4
{
  p_coverSheetSpotlightPresenter = &self->_coverSheetSpotlightPresenter;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_coverSheetSpotlightPresenter);
  [WeakRetained scrollViewDidScroll:v5];
}

- (void)scrollablePageViewController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  p_coverSheetSpotlightPresenter = &self->_coverSheetSpotlightPresenter;
  id v10 = a4;
  long long v11 = (CSMainPageContentViewController *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coverSheetSpotlightPresenter);
  objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:", v10, x, y);

  mainPageContentViewController = self->_mainPageContentViewController;
  if (mainPageContentViewController == v11)
  {
    if ([(CSCoverSheetViewController *)self _isShowingInlineContent])
    {
      [(CSRemoteContentInlineViewController *)self->_remoteContentInlineViewController endCancelTouchesForCurrentEventInHostedContent];
      long long v14 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
      int v15 = [v14 isNotificationListSignificantlyScrolled];

      if (v15)
      {
        [(CSCoverSheetViewController *)self _dismissInlineContentOnSignificantScroll];
      }
    }
  }
}

- (BOOL)spotlightPresenterAllowsPullToSearch:(id)a3
{
  if ([(CSCoverSheetViewController *)self _canPresentSwipeDismissableModal])
  {
    if ([(CSCoverSheetViewController *)self _isSpotlightBehaviorRestricted])
    {
      int v4 = SBLogSpotlight();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = 0;
        id v5 = "Disallowing Spotlight presentation over CoverSheet: restricted";
        id v6 = (uint8_t *)&v17;
LABEL_7:
        _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      }
    }
    else
    {
      id v8 = [(CSCoverSheetContextProviding *)self->_coverSheetContext screenStateProvider];
      char v9 = [v8 screenIsOn];

      if ((v9 & 1) == 0)
      {
        int v4 = SBLogSpotlight();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        __int16 v16 = 0;
        id v5 = "Disallowing Spotlight presentation over CoverSheet: screen off";
        id v6 = (uint8_t *)&v16;
        goto LABEL_7;
      }
      id v10 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
      int v11 = [v10 isScrollingListContent];

      if (v11)
      {
        int v4 = SBLogSpotlight();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        __int16 v15 = 0;
        id v5 = "Disallowing Spotlight presentation over CoverSheet: scrolling";
        id v6 = (uint8_t *)&v15;
        goto LABEL_7;
      }
      char v12 = [MEMORY[0x1E4F74230] sharedConnection];
      int v13 = [v12 isSpotlightAllowed];

      if (v13) {
        return 1;
      }
      int v4 = SBLogSpotlight();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        id v5 = "Disallowing Spotlight presentation over CoverSheet: disallowed by ManagedConfiguration";
        id v6 = (uint8_t *)&v14;
        goto LABEL_7;
      }
    }
  }
  else
  {
    int v4 = SBLogSpotlight();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Disallowing Spotlight presentation over CoverSheet: cannot present modal";
      id v6 = buf;
      goto LABEL_7;
    }
  }
LABEL_8:

  return 0;
}

- (BOOL)_isSpotlightBehaviorRestricted
{
  id v2 = [(CSCoverSheetViewController *)self activeBehavior];
  char v3 = [v2 areRestrictedCapabilities:0x200000];

  return v3;
}

- (void)spotlightPresenter:(id)a3 presentDismissableModalViewController:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(NSMutableArray *)self->_exemptFromInactiveAppearanceParticipants addObject:self->_mainPageContentViewController];
  if (!self->_spotlightModalViewController)
  {
    char v9 = objc_alloc_init(CSDismissableModalViewController);
    spotlightModalViewController = self->_spotlightModalViewController;
    self->_spotlightModalViewController = v9;

    [(CSPresentationViewController *)self->_spotlightModalViewController presentContentViewController:v7 animated:0];
    int v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[ZStack-Participant] adding spotlight modal home affordance", v14, 2u);
    }

    char v12 = self->_spotlightModalViewController;
    int v13 = [(CSCoverSheetContextProviding *)self->_coverSheetContext modalHomeAffordanceController];
    [(CSDismissableModalViewController *)v12 setHomeAffordanceController:v13];

    [(CSDismissableModalViewController *)self->_spotlightModalViewController setDelegate:v7];
    [(CSCoverSheetViewController *)self _presentModalViewController:self->_spotlightModalViewController animated:0 completion:v8];
  }
}

- (void)spotlightPresenterDidPresentSearch:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = (void *)[(NSHashTable *)self->_observers copy];
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
        char v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 coverSheetViewControllerDidPresentSearch:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)spotlightPresenter:(id)a3 dismissDismissableModalViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(NSMutableArray *)self->_exemptFromInactiveAppearanceParticipants removeObject:self->_mainPageContentViewController];
  [(CSDismissableModalViewController *)self->_spotlightModalViewController setHomeAffordanceController:0];
  objc_initWeak(&location, self);
  spotlightModalViewController = self->_spotlightModalViewController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__CSCoverSheetViewController_spotlightPresenter_dismissDismissableModalViewController_animated_completion___block_invoke;
  v15[3] = &unk_1E6AD9078;
  id v14 = v12;
  id v16 = v14;
  objc_copyWeak(&v17, &location);
  [(CSCoverSheetViewController *)self _dismissModalViewController:spotlightModalViewController animated:v7 completion:v15];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __107__CSCoverSheetViewController_spotlightPresenter_dismissDismissableModalViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v4 = (void *)WeakRetained[215];
    WeakRetained[215] = 0;
    uint64_t v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (void)spotlightPresenterDidDismissSearch:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = (void *)[(NSHashTable *)self->_observers copy];
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
        char v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 coverSheetViewControllerDidDismissSearch:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)spotlightPresenterAddContentView:(id)a3
{
  id v3 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 addContentView];
}

- (void)spotlightPresenterRemoveContentView:(id)a3
{
  id v3 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 removeContentView];
}

- (id)displayConfigurationForSpotlightPresenter:(id)a3
{
  id v3 = [(CSCoverSheetViewController *)self coverSheetView];
  int v4 = [v3 _sbDisplayConfiguration];

  return v4;
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    uint64_t v6 = [(CSCoverSheetViewController *)self delegate];
    [v6 coverSheetViewController:self startSpotlightInteractiveGestureTransactionForGesture:v5];
  }
  uint64_t v7 = [(CSCoverSheetViewController *)self coverSheetView];
  [v7 addContentView];

  id v8 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  [v8 setResignActive:1];
}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  id v8 = a3;
  if ([v8 isTracking])
  {
    if (self->_spotlightInteractiveGestureTransaction
      || ([(CSCoverSheetViewController *)self delegate],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v6 coverSheetViewController:self startSpotlightInteractiveGestureTransactionForGesture:v8],
          v6,
          self->_spotlightInteractiveGestureTransaction))
    {
      [(id)objc_opt_class() searchHeaderHeight];
      [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self->_spotlightInteractiveGestureTransaction updatePresentationWithProgress:a4 translation:v7 * a4];
    }
  }
}

- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4
{
  spotlightInteractiveGestureTransaction = self->_spotlightInteractiveGestureTransaction;
  if (spotlightInteractiveGestureTransaction) {
    [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)spotlightInteractiveGestureTransaction endPresentation:a4];
  }
}

- (void)searchGesture:(id)a3 completedShowing:(BOOL)a4
{
  objc_msgSend(a3, "resetAnimated:", 0, a4);
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  [v5 removeContentView];

  localAppearance = self->_localAppearance;
  double v7 = [(CSAppearance *)localAppearance componentForType:1 identifier:@"Spotlight"];
  [(CSAppearance *)localAppearance removeComponent:v7];

  id v8 = self->_localAppearance;
  char v9 = [(CSAppearance *)v8 componentForType:11 identifier:@"Spotlight"];
  [(CSAppearance *)v8 removeComponent:v9];

  long long v10 = self->_localAppearance;
  long long v11 = [(CSAppearance *)v10 componentForType:15 identifier:@"Spotlight"];
  [(CSAppearance *)v10 removeComponent:v11];

  id v12 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  [v12 setResignActive:0];
}

- (void)setSearchGesture:(id)a3
{
  objc_storeStrong((id *)&self->_searchGesture, a3);
  id v5 = a3;
  [v5 addObserver:self];
}

- (void)_setupSearchGesture
{
  id v3 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 setSearchGesture:self->_searchGesture];
}

- (BOOL)searchGestureShouldRecognize:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
  {
    uint64_t v6 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
    char v7 = [v6 isScrollingListContent];
  }
  else
  {
    char v7 = 0;
  }
  if ([(CSCoverSheetViewController *)self _isSpotlightBehaviorRestricted]) {
    return 0;
  }
  if (v7) {
    return 0;
  }
  id v8 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  char v9 = [v8 notificationListScrollView];

  [v9 contentOffset];
  double v11 = v10;
  [v9 contentInset];
  double v13 = fabs(v11 + v12);

  return v13 <= 1.0;
}

- (id)activityPickerViewControllerTransitionContainerView:(id)a3
{
  return (id)[(CSModalPresentationViewController *)self->_modalPresentationController view];
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  id v3 = [(CSWidgetGridViewController *)self->_complicationContainerViewController sceneHostEnvironmentEntriesForBacklightSession];
  int v4 = [(CSInlineWidgetContainerViewController *)self->_inlineComplicationContainerViewController sceneHostEnvironmentEntriesForBacklightSession];
  uint64_t v5 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  uint64_t v6 = [v5 sceneHostEnvironmentEntriesForBacklightSession];

  char v7 = [MEMORY[0x1E4F1CA80] setWithSet:v3];
  [v7 unionSet:v6];
  [v7 unionSet:v4];
  backgroundContentViewController = self->_backgroundContentViewController;
  if (backgroundContentViewController)
  {
    char v9 = [(CSBackgroundContentViewController *)backgroundContentViewController sceneHostEnvironmentEntriesForBacklightSession];
    [v7 unionSet:v9];
  }

  return v7;
}

- (void)combinedListViewController:(id)a3 didUpdateVisibleNotificationCount:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 coverSheetViewController:self didUpdateVisibleNotificationCount:a4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_isAmbientOverlayPresented != a4)
  {
    self->_isAmbientOverlayPresented = a4;
    if (!a4)
    {
      remoteContentInlineViewController = self->_remoteContentInlineViewController;
      if (remoteContentInlineViewController)
      {
        uint64_t v7 = [(CSRemoteContentInlineViewController *)remoteContentInlineViewController hostViewController];
        [v7 hostDidChangeContentBounds];
      }
    }
  }
  [(CSNotificationDispatcher *)self->_notificationDispatcher setBannerDestinationUnavailable:v4 forReason:@"CSCoverSheetViewController-Ambient"];

  [(CSCoverSheetViewController *)self _setSuppressChargingUIForAmbient:v4];
}

- (void)ambientPresentationControllerWillPossiblyPresent:(id)a3
{
}

- (void)ambientPresentationControllerCancelledPossiblePresentation:(id)a3
{
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CSCoverSheetViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E6AD88C0;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __75__CSCoverSheetViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 1768)];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 _validateAndUpdateInlineComplication];
  }
  return result;
}

- (id)_windowsFromViewControllers:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  id v5 = [(CSCoverSheetViewController *)self viewIfLoaded];
  id v6 = [v5 window];

  if (v6) {
    [v4 addObject:v6];
  }

  return v4;
}

- (id)_activeViewControllers
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  BOOL v4 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:self->_lastSettledPageIndex];
  if ([v4 participantState] == 2) {
    [v3 addObject:v4];
  }
  if ([(CSPresentationViewController *)self->_modalPresentationController participantState] == 2) {
    [v3 addObject:self->_modalPresentationController];
  }

  return v3;
}

- (BOOL)_gestureRecognizer:(id)a3 isLocatedOverHorizontalContentRegionInViewController:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 view];
  _UISystemGestureLocationInView();
  double v9 = v8;
  double v11 = v10;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v12 = objc_msgSend(v6, "presentationRegions", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v16 isReservedForHorizontalScrolling])
        {
          objc_msgSend(v16, "convertPoint:fromCoordinateSpace:", v7, v9, v11);
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          [v16 extent];
          v28.double x = v18;
          v28.double y = v20;
          if (CGRectContainsPoint(v29, v28))
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)_overSlidingControlForLocation:(CGPoint)a3 inView:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)_isSourceForHorizontalScrolling:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  BOOL v6 = v5 == v4;

  return v6;
}

- (BOOL)_isSlideableContentOffsetOnscreen:(CGPoint)a3
{
  double y = a3.y;
  id v4 = [(CSCoverSheetViewController *)self coverSheetView];
  [v4 bounds];
  double v6 = v5;

  return y > -v6;
}

- (BOOL)_isSlideableContentOnscreen
{
  [(CSCoverSheetViewController *)self _slideableContentOffset];

  return -[CSCoverSheetViewController _isSlideableContentOffsetOnscreen:](self, "_isSlideableContentOffsetOnscreen:");
}

- (CGPoint)_slideableContentOffset
{
  uint64_t v2 = [(CSCoverSheetViewController *)self activeAppearance];
  id v3 = [v2 componentForType:5 property:2];
  [v3 offset];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (BOOL)_isPageContentHidden
{
  uint64_t v2 = [(CSCoverSheetViewController *)self activeAppearance];
  id v3 = [v2 componentForType:4 property:1];
  char v4 = [v3 isHidden];

  return v4;
}

- (void)_beginAppearanceTransitionForPageViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4
{
  double v7 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__CSCoverSheetViewController__beginAppearanceTransitionForPageViewControllersToVisible_animated___block_invoke;
  v8[3] = &unk_1E6AD90A0;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v10 = a4;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __97__CSCoverSheetViewController__beginAppearanceTransitionForPageViewControllersToVisible_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(void **)(a1 + 32);
  BOOL v5 = v4[247] == a3 && *(unsigned char *)(a1 + 40) != 0;
  return objc_msgSend(v4, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", a2, v5, *(unsigned __int8 *)(a1 + 41));
}

- (void)_endAppearanceTransitionForPageViewControllersToVisible:(BOOL)a3
{
  BOOL v5 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__CSCoverSheetViewController__endAppearanceTransitionForPageViewControllersToVisible___block_invoke;
  v6[3] = &unk_1E6AD90C8;
  void v6[4] = self;
  BOOL v7 = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __86__CSCoverSheetViewController__endAppearanceTransitionForPageViewControllersToVisible___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = v3[247] == a3 && *(unsigned char *)(a1 + 40) != 0;
  id v5 = a2;
  objc_msgSend(v3, "bs_endAppearanceTransitionForChildViewController:toVisible:", v5, v4);
  [v5 didTransitionToVisible:v4];
}

- (double)_dateViewAlphaForCurrentWakeState
{
  uint64_t v2 = [MEMORY[0x1E4FA6060] rootSettings];
  [v2 awakeDateAlpha];
  double v4 = v3;

  return v4;
}

- (BOOL)_isKnownTransitionConflictFrom:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v6 isMemberOfClass:objc_opt_class()];

  BOOL v8 = v7 && ([v5 isMemberOfClass:objc_opt_class()] & 1) != 0;
  return v8;
}

- (BOOL)_canPresentSwipeDismissableModal
{
  double v3 = [(CSCoverSheetViewController *)self visiblePageViewController];

  if (!v3) {
    return 0;
  }
  double v4 = [(CSCoverSheetViewController *)self modalPresentationController];
  BOOL v5 = [v4 _appearState] == 0;

  return v5;
}

- (void)_setPageViewControllers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (NSArray *)a3;
  if (self->_pageViewControllers != v5)
  {
    objc_storeStrong((id *)&self->_pageViewControllers, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_pageViewControllers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setPresenter:", self, (void)v11);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_setMainPageContentViewController:(id)a3
{
  BOOL v5 = (CSMainPageContentViewController *)a3;
  p_mainPageContentViewController = &self->_mainPageContentViewController;
  mainPageContentViewController = self->_mainPageContentViewController;
  if (mainPageContentViewController != v5)
  {
    CGRect v29 = v5;
    uint64_t v8 = [(CSMainPageContentViewController *)mainPageContentViewController combinedListViewController];
    [(CSCoverSheetViewController *)self removeCoverSheetObserver:v8];

    objc_storeStrong((id *)&self->_mainPageContentViewController, a3);
    [(CSMainPageContentViewController *)*p_mainPageContentViewController setUserPresenceMonitor:self->_userPresenceMonitor];
    uint64_t v9 = *p_mainPageContentViewController;
    BOOL v10 = [(CSCoverSheetContextProviding *)self->_coverSheetContext touchEnvironmentStatusProvider];
    [(CSMainPageContentViewController *)v9 setTouchEnvironmentStatusProvider:v10];

    long long v11 = *p_mainPageContentViewController;
    long long v12 = [(CSCoverSheetContextProviding *)self->_coverSheetContext userSessionController];
    [(CSMainPageContentViewController *)v11 setUserSessionController:v12];

    long long v13 = *p_mainPageContentViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
    [(CSMainPageContentViewController *)v13 setWallpaperColorProvider:WeakRetained];

    long long v15 = *p_mainPageContentViewController;
    uint64_t v16 = [(CSCoverSheetContextProviding *)self->_coverSheetContext wallpaperProvider];
    [(CSMainPageContentViewController *)v15 setWallpaperProvider:v16];

    [(CSMainPageContentViewController *)*p_mainPageContentViewController setMediaControlsObserver:self];
    [(CSMainPageContentViewController *)*p_mainPageContentViewController setNotificationObserver:self];
    [(CSMainPageContentViewController *)*p_mainPageContentViewController setDelegate:self];
    double v17 = [(CSMainPageContentViewController *)*p_mainPageContentViewController combinedListViewController];
    CGFloat v18 = [(CSCoverSheetContextProviding *)self->_coverSheetContext applicationInformer];
    [v17 setApplicationInformer:v18];

    double v19 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
    [v17 setAuthenticationStatusProvider:v19];

    CGFloat v20 = [(CSCoverSheetContextProviding *)self->_coverSheetContext homeAffordanceController];
    [v17 setHomeAffordanceController:v20];

    uint32_t v21 = [(CSCoverSheetContextProviding *)self->_coverSheetContext platterHomeGestureManager];
    [v17 setPlatterHomeGestureManager:v21];

    long long v22 = [(CSCoverSheetContextProviding *)self->_coverSheetContext notificationPresenter];
    [v17 setNotificationPresenter:v22];

    long long v23 = [(CSCoverSheetContextProviding *)self->_coverSheetContext unlockRequester];
    [v17 setUnlockRequester:v23];

    long long v24 = [(CSCoverSheetContextProviding *)self->_coverSheetContext contentActionProvider];
    [v17 setContentActionProvider:v24];

    long long v25 = [(CSCoverSheetContextProviding *)self->_coverSheetContext proximitySensorProvider];
    [v17 setProximitySensorProvider:v25];

    BOOL v26 = [(CSCoverSheetContextProviding *)self->_coverSheetContext deviceOrientationProvider];
    [v17 setDeviceOrientationProvider:v26];

    [v17 setRemoteContentInlineProvider:self];
    [v17 setCoverSheetViewPresenting:self];
    [v17 setNotificationObserver:self];
    if ([(CSCoverSheetViewController *)self isInScreenOffMode]) {
      uint64_t v27 = 25;
    }
    else {
      uint64_t v27 = 24;
    }
    CGPoint v28 = +[CSEvent eventWithType:v27];
    [v17 handleEvent:v28];
    [(CSCoverSheetViewController *)self addCoverSheetObserver:v17];

    BOOL v5 = v29;
  }

  MEMORY[0x1F41817F8](mainPageContentViewController, v5);
}

- (void)setCurrentTransitionSource:(id)a3
{
  BOOL v5 = (CSCoverSheetViewTransitionSource *)a3;
  if (self->_currentTransitionSource != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_currentTransitionSource, a3);
    [(CSCoverSheetViewController *)self _setLockOrientationWhileTransitioning:self->_currentTransitionSource != 0];
    BOOL v5 = v6;
  }
}

- (void)_setLockOrientationWhileTransitioning:(BOOL)a3
{
  if (self->_lockOrientationWhileTransitioning != a3)
  {
    self->_lockOrientationWhileTransitioning = a3;
    [(CSCoverSheetViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (void)_setSuppressChargingUIForAmbient:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_suppressChargingUIForAmbient != a3)
  {
    BOOL v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL suppressChargingUIForAmbient = self->_suppressChargingUIForAmbient;
      v7[0] = 67109120;
      v7[1] = suppressChargingUIForAmbient;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Updating charging UI suppression for ambient presentation [ suppressed : %{BOOL}d ]", (uint8_t *)v7, 8u);
    }

    self->_BOOL suppressChargingUIForAmbient = a3;
  }
}

- (void)activatePage:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(void))a5;
  uint64_t v9 = v8;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __67__CSCoverSheetViewController_activatePage_animated_withCompletion___block_invoke;
    long long v14 = &unk_1E6AD8E30;
    long long v15 = self;
    unint64_t v17 = a3;
    BOOL v18 = v5;
    uint64_t v16 = v8;
    BOOL v10 = (void (**)(void))MEMORY[0x1D9487300](&v11);
    if ([(CSCoverSheetViewController *)self isPasscodeLockVisible]) {
      [(CSCoverSheetViewController *)self setPasscodeLockVisible:0 animated:v5 completion:v10];
    }
    else {
      v10[2](v10);
    }
  }
}

void __67__CSCoverSheetViewController_activatePage_animated_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coverSheetView];
  [v2 scrollToPageAtIndex:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56) withCompletion:*(void *)(a1 + 40)];
}

- (id)visiblePageViewController
{
  double v3 = [(CSCoverSheetViewController *)self coverSheetView];
  double v4 = [v3 scrollView];
  uint64_t v5 = [v4 visiblePageRange];
  uint64_t v7 = v6;

  if (v7 == 1)
  {
    uint64_t v8 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pageViewControllerAtIndex:(unint64_t)a3
{
  double v4 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndex:a3];
  }

  return v5;
}

- (void)_loadViewsForRestrictedPagesIfPossible
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  double v4 = [(CSCoverSheetViewController *)self visiblePageViewController];
  uint64_t v5 = [(CSCoverSheetViewController *)self _eligiblePageViewControllers];
  uint64_t v6 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  uint64_t v7 = [v5 arrayByExcludingObjectsInArray:v6];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CSCoverSheetViewController *)self _addVisiblePageViewController:*(void *)(*((void *)&v35 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }

  long long v13 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  long long v14 = [v13 arrayByExcludingObjectsInArray:v5];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        -[CSCoverSheetViewController _removeAllowedPageViewController:](self, "_removeAllowedPageViewController:", *(void *)(*((void *)&v31 + 1) + 8 * v19++), (void)v31);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v17);
  }

  [(CSCoverSheetViewController *)self _updateVisibilityForPageViewControllersWithVisiblePageViewController:v4];
  CGFloat v20 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  uint32_t v21 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  char v22 = [v20 containsObject:v21];

  if ((v22 & 1) == 0)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewController.m" lineNumber:6101 description:@"The main page should always be visible"];
  }
  long long v23 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  long long v24 = [(CSCoverSheetViewController *)self coverSheetView];
  long long v25 = [v23 combinedListViewController];
  BOOL v26 = [v25 viewIfLoaded];
  [v24 setReferenceViewForBelowPresentationContext:v26];

  uint64_t v27 = [(CSCoverSheetViewController *)self coverSheetView];
  CGPoint v28 = [v27 scrollView];
  CGRect v29 = [v23 viewIfLoaded];
  [v28 bringSubviewToFront:v29];
}

- (void)_addVisiblePageViewController:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
    int v22 = 138543362;
    long long v23 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Adding visible page view controller, current allowed page view controllers: %{public}@", (uint8_t *)&v22, 0xCu);
  }
  uint64_t v7 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v8 = [v7 indexOfObject:v4];

  uint64_t v9 = 0;
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v11 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
      uint64_t v12 = [(CSCoverSheetViewController *)self pageViewControllers];
      long long v13 = [v12 objectAtIndex:i];
      unsigned int v14 = [v11 containsObject:v13];

      v9 += v14;
    }
  }
  id v15 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v16 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  uint64_t v17 = [v15 arrayWithArray:v16];

  [v17 insertObject:v4 atIndex:v9];
  [(CSCoverSheetViewController *)self _setAllowedPageViewControllers:v17];
  [(CSCoverSheetViewController *)self addChildViewController:v4];
  uint64_t v18 = [(CSCoverSheetViewController *)self view];
  uint64_t v19 = [v4 view];
  [v18 addSubview:v19];

  [v4 didMoveToParentViewController:self];
  [v4 setCoverSheetViewController:self];
  [v4 setLayoutStrategy:self->_layoutStrategy];
  if (objc_opt_respondsToSelector()) {
    [(NSHashTable *)self->_applicationHosters addObject:v4];
  }
  CGFloat v20 = SBLogDashBoard();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v21 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
    int v22 = 138543362;
    long long v23 = v21;
    _os_log_impl(&dword_1D839D000, v20, OS_LOG_TYPE_DEFAULT, "Finished adding visible page view controller, current allowed page view controllers: %{public}@", (uint8_t *)&v22, 0xCu);
  }
}

- (void)_removeAllowedPageViewController:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Removing allowed page view controller, current allowed page view controllers: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  uint64_t v8 = [v7 indexOfObject:v4];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CSCoverSheetViewController _removeAllowedPageViewController:](self, v9);
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v11 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
    uint64_t v9 = [v10 arrayWithArray:v11];

    [v9 removeObjectAtIndex:v8];
    [(CSCoverSheetViewController *)self _setAllowedPageViewControllers:v9];
    [(CSCoverSheetViewController *)self bs_removeChildViewController:v4];
    [v4 setCoverSheetViewController:0];
    [v4 setLayoutStrategy:0];
    if (objc_opt_respondsToSelector()) {
      [(NSHashTable *)self->_applicationHosters removeObject:v4];
    }
    uint64_t v12 = SBLogDashBoard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "Finished removing allowed page view controller, current allowed page view controllers: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (unint64_t)_pageCapabilities
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [(id)objc_opt_class() requiredCapabilities];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_eligiblePageViewControllers
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v20 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        int v9 = [(id)objc_opt_class() isAvailableForConfiguration];
        uint64_t v10 = [(id)objc_opt_class() requiredCapabilities];
        if (v9
          && (uint64_t v11 = v10,
              [(CSCoverSheetViewController *)self activeBehavior],
              long long v12 = objc_claimAutoreleasedReturnValue(),
              uint64_t v13 = [v12 restrictedCapabilities] & v11,
              v12,
              !v13))
        {
          [v20 addObject:v8];
        }
        else
        {
          uint64_t v14 = SBLogDashBoard();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v8 pageRole];
            uint64_t v16 = [(CSCoverSheetViewController *)self activeBehavior];
            uint64_t v17 = [v16 restrictedCapabilities];
            *(_DWORD *)buf = 138412802;
            BOOL v26 = v15;
            __int16 v27 = 1024;
            int v28 = v9;
            __int16 v29 = 2048;
            uint64_t v30 = v17;
            _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "Not including page: %@, visibleRegardless: %d, restrictedCapabilities: %lu", buf, 0x1Cu);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v18 = [v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
      uint64_t v5 = v18;
    }
    while (v18);
  }

  return v20;
}

- (void)_updateVisibilityForPageViewControllersWithVisiblePageViewController:(id)a3
{
  id v5 = a3;
  if ([(CSCoverSheetViewController *)self isTransitioning])
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"![self isTransitioning]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSCoverSheetViewController _updateVisibilityForPageViewControllersWithVisiblePageViewController:](a2);
    }
LABEL_14:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D83EB2ECLL);
  }
  uint64_t v6 = [(CSCoverSheetViewController *)self coverSheetView];
  uint64_t v7 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  unint64_t v8 = [v7 indexOfObject:v5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = [(CSCoverSheetViewController *)self _indexOfMainPage];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"newPageIndex != NSNotFound"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[CSCoverSheetViewController _updateVisibilityForPageViewControllersWithVisiblePageViewController:](a2);
      }
      goto LABEL_14;
    }
  }
  [(CSCoverSheetViewController *)self _setLastSettledPageIndex:v8];
  int v9 = SBLogDashBoard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Updating page visibility...", buf, 2u);
  }

  uint64_t v10 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__CSCoverSheetViewController__updateVisibilityForPageViewControllersWithVisiblePageViewController___block_invoke;
  v23[3] = &unk_1E6AD90F0;
  id v11 = v10;
  id v24 = v11;
  [v7 enumerateObjectsUsingBlock:v23];
  [v6 setPageViews:v11];
  long long v12 = [(CSPageViewController *)self->_mainPageContentViewController view];
  [v6 setMainPageView:v12];

  [v6 scrollToPageAtIndex:v8 animated:0 withCompletion:0];
  uint64_t v13 = [(CSFixedFooterViewController *)self->_fixedFooterViewController fixedFooterView];
  uint64_t v14 = [v13 pageControl];
  objc_msgSend(v14, "setCameraPageIndex:", -[CSCoverSheetViewController _indexOfCameraPage](self, "_indexOfCameraPage"));

  if (![(CSCoverSheetViewController *)self isTransitioning])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    *(_OWORD *)buf = 0u;
    v19[0] = (double)v8;
    v19[2] = (double)v8;
    *(void *)&v19[1] = 1;
    *(void *)&v19[3] = 1;
    -[CSCoverSheetViewController transitionSource:willBeginWithType:](self, "transitionSource:willBeginWithType:", self, 2, CSCoverSheetTransitionContextMake((uint64_t)v19, 1, (uint64_t)buf).n128_f64[0]);
    long long v16 = *(_OWORD *)buf;
    long long v17 = v21;
    long long v18 = v22;
    [(CSCoverSheetViewController *)self transitionSource:self didUpdateTransitionWithContext:&v16];
    long long v16 = *(_OWORD *)buf;
    long long v17 = v21;
    long long v18 = v22;
    [(CSCoverSheetViewController *)self transitionSource:self didEndWithContext:&v16];
  }
}

void __99__CSCoverSheetViewController__updateVisibilityForPageViewControllersWithVisiblePageViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 view];
  [v4 addObject:v5];

  uint64_t v6 = SBLogDashBoard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    unint64_t v8 = NSStringFromClass(v7);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Allowed view controller: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (unint64_t)_indexOfTodayPage
{
  return [(CSCoverSheetViewController *)self _indexOfPageViewControllerForRole:@"CSPageViewControllerRoleToday"];
}

- (unint64_t)_indexOfMainPage
{
  id v3 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  uint64_t v4 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  unint64_t v5 = [v3 indexOfObject:v4];

  return v5;
}

- (unint64_t)_indexOfCameraPage
{
  id v3 = [(CSCoverSheetViewController *)self activeBehavior];
  char v4 = [v3 areRestrictedCapabilities:4];

  if (v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [(CSCoverSheetViewController *)self _indexOfPageViewControllerForRole:@"CSPageViewControllerRoleCamera"];
}

- (unint64_t)_indexOfPageViewControllerForRole:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v5 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __64__CSCoverSheetViewController__indexOfPageViewControllerForRole___block_invoke;
  v9[3] = &unk_1E6AD9118;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __64__CSCoverSheetViewController__indexOfPageViewControllerForRole___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v7 = [v9 pageRole];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

- (BOOL)_handleEventType:(int64_t)a3
{
  if (CSEventIsButtonType(a3)
    && !CSCoverSheetEventIsVolumeOrHeadsetButtonType(a3)
    && ([(CSCoverSheetViewController *)self isInScreenOffMode]
     || [(CSCoverSheetViewController *)self _isWakeAnimationInProgress]
     || [(CSCoverSheetViewController *)self isTransitioningInteractively]))
  {
    return 0;
  }
  unint64_t v5 = +[CSEvent eventWithType:a3];
  BOOL v6 = [(CSCoverSheetViewController *)self _handleEvent:v5];

  return v6;
}

- (BOOL)_handleEvent:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isStateless] & 1) == 0
    && [(CSCoverSheetViewController *)self participantState] != 2)
  {
LABEL_44:
    char v36 = 0;
    goto LABEL_45;
  }
  unint64_t v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138412546;
    long long v49 = v6;
    __int16 v50 = 2112;
    id v51 = v4;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Sending event: %@", buf, 0x16u);
  }
  if (![v4 isConsumable])
  {
    [(CSCoverSheetViewController *)self _updateNotificationClearingTriggerForEvent:v4];
    [(CSScrollGestureController *)self->_scrollGestureController handleEvent:v4];
    [(CSPresentationViewController *)self->_modalPresentationController handleEvent:v4];
    [(CSFixedFooterViewController *)self->_fixedFooterViewController handleEvent:v4];
    [(CSQuickActionsViewController *)self->_quickActionsViewController handleEvent:v4];
    [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController handleEvent:v4];
    [(CSProudLockViewController *)self->_proudLockViewController handleEvent:v4];
    [(CSPoseidonViewController *)self->_poseidonViewController handleEvent:v4];
    [(CSUserPresenceMonitor *)self->_userPresenceMonitor handleEvent:v4];
    [(CSFaceOcclusionMonitor *)self->_faceOcclusionMonitor handleEvent:v4];
    [(CSPosterSwitcherActivationManager *)self->_posterSwitcherActivationManager handleEvent:v4];
    [(CSCoverSheetViewControllerBase *)self->_backgroundContentViewController handleEvent:v4];
    if ([(CSCoverSheetViewController *)self _isPresentingPosterSwitcher])
    {
      int v8 = [(CSCoverSheetViewControllerBase *)self->_posterSwitcherViewController coverSheetIdentifier];
      BOOL v9 = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v8];

      if (!v9) {
        [(CSPosterSwitcherViewController *)self->_posterSwitcherViewController handleEvent:v4];
      }
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v10 = [(CSCoverSheetViewController *)self pageViewControllers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v16 = (void *)MEMORY[0x1D94870A0]();
          [v15 handleEvent:v4];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v12);
    }

    long long v17 = (void *)[(NSHashTable *)self->_externalEventHandlers copy];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v38 + 1) + 8 * v22);
          id v24 = (void *)MEMORY[0x1D94870A0](v19);
          if (objc_msgSend(v23, "participantState", (void)v38) == 2) {
            [v23 handleEvent:v4];
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
        uint64_t v20 = v19;
      }
      while (v19);
    }

    long long v25 = SBLogDashBoard();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      BOOL v26 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138412290;
      long long v49 = v26;
      _os_log_impl(&dword_1D839D000, v25, OS_LOG_TYPE_INFO, "%@ Event delivered.", buf, 0xCu);
    }
    goto LABEL_44;
  }
  if ([(CSPresentationViewController *)self->_modalPresentationController participantState] == 2)
  {
    if ([(CSPresentationViewController *)self->_modalPresentationController handleEvent:v4])
    {
LABEL_8:
      int v7 = 1;
      goto LABEL_40;
    }
  }
  else
  {
    __int16 v27 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:self->_lastSettledPageIndex];
    int v28 = v27;
    if (v27) {
      int v29 = [v27 handleEvent:v4];
    }
    else {
      int v29 = 0;
    }

    if (v29) {
      goto LABEL_8;
    }
  }
  uint64_t v30 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
  long long v31 = v30;
  if (v30 && ([v30 presentationProgress], v32 > 0.0)) {
    int v7 = [v31 handleEvent:v4];
  }
  else {
    int v7 = 0;
  }

LABEL_40:
  long long v33 = SBLogDashBoard();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    long long v34 = _SBFLoggingMethodProem();
    long long v35 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    long long v49 = v34;
    __int16 v50 = 2112;
    id v51 = v35;
    _os_log_impl(&dword_1D839D000, v33, OS_LOG_TYPE_INFO, "%@ Event handled = %@", buf, 0x16u);
  }
  if (!v7) {
    goto LABEL_44;
  }
  char v36 = [v4 isConsumable];
LABEL_45:

  return v36;
}

- (void)_updateNotificationClearingTriggerForEvent:(id)a3
{
  if ([a3 type] == 37)
  {
    notificationClearingTrigger = self->_notificationClearingTrigger;
    [(CSNotificationClearingTrigger *)notificationClearingTrigger setDidDisableCarDNDUntilEndOfDrive:1];
  }
}

- (void)_updateLocalAppearanceForRequester:(id)a3 animationSettings:(id)a4 actions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1E4F4F898];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __102__CSCoverSheetViewController__updateLocalAppearanceForRequester_animationSettings_actions_completion___block_invoke;
  v19[3] = &unk_1E6AD9140;
  uint64_t v21 = self;
  id v22 = v11;
  id v20 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__CSCoverSheetViewController__updateLocalAppearanceForRequester_animationSettings_actions_completion___block_invoke_2;
  v17[3] = &unk_1E6AD8B48;
  id v18 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [v13 animateWithSettings:a4 actions:v19 completion:v17];
}

uint64_t __102__CSCoverSheetViewController__updateLocalAppearanceForRequester_animationSettings_actions_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = (*(void (**)(uint64_t))(v2 + 16))(v2);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [v8 setIdentifier:*(void *)(a1 + 32)];
          BOOL v9 = [*(id *)(a1 + 40) localAppearance];
          [v9 addComponent:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  return [*(id *)(a1 + 40) _updateActiveAppearanceForReason:*(void *)(a1 + 32)];
}

uint64_t __102__CSCoverSheetViewController__updateLocalAppearanceForRequester_animationSettings_actions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_behaviorForParticipant:(id)a3
{
  id v3 = a3;
  if ([v3 participantState] == 2)
  {
    uint64_t v4 = +[CSBehavior behaviorForProvider:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_appearanceForParticipant:(id)a3
{
  id v3 = a3;
  if ([v3 participantState] == 2)
  {
    uint64_t v4 = +[CSAppearance appearanceForProvider:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_presentationForParticipant:(id)a3
{
  id v3 = a3;
  if ([v3 participantState] == 2)
  {
    uint64_t v4 = +[CSPresentation presentationForProvider:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_updateAppearance:(id)a3 forComponentType:(int64_t)a4 shouldHide:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  uint64_t v7 = [v14 componentForType:a4 identifier:@"CSPresentation"];
  int v8 = (void *)v7;
  int v9 = !v5;
  if (!v5 || v7)
  {
    if (!v7) {
      int v9 = 0;
    }
    if (v9 == 1) {
      [v14 removeComponent:v7];
    }
  }
  else
  {
    id v10 = +[CSComponent componentWithType:a4];
    long long v11 = [v10 identifier:@"CSPresentation"];
    long long v12 = [v11 priority:10];
    long long v13 = [v12 hidden:1];

    [v14 addComponent:v13];
  }
}

- (void)_updateLocalAppearanceForPresentation
{
  id v3 = [(CSCoverSheetViewController *)self coverSheetView];
  uint64_t v4 = [(CSCoverSheetViewController *)self activePresentation];
  BOOL v5 = [v3 scrollView];
  [v5 pageRelativeScrollOffset];
  double v7 = v6;

  if ([(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource isTransitioning]&& [(CSCoverSheetViewController *)self _isSourceForHorizontalScrolling:self->_currentTransitionSource])
  {
    currentTransitionSource = self->_currentTransitionSource;
    if (currentTransitionSource) {
      [(CSCoverSheetViewTransitionSource *)currentTransitionSource transitionContext];
    }
    double v7 = 0.0;
  }
  [v3 dateViewPresentationExtentForPageRelativeScrollOffset:v7];
  int v9 = +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v3);
  id v10 = [v4 firstRegionIntersectingCoordinateSpace:v9 excludingRegionsWithRole:3];
  BOOL v11 = v10 != 0;

  [(CSCoverSheetViewController *)self _updateAppearance:self->_localAppearance forComponentType:1 shouldHide:v11];
  long long v12 = [(CSFixedFooterViewController *)self->_fixedFooterViewController fixedFooterView];
  localAppearance = self->_localAppearance;
  id v14 = [v12 pageControl];
  -[CSCoverSheetViewController _updateAppearance:forComponentType:shouldHide:](self, "_updateAppearance:forComponentType:shouldHide:", localAppearance, 3, [v4 intersectsCoordinateSpace:v14]);

  id v15 = self->_localAppearance;
  uint64_t v16 = [v12 statusTextView];
  long long v17 = [v4 firstRegionIntersectingCoordinateSpace:v16 excludingRegionsWithRole:2];
  [(CSCoverSheetViewController *)self _updateAppearance:v15 forComponentType:10 shouldHide:v17 != 0];

  id v18 = [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController teachableMomentsContainerView];
  uint64_t v19 = [v18 callToActionLabelPositionPlaceholderView];
  id v20 = v19;
  __int16 v50 = v12;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v12 callToActionLabel];
  }
  id v22 = v21;

  long long v49 = v22;
  -[CSCoverSheetViewController _updateAppearance:forComponentType:shouldHide:](self, "_updateAppearance:forComponentType:shouldHide:", self->_localAppearance, 9, [v4 intersectsCoordinateSpace:v22] | -[CSCoverSheetViewController isUnlockDisabled](self, "isUnlockDisabled"));
  long long v48 = [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController view];
  long long v23 = objc_msgSend(v4, "firstRegionIntersectingCoordinateSpace:excludingRegionsWithRole:");
  BOOL v24 = v23 != 0;

  [(CSCoverSheetViewController *)self _updateAppearance:self->_localAppearance forComponentType:25 shouldHide:v24];
  long long v25 = [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController homeAffordanceViewController];
  BOOL v26 = [v25 homeAffordanceView];

  if (v26)
  {
    __int16 v27 = [v4 firstRegionIntersectingCoordinateSpace:v26 excludingRegionsWithRole:3];

    int v28 = [(CSAppearance *)self->_localAppearance componentForType:12 identifier:@"CSPresentation"];
    int v29 = v28;
    if (v28)
    {
      [v28 setHidden:0];
      [v29 setSuppressTeachableMomentsAnimation:BSSettingFlagIfYes()];
    }
    else
    {
      uint64_t v30 = +[CSComponent componentWithType:12];
      long long v31 = [v30 identifier:@"CSPresentation"];
      [v31 priority:10];
      uint64_t v46 = v26;
      long long v33 = v32 = v9;

      [v33 setHidden:0];
      [v33 setSuppressTeachableMomentsAnimation:BSSettingFlagIfYes()];
      [(CSAppearance *)self->_localAppearance addComponent:v33];

      int v9 = v32;
      BOOL v26 = v46;
    }
  }
  long long v34 = [v18 controlCenterGrabberPositionPlaceholderView];
  long long v35 = [v4 firstRegionIntersectingCoordinateSpace:v34 excludingRegionsWithRole:3];

  char v36 = [(CSAppearance *)self->_localAppearance componentForType:13 identifier:@"CSPresentation"];
  long long v37 = v36;
  if (v36)
  {
    [v36 setHidden:v35 != 0];
  }
  else
  {
    long long v44 = +[CSComponent componentWithType:13];
    long long v45 = v9;
    [v44 identifier:@"CSPresentation"];
    v38 = long long v47 = v26;
    [v38 priority:10];
    long long v39 = v4;
    long long v40 = v18;
    v42 = long long v41 = v3;
    long long v43 = [v42 hidden:v35 != 0];

    id v3 = v41;
    id v18 = v40;
    uint64_t v4 = v39;

    BOOL v26 = v47;
    int v9 = v45;
    [(CSAppearance *)self->_localAppearance addComponent:v43];
  }
}

- (BOOL)_wouldUpdateActiveAppearance
{
}

- (id)__currentDesiredAppearanceWithStartIndex:(unint64_t *)a3 targetIndex:(unint64_t *)a4 targetAppearance:(id *)a5 targetPresentation:(id *)a6 modalAppearance:(id *)a7 proudLockAppearance:(id *)a8 poseidonAppearance:(id *)a9
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v14 = [(CSCoverSheetViewController *)self coverSheetView];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  [(CSCoverSheetViewController *)self transitionContext];
  id v15 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:(unint64_t)0.0];
  if (v15)
  {
    uint64_t v16 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:(unint64_t)0.0];
    if (v16)
    {
      long long v45 = a6;
      uint64_t v46 = a7;
      long long v44 = a5;
      long long v48 = v15;
      long long v47 = a8;
      id v51 = +[CSAppearance appearanceForProvider:v15];
      long long v17 = v16;
      +[CSPresentation presentationForProvider:v15];
      v50 = long long v49 = v14;
      id v20 = [v14 window];

      if (v20)
      {
        id v21 = [(CSCoverSheetViewController *)self view];
        uint64_t v22 = [v21 window];
        long long v23 = +[CSPresentation presentationWithCoordinateSpace:v22];

        [v23 setIdentifier:@"CSPresentation"];
        BOOL v24 = [(CSCoverSheetViewController *)self _presentationForParticipant:self->_modalPresentationController];
        [v23 unionPresentation:v24];

        [v23 unionPresentation:v50];
        long long v25 = [(CSCoverSheetViewController *)self externalPresentation];
        [v23 unionPresentation:v25];

        BOOL v26 = [(CSCoverSheetViewController *)self activePresentation];
        LOBYTE(v22) = [v23 isEqual:v26];

        if ((v22 & 1) == 0)
        {
          [(CSCoverSheetViewController *)self setActivePresentation:v23];
          [(CSCoverSheetViewController *)self _updateLocalAppearanceForPresentation];
          __int16 v27 = [(CSCoverSheetViewController *)self coverSheetView];
          int v28 = [v27 regionsDebugView];
          int v29 = [v23 regions];
          [v28 setRegions:v29];

          uint64_t v30 = SBLogDashBoard();
          LODWORD(v28) = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);

          if (v28)
          {
            long long v31 = SBLogDashBoard();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[CSCoverSheetViewController __currentDesiredAppearanceWithStartIndex:targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:]();
            }
          }
        }
      }
      id v18 = +[CSAppearance appearanceWithIdentifier:@"(active)"];
      uint64_t v32 = [(CSCoverSheetViewController *)self _appearanceForParticipant:self->_modalPresentationController];
      long long v33 = [(CSCoverSheetViewController *)self _appearanceForParticipant:self->_proudLockViewController];
      long long v34 = [(CSCoverSheetViewController *)self _appearanceForParticipant:self->_poseidonViewController];
      [v18 unionAppearance:v51];
      long long v35 = [(CSCoverSheetViewController *)self localAppearance];
      [v18 unionAppearance:v35];

      id v43 = (id)v32;
      [v18 unionAppearance:v32];
      [v18 unionAppearance:v33];
      [v18 unionAppearance:self->_teachableMomentsContainerViewController];
      [v18 unionAppearance:v34];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      char v36 = self->_externalAppearanceProviders;
      uint64_t v37 = [(NSHashTable *)v36 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v55 != v39) {
              objc_enumerationMutation(v36);
            }
            long long v41 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            if ([v41 participantState] == 2) {
              [v18 unionAppearance:v41];
            }
          }
          uint64_t v38 = [(NSHashTable *)v36 countByEnumeratingWithState:&v54 objects:v61 count:16];
        }
        while (v38);
      }

      if (a3) {
        *a3 = (unint64_t)0.0;
      }
      if (a4) {
        *a4 = (unint64_t)0.0;
      }
      if (v44) {
        id *v44 = v51;
      }
      uint64_t v19 = v50;
      if (v45) {
        *long long v45 = v50;
      }
      if (v46) {
        *uint64_t v46 = v43;
      }
      if (v47) {
        id *v47 = v33;
      }
      if (a9) {
        *a9 = v34;
      }

      id v15 = v48;
      id v14 = v49;
    }
    else
    {
      uint64_t v19 = SBLogDashBoard();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[CSCoverSheetViewController __currentDesiredAppearanceWithStartIndex:targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:](self);
      }
      id v18 = 0;
      long long v17 = 0;
    }
  }
  else
  {
    long long v17 = SBLogDashBoard();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[CSCoverSheetViewController __currentDesiredAppearanceWithStartIndex:targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:](self);
    }
    id v18 = 0;
  }

  return v18;
}

uint64_t __63__CSCoverSheetViewController__updateActiveAppearanceForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDateTimeView];
  [*(id *)(a1 + 32) _updateRemoteInlineContentView];
  [*(id *)(a1 + 32) _updateStatusBar];
  [*(id *)(a1 + 32) _updatePageContent];
  [*(id *)(a1 + 32) _updateBackground];
  [*(id *)(a1 + 32) _updateBackgroundContentView];
  [*(id *)(a1 + 32) _updateComplicationsContainerView];
  [*(id *)(a1 + 32) _updateComplicationSidebar];
  [*(id *)(a1 + 32) _updateForegroundView];
  [*(id *)(a1 + 32) _updateFullBleedContent];
  [*(id *)(a1 + 32) _updateVibrancy];
  [*(id *)(a1 + 32) _updateLegibilitySettings];
  [*(id *)(a1 + 32) _updateWallpaperEffectView];
  [*(id *)(a1 + 32) _updateWallpaperFloatingLayerContainerView];
  [*(id *)(a1 + 32) _updateTintingView];
  [*(id *)(a1 + 32) _updateStatusBarBackground];
  [*(id *)(a1 + 32) _updateFixedFooterView];
  [*(id *)(a1 + 32) _updateProudLockView];
  [*(id *)(a1 + 32) _updateContent];
  [*(id *)(a1 + 32) _updateControlCenterGrabber];
  [*(id *)(a1 + 32) _updateModalContent];
  [*(id *)(a1 + 32) _updateWallpaper];
  [*(id *)(a1 + 32) _updateQuickActions];
  [*(id *)(a1 + 32) _updateStatusBarGradient];
  [*(id *)(a1 + 32) _updatePoseidon];
  [*(id *)(a1 + 32) _updateWhitePoint];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateDimmingLayer];
}

uint64_t __63__CSCoverSheetViewController__updateActiveAppearanceForReason___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isTransitioning] & 1) == 0) {
    [*(id *)(a1 + 32) setPreviousAppearance:*(void *)(a1 + 40)];
  }
  uint64_t result = [*(id *)(a1 + 32) participantState];
  if (result == 2)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      int v3 = [*(id *)(a1 + 48) isHidden];
      int v4 = v3 ^ [*(id *)(a1 + 32) _isPageContentHidden] ^ 1;
    }
    else
    {
      int v4 = 0;
    }
    if (*(unsigned char *)(a1 + 65))
    {
      [*(id *)(a1 + 56) offset];
      double v6 = v5;
      double v8 = v7;
      [*(id *)(a1 + 32) _slideableContentOffset];
      BOOL v11 = v8 == v10 && v6 == v9;
    }
    else
    {
      BOOL v11 = 0;
    }
    uint64_t result = [*(id *)(a1 + 32) isTransitioning];
    if ((result & 1) == 0)
    {
      int v12 = v4 | v11;
      if ((v12 & 1) != 0 || *(unsigned char *)(a1 + 66))
      {
        uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1248) isPresentingContent];
        if ((result ^ 1 | v12) == 1)
        {
          if ([*(id *)(a1 + 32) _isPageContentHidden]) {
            uint64_t v13 = 0;
          }
          else {
            uint64_t v13 = [*(id *)(a1 + 32) _isSlideableContentOnscreen];
          }
          id v14 = *(void **)(a1 + 32);
          return [v14 _endAppearanceTransitionForPageViewControllersToVisible:v13];
        }
      }
    }
  }
  return result;
}

void __89__CSCoverSheetViewController__updateActiveBehaviorsForReason_updatingAppearanceIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendString:v3];
}

- (void)_updateRestrictedBehavior
{
  BOOL screenOffMode = self->_screenOffMode;
  localBehavior = self->_localBehavior;
  if (screenOffMode) {
    [(CSBehavior *)localBehavior addRestrictedCapabilities:0x2000000];
  }
  else {
    [(CSBehavior *)localBehavior removeRestrictedCapabilities:0x2000000];
  }
  if (self->_hasContentAboveCoverSheet && !self->_contentAboveIsSiriOrNotFullScreenOniPad)
  {
    [(CSBehavior *)self->_localBehavior setNotificationBehavior:2];
  }
  else
  {
    [(CSBehavior *)self->_localBehavior setNotificationBehavior:0];
    if (![(CSCoverSheetViewController *)self _showingAccessoryView]) {
      [(CSCoverSheetViewController *)self _updateAccessoryAnimationPresenting:0 userInteractionDisabled:0];
    }
  }
  if (([MEMORY[0x1E4F922A8] supportsPosterCustomization] & 1) == 0)
  {
    double v5 = self->_localBehavior;
    [(CSBehavior *)v5 addRestrictedCapabilities:0x800000];
  }
}

- (void)_updateBackground
{
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  if (v3)
  {
    int v4 = [(CSCoverSheetViewController *)self coverSheetView];
    double v5 = [v4 backgroundView];

    double v6 = [(CSCoverSheetViewController *)self _averageLockScreenWallpaperColor];
    double v7 = [(CSCoverSheetViewController *)self coverSheetView];
    [v7 setReduceTransparencyBackingColor:v6];

    [v5 setReduceTransparencyBackingColor:v6];
    double v8 = [v3 componentForType:19 identifier:@"(active)"];
    double v9 = [v8 value];
    uint64_t v10 = [v9 integerValue];

    if ([(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource isTransitioning])
    {
      [v5 beginTransitionToBackgroundStyle:v10];
      [v8 transitionProgress];
      double v12 = v11;
      objc_msgSend(v5, "updateBackgroundStyleTransitionProgress:");
      if ((v10 == 7) == ([v5 backgroundStyle] == 7))
      {
LABEL_10:
        id v15 = [v8 color];
        [v5 setBackgroundColor:v15];

        goto LABEL_11;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__CSCoverSheetViewController__updateBackground__block_invoke;
      _OWORD v16[3] = &__block_descriptor_33_e8_d16__0d8l;
      BOOL v17 = v10 == 7;
      uint64_t v13 = (void (**)(void, double))MEMORY[0x1D9487300](v16);
      id v14 = [v5 backdropView];
      v13[2](v13, v12);
      objc_msgSend(v14, "setAlpha:");
    }
    else
    {
      if ([v5 isTransitioningBackgroundStyle]) {
        [v5 completeTransitionToBackgroundStyle:v10];
      }
      else {
        [v5 setBackgroundStyle:v10];
      }
      uint64_t v13 = [v5 backdropView];
      [v13 setAlpha:1.0];
    }

    goto LABEL_10;
  }
LABEL_11:
}

double __47__CSCoverSheetViewController__updateBackground__block_invoke(uint64_t a1, double a2)
{
  if (a2 < 0.2 && *(unsigned char *)(a1 + 32))
  {
    double v2 = fmax(a2 / 0.2 + 0.0, 0.0);
    double v3 = 1.0;
    return fmin(v2, v3);
  }
  double v3 = 1.0;
  if (a2 > 0.8 && !*(unsigned char *)(a1 + 32))
  {
    double v2 = fmax((1.0 - a2) / 0.2 + 0.0, 0.0);
    return fmin(v2, v3);
  }
  return v3;
}

- (void)_updateForegroundView
{
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  double v3 = [(CSCoverSheetViewController *)self activeAppearance];
  int v4 = [v3 componentForType:5 property:2];

  [v4 offset];
  objc_msgSend(v5, "setForegroundViewPositionOffset:");
}

- (void)_updateDateTimeView
{
  double v3 = [(CSCoverSheetViewController *)self coverSheetView];
  int v4 = [(CSCoverSheetViewController *)self activeAppearance];
  id v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  BOOL v7 = (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1
    && (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) < 0xFFFFFFFFFFFFFFFELL;
  double v8 = [(CSCoverSheetViewController *)self dateView];
  [v8 setUseCompactDateFormat:v7];

  double v9 = [(CSCoverSheetViewController *)self dateView];
  [v9 setUseLandscapeTimeFontSize:v7];

  uint64_t v10 = [v4 componentForType:1 identifier:@"(active)"];
  [v10 vibrantAndCentered];
  uint64_t IsYes = BSSettingFlagIsYes();
  LOBYTE(v9) = IsYes;
  [v3 setDateViewIsVibrant:IsYes];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __49__CSCoverSheetViewController__updateDateTimeView__block_invoke;
  v47[3] = &unk_1E6AD91D8;
  id v12 = v3;
  id v48 = v12;
  char v50 = (char)v9;
  id v13 = v10;
  id v49 = v13;
  id v14 = (void (**)(void))MEMORY[0x1D9487300](v47);
  if ([v13 isHidden])
  {
    objc_initWeak(&location, self);
    id v15 = (void *)MEMORY[0x1E4F4F898];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __49__CSCoverSheetViewController__updateDateTimeView__block_invoke_3;
    v43[3] = &unk_1E6AD9200;
    objc_copyWeak(&v45, &location);
    long long v44 = v14;
    [v15 addAlongsideAnimations:0 completion:v43];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  uint64_t v16 = [v12 dateView];
  [v16 timeAlpha];
  if (BSFloatIsZero())
  {
    BOOL v17 = [v12 dateView];
    [v17 subtitleAlpha];
    int IsZero = BSFloatIsZero();
  }
  else
  {
    int IsZero = 0;
  }

  [v12 dateViewOffset];
  double v20 = v19;
  double v22 = v21;
  [v13 offset];
  if (IsZero || v23 != v20 || v24 == v22)
  {
    if (!IsZero) {
      goto LABEL_13;
    }
  }
  else
  {
    [v13 animationDuration];
    if (v25 != 0.0)
    {
LABEL_13:
      v14[2](v14);
      goto LABEL_16;
    }
  }
  BOOL v26 = (void *)MEMORY[0x1E4F42FF0];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  id v41[2] = __49__CSCoverSheetViewController__updateDateTimeView__block_invoke_4;
  v41[3] = &unk_1E6AD8B78;
  long long v42 = v14;
  [v26 performWithoutAnimation:v41];

LABEL_16:
  if ([v13 isHidden])
  {
    BOOL v27 = 0;
  }
  else
  {
    int v28 = [v13 string];
    if (v28)
    {
      int v29 = [v13 string];
      BOOL v27 = [v29 length] != 0;
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  double v30 = 0.0;
  double v31 = 0.0;
  if (([v13 isHidden] & 1) == 0 && (objc_msgSend(v13, "hidesTime") & 1) == 0)
  {
    [v13 alpha];
    double v31 = v32;
  }
  if (v27)
  {
    [v13 alpha];
    double v30 = v33;
  }
  [(SBFLockScreenDateViewController *)self->_dateViewController setTimeAlpha:v31 subtitleAlpha:v30];
  long long v34 = [(CSCoverSheetViewController *)self traitCollection];
  uint64_t v35 = [v34 _backlightLuminance];

  double v36 = 0.0;
  if (v35 != 1) {
    double v36 = 1.0;
  }
  [(SBFLockScreenDateViewController *)self->_dateViewController setBackgroundAlpha:v36];
  uint64_t v37 = [v13 view];
  if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    dateViewController = self->_dateViewController;
    uint64_t v39 = v37;
  }
  else
  {
    dateViewController = self->_dateViewController;
    uint64_t v39 = 0;
  }
  [(SBFLockScreenDateViewController *)dateViewController setCustomSubtitleView:v39];
  long long v40 = [v12 dateView];
  [(CSCoverSheetViewController *)self dateTimeSubtitleMaximumWidth];
  objc_msgSend(v40, "setMaximumSubtitleWidth:");
}

void __49__CSCoverSheetViewController__updateDateTimeView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setForceDateViewCentered:*(unsigned __int8 *)(a1 + 48)];
  double v2 = [*(id *)(a1 + 40) value];
  double v3 = v2;
  int v4 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v5 = [v2 integerValue];
  }
  else {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v4 setDateViewPageAlignment:v5];
  objc_msgSend(*(id *)(a1 + 32), "setDateViewStretch:", objc_msgSend(*(id *)(a1 + 40), "stretch"));
  uint64_t v6 = (void *)MEMORY[0x1E4F42FF0];
  [*(id *)(a1 + 40) animationDuration];
  double v8 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __49__CSCoverSheetViewController__updateDateTimeView__block_invoke_2;
  v9[3] = &unk_1E6AD88C0;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [v6 animateWithDuration:v9 animations:v8];
}

uint64_t __49__CSCoverSheetViewController__updateDateTimeView__block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) offset];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 40) scale];

  return objc_msgSend(v2, "setDateViewOffset:scale:", v4, v6, v7);
}

void __49__CSCoverSheetViewController__updateDateTimeView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = [WeakRetained activeAppearance];
  double v3 = [v2 componentForType:1 identifier:@"(active)"];
  if ([v3 isHidden]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __49__CSCoverSheetViewController__updateDateTimeView__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateRemoteInlineContentView
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:21 identifier:@"(active)"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_remoteContentInlineProvidingManagers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setInlineRemoteContentHidden:", objc_msgSend(v4, "isHidden", (void)v10));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_updateProudLockView
{
  double v3 = [(CSCoverSheetViewController *)self coverSheetView];
  double v4 = [(CSProudLockViewController *)self->_proudLockViewController proudLockView];
  double v5 = [(CSCoverSheetViewController *)self activeAppearance];
  uint64_t v6 = [v5 componentForType:11 identifier:@"(active)"];
  [v6 alpha];
  objc_msgSend(v4, "setAlpha:");
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  int v11 = [v10 supportsMaterialBackground];
  uint64_t v12 = objc_opt_class();
  id v13 = v4;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  uint64_t v16 = [v15 backgroundMaterialView];

  double v17 = 0.0;
  if (v11) {
    double v17 = 1.0;
  }
  [v16 setAlpha:v17];

  int64_t finalInterfaceOrientationForInProgressTransition = self->_finalInterfaceOrientationForInProgressTransition;
  if ((unint64_t)(finalInterfaceOrientationForInProgressTransition - 1) >= 2)
  {
    unint64_t v20 = finalInterfaceOrientationForInProgressTransition - 5;
    BOOL v19 = v20 < 0xFFFFFFFFFFFFFFFELL;
    if (v20 <= 0xFFFFFFFFFFFFFFFDLL
      && (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) > 1)
    {
      BOOL v19 = 1;
    }
    else
    {
      double v21 = [(CSProudLockViewController *)self->_proudLockViewController proudLockContainerViewController];
      [v21 proudLockLandscapeOffset];
      double v23 = v22;

      objc_msgSend(v8, "setOffset:", 0.0, -v23);
    }
  }
  else
  {
    BOOL v19 = 0;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __50__CSCoverSheetViewController__updateProudLockView__block_invoke;
  v39[3] = &unk_1E6AD88C0;
  id v24 = v8;
  id v40 = v24;
  id v25 = v3;
  id v41 = v25;
  BOOL v26 = (void (**)(void))MEMORY[0x1D9487300](v39);
  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl()
      && ([MEMORY[0x1E4F42948] currentDevice],
          BOOL v27 = objc_claimAutoreleasedReturnValue(),
          uint64_t v28 = [v27 userInterfaceIdiom],
          v27,
          (v28 & 0xFFFFFFFFFFFFFFFBLL) == 1))
    {
      uint64_t v29 = objc_opt_class();
      id v30 = v24;
      if (v29)
      {
        if (objc_opt_isKindOfClass()) {
          double v31 = v30;
        }
        else {
          double v31 = 0;
        }
      }
      else
      {
        double v31 = 0;
      }
      id v33 = v31;

      int v34 = [v33 prefersInlineCoaching];
      uint64_t v32 = v34 ^ 1u;
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v35 = [(CSProudLockViewController *)self->_proudLockViewController proudLockContainerViewController];
    [v35 setSuppressAlongsideCoaching:v32];
  }
  [v24 animationDuration];
  if ((v19 & BSFloatIsZero()) == 1)
  {
    double v36 = (void *)MEMORY[0x1E4F42FF0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50__CSCoverSheetViewController__updateProudLockView__block_invoke_3;
    v37[3] = &unk_1E6AD8B78;
    uint64_t v38 = v26;
    [v36 performWithoutAnimation:v37];
  }
  else
  {
    v26[2](v26);
  }
}

void __50__CSCoverSheetViewController__updateProudLockView__block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F42FF0];
  [*(id *)(a1 + 32) animationDuration];
  double v4 = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CSCoverSheetViewController__updateProudLockView__block_invoke_2;
  v5[3] = &unk_1E6AD88C0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v2 animateWithDuration:v5 animations:v4];
}

uint64_t __50__CSCoverSheetViewController__updateProudLockView__block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) offset];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 40) scale];
  objc_msgSend(v2, "setProudLockIconViewOffset:scale:", v4, v6, v7);
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  objc_msgSend(v8, "setProudLockPrefersLowerPresentationLevel:", objc_msgSend(v13, "shouldResideInALowerSubview"));
  id v14 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) blurRadius];

  return objc_msgSend(v14, "setProudLockIconBlurRadius:");
}

uint64_t __50__CSCoverSheetViewController__updateProudLockView__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateProudLockViewUpdateSuspension
{
  proudLockViewController = self->_proudLockViewController;
  id v3 = [(CSCoverSheetViewController *)self activeBehavior];
  -[CSProudLockViewController setSuspendLockUpdates:](proudLockViewController, "setSuspendLockUpdates:", [v3 areRestrictedCapabilities:0x8000]);
}

- (void)_updateStatusBar
{
  fakeStatusBar = self->_fakeStatusBar;
  double v4 = [(CSCoverSheetViewController *)self _fakeStatusBarSettings];
  [(UIStatusBar *)fakeStatusBar setStyleRequest:v4];

  double v22 = [(CSCoverSheetViewController *)self activeAppearance];
  double v5 = [v22 componentForType:2 identifier:@"(active)"];
  double v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
  double v7 = [v5 legibilitySettings];
  if (!v7)
  {
    double v7 = [(CSAppearance *)self->_activeAppearance legibilitySettings];
  }
  uint64_t v8 = [v7 style];
  uint64_t v9 = [v6 statusBarLegibilitySettings];
  uint64_t v10 = [v9 style];

  [v5 flag];
  int IsYes = BSSettingFlagIsYes();
  BOOL v12 = [(CSCoverSheetViewController *)self _isFakeStatusBarEnabled];
  char v13 = v12 & (IsYes ^ 1);
  if (v12) {
    int v14 = IsYes ^ 1;
  }
  else {
    int v14 = IsYes;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__CSCoverSheetViewController__updateStatusBar__block_invoke;
  v27[3] = &unk_1E6AD9228;
  void v27[4] = self;
  id v15 = v6;
  id v28 = v15;
  id v16 = v5;
  id v29 = v16;
  BOOL v31 = v8 != v10;
  id v17 = v7;
  id v30 = v17;
  char v32 = v13;
  id v18 = (void *)MEMORY[0x1D9487300](v27);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__CSCoverSheetViewController__updateStatusBar__block_invoke_2;
  v26[3] = &unk_1E6AD8A40;
  v26[4] = self;
  BOOL v19 = (void *)MEMORY[0x1D9487300](v26);
  unint64_t v20 = (void *)MEMORY[0x1E4F42FF0];
  if (v14 == 1)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__CSCoverSheetViewController__updateStatusBar__block_invoke_3;
    v23[3] = &unk_1E6AD9250;
    id v24 = v18;
    id v25 = v19;
    [v20 performWithoutAnimation:v23];
  }
  else if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
  {
    [MEMORY[0x1E4F4F898] addAlongsideAnimations:v18 completion:v19];
  }
  else
  {
    if (v8 == v10)
    {
      double v21 = 0;
    }
    else
    {
      double v21 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
    }
    [MEMORY[0x1E4F4F898] animateWithSettings:v21 actions:v18 completion:v19];
  }
}

void __46__CSCoverSheetViewController__updateStatusBar__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1426) || *(unsigned char *)(v2 + 1745))
  {
    [*(id *)(a1 + 40) clearStatusBarParameters];
  }
  else
  {
    double v7 = NSNumber;
    uint64_t v8 = *(void **)(a1 + 40);
    [*(id *)(a1 + 48) alpha];
    uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
    uint64_t v10 = [*(id *)(a1 + 32) statusBarStyle];
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v11 = *(void *)(a1 + 56);
    }
    else {
      uint64_t v11 = 0;
    }
    [v8 setStatusBarAlpha:v9 style:v10 legibilitySettings:v11];

    if (([*(id *)(a1 + 32) isTransitioning] & 1) == 0 && !*(unsigned char *)(*(void *)(a1 + 32) + 1066))
    {
      if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
      {
        [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
        double v18 = v17;
      }
      else if (*(unsigned char *)(a1 + 65))
      {
        double v18 = 0.0;
      }
      else
      {
        double v18 = 0.25;
      }
      objc_msgSend(*(id *)(a1 + 40), "setStatusBarPart:hidden:animationDuration:", 0, objc_msgSend(*(id *)(a1 + 32), "shouldShowLockStatusBarTime") ^ 1, v18);
    }
  }
  [*(id *)(a1 + 48) flag];
  int IsYes = BSSettingFlagIsYes();
  double v4 = *(unsigned char **)(a1 + 32);
  if (!IsYes || v4[1065] || v4[1426])
  {
    double v5 = [v4 coverSheetView];
    [*(id *)(a1 + 48) blurRadius];
    objc_msgSend(v5, "setFakeStatusBarBlurRadius:");

    double v6 = *(void **)(a1 + 32);
    [v6 _setFakeStatusBarEnabled:0];
  }
  else
  {
    [v4 _setFakeStatusBarEnabled:1];
    BOOL v12 = [*(id *)(a1 + 32) coverSheetView];
    char v13 = [*(id *)(a1 + 48) value];
    objc_msgSend(v12, "setFakeStatusBarLevel:", objc_msgSend(v13, "integerValue"));

    int v14 = [*(id *)(a1 + 32) coverSheetView];
    [*(id *)(a1 + 48) blurRadius];
    objc_msgSend(v14, "setFakeStatusBarBlurRadius:");

    id v15 = [*(id *)(a1 + 32) coverSheetView];
    [*(id *)(a1 + 48) scale];
    objc_msgSend(v15, "setFakeStatusBarScale:");

    id v19 = [*(id *)(a1 + 32) coverSheetView];
    id v16 = [v19 fakeStatusBar];
    [*(id *)(a1 + 48) alpha];
    objc_msgSend(v16, "setAlpha:");
  }
}

void __46__CSCoverSheetViewController__updateStatusBar__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)*MEMORY[0x1E4F43630] statusBar];
  [v2 alpha];
  char IsZero = BSFloatIsZero();

  if ((IsZero & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) view];
    double v4 = [v6 window];
    double v5 = [v4 rootViewController];
    [v5 _updateContentOverlayInsetsFromParentIfNecessary];
  }
}

uint64_t __46__CSCoverSheetViewController__updateStatusBar__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_updateStatusBarBackground
{
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:2 identifier:@"(active)"];

  double v5 = [(CSCoverSheetViewController *)self activeAppearance];
  id v6 = [v5 componentForType:8 identifier:@"(active)"];

  int v7 = [v4 isHidden];
  [v4 flag];
  if (BSSettingFlagIsYes()) {
    BOOL v8 = !self->_hasContentAboveCoverSheet;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [v6 value];
  uint64_t v10 = [(CSCoverSheetViewController *)self coverSheetView];
  if (v9) {
    uint64_t v11 = [v9 integerValue];
  }
  else {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v10 setStatusBarBackgroundPageAlignment:v11];

  currentTransitionSource = self->_currentTransitionSource;
  if (currentTransitionSource) {
    [(CSCoverSheetViewTransitionSource *)currentTransitionSource transitionContext];
  }
  BSIntervalFractionForValue();
  if ([(CSCoverSheetViewController *)self isTransitioning]
    && (BSFloatIsOne() & 1) == 0)
  {
    double v13 = 0.0;
    if ([v6 isHidden]) {
      goto LABEL_19;
    }
  }
  else
  {
    [v6 flag];
    double v13 = 0.0;
    if (!BSSettingFlagIsYes() || ([v6 isHidden] & 1) != 0) {
      goto LABEL_19;
    }
  }
  if (!self->_hasContentAboveCoverSheet
    && v8 | v7 ^ 1
    && ![(CSCoverSheetViewController *)self _isPresentingPosterSwitcher])
  {
    [(CSCoverSheetViewController *)self _createStatusBarBackgroundViewIfNeeded];
    [v6 alpha];
    double v13 = v14;
  }
LABEL_19:
  [(UIView *)self->_statusBarBackgroundView setAlpha:v13];
}

- (void)_updatePageContent
{
  id v7 = [(CSCoverSheetViewController *)self coverSheetView];
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:4 identifier:@"(active)"];
  double v5 = [v7 scrollView];
  [v4 alpha];
  objc_msgSend(v5, "setAlpha:");

  id v6 = [v7 scrollView];
  [v4 flag];
  [v6 setBouncesHorizontally:BSSettingFlagIsExplicitNo() ^ 1];
}

- (void)_updateModalContent
{
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:22 identifier:@"(active)"];
  objc_msgSend(v5, "setModalPresentationLevel:", objc_msgSend(v4, "level"));
}

- (void)_updateWallpaper
{
  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:6 identifier:@"(active)"];
  objc_msgSend(v5, "setWallpaperPresentationLevel:", objc_msgSend(v4, "level"));
}

- (void)_updateFixedFooterView
{
  id v19 = [(CSFixedFooterViewController *)self->_fixedFooterViewController fixedFooterView];
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:3 identifier:@"(active)"];
  id v5 = [v19 pageControl];
  [v4 alpha];
  objc_msgSend(v5, "setAlpha:");

  id v6 = [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController teachableMomentsContainerView];
  id v7 = [v6 callToActionLabel];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v19 callToActionLabel];
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v3 componentForType:9 identifier:@"(active)"];
  [v11 alpha];
  objc_msgSend(v10, "setAlpha:");
  BOOL v12 = [v3 componentForType:10 identifier:@"(active)"];
  [v12 offset];
  double v14 = v13;
  double v16 = v15;
  [v12 scale];
  objc_msgSend(v19, "setStatusTextViewOffset:scale:", v14, v16, v17);
  double v18 = [v19 statusTextView];
  [v12 alpha];
  objc_msgSend(v18, "setAlpha:");
}

- (void)_updateHomeAffordance
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  double v4 = [v3 componentForType:12 identifier:@"(active)"];
  id v5 = [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController homeAffordanceViewController];
  id v6 = [v5 homeAffordanceView];
  objc_msgSend(v6, "setStyle:", objc_msgSend(v4, "viewStyle"));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __51__CSCoverSheetViewController__updateHomeAffordance__block_invoke;
  v25[3] = &unk_1E6AD88C0;
  id v7 = v4;
  id v26 = v7;
  BOOL v27 = self;
  BOOL v8 = (void (**)(void))MEMORY[0x1D9487300](v25);
  [v7 suppressTeachableMomentsAnimation];
  [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController setAnimationState:BSSettingFlagIsYes() ^ 1];
  [v7 alpha];
  double v10 = v9;
  [v6 alpha];
  int IsZero = BSFloatIsZero();
  int v12 = [v7 isHidden];
  if ([(CSCoverSheetViewController *)self _appearState] == 2) {
    uint64_t v13 = BSFloatIsOne() & (v12 ^ 1);
  }
  else {
    uint64_t v13 = 0;
  }
  double v14 = [(CSCoverSheetContextProviding *)self->_coverSheetContext assistantController];
  int v15 = [v14 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  [v5 setHomeAffordanceInteractionEnabled:v13 & v15];
  [v6 setSystemPointerInteractionEnabled:v13];
  if (IsZero != v12)
  {
    double v16 = SBLogDashBoard();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v29 = IsZero ^ 1;
      __int16 v30 = 1024;
      int v31 = v12 ^ 1;
      _os_log_impl(&dword_1D839D000, v16, OS_LOG_TYPE_DEFAULT, "DashBoard home affordance transitioning from visible: %{BOOL}d to visible:%{BOOL}d", buf, 0xEu);
    }
  }
  if ((IsZero ^ 1 | v12))
  {
    [v6 setAlpha:v10];
    v8[2](v8);
  }
  else
  {
    double v17 = [MEMORY[0x1E4FA5F28] rootSettings];
    double v18 = [v17 unhideForHomeGestureOwnershipAnimationSettings];
    id v19 = [v18 BSAnimationSettings];

    unint64_t v20 = (void *)MEMORY[0x1E4F4F898];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__CSCoverSheetViewController__updateHomeAffordance__block_invoke_559;
    v21[3] = &unk_1E6AD9278;
    id v22 = v6;
    double v24 = v10;
    double v23 = v8;
    [v20 animateWithSettings:v19 actions:v21 completion:0];
  }
}

void __51__CSCoverSheetViewController__updateHomeAffordance__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) offset];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) scale];
  double v7 = v6;
  id v8 = [*(id *)(*(void *)(a1 + 40) + 1392) homeAffordanceViewController];
  objc_msgSend(v8, "setHomeAffordanceOffset:scale:", v3, v5, v7);
}

uint64_t __51__CSCoverSheetViewController__updateHomeAffordance__block_invoke_559(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_updateControlCenterGrabber
{
  id v11 = [(CSCoverSheetViewController *)self activeAppearance];
  double v3 = [v11 componentForType:13 identifier:@"(active)"];
  double v4 = [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController teachableMomentsContainerView];
  double v5 = [v4 controlCenterGlyphView];
  double v6 = [v4 controlCenterGrabberView];
  [v3 alpha];
  double v8 = v7;
  objc_msgSend(v6, "setAlpha:");
  [v5 setAlpha:v8];
  double v9 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 scale];
  objc_msgSend(v9, "setControlCenterGrabberScale:");

  double v10 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 blurRadius];
  objc_msgSend(v10, "setControlCenterGrabberBlurRadius:");
}

- (void)_updateQuickActions
{
  id v12 = [(CSCoverSheetViewController *)self activeAppearance];
  double v3 = [v12 componentForType:14 identifier:@"(active)"];
  -[CSQuickActionsViewController setSuppressingVisibleChanges:](self->_quickActionsViewController, "setSuppressingVisibleChanges:", [v3 flag] != 0);
  double v4 = [(CSQuickActionsViewController *)self->_quickActionsViewController view];
  [v3 alpha];
  objc_msgSend(v4, "setAlpha:");

  double v5 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 offset];
  double v7 = v6;
  double v9 = v8;
  [v3 scale];
  objc_msgSend(v5, "setQuickActionsViewOffset:scale:", v7, v9, v10);

  id v11 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 blurRadius];
  objc_msgSend(v11, "setQuickActionsViewBlurRadius:");
}

- (BOOL)_quickActionsSupported
{
  return +[CSQuickActionsViewController deviceSupportsButtons];
}

- (void)_updateCaptureButtonRestriction
{
  id v11 = [(CSCoverSheetViewController *)self activeBehavior];
  int v3 = [v11 areRestrictedCapabilities:0x4000000];
  inhibitCaptureButtonActionAssertion = self->_inhibitCaptureButtonActionAssertion;
  if (v3 && !inhibitCaptureButtonActionAssertion)
  {
    double v5 = [(CSCoverSheetViewController *)self coverSheetContext];
    double v6 = [v5 captureButtonRestrictionController];
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = [v6 inhibitCaptureButtonActionAssertionWithReason:v8];
    double v10 = self->_inhibitCaptureButtonActionAssertion;
    self->_inhibitCaptureButtonActionAssertion = v9;

LABEL_8:
    goto LABEL_9;
  }
  if (!inhibitCaptureButtonActionAssertion) {
    LOBYTE(v3) = 1;
  }
  if ((v3 & 1) == 0)
  {
    [(BSInvalidatable *)inhibitCaptureButtonActionAssertion invalidate];
    double v5 = self->_inhibitCaptureButtonActionAssertion;
    self->_inhibitCaptureButtonActionAssertion = 0;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_updateContent
{
  id v10 = [(CSCoverSheetViewController *)self activeAppearance];
  int v3 = [v10 componentForType:15 identifier:@"(active)"];
  double v4 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 offset];
  double v6 = v5;
  double v8 = v7;
  [v3 scale];
  objc_msgSend(v4, "setContentViewOffset:scale:", v6, v8, v9);
}

- (void)_updateScrollingBehavior
{
  uint64_t hasContentAboveCoverSheet = self->_hasContentAboveCoverSheet;
  double v4 = [(CSCoverSheetViewController *)self localBehavior];
  uint64_t v5 = [v4 scrollingStrategy];

  if (v5 != hasContentAboveCoverSheet)
  {
    id v6 = [(CSCoverSheetViewController *)self localBehavior];
    [v6 setScrollingStrategy:hasContentAboveCoverSheet];
  }
}

- (void)_updateIdleTimerBehavior
{
  int v3 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  char v4 = [v3 isPresentingContent];

  uint64_t v5 = [(CSCoverSheetViewController *)self modalPresentationController];
  int v6 = [v5 isPresentingContent];

  double v7 = [(CSCoverSheetViewController *)self localBehavior];
  if (!self->_screenOnForLiftToWake || (v4 & 1) != 0 || v6)
  {
    if (self->_contentAboveIsSiriOrNotFullScreenOniPad) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }
  id v9 = v7;
  [v7 setIdleTimerDuration:v8];
}

- (void)_updateWallpaperEffectView
{
  id v22 = [(CSCoverSheetContextProviding *)self->_coverSheetContext wallpaperProvider];
  int v3 = [(CSCoverSheetViewController *)self activeAppearance];
  char v4 = [v3 componentForType:6 identifier:@"(active)"];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  if (v8 && ([v8 isHidden] & 1) == 0)
  {
    id v11 = [(CSCoverSheetViewController *)self coverSheetView];
    id v12 = [v11 wallpaperEffectView];

    if (!v12)
    {
      uint64_t v13 = [v22 createCoverSheetWallpaperView];
      double v14 = [(CSCoverSheetViewController *)self suspendWallpaperAnimationAssertion];
      [v14 invalidate];

      int v15 = [(CSCoverSheetViewController *)self coverSheetIdentifier];
      double v16 = [v22 suspendWallpaperAnimationForReason:v15];
      [(CSCoverSheetViewController *)self setSuspendWallpaperAnimationAssertion:v16];

      double v17 = [(CSCoverSheetViewController *)self coverSheetView];
      [v17 setWallpaperEffectView:v13];
    }
    if ([v8 shouldMatchBackgroundStyle])
    {
      double v18 = [(CSCoverSheetViewController *)self coverSheetView];
      id v19 = [v18 backgroundView];
      uint64_t v20 = [v19 backgroundStyle];
    }
    else
    {
      uint64_t v20 = 1;
    }
    id v10 = [(CSCoverSheetViewController *)self coverSheetView];
    double v21 = [v10 wallpaperEffectView];
    [v21 setBackgroundStyle:v20];
  }
  else
  {
    id v9 = [(CSCoverSheetViewController *)self suspendWallpaperAnimationAssertion];
    [v9 invalidate];

    [(CSCoverSheetViewController *)self setSuspendWallpaperAnimationAssertion:0];
    id v10 = [(CSCoverSheetViewController *)self coverSheetView];
    [v10 setWallpaperEffectView:0];
  }
}

- (void)_updateWallpaperFloatingLayerContainerView
{
  int v3 = [(CSCoverSheetViewController *)self activeAppearance];
  char v4 = [v3 componentForType:23 identifier:@"(active)"];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  if ([v8 shouldRenderInline]) {
    char v9 = [v8 shouldRenderForPosterSwitcher] ^ 1;
  }
  else {
    char v9 = 0;
  }
  int v10 = [(CSCoverSheetViewController *)self _appearState];
  floatingLayerView = self->_floatingLayerView;
  if (!v10 || (v9 & 1) != 0)
  {
    if (floatingLayerView)
    {
      [(BSInvalidatable *)floatingLayerView invalidate];
      [(BSInvalidatable *)self->_floatingLayerView removeFromSuperview];
      id v12 = self->_floatingLayerView;
      self->_floatingLayerView = 0;
    }
  }
  else if (!floatingLayerView)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__CSCoverSheetViewController__updateWallpaperFloatingLayerContainerView__block_invoke;
    v20[3] = &unk_1E6AD87F8;
    v20[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v20];
  }
  if (self->_floatingLayerView) {
    -[BSInvalidatable setShouldMatchWallpaperPosition:](self->_floatingLayerView, "setShouldMatchWallpaperPosition:", [v8 shouldMatchMove]);
  }
  uint64_t v13 = [(CSCoverSheetViewController *)self posterSwitcherViewController];
  objc_msgSend(v13, "setCoverSheetWallpaperFloatingLayerInlined:", objc_msgSend(v8, "shouldRenderInline"));

  double v14 = [(CSCoverSheetViewController *)self coverSheetView];
  [v8 offset];
  double v16 = v15;
  double v18 = v17;
  [v8 scale];
  objc_msgSend(v14, "setWallpaperFloatingLayerContainerViewOffset:scale:", v16, v18, v19);
  objc_msgSend(v14, "setWallpaperFloatingLayerPresentationLevel:", objc_msgSend(v8, "level"));
  objc_msgSend(v14, "setDateTimePresentationLevel:", objc_msgSend(v8, "level"));
}

void __72__CSCoverSheetViewController__updateWallpaperFloatingLayerContainerView__block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 1048) wallpaperProvider];
  double v2 = [*(id *)(a1 + 32) coverSheetView];
  int v3 = [v2 wallpaperFloatingLayerContainerView];

  char v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v10 createWallpaperFloatingViewForReason:v5 ignoreReplica:0];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1480);
  *(void *)(v7 + 1480) = v6;

  char v9 = *(void **)(*(void *)(a1 + 32) + 1480);
  [v3 bounds];
  objc_msgSend(v9, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 1480) setAutoresizingMask:18];
  [v3 addSubview:*(void *)(*(void *)(a1 + 32) + 1480)];
}

- (void)_updateBackgroundContentView
{
  id v12 = [(CSCoverSheetViewController *)self activeAppearance];
  int v3 = [v12 componentForType:24 identifier:@"(active)"];
  if (v3)
  {
    char v4 = [(CSCoverSheetViewController *)self coverSheetView];
    [v3 offset];
    double v6 = v5;
    double v8 = v7;
    [v3 scale];
    objc_msgSend(v4, "setBackgroundContentViewOffset:scale:", v6, v8, v9);

    id v10 = [(CSCoverSheetViewController *)self coverSheetView];
    [v3 alpha];
    objc_msgSend(v10, "setBackgroundContentViewAlpha:");

    id v11 = [(CSCoverSheetViewController *)self coverSheetView];
    objc_msgSend(v11, "setBackgroundContentPresentationLevel:", objc_msgSend(v3, "level"));
  }
}

- (void)_updateComplicationsContainerView
{
  id v13 = [(CSCoverSheetViewController *)self activeAppearance];
  int v3 = [v13 componentForType:20 identifier:@"(active)"];
  if (v3)
  {
    char v4 = [(CSCoverSheetViewController *)self complicationContainerViewController];

    if (v4)
    {
      double v5 = [v3 isHidden] ? 0.0 : 1.0;
      double v6 = [(CSCoverSheetViewController *)self complicationContainerViewController];
      double v7 = [v6 view];
      [v7 alpha];
      int IsZero = BSFloatIsZero();

      double v9 = [(CSCoverSheetViewController *)self complicationContainerViewController];
      id v10 = [v9 view];
      [v10 setAlpha:v5];

      if (IsZero != [v3 isHidden])
      {
        id v11 = [(CSCoverSheetViewController *)self mainPageContentViewController];
        id v12 = [v11 combinedListViewController];
        [v12 layoutListView];
      }
    }
  }
  [(CSCoverSheetViewController *)self _updatePosterSwitcherComplicationRowHidden];
}

- (void)_updateComplicationSidebar
{
  id v13 = [(CSCoverSheetViewController *)self activeAppearance];
  int v3 = [v13 componentForType:25 identifier:@"(active)"];
  if (v3)
  {
    char v4 = [(CSCoverSheetViewController *)self sidebarComplicationContainerViewController];

    if (v4)
    {
      [v3 alpha];
      double v6 = v5;
      double v7 = [(CSCoverSheetViewController *)self sidebarComplicationContainerViewController];
      double v8 = [v7 view];
      [v8 setAlpha:v6];
    }
  }
  BOOL v9 = [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController containsIconsInRow:0];
  id v10 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  [v10 updateContainsFirstRowIcons:v9];

  id v11 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  id v12 = [(CSWidgetGridViewController *)self->_sidebarComplicationContainerViewController view];
  [v12 frame];
  objc_msgSend(v11, "updateSidebarComplicationFrame:");
}

- (void)_updateTintingView
{
  int v3 = [(CSCoverSheetViewController *)self activeAppearance];
  id v8 = [v3 componentForType:7 property:1];

  char v4 = [(CSCoverSheetViewController *)self coverSheetView];
  double v5 = [v4 tintingView];

  if (v8 && ([v8 isHidden] & 1) == 0)
  {
    [v8 alpha];
    double v7 = v6;
    [v5 setHidden:0];
    [v5 setAlpha:v7];
  }
  else
  {
    [v5 setHidden:1];
  }
}

- (void)_updateStatusBarGradient
{
  int v3 = [(CSCoverSheetViewController *)self activeAppearance];
  char v4 = [v3 componentForType:16 property:1];
  uint64_t v5 = [v4 isHidden];

  id v6 = [(CSCoverSheetViewController *)self coverSheetView];
  [v6 updateStatusBarLegibilityForForceLegibilityGradientHidden:v5];
}

- (void)_updatePoseidon
{
  id v5 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonView];
  int v3 = [(CSCoverSheetViewController *)self activeAppearance];
  char v4 = [v3 componentForType:17 identifier:@"(active)"];
  [v4 alpha];
  objc_msgSend(v5, "setAlpha:");
}

- (void)_updateWhitePoint
{
  v26[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(CSCoverSheetViewController *)self previousAppearance];
  int v4 = [(CSCoverSheetViewController *)self _shouldReduceWhitePointForAppearance:v3];

  int v5 = [(CSCoverSheetViewController *)self _shouldReduceWhitePoint];
  if (v4 != v5)
  {
    int v6 = v5;
    double v7 = [(CSCoverSheetViewController *)self activeAppearance];
    id v8 = [v7 componentForType:18 property:1024];

    if (v8)
    {
      [v8 animationDuration];
      double v10 = v9;
    }
    else
    {
      double v10 = 0.0;
    }
    if (v6)
    {
      id v11 = [(CSCoverSheetViewController *)self _whitePointValues];
      if (v10 <= 0.0)
      {
        id v12 = [(CSCoverSheetViewController *)self view];
        double v18 = [v12 layer];
        double v19 = [(CSCoverSheetViewController *)self _whitePointReductionFilterFromValues:v11];
        v26[0] = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
        [v18 setFilters:v20];
      }
      else
      {
        id v12 = dispatch_group_create();
        id v13 = [(CSCoverSheetViewController *)self view];
        [(CSCoverSheetViewController *)self _animateView:v13 toWhitePointReduced:1 withDuration:v12 withDispatchGroup:v10];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__CSCoverSheetViewController__updateWhitePoint__block_invoke;
        block[3] = &unk_1E6AD88C0;
        void block[4] = self;
        id v25 = v11;
        dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      double v14 = [(CSCoverSheetViewController *)self view];
      double v15 = [v14 layer];
      double v16 = [v15 filters];

      if (!v16)
      {
LABEL_14:

        return;
      }
      if (v10 <= 0.0)
      {
        double v21 = [(CSCoverSheetViewController *)self view];
        id v22 = [v21 layer];
        [v22 setFilters:0];

        goto LABEL_14;
      }
      id v11 = dispatch_group_create();
      double v17 = [(CSCoverSheetViewController *)self view];
      [(CSCoverSheetViewController *)self _animateView:v17 toWhitePointReduced:0 withDuration:v11 withDispatchGroup:v10];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__CSCoverSheetViewController__updateWhitePoint__block_invoke_2;
      v23[3] = &unk_1E6AD87F8;
      void v23[4] = self;
      dispatch_group_notify(v11, MEMORY[0x1E4F14428], v23);
    }

    goto LABEL_14;
  }
}

void __47__CSCoverSheetViewController__updateWhitePoint__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _shouldReduceWhitePoint])
  {
    double v2 = [*(id *)(a1 + 32) view];
    int v3 = [v2 layer];
    int v4 = [*(id *)(a1 + 32) _whitePointReductionFilterFromValues:*(void *)(a1 + 40)];
    v6[0] = v4;
    int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v3 setFilters:v5];
  }
}

void __47__CSCoverSheetViewController__updateWhitePoint__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldReduceWhitePoint] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) view];
    double v2 = [v3 layer];
    [v2 setFilters:0];
  }
}

- (void)_updateFullBleedContent
{
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  [v3 flagForComponentType:26];
  int IsYes = BSSettingFlagIsYes();

  id v6 = [(CSCoverSheetViewController *)self coverSheetView];
  [v6 setClipsToBounds:IsYes ^ 1u];
  int v5 = [v6 window];
  [v5 setClipsToBounds:IsYes ^ 1u];
}

- (void)_updateDimmingLayer
{
  id v8 = [(CSCoverSheetViewController *)self activeAppearance];
  id v3 = [v8 componentForType:27 identifier:@"(active)"];
  if (v3)
  {
    int v4 = [(CSCoverSheetViewController *)self dateViewController];

    if (v4)
    {
      [v3 alpha];
      double v6 = v5;
      double v7 = [(CSCoverSheetViewController *)self dateViewController];
      [v7 setDimmingViewAlpha:v6];
    }
  }
}

- (void)_animateView:(id)a3 toWhitePointReduced:(BOOL)a4 withDuration:(double)a5 withDispatchGroup:(id)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  double v10 = [a3 layer];
  if (v10)
  {
    id v11 = [(CSCoverSheetViewController *)self _whitePointValues];
    [(CSCoverSheetViewController *)self _addWhitePointAnimationForKeyPath:@"filters.curves.inputRedValues" onLayer:v10 toValues:v11 withDuration:v9 dispatchGroup:a5];
    [(CSCoverSheetViewController *)self _addWhitePointAnimationForKeyPath:@"filters.curves.inputGreenValues" onLayer:v10 toValues:v11 withDuration:v9 dispatchGroup:a5];
    [(CSCoverSheetViewController *)self _addWhitePointAnimationForKeyPath:@"filters.curves.inputBlueValues" onLayer:v10 toValues:v11 withDuration:v9 dispatchGroup:a5];
    id v12 = [(CSCoverSheetViewController *)self view];
    id v13 = [v12 layer];
    double v14 = [(CSCoverSheetViewController *)self _whitePointReductionFilterFromValues:v11];
    v16[0] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v13 setFilters:v15];
  }
}

- (BOOL)_shouldReduceWhitePoint
{
  double v2 = self;
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  LOBYTE(v2) = [(CSCoverSheetViewController *)v2 _shouldReduceWhitePointForAppearance:v3];

  return (char)v2;
}

- (BOOL)_shouldReduceWhitePointForAppearance:(id)a3
{
  id v3 = [a3 componentForType:18 property:1];
  char v4 = [v3 isHidden] ^ 1;

  return v4;
}

- (id)_whitePointValues
{
  id v3 = [(CSCoverSheetViewController *)self activeAppearance];
  char v4 = [(CSCoverSheetViewController *)self _whitePointValuesForAppearance:v3];

  return v4;
}

- (id)_whitePointValuesForAppearance:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSCoverSheetViewController *)self _shouldReduceWhitePointForAppearance:v4];
  if (v5)
  {
    double v6 = [v4 componentForType:18 identifier:@"(active)"];
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      int v7 = 1;
    }
    else {
      int v7 = _UIAccessibilityReduceWhitePoint();
    }
    [v6 flag];
    uint64_t v8 = BSSettingFlagIsYes() | v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [(CSCoverSheetViewController *)self _filterValuesForWhitePointReduced:v5 lighterReduction:v8];

  return v9;
}

- (id)_filterValuesForWhitePointReduced:(BOOL)a3 lighterReduction:(BOOL)a4
{
  void v22[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    BOOL v5 = [(CSLockScreenSettings *)self->_prototypeSettings dashBoardRemoteContentSettings];
    double v6 = v5;
    int v7 = NSNumber;
    if (v4)
    {
      [v5 lighterBottomLuminanceValue];
      uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
      v22[0] = v8;
      id v9 = NSNumber;
      [v6 lighterLowerLuminanceValue];
      double v10 = objc_msgSend(v9, "numberWithDouble:");
      v22[1] = v10;
      id v11 = NSNumber;
      [v6 lighterUpperLuminanceValue];
      id v12 = objc_msgSend(v11, "numberWithDouble:");
      v22[2] = v12;
      id v13 = NSNumber;
      [v6 lighterTopLuminanceValue];
      double v14 = objc_msgSend(v13, "numberWithDouble:");
      v22[3] = v14;
      double v15 = v22;
    }
    else
    {
      [v5 bottomLuminanceValue];
      uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
      v21[0] = v8;
      double v17 = NSNumber;
      [v6 lowerLuminanceValue];
      double v10 = objc_msgSend(v17, "numberWithDouble:");
      v21[1] = v10;
      double v18 = NSNumber;
      [v6 upperLuminanceValue];
      id v12 = objc_msgSend(v18, "numberWithDouble:");
      v21[2] = v12;
      double v19 = NSNumber;
      [v6 topLuminanceValue];
      double v14 = objc_msgSend(v19, "numberWithDouble:");
      v21[3] = v14;
      double v15 = v21;
    }
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  }
  else
  {
    double v16 = &unk_1F306B248;
  }

  return v16;
}

- (void)_addWhitePointAnimationForKeyPath:(id)a3 onLayer:(id)a4 toValues:(id)a5 withDuration:(double)a6 dispatchGroup:(id)a7
{
  id v19 = a3;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  double v15 = [v14 presentationLayer];
  double v16 = [v15 valueForKeyPath:v19];

  if (v12) {
    dispatch_group_enter(v12);
  }
  if (!v16) {
    double v16 = &unk_1F306B260;
  }
  double v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v19];
  [v17 setDuration:a6];
  double v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v17 setTimingFunction:v18];

  [v17 setFromValue:v16];
  [v17 setToValue:v13];

  [v17 setValue:v12 forKey:@"CSCoverSheetWhitePointDispatchGroup"];
  [v17 setDelegate:self];
  [v14 removeAnimationForKey:v19];
  [v14 addAnimation:v17 forKey:v19];
}

- (id)_whitePointReductionFilterFromValues:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F39BC0];
  id v4 = a3;
  id v5 = [v3 alloc];
  double v6 = (void *)[v5 initWithType:*MEMORY[0x1E4F3A068]];
  [v6 setValue:v4 forKey:@"inputRedValues"];
  [v6 setValue:v4 forKey:@"inputGreenValues"];
  [v6 setValue:v4 forKey:@"inputBlueValues"];

  return v6;
}

- (void)_removeReduceWhitePointAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
}

- (void)_updateIdleTimerForTransitionProgress:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = [(CSCoverSheetViewController *)self _appearState];
  BOOL screenOffMode = self->_screenOffMode;
  int v8 = __sb__runningInSpringBoard();
  char v9 = v8;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      double v10 = [(CSLockScreenSettings *)self->_prototypeSettings idleTimerSettings];
      [v10 unlockSlideForIdleTimerDisabledPercentage];
      goto LABEL_6;
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom] != 1) {
      goto LABEL_3;
    }
  }
  double v10 = [(CSLockScreenSettings *)self->_prototypeSettings idleTimerSettings];
  [v10 unlockSlideForIdleTimerDisabledPercentageIPad];
LABEL_6:
  double v12 = v11;

  if ((v9 & 1) == 0) {
  id v13 = SBLogDashBoard();
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    double v17 = a3;
    __int16 v18 = 2048;
    double v19 = v12;
    _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_INFO, "transitionProgress: %f, percentThreshold: %f", (uint8_t *)&v16, 0x16u);
  }

  if (!screenOffMode && (v6 - 3) >= 0xFFFFFFFE && v12 < a3 && !self->_transitionDisabledIdleTimer)
  {
    id v14 = +[CSAction actionWithType:4];
    [(CSCoverSheetViewController *)self handleAction:v14 fromSender:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerController);
    [WeakRetained addIdleTimerDisabledAssertionReason:@"CSCoverSheetTransitioningReason"];

    self->_transitionDisabledIdleTimer = 1;
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v4 = objc_msgSend(a3, "valueForKey:", @"CSCoverSheetWhitePointDispatchGroup", a4);
  if (v4)
  {
    id v5 = v4;
    dispatch_group_leave(v4);
    id v4 = v5;
  }
}

- (void)_updateLegibilitySettings
{
  id v5 = [(CSAppearance *)self->_activeAppearance legibilitySettings];
  id v3 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 setLegibilitySettings:v5];

  [(SBFLockScreenDateViewController *)self->_dateViewController setLegibilitySettings:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);
  [WeakRetained setLegibilitySettings:v5];
}

- (void)updateStatusBarForLockScreenTeardown
{
  id v3 = [(id)*MEMORY[0x1E4F43630] statusBar];
  [v3 setMode:0];

  [(UIStatusBar *)self->_fakeStatusBar setMode:0];
  id v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
  [v6 destroyFakeStatusBar:self->_fakeStatusBar];
  fakeStatusBar = self->_fakeStatusBar;
  self->_fakeStatusBar = 0;

  id v5 = [(CSCoverSheetViewController *)self coverSheetView];
  [v5 setFakeStatusBar:0];

  self->_statusBarInLockdownForTeardown = 1;
  [(CSCoverSheetViewController *)self _invalidateStatusBarAssertions];
}

- (void)updateStatusBarForLockScreenComeback
{
  id v3 = [(id)*MEMORY[0x1E4F43630] statusBar];
  [v3 setMode:2];

  fakeStatusBar = self->_fakeStatusBar;
  if (!fakeStatusBar)
  {
    id v5 = [(CSCoverSheetViewController *)self _createFakeStatusBar];
    id v6 = self->_fakeStatusBar;
    self->_fakeStatusBar = v5;

    fakeStatusBar = self->_fakeStatusBar;
  }
  [(UIStatusBar *)fakeStatusBar setMode:2];
  if (self->_wantsStatusBarLockItemDisabled)
  {
    int v7 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
    [v7 setStatusBarPart:1 hidden:1 animationDuration:0.0];
  }
  self->_statusBarInLockdownForTeardown = 0;
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"DashBoard Come Back"];
  id v8 = [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController view];
  [v8 setNeedsLayout];
}

- (void)_invalidateStatusBarAssertions
{
  id v2 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
  [v2 setStatusBarHidden:0 forReason:@"CSCoverSheetFakeStatusBar"];
  [v2 clearStatusBarParameters];
}

- (BOOL)_isFakeStatusBarEnabled
{
  id v2 = [(CSCoverSheetViewController *)self coverSheetView];
  id v3 = [v2 fakeStatusBar];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_setFakeStatusBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = [(CSCoverSheetViewController *)self coverSheetView];
  id v5 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
  uint64_t v6 = [v13 fakeStatusBar];
  int v7 = (void *)v6;
  int v8 = !v3;
  if (v6) {
    int v9 = 1;
  }
  else {
    int v9 = !v3;
  }
  if ((v9 & 1) == 0)
  {
    double v10 = [(CSCoverSheetViewController *)self coverSheetView];
    double v11 = v10;
    fakeStatusBar = self->_fakeStatusBar;
    goto LABEL_10;
  }
  if (!v6) {
    int v8 = 0;
  }
  if (v8 == 1)
  {
    double v10 = [(CSCoverSheetViewController *)self coverSheetView];
    double v11 = v10;
    fakeStatusBar = 0;
LABEL_10:
    [v10 setFakeStatusBar:fakeStatusBar];

    [v5 setStatusBarHidden:v9 ^ 1u forReason:@"CSCoverSheetFakeStatusBar"];
  }
}

- (id)_createFakeStatusBar
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;

  uint64_t v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
  int v7 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] statusBarHeight];
  int v9 = objc_msgSend(v6, "createFakeStatusBarWithReason:withFrame:", @"SBDashBoardFakeStatusBar", 0.0, 0.0, v5, v8);

  uint64_t v20 = &unk_1F306BE78;
  double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[CSCoverSheetViewController shouldShowLockStatusBarTime](self, "shouldShowLockStatusBarTime"));
  v21[0] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v9 setEnabledCenterItems:v11 duration:0.0];

  objc_msgSend(v9, "setOrientation:", objc_msgSend(*v7, "activeInterfaceOrientation"));
  double v12 = [(CSCoverSheetViewController *)self _fakeStatusBarSettings];
  [v9 setStyleRequest:v12];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = objc_alloc(MEMORY[0x1E4FA9440]);
    id v14 = [MEMORY[0x1E4FA94C0] disabledEntry];
    id v15 = (id)[v13 initWithEntry:v14 forKey:*MEMORY[0x1E4FA97D0]];

    id v16 = [v9 statusBar];
    [v16 setOverlayData:v15];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F43318]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F43320]);
    [v16 setEnabled:0];
    double v17 = [MEMORY[0x1E4F43320] disabledEntry];
    [v15 setSensorActivityEntry:v17];

    __int16 v18 = [v9 statusBar];
    [v18 setOverlayData:v15];
  }

  return v9;
}

- (id)_fakeStatusBarSettings
{
  BOOL v3 = [(CSCoverSheetContextProviding *)self->_coverSheetContext statusBarController];
  int64_t v4 = [(CSCoverSheetViewController *)self statusBarStyle];
  double v5 = [(CSCoverSheetViewControllerBase *)self legibilitySettings];
  uint64_t v6 = [v3 effectiveStatusBarStyleRequestForAlpha:0 style:v4 legibilitySettings:v5];

  return v6;
}

- (void)_createStatusBarBackgroundViewIfNeeded
{
  if (!self->_statusBarBackgroundView)
  {
    [MEMORY[0x1E4F42E28] heightForStyle:300 orientation:1];
    if (v3 <= 20.0) {
      uint64_t v4 = 6;
    }
    else {
      uint64_t v4 = 5;
    }
    double v5 = (UIView *)[objc_alloc(MEMORY[0x1E4FA5F00]) initWithRecipe:v4];
    statusBarBackgroundView = self->_statusBarBackgroundView;
    self->_statusBarBackgroundView = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = __68__CSCoverSheetViewController__createStatusBarBackgroundViewIfNeeded__block_invoke;
    v7[3] = &unk_1E6AD87F8;
    void v7[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
  }
}

uint64_t __68__CSCoverSheetViewController__createStatusBarBackgroundViewIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coverSheetView];
  [v2 setStatusBarBackgroundView:*(void *)(*(void *)(a1 + 32) + 2104)];

  [*(id *)(*(void *)(a1 + 32) + 2104) setAlpha:0.0];
  double v3 = *(void **)(*(void *)(a1 + 32) + 2104);

  return [v3 layoutIfNeeded];
}

- (void)_setupQuickNoteGestureRecognizer
{
  double v3 = [(CSCoverSheetViewController *)self activeBehavior];
  char v4 = [v3 areRestrictedCapabilities:0x2000];

  quickNoteGestureRecognizer = self->_quickNoteGestureRecognizer;
  if (v4)
  {
    if (!quickNoteGestureRecognizer) {
      return;
    }
    self->_quickNoteGestureRecognizer = 0;
  }
  else
  {
    if (quickNoteGestureRecognizer)
    {
      uint64_t v6 = [(CSCoverSheetViewController *)self coverSheetView];
      int v7 = [v6 quickNoteGestureRecognizer];

      if (v7) {
        return;
      }
      double v8 = self->_quickNoteGestureRecognizer;
    }
    else
    {
      double v8 = 0;
    }
    [(UITapGestureRecognizer *)v8 setDelegate:0];
    int v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleQuickNoteLaunch_];
    double v10 = self->_quickNoteGestureRecognizer;
    self->_quickNoteGestureRecognizer = v9;

    [(UITapGestureRecognizer *)self->_quickNoteGestureRecognizer setDelegate:self];
    int v11 = [(SBLockScreenDefaults *)self->_lockScreenDefaults showQuickNoteFingerGestureRecognizer];
    double v12 = self->_quickNoteGestureRecognizer;
    if (v11)
    {
      [(UITapGestureRecognizer *)v12 setNumberOfTouchesRequired:2];
      [(UITapGestureRecognizer *)self->_quickNoteGestureRecognizer setNumberOfTapsRequired:2];
    }
    else
    {
      [(UITapGestureRecognizer *)v12 setAllowedTouchTypes:&unk_1F306B278];
      [(UITapGestureRecognizer *)self->_quickNoteGestureRecognizer setAllowableMovement:10.0];
    }
  }
  id v13 = [(CSCoverSheetViewController *)self coverSheetView];
  [v13 setQuickNoteGestureRecognizer:self->_quickNoteGestureRecognizer];
}

- (void)_handleQuickNoteLaunch:(id)a3
{
  char v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "QuickNote gesture recognized.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationLauncher);
  [WeakRetained launchQuickNote];
}

- (void)_setupPosterSwitcherGestureRecognizer
{
  double v3 = [(CSCoverSheetViewController *)self activeBehavior];
  char v4 = [v3 areRestrictedCapabilities:0x800000];

  posterSwitcherGestureRecognizer = self->_posterSwitcherGestureRecognizer;
  if ((v4 & 1) == 0)
  {
    if (posterSwitcherGestureRecognizer)
    {
      double v10 = [(CSCoverSheetViewController *)self coverSheetView];
      int v11 = [v10 dateViewGestureRecognizer];

      if (v11)
      {
LABEL_13:
        if (self->_posterSwitcherFeedbackGenerator) {
          return;
        }
        double v8 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42C10]);
        posterSwitcherFeedbackGenerator = self->_posterSwitcherFeedbackGenerator;
        self->_posterSwitcherFeedbackGenerator = v8;
        goto LABEL_16;
      }
      double v12 = self->_posterSwitcherGestureRecognizer;
    }
    else
    {
      double v12 = 0;
    }
    [(UILongPressGestureRecognizer *)v12 setDelegate:0];
    id v13 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handlePosterSwitcherActivation_];
    id v14 = self->_posterSwitcherGestureRecognizer;
    self->_posterSwitcherGestureRecognizer = v13;

    [(UILongPressGestureRecognizer *)self->_posterSwitcherGestureRecognizer setMinimumPressDuration:0.3];
    [(UILongPressGestureRecognizer *)self->_posterSwitcherGestureRecognizer setDelegate:self];
    id v15 = [(CSCoverSheetViewController *)self coverSheetView];
    [v15 setDateViewGestureRecognizer:self->_posterSwitcherGestureRecognizer];

    goto LABEL_13;
  }
  if (posterSwitcherGestureRecognizer)
  {
    self->_posterSwitcherGestureRecognizer = 0;

    uint64_t v6 = [(CSCoverSheetViewController *)self coverSheetView];
    [v6 setDateViewGestureRecognizer:self->_posterSwitcherGestureRecognizer];
  }
  int v7 = self->_posterSwitcherFeedbackGenerator;
  if (v7)
  {
    double v8 = (UINotificationFeedbackGenerator *)[(UINotificationFeedbackGenerator *)v7 isActive];
    if (v8) {
      double v8 = (UINotificationFeedbackGenerator *)[(UINotificationFeedbackGenerator *)self->_posterSwitcherFeedbackGenerator deactivate];
    }
    posterSwitcherFeedbackGenerator = self->_posterSwitcherFeedbackGenerator;
    self->_posterSwitcherFeedbackGenerator = 0;
LABEL_16:
    MEMORY[0x1F41817F8](v8, posterSwitcherFeedbackGenerator);
  }
}

- (void)_handlePosterSwitcherActivation:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    double v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Poster Switcher gesture recognized.", buf, 2u);
    }

    uint64_t v6 = [v4 touches];
    int v7 = (void *)[v6 copy];

    posterSwitcherActivationManager = self->_posterSwitcherActivationManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__CSCoverSheetViewController__handlePosterSwitcherActivation___block_invoke;
    v11[3] = &unk_1E6AD88C0;
    v11[4] = self;
    id v12 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__CSCoverSheetViewController__handlePosterSwitcherActivation___block_invoke_2;
    v10[3] = &unk_1E6AD92A0;
    void v10[4] = self;
    id v9 = v7;
    [(CSPosterSwitcherActivationManager *)posterSwitcherActivationManager activateWithHandler:v11 onFailure:v10];
  }
}

void __62__CSCoverSheetViewController__handlePosterSwitcherActivation___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1048) wallpaperSnapshotUpdater];
  [v4 updatePosterSwitcherSnapshots];
  id v2 = [*(id *)(a1 + 32) coverSheetView];
  double v3 = [v2 scrollView];
  [v3 _forcePanGestureToEndImmediately];

  [*(id *)(a1 + 32) _prepareForPosterSwitcherPresentation];
  [*(id *)(a1 + 32) _updatePosterSwitcherPresentationWithProgress:1.0];
  [*(id *)(a1 + 32) _cleanupPosterSwitcherPresentationForCompleted:1 withActivatingTouches:*(void *)(a1 + 40)];
}

void __62__CSCoverSheetViewController__handlePosterSwitcherActivation___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = SBLogDashBoard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Failed to activate Poster Switcher for reason: %{public}@.", buf, 0xCu);
  }

  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(void **)(v7 + 1472);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __62__CSCoverSheetViewController__handlePosterSwitcherActivation___block_invoke_622;
    v9[3] = &unk_1E6AD8A40;
    void v9[4] = v7;
    [v8 activateWithCompletionBlock:v9];
  }
}

uint64_t __62__CSCoverSheetViewController__handlePosterSwitcherActivation___block_invoke_622(uint64_t a1, char a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 1472) notificationOccurred:2];
  }
  double v3 = *(void **)(*(void *)(a1 + 32) + 1472);

  return [v3 deactivate];
}

- (BOOL)_isPresentingPosterSwitcher
{
  id v2 = [(CSCoverSheetViewController *)self posterSwitcherViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_prepareForPosterSwitcherPresentation
{
  BOOL v3 = [(CSCoverSheetViewController *)self currentTransitionSource];
  char v4 = [v3 isTransitioning];

  if ((v4 & 1) == 0)
  {
    id v5 = [(CSCoverSheetViewController *)self coverSheetView];
    [v5 addContentView];

    uint64_t v6 = objc_alloc_init(CSPosterSwitcherTransitionSource);
    [(CSPosterSwitcherTransitionSource *)v6 setTransitioningDelegate:self];
    [(CSCoverSheetViewController *)self setPosterSwitcherTransitionSource:v6];
    [(CSPosterSwitcherTransitionSource *)v6 prepareForPresentation];
  }
}

- (void)_updatePosterSwitcherPresentationWithProgress:(double)a3
{
  id v4 = [(CSCoverSheetViewController *)self posterSwitcherTransitionSource];
  if ([v4 isTransitioning]) {
    [v4 updatePresentationWithProgress:a3];
  }
}

- (void)_cleanupPosterSwitcherPresentationForCompleted:(BOOL)a3 withActivatingTouches:(id)a4
{
  BOOL v4 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(CSCoverSheetViewController *)self posterSwitcherTransitionSource];
  double v8 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
  int v9 = [v8 isAuthenticated];

  if ([v7 isTransitioning])
  {
    double v10 = 0.0;
    if (v4) {
      double v10 = 1.0;
    }
    [v7 updatePresentationWithProgress:v10];
    id v11 = SBLogDashBoard();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if ((v4 & v9) != 0)
    {
      if (v12)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Poster Switcher gesture completed. Presenting Poster Switcher", (uint8_t *)&buf, 2u);
      }

      id v13 = objc_alloc_init(CSDismissableModalViewController);
      id v14 = [(CSCoverSheetViewController *)self activeAppearance];
      id v15 = [v14 componentForType:23 identifier:@"(active)"];
      uint64_t v16 = objc_opt_class();
      id v17 = v15;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          __int16 v18 = v17;
        }
        else {
          __int16 v18 = 0;
        }
      }
      else
      {
        __int16 v18 = 0;
      }
      id v20 = v18;

      double v21 = objc_alloc_init(CSPosterSwitcherViewController);
      [(CSPosterSwitcherViewController *)v21 setActivatingTouches:v6];
      id v22 = [(CSCoverSheetViewController *)self view];
      double v23 = [v22 window];
      [(CSPosterSwitcherViewController *)v21 setTargetWindow:v23];

      double v24 = [(CSCoverSheetViewController *)self coverSheetView];
      id v25 = [v24 wallpaperEffectView];
      [(CSPosterSwitcherViewController *)v21 setCoverSheetWallpaperView:v25];

      id v26 = [(CSCoverSheetViewController *)self coverSheetView];
      BOOL v27 = [v26 wallpaperFloatingLayerContainerView];
      [(CSPosterSwitcherViewController *)v21 setCoverSheetFloatingView:v27];

      -[CSPosterSwitcherViewController setCoverSheetWallpaperFloatingLayerInlined:](v21, "setCoverSheetWallpaperFloatingLayerInlined:", [v20 shouldRenderInline]);
      id v28 = [(CSCoverSheetViewController *)self effectiveVibrancyConfiguration];
      [(CSPosterSwitcherViewController *)v21 setVibrancyConfiguration:v28];

      [(CSCoverSheetViewController *)self addApplicationHoster:v21];
      [(CSCoverSheetViewController *)self setPosterSwitcherViewController:v21];
      [(CSCoverSheetViewController *)self _updatePosterSwitcherBackgroundView];
      [(CSCoverSheetViewController *)self _updatePosterSwitcherComplicationRowHidden];
      objc_initWeak(&buf, self);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __99__CSCoverSheetViewController__cleanupPosterSwitcherPresentationForCompleted_withActivatingTouches___block_invoke;
      v46[3] = &unk_1E6AD92C8;
      objc_copyWeak(&v47, &buf);
      uint64_t v39 = v20;
      id v40 = v14;
      [(CSPosterSwitcherViewController *)v21 setInvalidationHandler:v46];
      uint64_t v37 = v13;
      id v38 = v6;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      int v29 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v43 != v31) {
              objc_enumerationMutation(v29);
            }
            id v33 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v33 coverSheetViewControllerWillPresentPosterSwitcher:self];
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v30);
      }

      id v6 = v38;
      double v19 = v37;
      int v34 = [(CSCoverSheetContextProviding *)self->_coverSheetContext traitsAwareAppHosting];
      [(CSPosterSwitcherViewController *)v21 setAppHostConfiguring:v34];

      [(CSDismissableModalViewController *)v37 setDelegate:v21];
      [(CSPresentationViewController *)v37 presentContentViewController:v21 animated:0];
      [(CSCoverSheetViewController *)self _presentModalViewController:v37 animated:0 completion:0];
      uint64_t v35 = SBLogDashBoard();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v41 = 0;
        _os_log_impl(&dword_1D839D000, v35, OS_LOG_TYPE_DEFAULT, "[ZStack-Participant] adding poster switcher home affordance", v41, 2u);
      }

      double v36 = [(CSCoverSheetContextProviding *)self->_coverSheetContext modalHomeAffordanceController];
      [(CSDismissableModalViewController *)v37 setHomeAffordanceController:v36];

      objc_destroyWeak(&v47);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (v12)
      {
        LODWORD(buf) = 67109376;
        HIDWORD(buf) = v4;
        __int16 v49 = 1024;
        int v50 = v9;
        _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Poster Switcher gesture ended in failure. Not presenting Poster Switcher. Interaction completed: %{BOOL}d. Device authenticated: %{BOOL}d", (uint8_t *)&buf, 0xEu);
      }

      double v19 = [(CSCoverSheetViewController *)self coverSheetView];
      [v19 removeContentView];
    }

    [v7 cleanupPresentation];
    [(CSCoverSheetViewController *)self setPosterSwitcherTransitionSource:0];
  }
}

void __99__CSCoverSheetViewController__cleanupPosterSwitcherPresentationForCompleted_withActivatingTouches___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPosterSwitcherViewController:0];
}

- (void)setPosterSwitcherTransitionSource:(id)a3
{
  p_posterSwitcherTransitionSource = &self->_posterSwitcherTransitionSource;
  id v6 = (CSPosterSwitcherTransitionSource *)a3;
  if (*p_posterSwitcherTransitionSource != v6)
  {
    -[CSCoverSheetViewController unregisterExternalAppearanceProvider:](self, "unregisterExternalAppearanceProvider:");
    [(CSCoverSheetViewController *)self unregisterExternalBehaviorProvider:*p_posterSwitcherTransitionSource];
    objc_storeStrong((id *)&self->_posterSwitcherTransitionSource, a3);
    if (*p_posterSwitcherTransitionSource)
    {
      -[CSCoverSheetViewController registerExternalAppearanceProvider:](self, "registerExternalAppearanceProvider:");
      [(CSCoverSheetViewController *)self registerExternalBehaviorProvider:*p_posterSwitcherTransitionSource];
    }
  }
}

- (void)setPosterSwitcherViewController:(id)a3
{
  id v5 = (CSPosterSwitcherViewController *)a3;
  p_posterSwitcherViewController = &self->_posterSwitcherViewController;
  if (self->_posterSwitcherViewController != v5)
  {
    int v9 = v5;
    objc_storeStrong((id *)p_posterSwitcherViewController, a3);
    BOOL v7 = [(CSCoverSheetViewController *)self _isPresentingPosterSwitcher];
    self->_preventStatusBarDateTimeUpdates = v7;
    if (!v7)
    {
      double v8 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
      [v8 settleContentOffset];
    }
    p_posterSwitcherViewController = (CSPosterSwitcherViewController **)[(CSCoverSheetViewController *)self _updateStatusBarBackground];
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](p_posterSwitcherViewController, v5);
}

- (void)_updatePosterSwitcherBackgroundView
{
  id v8 = [(CSCoverSheetViewController *)self posterSwitcherViewController];
  if (v8)
  {
    BOOL v3 = [(CSCoverSheetViewController *)self coverSheetView];
    BOOL v4 = [v3 backgroundContentView];
    uint64_t v5 = [v3 backgroundView];
    id v6 = (void *)v5;
    if (v4) {
      BOOL v7 = v4;
    }
    else {
      BOOL v7 = (void *)v5;
    }
    [v8 setCoverSheetBackgroundView:v7];
  }
}

- (void)_updatePosterSwitcherComplicationRowHidden
{
  BOOL v3 = [(CSCoverSheetViewController *)self posterSwitcherViewController];
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = [(CSCoverSheetViewController *)self localAppearance];
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) < 2)
    {
      uint64_t v7 = 25;
    }
    else
    {
      uint64_t v7 = 20;
    }
    id v8 = [v4 componentForType:v7 property:1];
    objc_msgSend(v9, "setCoverSheetComplicationRowHidden:", objc_msgSend(v8, "isHidden"));

    BOOL v3 = v9;
  }
}

- (void)_dismissPosterSwitcherViewController
{
  BOOL v3 = [(CSCoverSheetViewController *)self coverSheetView];
  [v3 removeContentView];

  id v5 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  BOOL v4 = [(CSCoverSheetViewController *)self _presentedModalViewControllerWithIdentifier:v5];
  [(CSCoverSheetViewController *)self _dismissModalViewController:v4 animated:0 completion:0];
}

- (void)posterSwitcherActivationManager:(id)a3 didChangeToCoachingText:(id)a4
{
  id v5 = (NSString *)objc_msgSend(a4, "copy", a3);
  currentCoachingString = self->_currentCoachingString;
  self->_currentCoachingString = v5;

  [(CSCoverSheetViewController *)self _updateCoachingStringWithTimeout:2.5];
}

- (BOOL)userPresenceDetectedSinceWake
{
  BOOL v3 = [(CSUserPresenceMonitor *)self->_userPresenceMonitor isUserPresenceDetectionSupported];
  if (v3)
  {
    userPresenceMonitor = self->_userPresenceMonitor;
    LOBYTE(v3) = [(CSUserPresenceMonitor *)userPresenceMonitor userPresenceDetectedSinceWake];
  }
  return v3;
}

- (id)posterSwitcherPresentationStatus
{
  if ([(CSCoverSheetViewController *)self _isPresentingPosterSwitcher])
  {
    uint64_t v3 = 0;
    uint64_t v4 = 2;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F74230] sharedConnection];
    int v6 = [v5 isWallpaperModificationAllowed];

    if (v6)
    {
      uint64_t v7 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
      char v8 = [v7 hasUserInteraction];

      if (v8)
      {
        uint64_t v4 = 0;
        uint64_t v3 = 1;
      }
      else if ([(CSCoverSheetViewController *)self isAuthenticated])
      {
        id v11 = [(CSCoverSheetContextProviding *)self->_coverSheetContext proximitySensorProvider];
        char v12 = [v11 isObjectInProximity];

        if (v12)
        {
          uint64_t v4 = 0;
          uint64_t v3 = 3;
        }
        else
        {
          id v13 = [MEMORY[0x1E4F42948] currentDevice];
          uint64_t v14 = [v13 userInterfaceIdiom];

          if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1
            || (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) >= 2)
          {
            uint64_t v3 = 0;
            uint64_t v4 = 1;
          }
          else
          {
            uint64_t v4 = 0;
            uint64_t v3 = 4;
          }
        }
      }
      else
      {
        uint64_t v4 = 0;
        uint64_t v3 = 2;
      }
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v3 = 5;
    }
  }
  id v9 = [[CSPosterSwitcherPresentationStatus alloc] initWithState:v4 notReadyReason:v3];

  return v9;
}

- (void)_complicationSelected:(id)a3
{
  dateViewController = self->_dateViewController;
  id v5 = a3;
  int v6 = [(SBFLockScreenDateViewController *)dateViewController inlineComplicationViewController];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [v10 handleComplicationSelectionGesture:v5];
  id v11 = [(CSCoverSheetViewController *)self complicationContainerViewController];
  [v11 handleComplicationSelectionGesture:v5];

  id v12 = [(CSCoverSheetViewController *)self sidebarComplicationContainerViewController];
  [v12 handleComplicationSelectionGesture:v5];
}

- (void)_setupComplicationSelectionGestureRecognizer
{
  if (self->_complicationSelectionRecognizer)
  {
    uint64_t v3 = [(CSCoverSheetViewController *)self coverSheetView];
    uint64_t v4 = [v3 complicationGestureRecognizer];

    if (v4) {
      return;
    }
    complicationSelectionRecognizer = self->_complicationSelectionRecognizer;
  }
  else
  {
    complicationSelectionRecognizer = 0;
  }
  [(UILongPressGestureRecognizer *)complicationSelectionRecognizer setDelegate:0];
  int v6 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__complicationSelected_];
  uint64_t v7 = self->_complicationSelectionRecognizer;
  self->_complicationSelectionRecognizer = v6;

  [(UILongPressGestureRecognizer *)self->_complicationSelectionRecognizer setMinimumPressDuration:0.01];
  [(UILongPressGestureRecognizer *)self->_complicationSelectionRecognizer setDelegate:self];
  id v8 = [(CSCoverSheetViewController *)self coverSheetView];
  [v8 setComplicationGestureRecognizer:self->_complicationSelectionRecognizer];
}

- (id)_averageLockScreenWallpaperColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
  uint64_t v3 = [WeakRetained averageColorForCurrentWallpaper];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  int v6 = v5;

  return v6;
}

- (BOOL)_wallpaperGestureShouldRequireUserPresence
{
  return 1;
}

- (void)_setupWallpaperGesture
{
  if (![(CSCoverSheetViewController *)self _shouldSetUpWallpaperGesture]) {
    return;
  }
  [(UIGestureRecognizer *)self->_wallpaperGestureRecognizer setDelegate:self];
  uint64_t v3 = [(CSCoverSheetViewController *)self irisWallpaperPlayer];

  if (v3)
  {
    uint64_t v4 = [(CSCoverSheetViewController *)self activeBehavior];
    int v5 = [v4 areRestrictedCapabilities:256];

    if (v5)
    {
      int v6 = [(CSCoverSheetViewController *)self coverSheetView];
      [v6 setWallpaperGestureRecognizer:0];

LABEL_10:
      userPresenceMonitor = self->_userPresenceMonitor;
      [(CSUserPresenceMonitor *)userPresenceMonitor disableDetectionForReason:@"Wallpaper"];
      return;
    }
  }
  uint64_t v7 = [(CSCoverSheetViewController *)self coverSheetView];
  [v7 setWallpaperGestureRecognizer:self->_wallpaperGestureRecognizer];

  if (![(CSCoverSheetViewController *)self _wallpaperGestureShouldRequireUserPresence])goto LABEL_10; {
  id v8 = self->_userPresenceMonitor;
  }

  [(CSUserPresenceMonitor *)v8 enableDetectionForReason:@"Wallpaper"];
}

- (BOOL)_shouldSetUpWallpaperGesture
{
  return 1;
}

- (void)_updateUIForPlaying:(BOOL)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__actuallyUpdateUIForIrisNotPlaying object:0];
  if (v4)
  {
    [(CSCoverSheetViewController *)self _actuallyUpdateUIForIrisPlaying:v5];
  }
  else if (!v5)
  {
    v8[0] = *MEMORY[0x1E4F1C4B0];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(CSCoverSheetViewController *)self performSelector:sel__actuallyUpdateUIForIrisNotPlaying withObject:0 afterDelay:v7 inModes:0.3];
  }
}

- (void)_actuallyUpdateUIForIrisPlaying
{
}

- (void)_actuallyUpdateUIForIrisNotPlaying
{
}

- (void)_actuallyUpdateUIForIrisPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CSCoverSheetViewController *)self irisBehavior];
  int v6 = v5;
  if (v3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  [v5 setScrollingStrategy:v7];

  id v8 = NSString;
  NSStringFromBOOL();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 stringWithFormat:@"irisPlaying-%@", v10];
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:v9];
}

- (void)startLockScreenFadeInAnimationForSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  *(void *)&v19[5] = *MEMORY[0x1E4F143B8];
  self->_wakeSource = a3;
  BOOL v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromUnlockSource();
    int v18 = 138543362;
    *(void *)double v19 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "wake source: %{public}@", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v7 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  [v7 setUnlockSource:v3];

  if (SBUIUnlockSourceIsUserAction()) {
    [(SBUIPhoneUnlockWithWatchController *)self->_phoneUnlockWithWatchController setWakeSourceIsUserAction:1];
  }
  [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"StartFadeInAnimation"];
  id v8 = [(CSCoverSheetContextProviding *)self->_coverSheetContext screenStateProvider];
  uint64_t v9 = [v8 screenIsOn];

  id v10 = SBLogDashBoard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromBOOL();
    int v18 = 138543362;
    *(void *)double v19 = v11;
    _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "isScreenOn: %{public}@", (uint8_t *)&v18, 0xCu);
  }
  self->_blockingPowerStatusTriggeredChargingUI = 1;
  [(CSPowerChangeObserver *)self->_powerChangeObserver update];
  self->_blockingPowerStatusTriggeredChargingUI = 0;
  BOOL v12 = [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToPower];
  if ((v3 - 21) > 1)
  {
    if (v3 != 5)
    {
      id v13 = SBLogDashBoard();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
        int v18 = 67109376;
        v19[0] = v12;
        LOWORD(v19[1]) = 1024;
        *(_DWORD *)((char *)&v19[1] + 2) = v14;
        _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "[Charge UI][Lift Wake] visible %d, showBattery NO – isAlreadyShowingChargingModal: %d", (uint8_t *)&v18, 0xEu);
      }

      [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:v12 suppressedByPack:0 showBattery:0 animated:v9];
      id v15 = SBLogDashBoard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
        int v18 = 67109120;
        v19[0] = v16;
        _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[Charge UI][Lift Wake] – endedShowingChargingModal: %d", (uint8_t *)&v18, 8u);
      }
    }
    if ((v9 & 1) == 0) {
      [(CSCoverSheetViewController *)self _startFadeInAnimationForSource:SBUIConvertUnlockSourceToBacklightChangeSource()];
    }
  }
  else
  {
    [(CSCoverSheetViewController *)self _finishFadeInAnimationForPowerSource:v3 connectedToPower:v12 screenOn:v9];
  }
  if (SBUIUnlockSourceIsUserAction())
  {
    id v17 = +[CSEvent eventWithType:26];
    [(CSCoverSheetViewController *)self _handleEvent:v17];
  }
  [(CSTeachableMomentsContainerViewController *)self->_teachableMomentsContainerViewController setAnimationState:1];
}

- (void)_finishFadeInAnimationForPowerSource:(int)a3 connectedToPower:(BOOL)a4 screenOn:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  *(void *)&void v16[5] = *MEMORY[0x1E4F143B8];
  if ([(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory])
  {
    if (v5) {
      return;
    }
    goto LABEL_12;
  }
  BOOL suppressChargingUIForAmbient = self->_suppressChargingUIForAmbient;
  uint64_t v9 = SBLogDashBoard();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (suppressChargingUIForAmbient)
  {
    if (v10)
    {
      id v11 = NSStringFromUnlockSource();
      int v15 = 138412290;
      *(void *)BOOL v16 = v11;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Charge UI][Suppressed] visible NO, suppressed for ambient presentation! source: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      int v15 = 67109376;
      v16[0] = v6;
      LOWORD(v16[1]) = 1024;
      *(_DWORD *)((char *)&v16[1] + 2) = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Charge UI][Finish Fade] visible YES, showBattery %d – isAlreadyShowingChargingModal: %d", (uint8_t *)&v15, 0xEu);
    }

    [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:1 showBattery:v6 animated:v5];
    uint64_t v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
      int v15 = 67109120;
      v16[0] = v12;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Charge UI][Finish Fade] – endedShowingChargingModal: %d", (uint8_t *)&v15, 8u);
    }
  }

  if (!v5)
  {
LABEL_12:
    id v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = NSStringFromUnlockSource();
      int v15 = 138412290;
      *(void *)BOOL v16 = v14;
      _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "[Charge UI] Starting fade in for source: %@", (uint8_t *)&v15, 0xCu);
    }
    [(CSCoverSheetViewController *)self _startFadeInAnimationForSource:SBUIConvertUnlockSourceToBacklightChangeSource()];
  }
}

- (void)_startFadeInAnimationForSource:(int64_t)a3
{
  if (![(CSCoverSheetViewController *)self _isWakeAnimationInProgress]
    && [(CSCoverSheetViewController *)self isViewLoaded])
  {
    BOOL v5 = SBLogDashBoardTelemetrySignposts();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D839D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_FADE_IN", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
    BOOL v6 = [(CSCoverSheetViewController *)self activeAppearance];
    uint64_t v7 = [v6 componentForType:2 identifier:@"(active)"];

    [(CSCoverSheetViewController *)self _dateTimeAlphaForFade];
    double v9 = v8;
    [v7 alpha];
    double v11 = v10;
    screenWakeAnimationController = self->_screenWakeAnimationController;
    id v13 = [(CSCoverSheetViewController *)self legacyWallpaperWakeAnimator];
    BOOL v14 = [(SBFLockScreenDateViewController *)self->_dateViewController dateViewIfExists];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__CSCoverSheetViewController__startFadeInAnimationForSource___block_invoke;
    v15[3] = &unk_1E6AD87F8;
    void v15[4] = self;
    [(SBFScreenWakeAnimationControlling *)screenWakeAnimationController prepareToWakeForSource:a3 timeAlpha:v13 statusBarAlpha:v14 target:v15 dateView:v9 completion:v11];
  }
}

void __61__CSCoverSheetViewController__startFadeInAnimationForSource___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 2032) updateTimeNow];
  id v2 = SBLogDashBoardTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_FADE_IN", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
  [*(id *)(a1 + 32) _updateActiveAppearanceForReason:@"FadeIn"];
  uint64_t v3 = +[CSEvent eventWithType:38];
  [*(id *)(a1 + 32) _handleEvent:v3];
}

- (BOOL)_isWakeAnimationInProgress
{
  return [(SBFScreenWakeAnimationControlling *)self->_screenWakeAnimationController isWakeAnimationInProgress];
}

- (double)_dateTimeAlphaForFade
{
  uint64_t v3 = [(CSCoverSheetViewController *)self activeAppearance];
  BOOL v4 = [v3 componentForType:1 identifier:@"(active)"];

  double v5 = 1.0;
  if (![(CSPresentationViewController *)self->_modalPresentationController isPresentingContent])
  {
    [v4 alpha];
    double v5 = v6;
  }

  return v5;
}

- (void)screenSleepCompletedForSource:(int)a3
{
  id v4 = +[CSEvent eventWithType:39];
  [(CSCoverSheetViewController *)self _handleEvent:v4];
}

- (void)timerControllerDidStartTimer:(id)a3
{
  id v4 = a3;
  double v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Timer Controller did start timer.", v8, 2u);
  }

  [(CSCoverSheetViewController *)self _transitionTimerViewToVisible:1 animated:0];
  if (([(ACActivityCenter *)self->_activityCenter areActivitiesEnabled] & 1) == 0)
  {
    dateViewController = self->_dateViewController;
    uint64_t v7 = [v4 timerText];
    [(SBFLockScreenDateViewController *)dateViewController setTimerWithText:v7];
  }
}

- (void)timerControllerDidUpdateTimer:(id)a3
{
  id v6 = a3;
  if (([(ACActivityCenter *)self->_activityCenter areActivitiesEnabled] & 1) == 0)
  {
    dateViewController = self->_dateViewController;
    double v5 = [v6 timerText];
    [(SBFLockScreenDateViewController *)dateViewController updateTimerWithText:v5];
  }
}

- (void)timerControllerDidStopTimer:(id)a3
{
  id v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "Timer Controller did stop timer.", v5, 2u);
  }

  [(CSCoverSheetViewController *)self _transitionTimerViewToVisible:0 animated:[(CSTimerViewController *)self->_timerViewController isEnabled]];
  if (([(ACActivityCenter *)self->_activityCenter areActivitiesEnabled] & 1) == 0) {
    [(SBFLockScreenDateViewController *)self->_dateViewController setTimerWithText:0];
  }
}

- (void)_transitionTimerViewToVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v7 = [(CSCoverSheetViewController *)self localAppearance];
  double v8 = [v7 componentForType:1 identifier:@"TimerView"];
  int v9 = v8 != 0;

  if (v9 != v5)
  {
    if (![(CSTimerViewController *)self->_timerViewController isEndDateValid])
    {
      double v10 = SBLogDashBoard();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Timer end date is invalid or nil.", buf, 2u);
      }

      int v5 = 0;
    }
    if (v4)
    {
      double v11 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.4];
    }
    else
    {
      double v11 = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__CSCoverSheetViewController__transitionTimerViewToVisible_animated___block_invoke;
    v13[3] = &unk_1E6AD92F0;
    void v13[4] = self;
    char v14 = v5;
    [(CSCoverSheetViewController *)self _updateLocalAppearanceForRequester:@"TimerView" animationSettings:v11 actions:v13 completion:0];
    if (v4) {

    }
    if (v5) {
      BOOL v12 = self;
    }
    else {
      BOOL v12 = 0;
    }
    [(CSCoverSheetViewControllerBase *)self->_timerViewController setPresenter:v12];
  }
}

id __69__CSCoverSheetViewController__transitionTimerViewToVisible_animated___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) localAppearance];
  [v2 removeAllComponentsWithIdentifier:@"TimerView"];

  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = +[CSComponent dateView];
    BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 2080) view];
    int v5 = [v3 view:v4];
    id v6 = [v5 priority:10];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)accessoryAttached:(id)a3
{
  id v4 = a3;
  int v5 = +[CSLockScreenDomain rootSettings];
  id v6 = [v5 chargingSettings];

  [v6 omniAccessoryAnimationDelayInMilliseconds];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 / 1000.0 * 1000000000.0));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CSCoverSheetViewController_accessoryAttached___block_invoke;
  v10[3] = &unk_1E6AD88C0;
  id v11 = v4;
  BOOL v12 = self;
  id v9 = v4;
  dispatch_after(v8, MEMORY[0x1E4F14428], v10);
}

uint64_t __48__CSCoverSheetViewController_accessoryAttached___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v7 = 138412290;
    dispatch_time_t v8 = v3;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Accessory attached: %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [*(id *)(*(void *)(a1 + 40) + 1048) screenStateProvider];
  uint64_t v5 = [v4 screenIsOn];

  [*(id *)(*(void *)(a1 + 40) + 1304) addObject:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _transitionAccessoryViewToVisible:1 accessory:*(void *)(a1 + 32) animated:v5];
}

- (void)accessoryDetached:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __48__CSCoverSheetViewController_accessoryDetached___block_invoke;
  v6[3] = &unk_1E6AD88C0;
  id v7 = v4;
  dispatch_time_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__CSCoverSheetViewController_accessoryDetached___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    *(_DWORD *)id buf = 138412290;
    id v25 = v3;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Accessory detached: %@", buf, 0xCu);
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 1304);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __48__CSCoverSheetViewController_accessoryDetached___block_invoke_652;
  v21[3] = &unk_1E6AD9318;
  id v22 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v4, "bs_filter:", v21);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        BOOL v12 = SBLogDashBoard();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [*(id *)(a1 + 32) description];
          *(_DWORD *)id buf = v16;
          id v25 = v13;
          _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "Removing accessory: %@", buf, 0xCu);
        }
        [*(id *)(*(void *)(a1 + 40) + 1304) removeObject:v11];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }
  char v14 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1048), "screenStateProvider", v16);
  uint64_t v15 = [v14 screenIsOn];

  [*(id *)(a1 + 40) _transitionAccessoryViewToVisible:0 accessory:*(void *)(a1 + 32) animated:v15];
}

uint64_t __48__CSCoverSheetViewController_accessoryDetached___block_invoke_652(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 endpointUUID];
  id v4 = [*(id *)(a1 + 32) endpointUUID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)accessoryAnimationStatusChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CSCoverSheetViewController_accessoryAnimationStatusChanged___block_invoke;
  v3[3] = &unk_1E6AD8CD0;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __62__CSCoverSheetViewController_accessoryAnimationStatusChanged___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Accessory animation status changed, isAnimationsAllowed: %{BOOL}u", (uint8_t *)v4, 8u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1312) = *(unsigned char *)(a1 + 40);
}

- (unint64_t)_accessoryAnimationRestrictions
{
  return 4348;
}

- (void)_updateAccessoryAnimationPresenting:(BOOL)a3 userInteractionDisabled:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __90__CSCoverSheetViewController__updateAccessoryAnimationPresenting_userInteractionDisabled___block_invoke;
  v4[3] = &unk_1E6AD9340;
  BOOL v5 = a3;
  BOOL v6 = a4;
  void v4[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __90__CSCoverSheetViewController__updateAccessoryAnimationPresenting_userInteractionDisabled___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v4 = *(unsigned __int8 *)(a1 + 41);
    v11[0] = 67109376;
    v11[1] = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Update accessoryAnimationPresenting: %{BOOL}u userInteractionDisabled: %{BOOL}u for accessory animation", (uint8_t *)v11, 0xEu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1787) = *(unsigned char *)(a1 + 40);
  int v5 = *(unsigned __int8 *)(a1 + 41);
  BOOL v6 = *(void **)(a1 + 32);
  long long v7 = (void *)v6[249];
  uint64_t v8 = [v6 _accessoryAnimationRestrictions];
  if (v5)
  {
    [v7 addRestrictedCapabilities:v8];
    uint64_t v9 = @"AccessoryAnimationPresentationWillStart";
  }
  else
  {
    uint64_t result = [v7 areRestrictedCapabilities:v8];
    if (!result) {
      return result;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1992), "removeRestrictedCapabilities:", objc_msgSend(*(id *)(a1 + 32), "_accessoryAnimationRestrictions"));
    uint64_t v9 = @"AccessoryAnimationPresentationDidEnd";
  }
  return [*(id *)(a1 + 32) _updateActiveBehaviorsForReason:v9];
}

- (BOOL)attachedAccessoriesContainsAccessoryType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = self->_attachedAccessories;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "type", (void)v11) == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_showingAccessoryView
{
  if (!self->_accessoryViewController) {
    return 0;
  }
  int v3 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  BOOL v4 = ([v3 containsObject:self->_accessoryViewController] & 1) != 0
    || self->_accessoryViewPresentationDelayed;

  return v4;
}

- (BOOL)_isAccessoryAnimationAllowedForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSCoverSheetViewController *)self activeBehavior];
  char v6 = [v5 areRestrictedCapabilities:0x100000];

  if (v6)
  {
    char v7 = 0;
  }
  else if (self->_isAccessoryAnimationAllowed {
         && ![(CSCoverSheetViewController *)self _isShowingNonStaticAccessoryBlockingUI])
  }
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [v4 hasStaticView];
  }

  return v7;
}

- (void)_transitionAccessoryViewToVisible:(BOOL)a3 accessory:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  BOOL v9 = [(CSCoverSheetViewController *)self _showingAccessoryView];
  BOOL v10 = v9;
  if (v6 && v9)
  {
    long long v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [(CSMagSafeAccessoryViewController *)self->_accessoryViewController accessory];
      long long v13 = [v12 description];
      *(_DWORD *)id buf = 138412290;
      id v38 = v13;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Showing an accessory view already: %@.", buf, 0xCu);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v6)
  {
    if (![(CSCoverSheetViewController *)self _isAccessoryAnimationAllowedForAccessory:v8])
    {
      long long v11 = SBLogDashBoard();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [(CSMagSafeAccessoryViewController *)self->_accessoryViewController accessory];
        double v21 = [v20 description];
        *(_DWORD *)id buf = 138412290;
        id v38 = v21;
        _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Accessory animation is not allowed. Not showing accessory animation for accessory: %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    if (v8) {
      char v14 = v10;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0 && [(CSCoverSheetViewController *)self _appearState] == 2)
    {
      if ([(CSCoverSheetViewController *)self isMainPageVisible])
      {
        [(CSCoverSheetViewController *)self _animateAccessory:v8 toVisibleAnimated:v5];
      }
      else
      {
        uint64_t v22 = [v8 type];
        double v23 = [(CSCoverSheetViewController *)self visiblePageViewController];
        double v24 = [(CSCoverSheetViewController *)self mainPageContentViewController];

        id v25 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
        if (v25)
        {
          uint64_t v26 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
          [v26 presentationProgress];
          int IsZero = BSFloatIsZero();

          int v28 = IsZero ^ 1;
        }
        else
        {
          int v28 = 0;
        }

        int v29 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
        if (v29)
        {
          uint64_t v30 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
          [v30 presentationProgress];
          int v31 = BSFloatLessThanFloat();
        }
        else
        {
          int v31 = 0;
        }

        if (v22 == 6) {
          goto LABEL_30;
        }
        int v32 = v28 ^ 1;
        if (v23 != v24) {
          int v32 = 0;
        }
        if ((v32 | v31) == 1)
        {
LABEL_30:
          unint64_t v33 = [(CSCoverSheetViewController *)self _indexOfMainPage];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __83__CSCoverSheetViewController__transitionAccessoryViewToVisible_accessory_animated___block_invoke;
          v34[3] = &unk_1E6AD91D8;
          v34[4] = self;
          id v35 = v8;
          BOOL v36 = v5;
          [(CSCoverSheetViewController *)self activatePage:v33 animated:0 withCompletion:v34];
        }
      }
    }
  }
  else
  {
    uint64_t v15 = [(CSMagSafeAccessoryViewController *)self->_accessoryViewController accessory];
    uint64_t v16 = [v15 endpointUUID];
    long long v17 = [v8 endpointUUID];

    if (v16 == v17)
    {
      [(BSAbsoluteMachTimer *)self->_accessoryViewControllerTimer invalidate];
      accessoryViewControllerTimer = self->_accessoryViewControllerTimer;
      self->_accessoryViewControllerTimer = 0;

      id accessoryViewControllerTimerHandler = self->_accessoryViewControllerTimerHandler;
      self->_id accessoryViewControllerTimerHandler = 0;

      [(CSCoverSheetViewController *)self _dismissAccessoryViewController:self->_accessoryViewController animated:v5];
    }
  }
LABEL_19:
}

uint64_t __83__CSCoverSheetViewController__transitionAccessoryViewToVisible_accessory_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateAccessory:*(void *)(a1 + 40) toVisibleAnimated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_animateAccessory:(id)a3 toVisibleAnimated:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(CSCoverSheetContextProviding *)self->_coverSheetContext reachabilityController];
  [v7 deactivateReachability];

  BOOL v8 = [(CSCoverSheetViewController *)self isShowingModalView];
  int v9 = [v6 shouldLockScreenWhenAttached];
  BOOL v10 = SBLogDashBoard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = [v6 description];
    *(_DWORD *)id buf = 138412290;
    id v35 = v11;
    _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Presenting accessory (%@) view.", buf, 0xCu);
  }
  switch([v6 type])
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      if (v8) {
        goto LABEL_5;
      }
      long long v13 = CSMagSafeAccessoryTrayViewController;
      goto LABEL_7;
    case 6:
      uint64_t v15 = [[CSMagSafeAccessorySleeveViewController alloc] initWithAccessory:v6];
      uint64_t v16 = [(CSCoverSheetContextProviding *)self->_coverSheetContext dateProvider];
      [(CSMagSafeAccessorySleeveViewController *)v15 setDateProvider:v16];

      [v6 visibleScreenCoordinates];
      -[CSMagSafeAccessorySleeveViewController setVisibleBounds:](v15, "setVisibleBounds:");
      long long v17 = [(CSCoverSheetViewController *)self activeAppearance];
      [v17 legibilitySettings];
      long long v18 = v27 = a4;
      [(CSMagSafeAccessorySleeveViewController *)v15 setLegibilitySettings:v18];

      long long v12 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
      long long v19 = [v12 customTimeFont];
      long long v20 = [v12 textColor];
      double v21 = [v12 vibrancyConfiguration];
      uint64_t v22 = [v12 customTimeNumberingSystem];
      [(CSMagSafeAccessorySleeveViewController *)v15 updateFont:v19 textColor:v20 vibrancyConfiguration:v21 numberingSystem:v22];

      a4 = v27;
      accessoryViewController = self->_accessoryViewController;
      self->_accessoryViewController = &v15->super;

      goto LABEL_9;
    case 8:
      if (v8)
      {
LABEL_5:
        long long v12 = self->_accessoryViewController;
        self->_accessoryViewController = 0;
      }
      else
      {
        long long v13 = CSMagSafeAccessoryWalletViewController;
LABEL_7:
        char v14 = (CSMagSafeAccessoryViewController *)[[v13 alloc] initWithAccessory:v6];
        long long v12 = self->_accessoryViewController;
        self->_accessoryViewController = v14;
      }
LABEL_9:

      if (self->_accessoryViewController)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke;
        v30[3] = &unk_1E6AD91D8;
        id v31 = v6;
        int v32 = self;
        BOOL v33 = a4;
        uint64_t v24 = MEMORY[0x1D9487300](v30);
        id v25 = (void *)v24;
        if ((v9 & v8) != 0)
        {
          uint64_t v26 = [(CSCoverSheetViewController *)self modalPresentationController];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_671;
          v28[3] = &unk_1E6AD8B78;
          id v29 = v25;
          [v26 dismissPresentationAnimated:1 completion:v28];
        }
        else
        {
          (*(void (**)(uint64_t))(v24 + 16))(v24);
        }
      }
      break;
    default:
      break;
  }
}

void __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoardTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ACCESSORY_UI_FADE_IN", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  uint64_t v3 = [*(id *)(a1 + 32) shouldDelayAnimation];
  [*(id *)(a1 + 40) _updateAccessoryAnimationPresenting:1 userInteractionDisabled:v3];
  double v4 = 0.0;
  if (v3)
  {
    [*(id *)(a1 + 32) attachAnimationDelay];
    double v4 = v5;
    *(unsigned char *)(*(void *)(a1 + 40) + 1256) = v5 > 0.0;
  }
  id v6 = SBLogDashBoard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    double v14 = v4;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Accessory animation delay in seconds: %f", buf, 0xCu);
  }

  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_663;
  block[3] = &unk_1E6AD91D8;
  char v12 = *(unsigned char *)(a1 + 48);
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

void __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_663(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isShowingChargingModal])
  {
    id v2 = SBLogDashBoard();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "Accessory animation cancelled because charing UI showed up in race", (uint8_t *)buf, 2u);
    }

    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 1264);
    *(void *)(v3 + 1264) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1256) = 0;
    objc_initWeak(buf, *(id *)(a1 + 32));
    double v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[158];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_2;
    v26[3] = &unk_1E6AD9368;
    objc_copyWeak(&v29, buf);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v27 = v8;
    uint64_t v28 = v9;
    [v5 _presentModalViewController:v6 animated:v7 completion:v26];
    if (([*(id *)(a1 + 40) hasStaticView] & 1) == 0)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_664;
      v23[3] = &unk_1E6AD9390;
      objc_copyWeak(&v25, buf);
      id v24 = *(id *)(a1 + 40);
      uint64_t v10 = MEMORY[0x1D9487300](v23);
      uint64_t v11 = *(void *)(a1 + 32);
      char v12 = *(void **)(v11 + 1280);
      *(void *)(v11 + 1280) = v10;

      [*(id *)(*(void *)(a1 + 32) + 1272) invalidate];
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSCoverSheetViewController.accessoryViewControllerTimer"];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(v14 + 1272);
      *(void *)(v14 + 1272) = v13;

      uint64_t v16 = *(void *)(a1 + 32);
      long long v17 = *(void **)(v16 + 1272);
      [*(id *)(v16 + 1264) animationDurationBeforeDismissal];
      double v19 = v18;
      uint64_t v20 = MEMORY[0x1E4F14428];
      id v21 = MEMORY[0x1E4F14428];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_2_669;
      v22[3] = &unk_1E6AD93B8;
      void v22[4] = *(void *)(a1 + 32);
      [v17 scheduleWithFireInterval:v20 leewayInterval:v22 queue:v19 handler:0.0];

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(buf);
  }
}

void __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = SBLogDashBoardTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)double v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ACCESSORY_UI_FADE_IN", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([*(id *)(a1 + 32) isWindowed])
  {
    double v4 = [WeakRetained delegate];
    [v4 coverSheetWindowedAccessoryViewControllerDidPresent:*(void *)(a1 + 40)];
  }
}

void __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_664(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_transitionAccessoryViewToVisible:accessory:animated:", 0, *(void *)(a1 + 32), objc_msgSend(WeakRetained, "isViewLoaded"));
  if (WeakRetained)
  {
    [WeakRetained[159] invalidate];
    id v2 = WeakRetained[159];
    WeakRetained[159] = 0;

    id v3 = WeakRetained[160];
    WeakRetained[160] = 0;
  }
}

uint64_t __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_2_669(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1280) + 16))();
}

uint64_t __66__CSCoverSheetViewController__animateAccessory_toVisibleAnimated___block_invoke_671(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_dismissAccessoryViewController:(id)a3 animated:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(CSPresentationViewController *)self->_modalPresentationController presentedViewControllers];
    int v8 = [v7 containsObject:v6];

    uint64_t v9 = SBLogDashBoard();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        uint64_t v11 = [v6 accessory];
        char v12 = [v11 description];
        *(_DWORD *)id buf = 138412290;
        double v19 = v12;
        _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing accessory (%@) UI.", buf, 0xCu);
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __71__CSCoverSheetViewController__dismissAccessoryViewController_animated___block_invoke;
      v15[3] = &unk_1E6AD91D8;
      void v15[4] = self;
      id v16 = v6;
      BOOL v17 = a4;
      [v16 performDismissalAnimationWithCompletionHandler:v15];
    }
    else
    {
      if (v10)
      {
        uint64_t v13 = [v6 accessory];
        uint64_t v14 = [v13 description];
        *(_DWORD *)id buf = 138412290;
        double v19 = v14;
        _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing non-presented accessory (%@) UI.", buf, 0xCu);
      }
      [(CSCoverSheetViewController *)self _handleDismissalForAccessoryViewController:v6 animated:0];
    }
  }
}

uint64_t __71__CSCoverSheetViewController__dismissAccessoryViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDismissalForAccessoryViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_handleDismissalForAccessoryViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = SBLogDashBoardTelemetrySignposts();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D839D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ACCESSORY_UI_FADE_OUT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __82__CSCoverSheetViewController__handleDismissalForAccessoryViewController_animated___block_invoke;
  v9[3] = &unk_1E6AD91D8;
  BOOL v11 = v4;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(CSCoverSheetViewController *)self _dismissModalViewController:v8 animated:v4 completion:v9];
}

void __82__CSCoverSheetViewController__handleDismissalForAccessoryViewController_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = SBLogDashBoardTelemetrySignposts();
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ACCESSORY_UI_FADE_OUT", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
    }

    kdebug_trace();
  }
  [*(id *)(a1 + 32) _updateAccessoryAnimationPresenting:0 userInteractionDisabled:0];
  id v3 = [*(id *)(a1 + 32) delegate];
  BOOL v4 = [*(id *)(a1 + 40) accessory];
  if ([v4 isWindowed])
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5) {
      [v3 coverSheetWindowedAccessoryViewControllerDidDismiss:*(void *)(a1 + 32)];
    }
  }
  else
  {
  }
}

- (void)_powerStatusChangedToConnectedState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(CSCoverSheetViewController *)self _isWakeAnimationInProgress])
  {
    char v5 = [(CSCoverSheetContextProviding *)self->_coverSheetContext screenStateProvider];
    uint64_t v6 = [v5 screenIsOn];

    [(CSPowerChangeObserver *)self->_powerChangeObserver update];
    if ([(CSCoverSheetViewController *)self _showingAccessoryView]
      && [(CSMagSafeAccessoryViewController *)self->_accessoryViewController hasChargingAnimation])
    {
      BOOL v7 = [(CSMagSafeAccessoryViewController *)self->_accessoryViewController showingChargingAnimation];
      BOOL v8 = v7;
      if (v3 && !v7)
      {
        uint64_t v9 = +[CSAction actionWithType:3];
        [(CSCoverSheetViewController *)self handleAction:v9 fromSender:self];
      }
      if (!v3 || !v8)
      {
        [(CSCoverSheetViewController *)self _transitionAccessoryChargingViewToVisible:v3];
      }
    }
    else
    {
      id v10 = SBLogDashBoard();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 67109376;
        BOOL v15 = v3;
        __int16 v16 = 1024;
        BOOL v17 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
        _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[Charge UI][Power Status] visible YES, showBattery %d – isAlreadyShowingChargingModal: %d", (uint8_t *)&v14, 0xEu);
      }

      if (self->_blockingPowerStatusTriggeredChargingUI
        || [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory]|| self->_suppressChargingUIForAmbient)
      {
        if (self->_suppressChargingUIForAmbient)
        {
          BOOL v11 = SBLogDashBoard();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[Charge UI][Suppressed] visible NO, suppressed for ambient presentation!", (uint8_t *)&v14, 2u);
          }
        }
      }
      else
      {
        [(CSCoverSheetViewController *)self _transitionChargingViewToVisible:1 showBattery:v3 animated:v6];
      }
      char v12 = SBLogDashBoard();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
        int v14 = 67109120;
        BOOL v15 = v13;
        _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[Charge UI][Power Status] – endedShowingChargingModal: %d", (uint8_t *)&v14, 8u);
      }
    }
  }
}

- (BOOL)_transitionPrototypeChargingViewToVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(CSLockScreenSettings *)self->_prototypeSettings chargingSettings];
  if (![v7 showWirelessAndAccessoryAnimations]) {
    goto LABEL_12;
  }
  if (!self->_accessoryViewController)
  {
    if (!v5) {
      goto LABEL_12;
    }
LABEL_7:
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__CSCoverSheetViewController__transitionPrototypeChargingViewToVisible_animated___block_invoke;
    v15[3] = &unk_1E6AD93E0;
    objc_copyWeak(&v18, &location);
    id v10 = v7;
    id v16 = v10;
    BOOL v17 = self;
    BOOL v19 = a4;
    BOOL v11 = (void (**)(void, void, void))MEMORY[0x1D9487300](v15);
    if ([(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToQiPower]
      || [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory]|| [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalCharger])
    {
      uint64_t v12 = [v10 wirelessChargingAnimationType];
      if (v12 == 1)
      {
LABEL_11:

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v12 = [v10 wiredChargingAnimationType];
      if (!v12) {
        goto LABEL_11;
      }
    }
    v11[2](v11, v5, v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
LABEL_14:
    BOOL v13 = 1;
    goto LABEL_15;
  }
  BOOL v8 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  int v9 = [v8 containsObject:self->_accessoryViewController];

  if (v9 != v5) {
    goto LABEL_7;
  }
  if (v9) {
    goto LABEL_14;
  }
LABEL_12:
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

void __81__CSCoverSheetViewController__transitionPrototypeChargingViewToVisible_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = [*(id *)(a1 + 32) accessoryTypeForAnimationType:a3];
  if (a3 == 4) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  BOOL v7 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  }
  BOOL v8 = [MEMORY[0x1E4F428B8] systemRedColor];
  int v9 = +[CSMagSafeAccessory accessoryWithType:v6 primaryColor:v7 secondoryColor:v8];

  if (![*(id *)(*(void *)(a1 + 40) + 1264) isStatic]
    || (a2 & 1) != 0
    || (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1328), "sb_deviceInternalBattery"),
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isCharging],
        v10,
        (v11 & 1) == 0))
  {
    [WeakRetained _transitionAccessoryViewToVisible:a2 accessory:v9 animated:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (void)_transitionAccessoryChargingViewToVisible:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->_accessoryViewController)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CSCoverSheetViewController *)self _chargingInfo];
    uint64_t v6 = [(CSCoverSheetViewController *)self _batteryCenterInternalBattery];
    [v5 setInternalBatteryDevice:v6];

    if (v3)
    {
      BOOL v7 = [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalCharger];
      if ([(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory])
      {
        BOOL v8 = [v5 externalBatteryDevice];

        if (v8) {
          goto LABEL_22;
        }
      }
      [(CSCoverSheetViewController *)self _connectedExternalChargers];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v34;
        uint64_t v12 = *MEMORY[0x1E4F4F9D8];
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if ([v14 isPowerSource] && objc_msgSend(v14, "productIdentifier") == v12)
            {
              [v5 setChargingWithInternalWirelessAccessory:1];
              [v5 setExternalBatteryDevice:v14];

              goto LABEL_22;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v40 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      if (v7)
      {
LABEL_22:
        BOOL v19 = +[CSAction actionWithType:3];
        [(CSCoverSheetViewController *)self handleAction:v19 fromSender:self];

        uint64_t v20 = SBLogDashBoard();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1D839D000, v20, OS_LOG_TYPE_DEFAULT, "Showing accessory charging UI", (uint8_t *)&buf, 2u);
        }

        [(CSMagSafeAccessoryViewController *)self->_accessoryViewController transitionChargingViewVisible:1 chargingInfo:v5];
        objc_initWeak(&buf, self);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __72__CSCoverSheetViewController__transitionAccessoryChargingViewToVisible___block_invoke;
        v31[3] = &unk_1E6AD92C8;
        objc_copyWeak(&v32, &buf);
        id v21 = (void *)MEMORY[0x1D9487300](v31);
        id accessoryViewControllerChargingTimerHandler = self->_accessoryViewControllerChargingTimerHandler;
        self->_id accessoryViewControllerChargingTimerHandler = v21;

        double v23 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSCoverSheetViewController.accessoryViewControllerChargingTimer"];
        accessoryViewControllerChargingTimer = self->_accessoryViewControllerChargingTimer;
        self->_accessoryViewControllerChargingTimer = v23;

        id v25 = self->_accessoryViewControllerChargingTimer;
        [(CSMagSafeAccessoryViewController *)self->_accessoryViewController chargingAnimationDuration];
        double v27 = v26;
        uint64_t v28 = MEMORY[0x1E4F14428];
        id v29 = MEMORY[0x1E4F14428];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __72__CSCoverSheetViewController__transitionAccessoryChargingViewToVisible___block_invoke_2;
        v30[3] = &unk_1E6AD93B8;
        void v30[4] = self;
        [(BSAbsoluteMachTimer *)v25 scheduleWithFireInterval:v28 leewayInterval:v30 queue:v27 handler:0.0];

        objc_destroyWeak(&v32);
        objc_destroyWeak(&buf);
      }
      else
      {
        BOOL v15 = SBLogDashBoard();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id buf = (id)67109376;
          __int16 v38 = 1024;
          int v39 = 0;
          _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "Suppressing accessory charging UI when isChargerConnected: %{BOOL}u, isAccessoryConnected: %{BOOL}u", (uint8_t *)&buf, 0xEu);
        }
      }
    }
    else
    {
      id v16 = SBLogDashBoard();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D839D000, v16, OS_LOG_TYPE_DEFAULT, "Dismissing accessory charging UI.", (uint8_t *)&buf, 2u);
      }

      [(BSAbsoluteMachTimer *)self->_accessoryViewControllerChargingTimer invalidate];
      id v17 = self->_accessoryViewControllerChargingTimerHandler;
      self->_id accessoryViewControllerChargingTimerHandler = 0;

      id v18 = self->_accessoryViewControllerChargingTimer;
      self->_accessoryViewControllerChargingTimer = 0;

      [(CSMagSafeAccessoryViewController *)self->_accessoryViewController transitionChargingViewVisible:0 chargingInfo:v5];
    }
  }
}

void __72__CSCoverSheetViewController__transitionAccessoryChargingViewToVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transitionAccessoryChargingViewToVisible:0];
  if (WeakRetained)
  {
    [WeakRetained[161] invalidate];
    id v1 = WeakRetained[161];
    WeakRetained[161] = 0;

    id v2 = WeakRetained[162];
    WeakRetained[162] = 0;
  }
  objc_msgSend(WeakRetained, "_updateDateSubtitleAppearanceForBattery:animated:chargingVisible:", 0, objc_msgSend(WeakRetained, "isViewLoaded"), 0);
}

uint64_t __72__CSCoverSheetViewController__transitionAccessoryChargingViewToVisible___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1296) + 16))();
}

- (id)_batteryCenterInternalBattery
{
  id v2 = [(BCBatteryDeviceController *)self->_batteryDeviceController connectedDevices];
  BOOL v3 = objc_msgSend(v2, "bs_filter:", &__block_literal_global_681);
  BOOL v4 = [v3 firstObject];

  return v4;
}

uint64_t __59__CSCoverSheetViewController__batteryCenterInternalBattery__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInternal];
}

- (id)_connectedExternalChargers
{
  id v2 = [(BCBatteryDeviceController *)self->_batteryDeviceController connectedDevices];
  BOOL v3 = objc_msgSend(v2, "bs_filter:", &__block_literal_global_683);

  return v3;
}

BOOL __56__CSCoverSheetViewController__connectedExternalChargers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 isPowerSource]
    && ([v2 isInternal] & 1) == 0
    && [v2 accessoryCategory] == 4;

  return v3;
}

- (id)_chargingInfo
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = [(BCBatteryDeviceController *)self->_batteryDeviceController sb_deviceInternalBattery];
  [v3 setInternalBatteryDevice:v4];

  BOOL v5 = [(CSCoverSheetViewController *)self _connectedExternalChargers];
  uint64_t v6 = [v5 firstObject];
  [v3 setExternalBatteryDevice:v6];

  BOOL v7 = [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory]|| [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalCharger];
  [v3 setChargingWithInternalWirelessAccessory:v7];

  return v3;
}

- (void)_transitionChargingViewToVisible:(BOOL)a3 showBattery:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)_transitionChargingViewToVisible:(BOOL)a3 suppressedByPack:(BOOL)a4 showBattery:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v55 = a5;
  BOOL v7 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  BOOL v9 = !a3;
  if (a3
    && a4
    && [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory]|| [(CSCoverSheetViewController *)self _transitionPrototypeChargingViewToVisible:v55 animated:v6])
  {
    return;
  }
  BOOL v10 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
  if (!v9 && v10)
  {
    uint64_t v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v54 = self->_chargingViewController != 0;
      uint64_t v12 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
      int v13 = [v12 containsObject:self->_chargingViewController];
      int v14 = [(NSMutableSet *)self->_pendingModalViewControllers containsObject:self->_chargingViewController];
      LODWORD(buf) = 67109632;
      HIDWORD(buf) = v54;
      __int16 v63 = 1024;
      BOOL v64 = v13;
      __int16 v65 = 1024;
      BOOL v66 = v14;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Refusing to present charging UI. hasChargingViewController: %d, chargingViewControllerIsPresented: %d, presentingChargingViewController: %d", (uint8_t *)&buf, 0x14u);
    }
  }
  if (v9 || v10)
  {
    if (!v7 && v10)
    {
      BOOL v15 = v6;
      id v16 = SBLogDashBoard();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D839D000, v16, OS_LOG_TYPE_DEFAULT, "Dismissing charging UI.", (uint8_t *)&buf, 2u);
      }

      [(BSAbsoluteMachTimer *)self->_chargingViewControllerTimer invalidate];
      id chargingViewTimerHandler = self->_chargingViewTimerHandler;
      self->_id chargingViewTimerHandler = 0;

      chargingViewControllerTimer = self->_chargingViewControllerTimer;
      self->_chargingViewControllerTimer = 0;

      chargingViewController = self->_chargingViewController;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_687;
      v56[3] = &unk_1E6AD8CD0;
      v56[4] = self;
      BOOL v57 = v15;
      [(CSChargingViewController *)chargingViewController performDismissalAnimationWithCompletionHandler:v56];
    }
    return;
  }
  BOOL v20 = v6;
  id v21 = SBLogDashBoard();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEFAULT, "Presenting charging UI.", (uint8_t *)&buf, 2u);
  }

  int v22 = [(CSCoverSheetViewController *)self _appearState];
  BOOL v23 = [(CSCoverSheetViewController *)self isMainPageVisible];
  BOOL v24 = [(CSCoverSheetViewController *)self isShowingModalView];
  if (v22 == 2 && v23 && !v24)
  {
    double v26 = +[CSAction actionWithType:3];
    [(CSCoverSheetViewController *)self handleAction:v26 fromSender:self];

    id v25 = [(CSCoverSheetViewController *)self _chargingInfo];
    double v27 = self->_chargingViewController;
    uint64_t v28 = SBFEffectiveArtworkSubtype();
    int v29 = 0;
    if (v28 > 2795)
    {
      if (v28 == 2796 || v28 == 2868) {
        goto LABEL_26;
      }
    }
    else if (v28 == 2556 || v28 == 2622)
    {
      goto LABEL_26;
    }
    int v29 = 1;
LABEL_26:
    if ([(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalCharger]|| [(CSPowerChangeObserver *)self->_powerChangeObserver isConnectedToWirelessInternalChargingAccessory])
    {
      BOOL v30 = 1;
    }
    else
    {
      id v31 = [v25 externalBatteryDevice];
      id v32 = v31;
      BOOL v30 = v31 && [v31 accessoryCategory] == 4 && objc_msgSend(v32, "vendor") == 1;
    }
    if (!v27 && v29 | v30 && v55)
    {
      long long v33 = SBLogDashBoard();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v34 = self->_chargingViewController != 0;
        BOOL v35 = [(CSCoverSheetViewController *)self _isShowingChargingModal];
        LODWORD(buf) = 67109376;
        HIDWORD(buf) = v34;
        __int16 v63 = 1024;
        BOOL v64 = v35;
        _os_log_impl(&dword_1D839D000, v33, OS_LOG_TYPE_DEFAULT, "Creating charging VC. alreadyExisted: %d alreadyPresented: %d", (uint8_t *)&buf, 0xEu);
      }

      long long v36 = [[CSChargingViewController alloc] initWithChargingInfo:v25];
      uint64_t v37 = self->_chargingViewController;
      self->_chargingViewController = v36;

      __int16 v38 = SBLogDashBoardTelemetrySignposts();
      if (os_signpost_enabled(v38))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D839D000, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CHARGING_UI_FADE_IN", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&buf, 2u);
      }

      kdebug_trace();
      int v39 = self->_chargingViewController;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke;
      v61[3] = &unk_1E6AD87F8;
      v61[4] = self;
      [(CSCoverSheetViewController *)self _presentModalViewController:v39 animated:v20 completion:v61];
    }
    if (!v55)
    {
      id v40 = SBLogDashBoard();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D839D000, v40, OS_LOG_TYPE_DEFAULT, "About to create date subtitle for charge.", (uint8_t *)&buf, 2u);
      }

      [(CSCoverSheetViewController *)self _updateDateSubtitleAppearanceForBattery:0 animated:v20 chargingVisible:1];
    }
    goto LABEL_46;
  }
  id v25 = SBLogDashBoard();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109632;
    HIDWORD(buf) = v22 == 2;
    __int16 v63 = 1024;
    BOOL v64 = v23;
    __int16 v65 = 1024;
    BOOL v66 = v24;
    _os_log_impl(&dword_1D839D000, v25, OS_LOG_TYPE_DEFAULT, "Refused to create charging VC because of factors: visible: %d, mainPage: %d, showingModal: %d", (uint8_t *)&buf, 0x14u);
  }
LABEL_46:

  if (self->_chargingViewTimerHandler || self->_chargingViewControllerTimer)
  {
    uint64_t v41 = SBLogDashBoard();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v42 = self->_chargingViewControllerTimer != 0;
      BOOL v43 = self->_chargingViewTimerHandler != 0;
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v42;
      __int16 v63 = 1024;
      BOOL v64 = v43;
      _os_log_impl(&dword_1D839D000, v41, OS_LOG_TYPE_DEFAULT, "Overwriting timer or handler: timerExists: %d, handlerExists: %d", (uint8_t *)&buf, 0xEu);
    }
  }
  objc_initWeak(&buf, self);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_686;
  v59[3] = &unk_1E6AD92C8;
  objc_copyWeak(&v60, &buf);
  long long v44 = (void *)MEMORY[0x1D9487300](v59);
  id v45 = self->_chargingViewTimerHandler;
  self->_id chargingViewTimerHandler = v44;

  double v46 = *MEMORY[0x1E4FA6F00];
  id v47 = self->_chargingViewController;
  if (v47 && v55)
  {
    [(CSChargingViewController *)v47 durationBeforeDismissal];
    double v46 = v48;
  }
  [(BSAbsoluteMachTimer *)self->_chargingViewControllerTimer invalidate];
  __int16 v49 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSCoverSheetViewController.chargingViewControllerTimer"];
  int v50 = self->_chargingViewControllerTimer;
  self->_chargingViewControllerTimer = v49;

  id v51 = self->_chargingViewControllerTimer;
  uint64_t v52 = MEMORY[0x1E4F14428];
  id v53 = MEMORY[0x1E4F14428];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_2;
  v58[3] = &unk_1E6AD93B8;
  v58[4] = self;
  [(BSAbsoluteMachTimer *)v51 scheduleWithFireInterval:v52 leewayInterval:v58 queue:v46 handler:0.0];

  objc_destroyWeak(&v60);
  objc_destroyWeak(&buf);
}

void __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoardTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v5[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CHARGING_UI_FADE_IN", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)v5, 2u);
  }

  kdebug_trace();
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 32) _isShowingChargingModal];
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Finished adding charging VC. presented: %d", (uint8_t *)v5, 8u);
  }
}

void __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_686(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transitionChargingViewToVisible:showBattery:animated:", 0, 0, objc_msgSend(WeakRetained, "isViewLoaded"));
  if (WeakRetained)
  {
    [WeakRetained[167] invalidate];
    id v1 = WeakRetained[167];
    WeakRetained[167] = 0;

    id v2 = WeakRetained[168];
    WeakRetained[168] = 0;
  }
  objc_msgSend(WeakRetained, "_updateDateSubtitleAppearanceForBattery:animated:chargingVisible:", 0, objc_msgSend(WeakRetained, "isViewLoaded"), 0);
}

uint64_t __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1344) + 16))();
}

uint64_t __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_687(uint64_t a1)
{
  id v2 = SBLogDashBoardTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CHARGING_UI_FADE_OUT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  BOOL v3 = *(id **)(a1 + 32);
  int v4 = [v3[165] coverSheetIdentifier];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_688;
  v7[3] = &unk_1E6AD87F8;
  void v7[4] = *(void *)(a1 + 32);
  [v3 _dismissModalViewControllersWithIdentifier:v4 animated:v5 completion:v7];

  return [*(id *)(a1 + 32) _updateDateSubtitleAppearanceForBattery:0 animated:*(unsigned __int8 *)(a1 + 40) chargingVisible:0];
}

void __101__CSCoverSheetViewController__transitionChargingViewToVisible_suppressedByPack_showBattery_animated___block_invoke_688(uint64_t a1)
{
  id v2 = SBLogDashBoardTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D839D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CHARGING_UI_FADE_OUT", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 1320);
  *(void *)(v3 + 1320) = 0;
}

- (BOOL)_isShowingChargingModal
{
  chargingViewController = self->_chargingViewController;
  if (chargingViewController)
  {
    int v4 = [(CSCoverSheetViewControllerBase *)chargingViewController coverSheetIdentifier];
    BOOL v5 = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v4];

    LOBYTE(chargingViewController) = v5;
  }
  return (char)chargingViewController;
}

- (void)_clearChargingModalStateIfNecessary
{
  if (![(CSCoverSheetViewController *)self _isShowingChargingModal]
    && self->_chargingViewController)
  {
    uint64_t v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Charging is in a stuck state. Clearing out everything.", v8, 2u);
    }

    [(BSAbsoluteMachTimer *)self->_chargingViewControllerTimer invalidate];
    id chargingViewTimerHandler = self->_chargingViewTimerHandler;
    self->_id chargingViewTimerHandler = 0;

    chargingViewControllerTimer = self->_chargingViewControllerTimer;
    self->_chargingViewControllerTimer = 0;

    chargingViewController = self->_chargingViewController;
    self->_chargingViewController = 0;

    BOOL v7 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    [(CSCoverSheetViewController *)self _dismissModalViewControllersWithIdentifier:v7 animated:0 completion:0];
  }
}

- (void)_updateDateSubtitleAppearanceForBattery:(BOOL)a3 animated:(BOOL)a4 chargingVisible:(BOOL)a5
{
  if (!a3)
  {
    BOOL v5 = a5;
    if ([(CSCoverSheetViewController *)self _isMainPageShowing])
    {
      if (v5)
      {
        double v7 = *MEMORY[0x1E4FA6F00];
        [(CSCoverSheetViewController *)self _showChargingSubtitleWithTimeout:v7];
      }
    }
  }
}

- (void)_showChargingSubtitleWithTimeout:(double)a3
{
  BOOL v5 = [(BCBatteryDeviceController *)self->_batteryDeviceController sb_deviceInternalBattery];
  uint64_t v6 = CSChargePercentageLabelForBattery(v5);

  [(SBFLockScreenDateViewController *)self->_dateViewController setCustomSubtitle:v6 withTimeout:a3];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__CSCoverSheetViewController__showChargingSubtitleWithTimeout___block_invoke;
  v15[3] = &unk_1E6AD92C8;
  objc_copyWeak(&v16, &location);
  double v7 = (void *)[v15 copy];
  id chargingViewTimerHandler = self->_chargingViewTimerHandler;
  self->_id chargingViewTimerHandler = v7;

  [(BSAbsoluteMachTimer *)self->_chargingViewControllerTimer invalidate];
  BOOL v9 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSCoverSheetViewController.chargingViewControllerTimer.subtitleOnly"];
  chargingViewControllerTimer = self->_chargingViewControllerTimer;
  self->_chargingViewControllerTimer = v9;

  uint64_t v11 = self->_chargingViewControllerTimer;
  uint64_t v12 = MEMORY[0x1E4F14428];
  id v13 = MEMORY[0x1E4F14428];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __63__CSCoverSheetViewController__showChargingSubtitleWithTimeout___block_invoke_2;
  v14[3] = &unk_1E6AD93B8;
  void v14[4] = self;
  [(BSAbsoluteMachTimer *)v11 scheduleWithFireInterval:v12 leewayInterval:v14 queue:a3 handler:a3 * 0.15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __63__CSCoverSheetViewController__showChargingSubtitleWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v4 = WeakRetained;
    [WeakRetained[167] invalidate];
    id v2 = v4[167];
    v4[167] = 0;

    id v3 = v4[168];
    v4[168] = 0;

    id WeakRetained = v4;
  }
}

uint64_t __63__CSCoverSheetViewController__showChargingSubtitleWithTimeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1344) + 16))();
}

- (void)_transitionChargingDateSubtitleToVisible:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  if (a5
    || ([(CSCoverSheetViewController *)self localAppearance],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v8 componentForType:1 identifier:@"ChargingView"],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = v9 == 0,
        v9,
        v8,
        ((v10 ^ v6) & 1) == 0))
  {
    if (v5)
    {
      uint64_t v11 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.4];
    }
    else
    {
      uint64_t v11 = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__CSCoverSheetViewController__transitionChargingDateSubtitleToVisible_animated_force___block_invoke;
    v12[3] = &unk_1E6AD9428;
    void v12[4] = self;
    id v13 = @"ChargingView";
    BOOL v14 = v6;
    [(CSCoverSheetViewController *)self _updateLocalAppearanceForRequester:@"ChargingView" animationSettings:v11 actions:v12 completion:0];
    if (v5) {
  }
    }
}

id __86__CSCoverSheetViewController__transitionChargingDateSubtitleToVisible_animated_force___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) localAppearance];
  [v2 removeAllComponentsWithIdentifier:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA5F50]);
    int v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1328), "sb_deviceInternalBattery");
    BOOL v5 = CSChargePercentageLabelForBattery(v4);
    uint64_t v6 = [v3 initWithString:v5 accessoryView:0];
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = *(void **)(v7 + 1632);
    *(void *)(v7 + 1632) = v6;

    BOOL v9 = +[CSComponent dateView];
    BOOL v10 = [v9 view:*(void *)(*(void *)(a1 + 32) + 1632)];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_isMainPageShowing
{
  if ([(CSCoverSheetViewController *)self _appearState] != 2) {
    return 0;
  }

  return [(CSCoverSheetViewController *)self isMainPageVisible];
}

- (void)_displayWillTurnOnWhileOnCoverSheet:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSCoverSheetViewController *)self coverSheetView];
  [v5 resetScrollViewToMainPageAnimated:0 withCompletion:0];

  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7A08]];
  uint64_t v8 = [v7 integerValue];

  self->_screenOnForLiftToWake = v8 == 20;
  [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"_displayWillTurnOnWhileOnCoverSheet"];
  self->_screenOnForLiftToWake = 0;
}

- (void)_liftToWakeGestureDetected
{
}

- (void)_managedConfigurationEffectiveSettingsDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CSCoverSheetViewController__managedConfigurationEffectiveSettingsDidChange___block_invoke;
  block[3] = &unk_1E6AD87F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__CSCoverSheetViewController__managedConfigurationEffectiveSettingsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = [MEMORY[0x1E4F74230] sharedConnection];
  if (([WeakRetained isSpotlightAllowed] & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1720);

    if (!v2) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1936));
    [WeakRetained dismissSpotlightAnimated:1];
  }
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v42 = 0;
  BOOL v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy_;
  double v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy_;
  id v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v11 = [v9 elements];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __71__CSCoverSheetViewController_publisher_didUpdateLayout_withTransition___block_invoke;
  v31[3] = &unk_1E6AD9450;
  void v31[4] = &v36;
  v31[5] = &v42;
  v31[6] = &v32;
  [v11 enumerateObjectsWithOptions:2 usingBlock:v31];

  uint64_t v12 = [(id)v37[5] identifier];
  uint64_t v13 = v43[5];
  if (v13) {
    BOOL v14 = v13 != v37[5];
  }
  else {
    BOOL v14 = 0;
  }
  if (*((unsigned char *)v33 + 24)) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = !self->_standByPresentedAboveCoverSheet;
  }
  [(CSCoverSheetViewController *)self _setHasContentAboveCoverSheet:v14 isSignificantUserInteraction:v15];
  self->_contentAboveIsControlCenter = [v12 isEqualToString:*MEMORY[0x1E4F62368]];
  if ([v12 isEqualToString:*MEMORY[0x1E4F62378]])
  {
    BOOL v16 = 1;
  }
  else if ([v12 isEqualToString:*MEMORY[0x1E4FA6F70]])
  {
    id v17 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    BOOL v16 = (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    BOOL v16 = 0;
  }
  BOOL v24 = v10;
  id v25 = v8;
  self->_contentAboveIsSiriOrNotFullScreenOniPad = v16;
  self->_standByPresentedAboveCoverSheet = *((unsigned char *)v33 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CSCoverSheetViewController_publisher_didUpdateLayout_withTransition___block_invoke_2;
  block[3] = &unk_1E6AD87F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v19 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        BOOL v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v23 coverSheetViewController:self didUpdateLayout:v9];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v48 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
}

void __71__CSCoverSheetViewController_publisher_didUpdateLayout_withTransition___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  if ([v14 layoutRole] != 6)
  {
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    if (!v9) {
      objc_storeStrong(v8, a2);
    }
    id v10 = [v14 identifier];
    uint64_t v11 = [v10 rangeOfString:*MEMORY[0x1E4F62370] options:1];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    }
    if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      uint64_t v12 = [v14 identifier];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4FA6F80]];

      if (v13) {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      }
    }
  }
  if (*(void *)(*(void *)(a1[5] + 8) + 40) && *(void *)(*(void *)(a1[4] + 8) + 40)) {
    *a4 = 1;
  }
}

uint64_t __71__CSCoverSheetViewController_publisher_didUpdateLayout_withTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateActiveBehaviorsForReason:@"CSCSVC – displayLayoutDidUpdateLayout"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateActiveAppearanceForReason:@"CSCSVC – displayLayoutDidUpdateLayout"];
}

- (void)_setHasContentAboveCoverSheet:(BOOL)a3
{
}

- (void)_setHasContentAboveCoverSheet:(BOOL)a3 isSignificantUserInteraction:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_hasContentAboveCoverSheet != a3)
  {
    BOOL v4 = a4;
    self->_uint64_t hasContentAboveCoverSheet = a3;
    uint64_t v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSStringFromBOOL();
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Display layout did change - has content above coversheet? %{public}@ [ isSignificantUserInteraction:%{BOOL}d ]", (uint8_t *)&v9, 0x12u);
    }
    if (self->_hasContentAboveCoverSheet)
    {
      [(CSCoverSheetViewController *)self _handleEventType:10];
      if (!v4) {
        return;
      }
    }
    else
    {
      [(CSCoverSheetViewController *)self _handleEventType:11];
      if (!v4) {
        return;
      }
    }
    id v8 = +[CSAction actionWithType:4];
    [(CSCoverSheetViewController *)self handleAction:v8 fromSender:self];
  }
}

- (void)_updateModalPresentationControllerVisibility
{
  BOOL v3 = [(CSPresentationViewController *)self->_modalPresentationController hasContent];

  [(CSCoverSheetViewController *)self _setModalPresentationControllerVisibility:v3];
}

- (void)_setModalPresentationControllerVisibility:(BOOL)a3
{
}

- (void)_setModalPresentationControllerVisibility:(BOOL)a3 cancelTouches:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  modalPresentationController = self->_modalPresentationController;
  if (a3)
  {
    BOOL v6 = a4;
    [(CSCoverSheetViewControllerBase *)self->_modalPresentationController setPresenter:self];
    uint64_t v7 = self->_modalPresentationController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__CSCoverSheetViewController__setModalPresentationControllerVisibility_cancelTouches___block_invoke;
    v19[3] = &unk_1E6AD8820;
    void v19[4] = self;
    if ([(CSCoverSheetViewController *)self bs_addChildViewController:v7 animated:0 transitionBlock:v19])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v13 coverSheetViewControllerDidPresentModalView:self];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v10);
      }

      if (v6) {
        BKSHIDServicesCancelTouchesOnMainDisplay();
      }
    }
  }
  else if (modalPresentationController)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    _DWORD v14[2] = __86__CSCoverSheetViewController__setModalPresentationControllerVisibility_cancelTouches___block_invoke_2;
    v14[3] = &unk_1E6AD8820;
    void v14[4] = self;
    [(CSCoverSheetViewController *)self bs_removeChildViewController:modalPresentationController animated:0 transitionBlock:v14];
    [(CSCoverSheetViewControllerBase *)self->_modalPresentationController setPresenter:0];
    [(CSCoverSheetViewController *)self _updateActiveBehaviorsForReason:@"DismissedModalPresentationController"];
    [(CSCoverSheetViewController *)self _updateActiveAppearanceForReason:@"DismissedModalPresentationController"];
  }
}

void __86__CSCoverSheetViewController__setModalPresentationControllerVisibility_cancelTouches___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  BOOL v6 = a2;
  BOOL v4 = [v3 coverSheetView];
  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 1248) view];
  [v4 setModalPresentationView:v5];

  v6[2]();
}

void __86__CSCoverSheetViewController__setModalPresentationControllerVisibility_cancelTouches___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v4 = a2;
  BOOL v3 = [v2 coverSheetView];
  [v3 setModalPresentationView:0];

  v4[2]();
}

- (BOOL)_isPresentingModalViewControllerWithIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v5 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) coverSheetIdentifier];
      char v11 = BSEqualStrings();

      if (v11) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = self->_pendingModalViewControllers;
  uint64_t v12 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
LABEL_11:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v5);
      }
      long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "coverSheetIdentifier", (void)v18);
      char v16 = BSEqualStrings();

      if (v16) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v12) = 1;
  }
LABEL_19:

  return v12;
}

- (id)_presentedModalViewControllerWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 coverSheetIdentifier];
        int v11 = BSEqualStrings();

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_presentModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)_presentModalViewController:(id)a3 shouldDismissOverlays:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = v11;
  if (v10)
  {
    long long v13 = [v10 appearanceIdentifier];
    int v14 = [v13 containsString:@"SBDashBoardEmergencyDialerViewController"];

    if (v14)
    {
      long long v15 = [(CSCoverSheetViewController *)self delegate];
      [v15 coverSheetViewController:self requestsTransientOverlaysDismissedAnimated:v7];
    }
    [(NSMutableSet *)self->_pendingModalViewControllers addObject:v10];
    long long v16 = +[CSAction actionWithType:3];
    [(CSCoverSheetViewController *)self handleAction:v16 fromSender:self];

    long long v17 = +[CSAction actionWithType:13 animated:v7];
    [(CSCoverSheetViewController *)self handleAction:v17 fromSender:self];

    -[CSCoverSheetViewController _setModalPresentationControllerVisibility:cancelTouches:](self, "_setModalPresentationControllerVisibility:cancelTouches:", 1, [v10 presentationCancelsTouches]);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    long long v25 = __100__CSCoverSheetViewController__presentModalViewController_shouldDismissOverlays_animated_completion___block_invoke;
    long long v26 = &unk_1E6AD94A0;
    long long v27 = self;
    BOOL v30 = v7;
    id v28 = v10;
    id v29 = v12;
    BOOL v31 = a4;
    uint64_t v18 = (void (**)(void))MEMORY[0x1D9487300](&v23);
    uint64_t v19 = [(CSCoverSheetViewController *)self overlayControllerIfExists];
    if (v19
      && (long long v20 = (void *)v19,
          [(CSCoverSheetViewController *)self overlayControllerIfExists],
          long long v21 = objc_claimAutoreleasedReturnValue(),
          [v21 presentationProgress],
          char IsZero = BSFloatIsZero(),
          v21,
          v20,
          (IsZero & 1) == 0))
    {
      [(CSCoverSheetViewController *)self deactivateTodayViewWithCompletion:v18];
    }
    else
    {
      v18[2](v18);
    }
  }
  else if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
  }
}

void __100__CSCoverSheetViewController__presentModalViewController_shouldDismissOverlays_animated_completion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 1248) hasContent];
  char v3 = v2 ^ 1;
  id v4 = [*(id *)(a1 + 32) pageViewControllerAtIndex:*(void *)(*(void *)(a1 + 32) + 1976)];
  if ((v2 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v4, 0, *(unsigned __int8 *)(a1 + 56));
  }
  BOOL v5 = [*(id *)(a1 + 32) modalPresentationController];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __100__CSCoverSheetViewController__presentModalViewController_shouldDismissOverlays_animated_completion___block_invoke_2;
  v9[3] = &unk_1E6AD9478;
  BOOL v7 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v12 = *(id *)(a1 + 48);
  char v13 = v3;
  id v8 = v4;
  id v11 = v8;
  [v5 presentContentViewController:v10 animated:v6 completion:v9];

  if (*(unsigned char *)(a1 + 57)) {
    [*(id *)(a1 + 32) dismissOverlaysAnimated:*(unsigned __int8 *)(a1 + 56)];
  }
}

uint64_t __100__CSCoverSheetViewController__presentModalViewController_shouldDismissOverlays_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 2112) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(unsigned char *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 32), "bs_endAppearanceTransitionForChildViewController:", *(void *)(a1 + 48));
  }
  char v3 = *(void **)(a1 + 32);

  return [v3 _handleEventType:40];
}

- (void)_dismissModalViewControllersWithIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v17 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v18 = (void (**)(void))a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [v14 coverSheetIdentifier];
        int v16 = BSEqualStrings();

        if (v16)
        {
          [(CSCoverSheetViewController *)self _dismissModalViewController:v14 animated:v17 completion:v18];
          char v11 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  if (v18 && (v11 & 1) == 0) {
    v18[2]();
  }
}

- (void)_dismissAllModalViewControllersExcept:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
  char v11 = (void *)[v10 mutableCopy];

  [v11 removeObject:v8];
  if ([v11 count])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F4F6B8];
    uint64_t v13 = [v11 count] + 1;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__CSCoverSheetViewController__dismissAllModalViewControllersExcept_animated_completion___block_invoke;
    v27[3] = &unk_1E6AD94C8;
    id v28 = v9;
    int v14 = [v12 sentinelWithSignalCount:v13 signalHandler:v27];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v11;
    uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          void v21[2] = __88__CSCoverSheetViewController__dismissAllModalViewControllersExcept_animated_completion___block_invoke_2;
          v21[3] = &unk_1E6AD88C0;
          void v21[4] = v19;
          id v22 = v14;
          [(CSCoverSheetViewController *)self _dismissModalViewController:v19 animated:v6 completion:v21];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v16);
    }

    [v14 signal];
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

void __88__CSCoverSheetViewController__dismissAllModalViewControllersExcept_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFailed])
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"some modal view controller dismissal did not call its completion block", 0);
  }
  else if ([v3 isComplete] && *(void *)(a1 + 32))
  {
    BSDispatchMain();
  }
}

void __88__CSCoverSheetViewController__dismissAllModalViewControllersExcept_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    [v6 noteDidDismissProgrammatically];
  }
  [*(id *)(a1 + 40) signal];
}

- (void)_dismissModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    [(NSMutableSet *)self->_pendingModalViewControllers removeObject:v8];
    char v11 = +[CSAction actionWithType:3];
    [(CSCoverSheetViewController *)self handleAction:v11 fromSender:self];

    uint64_t v12 = +[CSAction actionWithType:13 animated:v6];
    [(CSCoverSheetViewController *)self handleAction:v12 fromSender:self];

    uint64_t v13 = [(CSPresentationViewController *)self->_modalPresentationController presentedViewControllers];
    if ([v13 containsObject:v8])
    {
      int v14 = [(CSPresentationViewController *)self->_modalPresentationController contentViewControllers];
      BOOL v15 = [v14 count] == 1;
    }
    else
    {
      BOOL v15 = 0;
    }

    uint64_t v16 = [(CSCoverSheetViewController *)self pageViewControllerAtIndex:self->_lastSettledPageIndex];
    if (v15) {
      [(CSCoverSheetViewController *)self bs_beginAppearanceTransitionForChildViewController:v16 toVisible:1 animated:v6];
    }
    modalPresentationController = self->_modalPresentationController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__CSCoverSheetViewController__dismissModalViewController_animated_completion___block_invoke;
    v19[3] = &unk_1E6AD8E58;
    BOOL v22 = v15;
    void v19[4] = self;
    id v20 = v16;
    id v21 = v10;
    id v18 = v16;
    [(CSPresentationViewController *)modalPresentationController dismissContentViewController:v8 animated:v6 completion:v19];
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

uint64_t __78__CSCoverSheetViewController__dismissModalViewController_animated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 32), "bs_endAppearanceTransitionForChildViewController:", *(void *)(a1 + 40));
  }
  [*(id *)(a1 + 32) _updateModalPresentationControllerVisibility];
  [*(id *)(a1 + 32) _handleEventType:41];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_dismissToMainPageFromPageViewController:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 requestedDismissalType];
  if (v4 == 1)
  {
    BOOL v5 = [v7 requestedDismissalSettings];
    BOOL v6 = [(CSCoverSheetViewController *)self coverSheetView];
    [v6 resetScrollViewToMainPageAnimated:1 withAnimationSettings:v5 withCompletion:0];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    BOOL v5 = [(CSCoverSheetViewController *)self coverSheetView];
    [v5 resetScrollViewToMainPageAnimated:1 withCompletion:0];
  }

LABEL_6:
}

- (void)_migrateNotificationsToHistory
{
  id v2 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  [v2 migrateIncomingNotificationsToNotificationCenter];
}

- (void)_addOrRemoveThermalTrapViewIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SBFLockOutStatusProvider *)self->_lockOutController isThermallyBlocked] & 1) != 0
    || [(CSLockScreenSettings *)self->_prototypeSettings showThermalTrap])
  {
    BOOL v5 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    BOOL v6 = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v5];

    if (v6) {
      return;
    }
    id v7 = [CSTemperatureWarningViewController alloc];
    id v9 = [(CSCoverSheetContextProviding *)self->_coverSheetContext thermalStatusProvider];
    id v8 = -[CSTemperatureWarningViewController initWithThermalStatusProvider:](v7, "initWithThermalStatusProvider:");
    [(CSCoverSheetViewController *)self _presentModalViewController:v8 animated:v3 completion:0];
  }
  else
  {
    id v9 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    -[CSCoverSheetViewController _dismissModalViewControllersWithIdentifier:animated:completion:](self, "_dismissModalViewControllersWithIdentifier:animated:completion:");
  }
}

- (void)_addOrRemoveBlockedViewIfNecessaryAnimated:(BOOL)a3
{
  if ([(SBFLockOutStatusProvider *)self->_lockOutController isBlocked]
    && ![(SBFLockOutStatusProvider *)self->_lockOutController isThermallyBlocked]
    || [(CSLockScreenSettings *)self->_prototypeSettings showBlockedUI])
  {
    uint64_t v4 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    BOOL v5 = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v4];

    if (v5) {
      return;
    }
    BOOL v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext mediaController];
    [v6 stopMediaPlaybackForSource:1];

    id v7 = [[CSDeviceBlockViewController alloc] initWithDeviceBlockStatusProvider:self->_lockOutController];
    -[CSCoverSheetViewController _presentModalViewController:animated:completion:](self, "_presentModalViewController:animated:completion:");
  }
  else
  {
    id v7 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    -[CSCoverSheetViewController _dismissModalViewControllersWithIdentifier:animated:completion:](self, "_dismissModalViewControllersWithIdentifier:animated:completion:");
  }
}

- (void)_addOrRemoveResetRestoreViewIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(CSCoverSheetContextProviding *)self->_coverSheetContext resetRestoreStatusProvider];
  if (([v8 isRestoring] & 1) != 0
    || ([v8 isResetting] & 1) != 0
    || [(CSLockScreenSettings *)self->_prototypeSettings showResetRestore])
  {
    BOOL v5 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    BOOL v6 = [(CSCoverSheetViewController *)self _isPresentingModalViewControllerWithIdentifier:v5];

    if (v6) {
      goto LABEL_8;
    }
    id v7 = [[CSResetRestoreViewController alloc] initWithStatusProvider:v8];
    [(CSCoverSheetViewController *)self _presentModalViewController:v7 animated:v3 completion:0];
  }
  else
  {
    id v7 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
    [(CSCoverSheetViewController *)self _dismissModalViewControllersWithIdentifier:v7 animated:v3 completion:0];
  }

LABEL_8:
}

- (void)addApplicationHoster:(id)a3
{
}

- (void)removeApplicationHoster:(id)a3
{
}

- (void)dismissOverlaysAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(CSCoverSheetContextProviding *)self->_coverSheetContext dismissableOverlays];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) dismissOverlayForDashBoardAnimated:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_passcodeViewController
{
  BOOL v3 = +[CSCoverSheetViewControllerBase coverSheetIdentifier];
  uint64_t v4 = [(CSCoverSheetViewController *)self _presentedModalViewControllerWithIdentifier:v3];

  return v4;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (double)backlightLevel
{
  return self->_backlightLevel;
}

- (SBFLockScreenActionContext)_customLockScreenActionContext
{
  return self->_customLockScreenActionContext;
}

- (void)setCustomLockScreenActionContext:(id)a3
{
}

- (CSCoverSheetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSCoverSheetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasContentAboveCoverSheet
{
  return self->_hasContentAboveCoverSheet;
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (SBFScreenWakeAnimationTarget)legacyWallpaperWakeAnimator
{
  return self->_legacyWallpaperWakeAnimator;
}

- (CSCameraPrewarming)cameraPrewarmer
{
  return self->_cameraPrewarmer;
}

- (int64_t)effectiveInterfaceOrientationOverride
{
  return self->_effectiveInterfaceOrientationOverride;
}

- (CSAppearance)activeAppearance
{
  return self->_activeAppearance;
}

- (void)setActiveAppearance:(id)a3
{
}

- (CSBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (void)setActiveBehavior:(id)a3
{
}

- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext
{
  long long v3 = *(_OWORD *)&self[24].var1.var0.var1;
  *(_OWORD *)&retstr->double var0 = *(_OWORD *)&self[24].var0;
  *(_OWORD *)&retstr->var1.var0.$06DF839FA51B3C3CDB187C0923524556 var1 = v3;
  *(_OWORD *)&retstr->var1.var1.$06DF839FA51B3C3CDB187C0923524556 var1 = *(_OWORD *)&self[24].var1.var1.var1;
  return self;
}

- (CSNotificationDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);

  return (CSNotificationDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer
{
  return self->_irisWallpaperPlayer;
}

- (UIGestureRecognizer)wallpaperGestureRecognizer
{
  return self->_wallpaperGestureRecognizer;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  return (CSWallpaperColorProvider *)WeakRetained;
}

- (int)wakeSource
{
  return self->_wakeSource;
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (SBSpotlightTransientOverlayInteractiveGestureTransaction)spotlightInteractiveGestureTransaction
{
  return self->_spotlightInteractiveGestureTransaction;
}

- (void)setSpotlightInteractiveGestureTransaction:(id)a3
{
}

- (BOOL)partiallyOnScreen
{
  return self->_partiallyOnScreen;
}

- (BOOL)hidesDimmingLayer
{
  return self->_hidesDimmingLayer;
}

- (CSEmergencyCalling)emergencyCaller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyCaller);

  return (CSEmergencyCalling *)WeakRetained;
}

- (void)setEmergencyCaller:(id)a3
{
}

- (CSOrientationUpdateControlling)orientationUpdateController
{
  return self->_orientationUpdateController;
}

- (void)setOrientationUpdateController:(id)a3
{
}

- (CSIdleTimerControlling)idleTimerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerController);

  return (CSIdleTimerControlling *)WeakRetained;
}

- (void)setIdleTimerController:(id)a3
{
}

- (CSApplicationLaunching)applicationLauncher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationLauncher);

  return (CSApplicationLaunching *)WeakRetained;
}

- (void)setApplicationLauncher:(id)a3
{
}

- (CSCoverSheetSpotlightPresenting)coverSheetSpotlightPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetSpotlightPresenter);

  return (CSCoverSheetSpotlightPresenting *)WeakRetained;
}

- (void)setCoverSheetSpotlightPresenter:(id)a3
{
}

- (CSWidgetURLHandling)widgetURLHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetURLHandler);

  return (CSWidgetURLHandling *)WeakRetained;
}

- (void)setWidgetURLHandler:(id)a3
{
}

- (BOOL)isAccessoryAnimationPresenting
{
  return self->_isAccessoryAnimationPresenting;
}

- (BOOL)isFloatingLayerFullscreen
{
  return self->_floatingLayerFullscreen;
}

- (void)setFloatingLayerFullscreen:(BOOL)a3
{
  self->_floatingLayerFullscreen = a3;
}

- (BOOL)isDepthEffectEnabled
{
  return self->_depthEffectDisabled;
}

- (void)setDepthEffectDisabled:(BOOL)a3
{
  self->_depthEffectDisabled = a3;
}

- (NSArray)pageViewControllers
{
  return self->_pageViewControllers;
}

- (NSArray)_allowedPageViewControllers
{
  return self->_allowedPageViewControllers;
}

- (void)_setAllowedPageViewControllers:(id)a3
{
}

- (CSMainPageContentViewController)mainPageContentViewController
{
  return self->_mainPageContentViewController;
}

- (unint64_t)_lastSettledPageIndex
{
  return self->_lastSettledPageIndex;
}

- (CSMagSafeAccessoryStatusObserver)accessoryAttachmentObserver
{
  return self->_accessoryAttachmentObserver;
}

- (void)setAccessoryAttachmentObserver:(id)a3
{
}

- (CSBehavior)localBehavior
{
  return self->_localBehavior;
}

- (void)setLocalBehavior:(id)a3
{
}

- (CSBehavior)irisBehavior
{
  return self->_irisBehavior;
}

- (void)setIrisBehavior:(id)a3
{
}

- (CSAppearance)previousAppearance
{
  return self->_previousAppearance;
}

- (void)setPreviousAppearance:(id)a3
{
}

- (CSAppearance)localAppearance
{
  return self->_localAppearance;
}

- (void)setLocalAppearance:(id)a3
{
}

- (CSPresentation)activePresentation
{
  return self->_activePresentation;
}

- (void)setActivePresentation:(id)a3
{
}

- (SBFLockScreenDateViewController)dateViewController
{
  return self->_dateViewController;
}

- (void)setDateViewController:(id)a3
{
}

- (CSInlineWidgetContainerViewController)inlineComplicationContainerViewController
{
  return self->_inlineComplicationContainerViewController;
}

- (void)setInlineComplicationContainerViewController:(id)a3
{
}

- (CSInlineWidgetContainerViewController)landscapeInlineComplicationContainerViewController
{
  return self->_landscapeInlineComplicationContainerViewController;
}

- (void)setLandscapeInlineComplicationContainerViewController:(id)a3
{
}

- (CSWidgetGridViewController)complicationContainerViewController
{
  return self->_complicationContainerViewController;
}

- (void)setComplicationContainerViewController:(id)a3
{
}

- (CSWidgetGridViewController)sidebarComplicationContainerViewController
{
  return self->_sidebarComplicationContainerViewController;
}

- (void)setSidebarComplicationContainerViewController:(id)a3
{
}

- (CSPowerChangeObserver)powerChangeObserver
{
  return self->_powerChangeObserver;
}

- (void)setPowerChangeObserver:(id)a3
{
}

- (CSTimerViewController)timerViewController
{
  return self->_timerViewController;
}

- (void)setTimerViewController:(id)a3
{
}

- (CSLegibilityProviding)legibilityProvider
{
  return self->_legibilityProvider;
}

- (void)setLegibilityProvider:(id)a3
{
}

- (UIStatusBar)fakeStatusBar
{
  return self->_fakeStatusBar;
}

- (void)setFakeStatusBar:(id)a3
{
}

- (UIView)statusBarBackgroundView
{
  return self->_statusBarBackgroundView;
}

- (void)setStatusBarBackgroundView:(id)a3
{
}

- (BOOL)irisPlayerIsInteracting
{
  return self->_irisPlayerIsInteracting;
}

- (void)setIrisPlayerIsInteracting:(BOOL)a3
{
  self->_BOOL irisPlayerIsInteracting = a3;
}

- (BOOL)shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes
{
  return self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes;
}

- (void)setShouldTransitionIrisWallpaperToStillWhenPlaybackFinishes:(BOOL)a3
{
  self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes = a3;
}

- (CSModalPresentationViewController)modalPresentationController
{
  return self->_modalPresentationController;
}

- (void)setModalPresentationController:(id)a3
{
}

- (NSMutableSet)pendingModalViewControllers
{
  return self->_pendingModalViewControllers;
}

- (void)setPendingModalViewControllers:(id)a3
{
}

- (SBFLockOutStatusProvider)_lockOutController
{
  return self->_lockOutController;
}

- (void)_setLockOutController:(id)a3
{
}

- (CSCoverSheetViewTransitionSource)currentTransitionSource
{
  return self->_currentTransitionSource;
}

- (BOOL)hasPresentedForInterstitialTransitionSource
{
  return self->_hasPresentedForInterstitialTransitionSource;
}

- (void)setHasPresentedForInterstitialTransitionSource:(BOOL)a3
{
  self->_hasPresentedForInterstitialTransitionSource = a3;
}

- (CSInterstitialTransitionSource)interstitialTransitionSource
{
  return self->_interstitialTransitionSource;
}

- (CSPosterSwitcherTransitionSource)posterSwitcherTransitionSource
{
  return self->_posterSwitcherTransitionSource;
}

- (CSPosterSwitcherViewController)posterSwitcherViewController
{
  return self->_posterSwitcherViewController;
}

- (CSPosterSwitcherActivationManager)posterSwitcherActivationManager
{
  return self->_posterSwitcherActivationManager;
}

- (void)setPosterSwitcherActivationManager:(id)a3
{
}

- (void)setOverlayController:(id)a3
{
}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
}

- (double)initialOverlayPresentationProgress
{
  return self->_initialOverlayPresentationProgress;
}

- (void)setInitialOverlayPresentationProgress:(double)a3
{
  self->_initialOverlayPresentationProgress = a3;
}

- (BOOL)didDismissSinceScreenOn
{
  return self->_didDismissSinceScreenOn;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (BOOL)lockOrientationWhileTransitioning
{
  return self->_lockOrientationWhileTransitioning;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (BSUIVibrancyConfiguration)vibrancyConfigurationOverride
{
  return self->_vibrancyConfigurationOverride;
}

- (BSUIVibrancyConfiguration)effectiveVibrancyConfiguration
{
  return self->_effectiveVibrancyConfiguration;
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
}

- (SBFScreenWakeAnimationControlling)_screenWakeAnimationController
{
  return self->_screenWakeAnimationController;
}

- (void)_setScreenWakeAnimationController:(id)a3
{
}

- (SBWallpaperAggdLogger)wallpaperAggdLogger
{
  return self->_wallpaperAggdLogger;
}

- (void)setWallpaperAggdLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperAggdLogger, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_effectiveVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_vibrancyConfigurationOverride, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_posterSwitcherActivationManager, 0);
  objc_storeStrong((id *)&self->_posterSwitcherViewController, 0);
  objc_storeStrong((id *)&self->_posterSwitcherTransitionSource, 0);
  objc_storeStrong((id *)&self->_interstitialTransitionSource, 0);
  objc_storeStrong((id *)&self->_currentTransitionSource, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_pendingModalViewControllers, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_fakeStatusBar, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_storeStrong((id *)&self->_timerViewController, 0);
  objc_storeStrong((id *)&self->_powerChangeObserver, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_complicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_landscapeInlineComplicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_activePresentation, 0);
  objc_storeStrong((id *)&self->_localAppearance, 0);
  objc_storeStrong((id *)&self->_previousAppearance, 0);
  objc_storeStrong((id *)&self->_irisBehavior, 0);
  objc_storeStrong((id *)&self->_localBehavior, 0);
  objc_storeStrong((id *)&self->_accessoryAttachmentObserver, 0);
  objc_storeStrong((id *)&self->_mainPageContentViewController, 0);
  objc_storeStrong((id *)&self->_allowedPageViewControllers, 0);
  objc_storeStrong((id *)&self->_pageViewControllers, 0);
  objc_destroyWeak((id *)&self->_widgetURLHandler);
  objc_destroyWeak((id *)&self->_coverSheetSpotlightPresenter);
  objc_destroyWeak((id *)&self->_applicationLauncher);
  objc_destroyWeak((id *)&self->_idleTimerController);
  objc_storeStrong((id *)&self->_orientationUpdateController, 0);
  objc_destroyWeak((id *)&self->_emergencyCaller);
  objc_storeStrong((id *)&self->_spotlightInteractiveGestureTransaction, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_storeStrong((id *)&self->_irisWallpaperPlayer, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong((id *)&self->_activeBehavior, 0);
  objc_storeStrong((id *)&self->_activeAppearance, 0);
  objc_storeStrong((id *)&self->_cameraPrewarmer, 0);
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customLockScreenActionContext, 0);
  objc_storeStrong((id *)&self->_inhibitCaptureButtonActionAssertion, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorSubscription, 0);
  objc_storeStrong((id *)&self->_posterLandscapeDescriptor, 0);
  objc_storeStrong((id *)&self->_posterPortraitDescriptor, 0);
  objc_storeStrong((id *)&self->_appearanceResolver, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_spotlightModalViewController, 0);
  objc_storeStrong((id *)&self->_phoneUnlockWithWatchController, 0);
  objc_storeStrong((id *)&self->_defaultsDerivedOverrideDate, 0);
  objc_storeStrong((id *)&self->_backgroundContentViewController, 0);
  objc_storeStrong((id *)&self->_backgroundContentActionManager, 0);
  objc_storeStrong((id *)&self->_backgroundPresentationManager, 0);
  objc_storeStrong((id *)&self->_currentCoachingString, 0);
  objc_storeStrong((id *)&self->_faceOcclusionMonitor, 0);
  objc_storeStrong((id *)&self->_userPresenceMonitor, 0);
  objc_storeStrong((id *)&self->_chargingLabel, 0);
  objc_storeStrong((id *)&self->_embeddedContentActionManager, 0);
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_remoteOverrideNotificationDisplayStyleAssertion, 0);
  objc_storeStrong((id *)&self->_remoteContentInlineProvidingManagers, 0);
  objc_storeStrong((id *)&self->_remoteContentInlineViewController, 0);
  objc_storeStrong((id *)&self->_remoteContentModalViewController, 0);
  objc_storeStrong((id *)&self->_remoteContentSessionManager, 0);
  objc_storeStrong((id *)&self->_legacyWallpaperWakeAnimator, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_notificationClearingTrigger, 0);
  objc_storeStrong((id *)&self->_floatingLayerView, 0);
  objc_storeStrong((id *)&self->_posterSwitcherFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_complicationSelectionRecognizer, 0);
  objc_storeStrong((id *)&self->_posterSwitcherGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_wallpaperGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backgroundContentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_quickNoteGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollGestureController, 0);
  objc_storeStrong((id *)&self->_quickActionsViewController, 0);
  objc_storeStrong((id *)&self->_teachableMomentsContainerViewController, 0);
  objc_storeStrong((id *)&self->_poseidonViewController, 0);
  objc_storeStrong((id *)&self->_proudLockViewController, 0);
  objc_storeStrong((id *)&self->_fixedFooterViewController, 0);
  objc_storeStrong((id *)&self->_cachedBatteryDevices, 0);
  objc_storeStrong(&self->_chargingViewTimerHandler, 0);
  objc_storeStrong((id *)&self->_chargingViewControllerTimer, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_chargingViewController, 0);
  objc_storeStrong((id *)&self->_attachedAccessories, 0);
  objc_storeStrong(&self->_accessoryViewControllerChargingTimerHandler, 0);
  objc_storeStrong((id *)&self->_accessoryViewControllerChargingTimer, 0);
  objc_storeStrong(&self->_accessoryViewControllerTimerHandler, 0);
  objc_storeStrong((id *)&self->_accessoryViewControllerTimer, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationController, 0);
  objc_destroyWeak((id *)&self->_homeButtonSuppressAfterUnlockRecognizer);
  objc_storeStrong((id *)&self->_homeButtonShowPasscodeRecognizer, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_notificationDispatcher, 0);
  objc_storeStrong((id *)&self->_applicationHosters, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_externalLockProviders, 0);
  objc_storeStrong((id *)&self->_externalPresentationProviders, 0);
  objc_storeStrong((id *)&self->_externalEventHandlers, 0);
  objc_storeStrong((id *)&self->_externalBehaviorProviders, 0);
  objc_storeStrong((id *)&self->_externalAppearanceProviders, 0);
  objc_storeStrong((id *)&self->_exemptFromInactiveAppearanceParticipants, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);

  objc_storeStrong((id *)&self->_coverSheetContext, 0);
}

- (void)_preferredContentSizeDidChange
{
  long long v3 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  self->_wantsAccessibilityContentSizes = UIContentSizeCategoryIsAccessibilityCategory(v3);

  self->_needsAccessibilityContentSizesUpdate = self->_wantsAccessibilityContentSizes;
}

- (void)_updateAccessibilityContentSizesIfNeeded
{
  if (self->_wantsAccessibilityContentSizes && self->_needsAccessibilityContentSizesUpdate)
  {
    [MEMORY[0x1E4FA5F58] timeFontMetrics];
    self->_accessibilityTimeLabelBaselineY = v3 + 95.0;
    [MEMORY[0x1E4FA5F50] labelFontMetrics];
    self->_accessibilityTimeSubtitleBaselineY = v4;
    self->_needsAccessibilityContentSizesUpdate = 0;
  }
}

- (double)timeLabelBaselineY
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 1) <= 1)
    {
      [getCSProminentLayoutControllerClass() frameForElements:1 variant:1 forcePortraitBounds:1];
      CGRectGetMaxY(v312);
      SBFMainScreenScale();
      BSFloatRoundForScale();
LABEL_608:
      SBFMainScreenScale();
      BSFloatRoundForScale();
      return result;
    }
    int v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_DWORD *)v309 = 0;
        *(_DWORD *)&v309[40] = 0;
        goto LABEL_33;
      }
    }
    else
    {
      v288 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v288 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)v309 = 0;
        *(_DWORD *)&v309[40] = 1;
        goto LABEL_33;
      }
    }
    *(_DWORD *)&v309[40] = v13 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v16 = __sb__runningInSpringBoard();
      if (v16)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v276 = [MEMORY[0x1E4F42D90] mainScreen];
        [v276 _referenceBounds];
      }
      BSSizeRoundForScale();
      *(_DWORD *)v309 = v16 ^ 1;
      if (v51 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v50 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        int v28 = 0;
        int v29 = 0;
        int v30 = 0;
        int v31 = 0;
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        uint64_t v296 = 0;
        uint64_t v300 = 0;
        uint64_t v304 = 0;
        memset(v308, 0, sizeof(v308));
        memset(&v309[4], 0, 36);
        uint64_t v310 = 0;
        goto LABEL_131;
      }
    }
    else
    {
      *(_DWORD *)v309 = 0;
    }
LABEL_33:
    int v19 = __sb__runningInSpringBoard();
    if (v19)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v310 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      v284 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v284 userInterfaceIdiom] != 1)
      {
        uint64_t v310 = 1;
        goto LABEL_42;
      }
    }
    LODWORD(v310) = v19 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v16 = __sb__runningInSpringBoard();
      if (v16)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v292 = [MEMORY[0x1E4F42D90] mainScreen];
        [v292 _referenceBounds];
      }
      BSSizeRoundForScale();
      HIDWORD(v310) = v16 ^ 1;
      if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        int v28 = 0;
        int v29 = 0;
        int v30 = 0;
        int v31 = 0;
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        uint64_t v296 = 0;
        uint64_t v300 = 0;
        uint64_t v304 = 0;
        memset(v308, 0, sizeof(v308));
        memset(&v309[4], 0, 36);
        goto LABEL_131;
      }
    }
    else
    {
      HIDWORD(v310) = 0;
    }
LABEL_42:
    int v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_DWORD *)&v309[4] = 0;
        *(_DWORD *)&v309[36] = 0;
        goto LABEL_51;
      }
    }
    else
    {
      v283 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v283 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[4] = 0;
        *(_DWORD *)&v309[36] = 1;
        goto LABEL_51;
      }
    }
    *(_DWORD *)&v309[36] = v20 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v16 = __sb__runningInSpringBoard();
      if (v16)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v275 = [MEMORY[0x1E4F42D90] mainScreen];
        [v275 _referenceBounds];
      }
      *(_DWORD *)&v309[4] = v16 ^ 1;
      BSSizeRoundForScale();
      if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        int v28 = 0;
        int v29 = 0;
        int v30 = 0;
        int v31 = 0;
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        uint64_t v296 = 0;
        uint64_t v300 = 0;
        uint64_t v304 = 0;
        memset(v308, 0, sizeof(v308));
        memset(&v309[8], 0, 28);
        goto LABEL_131;
      }
    }
    else
    {
      *(_DWORD *)&v309[4] = 0;
    }
LABEL_51:
    int v21 = __sb__runningInSpringBoard();
    if (v21)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[28] = 0;
        goto LABEL_77;
      }
    }
    else
    {
      v282 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v282 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[28] = 0;
        *(_DWORD *)&v309[32] = 1;
        goto LABEL_77;
      }
    }
    *(_DWORD *)&v309[32] = v21 ^ 1;
    uint64_t v16 = __sb__runningInSpringBoard();
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v279 = [MEMORY[0x1E4F42D90] mainScreen];
      [v279 _referenceBounds];
    }
    *(_DWORD *)&v309[28] = v16 ^ 1;
    BSSizeRoundForScale();
    if (v26 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      int v28 = 0;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      uint64_t v296 = 0;
      uint64_t v300 = 0;
      uint64_t v304 = 0;
      memset(v308, 0, sizeof(v308));
      memset(&v309[8], 0, 20);
      goto LABEL_131;
    }
LABEL_77:
    int v27 = __sb__runningInSpringBoard();
    if (v27)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[20] = 0;
        goto LABEL_104;
      }
    }
    else
    {
      v281 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v281 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[20] = 0;
        *(_DWORD *)&v309[24] = 1;
        goto LABEL_104;
      }
    }
    *(_DWORD *)&v309[24] = v27 ^ 1;
    uint64_t v16 = __sb__runningInSpringBoard();
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v277 = [MEMORY[0x1E4F42D90] mainScreen];
      [v277 _referenceBounds];
    }
    *(_DWORD *)&v309[20] = v16 ^ 1;
    BSSizeRoundForScale();
    if (v40 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      int v28 = 0;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      uint64_t v296 = 0;
      uint64_t v300 = 0;
      uint64_t v304 = 0;
      memset(v308, 0, sizeof(v308));
      *(void *)&v309[8] = 0;
      *(_DWORD *)&v309[16] = 0;
      goto LABEL_131;
    }
LABEL_104:
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[12] = 0;
        goto LABEL_241;
      }
    }
    else
    {
      v280 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v280 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[12] = 0;
        *(_DWORD *)&v309[16] = 1;
        goto LABEL_241;
      }
    }
    *(_DWORD *)&v309[16] = v41 ^ 1;
    uint64_t v16 = __sb__runningInSpringBoard();
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v274 = [MEMORY[0x1E4F42D90] mainScreen];
      [v274 _referenceBounds];
    }
    *(_DWORD *)&v309[12] = v16 ^ 1;
    BSSizeRoundForScale();
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      int v28 = 0;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      uint64_t v296 = 0;
      uint64_t v300 = 0;
      uint64_t v304 = 0;
      memset(v308, 0, sizeof(v308));
      *(_DWORD *)&v309[8] = 0;
      goto LABEL_131;
    }
LABEL_241:
    uint64_t v16 = __sb__runningInSpringBoard();
    if (v16)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_243;
      }
    }
    else
    {
      v278 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v278 userInterfaceIdiom] != 1)
      {
LABEL_243:
        *(_DWORD *)&v309[8] = v16 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_247:
          *(_DWORD *)&v308[96] = 0;
          *(_DWORD *)&v308[88] = 0;
          goto LABEL_756;
        }
        int v56 = __sb__runningInSpringBoard();
        if (v56)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_247;
          }
        }
        else
        {
          v272 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v272 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[96] = 0;
            *(_DWORD *)&v308[88] = 1;
            goto LABEL_756;
          }
        }
        *(_DWORD *)&v308[88] = v56 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v265 = [MEMORY[0x1E4F42D90] mainScreen];
            [v265 _referenceBounds];
          }
          *(_DWORD *)&v308[96] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v115 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            uint64_t v304 = 0;
            memset(v308, 0, 88);
            *(_DWORD *)&v308[92] = 0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v308[96] = 0;
        }
LABEL_756:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[80] = 0;
            goto LABEL_766;
          }
        }
        else
        {
          v273 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v273 userInterfaceIdiom])
          {
            *(void *)&v308[80] = 0x100000000;
            goto LABEL_766;
          }
        }
        *(_DWORD *)&v308[84] = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v268 = [MEMORY[0x1E4F42D90] mainScreen];
            [v268 _referenceBounds];
          }
          *(_DWORD *)&v308[80] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v111 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_770;
          }
        }
        else
        {
          *(_DWORD *)&v308[80] = 0;
        }
LABEL_766:
        if (_SBF_Private_IsD94Like())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          uint64_t v300 = 0;
          uint64_t v304 = 0;
          memset(v308, 0, 80);
          *(_DWORD *)&v308[92] = 0;
          goto LABEL_131;
        }
LABEL_770:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_774:
          *(_DWORD *)&v308[76] = 0;
          *(_DWORD *)&v308[92] = 0;
          goto LABEL_816;
        }
        int v112 = __sb__runningInSpringBoard();
        if (v112)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_774;
          }
        }
        else
        {
          v269 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v269 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[76] = 0;
            *(_DWORD *)&v308[92] = 1;
            goto LABEL_816;
          }
        }
        *(_DWORD *)&v308[92] = v112 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v260 = [MEMORY[0x1E4F42D90] mainScreen];
            [v260 _referenceBounds];
          }
          *(_DWORD *)&v308[76] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v127 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            uint64_t v304 = 0;
            memset(v308, 0, 76);
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v308[76] = 0;
        }
LABEL_816:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[60] = 0;
            *(_DWORD *)&v308[72] = 0;
            goto LABEL_826;
          }
        }
        else
        {
          v271 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v271 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[60] = 0;
            *(_DWORD *)&v308[72] = 1;
            goto LABEL_826;
          }
        }
        *(_DWORD *)&v308[72] = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v264 = [MEMORY[0x1E4F42D90] mainScreen];
            [v264 _referenceBounds];
          }
          *(_DWORD *)&v308[60] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v117 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_830;
          }
        }
        else
        {
          *(_DWORD *)&v308[60] = 0;
        }
LABEL_826:
        if (_SBF_Private_IsD64Like())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          uint64_t v300 = 0;
          uint64_t v304 = 0;
          memset(v308, 0, 60);
          *(void *)&v308[64] = 0;
          goto LABEL_131;
        }
LABEL_830:
        int v118 = __sb__runningInSpringBoard();
        if (v118)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[64] = 0;
            goto LABEL_840;
          }
        }
        else
        {
          v270 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v270 userInterfaceIdiom])
          {
            *(void *)&v308[64] = 0x100000000;
            goto LABEL_840;
          }
        }
        *(_DWORD *)&v308[68] = v118 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v261 = [MEMORY[0x1E4F42D90] mainScreen];
            [v261 _referenceBounds];
          }
          *(_DWORD *)&v308[64] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            uint64_t v304 = 0;
            memset(v308, 0, 60);
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v308[64] = 0;
        }
LABEL_840:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[52] = 0;
            goto LABEL_850;
          }
        }
        else
        {
          v267 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v267 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[52] = 0;
            *(_DWORD *)&v308[56] = 1;
            goto LABEL_850;
          }
        }
        *(_DWORD *)&v308[56] = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v259 = [MEMORY[0x1E4F42D90] mainScreen];
            [v259 _referenceBounds];
          }
          *(_DWORD *)&v308[52] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_950;
          }
        }
        else
        {
          *(_DWORD *)&v308[52] = 0;
        }
LABEL_850:
        if (_SBF_Private_IsD54())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          uint64_t v300 = 0;
          uint64_t v304 = 0;
          memset(v308, 0, 52);
          goto LABEL_131;
        }
LABEL_950:
        int v129 = __sb__runningInSpringBoard();
        if (v129)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[44] = 0;
            goto LABEL_966;
          }
        }
        else
        {
          v266 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v266 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[44] = 0;
            *(_DWORD *)&v308[48] = 1;
            goto LABEL_966;
          }
        }
        *(_DWORD *)&v308[48] = v129 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v256 = [MEMORY[0x1E4F42D90] mainScreen];
            [v256 _referenceBounds];
          }
          BSSizeRoundForScale();
          *(_DWORD *)&v308[44] = v16 ^ 1;
          if (v142 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            uint64_t v304 = 0;
            memset(v308, 0, 44);
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v308[44] = 0;
        }
LABEL_966:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[36] = 0;
            goto LABEL_990;
          }
        }
        else
        {
          v263 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v263 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[36] = 0;
            *(_DWORD *)&v308[40] = 1;
            goto LABEL_990;
          }
        }
        *(_DWORD *)&v308[40] = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v255 = [MEMORY[0x1E4F42D90] mainScreen];
            [v255 _referenceBounds];
          }
          *(_DWORD *)&v308[36] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v143 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1096;
          }
        }
        else
        {
          *(_DWORD *)&v308[36] = 0;
        }
LABEL_990:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          uint64_t v300 = 0;
          uint64_t v304 = 0;
          memset(v308, 0, 36);
          goto LABEL_131;
        }
LABEL_1096:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_1100:
          *(void *)&v308[16] = 0;
          goto LABEL_1168;
        }
        int v144 = __sb__runningInSpringBoard();
        if (v144)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1100;
          }
        }
        else
        {
          v258 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v258 userInterfaceIdiom])
          {
            *(void *)&v308[16] = 0x100000000;
            goto LABEL_1168;
          }
        }
        *(_DWORD *)&v308[20] = v144 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v249 = [MEMORY[0x1E4F42D90] mainScreen];
            [v249 _referenceBounds];
          }
          *(_DWORD *)&v308[16] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v162 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            uint64_t v304 = 0;
            *(void *)&v308[24] = 0;
            *(_OWORD *)v308 = 0uLL;
            *(_DWORD *)&v308[32] = 0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v308[16] = 0;
        }
LABEL_1168:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[12] = 0;
            *(_DWORD *)&v308[32] = 0;
            goto LABEL_1178;
          }
        }
        else
        {
          v262 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v262 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[12] = 0;
            *(_DWORD *)&v308[32] = 1;
            goto LABEL_1178;
          }
        }
        *(_DWORD *)&v308[32] = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v252 = [MEMORY[0x1E4F42D90] mainScreen];
            [v252 _referenceBounds];
          }
          *(_DWORD *)&v308[12] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v156 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_1182;
          }
        }
        else
        {
          *(_DWORD *)&v308[12] = 0;
        }
LABEL_1178:
        if (_SBF_Private_IsD93Like())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          uint64_t v300 = 0;
          uint64_t v304 = 0;
          *(void *)&v308[24] = 0;
          *(void *)v308 = 0;
          *(_DWORD *)&v308[8] = 0;
          goto LABEL_131;
        }
LABEL_1182:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_1186:
          *(void *)&v308[4] = 0;
          goto LABEL_1264;
        }
        int v157 = __sb__runningInSpringBoard();
        if (v157)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1186;
          }
        }
        else
        {
          v253 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v253 userInterfaceIdiom])
          {
            *(void *)&v308[4] = 0x100000000;
            goto LABEL_1264;
          }
        }
        *(_DWORD *)&v308[8] = v157 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v245 = [MEMORY[0x1E4F42D90] mainScreen];
            [v245 _referenceBounds];
          }
          *(_DWORD *)&v308[4] = v16 ^ 1;
          BSSizeRoundForScale();
          if (v177 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            uint64_t v304 = 0;
            *(void *)&v308[24] = 0;
            *(_DWORD *)v308 = 0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v308[4] = 0;
        }
LABEL_1264:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v308 = 0;
            *(_DWORD *)&v308[28] = 0;
            goto LABEL_1274;
          }
        }
        else
        {
          v257 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v257 userInterfaceIdiom])
          {
            *(_DWORD *)v308 = 0;
            *(_DWORD *)&v308[28] = 1;
            goto LABEL_1274;
          }
        }
        *(_DWORD *)&v308[28] = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v248 = [MEMORY[0x1E4F42D90] mainScreen];
            [v248 _referenceBounds];
          }
          *(_DWORD *)v308 = v16 ^ 1;
          BSSizeRoundForScale();
          if (v168 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1278;
          }
        }
        else
        {
          *(_DWORD *)v308 = 0;
        }
LABEL_1274:
        if (_SBF_Private_IsD63Like())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          uint64_t v300 = 0;
          uint64_t v304 = 0;
          *(_DWORD *)&v308[24] = 0;
          goto LABEL_131;
        }
LABEL_1278:
        int v169 = __sb__runningInSpringBoard();
        if (v169)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v304) = 0;
            *(_DWORD *)&v308[24] = 0;
            goto LABEL_1288;
          }
        }
        else
        {
          v254 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v254 userInterfaceIdiom])
          {
            HIDWORD(v304) = 0;
            *(_DWORD *)&v308[24] = 1;
            goto LABEL_1288;
          }
        }
        *(_DWORD *)&v308[24] = v169 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v246 = [MEMORY[0x1E4F42D90] mainScreen];
            [v246 _referenceBounds];
          }
          HIDWORD(v304) = v16 ^ 1;
          BSSizeRoundForScale();
          if (v172 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            uint64_t v296 = 0;
            uint64_t v300 = 0;
            LODWORD(v304) = 0;
            goto LABEL_131;
          }
        }
        else
        {
          HIDWORD(v304) = 0;
        }
LABEL_1288:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v300) = 0;
            LODWORD(v304) = 0;
            goto LABEL_1298;
          }
        }
        else
        {
          v251 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v251 userInterfaceIdiom])
          {
            HIDWORD(v300) = 0;
            LODWORD(v304) = 1;
            goto LABEL_1298;
          }
        }
        LODWORD(v304) = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v244 = [MEMORY[0x1E4F42D90] mainScreen];
            [v244 _referenceBounds];
          }
          HIDWORD(v300) = v16 ^ 1;
          BSSizeRoundForScale();
          if (v178 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1398;
          }
        }
        else
        {
          HIDWORD(v300) = 0;
        }
LABEL_1298:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          uint64_t v296 = 0;
          LODWORD(v300) = 0;
          goto LABEL_131;
        }
LABEL_1398:
        int v179 = __sb__runningInSpringBoard();
        if (v179)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v296) = 0;
            LODWORD(v300) = 0;
            goto LABEL_1414;
          }
        }
        else
        {
          v250 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v250 userInterfaceIdiom])
          {
            HIDWORD(v296) = 0;
            LODWORD(v300) = 1;
            goto LABEL_1414;
          }
        }
        LODWORD(v300) = v179 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v243 = [MEMORY[0x1E4F42D90] mainScreen];
            [v243 _referenceBounds];
          }
          HIDWORD(v296) = v16 ^ 1;
          BSSizeRoundForScale();
          if (v190 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            LODWORD(v296) = 0;
            goto LABEL_131;
          }
        }
        else
        {
          HIDWORD(v296) = 0;
        }
LABEL_1414:
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v36 = 0;
            LODWORD(v296) = 0;
            goto LABEL_1438;
          }
        }
        else
        {
          v247 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v247 userInterfaceIdiom])
          {
            int v36 = 0;
            LODWORD(v296) = 1;
            goto LABEL_1438;
          }
        }
        LODWORD(v296) = v16 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v242 = [MEMORY[0x1E4F42D90] mainScreen];
            [v242 _referenceBounds];
          }
          int v36 = v16 ^ 1;
          BSSizeRoundForScale();
          if (v191 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1541;
          }
        }
        else
        {
          int v36 = 0;
        }
LABEL_1438:
        if (_SBF_Private_IsD53())
        {
LABEL_1543:
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          goto LABEL_131;
        }
LABEL_1541:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0
          || (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          goto LABEL_1543;
        }
        int v202 = __sb__runningInSpringBoard();
        if (v202)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v34 = 0;
            int v35 = 0;
            goto LABEL_1675;
          }
        }
        else
        {
          v241 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v241 userInterfaceIdiom])
          {
            int v34 = 0;
            int v35 = 1;
            goto LABEL_1675;
          }
        }
        int v35 = v202 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v236 = [MEMORY[0x1E4F42D90] mainScreen];
            [v236 _referenceBounds];
          }
          int v34 = v16 ^ 1;
          BSSizeRoundForScale();
          if (v214 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            goto LABEL_131;
          }
        }
        else
        {
          int v34 = 0;
        }
LABEL_1675:
        int v210 = __sb__runningInSpringBoard();
        if (v210)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v32 = 0;
            int v33 = 0;
            goto LABEL_1689;
          }
        }
        else
        {
          v240 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v240 userInterfaceIdiom])
          {
            int v32 = 0;
            int v33 = 1;
            goto LABEL_1689;
          }
        }
        int v33 = v210 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v16 = __sb__runningInSpringBoard();
          if (v16)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v235 = [MEMORY[0x1E4F42D90] mainScreen];
            [v235 _referenceBounds];
          }
          int v32 = v16 ^ 1;
          BSSizeRoundForScale();
          if (v216 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v28 = 0;
            int v29 = 0;
            int v30 = 0;
            int v31 = 0;
            goto LABEL_131;
          }
        }
        else
        {
          int v32 = 0;
        }
LABEL_1689:
        int v211 = __sb__runningInSpringBoard();
        if (v211)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v30 = 0;
            int v31 = 0;
LABEL_1709:
            uint64_t v16 = __sb__runningInSpringBoard();
            if (v16)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v28 = 0;
                int v29 = 0;
                goto LABEL_131;
              }
            }
            else
            {
              v238 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v238 userInterfaceIdiom])
              {
                int v28 = 0;
                int v29 = 1;
                goto LABEL_131;
              }
            }
            int v29 = v16 ^ 1;
            int v218 = __sb__runningInSpringBoard();
            if (v218)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v16 = [MEMORY[0x1E4F42D90] mainScreen];
              [(id)v16 _referenceBounds];
            }
            int v28 = v218 ^ 1;
            BSSizeRoundForScale();
LABEL_131:
            if (v28) {

            }
            if (v29) {
            if (v30)
            }
            {

              if (!v31) {
                goto LABEL_137;
              }
            }
            else if (!v31)
            {
LABEL_137:
              if (v32) {
                goto LABEL_138;
              }
              goto LABEL_233;
            }

            if (v32)
            {
LABEL_138:

              if (!v33) {
                goto LABEL_139;
              }
              goto LABEL_234;
            }
LABEL_233:
            if (!v33)
            {
LABEL_139:
              if (v34) {
                goto LABEL_140;
              }
              goto LABEL_235;
            }
LABEL_234:

            if (v34)
            {
LABEL_140:

              if (!v35) {
                goto LABEL_141;
              }
              goto LABEL_236;
            }
LABEL_235:
            if (!v35)
            {
LABEL_141:
              if (!v36)
              {
LABEL_143:
                if (v296) {

                }
                if (HIDWORD(v296)) {
                if (v300)
                }

                if (HIDWORD(v300)) {
                if (v304)
                }

                if (HIDWORD(v304)) {
                if (*(_DWORD *)&v308[24])
                }

                if (*(_DWORD *)v308) {
                if (*(_DWORD *)&v308[28])
                }

                if (*(_DWORD *)&v308[4]) {
                if (*(_DWORD *)&v308[8])
                }

                if (*(_DWORD *)&v308[12]) {
                if (*(_DWORD *)&v308[32])
                }

                if (*(_DWORD *)&v308[16]) {
                if (*(_DWORD *)&v308[20])
                }

                if (*(_DWORD *)&v308[36]) {
                if (*(_DWORD *)&v308[40])
                }

                if (*(_DWORD *)&v308[44]) {
                if (*(_DWORD *)&v308[48])
                }

                if (*(_DWORD *)&v308[52]) {
                if (*(_DWORD *)&v308[56])
                }

                if (*(_DWORD *)&v308[64]) {
                if (*(_DWORD *)&v308[68])
                }

                if (*(_DWORD *)&v308[60]) {
                if (*(_DWORD *)&v308[72])
                }

                if (*(_DWORD *)&v308[76]) {
                if (*(_DWORD *)&v308[92])
                }

                if (*(_DWORD *)&v308[80]) {
                if (*(_DWORD *)&v308[84])
                }

                if (*(_DWORD *)&v308[96]) {
                if (*(_DWORD *)&v308[88])
                }

                if (*(_DWORD *)&v309[8]) {
                if (*(_DWORD *)&v309[12])
                }

                if (*(_DWORD *)&v309[16]) {
                if (*(_DWORD *)&v309[20])
                }

                if (*(_DWORD *)&v309[24]) {
                if (*(_DWORD *)&v309[28])
                }

                if (*(_DWORD *)&v309[32]) {
                if (*(_DWORD *)&v309[4])
                }

                if (*(_DWORD *)&v309[36]) {
                if (HIDWORD(v310))
                }

                if (v310) {
                if (*(_DWORD *)v309)
                }

                if (!*(_DWORD *)&v309[40]) {
                  goto LABEL_608;
                }
                BOOL v54 = v288;
                goto LABEL_607;
              }
LABEL_142:

              goto LABEL_143;
            }
LABEL_236:

            if (!v36) {
              goto LABEL_143;
            }
            goto LABEL_142;
          }
        }
        else
        {
          v239 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v239 userInterfaceIdiom])
          {
            int v30 = 0;
            int v31 = 1;
            goto LABEL_1709;
          }
        }
        int v31 = v211 ^ 1;
        uint64_t v16 = __sb__runningInSpringBoard();
        if (v16)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          v237 = [MEMORY[0x1E4F42D90] mainScreen];
          [v237 _referenceBounds];
        }
        int v30 = v16 ^ 1;
        BSSizeRoundForScale();
        if (v213 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v28 = 0;
          int v29 = 0;
          goto LABEL_131;
        }
        goto LABEL_1709;
      }
    }
    int v28 = 0;
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    uint64_t v296 = 0;
    uint64_t v300 = 0;
    uint64_t v304 = 0;
    memset(v308, 0, sizeof(v308));
    *(_DWORD *)&v309[8] = v16 ^ 1;
    goto LABEL_131;
  }
  if (self->_wantsAccessibilityContentSizes)
  {
    [(CSCoverSheetViewController *)self _updateAccessibilityContentSizesIfNeeded];
    goto LABEL_608;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_9;
    }
LABEL_17:
    int v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v310 = 0;
        goto LABEL_67;
      }
    }
    else
    {
      v282 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v282 userInterfaceIdiom] != 1)
      {
        uint64_t v310 = 0x100000000;
        goto LABEL_67;
      }
    }
    HIDWORD(v310) = v15 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v18 = __sb__runningInSpringBoard();
      if (v18)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v283 = [MEMORY[0x1E4F42D90] mainScreen];
        [v283 _referenceBounds];
      }
      uint64_t v38 = v18 ^ 1u;
      BSSizeRoundForScale();
      LODWORD(v310) = v38;
      if (v61 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v60 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        memset(v309, 0, sizeof(v309));
        memset(v308, 0, sizeof(v308));
        uint64_t v305 = 0;
        uint64_t v301 = 0;
        uint64_t v297 = 0;
        int v293 = 0;
        int v285 = 0;
        int v289 = 0;
        int v44 = 0;
        int v45 = 0;
        int v46 = 0;
        int v47 = 0;
        int v48 = 0;
        int v49 = 0;
        goto LABEL_307;
      }
    }
    else
    {
      LODWORD(v310) = 0;
    }
LABEL_67:
    int v24 = __sb__runningInSpringBoard();
    if (v24)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_DWORD *)&v309[12] = 0;
        *(_DWORD *)&v309[40] = 0;
        goto LABEL_86;
      }
    }
    else
    {
      v281 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v281 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[12] = 0;
        *(_DWORD *)&v309[40] = 1;
        goto LABEL_86;
      }
    }
    *(_DWORD *)&v309[40] = v24 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v25 = __sb__runningInSpringBoard();
      if (v25)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v273 = [MEMORY[0x1E4F42D90] mainScreen];
        [v273 _referenceBounds];
      }
      uint64_t v38 = v25 ^ 1u;
      BSSizeRoundForScale();
      *(_DWORD *)&v309[12] = v38;
      if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        memset(v309, 0, 12);
        memset(&v309[16], 0, 24);
        memset(v308, 0, sizeof(v308));
        uint64_t v305 = 0;
        uint64_t v297 = 0;
        uint64_t v301 = 0;
        int v293 = 0;
        int v285 = 0;
        int v289 = 0;
        int v44 = 0;
        int v45 = 0;
        int v46 = 0;
        int v47 = 0;
        int v48 = 0;
        int v49 = 0;
        goto LABEL_307;
      }
    }
    else
    {
      *(_DWORD *)&v309[12] = 0;
    }
LABEL_86:
    int v37 = __sb__runningInSpringBoard();
    if (v37)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[32] = 0;
        goto LABEL_95;
      }
    }
    else
    {
      v280 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v280 userInterfaceIdiom] != 1)
      {
        *(void *)&v309[32] = 0x100000000;
        goto LABEL_95;
      }
    }
    *(_DWORD *)&v309[36] = v37 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v38 = __sb__runningInSpringBoard();
      if (v38)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v272 = [MEMORY[0x1E4F42D90] mainScreen];
        [v272 _referenceBounds];
      }
      *(_DWORD *)&v309[32] = v38 ^ 1;
      BSSizeRoundForScale();
      if (v71 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        memset(v309, 0, 12);
        *(void *)&v309[16] = 0;
        memset(v308, 0, sizeof(v308));
        *(void *)&v309[24] = 0;
        uint64_t v301 = 0;
        uint64_t v305 = 0;
        uint64_t v297 = 0;
        int v293 = 0;
        int v285 = 0;
        int v289 = 0;
        int v44 = 0;
        int v45 = 0;
        int v46 = 0;
        int v47 = 0;
        int v48 = 0;
        int v49 = 0;
        goto LABEL_307;
      }
    }
    else
    {
      *(_DWORD *)&v309[32] = 0;
    }
LABEL_95:
    int v39 = __sb__runningInSpringBoard();
    if (v39)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[24] = 0;
        goto LABEL_113;
      }
    }
    else
    {
      v279 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v279 userInterfaceIdiom] != 1)
      {
        *(void *)&v309[24] = 0x100000000;
        goto LABEL_113;
      }
    }
    *(_DWORD *)&v309[28] = v39 ^ 1;
    uint64_t v38 = __sb__runningInSpringBoard();
    if (v38)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v276 = [MEMORY[0x1E4F42D90] mainScreen];
      [v276 _referenceBounds];
    }
    *(_DWORD *)&v309[24] = v38 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      memset(v309, 0, 12);
      *(void *)&v309[16] = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v301 = 0;
      uint64_t v305 = 0;
      uint64_t v297 = 0;
      int v293 = 0;
      int v285 = 0;
      int v289 = 0;
      int v44 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      goto LABEL_307;
    }
LABEL_113:
    int v43 = __sb__runningInSpringBoard();
    if (v43)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[16] = 0;
        goto LABEL_253;
      }
    }
    else
    {
      v278 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v278 userInterfaceIdiom] != 1)
      {
        *(void *)&v309[16] = 0x100000000;
        goto LABEL_253;
      }
    }
    *(_DWORD *)&v309[20] = v43 ^ 1;
    uint64_t v38 = __sb__runningInSpringBoard();
    if (v38)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v274 = [MEMORY[0x1E4F42D90] mainScreen];
      [v274 _referenceBounds];
    }
    *(_DWORD *)&v309[16] = v38 ^ 1;
    BSSizeRoundForScale();
    if (v57 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      memset(v309, 0, 12);
      memset(v308, 0, sizeof(v308));
      uint64_t v301 = 0;
      uint64_t v305 = 0;
      uint64_t v297 = 0;
      int v293 = 0;
      int v285 = 0;
      int v289 = 0;
      int v44 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      goto LABEL_307;
    }
LABEL_253:
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[4] = 0;
        goto LABEL_433;
      }
    }
    else
    {
      v277 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v277 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[4] = 0;
        *(_DWORD *)&v309[8] = 1;
        goto LABEL_433;
      }
    }
    *(_DWORD *)&v309[8] = v58 ^ 1;
    int v59 = __sb__runningInSpringBoard();
    if (v59)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v271 = [MEMORY[0x1E4F42D90] mainScreen];
      [v271 _referenceBounds];
    }
    uint64_t v38 = v59 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v309[4] = v38;
    if (v74 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      *(_DWORD *)v309 = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v301 = 0;
      uint64_t v305 = 0;
      uint64_t v297 = 0;
      int v293 = 0;
      int v285 = 0;
      int v289 = 0;
      int v44 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      goto LABEL_307;
    }
LABEL_433:
    uint64_t v38 = __sb__runningInSpringBoard();
    if (v38)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_435;
      }
    }
    else
    {
      v275 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v275 userInterfaceIdiom] != 1)
      {
LABEL_435:
        *(_DWORD *)v309 = v38 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_439:
          *(void *)&v308[76] = 0;
          goto LABEL_785;
        }
        int v75 = __sb__runningInSpringBoard();
        if (v75)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_439;
          }
        }
        else
        {
          v269 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v269 userInterfaceIdiom])
          {
            *(void *)&v308[76] = 0x100000000;
            goto LABEL_785;
          }
        }
        *(_DWORD *)&v308[80] = v75 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v262 = [MEMORY[0x1E4F42D90] mainScreen];
            [v262 _referenceBounds];
          }
          *(_DWORD *)&v308[76] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v116 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            *(_OWORD *)&v308[84] = 0uLL;
            memset(v308, 0, 76);
            uint64_t v301 = 0;
            uint64_t v305 = 0;
            uint64_t v297 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          *(_DWORD *)&v308[76] = 0;
        }
LABEL_785:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[72] = 0;
            *(_DWORD *)&v308[96] = 0;
            goto LABEL_795;
          }
        }
        else
        {
          v270 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v270 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[72] = 0;
            *(_DWORD *)&v308[96] = 1;
            goto LABEL_795;
          }
        }
        *(_DWORD *)&v308[96] = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v265 = [MEMORY[0x1E4F42D90] mainScreen];
            [v265 _referenceBounds];
          }
          *(_DWORD *)&v308[72] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v113 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_799;
          }
        }
        else
        {
          *(_DWORD *)&v308[72] = 0;
        }
LABEL_795:
        if (_SBF_Private_IsD94Like())
        {
          *(void *)&v308[88] = 0;
          *(_DWORD *)&v308[84] = 0;
          memset(v308, 0, 72);
          uint64_t v301 = 0;
          uint64_t v305 = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_799:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_803:
          *(void *)&v308[64] = 0;
          goto LABEL_856;
        }
        int v114 = __sb__runningInSpringBoard();
        if (v114)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_803;
          }
        }
        else
        {
          v266 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v266 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[64] = 0;
            *(_DWORD *)&v308[68] = 1;
            goto LABEL_856;
          }
        }
        *(_DWORD *)&v308[68] = v114 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v257 = [MEMORY[0x1E4F42D90] mainScreen];
            [v257 _referenceBounds];
          }
          *(_DWORD *)&v308[64] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v131 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            *(void *)&v308[88] = 0;
            *(_DWORD *)&v308[84] = 0;
            memset(v308, 0, 64);
            uint64_t v301 = 0;
            uint64_t v305 = 0;
            uint64_t v297 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          *(_DWORD *)&v308[64] = 0;
        }
LABEL_856:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[88] = 0;
            *(_DWORD *)&v308[60] = 0;
            goto LABEL_866;
          }
        }
        else
        {
          v268 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v268 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[60] = 0;
            *(_DWORD *)&v308[88] = 1;
            goto LABEL_866;
          }
        }
        *(_DWORD *)&v308[88] = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v261 = [MEMORY[0x1E4F42D90] mainScreen];
            [v261 _referenceBounds];
          }
          *(_DWORD *)&v308[60] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v119 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_870;
          }
        }
        else
        {
          *(_DWORD *)&v308[60] = 0;
        }
LABEL_866:
        if (_SBF_Private_IsD64Like())
        {
          *(_DWORD *)&v308[92] = 0;
          *(_DWORD *)&v308[84] = 0;
          memset(v308, 0, 60);
          uint64_t v301 = 0;
          uint64_t v305 = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_870:
        int v120 = __sb__runningInSpringBoard();
        if (v120)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[92] = 0;
            *(_DWORD *)&v308[84] = 0;
            goto LABEL_880;
          }
        }
        else
        {
          v267 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v267 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[84] = 0;
            *(_DWORD *)&v308[92] = 1;
            goto LABEL_880;
          }
        }
        *(_DWORD *)&v308[92] = v120 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v121 = __sb__runningInSpringBoard();
          if (v121)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v258 = [MEMORY[0x1E4F42D90] mainScreen];
            [v258 _referenceBounds];
          }
          uint64_t v38 = v121 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v308[84] = v38;
          if (v130 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            memset(v308, 0, 60);
            uint64_t v301 = 0;
            uint64_t v305 = 0;
            uint64_t v297 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          *(_DWORD *)&v308[84] = 0;
        }
LABEL_880:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[56] = 0;
            *(_DWORD *)&v308[32] = 0;
            goto LABEL_946;
          }
        }
        else
        {
          v264 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v264 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[32] = 0;
            *(_DWORD *)&v308[56] = 1;
            goto LABEL_946;
          }
        }
        *(_DWORD *)&v308[56] = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v256 = [MEMORY[0x1E4F42D90] mainScreen];
            [v256 _referenceBounds];
          }
          *(_DWORD *)&v308[32] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v134 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_980;
          }
        }
        else
        {
          *(_DWORD *)&v308[32] = 0;
        }
LABEL_946:
        if (_SBF_Private_IsD54())
        {
          memset(v308, 0, 32);
          memset(&v308[36], 0, 20);
          uint64_t v301 = 0;
          uint64_t v305 = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_980:
        int v135 = __sb__runningInSpringBoard();
        if (v135)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[48] = 0;
            goto LABEL_997;
          }
        }
        else
        {
          v263 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v263 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[48] = 0;
            *(_DWORD *)&v308[52] = 1;
            goto LABEL_997;
          }
        }
        *(_DWORD *)&v308[52] = v135 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v253 = [MEMORY[0x1E4F42D90] mainScreen];
            [v253 _referenceBounds];
          }
          *(_DWORD *)&v308[48] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v147 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            *(void *)&v308[40] = 0;
            memset(v308, 0, 32);
            *(_DWORD *)&v308[36] = 0;
            uint64_t v301 = 0;
            uint64_t v305 = 0;
            uint64_t v297 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          *(_DWORD *)&v308[48] = 0;
        }
LABEL_997:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[40] = 0;
            goto LABEL_1079;
          }
        }
        else
        {
          v260 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v260 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[40] = 0;
            *(_DWORD *)&v308[44] = 1;
            goto LABEL_1079;
          }
        }
        *(_DWORD *)&v308[44] = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v252 = [MEMORY[0x1E4F42D90] mainScreen];
            [v252 _referenceBounds];
          }
          *(_DWORD *)&v308[40] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v150 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1121;
          }
        }
        else
        {
          *(_DWORD *)&v308[40] = 0;
        }
LABEL_1079:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          memset(v308, 0, 32);
          *(_DWORD *)&v308[36] = 0;
          uint64_t v301 = 0;
          uint64_t v305 = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_1121:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_1125:
          *(_DWORD *)&v308[28] = 0;
          *(_DWORD *)&v308[8] = 0;
          goto LABEL_1207;
        }
        int v151 = __sb__runningInSpringBoard();
        if (v151)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1125;
          }
        }
        else
        {
          v255 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v255 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[8] = 0;
            *(_DWORD *)&v308[28] = 1;
            goto LABEL_1207;
          }
        }
        *(_DWORD *)&v308[28] = v151 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v246 = [MEMORY[0x1E4F42D90] mainScreen];
            [v246 _referenceBounds];
          }
          *(_DWORD *)&v308[8] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v167 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            *(_DWORD *)&v308[36] = 0;
            *(void *)&v308[20] = 0;
            *(void *)&v308[12] = 0;
            *(void *)v308 = 0;
            uint64_t v301 = 0;
            uint64_t v305 = 0;
            uint64_t v297 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          *(_DWORD *)&v308[8] = 0;
        }
LABEL_1207:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[36] = 0;
            *(_DWORD *)&v308[24] = 0;
            goto LABEL_1217;
          }
        }
        else
        {
          v259 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v259 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[24] = 0;
            *(_DWORD *)&v308[36] = 1;
            goto LABEL_1217;
          }
        }
        *(_DWORD *)&v308[36] = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v249 = [MEMORY[0x1E4F42D90] mainScreen];
            [v249 _referenceBounds];
          }
          *(_DWORD *)&v308[24] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v158 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_1221;
          }
        }
        else
        {
          *(_DWORD *)&v308[24] = 0;
        }
LABEL_1217:
        if (_SBF_Private_IsD93Like())
        {
          *(void *)&v308[12] = 0;
          *(void *)v308 = 0;
          *(_DWORD *)&v308[20] = 0;
          uint64_t v301 = 0;
          uint64_t v305 = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_1221:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_1225:
          *(_DWORD *)&v308[12] = 0;
          *(_DWORD *)&v308[4] = 0;
          goto LABEL_1304;
        }
        int v159 = __sb__runningInSpringBoard();
        if (v159)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1225;
          }
        }
        else
        {
          v250 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v250 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[4] = 0;
            *(_DWORD *)&v308[12] = 1;
            goto LABEL_1304;
          }
        }
        *(_DWORD *)&v308[12] = v159 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v242 = [MEMORY[0x1E4F42D90] mainScreen];
            [v242 _referenceBounds];
          }
          *(_DWORD *)&v308[4] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v181 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            *(void *)&v308[16] = 0;
            *(_DWORD *)v308 = 0;
            uint64_t v301 = 0;
            uint64_t v305 = 0;
            uint64_t v297 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          *(_DWORD *)&v308[4] = 0;
        }
LABEL_1304:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[16] = 0;
            goto LABEL_1314;
          }
        }
        else
        {
          v254 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v254 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[16] = 0;
            *(_DWORD *)&v308[20] = 1;
            goto LABEL_1314;
          }
        }
        *(_DWORD *)&v308[20] = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v245 = [MEMORY[0x1E4F42D90] mainScreen];
            [v245 _referenceBounds];
          }
          *(_DWORD *)&v308[16] = v38 ^ 1;
          BSSizeRoundForScale();
          if (v170 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1318;
          }
        }
        else
        {
          *(_DWORD *)&v308[16] = 0;
        }
LABEL_1314:
        if (_SBF_Private_IsD63Like())
        {
          *(_DWORD *)v308 = 0;
          uint64_t v301 = 0;
          uint64_t v305 = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_1318:
        int v171 = __sb__runningInSpringBoard();
        if (v171)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v308 = 0;
            LODWORD(v305) = 0;
            goto LABEL_1328;
          }
        }
        else
        {
          v251 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v251 userInterfaceIdiom])
          {
            LODWORD(v305) = 0;
            *(_DWORD *)v308 = 1;
            goto LABEL_1328;
          }
        }
        *(_DWORD *)v308 = v171 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v243 = [MEMORY[0x1E4F42D90] mainScreen];
            [v243 _referenceBounds];
          }
          LODWORD(v305) = v38 ^ 1;
          BSSizeRoundForScale();
          if (v180 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            HIDWORD(v305) = 0;
            uint64_t v297 = 0;
            uint64_t v301 = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          LODWORD(v305) = 0;
        }
LABEL_1328:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v305) = 0;
            HIDWORD(v301) = 0;
            goto LABEL_1394;
          }
        }
        else
        {
          v248 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v248 userInterfaceIdiom])
          {
            HIDWORD(v301) = 0;
            HIDWORD(v305) = 1;
            goto LABEL_1394;
          }
        }
        HIDWORD(v305) = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v241 = [MEMORY[0x1E4F42D90] mainScreen];
            [v241 _referenceBounds];
          }
          HIDWORD(v301) = v38 ^ 1;
          BSSizeRoundForScale();
          if (v184 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1428;
          }
        }
        else
        {
          HIDWORD(v301) = 0;
        }
LABEL_1394:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          LODWORD(v301) = 0;
          uint64_t v297 = 0;
          int v293 = 0;
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_1428:
        int v185 = __sb__runningInSpringBoard();
        if (v185)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v301) = 0;
            HIDWORD(v297) = 0;
            goto LABEL_1444;
          }
        }
        else
        {
          v247 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v247 userInterfaceIdiom])
          {
            HIDWORD(v297) = 0;
            LODWORD(v301) = 1;
            goto LABEL_1444;
          }
        }
        LODWORD(v301) = v185 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v240 = [MEMORY[0x1E4F42D90] mainScreen];
            [v240 _referenceBounds];
          }
          HIDWORD(v297) = v38 ^ 1;
          BSSizeRoundForScale();
          if (v194 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v297) = 0;
            int v293 = 0;
            int v285 = 0;
            int v289 = 0;
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          HIDWORD(v297) = 0;
        }
LABEL_1444:
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v297) = 0;
            int v293 = 0;
            goto LABEL_1537;
          }
        }
        else
        {
          v244 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v244 userInterfaceIdiom])
          {
            int v293 = 0;
            LODWORD(v297) = 1;
            goto LABEL_1537;
          }
        }
        LODWORD(v297) = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v239 = [MEMORY[0x1E4F42D90] mainScreen];
            [v239 _referenceBounds];
          }
          int v293 = v38 ^ 1;
          BSSizeRoundForScale();
          if (v201 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1583;
          }
        }
        else
        {
          int v293 = 0;
        }
LABEL_1537:
        if (_SBF_Private_IsD53())
        {
LABEL_1590:
          int v285 = 0;
          int v289 = 0;
          int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
LABEL_1583:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0
          || (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          goto LABEL_1590;
        }
        int v203 = __sb__runningInSpringBoard();
        if (v203)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v285 = 0;
            int v289 = 0;
            goto LABEL_1699;
          }
        }
        else
        {
          v238 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v238 userInterfaceIdiom])
          {
            int v289 = 0;
            int v285 = 1;
            goto LABEL_1699;
          }
        }
        int v285 = v203 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v236 = [MEMORY[0x1E4F42D90] mainScreen];
            [v236 _referenceBounds];
          }
          int v289 = v38 ^ 1;
          BSSizeRoundForScale();
          if (v219 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v44 = 0;
            int v45 = 0;
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          int v289 = 0;
        }
LABEL_1699:
        int v212 = __sb__runningInSpringBoard();
        if (v212)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v44 = 0;
            int v45 = 0;
            goto LABEL_1723;
          }
        }
        else
        {
          v237 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v237 userInterfaceIdiom])
          {
            int v45 = 0;
            int v44 = 1;
            goto LABEL_1723;
          }
        }
        int v44 = v212 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v38 = __sb__runningInSpringBoard();
          if (v38)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v235 = [MEMORY[0x1E4F42D90] mainScreen];
            [v235 _referenceBounds];
          }
          int v45 = v38 ^ 1;
          BSSizeRoundForScale();
          if (v220 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v46 = 0;
            int v47 = 0;
            int v48 = 0;
            int v49 = 0;
            goto LABEL_307;
          }
        }
        else
        {
          int v45 = 0;
        }
LABEL_1723:
        int v215 = __sb__runningInSpringBoard();
        if (v215)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v46 = 0;
            int v47 = 0;
LABEL_1736:
            uint64_t v38 = __sb__runningInSpringBoard();
            if (v38)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v48 = 0;
                int v49 = 0;
                goto LABEL_307;
              }
            }
            else
            {
              id v2 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v2 userInterfaceIdiom])
              {
                int v49 = 0;
                int v48 = 1;
                goto LABEL_307;
              }
            }
            int v48 = v38 ^ 1;
            int v221 = __sb__runningInSpringBoard();
            if (v221)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v38 = [MEMORY[0x1E4F42D90] mainScreen];
              [(id)v38 _referenceBounds];
            }
            int v49 = v221 ^ 1;
            BSSizeRoundForScale();
LABEL_307:
            if (v49) {

            }
            if (v48) {
            if (v47)
            }
            {

              if (!v46) {
                goto LABEL_313;
              }
            }
            else if (!v46)
            {
LABEL_313:
              if (v45) {
                goto LABEL_314;
              }
              goto LABEL_318;
            }

            if (v45)
            {
LABEL_314:

              if (!v44) {
                goto LABEL_320;
              }
              goto LABEL_319;
            }
LABEL_318:
            if (!v44)
            {
LABEL_320:
              if (v289) {

              }
              if (v285) {
              if (v293)
              }

              if (v297) {
              if (HIDWORD(v297))
              }

              if (v301) {
              if (HIDWORD(v301))
              }

              if (HIDWORD(v305)) {
              if (v305)
              }

              if (*(_DWORD *)v308) {
              if (*(_DWORD *)&v308[16])
              }

              if (*(_DWORD *)&v308[20]) {
              if (*(_DWORD *)&v308[4])
              }

              if (*(_DWORD *)&v308[12]) {
              if (*(_DWORD *)&v308[24])
              }

              if (*(_DWORD *)&v308[36]) {
              if (*(_DWORD *)&v308[8])
              }

              if (*(_DWORD *)&v308[28]) {
              if (*(_DWORD *)&v308[40])
              }

              if (*(_DWORD *)&v308[44]) {
              if (*(_DWORD *)&v308[48])
              }

              if (*(_DWORD *)&v308[52]) {
              if (*(_DWORD *)&v308[32])
              }

              if (*(_DWORD *)&v308[56]) {
              if (*(_DWORD *)&v308[84])
              }

              if (*(_DWORD *)&v308[92]) {
              if (*(_DWORD *)&v308[60])
              }

              if (*(_DWORD *)&v308[88]) {
              if (*(_DWORD *)&v308[64])
              }

              if (*(_DWORD *)&v308[68]) {
              if (*(_DWORD *)&v308[72])
              }

              if (*(_DWORD *)&v308[96]) {
              if (*(_DWORD *)&v308[76])
              }

              if (*(_DWORD *)&v308[80]) {
              if (*(_DWORD *)v309)
              }

              if (*(_DWORD *)&v309[4]) {
              if (*(_DWORD *)&v309[8])
              }

              if (*(_DWORD *)&v309[16]) {
              if (*(_DWORD *)&v309[20])
              }

              if (*(_DWORD *)&v309[24]) {
              if (*(_DWORD *)&v309[28])
              }

              if (*(_DWORD *)&v309[32]) {
              if (*(_DWORD *)&v309[36])
              }

              if (*(_DWORD *)&v309[12]) {
              if (*(_DWORD *)&v309[40])
              }

              if (v310) {
              if (!HIDWORD(v310))
              }
                goto LABEL_608;
              BOOL v54 = v282;
LABEL_607:

              goto LABEL_608;
            }
LABEL_319:

            goto LABEL_320;
          }
        }
        else
        {
          double v4 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v4 userInterfaceIdiom])
          {
            int v47 = 0;
            int v46 = 1;
            goto LABEL_1736;
          }
        }
        int v46 = v215 ^ 1;
        uint64_t v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          double v3 = [MEMORY[0x1E4F42D90] mainScreen];
          [v3 _referenceBounds];
        }
        int v47 = v38 ^ 1;
        BSSizeRoundForScale();
        if (v217 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v48 = 0;
          int v49 = 0;
          goto LABEL_307;
        }
        goto LABEL_1736;
      }
    }
    memset(v308, 0, sizeof(v308));
    uint64_t v301 = 0;
    uint64_t v305 = 0;
    uint64_t v297 = 0;
    int v293 = 0;
    int v285 = 0;
    int v289 = 0;
    int v44 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    *(_DWORD *)v309 = v38 ^ 1;
    goto LABEL_307;
  }
  uint64_t v14 = [MEMORY[0x1E4F42948] currentDevice];
  id v2 = (void *)[v14 userInterfaceIdiom];

  if (v2 == (void *)1) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = [(CSCoverSheetViewController *)self interfaceOrientation] - 1;
  int v10 = __sb__runningInSpringBoard();
  int v11 = v10;
  if (v9 <= 1)
  {
    long long v12 = &CSTimeLabelPortraitBaselineY;
    if (v10)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v310 = 0;
        goto LABEL_267;
      }
    }
    else
    {
      v283 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v283 userInterfaceIdiom] != 1)
      {
        uint64_t v310 = 0x100000000;
        goto LABEL_267;
      }
    }
    HIDWORD(v310) = v11 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v22 = __sb__runningInSpringBoard();
      if (v22)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v274 = [MEMORY[0x1E4F42D90] mainScreen];
        [v274 _referenceBounds];
      }
      uint64_t v68 = v22 ^ 1u;
      BSSizeRoundForScale();
      LODWORD(v310) = v68;
      if (v98 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v97 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        memset(v309, 0, sizeof(v309));
        memset(v308, 0, sizeof(v308));
        uint64_t v298 = 0;
        uint64_t v302 = 0;
        uint64_t v306 = 0;
        int v294 = 0;
        int v290 = 0;
        int v286 = 0;
        int v80 = 0;
        int v81 = 0;
        int v82 = 0;
        int v83 = 0;
        int v84 = 0;
        int v85 = 0;
        goto LABEL_500;
      }
    }
    else
    {
      LODWORD(v310) = 0;
    }
LABEL_267:
    int v62 = __sb__runningInSpringBoard();
    if (v62)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_DWORD *)&v309[16] = 0;
        *(_DWORD *)v309 = 0;
        goto LABEL_288;
      }
    }
    else
    {
      v282 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v282 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)v309 = 0;
        *(_DWORD *)&v309[16] = 1;
        goto LABEL_288;
      }
    }
    *(_DWORD *)&v309[16] = v62 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v63 = __sb__runningInSpringBoard();
      if (v63)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v273 = [MEMORY[0x1E4F42D90] mainScreen];
        [v273 _referenceBounds];
      }
      uint64_t v68 = v63 ^ 1u;
      BSSizeRoundForScale();
      *(_DWORD *)v309 = v68;
      if (v101 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        memset(&v309[20], 0, 24);
        *(void *)&v309[8] = 0;
        *(_DWORD *)&v309[4] = 0;
        memset(v308, 0, sizeof(v308));
        uint64_t v298 = 0;
        uint64_t v302 = 0;
        uint64_t v306 = 0;
        int v294 = 0;
        int v290 = 0;
        int v286 = 0;
        int v80 = 0;
        int v81 = 0;
        int v82 = 0;
        int v83 = 0;
        int v84 = 0;
        int v85 = 0;
        goto LABEL_500;
      }
    }
    else
    {
      *(_DWORD *)v309 = 0;
    }
LABEL_288:
    int v67 = __sb__runningInSpringBoard();
    if (v67)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[36] = 0;
        goto LABEL_416;
      }
    }
    else
    {
      v281 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v281 userInterfaceIdiom] != 1)
      {
        *(void *)&v309[36] = 0x100000000;
        goto LABEL_416;
      }
    }
    *(_DWORD *)&v309[40] = v67 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v68 = __sb__runningInSpringBoard();
      if (v68)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v272 = [MEMORY[0x1E4F42D90] mainScreen];
        [v272 _referenceBounds];
      }
      *(_DWORD *)&v309[36] = v68 ^ 1;
      BSSizeRoundForScale();
      if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        *(void *)&v309[20] = 0;
        *(void *)&v309[28] = 0;
        *(void *)&v309[8] = 0;
        *(_DWORD *)&v309[4] = 0;
        memset(v308, 0, sizeof(v308));
        uint64_t v298 = 0;
        uint64_t v302 = 0;
        uint64_t v306 = 0;
        int v294 = 0;
        int v290 = 0;
        int v286 = 0;
        int v80 = 0;
        int v81 = 0;
        int v82 = 0;
        int v83 = 0;
        int v84 = 0;
        int v85 = 0;
        goto LABEL_500;
      }
    }
    else
    {
      *(_DWORD *)&v309[36] = 0;
    }
LABEL_416:
    int v72 = __sb__runningInSpringBoard();
    if (v72)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[28] = 0;
        goto LABEL_446;
      }
    }
    else
    {
      v280 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v280 userInterfaceIdiom] != 1)
      {
        *(void *)&v309[28] = 0x100000000;
        goto LABEL_446;
      }
    }
    *(_DWORD *)&v309[32] = v72 ^ 1;
    uint64_t v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v277 = [MEMORY[0x1E4F42D90] mainScreen];
      [v277 _referenceBounds];
    }
    *(_DWORD *)&v309[28] = v68 ^ 1;
    BSSizeRoundForScale();
    if (v76 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      *(void *)&v309[20] = 0;
      *(void *)&v309[8] = 0;
      *(_DWORD *)&v309[4] = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v298 = 0;
      uint64_t v302 = 0;
      uint64_t v306 = 0;
      int v294 = 0;
      int v290 = 0;
      int v286 = 0;
      int v80 = 0;
      int v81 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      goto LABEL_500;
    }
LABEL_446:
    int v77 = __sb__runningInSpringBoard();
    if (v77)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[20] = 0;
        goto LABEL_466;
      }
    }
    else
    {
      v279 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v279 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v309[20] = 0;
        *(_DWORD *)&v309[24] = 1;
        goto LABEL_466;
      }
    }
    *(_DWORD *)&v309[24] = v77 ^ 1;
    uint64_t v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v275 = [MEMORY[0x1E4F42D90] mainScreen];
      [v275 _referenceBounds];
    }
    *(_DWORD *)&v309[20] = v68 ^ 1;
    BSSizeRoundForScale();
    if (v93 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      *(void *)&v309[8] = 0;
      *(_DWORD *)&v309[4] = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v298 = 0;
      uint64_t v302 = 0;
      uint64_t v306 = 0;
      int v294 = 0;
      int v290 = 0;
      int v286 = 0;
      int v80 = 0;
      int v81 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      goto LABEL_500;
    }
LABEL_466:
    int v94 = __sb__runningInSpringBoard();
    if (v94)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v309[8] = 0;
        goto LABEL_727;
      }
    }
    else
    {
      v278 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v278 userInterfaceIdiom] != 1)
      {
        *(void *)&v309[8] = 0x100000000;
        goto LABEL_727;
      }
    }
    *(_DWORD *)&v309[12] = v94 ^ 1;
    uint64_t v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v271 = [MEMORY[0x1E4F42D90] mainScreen];
      [v271 _referenceBounds];
    }
    *(_DWORD *)&v309[8] = v68 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      *(_DWORD *)&v309[4] = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v298 = 0;
      uint64_t v302 = 0;
      uint64_t v306 = 0;
      int v294 = 0;
      int v290 = 0;
      int v286 = 0;
      int v80 = 0;
      int v81 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      goto LABEL_500;
    }
LABEL_727:
    uint64_t v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_729;
      }
    }
    else
    {
      v276 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v276 userInterfaceIdiom] != 1)
      {
LABEL_729:
        *(_DWORD *)&v309[4] = v68 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_733:
          *(void *)&v308[88] = 0;
          goto LABEL_893;
        }
        int v108 = __sb__runningInSpringBoard();
        if (v108)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_733;
          }
        }
        else
        {
          v269 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v269 userInterfaceIdiom])
          {
            *(void *)&v308[88] = 0x100000000;
            goto LABEL_893;
          }
        }
        *(_DWORD *)&v308[92] = v108 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v262 = [MEMORY[0x1E4F42D90] mainScreen];
            [v262 _referenceBounds];
          }
          *(_DWORD *)&v308[88] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v132 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            *(_DWORD *)&v308[96] = 0;
            memset(v308, 0, 88);
            uint64_t v298 = 0;
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          *(_DWORD *)&v308[88] = 0;
        }
LABEL_893:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[96] = 0;
            *(_DWORD *)&v308[84] = 0;
            goto LABEL_903;
          }
        }
        else
        {
          v270 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v270 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[84] = 0;
            *(_DWORD *)&v308[96] = 1;
            goto LABEL_903;
          }
        }
        *(_DWORD *)&v308[96] = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v265 = [MEMORY[0x1E4F42D90] mainScreen];
            [v265 _referenceBounds];
          }
          *(_DWORD *)&v308[84] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v123 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_907;
          }
        }
        else
        {
          *(_DWORD *)&v308[84] = 0;
        }
LABEL_903:
        if (_SBF_Private_IsD94Like())
        {
          memset(v308, 0, 84);
          uint64_t v298 = 0;
          uint64_t v302 = 0;
          uint64_t v306 = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_907:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_911:
          *(void *)&v308[76] = 0;
          goto LABEL_1007;
        }
        int v124 = __sb__runningInSpringBoard();
        if (v124)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_911;
          }
        }
        else
        {
          v266 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v266 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[76] = 0;
            *(_DWORD *)&v308[80] = 1;
            goto LABEL_1007;
          }
        }
        *(_DWORD *)&v308[80] = v124 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v257 = [MEMORY[0x1E4F42D90] mainScreen];
            [v257 _referenceBounds];
          }
          *(_DWORD *)&v308[76] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v148 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            memset(v308, 0, 76);
            uint64_t v298 = 0;
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          *(_DWORD *)&v308[76] = 0;
        }
LABEL_1007:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[72] = 0;
            *(_DWORD *)&v308[56] = 0;
            goto LABEL_1017;
          }
        }
        else
        {
          v268 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v268 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[56] = 0;
            *(_DWORD *)&v308[72] = 1;
            goto LABEL_1017;
          }
        }
        *(_DWORD *)&v308[72] = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v261 = [MEMORY[0x1E4F42D90] mainScreen];
            [v261 _referenceBounds];
          }
          *(_DWORD *)&v308[56] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v136 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_1021;
          }
        }
        else
        {
          *(_DWORD *)&v308[56] = 0;
        }
LABEL_1017:
        if (_SBF_Private_IsD64Like())
        {
          *(void *)&v308[64] = 0;
          *(_DWORD *)&v308[60] = 0;
          memset(v308, 0, 56);
          uint64_t v298 = 0;
          uint64_t v302 = 0;
          uint64_t v306 = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1021:
        int v137 = __sb__runningInSpringBoard();
        if (v137)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[68] = 0;
            *(_DWORD *)&v308[52] = 0;
            goto LABEL_1031;
          }
        }
        else
        {
          v267 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v267 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[52] = 0;
            *(_DWORD *)&v308[68] = 1;
            goto LABEL_1031;
          }
        }
        *(_DWORD *)&v308[68] = v137 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v138 = __sb__runningInSpringBoard();
          if (v138)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v258 = [MEMORY[0x1E4F42D90] mainScreen];
            [v258 _referenceBounds];
          }
          uint64_t v68 = v138 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v308[52] = v68;
          if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            *(void *)&v308[60] = 0;
            memset(v308, 0, 52);
            uint64_t v298 = 0;
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          *(_DWORD *)&v308[52] = 0;
        }
LABEL_1031:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[44] = 0;
            *(_DWORD *)&v308[24] = 0;
            goto LABEL_1086;
          }
        }
        else
        {
          v264 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v264 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[24] = 0;
            *(_DWORD *)&v308[44] = 1;
            goto LABEL_1086;
          }
        }
        *(_DWORD *)&v308[44] = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v256 = [MEMORY[0x1E4F42D90] mainScreen];
            [v256 _referenceBounds];
          }
          *(_DWORD *)&v308[24] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v152 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_1130;
          }
        }
        else
        {
          *(_DWORD *)&v308[24] = 0;
        }
LABEL_1086:
        if (_SBF_Private_IsD54())
        {
          *(void *)&v308[60] = 0;
          *(_DWORD *)&v308[48] = 0;
          *(_OWORD *)&v308[28] = 0uLL;
          memset(v308, 0, 24);
          uint64_t v298 = 0;
          uint64_t v302 = 0;
          uint64_t v306 = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1130:
        int v153 = __sb__runningInSpringBoard();
        if (v153)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[60] = 0;
            goto LABEL_1148;
          }
        }
        else
        {
          v263 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v263 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[60] = 0;
            *(_DWORD *)&v308[64] = 1;
            goto LABEL_1148;
          }
        }
        *(_DWORD *)&v308[64] = v153 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v253 = [MEMORY[0x1E4F42D90] mainScreen];
            [v253 _referenceBounds];
          }
          *(_DWORD *)&v308[60] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v160 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            *(_DWORD *)&v308[48] = 0;
            *(_OWORD *)&v308[28] = 0uLL;
            memset(v308, 0, 24);
            uint64_t v298 = 0;
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          *(_DWORD *)&v308[60] = 0;
        }
LABEL_1148:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[40] = 0;
            *(_DWORD *)&v308[48] = 0;
            goto LABEL_1193;
          }
        }
        else
        {
          v260 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v260 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[48] = 0;
            *(_DWORD *)&v308[40] = 1;
            goto LABEL_1193;
          }
        }
        *(_DWORD *)&v308[40] = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v252 = [MEMORY[0x1E4F42D90] mainScreen];
            [v252 _referenceBounds];
          }
          *(_DWORD *)&v308[48] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v163 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1241;
          }
        }
        else
        {
          *(_DWORD *)&v308[48] = 0;
        }
LABEL_1193:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          *(void *)&v308[32] = 0;
          *(_DWORD *)&v308[28] = 0;
          memset(v308, 0, 24);
          uint64_t v298 = 0;
          uint64_t v302 = 0;
          uint64_t v306 = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1241:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_1245:
          *(_DWORD *)&v308[36] = 0;
          *(_DWORD *)&v308[20] = 0;
          goto LABEL_1341;
        }
        int v164 = __sb__runningInSpringBoard();
        if (v164)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1245;
          }
        }
        else
        {
          v255 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v255 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[20] = 0;
            *(_DWORD *)&v308[36] = 1;
            goto LABEL_1341;
          }
        }
        *(_DWORD *)&v308[36] = v164 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v246 = [MEMORY[0x1E4F42D90] mainScreen];
            [v246 _referenceBounds];
          }
          *(_DWORD *)&v308[20] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            *(void *)&v308[28] = 0;
            memset(v308, 0, 20);
            uint64_t v298 = 0;
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          *(_DWORD *)&v308[20] = 0;
        }
LABEL_1341:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v308[28] = 0;
            goto LABEL_1351;
          }
        }
        else
        {
          v259 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v259 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[28] = 0;
            *(_DWORD *)&v308[32] = 1;
            goto LABEL_1351;
          }
        }
        *(_DWORD *)&v308[32] = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v249 = [MEMORY[0x1E4F42D90] mainScreen];
            [v249 _referenceBounds];
          }
          *(_DWORD *)&v308[28] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v173 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_1355;
          }
        }
        else
        {
          *(_DWORD *)&v308[28] = 0;
        }
LABEL_1351:
        if (_SBF_Private_IsD93Like())
        {
          memset(v308, 0, 20);
          uint64_t v298 = 0;
          uint64_t v302 = 0;
          uint64_t v306 = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1355:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_1359:
          *(void *)&v308[8] = 0;
          goto LABEL_1454;
        }
        int v174 = __sb__runningInSpringBoard();
        if (v174)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1359;
          }
        }
        else
        {
          v250 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v250 userInterfaceIdiom])
          {
            *(void *)&v308[8] = 0x100000000;
            goto LABEL_1454;
          }
        }
        *(_DWORD *)&v308[12] = v174 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v242 = [MEMORY[0x1E4F42D90] mainScreen];
            [v242 _referenceBounds];
          }
          *(_DWORD *)&v308[8] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v195 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            *(_DWORD *)&v308[16] = 0;
            *(void *)v308 = 0;
            uint64_t v298 = 0;
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          *(_DWORD *)&v308[8] = 0;
        }
LABEL_1454:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v308[16] = 0;
            *(_DWORD *)&v308[4] = 0;
            goto LABEL_1464;
          }
        }
        else
        {
          v254 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v254 userInterfaceIdiom])
          {
            *(_DWORD *)&v308[4] = 0;
            *(_DWORD *)&v308[16] = 1;
            goto LABEL_1464;
          }
        }
        *(_DWORD *)&v308[16] = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v245 = [MEMORY[0x1E4F42D90] mainScreen];
            [v245 _referenceBounds];
          }
          *(_DWORD *)&v308[4] = v68 ^ 1;
          BSSizeRoundForScale();
          if (v186 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1468;
          }
        }
        else
        {
          *(_DWORD *)&v308[4] = 0;
        }
LABEL_1464:
        if (_SBF_Private_IsD63Like())
        {
          *(_DWORD *)v308 = 0;
          uint64_t v298 = 0;
          uint64_t v302 = 0;
          uint64_t v306 = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1468:
        int v187 = __sb__runningInSpringBoard();
        if (v187)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v308 = 0;
            HIDWORD(v298) = 0;
            goto LABEL_1478;
          }
        }
        else
        {
          v251 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v251 userInterfaceIdiom])
          {
            HIDWORD(v298) = 0;
            *(_DWORD *)v308 = 1;
            goto LABEL_1478;
          }
        }
        *(_DWORD *)v308 = v187 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v243 = [MEMORY[0x1E4F42D90] mainScreen];
            [v243 _referenceBounds];
          }
          HIDWORD(v298) = v68 ^ 1;
          BSSizeRoundForScale();
          if (v192 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            uint64_t v302 = 0;
            uint64_t v306 = 0;
            LODWORD(v298) = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          HIDWORD(v298) = 0;
        }
LABEL_1478:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v306 = 0;
            goto LABEL_1525;
          }
        }
        else
        {
          v248 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v248 userInterfaceIdiom])
          {
            uint64_t v306 = 0x100000000;
            goto LABEL_1525;
          }
        }
        HIDWORD(v306) = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v241 = [MEMORY[0x1E4F42D90] mainScreen];
            [v241 _referenceBounds];
          }
          LODWORD(v306) = v68 ^ 1;
          BSSizeRoundForScale();
          if (v197 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1567;
          }
        }
        else
        {
          LODWORD(v306) = 0;
        }
LABEL_1525:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          uint64_t v302 = 0;
          LODWORD(v298) = 0;
          int v294 = 0;
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1567:
        int v198 = __sb__runningInSpringBoard();
        if (v198)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v302 = 0;
            goto LABEL_1595;
          }
        }
        else
        {
          v247 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v247 userInterfaceIdiom])
          {
            uint64_t v302 = 0x100000000;
            goto LABEL_1595;
          }
        }
        HIDWORD(v302) = v198 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v240 = [MEMORY[0x1E4F42D90] mainScreen];
            [v240 _referenceBounds];
          }
          LODWORD(v302) = v68 ^ 1;
          BSSizeRoundForScale();
          if (v204 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v298) = 0;
            int v294 = 0;
            int v290 = 0;
            int v286 = 0;
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          LODWORD(v302) = 0;
        }
LABEL_1595:
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v298) = 0;
            int v294 = 0;
            goto LABEL_1619;
          }
        }
        else
        {
          v244 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v244 userInterfaceIdiom])
          {
            int v294 = 0;
            LODWORD(v298) = 1;
            goto LABEL_1619;
          }
        }
        LODWORD(v298) = v68 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v239 = [MEMORY[0x1E4F42D90] mainScreen];
            [v239 _referenceBounds];
          }
          int v294 = v68 ^ 1;
          BSSizeRoundForScale();
          if (v206 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1639;
          }
        }
        else
        {
          int v294 = 0;
        }
LABEL_1619:
        if (_SBF_Private_IsD53())
        {
LABEL_1646:
          int v290 = 0;
          int v286 = 0;
          int v80 = 0;
          int v81 = 0;
          int v82 = 0;
          int v83 = 0;
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
LABEL_1639:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0
          || (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          goto LABEL_1646;
        }
        int v208 = __sb__runningInSpringBoard();
        if (v208)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v290 = 0;
            int v286 = 0;
            goto LABEL_1761;
          }
        }
        else
        {
          v238 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v238 userInterfaceIdiom])
          {
            int v286 = 0;
            int v290 = 1;
            goto LABEL_1761;
          }
        }
        int v290 = v208 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v236 = [MEMORY[0x1E4F42D90] mainScreen];
            [v236 _referenceBounds];
          }
          int v286 = v68 ^ 1;
          BSSizeRoundForScale();
          if (v228 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v80 = 0;
            int v81 = 0;
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          int v286 = 0;
        }
LABEL_1761:
        int v222 = __sb__runningInSpringBoard();
        if (v222)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v80 = 0;
            int v81 = 0;
            goto LABEL_1781;
          }
        }
        else
        {
          v237 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v237 userInterfaceIdiom])
          {
            int v81 = 0;
            int v80 = 1;
            goto LABEL_1781;
          }
        }
        int v80 = v222 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v68 = __sb__runningInSpringBoard();
          if (v68)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v235 = [MEMORY[0x1E4F42D90] mainScreen];
            [v235 _referenceBounds];
          }
          int v81 = v68 ^ 1;
          BSSizeRoundForScale();
          if (v230 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v82 = 0;
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            goto LABEL_500;
          }
        }
        else
        {
          int v81 = 0;
        }
LABEL_1781:
        int v224 = __sb__runningInSpringBoard();
        if (v224)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v82 = 0;
            int v83 = 0;
LABEL_1801:
            uint64_t v68 = __sb__runningInSpringBoard();
            if (v68)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v84 = 0;
                int v85 = 0;
                goto LABEL_500;
              }
            }
            else
            {
              long long v12 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v12 userInterfaceIdiom])
              {
                int v85 = 0;
                int v84 = 1;
                goto LABEL_500;
              }
            }
            int v84 = v68 ^ 1;
            int v232 = __sb__runningInSpringBoard();
            if (v232)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v68 = [MEMORY[0x1E4F42D90] mainScreen];
              [(id)v68 _referenceBounds];
            }
            int v85 = v232 ^ 1;
            BSSizeRoundForScale();
LABEL_500:
            if (v85) {

            }
            if (v84) {
            if (v83)
            }
            {

              if (!v82) {
                goto LABEL_506;
              }
            }
            else if (!v82)
            {
LABEL_506:
              if (v81) {
                goto LABEL_507;
              }
              goto LABEL_511;
            }

            if (v81)
            {
LABEL_507:

              if (!v80) {
                goto LABEL_513;
              }
              goto LABEL_512;
            }
LABEL_511:
            if (!v80)
            {
LABEL_513:
              if (v286) {

              }
              if (v290) {
              if (v294)
              }

              if (v298) {
              if (v302)
              }

              if (HIDWORD(v302)) {
              if (v306)
              }

              if (HIDWORD(v306)) {
              if (HIDWORD(v298))
              }

              if (*(_DWORD *)v308) {
              if (*(_DWORD *)&v308[4])
              }

              if (*(_DWORD *)&v308[16]) {
              if (*(_DWORD *)&v308[8])
              }

              if (*(_DWORD *)&v308[12]) {
              if (*(_DWORD *)&v308[28])
              }

              if (*(_DWORD *)&v308[32]) {
              if (*(_DWORD *)&v308[20])
              }

              if (*(_DWORD *)&v308[36]) {
              if (*(_DWORD *)&v308[48])
              }

              if (*(_DWORD *)&v308[40]) {
              if (*(_DWORD *)&v308[60])
              }

              if (*(_DWORD *)&v308[64]) {
              if (*(_DWORD *)&v308[24])
              }

              if (*(_DWORD *)&v308[44]) {
              if (*(_DWORD *)&v308[52])
              }

              if (*(_DWORD *)&v308[68]) {
              if (*(_DWORD *)&v308[56])
              }

              if (*(_DWORD *)&v308[72]) {
              if (*(_DWORD *)&v308[76])
              }

              if (*(_DWORD *)&v308[80]) {
              if (*(_DWORD *)&v308[84])
              }

              if (*(_DWORD *)&v308[96]) {
              if (*(_DWORD *)&v308[88])
              }

              if (*(_DWORD *)&v308[92]) {
              if (*(_DWORD *)&v309[4])
              }

              if (*(_DWORD *)&v309[8]) {
              if (*(_DWORD *)&v309[12])
              }

              if (*(_DWORD *)&v309[20]) {
              if (*(_DWORD *)&v309[24])
              }

              if (*(_DWORD *)&v309[28]) {
              if (*(_DWORD *)&v309[32])
              }

              if (*(_DWORD *)&v309[36]) {
              if (*(_DWORD *)&v309[40])
              }

              if (*(_DWORD *)v309) {
              if (*(_DWORD *)&v309[16])
              }

              if (v310) {
              if (!HIDWORD(v310))
              }
                goto LABEL_608;
              BOOL v54 = v283;
              goto LABEL_607;
            }
LABEL_512:

            goto LABEL_513;
          }
        }
        else
        {
          id v2 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v2 userInterfaceIdiom])
          {
            int v83 = 0;
            int v82 = 1;
            goto LABEL_1801;
          }
        }
        int v82 = v224 ^ 1;
        uint64_t v68 = __sb__runningInSpringBoard();
        if (v68)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
          [v5 _referenceBounds];
        }
        int v83 = v68 ^ 1;
        BSSizeRoundForScale();
        if (v226 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v84 = 0;
          int v85 = 0;
          goto LABEL_500;
        }
        goto LABEL_1801;
      }
    }
    memset(v308, 0, sizeof(v308));
    uint64_t v298 = 0;
    uint64_t v302 = 0;
    uint64_t v306 = 0;
    int v294 = 0;
    int v290 = 0;
    int v286 = 0;
    int v80 = 0;
    int v81 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    *(_DWORD *)&v309[4] = v68 ^ 1;
    goto LABEL_500;
  }
  uint64_t v17 = &CSTimeLabelLandscapeBaselineY;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v310 = 0;
      goto LABEL_276;
    }
  }
  else
  {
    v283 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v283 userInterfaceIdiom] != 1)
    {
      uint64_t v310 = 0x100000000;
      goto LABEL_276;
    }
  }
  HIDWORD(v310) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v23 = __sb__runningInSpringBoard();
    if (v23)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v274 = [MEMORY[0x1E4F42D90] mainScreen];
      [v274 _referenceBounds];
    }
    uint64_t v70 = v23 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v310) = v70;
    if (v100 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v99 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      memset(v309, 0, sizeof(v309));
      memset(v308, 0, sizeof(v308));
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D85062F0;
      goto LABEL_614;
    }
  }
  else
  {
    LODWORD(v310) = 0;
  }
LABEL_276:
  int v64 = __sb__runningInSpringBoard();
  if (v64)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_DWORD *)&v309[16] = 0;
      *(_DWORD *)v309 = 0;
      goto LABEL_297;
    }
  }
  else
  {
    v282 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v282 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)v309 = 0;
      *(_DWORD *)&v309[16] = 1;
      goto LABEL_297;
    }
  }
  *(_DWORD *)&v309[16] = v64 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v65 = __sb__runningInSpringBoard();
    if (v65)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v273 = [MEMORY[0x1E4F42D90] mainScreen];
      [v273 _referenceBounds];
    }
    uint64_t v70 = v65 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)v309 = v70;
    if (v102 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      memset(&v309[20], 0, 24);
      *(void *)&v309[8] = 0;
      *(_DWORD *)&v309[4] = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506318;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)v309 = 0;
  }
LABEL_297:
  int v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v309[36] = 0;
      goto LABEL_424;
    }
  }
  else
  {
    v281 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v281 userInterfaceIdiom] != 1)
    {
      *(void *)&v309[36] = 0x100000000;
      goto LABEL_424;
    }
  }
  *(_DWORD *)&v309[40] = v69 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v272 = [MEMORY[0x1E4F42D90] mainScreen];
      [v272 _referenceBounds];
    }
    *(_DWORD *)&v309[36] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v105 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      *(void *)&v309[20] = 0;
      *(void *)&v309[28] = 0;
      *(void *)&v309[8] = 0;
      *(_DWORD *)&v309[4] = 0;
      memset(v308, 0, sizeof(v308));
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506308;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v309[36] = 0;
  }
LABEL_424:
  int v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v309[28] = 0;
      goto LABEL_455;
    }
  }
  else
  {
    v280 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v280 userInterfaceIdiom] != 1)
    {
      *(void *)&v309[28] = 0x100000000;
      goto LABEL_455;
    }
  }
  *(_DWORD *)&v309[32] = v73 ^ 1;
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v277 = [MEMORY[0x1E4F42D90] mainScreen];
    [v277 _referenceBounds];
  }
  *(_DWORD *)&v309[28] = v70 ^ 1;
  BSSizeRoundForScale();
  if (v78 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    *(void *)&v309[20] = 0;
    *(void *)&v309[8] = 0;
    *(_DWORD *)&v309[4] = 0;
    memset(v308, 0, sizeof(v308));
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506310;
    goto LABEL_614;
  }
LABEL_455:
  int v79 = __sb__runningInSpringBoard();
  if (v79)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v309[20] = 0;
      goto LABEL_475;
    }
  }
  else
  {
    v279 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v279 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v309[20] = 0;
      *(_DWORD *)&v309[24] = 1;
      goto LABEL_475;
    }
  }
  *(_DWORD *)&v309[24] = v79 ^ 1;
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v275 = [MEMORY[0x1E4F42D90] mainScreen];
    [v275 _referenceBounds];
  }
  *(_DWORD *)&v309[20] = v70 ^ 1;
  BSSizeRoundForScale();
  if (v95 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    *(void *)&v309[8] = 0;
    *(_DWORD *)&v309[4] = 0;
    memset(v308, 0, sizeof(v308));
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506300;
    goto LABEL_614;
  }
LABEL_475:
  int v96 = __sb__runningInSpringBoard();
  if (v96)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v309[8] = 0;
      goto LABEL_739;
    }
  }
  else
  {
    v278 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v278 userInterfaceIdiom] != 1)
    {
      *(void *)&v309[8] = 0x100000000;
      goto LABEL_739;
    }
  }
  *(_DWORD *)&v309[12] = v96 ^ 1;
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v271 = [MEMORY[0x1E4F42D90] mainScreen];
    [v271 _referenceBounds];
  }
  *(_DWORD *)&v309[8] = v70 ^ 1;
  BSSizeRoundForScale();
  if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    *(_DWORD *)&v309[4] = 0;
    memset(v308, 0, sizeof(v308));
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062F8;
    goto LABEL_614;
  }
LABEL_739:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_741;
    }
LABEL_747:
    memset(v308, 0, sizeof(v308));
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062E8;
    *(_DWORD *)&v309[4] = v70 ^ 1;
    goto LABEL_614;
  }
  v276 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v276 userInterfaceIdiom] == 1) {
    goto LABEL_747;
  }
LABEL_741:
  *(_DWORD *)&v309[4] = v70 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_745:
    *(void *)&v308[88] = 0;
    goto LABEL_918;
  }
  int v110 = __sb__runningInSpringBoard();
  if (v110)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_745;
    }
  }
  else
  {
    v269 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v269 userInterfaceIdiom])
    {
      *(void *)&v308[88] = 0x100000000;
      goto LABEL_918;
    }
  }
  *(_DWORD *)&v308[92] = v110 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v262 = [MEMORY[0x1E4F42D90] mainScreen];
      [v262 _referenceBounds];
    }
    *(_DWORD *)&v308[88] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v133 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      *(_DWORD *)&v308[96] = 0;
      memset(v308, 0, 88);
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D85062C8;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v308[88] = 0;
  }
LABEL_918:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v308[96] = 0;
      *(_DWORD *)&v308[84] = 0;
      goto LABEL_928;
    }
  }
  else
  {
    v270 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v270 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[84] = 0;
      *(_DWORD *)&v308[96] = 1;
      goto LABEL_928;
    }
  }
  *(_DWORD *)&v308[96] = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v265 = [MEMORY[0x1E4F42D90] mainScreen];
      [v265 _referenceBounds];
    }
    *(_DWORD *)&v308[84] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_932;
    }
  }
  else
  {
    *(_DWORD *)&v308[84] = 0;
  }
LABEL_928:
  if (_SBF_Private_IsD94Like())
  {
    memset(v308, 0, 84);
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062D0;
    goto LABEL_614;
  }
LABEL_932:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_936:
    *(void *)&v308[76] = 0;
    goto LABEL_1041;
  }
  int v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_936;
    }
  }
  else
  {
    v266 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v266 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[76] = 0;
      *(_DWORD *)&v308[80] = 1;
      goto LABEL_1041;
    }
  }
  *(_DWORD *)&v308[80] = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v257 = [MEMORY[0x1E4F42D90] mainScreen];
      [v257 _referenceBounds];
    }
    *(_DWORD *)&v308[76] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v149 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v308, 0, 76);
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D85062D8;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v308[76] = 0;
  }
LABEL_1041:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v308[72] = 0;
      *(_DWORD *)&v308[56] = 0;
      goto LABEL_1051;
    }
  }
  else
  {
    v268 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v268 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[56] = 0;
      *(_DWORD *)&v308[72] = 1;
      goto LABEL_1051;
    }
  }
  *(_DWORD *)&v308[72] = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v261 = [MEMORY[0x1E4F42D90] mainScreen];
      [v261 _referenceBounds];
    }
    *(_DWORD *)&v308[56] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v139 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1055;
    }
  }
  else
  {
    *(_DWORD *)&v308[56] = 0;
  }
LABEL_1051:
  if (_SBF_Private_IsD64Like())
  {
    *(void *)&v308[64] = 0;
    *(_DWORD *)&v308[60] = 0;
    memset(v308, 0, 56);
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062E0;
    goto LABEL_614;
  }
LABEL_1055:
  int v140 = __sb__runningInSpringBoard();
  if (v140)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v308[68] = 0;
      *(_DWORD *)&v308[52] = 0;
      goto LABEL_1065;
    }
  }
  else
  {
    v267 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v267 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[52] = 0;
      *(_DWORD *)&v308[68] = 1;
      goto LABEL_1065;
    }
  }
  *(_DWORD *)&v308[68] = v140 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v141 = __sb__runningInSpringBoard();
    if (v141)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v258 = [MEMORY[0x1E4F42D90] mainScreen];
      [v258 _referenceBounds];
    }
    uint64_t v70 = v141 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v308[52] = v70;
    if (v146 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)&v308[60] = 0;
      memset(v308, 0, 52);
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D85062B8;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v308[52] = 0;
  }
LABEL_1065:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v308[44] = 0;
      *(_DWORD *)&v308[24] = 0;
      goto LABEL_1092;
    }
  }
  else
  {
    v264 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v264 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[24] = 0;
      *(_DWORD *)&v308[44] = 1;
      goto LABEL_1092;
    }
  }
  *(_DWORD *)&v308[44] = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v256 = [MEMORY[0x1E4F42D90] mainScreen];
      [v256 _referenceBounds];
    }
    *(_DWORD *)&v308[24] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1138;
    }
  }
  else
  {
    *(_DWORD *)&v308[24] = 0;
  }
LABEL_1092:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v308[60] = 0;
    *(_DWORD *)&v308[48] = 0;
    *(_OWORD *)&v308[28] = 0uLL;
    memset(v308, 0, 24);
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062C0;
    goto LABEL_614;
  }
LABEL_1138:
  int v155 = __sb__runningInSpringBoard();
  if (v155)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v308[60] = 0;
      goto LABEL_1158;
    }
  }
  else
  {
    v263 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v263 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[60] = 0;
      *(_DWORD *)&v308[64] = 1;
      goto LABEL_1158;
    }
  }
  *(_DWORD *)&v308[64] = v155 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v253 = [MEMORY[0x1E4F42D90] mainScreen];
      [v253 _referenceBounds];
    }
    *(_DWORD *)&v308[60] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v161 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_DWORD *)&v308[48] = 0;
      *(_OWORD *)&v308[28] = 0uLL;
      memset(v308, 0, 24);
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506288;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v308[60] = 0;
  }
LABEL_1158:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v308[40] = 0;
      *(_DWORD *)&v308[48] = 0;
      goto LABEL_1200;
    }
  }
  else
  {
    v260 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v260 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[48] = 0;
      *(_DWORD *)&v308[40] = 1;
      goto LABEL_1200;
    }
  }
  *(_DWORD *)&v308[40] = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    *(_DWORD *)&v308[48] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v165 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1250;
    }
  }
  else
  {
    *(_DWORD *)&v308[48] = 0;
  }
LABEL_1200:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    *(void *)&v308[32] = 0;
    *(_DWORD *)&v308[28] = 0;
    memset(v308, 0, 24);
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506290;
    goto LABEL_614;
  }
LABEL_1250:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1254:
    *(_DWORD *)&v308[36] = 0;
    *(_DWORD *)&v308[20] = 0;
    goto LABEL_1366;
  }
  int v166 = __sb__runningInSpringBoard();
  if (v166)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1254;
    }
  }
  else
  {
    v255 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v255 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[20] = 0;
      *(_DWORD *)&v308[36] = 1;
      goto LABEL_1366;
    }
  }
  *(_DWORD *)&v308[36] = v166 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v246 = [MEMORY[0x1E4F42D90] mainScreen];
      [v246 _referenceBounds];
    }
    *(_DWORD *)&v308[20] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v183 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      *(void *)&v308[28] = 0;
      memset(v308, 0, 20);
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506278;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v308[20] = 0;
  }
LABEL_1366:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v308[28] = 0;
      goto LABEL_1376;
    }
  }
  else
  {
    v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[28] = 0;
      *(_DWORD *)&v308[32] = 1;
      goto LABEL_1376;
    }
  }
  *(_DWORD *)&v308[32] = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v249 = [MEMORY[0x1E4F42D90] mainScreen];
      [v249 _referenceBounds];
    }
    *(_DWORD *)&v308[28] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v175 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1380;
    }
  }
  else
  {
    *(_DWORD *)&v308[28] = 0;
  }
LABEL_1376:
  if (_SBF_Private_IsD93Like())
  {
    memset(v308, 0, 20);
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506280;
    goto LABEL_614;
  }
LABEL_1380:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1384:
    *(void *)&v308[8] = 0;
    goto LABEL_1488;
  }
  int v176 = __sb__runningInSpringBoard();
  if (v176)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1384;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      *(void *)&v308[8] = 0x100000000;
      goto LABEL_1488;
    }
  }
  *(_DWORD *)&v308[12] = v176 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v242 = [MEMORY[0x1E4F42D90] mainScreen];
      [v242 _referenceBounds];
    }
    *(_DWORD *)&v308[8] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v196 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      *(_DWORD *)&v308[16] = 0;
      *(void *)v308 = 0;
      uint64_t v299 = 0;
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D85062A8;
      goto LABEL_614;
    }
  }
  else
  {
    *(_DWORD *)&v308[8] = 0;
  }
LABEL_1488:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v308[16] = 0;
      *(_DWORD *)&v308[4] = 0;
      goto LABEL_1498;
    }
  }
  else
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      *(_DWORD *)&v308[4] = 0;
      *(_DWORD *)&v308[16] = 1;
      goto LABEL_1498;
    }
  }
  *(_DWORD *)&v308[16] = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v245 = [MEMORY[0x1E4F42D90] mainScreen];
      [v245 _referenceBounds];
    }
    *(_DWORD *)&v308[4] = v70 ^ 1;
    BSSizeRoundForScale();
    if (v188 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1502;
    }
  }
  else
  {
    *(_DWORD *)&v308[4] = 0;
  }
LABEL_1498:
  if (_SBF_Private_IsD63Like())
  {
    *(_DWORD *)v308 = 0;
    uint64_t v299 = 0;
    uint64_t v303 = 0;
    uint64_t v307 = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062B0;
    goto LABEL_614;
  }
LABEL_1502:
  int v189 = __sb__runningInSpringBoard();
  if (v189)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v308 = 0;
      HIDWORD(v299) = 0;
      goto LABEL_1512;
    }
  }
  else
  {
    v251 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v251 userInterfaceIdiom])
    {
      HIDWORD(v299) = 0;
      *(_DWORD *)v308 = 1;
      goto LABEL_1512;
    }
  }
  *(_DWORD *)v308 = v189 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v243 = [MEMORY[0x1E4F42D90] mainScreen];
      [v243 _referenceBounds];
    }
    HIDWORD(v299) = v70 ^ 1;
    BSSizeRoundForScale();
    if (v193 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v303 = 0;
      uint64_t v307 = 0;
      LODWORD(v299) = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506298;
      goto LABEL_614;
    }
  }
  else
  {
    HIDWORD(v299) = 0;
  }
LABEL_1512:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v307 = 0;
      goto LABEL_1531;
    }
  }
  else
  {
    v248 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v248 userInterfaceIdiom])
    {
      uint64_t v307 = 0x100000000;
      goto LABEL_1531;
    }
  }
  HIDWORD(v307) = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v241 = [MEMORY[0x1E4F42D90] mainScreen];
      [v241 _referenceBounds];
    }
    LODWORD(v307) = v70 ^ 1;
    BSSizeRoundForScale();
    if (v199 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1575;
    }
  }
  else
  {
    LODWORD(v307) = 0;
  }
LABEL_1531:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v303 = 0;
    LODWORD(v299) = 0;
    int v295 = 0;
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D85062A0;
    goto LABEL_614;
  }
LABEL_1575:
  int v200 = __sb__runningInSpringBoard();
  if (v200)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v303 = 0;
      goto LABEL_1605;
    }
  }
  else
  {
    v247 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v247 userInterfaceIdiom])
    {
      uint64_t v303 = 0x100000000;
      goto LABEL_1605;
    }
  }
  HIDWORD(v303) = v200 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v240 = [MEMORY[0x1E4F42D90] mainScreen];
      [v240 _referenceBounds];
    }
    LODWORD(v303) = v70 ^ 1;
    BSSizeRoundForScale();
    if (v205 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v299) = 0;
      int v295 = 0;
      int v291 = 0;
      int v287 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506268;
      goto LABEL_614;
    }
  }
  else
  {
    LODWORD(v303) = 0;
  }
LABEL_1605:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v299) = 0;
      int v295 = 0;
      goto LABEL_1625;
    }
  }
  else
  {
    v244 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v244 userInterfaceIdiom])
    {
      int v295 = 0;
      LODWORD(v299) = 1;
      goto LABEL_1625;
    }
  }
  LODWORD(v299) = v70 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    int v295 = v70 ^ 1;
    BSSizeRoundForScale();
    if (v207 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1649;
    }
  }
  else
  {
    int v295 = 0;
  }
LABEL_1625:
  if (_SBF_Private_IsD53())
  {
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506270;
    goto LABEL_614;
  }
LABEL_1649:
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506248;
    goto LABEL_614;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506250;
    goto LABEL_614;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506238;
    goto LABEL_614;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v291 = 0;
    int v287 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506240;
    goto LABEL_614;
  }
  int v209 = __sb__runningInSpringBoard();
  if (v209)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v291 = 0;
      int v287 = 0;
      goto LABEL_1771;
    }
  }
  else
  {
    v238 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v238 userInterfaceIdiom])
    {
      int v287 = 0;
      int v291 = 1;
      goto LABEL_1771;
    }
  }
  int v291 = v209 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    int v287 = v70 ^ 1;
    BSSizeRoundForScale();
    if (v229 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506258;
      goto LABEL_614;
    }
  }
  else
  {
    int v287 = 0;
  }
LABEL_1771:
  int v223 = __sb__runningInSpringBoard();
  if (v223)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v86 = 0;
      int v87 = 0;
      goto LABEL_1791;
    }
  }
  else
  {
    v237 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v237 userInterfaceIdiom])
    {
      int v87 = 0;
      int v86 = 1;
      goto LABEL_1791;
    }
  }
  int v86 = v223 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v235 = [MEMORY[0x1E4F42D90] mainScreen];
      [v235 _referenceBounds];
    }
    int v87 = v70 ^ 1;
    BSSizeRoundForScale();
    if (v231 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v88 = 0;
      int v89 = 0;
      int v90 = 0;
      int v91 = 0;
      uint64_t v92 = &qword_1D8506260;
      goto LABEL_614;
    }
  }
  else
  {
    int v87 = 0;
  }
LABEL_1791:
  int v225 = __sb__runningInSpringBoard();
  if (v225)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v88 = 0;
      int v89 = 0;
      goto LABEL_1812;
    }
  }
  else
  {
    id v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {
      int v89 = 0;
      int v88 = 1;
      goto LABEL_1812;
    }
  }
  int v88 = v225 ^ 1;
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  int v89 = v70 ^ 1;
  BSSizeRoundForScale();
  if (v227 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v90 = 0;
    int v91 = 0;
    uint64_t v92 = &qword_1D8506230;
    goto LABEL_614;
  }
LABEL_1812:
  uint64_t v70 = __sb__runningInSpringBoard();
  if (v70)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v90 = 0;
      int v91 = 0;
LABEL_1839:
      uint64_t v92 = &CSTimeLabelLandscapeBaselineY;
      goto LABEL_614;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v17 userInterfaceIdiom])
    {
      int v91 = 0;
      int v90 = 1;
      goto LABEL_1839;
    }
  }
  int v90 = v70 ^ 1;
  int v233 = __sb__runningInSpringBoard();
  if (v233)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v70 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v70 _referenceBounds];
  }
  int v91 = v233 ^ 1;
  BSSizeRoundForScale();
  if (v234 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1839;
  }
  uint64_t v92 = &qword_1D8506228;
LABEL_614:
  double v106 = *(double *)v92;
  if (v91) {

  }
  if (v90) {
  if (v89)
  }
  {

    if (!v88) {
      goto LABEL_620;
    }
  }
  else if (!v88)
  {
LABEL_620:
    if (v87) {
      goto LABEL_621;
    }
    goto LABEL_625;
  }

  if (v87)
  {
LABEL_621:

    if (!v86) {
      goto LABEL_627;
    }
    goto LABEL_626;
  }
LABEL_625:
  if (v86) {
LABEL_626:
  }

LABEL_627:
  if (v287) {

  }
  if (v291) {
  if (v295)
  }

  if (v299) {
  if (v303)
  }

  if (HIDWORD(v303)) {
  if (v307)
  }

  if (HIDWORD(v307)) {
  if (HIDWORD(v299))
  }

  if (*(_DWORD *)v308) {
  if (*(_DWORD *)&v308[4])
  }

  if (*(_DWORD *)&v308[16]) {
  if (*(_DWORD *)&v308[8])
  }

  if (*(_DWORD *)&v308[12]) {
  if (*(_DWORD *)&v308[28])
  }

  if (*(_DWORD *)&v308[32]) {
  if (*(_DWORD *)&v308[20])
  }

  if (*(_DWORD *)&v308[36]) {
  if (*(_DWORD *)&v308[48])
  }

  if (*(_DWORD *)&v308[40]) {
  if (*(_DWORD *)&v308[60])
  }

  if (*(_DWORD *)&v308[64]) {
  if (*(_DWORD *)&v308[24])
  }

  if (*(_DWORD *)&v308[44]) {
  if (*(_DWORD *)&v308[52])
  }

  if (*(_DWORD *)&v308[68]) {
  if (*(_DWORD *)&v308[56])
  }

  if (*(_DWORD *)&v308[72]) {
  if (*(_DWORD *)&v308[76])
  }

  if (*(_DWORD *)&v308[80]) {
  if (*(_DWORD *)&v308[84])
  }

  if (*(_DWORD *)&v308[96]) {
  if (*(_DWORD *)&v308[88])
  }

  if (*(_DWORD *)&v308[92]) {
  if (*(_DWORD *)&v309[4])
  }

  if (*(_DWORD *)&v309[8]) {
  if (*(_DWORD *)&v309[12])
  }

  if (*(_DWORD *)&v309[20]) {
  if (*(_DWORD *)&v309[24])
  }

  if (*(_DWORD *)&v309[28]) {
  if (*(_DWORD *)&v309[32])
  }

  if (*(_DWORD *)&v309[36]) {
  if (*(_DWORD *)&v309[40])
  }

  if (*(_DWORD *)v309) {
  if (*(_DWORD *)&v309[16])
  }

  if (v310) {
  if (HIDWORD(v310))
  }

  return v106;
}

- (double)windowedAccessoryInset
{
  int v3 = __sb__runningInSpringBoard();
  uint64_t v4 = (uint64_t)&CSWindowedAccessoryInset;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    int v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      uint64_t v5 = 0;
      int v6 = 1;
      goto LABEL_10;
    }
  }
  int v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v121 = [MEMORY[0x1E4F42D90] mainScreen];
      [v121 _referenceBounds];
    }
    uint64_t v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v143 = v7 ^ 1;
      int v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v140 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v141 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D85065F0;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_10:
  int v8 = __sb__runningInSpringBoard();
  int v143 = v5;
  int v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    double v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_19;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [v111 _referenceBounds];
    }
    int v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v140 = v7 ^ 1;
      int v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506618;
      goto LABEL_67;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_19:
  int v11 = __sb__runningInSpringBoard();
  int v140 = v9;
  int v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    int v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_28;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    int v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v138 = v7 ^ 1;
      int v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      uint64_t v125 = 0;
      uint64_t v124 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506608;
      goto LABEL_67;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_28:
  int v14 = __sb__runningInSpringBoard();
  int v138 = v12;
  int v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      uint64_t v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    double v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      uint64_t v2 = 1;
      goto LABEL_37;
    }
  }
  uint64_t v2 = v14 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v114 = [MEMORY[0x1E4F42D90] mainScreen];
    [v114 _referenceBounds];
  }
  int v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v136 = v7 ^ 1;
    int v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    long long v135 = 0uLL;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506610;
    goto LABEL_67;
  }
LABEL_37:
  int v17 = __sb__runningInSpringBoard();
  int v136 = v15;
  int v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v142 = 0;
      uint64_t v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    double v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      int v142 = 0;
      uint64_t v4 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v4 = v17 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v112 = [MEMORY[0x1E4F42D90] mainScreen];
    [v112 _referenceBounds];
  }
  int v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(void *)&long long v135 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506600;
    goto LABEL_67;
  }
LABEL_47:
  int v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    double v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v109 = [MEMORY[0x1E4F42D90] mainScreen];
    [v109 _referenceBounds];
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065F8;
    goto LABEL_67;
  }
LABEL_178:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065E8;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  double v113 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v113 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)double v134 = 0;
    goto LABEL_194;
  }
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    double v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(void *)double v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)double v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D85065C8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    int v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v103 = [MEMORY[0x1E4F42D90] mainScreen];
      [v103 _referenceBounds];
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065D0;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v133[28] = 0;
    goto LABEL_222;
  }
  int v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    uint64_t v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D85065D8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    double v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v99 = [MEMORY[0x1E4F42D90] mainScreen];
      [v99 _referenceBounds];
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)double v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065E0;
    goto LABEL_67;
  }
LABEL_236:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    double v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    uint64_t v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)double v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D85065B8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)double v133 = 0;
      *(_DWORD *)double v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    double v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      *(_DWORD *)double v132 = 0;
      *(_DWORD *)double v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)double v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    *(_DWORD *)double v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)double v132 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v133[4] = 0;
    *(void *)&v132[4] = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065C0;
    goto LABEL_67;
  }
LABEL_266:
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    double v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    uint64_t v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v132[4] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506588;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    double v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v90 = [MEMORY[0x1E4F42D90] mainScreen];
      [v90 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506590;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v130 = 0;
    goto LABEL_306;
  }
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    double v93 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v93 userInterfaceIdiom])
    {
      uint64_t v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    uint64_t v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506578;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      uint64_t v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    double v97 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v97 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    uint64_t v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v131) = v7;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506580;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v128 = 0;
    goto LABEL_334;
  }
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    int v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v129 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D85065A8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    uint64_t v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      int v129 = 1;
      goto LABEL_344;
    }
  }
  int v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v127) = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065B0;
    goto LABEL_67;
  }
LABEL_348:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    int v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      LODWORD(v124) = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506598;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    int v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_378;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v125 = 0;
    LODWORD(v124) = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D85065A0;
    goto LABEL_67;
  }
LABEL_378:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    int v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v123 = 0;
      LODWORD(v125) = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506568;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      uint64_t v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    int v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    uint64_t v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_405;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_398:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506570;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506548;
    goto LABEL_67;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506550;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506538;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506540;
    goto LABEL_67;
  }
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      int v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    double v76 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v76 userInterfaceIdiom])
    {
      int v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v74 = [MEMORY[0x1E4F42D90] mainScreen];
      [v74 _referenceBounds];
    }
    int v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506558;
      goto LABEL_67;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_425:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v18 = 0;
      int v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    int v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v75 userInterfaceIdiom])
    {
      int v19 = 0;
      int v18 = 1;
      goto LABEL_435;
    }
  }
  int v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v73 = [MEMORY[0x1E4F42D90] mainScreen];
      [v73 _referenceBounds];
    }
    int v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = &qword_1D8506560;
      goto LABEL_67;
    }
  }
  else
  {
    int v19 = 0;
  }
LABEL_435:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v20 = 0;
      int v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v7 userInterfaceIdiom])
    {
      int v21 = 0;
      int v20 = 1;
      goto LABEL_445;
    }
  }
  int v20 = v5 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = &qword_1D8506530;
    goto LABEL_67;
  }
LABEL_445:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
LABEL_462:
      int v24 = &CSWindowedAccessoryInset;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_462;
    }
  }
  int v22 = v4 ^ 1;
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  int v24 = &qword_1D8506528;
LABEL_67:
  double v32 = *(double *)v24;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v122)
  }

  if (v123) {
  if (v125)
  }

  if (HIDWORD(v123)) {
  if (v124)
  }

  if (HIDWORD(v125)) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (HIDWORD(v124))
  }

  if (v127) {
  if (HIDWORD(v127))
  }

  if (v129) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (v130)
  }

  if (HIDWORD(v130)) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v133[4])
  }

  if (*(_DWORD *)&v133[8]) {
  if (*(_DWORD *)v132)
  }

  if (*(_DWORD *)v133) {
  if (*(_DWORD *)&v133[12])
  }

  if (*(_DWORD *)&v133[20]) {
  if (*(_DWORD *)&v133[16])
  }

  if (*(_DWORD *)&v133[24]) {
  if (*(_DWORD *)&v133[28])
  }

  if (*(_DWORD *)&v133[32]) {
  if (*(_DWORD *)&v133[36])
  }

  if (*(_DWORD *)&v134[8]) {
  if (*(_DWORD *)&v134[4])
  }

  if (*(_DWORD *)v134) {
  if (v135)
  }

  if (DWORD1(v135)) {
  if (DWORD2(v135))
  }

  if (v142)
  {

    if (!HIDWORD(v135)) {
      goto LABEL_155;
    }
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144) {
      return v32;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (v144) {
LABEL_173:
  }

  return v32;
}

- (double)timeToSubtitleLabelBaselineDifferenceY
{
  if (self->_wantsAccessibilityContentSizes)
  {
    [(CSCoverSheetViewController *)self _updateAccessibilityContentSizesIfNeeded];
    return self->_accessibilityTimeSubtitleBaselineY;
  }
  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  uint64_t v7 = (void *)(v6 & 0xFFFFFFFFFFFFFFFBLL);
  int v8 = __sb__runningInSpringBoard();
  char v9 = v8;
  if (v7 == (void *)1)
  {
    if (v8)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v10 = 0x4044000000000000;
        return *(double *)&v10;
      }
      goto LABEL_13;
    }
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v7 userInterfaceIdiom] == 1)
    {
LABEL_13:
      int v11 = __sb__runningInSpringBoard();
      char v12 = v11;
      if (v11)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      BOOL v15 = v14 < *(double *)(MEMORY[0x1E4FA6E50] + 264);
      double v16 = 40.0;
      double v17 = 46.0;
      goto LABEL_25;
    }
    uint64_t v13 = 0x4044000000000000;
LABEL_18:
    double v4 = *(double *)&v13;
LABEL_31:

    return v4;
  }
  if (v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v10 = 0x4041000000000000;
      return *(double *)&v10;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v7 userInterfaceIdiom])
    {
      uint64_t v13 = 0x4041000000000000;
      goto LABEL_18;
    }
  }
  int v18 = __sb__runningInSpringBoard();
  char v12 = v18;
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v15 = v19 < *(double *)(MEMORY[0x1E4FA6E50] + 40);
  double v16 = 34.0;
  double v17 = 37.0;
LABEL_25:
  if (v15) {
    double v4 = v16;
  }
  else {
    double v4 = v17;
  }
  if ((v12 & 1) == 0) {

  }
  if ((v9 & 1) == 0) {
    goto LABEL_31;
  }
  return v4;
}

- (double)timeLabelOffsetForScrollPercent:(double)a3
{
  uint64_t v5 = [(CSCoverSheetViewController *)self mainPageContentViewController];
  [(CSCoverSheetViewController *)self _timeLabelScrollPercentForDateTimeLayout:[(CSCoverSheetViewController *)self _dateTimeLayoutForPage:v5]];
  double v7 = v6;
  if ((BSFloatIsZero() & 1) == 0)
  {
    int v8 = [(CSCoverSheetViewController *)self _allowedPageViewControllers];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = [(CSCoverSheetViewController *)self _pageForScrollPercent:a3];
      [(CSCoverSheetViewController *)self _timeLabelScrollPercentForDateTimeLayout:[(CSCoverSheetViewController *)self _dateTimeLayoutForPage:v10]];
      double v12 = -a3;
      if (a3 >= 0.0) {
        double v12 = a3;
      }
      double v7 = v7 + v12 * (v11 - v7);
    }
  }

  return v7;
}

- (double)_timeLabelScrollPercentForDateTimeLayout:(unint64_t)a3
{
  if (a3 == 3)
  {
    BOOL v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    double result = 1.0;
    double v5 = -1.0;
  }
  else
  {
    double result = 0.0;
    if (a3 != 2) {
      return result;
    }
    BOOL v4 = objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", 0.0) == 1;
    double result = -1.0;
    double v5 = 1.0;
  }
  if (v4) {
    return v5;
  }
  return result;
}

- (double)prominentBaselineToListY
{
  if (prominentBaselineToListY_onceToken != -1) {
    dispatch_once(&prominentBaselineToListY_onceToken, &__block_literal_global_2124);
  }
  return *(double *)&prominentBaselineToListY_prominentBaselineToListY;
}

void __62__CSCoverSheetViewController_Layout__prominentBaselineToListY__block_invoke()
{
  int v1 = __sb__runningInSpringBoard();
  uint64_t v2 = (uint64_t)&CSProminentBaselineToListY;
  if (v1)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v3 = 0;
      uint64_t v4 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    id v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v3 = 0;
      uint64_t v4 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v4 = v1 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v118 = [MEMORY[0x1E4F42D90] mainScreen];
      [v118 _referenceBounds];
    }
    int v3 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v7 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v6 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v142 = v5 ^ 1;
      int v143 = v4;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v141 = 0;
      int v129 = 0;
      int v136 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      uint64_t v137 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v138 = 0;
      int v120 = 0;
      int v139 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v140 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D85063F0;
      goto LABEL_66;
    }
  }
  else
  {
    int v3 = 0;
  }
LABEL_15:
  int v9 = __sb__runningInSpringBoard();
  int v142 = v3;
  int v143 = v4;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v10 = 0;
      uint64_t v0 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    double v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      int v10 = 0;
      uint64_t v0 = 1;
      goto LABEL_24;
    }
  }
  uint64_t v0 = v9 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v108 = [MEMORY[0x1E4F42D90] mainScreen];
      [v108 _referenceBounds];
    }
    int v10 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v28 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v139 = v5 ^ 1;
      int v140 = v0;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v141 = 0;
      int v129 = 0;
      int v136 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      uint64_t v137 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v138 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506418;
      goto LABEL_66;
    }
  }
  else
  {
    int v10 = 0;
  }
LABEL_24:
  int v11 = __sb__runningInSpringBoard();
  int v139 = v10;
  int v140 = v0;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    double v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_33;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v107 = [MEMORY[0x1E4F42D90] mainScreen];
      [v107 _referenceBounds];
    }
    int v12 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      HIDWORD(v137) = v5 ^ 1;
      int v138 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v141 = 0;
      int v129 = 0;
      int v136 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      LODWORD(v137) = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506408;
      goto LABEL_66;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_33:
  int v14 = __sb__runningInSpringBoard();
  HIDWORD(v137) = v12;
  int v138 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      int v16 = 0;
      goto LABEL_42;
    }
  }
  else
  {
    int v114 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v114 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      int v16 = 1;
      goto LABEL_42;
    }
  }
  int v16 = v14 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v111 = [MEMORY[0x1E4F42D90] mainScreen];
    [v111 _referenceBounds];
  }
  int v15 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v17 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v136 = v5 ^ 1;
    LODWORD(v137) = v16;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    long long v135 = 0uLL;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v141 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506410;
    goto LABEL_66;
  }
LABEL_42:
  int v18 = __sb__runningInSpringBoard();
  int v136 = v15;
  LODWORD(v137) = v16;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v141 = 0;
      uint64_t v2 = 0;
      goto LABEL_52;
    }
  }
  else
  {
    double v113 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v113 userInterfaceIdiom] != 1)
    {
      int v141 = 0;
      uint64_t v2 = 1;
      goto LABEL_52;
    }
  }
  uint64_t v2 = v18 ^ 1u;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v109 = [MEMORY[0x1E4F42D90] mainScreen];
    [v109 _referenceBounds];
  }
  int v141 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v26 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(void *)&long long v135 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506400;
    goto LABEL_66;
  }
LABEL_52:
  int v27 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v2;
  if (v27)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    int v112 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v112 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v27 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v106 = [MEMORY[0x1E4F42D90] mainScreen];
    [v106 _referenceBounds];
  }
  DWORD1(v135) = v5 ^ 1;
  BSSizeRoundForScale();
  if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063F8;
    goto LABEL_66;
  }
LABEL_178:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063E8;
    LODWORD(v135) = v5 ^ 1;
    goto LABEL_66;
  }
  int v110 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v110 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v135) = v5 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)double v134 = 0;
    goto LABEL_194;
  }
  int v31 = __sb__runningInSpringBoard();
  if (v31)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    uint64_t v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(void *)double v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)double v134 = v31 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v97 = [MEMORY[0x1E4F42D90] mainScreen];
      [v97 _referenceBounds];
    }
    *(_DWORD *)&v134[4] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D85063C8;
      goto LABEL_66;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    double v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)&v133[36] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v32 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063D0;
    goto LABEL_66;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v133[28] = 0;
    goto LABEL_222;
  }
  int v33 = __sb__runningInSpringBoard();
  if (v33)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    double v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v33 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v92 = [MEMORY[0x1E4F42D90] mainScreen];
      [v92 _referenceBounds];
    }
    *(_DWORD *)&v133[28] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D85063D8;
      goto LABEL_66;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    double v103 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v103 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    *(_DWORD *)&v133[16] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)double v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063E0;
    goto LABEL_66;
  }
LABEL_236:
  int v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    double v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v36 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v37 = __sb__runningInSpringBoard();
    if (v37)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v93 = [MEMORY[0x1E4F42D90] mainScreen];
      [v93 _referenceBounds];
    }
    uint64_t v5 = v37 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v5;
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)double v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D85063B8;
      goto LABEL_66;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)double v133 = 0;
      *(_DWORD *)double v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    double v99 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v99 userInterfaceIdiom])
    {
      *(_DWORD *)double v132 = 0;
      *(_DWORD *)double v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)double v133 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    *(_DWORD *)double v132 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v40 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)double v132 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v133[4] = 0;
    *(void *)&v132[4] = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063C0;
    goto LABEL_66;
  }
LABEL_266:
  int v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    double v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v42 = __sb__runningInSpringBoard();
    if (v42)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v88 = [MEMORY[0x1E4F42D90] mainScreen];
      [v88 _referenceBounds];
    }
    uint64_t v5 = v42 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v5;
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v132[4] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506388;
      goto LABEL_66;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    double v95 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v95 userInterfaceIdiom])
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506390;
    goto LABEL_66;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v130 = 0;
    goto LABEL_306;
  }
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    int v90 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v90 userInterfaceIdiom])
    {
      uint64_t v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v5 = v46 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v5;
    if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506378;
      goto LABEL_66;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  int v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      uint64_t v5 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    int v94 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v94 userInterfaceIdiom])
    {
      uint64_t v5 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v47 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v48 = __sb__runningInSpringBoard();
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    uint64_t v5 = v48 ^ 1u;
    BSSizeRoundForScale();
    if (v49 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v131) = v5;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506380;
    goto LABEL_66;
  }
LABEL_320:
  LODWORD(v131) = v5;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v128 = 0;
    goto LABEL_334;
  }
  int v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    int v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    LODWORD(v128) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v129 = 0;
      uint64_t v127 = 0;
      int v123 = 0;
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D85063A8;
      goto LABEL_66;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    int v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      int v129 = 1;
      goto LABEL_344;
    }
  }
  int v129 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    HIDWORD(v127) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v127) = 0;
    int v123 = 0;
    uint64_t v126 = 0;
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063B0;
    goto LABEL_66;
  }
LABEL_348:
  int v53 = __sb__runningInSpringBoard();
  if (v53)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      int v123 = 0;
      goto LABEL_358;
    }
  }
  else
  {
    int v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      int v123 = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v54 = __sb__runningInSpringBoard();
    if (v54)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    uint64_t v5 = v54 ^ 1u;
    BSSizeRoundForScale();
    int v123 = v5;
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v126 = 0;
      int v125 = 0;
      int v122 = 0;
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506398;
      goto LABEL_66;
    }
  }
  else
  {
    int v123 = 0;
  }
LABEL_358:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    int v83 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v83 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v76 = [MEMORY[0x1E4F42D90] mainScreen];
      [v76 _referenceBounds];
    }
    LODWORD(v126) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v57 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_378;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v125 = 0;
    int v122 = 0;
    int v121 = 0;
    int v124 = 0;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D85063A0;
    goto LABEL_66;
  }
LABEL_378:
  int v58 = __sb__runningInSpringBoard();
  if (v58)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v125 = 0;
      int v122 = 0;
      goto LABEL_388;
    }
  }
  else
  {
    int v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      int v122 = 0;
      int v125 = 1;
      goto LABEL_388;
    }
  }
  int v125 = v58 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v75 = [MEMORY[0x1E4F42D90] mainScreen];
      [v75 _referenceBounds];
    }
    int v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v121 = 0;
      int v124 = 0;
      int v120 = 0;
      int v119 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506368;
      goto LABEL_66;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_388:
  int v59 = __sb__runningInSpringBoard();
  if (v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v121 = 0;
      uint64_t v5 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    int v79 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v79 userInterfaceIdiom])
    {
      uint64_t v5 = 0;
      int v121 = 1;
      goto LABEL_398;
    }
  }
  int v121 = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v60 = __sb__runningInSpringBoard();
    if (v60)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v74 = [MEMORY[0x1E4F42D90] mainScreen];
      [v74 _referenceBounds];
    }
    uint64_t v5 = v60 ^ 1u;
    BSSizeRoundForScale();
    if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_405;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_398:
  if (_SBF_Private_IsD53())
  {
    int v124 = v5;
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506370;
    goto LABEL_66;
  }
LABEL_405:
  int v124 = v5;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506348;
    goto LABEL_66;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506350;
    goto LABEL_66;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506338;
    goto LABEL_66;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v120 = 0;
    int v119 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506340;
    goto LABEL_66;
  }
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v120 = 0;
      int v119 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    int v73 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v73 userInterfaceIdiom])
    {
      int v119 = 0;
      int v120 = 1;
      goto LABEL_425;
    }
  }
  int v120 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v71 = [MEMORY[0x1E4F42D90] mainScreen];
      [v71 _referenceBounds];
    }
    int v119 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506358;
      goto LABEL_66;
    }
  }
  else
  {
    int v119 = 0;
  }
LABEL_425:
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v19 = 0;
      int v20 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    double v72 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v72 userInterfaceIdiom])
    {
      int v20 = 0;
      int v19 = 1;
      goto LABEL_435;
    }
  }
  int v19 = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v70 = [MEMORY[0x1E4F42D90] mainScreen];
      [v70 _referenceBounds];
    }
    int v20 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      double v25 = &qword_1D8506360;
      goto LABEL_66;
    }
  }
  else
  {
    int v20 = 0;
  }
LABEL_435:
  int v64 = __sb__runningInSpringBoard();
  if (v64)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v21 = 0;
      int v22 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v22 = 0;
      int v21 = 1;
      goto LABEL_445;
    }
  }
  int v21 = v64 ^ 1;
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v0 _referenceBounds];
  }
  int v22 = v4 ^ 1;
  BSSizeRoundForScale();
  if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v23 = 0;
    int v24 = 0;
    double v25 = &qword_1D8506330;
    goto LABEL_66;
  }
LABEL_445:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v23 = 0;
      int v24 = 0;
LABEL_462:
      double v25 = &CSProminentBaselineToListY;
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom])
    {
      int v24 = 0;
      int v23 = 1;
      goto LABEL_462;
    }
  }
  int v23 = v4 ^ 1;
  int v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v24 = v68 ^ 1;
  BSSizeRoundForScale();
  if (v69 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  double v25 = &qword_1D8506328;
LABEL_66:
  prominentBaselineToListY_prominentBaselineToListY = *v25;
  if (v24) {

  }
  if (v23) {
  if (v22)
  }

  if (v21) {
  if (v20)
  }

  if (v19) {
  if (v119)
  }

  if (v120) {
  if (v124)
  }

  if (v121) {
  if (v122)
  }

  if (v125) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (v123)
  }

  if (v127) {
  if (HIDWORD(v127))
  }

  if (v129) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (v130)
  }

  if (HIDWORD(v130)) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v133[4])
  }

  if (*(_DWORD *)&v133[8]) {
  if (*(_DWORD *)v132)
  }

  if (*(_DWORD *)v133) {
  if (*(_DWORD *)&v133[12])
  }

  if (*(_DWORD *)&v133[20]) {
  if (*(_DWORD *)&v133[16])
  }

  if (*(_DWORD *)&v133[24]) {
  if (*(_DWORD *)&v133[28])
  }

  if (*(_DWORD *)&v133[32]) {
  if (*(_DWORD *)&v133[36])
  }

  if (*(_DWORD *)&v134[8]) {
  if (*(_DWORD *)&v134[4])
  }

  if (*(_DWORD *)v134) {
  if (v135)
  }

  if (DWORD1(v135)) {
  if (DWORD2(v135))
  }

  if (v141)
  {

    if (!HIDWORD(v135)) {
      goto LABEL_154;
    }
  }
  else if (!HIDWORD(v135))
  {
LABEL_154:
    if (v136) {
      goto LABEL_155;
    }
    goto LABEL_165;
  }

  if (v136)
  {
LABEL_155:

    if (!v137) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }
LABEL_165:
  if (!v137)
  {
LABEL_156:
    if (HIDWORD(v137)) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:

  if (HIDWORD(v137))
  {
LABEL_157:

    if (!v138) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }
LABEL_167:
  if (!v138)
  {
LABEL_158:
    if (v139) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:

  if (v139)
  {
LABEL_159:

    if (!v140) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:
  if (!v140)
  {
LABEL_160:
    if (v142) {
      goto LABEL_161;
    }
LABEL_171:
    if (!v143) {
      return;
    }
    goto LABEL_172;
  }
LABEL_170:

  if (!v142) {
    goto LABEL_171;
  }
LABEL_161:

  if (!v143) {
    return;
  }
LABEL_172:
}

- (double)dateBaselineToComplicationY
{
  return 16.0;
}

- (double)focusActivityHeight
{
  +[CSFocusActivityView activityViewSize];
  return v2;
}

- (double)listMinY
{
  unint64_t v3 = [(CSCoverSheetViewController *)self interfaceOrientation] - 1;
  uint64_t v4 = (void *)0x1E4F42000;
  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1 && v3 >= 2)
  {
    int v19 = __sb__runningInSpringBoard();
    uint64_t v20 = (uint64_t)&CSListLandscapeTopY;
    if (v19)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v21 = 0;
        int v22 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      int v141 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v141 userInterfaceIdiom] != 1)
      {
        uint64_t v21 = 0;
        int v22 = 1;
        goto LABEL_33;
      }
    }
    int v22 = v19 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v28 = __sb__runningInSpringBoard();
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v142 = [MEMORY[0x1E4F42D90] mainScreen];
        [v142 _referenceBounds];
      }
      uint64_t v21 = v28 ^ 1;
      BSSizeRoundForScale();
      if (v49 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v48 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        int v163 = v28 ^ 1;
        int v164 = v22;
        memset(v154, 0, sizeof(v154));
        memset(v153, 0, sizeof(v153));
        memset(v155, 0, sizeof(v155));
        uint64_t v151 = 0;
        memset(v156, 0, sizeof(v156));
        uint64_t v152 = 0;
        uint64_t v149 = 0;
        uint64_t v162 = 0;
        int v150 = 0;
        uint64_t v148 = 0;
        int v157 = 0;
        uint64_t v147 = 0;
        int v158 = 0;
        uint64_t v145 = 0;
        int v159 = 0;
        uint64_t v144 = 0;
        uint64_t v146 = 0;
        int v160 = 0;
        int v143 = 0;
        unint64_t v161 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        int v44 = 0;
        int v45 = &qword_1D85064F0;
        goto LABEL_90;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
LABEL_33:
    int v29 = __sb__runningInSpringBoard();
    int v163 = v21;
    int v164 = v22;
    if (v29)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v20 = 0;
        int v30 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      int v140 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v140 userInterfaceIdiom] != 1)
      {
        uint64_t v20 = 0;
        int v30 = 1;
        goto LABEL_42;
      }
    }
    int v30 = v29 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v28 = __sb__runningInSpringBoard();
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        double v132 = [MEMORY[0x1E4F42D90] mainScreen];
        [v132 _referenceBounds];
      }
      uint64_t v20 = v28 ^ 1;
      BSSizeRoundForScale();
      if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        unint64_t v161 = __PAIR64__(v30, v20);
        memset(v154, 0, sizeof(v154));
        memset(v153, 0, sizeof(v153));
        memset(v155, 0, sizeof(v155));
        uint64_t v151 = 0;
        memset(v156, 0, sizeof(v156));
        uint64_t v152 = 0;
        uint64_t v149 = 0;
        uint64_t v162 = 0;
        int v150 = 0;
        uint64_t v148 = 0;
        int v157 = 0;
        uint64_t v147 = 0;
        int v158 = 0;
        uint64_t v145 = 0;
        int v159 = 0;
        uint64_t v144 = 0;
        uint64_t v146 = 0;
        int v160 = 0;
        int v143 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        int v44 = 0;
        int v45 = &qword_1D8506518;
        goto LABEL_90;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
LABEL_42:
    int v31 = __sb__runningInSpringBoard();
    unint64_t v161 = __PAIR64__(v30, v20);
    if (v31)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v32 = 0;
        int v33 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      int v139 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v139 userInterfaceIdiom] != 1)
      {
        int v32 = 0;
        int v33 = 1;
        goto LABEL_51;
      }
    }
    int v33 = v31 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v28 = __sb__runningInSpringBoard();
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v131 = [MEMORY[0x1E4F42D90] mainScreen];
        [v131 _referenceBounds];
      }
      int v32 = v28 ^ 1;
      BSSizeRoundForScale();
      if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        int v159 = v28 ^ 1;
        int v160 = v33;
        memset(v154, 0, sizeof(v154));
        memset(v153, 0, sizeof(v153));
        memset(v155, 0, sizeof(v155));
        uint64_t v151 = 0;
        memset(v156, 0, sizeof(v156));
        uint64_t v152 = 0;
        uint64_t v149 = 0;
        uint64_t v162 = 0;
        int v150 = 0;
        uint64_t v148 = 0;
        int v157 = 0;
        uint64_t v147 = 0;
        int v158 = 0;
        uint64_t v145 = 0;
        uint64_t v144 = 0;
        uint64_t v146 = 0;
        int v143 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        int v44 = 0;
        int v45 = &qword_1D8506508;
        goto LABEL_90;
      }
    }
    else
    {
      int v32 = 0;
    }
LABEL_51:
    int v34 = __sb__runningInSpringBoard();
    int v159 = v32;
    int v160 = v33;
    if (v34)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v35 = 0;
        int v36 = 0;
        goto LABEL_60;
      }
    }
    else
    {
      int v138 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v138 userInterfaceIdiom] != 1)
      {
        int v35 = 0;
        int v36 = 1;
        goto LABEL_60;
      }
    }
    int v36 = v34 ^ 1;
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      long long v135 = [MEMORY[0x1E4F42D90] mainScreen];
      [v135 _referenceBounds];
    }
    int v35 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      int v157 = v28 ^ 1;
      int v158 = v36;
      memset(v154, 0, sizeof(v154));
      memset(v153, 0, sizeof(v153));
      memset(v155, 0, sizeof(v155));
      uint64_t v151 = 0;
      memset(v156, 0, sizeof(v156));
      uint64_t v152 = 0;
      uint64_t v149 = 0;
      uint64_t v162 = 0;
      int v150 = 0;
      uint64_t v148 = 0;
      uint64_t v145 = 0;
      uint64_t v146 = 0;
      uint64_t v147 = 0;
      uint64_t v144 = 0;
      int v143 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      int v45 = &qword_1D8506510;
      goto LABEL_90;
    }
LABEL_60:
    int v38 = __sb__runningInSpringBoard();
    int v157 = v35;
    int v158 = v36;
    if (v38)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v162 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      uint64_t v137 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v137 userInterfaceIdiom] != 1)
      {
        uint64_t v162 = 0x100000000;
        goto LABEL_70;
      }
    }
    HIDWORD(v162) = v38 ^ 1;
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v133 = [MEMORY[0x1E4F42D90] mainScreen];
      [v133 _referenceBounds];
    }
    LODWORD(v162) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      memset(v154, 0, sizeof(v154));
      memset(v153, 0, sizeof(v153));
      memset(v155, 0, sizeof(v155));
      uint64_t v151 = 0;
      memset(v156, 0, sizeof(v156));
      uint64_t v152 = 0;
      uint64_t v149 = 0;
      int v150 = 0;
      uint64_t v147 = 0;
      uint64_t v148 = 0;
      uint64_t v145 = 0;
      uint64_t v146 = 0;
      uint64_t v144 = 0;
      int v143 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      int v45 = &qword_1D8506500;
      goto LABEL_90;
    }
LABEL_70:
    int v47 = __sb__runningInSpringBoard();
    if (v47)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v156[4] = 0;
        goto LABEL_201;
      }
    }
    else
    {
      int v136 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v136 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v156[4] = 0;
        *(_DWORD *)&v156[8] = 1;
        goto LABEL_201;
      }
    }
    *(_DWORD *)&v156[8] = v47 ^ 1;
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v130 = [MEMORY[0x1E4F42D90] mainScreen];
      [v130 _referenceBounds];
    }
    *(_DWORD *)&v156[4] = v28 ^ 1;
    BSSizeRoundForScale();
    if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      memset(v154, 0, sizeof(v154));
      memset(v153, 0, sizeof(v153));
      memset(v155, 0, sizeof(v155));
      uint64_t v151 = 0;
      *(_DWORD *)double v156 = 0;
      uint64_t v152 = 0;
      uint64_t v149 = 0;
      int v150 = 0;
      uint64_t v147 = 0;
      uint64_t v148 = 0;
      uint64_t v145 = 0;
      uint64_t v146 = 0;
      uint64_t v144 = 0;
      int v143 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      int v45 = &qword_1D85064F8;
      goto LABEL_90;
    }
LABEL_201:
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_203;
      }
    }
    else
    {
      double v134 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v134 userInterfaceIdiom] != 1)
      {
LABEL_203:
        *(_DWORD *)double v156 = v28 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_207:
          *(void *)int v155 = 0;
          goto LABEL_217;
        }
        int v55 = __sb__runningInSpringBoard();
        if (v55)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_207;
          }
        }
        else
        {
          uint64_t v128 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v128 userInterfaceIdiom])
          {
            *(void *)int v155 = 1;
            goto LABEL_217;
          }
        }
        *(_DWORD *)int v155 = v55 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            int v121 = [MEMORY[0x1E4F42D90] mainScreen];
            [v121 _referenceBounds];
          }
          *(_DWORD *)&v155[4] = v28 ^ 1;
          BSSizeRoundForScale();
          if (v58 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            memset(v154, 0, sizeof(v154));
            memset(v153, 0, sizeof(v153));
            *(_DWORD *)&v155[8] = 0;
            uint64_t v151 = 0;
            uint64_t v152 = 0;
            uint64_t v149 = 0;
            int v150 = 0;
            uint64_t v147 = 0;
            uint64_t v148 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D85064C8;
            goto LABEL_90;
          }
        }
        else
        {
          *(_DWORD *)&v155[4] = 0;
        }
LABEL_217:
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v154[36] = 0;
            *(_DWORD *)&v155[8] = 0;
            goto LABEL_227;
          }
        }
        else
        {
          int v129 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v129 userInterfaceIdiom])
          {
            *(_DWORD *)&v154[36] = 0;
            *(_DWORD *)&v155[8] = 1;
            goto LABEL_227;
          }
        }
        *(_DWORD *)&v155[8] = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            int v124 = [MEMORY[0x1E4F42D90] mainScreen];
            [v124 _referenceBounds];
          }
          *(_DWORD *)&v154[36] = v28 ^ 1;
          BSSizeRoundForScale();
          if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_231;
          }
        }
        else
        {
          *(_DWORD *)&v154[36] = 0;
        }
LABEL_227:
        if (_SBF_Private_IsD94Like())
        {
          memset(v154, 0, 36);
          memset(v153, 0, sizeof(v153));
          uint64_t v151 = 0;
          uint64_t v152 = 0;
          uint64_t v149 = 0;
          int v150 = 0;
          uint64_t v147 = 0;
          uint64_t v148 = 0;
          uint64_t v145 = 0;
          uint64_t v146 = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D85064D0;
          goto LABEL_90;
        }
LABEL_231:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_235:
          *(void *)&v154[28] = 0;
          goto LABEL_245;
        }
        int v57 = __sb__runningInSpringBoard();
        if (v57)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_235;
          }
        }
        else
        {
          int v125 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v125 userInterfaceIdiom])
          {
            *(_DWORD *)&v154[28] = 0;
            *(_DWORD *)&v154[32] = 1;
            goto LABEL_245;
          }
        }
        *(_DWORD *)&v154[32] = v57 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v116 = [MEMORY[0x1E4F42D90] mainScreen];
            [v116 _referenceBounds];
          }
          *(_DWORD *)&v154[28] = v28 ^ 1;
          BSSizeRoundForScale();
          if (v63 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            memset(v154, 0, 28);
            memset(v153, 0, sizeof(v153));
            uint64_t v151 = 0;
            uint64_t v152 = 0;
            uint64_t v149 = 0;
            int v150 = 0;
            uint64_t v147 = 0;
            uint64_t v148 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D85064D8;
            goto LABEL_90;
          }
        }
        else
        {
          *(_DWORD *)&v154[28] = 0;
        }
LABEL_245:
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v154[24] = 0;
            *(_DWORD *)&v154[16] = 0;
            goto LABEL_255;
          }
        }
        else
        {
          uint64_t v127 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v127 userInterfaceIdiom])
          {
            *(_DWORD *)&v154[16] = 0;
            *(_DWORD *)&v154[24] = 1;
            goto LABEL_255;
          }
        }
        *(_DWORD *)&v154[24] = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            int v120 = [MEMORY[0x1E4F42D90] mainScreen];
            [v120 _referenceBounds];
          }
          *(_DWORD *)&v154[16] = v28 ^ 1;
          BSSizeRoundForScale();
          if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_259;
          }
        }
        else
        {
          *(_DWORD *)&v154[16] = 0;
        }
LABEL_255:
        if (_SBF_Private_IsD64Like())
        {
          *(_DWORD *)&v154[20] = 0;
          *(_OWORD *)double v154 = 0uLL;
          memset(v153, 0, sizeof(v153));
          uint64_t v151 = 0;
          uint64_t v152 = 0;
          uint64_t v149 = 0;
          int v150 = 0;
          uint64_t v147 = 0;
          uint64_t v148 = 0;
          uint64_t v145 = 0;
          uint64_t v146 = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D85064E0;
          goto LABEL_90;
        }
LABEL_259:
        int v60 = __sb__runningInSpringBoard();
        if (v60)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v154[20] = 0;
            *(_DWORD *)&v154[12] = 0;
            goto LABEL_269;
          }
        }
        else
        {
          uint64_t v126 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v126 userInterfaceIdiom])
          {
            *(_DWORD *)&v154[12] = 0;
            *(_DWORD *)&v154[20] = 1;
            goto LABEL_269;
          }
        }
        *(_DWORD *)&v154[20] = v60 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v61 = __sb__runningInSpringBoard();
          if (v61)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            id v117 = [MEMORY[0x1E4F42D90] mainScreen];
            [v117 _referenceBounds];
          }
          uint64_t v28 = v61 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v154[12] = v28;
          if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            *(void *)double v154 = 0;
            memset(v153, 0, sizeof(v153));
            *(_DWORD *)&v154[8] = 0;
            uint64_t v151 = 0;
            uint64_t v152 = 0;
            uint64_t v149 = 0;
            int v150 = 0;
            uint64_t v147 = 0;
            uint64_t v148 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D85064B8;
            goto LABEL_90;
          }
        }
        else
        {
          *(_DWORD *)&v154[12] = 0;
        }
LABEL_269:
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)double v154 = 0;
            *(_DWORD *)int v153 = 0;
            goto LABEL_279;
          }
        }
        else
        {
          int v123 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v123 userInterfaceIdiom])
          {
            *(_DWORD *)int v153 = 0;
            *(_DWORD *)double v154 = 1;
            goto LABEL_279;
          }
        }
        *(_DWORD *)double v154 = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v115 = [MEMORY[0x1E4F42D90] mainScreen];
            [v115 _referenceBounds];
          }
          *(_DWORD *)int v153 = v28 ^ 1;
          BSSizeRoundForScale();
          if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_289;
          }
        }
        else
        {
          *(_DWORD *)int v153 = 0;
        }
LABEL_279:
        if (_SBF_Private_IsD54())
        {
          *(void *)&v154[4] = 0;
          *(void *)&v153[4] = 0;
          uint64_t v151 = 0;
          uint64_t v152 = 0;
          uint64_t v149 = 0;
          int v150 = 0;
          uint64_t v147 = 0;
          uint64_t v148 = 0;
          uint64_t v145 = 0;
          uint64_t v146 = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D85064C0;
          goto LABEL_90;
        }
LABEL_289:
        int v65 = __sb__runningInSpringBoard();
        if (v65)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v154[4] = 0;
            goto LABEL_299;
          }
        }
        else
        {
          int v122 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v122 userInterfaceIdiom])
          {
            *(_DWORD *)&v154[4] = 0;
            *(_DWORD *)&v154[8] = 1;
            goto LABEL_299;
          }
        }
        *(_DWORD *)&v154[8] = v65 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v66 = __sb__runningInSpringBoard();
          if (v66)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            int v112 = [MEMORY[0x1E4F42D90] mainScreen];
            [v112 _referenceBounds];
          }
          uint64_t v28 = v66 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v154[4] = v28;
          if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            *(void *)&v153[4] = 0;
            uint64_t v151 = 0;
            uint64_t v152 = 0;
            uint64_t v149 = 0;
            int v150 = 0;
            uint64_t v147 = 0;
            uint64_t v148 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D8506488;
            goto LABEL_90;
          }
        }
        else
        {
          *(_DWORD *)&v154[4] = 0;
        }
LABEL_299:
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v153[4] = 0;
            goto LABEL_309;
          }
        }
        else
        {
          int v119 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v119 userInterfaceIdiom])
          {
            *(_DWORD *)&v153[4] = 0;
            *(_DWORD *)&v153[8] = 1;
            goto LABEL_309;
          }
        }
        *(_DWORD *)&v153[8] = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v111 = [MEMORY[0x1E4F42D90] mainScreen];
            [v111 _referenceBounds];
          }
          *(_DWORD *)&v153[4] = v28 ^ 1;
          BSSizeRoundForScale();
          if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_318;
          }
        }
        else
        {
          *(_DWORD *)&v153[4] = 0;
        }
LABEL_309:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          uint64_t v151 = 0;
          uint64_t v152 = 0;
          uint64_t v149 = 0;
          int v150 = 0;
          uint64_t v147 = 0;
          uint64_t v148 = 0;
          uint64_t v145 = 0;
          uint64_t v146 = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506490;
          goto LABEL_90;
        }
LABEL_318:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_322:
          uint64_t v151 = 0;
          goto LABEL_329;
        }
        int v69 = __sb__runningInSpringBoard();
        if (v69)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_322;
          }
        }
        else
        {
          int v114 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v114 userInterfaceIdiom])
          {
            uint64_t v151 = 0x100000000;
            goto LABEL_329;
          }
        }
        HIDWORD(v151) = v69 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v70 = __sb__runningInSpringBoard();
          if (v70)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v105 = [MEMORY[0x1E4F42D90] mainScreen];
            [v105 _referenceBounds];
          }
          uint64_t v28 = v70 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v151) = v28;
          if (v75 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            uint64_t v152 = 0;
            uint64_t v149 = 0;
            int v150 = 0;
            uint64_t v147 = 0;
            uint64_t v148 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D8506478;
            goto LABEL_90;
          }
        }
        else
        {
          LODWORD(v151) = 0;
        }
LABEL_329:
        int v71 = __sb__runningInSpringBoard();
        if (v71)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v152) = 0;
            uint64_t v28 = 0;
            goto LABEL_339;
          }
        }
        else
        {
          int v118 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v118 userInterfaceIdiom])
          {
            uint64_t v28 = 0;
            HIDWORD(v152) = 1;
            goto LABEL_339;
          }
        }
        HIDWORD(v152) = v71 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v72 = __sb__runningInSpringBoard();
          if (v72)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            int v108 = [MEMORY[0x1E4F42D90] mainScreen];
            [v108 _referenceBounds];
          }
          uint64_t v28 = v72 ^ 1u;
          BSSizeRoundForScale();
          if (v73 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_343;
          }
        }
        else
        {
          uint64_t v28 = 0;
        }
LABEL_339:
        if (_SBF_Private_IsD93Like())
        {
          LODWORD(v152) = v28;
          uint64_t v149 = 0;
          int v150 = 0;
          uint64_t v147 = 0;
          uint64_t v148 = 0;
          uint64_t v145 = 0;
          uint64_t v146 = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506480;
          goto LABEL_90;
        }
LABEL_343:
        LODWORD(v152) = v28;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_347:
          uint64_t v149 = 0;
          goto LABEL_357;
        }
        int v74 = __sb__runningInSpringBoard();
        if (v74)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_347;
          }
        }
        else
        {
          double v109 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v109 userInterfaceIdiom])
          {
            uint64_t v149 = 0x100000000;
            goto LABEL_357;
          }
        }
        HIDWORD(v149) = v74 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v101 = [MEMORY[0x1E4F42D90] mainScreen];
            [v101 _referenceBounds];
          }
          LODWORD(v149) = v28 ^ 1;
          BSSizeRoundForScale();
          if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            int v150 = 0;
            uint64_t v147 = 0;
            uint64_t v148 = 0;
            uint64_t v145 = 0;
            uint64_t v146 = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D85064A8;
            goto LABEL_90;
          }
        }
        else
        {
          LODWORD(v149) = 0;
        }
LABEL_357:
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v150 = 0;
            HIDWORD(v148) = 0;
            goto LABEL_367;
          }
        }
        else
        {
          double v113 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v113 userInterfaceIdiom])
          {
            HIDWORD(v148) = 0;
            int v150 = 1;
            goto LABEL_367;
          }
        }
        int v150 = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            uint64_t v104 = [MEMORY[0x1E4F42D90] mainScreen];
            [v104 _referenceBounds];
          }
          HIDWORD(v148) = v28 ^ 1;
          BSSizeRoundForScale();
          if (v76 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_371;
          }
        }
        else
        {
          HIDWORD(v148) = 0;
        }
LABEL_367:
        if (_SBF_Private_IsD63Like())
        {
          LODWORD(v148) = 0;
          uint64_t v145 = 0;
          uint64_t v146 = 0;
          uint64_t v147 = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D85064B0;
          goto LABEL_90;
        }
LABEL_371:
        int v77 = __sb__runningInSpringBoard();
        if (v77)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v148) = 0;
            HIDWORD(v145) = 0;
            goto LABEL_381;
          }
        }
        else
        {
          int v110 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v110 userInterfaceIdiom])
          {
            HIDWORD(v145) = 0;
            LODWORD(v148) = 1;
            goto LABEL_381;
          }
        }
        LODWORD(v148) = v77 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v78 = __sb__runningInSpringBoard();
          if (v78)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v102 = [MEMORY[0x1E4F42D90] mainScreen];
            [v102 _referenceBounds];
          }
          uint64_t v28 = v78 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v145) = v28;
          if (v79 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            uint64_t v146 = 0;
            uint64_t v147 = 0;
            LODWORD(v145) = 0;
            uint64_t v144 = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D8506498;
            goto LABEL_90;
          }
        }
        else
        {
          HIDWORD(v145) = 0;
        }
LABEL_381:
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v147 = 0;
            goto LABEL_391;
          }
        }
        else
        {
          double v107 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v107 userInterfaceIdiom])
          {
            uint64_t v147 = 0x100000000;
            goto LABEL_391;
          }
        }
        HIDWORD(v147) = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v100 = [MEMORY[0x1E4F42D90] mainScreen];
            [v100 _referenceBounds];
          }
          LODWORD(v147) = v28 ^ 1;
          BSSizeRoundForScale();
          if (v81 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_401;
          }
        }
        else
        {
          LODWORD(v147) = 0;
        }
LABEL_391:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          uint64_t v146 = 0;
          LODWORD(v145) = 0;
          uint64_t v144 = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D85064A0;
          goto LABEL_90;
        }
LABEL_401:
        int v82 = __sb__runningInSpringBoard();
        if (v82)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v146) = 0;
            LODWORD(v145) = 0;
            goto LABEL_411;
          }
        }
        else
        {
          double v106 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v106 userInterfaceIdiom])
          {
            LODWORD(v145) = 0;
            HIDWORD(v146) = 1;
            goto LABEL_411;
          }
        }
        HIDWORD(v146) = v82 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v28 = __sb__runningInSpringBoard();
          if (v28)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v99 = [MEMORY[0x1E4F42D90] mainScreen];
            [v99 _referenceBounds];
          }
          LODWORD(v145) = v28 ^ 1;
          BSSizeRoundForScale();
          if (v85 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            uint64_t v144 = 0;
            LODWORD(v146) = 0;
            int v143 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D8506468;
            goto LABEL_90;
          }
        }
        else
        {
          LODWORD(v145) = 0;
        }
LABEL_411:
        int v83 = __sb__runningInSpringBoard();
        if (v83)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v144) = 0;
            uint64_t v28 = 0;
            goto LABEL_421;
          }
        }
        else
        {
          double v103 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v103 userInterfaceIdiom])
          {
            uint64_t v28 = 0;
            HIDWORD(v144) = 1;
            goto LABEL_421;
          }
        }
        HIDWORD(v144) = v83 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v84 = __sb__runningInSpringBoard();
          if (v84)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v98 = [MEMORY[0x1E4F42D90] mainScreen];
            [v98 _referenceBounds];
          }
          uint64_t v28 = v84 ^ 1u;
          BSSizeRoundForScale();
          if (v86 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_428;
          }
        }
        else
        {
          uint64_t v28 = 0;
        }
LABEL_421:
        if (_SBF_Private_IsD53())
        {
          LODWORD(v146) = v28;
          LODWORD(v144) = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506470;
          goto LABEL_90;
        }
LABEL_428:
        LODWORD(v146) = v28;
        if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
        {
          LODWORD(v144) = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506448;
          goto LABEL_90;
        }
        if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
        {
          LODWORD(v144) = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506450;
          goto LABEL_90;
        }
        if (_SBF_Private_IsD52OrSimilarDevice())
        {
          LODWORD(v144) = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506438;
          goto LABEL_90;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
        {
          LODWORD(v144) = 0;
          int v143 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506440;
          goto LABEL_90;
        }
        uint64_t v28 = __sb__runningInSpringBoard();
        if (v28)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v144) = 0;
            int v143 = 0;
            goto LABEL_448;
          }
        }
        else
        {
          double v97 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v97 userInterfaceIdiom])
          {
            int v143 = 0;
            LODWORD(v144) = 1;
            goto LABEL_448;
          }
        }
        LODWORD(v144) = v28 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v21 = __sb__runningInSpringBoard();
          if (v21)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            double v95 = [MEMORY[0x1E4F42D90] mainScreen];
            [v95 _referenceBounds];
          }
          int v143 = v21 ^ 1;
          BSSizeRoundForScale();
          if (v90 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D8506458;
            goto LABEL_90;
          }
        }
        else
        {
          int v143 = 0;
        }
LABEL_448:
        int v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v39 = 0;
            int v40 = 0;
            goto LABEL_458;
          }
        }
        else
        {
          int v96 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v96 userInterfaceIdiom])
          {
            int v40 = 0;
            int v39 = 1;
            goto LABEL_458;
          }
        }
        int v39 = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v21 = __sb__runningInSpringBoard();
          if (v21)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            int v94 = [MEMORY[0x1E4F42D90] mainScreen];
            [v94 _referenceBounds];
          }
          int v40 = v21 ^ 1;
          BSSizeRoundForScale();
          if (v91 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = &qword_1D8506460;
            goto LABEL_90;
          }
        }
        else
        {
          int v40 = 0;
        }
LABEL_458:
        uint64_t v21 = __sb__runningInSpringBoard();
        if (v21)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v41 = 0;
            int v42 = 0;
            goto LABEL_468;
          }
        }
        else
        {
          uint64_t v28 = [MEMORY[0x1E4F42948] currentDevice];
          if ([(id)v28 userInterfaceIdiom])
          {
            int v42 = 0;
            int v41 = 1;
            goto LABEL_468;
          }
        }
        int v41 = v21 ^ 1;
        uint64_t v21 = __sb__runningInSpringBoard();
        if (v21)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v20 = [MEMORY[0x1E4F42D90] mainScreen];
          [(id)v20 _referenceBounds];
        }
        int v42 = v21 ^ 1;
        BSSizeRoundForScale();
        if (v88 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v43 = 0;
          int v44 = 0;
          int v45 = &qword_1D8506430;
          goto LABEL_90;
        }
LABEL_468:
        int v89 = __sb__runningInSpringBoard();
        if (v89)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v43 = 0;
            int v44 = 0;
            goto LABEL_485;
          }
        }
        else
        {
          uint64_t v21 = [MEMORY[0x1E4F42948] currentDevice];
          if ([(id)v21 userInterfaceIdiom])
          {
            int v44 = 0;
            int v43 = 1;
            goto LABEL_485;
          }
        }
        int v43 = v89 ^ 1;
        int v92 = __sb__runningInSpringBoard();
        if (v92)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
          [v4 _referenceBounds];
        }
        int v44 = v92 ^ 1;
        BSSizeRoundForScale();
        if (v93 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
        {
          int v45 = &qword_1D8506428;
LABEL_90:
          double v27 = *(double *)v45;
          if (v44) {

          }
          if (v43) {
          if (v42)
          }

          if (v41) {
          if (v40)
          }

          if (v39) {
          if (v143)
          }

          if (v144) {
          if (v146)
          }

          if (HIDWORD(v144)) {
          if (v145)
          }

          if (HIDWORD(v146)) {
          if (v147)
          }

          if (HIDWORD(v147)) {
          if (HIDWORD(v145))
          }

          if (v148) {
          if (HIDWORD(v148))
          }

          if (v150) {
          if (v149)
          }

          if (HIDWORD(v149)) {
          if (v152)
          }

          if (HIDWORD(v152)) {
          if (v151)
          }

          if (HIDWORD(v151)) {
          if (*(_DWORD *)&v153[4])
          }

          if (*(_DWORD *)&v153[8]) {
          if (*(_DWORD *)&v154[4])
          }

          if (*(_DWORD *)&v154[8]) {
          if (*(_DWORD *)v153)
          }

          if (*(_DWORD *)v154) {
          if (*(_DWORD *)&v154[12])
          }

          if (*(_DWORD *)&v154[20]) {
          if (*(_DWORD *)&v154[16])
          }

          if (*(_DWORD *)&v154[24]) {
          if (*(_DWORD *)&v154[28])
          }

          if (*(_DWORD *)&v154[32]) {
          if (*(_DWORD *)&v154[36])
          }

          if (*(_DWORD *)&v155[8]) {
          if (*(_DWORD *)&v155[4])
          }

          if (*(_DWORD *)v155) {
          if (*(_DWORD *)v156)
          }

          if (*(_DWORD *)&v156[4]) {
          if (*(_DWORD *)&v156[8])
          }

          if (v162) {
          if (HIDWORD(v162))
          }
          {

            if (!v157) {
              goto LABEL_180;
            }
          }
          else if (!v157)
          {
LABEL_180:
            if (v158) {
              goto LABEL_181;
            }
            goto LABEL_191;
          }

          if (v158)
          {
LABEL_181:

            if (!v159) {
              goto LABEL_182;
            }
            goto LABEL_192;
          }
LABEL_191:
          if (!v159)
          {
LABEL_182:
            if (v160) {
              goto LABEL_183;
            }
            goto LABEL_193;
          }
LABEL_192:

          if (v160)
          {
LABEL_183:

            if (!v161) {
              goto LABEL_184;
            }
            goto LABEL_194;
          }
LABEL_193:
          if (!v161)
          {
LABEL_184:
            if (HIDWORD(v161)) {
              goto LABEL_185;
            }
            goto LABEL_195;
          }
LABEL_194:

          if (HIDWORD(v161))
          {
LABEL_185:

            if (!v163) {
              goto LABEL_186;
            }
            goto LABEL_196;
          }
LABEL_195:
          if (!v163)
          {
LABEL_186:
            if (!v164) {
              return v27;
            }
LABEL_187:

            return v27;
          }
LABEL_196:

          if (!v164) {
            return v27;
          }
          goto LABEL_187;
        }
LABEL_485:
        int v45 = &CSListLandscapeTopY;
        goto LABEL_90;
      }
    }
    memset(v154, 0, sizeof(v154));
    memset(v153, 0, sizeof(v153));
    memset(v155, 0, sizeof(v155));
    uint64_t v151 = 0;
    uint64_t v152 = 0;
    uint64_t v149 = 0;
    int v150 = 0;
    uint64_t v147 = 0;
    uint64_t v148 = 0;
    uint64_t v145 = 0;
    uint64_t v146 = 0;
    uint64_t v144 = 0;
    int v143 = 0;
    int v39 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = &qword_1D85064E8;
    *(_DWORD *)double v156 = v28 ^ 1;
    goto LABEL_90;
  }
  [(CSCoverSheetViewController *)self timeLabelBaselineY];
  double v9 = v8;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    [(CSCoverSheetViewController *)self timeToSubtitleLabelBaselineDifferenceY];
    double v9 = v9 + v10;
  }
  [(CSCoverSheetViewController *)self prominentBaselineToListY];
  double v12 = v11;
  int v13 = [(CSMainPageContentViewController *)self->_mainPageContentViewController combinedListViewController];
  int v14 = [v13 isShowingFocusActivityView];

  if (v14)
  {
    char v15 = _os_feature_enabled_impl();
    double v16 = 0.0;
    if ((v15 & 1) == 0) {
      [(CSCoverSheetViewController *)self focusActivityHeight];
    }
    double v17 = v12 - v16;
    if (v17 >= 0.0) {
      double v12 = v17;
    }
    else {
      double v12 = 0.0;
    }
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      portraitComplicationContainerdouble Height = 0.0;
      if (v3 >= 2) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    int v23 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    if (v24 == 1)
    {
      portraitComplicationContainerdouble Height = 0.0;
      if (v3 > 1) {
        goto LABEL_23;
      }
    }
  }
  portraitComplicationContainerdouble Height = self->_portraitComplicationContainerHeight;
LABEL_23:
  double v25 = 0.0;
  if ((_os_feature_enabled_impl() & 1) == 0 && [MEMORY[0x1E4FA5F40] showAlternateDate])
  {
    [MEMORY[0x1E4FA5F48] subtitleLabelToLunarDateLabelBaselineDifferenceY];
    double v25 = v26;
  }
  return v9 + v12 + portraitComplicationContainerHeight + v25;
}

- (double)bottomContentInset
{
  return 66.0;
}

- (double)dateTimeMostExtremeLeadingX
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CSCoverSheetViewController *)self view];
  [v3 bounds];
  double MidX = CGRectGetMidX(v26);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([(CSCoverSheetViewController *)self _dateTimeLayoutForPage:v10] == 2)
        {
          double v11 = [MEMORY[0x1E4F42948] currentDevice];
          uint64_t v12 = [v11 userInterfaceIdiom];

          if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            [MEMORY[0x1E4FA7D30] idealSearchPlatterWidth];
            double v14 = v13;
            char v15 = [(CSCoverSheetViewController *)self view];
            [v15 bounds];
            CGFloat v16 = (CGRectGetWidth(v27) - v14) * 0.5;

            [(CSCoverSheetViewController *)self _dateTimeInsetXForPage:v10];
            double v18 = v16 + v17;
          }
          else
          {
            [(CSCoverSheetViewController *)self _dateTimeInsetXForPage:v10];
          }
          if (MidX >= v18) {
            double MidX = v18;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return MidX;
}

- (double)dateTimeMostExtremeTrailingX
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CSCoverSheetViewController *)self view];
  [v3 bounds];
  double MidX = CGRectGetMidX(v26);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([(CSCoverSheetViewController *)self _dateTimeLayoutForPage:v10] == 3)
        {
          double v11 = [MEMORY[0x1E4F42948] currentDevice];
          uint64_t v12 = [v11 userInterfaceIdiom];

          if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            [MEMORY[0x1E4FA7D30] idealSearchPlatterWidth];
            double v14 = v13;
            char v15 = [(CSCoverSheetViewController *)self view];
            [v15 bounds];
            CGFloat v16 = (CGRectGetWidth(v27) - v14) * 0.5;

            [(CSCoverSheetViewController *)self _dateTimeInsetXForPage:v10];
            double v18 = v16 + v17;
          }
          else
          {
            [(CSCoverSheetViewController *)self _dateTimeInsetXForPage:v10];
          }
          if (MidX >= v18) {
            double MidX = v18;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return MidX;
}

- (double)dateTimeSubtitleMaximumWidth
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CSCoverSheetViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v27);

  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1
    && (unint64_t)([(CSCoverSheetViewController *)self interfaceOrientation] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [(CSCoverSheetViewController *)self pageViewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      double v11 = 0.0;
      double v12 = Width;
      double v13 = Width;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if (([(CSCoverSheetViewController *)self _dateTimeLayoutForPage:v15] & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            [(CSCoverSheetViewController *)self _dateTimeInsetXForPage:v15];
            if (v13 >= v16) {
              double v13 = v16;
            }
            [(CSCoverSheetViewController *)self _listInsetXForPage:v15];
            if (v12 >= v17) {
              double v12 = v17;
            }
            [(CSCoverSheetViewController *)self _minDateListSpacingForPage:v15];
            if (v11 < v18) {
              double v11 = v18;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
      double v12 = Width;
      double v13 = Width;
    }

    [MEMORY[0x1E4FA7D30] idealSearchPlatterWidth];
    return Width - v19 - v13 - v12 - v11;
  }
  return Width;
}

- (BOOL)containsCenteredDateTimeLayout
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v3 = [(CSCoverSheetViewController *)self pageViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(CSCoverSheetViewController *)self _dateTimeLayoutForPage:*(void *)(*((void *)&v10 + 1) + 8 * i)] == 1)
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (double)_dateTimeInsetXForPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSCoverSheetViewController *)self view];
  [v5 bounds];
  double MidX = CGRectGetMidX(v9);

  if (objc_opt_respondsToSelector())
  {
    [v4 dateTimeInsetX];
    double MidX = v7;
  }

  return MidX;
}

- (double)_listInsetXForPage:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 listInsetX];
    double v4 = v5;
  }

  return v4;
}

- (double)_minDateListSpacingForPage:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 minimumDateToListSpacing];
    double v4 = v5;
  }

  return v4;
}

- (id)_pageForScrollPercent:(double)a3
{
  double v5 = [(CSCoverSheetViewController *)self pageViewControllers];
  unint64_t v6 = [(CSCoverSheetViewController *)self _indexOfMainPage];
  double v7 = [(CSCoverSheetViewController *)self pageViewControllers];
  BOOL v8 = [v7 objectAtIndex:v6];

  if (BSFloatIsZero())
  {
    id v9 = v8;
  }
  else
  {
    unint64_t v10 = [v5 count] - 1;
    if (a3 >= 0.0) {
      double v11 = a3;
    }
    else {
      double v11 = -a3;
    }
    int v12 = BSFloatLessThanFloat();
    double v13 = ceil(v11);
    double v14 = round(v11);
    if (!v12) {
      double v13 = v14;
    }
    unint64_t v15 = (unint64_t)v13;
    if (BSFloatGreaterThanFloat()) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = -(uint64_t)v15;
    }
    unint64_t v17 = v16 + v6;
    if (v10 >= v17) {
      unint64_t v18 = v17;
    }
    else {
      unint64_t v18 = v10;
    }
    id v9 = [v5 objectAtIndex:v18];
  }
  double v19 = v9;

  return v19;
}

- (unint64_t)_dateTimeLayoutForPage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 dateTimeLayout];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

void __98__CSCoverSheetViewController_activateCameraWithHostableEntity_animated_sendingActions_completion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D839D000, v0, OS_LOG_TYPE_ERROR, "Camera presentation failed with reason %@", v1, 0xCu);
}

- (void)isUnlockDisabled
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "[UnlockDisabled] Returning YES because CSCapabilityUnlock is restricted.", v2, v3, v4, v5, v6);
}

- (void)finishUIUnlockFromSource:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1D839D000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_scrollPanGestureChanged:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "scrollingTowardsTodayOverlay", v2, v3, v4, v5, v6);
}

- (void)updateBehaviorForController:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "Ignoring update from inactive participant.", v2, v3, v4, v5, v6);
}

- (void)updateBehaviorForController:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4F718] descriptionForObject:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D839D000, a2, v4, "Updating behavior for: %@...", v5);
}

- (void)updateAppearanceForController:(uint64_t)a1 withAnimationSettings:(NSObject *)a2 completion:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4F718] descriptionForObject:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D839D000, a2, v4, "Updating appearance for: %@...", v5);
}

- (void)wouldHandleButtonEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromCoverSheetEventType([a2 type]);
  int v8 = 138412546;
  uint8_t v9 = v6;
  __int16 v10 = 2112;
  double v11 = v7;
  _os_log_debug_impl(&dword_1D839D000, a3, OS_LOG_TYPE_DEBUG, "%@ says it would handle button: %@", (uint8_t *)&v8, 0x16u);
}

- (void)_removeAllowedPageViewController:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _allowedPageViewControllers];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D839D000, a2, OS_LOG_TYPE_ERROR, "Failed removing allowed page view controller %{public}@", v4, 0xCu);
}

- (void)_updateVisibilityForPageViewControllersWithVisiblePageViewController:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1D839D000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateVisibilityForPageViewControllersWithVisiblePageViewController:(const char *)a1 .cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1D839D000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)__currentDesiredAppearanceWithStartIndex:(void *)a1 targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:.cold.1(void *a1)
{
  uint64_t v2 = [a1 pageViewControllers];
  uint64_t v3 = [a1 _allowedPageViewControllers];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_1D839D000, v4, v5, "there is no page controller at starting index %lu\n\tpageViewControllers: %{public}@\n\tallowedPageViewController: %{public}@", v6, v7, v8, v9, v10);
}

- (void)__currentDesiredAppearanceWithStartIndex:(void *)a1 targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:.cold.2(void *a1)
{
  uint64_t v2 = [a1 pageViewControllers];
  uint64_t v3 = [a1 _allowedPageViewControllers];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_1D839D000, v4, v5, "there is no page controller at target index %lu\n\tpageViewControllers: %{public}@\n\tallowedPageViewController: %{public}@", v6, v7, v8, v9, v10);
}

- (void)__currentDesiredAppearanceWithStartIndex:targetIndex:targetAppearance:targetPresentation:modalAppearance:proudLockAppearance:poseidonAppearance:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D839D000, v0, v1, "New presentation: %@", v2);
}

- (void)_updateActiveAppearanceForReason:(__CFString *)a1 .cold.1(__CFString *a1, NSObject *a2)
{
  uint64_t v3 = a1;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a1 count])
  {
    if ([(__CFString *)v3 count] == 1)
    {
      uint64_t v3 = [(__CFString *)v3 anyObject];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
    uint64_t v3 = @"(none)";
  }
  int v6 = 138412290;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_3(&dword_1D839D000, a2, v4, "Removed: %@", (uint8_t *)&v6);
  if (v5) {
}
  }

- (void)_updateActiveAppearanceForReason:(__CFString *)a1 .cold.2(__CFString *a1, NSObject *a2)
{
  uint64_t v3 = a1;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a1 count])
  {
    if ([(__CFString *)v3 count] == 1)
    {
      uint64_t v3 = [(__CFString *)v3 anyObject];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
    uint64_t v3 = @"(none)";
  }
  int v6 = 138412290;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_3(&dword_1D839D000, a2, v4, "Added: %@", (uint8_t *)&v6);
  if (v5) {
}
  }

- (void)_updateActiveAppearanceForReason:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D839D000, v0, v1, "Appearance did change for reason [%@]...", v2);
}

@end