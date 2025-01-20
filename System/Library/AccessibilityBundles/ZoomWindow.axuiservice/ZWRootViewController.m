@interface ZWRootViewController
- ($2F34F6A4A708D3F7715AC605E075D30F)currentUIContextForEventProcessor:(SEL)a3;
- (AXAssertion)disableControlCenterAssertionFullscreenLens;
- (AXAssertion)disableControlCenterAssertionPIPLens;
- (AXAssertion)disableHomeGestureAssertion;
- (AXAssertion)disableNotificationCenterAssertionFullscreenLens;
- (AXAssertion)disableNotificationCenterAssertionPIPLens;
- (AXDispatchTimer)idleTouchTimer;
- (AXDispatchTimer)keyRepeatTimer;
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_inSpeakUnderFingerMode;
- (BOOL)_isZoomFactorAtMinimum:(double)a3;
- (BOOL)_isZoomedToMinimum;
- (BOOL)_pipLensIsNearBottomOfScreen;
- (BOOL)_pipLensIsNearRightOfScreen;
- (BOOL)_pipLensIsNearTopOfScreen;
- (BOOL)_shouldBlockShowControlCenterGesture;
- (BOOL)_shouldBlockShowNotificationGesture;
- (BOOL)_smartZoomFocusedElementIsBeingSampled;
- (BOOL)_watchUIInverted;
- (BOOL)attemptOrbZoomIfAppropriateWithSlugViewController:(id)a3;
- (BOOL)brailleInputUIIsShowing;
- (BOOL)carouselLockActive;
- (BOOL)eventProcessor:(id)a3 didGetWheelEventWithDelta:(int64_t)a4;
- (BOOL)fullscreenEventHandler:(id)a3 autopanShouldStartWithPoint:(CGPoint)a4 speedFactor:(double *)a5 initialSingleFingerLocation:(CGPoint)a6 fingerCount:(double)a7 pointHasBeenMapped:(BOOL)a8;
- (BOOL)fullscreenEventHandler:(id)a3 autopanWithLocation:(CGPoint)a4 initialSingleFingerLocation:(CGPoint)a5 distance:(double)a6 animationDuration:(double)a7 useGutterDistance:(BOOL)a8 pointHasBeenMapped:(BOOL)a9;
- (BOOL)haveTriedScrollingDuringZoomSweep;
- (BOOL)hostingWindowShouldMoveForReachability;
- (BOOL)inDockedModeForMenuViewController:(id)a3;
- (BOOL)inFullscreenModeForMenuViewController:(id)a3;
- (BOOL)inPIPModeForMenuViewController:(id)a3;
- (BOOL)inStandByForMenuViewController:(id)a3;
- (BOOL)isActiveLensTransitioning;
- (BOOL)isMainDisplay;
- (BOOL)isSweepingToNextZoomRow;
- (BOOL)isZoomInStandByModeWithSmartZoom:(id)a3;
- (BOOL)isZoomLensVisible;
- (BOOL)isZoomMovingWithVelocityWithDockedLensViewController:(id)a3;
- (BOOL)isZoomMovingWithVelocityWithFullscreenEventHandler:(id)a3;
- (BOOL)isZoomSlugVisible;
- (BOOL)pipWasOnBeforeSpeakFingerStarted;
- (BOOL)prefersStatusBarHidden;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)scrollBeganWhileSnarfingScrolls;
- (BOOL)shouldBeginAutopanningLensWithSlugViewController:(id)a3;
- (BOOL)shouldHideGrabbersWithZoomLensViewController:(id)a3;
- (BOOL)shouldSendTapEventWithATVEventProcessor:(id)a3;
- (BOOL)shouldShowSlugWithSlugViewController:(id)a3;
- (BOOL)shouldSuppressKeyCommandHUD;
- (BOOL)snarfingWheelEventsForPan;
- (BOOL)snarfingWheelEventsForZoom;
- (BOOL)togglePeekZoomWithMenuViewController:(id)a3;
- (BOOL)toggleSlugVisibilityWithMenuViewController:(id)a3;
- (BOOL)toggleStandbyOnNextCommandChange;
- (BOOL)touchTrapView:(id)a3 shouldReportSelfInHitTestAtLocation:(CGPoint)a4;
- (BOOL)triedToRezoomForDockTransition;
- (BOOL)triedToToggleStandbyDuringAnimation;
- (BOOL)userIsInteractingWithSlugWithDockedLensViewController:(id)a3;
- (BOOL)usingRelativePushPanningWithFullscreenEventHandler:(id)a3;
- (BOOL)zoomIsAnimating;
- (BOOL)zoomIsAnimatingDueToStandbyToggle;
- (BOOL)zoomIsAnimatingDueToTransition;
- (BOOL)zoomWasUnzoomedDueToAppTransition;
- (BSInvalidatable)hidePointerAssertion;
- (BSInvalidatable)hitTestCategoryAssertion;
- (BSInvalidatable)pointerEventStream;
- (BSInvalidatable)redirectPointerAssertion;
- (CGPoint)_convertPointFromNormalizedToWindow:(CGPoint)a3;
- (CGPoint)_denormalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4;
- (CGPoint)_denormalizePointForCurrentOrientation:(CGPoint)a3;
- (CGPoint)_normalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4;
- (CGPoint)_physicalScreenPointForVirtualScreenPoint:(CGPoint)a3;
- (CGPoint)_slugNormalizedPositionForCurrentPosition;
- (CGPoint)_slugOriginForNormalizedPosition:(CGPoint)a3;
- (CGPoint)_virtualScreenPointForPhysicalScreenPoint:(CGPoint)a3;
- (CGPoint)lastOrbLocation;
- (CGPoint)lastPointerLocation;
- (CGPoint)mirrorPanOffsetForRTLIfNecessary:(CGPoint)a3;
- (CGPoint)pointerLocationToZoomInToWithZoomFactor:(double)a3;
- (CGPoint)redirectPointerLocation;
- (CGPoint)zoomLocationWithFullscreenEventHandler:(id)a3;
- (CGPoint)zoomPanOffset;
- (CGRect)_determineSuitableLensFrame;
- (CGRect)zoomFrame;
- (CGRect)zoomFrameForPanningContinuouslyToPoint:(CGPoint)a3 zoomFactor:(double)a4;
- (CGSize)_lensDefaultSize;
- (CGSize)_lensMaximumSize;
- (CGSize)_lensMinimumSize;
- (CGSize)_screenSizeForCurrentOrientation;
- (CGSize)currentScreenSizeForEventProcessor:(id)a3;
- (NSLayoutConstraint)lensDragXConstraint;
- (NSLayoutConstraint)lensDragYConstraint;
- (NSLayoutConstraint)lensHeightConstraint;
- (NSLayoutConstraint)lensWidthConstraint;
- (NSLayoutConstraint)slugRingBottomConstraint;
- (NSLayoutConstraint)slugRingDragXConstraint;
- (NSLayoutConstraint)slugRingDragYConstraint;
- (NSLayoutConstraint)slugRingLeadingConstraint;
- (NSLayoutConstraint)slugRingTopConstraint;
- (NSLayoutConstraint)slugRingTrailingConstraint;
- (NSMutableSet)deactivatedAppIDs;
- (OS_dispatch_queue)cachedValuesSerialQueue;
- (PSPointerClientController)pointerClientController;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UIScreen)screen;
- (UIView)containerView;
- (UIView)debugFocusView;
- (UIView)lastHoveredView;
- (UIView)scrollTrapView;
- (ZWAlertManager)zoomAlertManager;
- (ZWEventProcessor)eventManager;
- (ZWFakeLaserViewController)fakeLaserVC;
- (ZWKeyboardContext)kbContext;
- (ZWLensAutopanner)lensAutopanner;
- (ZWMenuViewController)menuViewController;
- (ZWRootViewController)initWithAXUIService:(id)a3 onScreen:(id)a4 isMainDisplay:(BOOL)a5;
- (ZWSmartZoomManager)smartZoom;
- (ZWTouchTrapView)touchTrapView;
- (ZWUIMinimapView)minimapView;
- (ZWZoomDockedLensViewController)dockedLensViewController;
- (ZWZoomFullscreenLensViewController)fullscreenLensViewController;
- (ZWZoomLensViewController)activeLensViewController;
- (ZWZoomPIPLensViewController)pipLensViewController;
- (ZWZoomSlugViewController)slugViewController;
- (double)_calculateDurationForVelocity:(double)a3;
- (double)_interfaceAwareAdjustedAngleForScreenAngle:(double)a3;
- (double)accruedOvershoot;
- (double)handleAppActivationAnimationDelay;
- (double)handleAppDeactivationAnimationDelay;
- (double)handleAppSwitcherRevealAnimationDelay;
- (double)lastEventTime;
- (double)lastScrollTrapOffset;
- (double)lastWheelDelta;
- (double)panOffsetXBeforeTransition;
- (double)reachabilityOffset;
- (double)reachabilityScaleFactor;
- (double)setZoomFactorRespectingUserPreferredMaximumZoom:(double)a3;
- (double)storedZoomLevelWithFullscreenEventHandler:(id)a3;
- (double)zoomFactor;
- (double)zoomFactorForMenuViewController:(id)a3;
- (double)zoomFactorRespectingUserPreferredMaximumZoom:(double)a3;
- (double)zoomLevel;
- (double)zoomLevelWithFullscreenEventHandler:(id)a3;
- (id)activeZoomMode;
- (id)fullscreenZoomDidAutopanUnitTestCallback;
- (id)getLastSpeakUnderFingerPhrase;
- (id)lensTransitionUnitTestCallback;
- (id)title;
- (id)zoomMenuVisibilityChangedUnitTestCallback;
- (int64_t)currentInterfaceOrientationForEventProcessor:(id)a3;
- (int64_t)interfaceOrientationWithFullscreenEventHandler:(id)a3;
- (int64_t)lastKeyboardCommand;
- (unint64_t)pipLensEdgeMask;
- (unint64_t)slugEdgeMask;
- (unsigned)currentDisplayIdForEventProcessor:(id)a3;
- (unsigned)currentWindowContextIdForEventProcessor:(id)a3;
- (unsigned)windowContextId;
- (void)_applyInitialConstraintsForLensViewController:(id)a3;
- (void)_beginObservingValuesForLens:(id)a3;
- (void)_disableZoomWindowHitTesting;
- (void)_dismissMenuAnimated:(BOOL)a3;
- (void)_enableZoomWindowHitTesting;
- (void)_endObservingValuesForLens:(id)a3;
- (void)_exitStandbyIfNecessary;
- (void)_focusLensOnRect:(CGRect)a3 panLensContent:(BOOL)a4 recentreLens:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_handleKeyboardCommand:(int64_t)a3 isRepeatCommand:(BOOL)a4;
- (void)_handlePanWheelEventWithDelta:(int64_t)a3;
- (void)_handlePanWheelEventWithDelta:(int64_t)a3 animated:(BOOL)a4 animationDuration:(double)a5;
- (void)_handleSlugAction:(int64_t)a3;
- (void)_handleZoomLevelAdjustmentViaGesture:(CGPoint)a3;
- (void)_handleZoomWheelEventWithDelta:(int64_t)a3;
- (void)_initializeEventUIContext:(id *)a3;
- (void)_initializeZoomSettingsIfNeeded;
- (void)_loadZoomTouchExtras;
- (void)_menuDidDisappear;
- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6;
- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6 shouldUseFullDeltaForDockedMode:(BOOL)a7 shouldPan:(BOOL)a8;
- (void)_moveZoomItemWithControllerToDodgeJindo:(id)a3 byDelta:(CGPoint)a4;
- (void)_prepareToHandleZoomLevelAdjustmentViaGesture;
- (void)_presentMenuWithAnchorView:(id)a3 animated:(BOOL)a4 ignoreCooldown:(BOOL)a5;
- (void)_removeAllSystemGestureDisablingAssertions;
- (void)_removeFullscreenSystemGestureDisablingAssertions;
- (void)_removeHomeGestureDisablingAssertion;
- (void)_removePIPSystemGestureDisablingAssertions;
- (void)_resizeZoomLensByDelta:(CGPoint)a3;
- (void)_resizeZoomLensWithAdjustment:(CGPoint)a3 lensPositionCompensation:(CGPoint)a4;
- (void)_rezoomDueToAppTransitionIfNeeded;
- (void)_rezoomDueToDockIfNeeded;
- (void)_setDockResizingEnabled:(BOOL)a3;
- (void)_setPIPLensResizingEnabled:(BOOL)a3;
- (void)_toggleZoomStandby;
- (void)_transitionToLens:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_transitionToLensForMode:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_unzoomDueToAppTransitionIfNeeded;
- (void)_updateEventUIContextForSpeakFingerStateChange;
- (void)_updateKeyboardFrame:(CGRect)a3;
- (void)_updateLensEdgeMaskForZoomController:(id)a3;
- (void)_updateLensLayout;
- (void)_updateOrbLocation:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateSlugConstraintsForOrientation:(int64_t)a3;
- (void)_updateSlugLayoutAnimated:(BOOL)a3;
- (void)_updateSystemGestureDisablingAssertions;
- (void)_updateSystemGestureDisablingAssertionsForFullscreenZoom;
- (void)_updateSystemGestureDisablingAssertionsForPipLensPosition;
- (void)_updateZoomFactor:(double)a3 animated:(BOOL)a4;
- (void)_updateZoomListeners;
- (void)_zoomMovementHeartbeat;
- (void)_zoomMovementHeartbeat:(double)a3 fullscreenEventHandler:(id)a4;
- (void)atvEventProcessor:(id)a3 adjustZoomLevelWithDelta:(CGPoint)a4;
- (void)autopanner:(id)a3 didAutopanByDelta:(CGPoint)a4;
- (void)blockControlCenterGestureIfNeededWithFullscreenEventHandler:(id)a3;
- (void)blockHomeGestureIfNeededWithEventProcessor:(id)a3;
- (void)blockNotificationCenterGestureIfNeededWithFullscreenEventHandler:(id)a3;
- (void)dealloc;
- (void)didAnimateForReachabilityToOffset:(double)a3;
- (void)didEndAnimation;
- (void)didFinishAutopanningLensWithAutopanner:(id)a3;
- (void)didGetSpeakContentGestureWithATVEventProcessor:(id)a3;
- (void)didGetTogglePanningModeGestureWithATVEventProcessor:(id)a3;
- (void)didGetToggleZoomGestureWithEventProcessor:(id)a3;
- (void)didGetTouchOutsideLensChromeWithEventProcessor:(id)a3;
- (void)didGetTouchOutsideZoomMenuWithEventProcessor:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didStartAnimation;
- (void)dismissMenuWithMenuViewController:(id)a3;
- (void)dockedLensViewController:(id)a3 toggleButtonDidReceiveLongPress:(id)a4;
- (void)dockedLensViewController:(id)a3 zoomRegionVisibilityWasChanged:(BOOL)a4;
- (void)doneResizingDockWithDockedLensViewController:(id)a3;
- (void)endOrbZoomWithSlugViewController:(id)a3;
- (void)endZoomMovementWithFullscreenEventHandler:(id)a3;
- (void)eventProcessor:(id)a3 didGetFirstTouchAtLocation:(CGPoint)a4;
- (void)eventProcessor:(id)a3 didGetPanEventWithDelta:(int64_t)a4;
- (void)eventProcessor:(id)a3 didGetPointerEventAtLocation:(CGPoint)a4 withEventRep:(id)a5;
- (void)eventProcessor:(id)a3 didGetTouchInSpeakFingerMode:(CGPoint)a4 firstTouchWentIntoLens:(BOOL)a5;
- (void)eventProcessor:(id)a3 didReceiveKeyboardEventWithCommand:(int64_t)a4;
- (void)externalClientSetZoomFactor:(double)a3;
- (void)externalClientSetZoomPanOffset:(CGPoint)a3;
- (void)externalClientWantsToAutopan:(CGPoint)a3 withPanningStyle:(unint64_t)a4;
- (void)fullscreenEventHandler:(id)a3 continueZoomMovementWithVelocity:(double)a4 angle:(double)a5;
- (void)fullscreenEventHandler:(id)a3 didEndOrbAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveOneFingerDownAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerDoubleTapAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerSingleTapAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerTripleTapAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didStartOrbAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didThreeFingerOrbAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 setUsingRelativePushPanning:(BOOL)a4;
- (void)fullscreenEventHandler:(id)a3 setZoomLevel:(double)a4 duration:(double)a5;
- (void)fullscreenEventHandler:(id)a3 setZoomLevelFromTrackpadGesture:(double)a4;
- (void)fullscreenEventHandler:(id)a3 storeZoomLevel:(double)a4 location:(CGPoint)a5 zoomed:(BOOL)a6 forKey:(id)a7;
- (void)fullscreenEventHandler:(id)a3 updateOrbMovementAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 updateZoomMovementWithPoint:(CGPoint)a4;
- (void)handleAppActivationAnimationDidFinish;
- (void)handleAppActivationAnimationWillBegin;
- (void)handleAppDeactivationAnimationWillBegin;
- (void)handleAppDidBecomeActiveWithID:(id)a3 initialKeyboardFrame:(CGRect)a4;
- (void)handleAppDidEnterBackgroundWithID:(id)a3;
- (void)handleAppSwitcherRevealAnimationWillBegin;
- (void)handleCarouselLockBegan;
- (void)handleCarouselLockEnded;
- (void)handleDeviceReturnedToClockAtIdle;
- (void)handleDeviceWasUnlocked;
- (void)handleDeviceWillWake;
- (void)handleDragWillEnd;
- (void)handleDragWillStart;
- (void)handleFluidSwitcherGestureDidFinish;
- (void)handleFluidSwitcherGestureDidFinishWithDock;
- (void)handleFluidSwitcherGestureWillBegin;
- (void)handleFocusChangedWithType:(int64_t)a3 rect:(CGRect)a4 keyboardFrame:(CGRect)a5 contextId:(unsigned int)a6 appID:(id)a7;
- (void)handleHomeButtonWasPressed;
- (void)handleKeyboardWillAppearWithFrame:(CGRect)a3 inAppWithBundleID:(id)a4;
- (void)handleKeyboardWillHideInAppWithBundleID:(id)a3;
- (void)handleLockButtonWasPressed;
- (void)handleReachabilityToggled:(double)a3;
- (void)handleSettingsAppDidUpdateIdleSlugOpacity:(double)a3;
- (void)handleSettingsAppDidUpdatePreferredDockPosition:(id)a3;
- (void)handleSettingsAppDidUpdatePreferredLensMode:(id)a3;
- (void)handleSubstantialAppTransition;
- (void)handleWasDraggedWithDockedLensViewController:(id)a3;
- (void)hideZoomSlugAndLens:(BOOL)a3 completion:(id)a4;
- (void)lastFingerWasLiftedWithEventProcessor:(id)a3 firstTouchWentIntoSlug:(BOOL)a4;
- (void)loadView;
- (void)menuDidAppear:(id)a3;
- (void)menuViewController:(id)a3 adjustZoomFactor:(double)a4 animated:(BOOL)a5;
- (void)menuViewController:(id)a3 didChooseDockPosition:(id)a4 withCompletion:(id)a5;
- (void)menuViewController:(id)a3 didChooseLensEffect:(id)a4;
- (void)menuViewController:(id)a3 didChooseZoomMode:(id)a4 withCompletion:(id)a5;
- (void)menuViewController:(id)a3 finishedAdjustingZoomFactor:(double)a4;
- (void)moveCursorToCurrentFakeCursorLocation;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendUserEventOccurred;
- (void)setAccruedOvershoot:(double)a3;
- (void)setActiveLensTransitioning:(BOOL)a3;
- (void)setActiveLensViewController:(id)a3;
- (void)setAxuiService:(id)a3;
- (void)setBrailleInputUIIsShowing:(BOOL)a3;
- (void)setCachedValuesSerialQueue:(id)a3;
- (void)setCarouselLockActive:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setDeactivatedAppIDs:(id)a3;
- (void)setDebugFocusView:(id)a3;
- (void)setDisableControlCenterAssertionFullscreenLens:(id)a3;
- (void)setDisableControlCenterAssertionPIPLens:(id)a3;
- (void)setDisableHomeGestureAssertion:(id)a3;
- (void)setDisableNotificationCenterAssertionFullscreenLens:(id)a3;
- (void)setDisableNotificationCenterAssertionPIPLens:(id)a3;
- (void)setDockedLensViewController:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setFakeLaserVC:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setFullscreenLensViewController:(id)a3;
- (void)setFullscreenZoomDidAutopanUnitTestCallback:(id)a3;
- (void)setGutterDistanceForUnitTests:(double)a3 scaleFactor:(double)a4;
- (void)setHaveTriedScrollingDuringZoomSweep:(BOOL)a3;
- (void)setHidePointerAssertion:(id)a3;
- (void)setHitTestCategoryAssertion:(id)a3;
- (void)setIdleTouchTimer:(id)a3;
- (void)setInUnitTestingMode:(BOOL)a3;
- (void)setIsMainDisplay:(BOOL)a3;
- (void)setIsSweepingToNextZoomRow:(BOOL)a3;
- (void)setKbContext:(id)a3;
- (void)setKeyRepeatTimer:(id)a3;
- (void)setLastEventTime:(double)a3;
- (void)setLastHoveredView:(id)a3;
- (void)setLastKeyboardCommand:(int64_t)a3;
- (void)setLastOrbLocation:(CGPoint)a3;
- (void)setLastPointerLocation:(CGPoint)a3;
- (void)setLastScrollTrapOffset:(double)a3;
- (void)setLastWheelDelta:(double)a3;
- (void)setLensAutopanner:(id)a3;
- (void)setLensDragXConstraint:(id)a3;
- (void)setLensDragYConstraint:(id)a3;
- (void)setLensHeightConstraint:(id)a3;
- (void)setLensTransitionUnitTestCallback:(id)a3;
- (void)setLensWidthConstraint:(id)a3;
- (void)setMenuViewController:(id)a3;
- (void)setMinimapView:(id)a3;
- (void)setPanOffsetXBeforeTransition:(double)a3;
- (void)setPipLensEdgeMask:(unint64_t)a3;
- (void)setPipLensViewController:(id)a3;
- (void)setPipWasOnBeforeSpeakFingerStarted:(BOOL)a3;
- (void)setPointerClientController:(id)a3;
- (void)setPointerEventStream:(id)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setRedirectPointerAssertion:(id)a3;
- (void)setRedirectPointerLocation:(CGPoint)a3;
- (void)setScreen:(id)a3;
- (void)setScrollBeganWhileSnarfingScrolls:(BOOL)a3;
- (void)setScrollTrapView:(id)a3;
- (void)setShouldSuppressKeyCommandHUD:(BOOL)a3;
- (void)setSlugEdgeMask:(unint64_t)a3;
- (void)setSlugRingBottomConstraint:(id)a3;
- (void)setSlugRingDragXConstraint:(id)a3;
- (void)setSlugRingDragYConstraint:(id)a3;
- (void)setSlugRingLeadingConstraint:(id)a3;
- (void)setSlugRingTopConstraint:(id)a3;
- (void)setSlugRingTrailingConstraint:(id)a3;
- (void)setSlugViewController:(id)a3;
- (void)setSmartZoom:(id)a3;
- (void)setSnarfingWheelEventsForPan:(BOOL)a3;
- (void)setSnarfingWheelEventsForZoom:(BOOL)a3;
- (void)setTestingScreenSize:(CGSize)a3;
- (void)setToggleStandbyOnNextCommandChange:(BOOL)a3;
- (void)setTouchTrapView:(id)a3;
- (void)setTriedToRezoomForDockTransition:(BOOL)a3;
- (void)setTriedToToggleStandbyDuringAnimation:(BOOL)a3;
- (void)setUnitTestDelegate:(id)a3;
- (void)setWindowContextId:(unsigned int)a3;
- (void)setZoomAlertManager:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomIsAnimating:(BOOL)a3;
- (void)setZoomIsAnimatingDueToStandbyToggle:(BOOL)a3;
- (void)setZoomIsAnimatingDueToTransition:(BOOL)a3;
- (void)setZoomMenuVisibilityChangedUnitTestCallback:(id)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)setZoomWasUnzoomedDueToAppTransition:(BOOL)a3;
- (void)showZoomSlugAndLens:(BOOL)a3 completion:(id)a4;
- (void)slugWasDoubleTappedWithSlugViewController:(id)a3;
- (void)slugWasSingleTappedWithSlugViewController:(id)a3;
- (void)slugWasTripleTappedWithSlugViewController:(id)a3;
- (void)stopZoomMovementWithVelocityWithFullscreenEventHandler:(id)a3;
- (void)toggleLensResizeModeWithMenuViewController:(id)a3;
- (void)toggleLensVisibilityWithMenuViewController:(id)a3;
- (void)toggleZoomMenu;
- (void)touchTrapView:(id)a3 didTrapTouches:(id)a4 withEvent:(id)a5;
- (void)touchTrapViewActivated:(id)a3;
- (void)updateDockedZoomRegionVisibility:(BOOL)a3;
- (void)updateFocusWithSmartZoom:(id)a3;
- (void)updateOrbZoomAtPoint:(CGPoint)a3 withSlugViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wantsToStartAutopannerWithATVEventProcessor:(id)a3;
- (void)wantsToStartAutopannerWithSlugViewController:(id)a3;
- (void)wantsToStopAutopannerWithATVEventProcessor:(id)a3;
- (void)wantsToStopAutopannerWithSlugViewController:(id)a3;
- (void)willBeginAutopanningLensWithAutopanner:(id)a3;
- (void)zoomInToPoint:(CGPoint)a3 withZoomFactor:(double)a4 animated:(BOOL)a5;
- (void)zoomLensViewController:(id)a3 didMoveLens:(id)a4 withDelta:(CGPoint)a5;
- (void)zoomLensViewController:(id)a3 grabberDidReceiveTap:(id)a4;
- (void)zoomLensViewController:(id)a3 willBeginMovingLens:(id)a4;
- (void)zoomLensViewControllerDidChangeStandbyMode:(id)a3;
- (void)zoomLensViewControllerUpdateUIForStandby:(id)a3 completion:(id)a4;
- (void)zoomListenerRegisteredForAllAttributeUpdatesCoalesced:(BOOL)a3 clientIdentifier:(id)a4;
- (void)zoomListenerRegisteredForAttributeUpdatesImmediately:(id)a3 registered:(BOOL)a4 clientIdentifier:(id)a5;
- (void)zoomSlugViewController:(id)a3 didDragSlug:(id)a4 withDelta:(CGPoint)a5;
@end

@implementation ZWRootViewController

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  return (UIScreen *)WeakRetained;
}

- (ZWRootViewController)initWithAXUIService:(id)a3 onScreen:(id)a4 isMainDisplay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v111.receiver = self;
  v111.super_class = (Class)ZWRootViewController;
  v10 = [(ZWRootViewController *)&v111 initWithNibName:0 bundle:0];
  if (v10)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSZoomTouchReadyForObserversNotification, 0, 0, 1u);
    objc_storeWeak((id *)&v10->_axuiService, v8);
    [(ZWRootViewController *)v10 _loadZoomTouchExtras];
    [(ZWRootViewController *)v10 _initializeZoomSettingsIfNeeded];
    v12 = objc_alloc_init(ZWAlertManager);
    [(ZWRootViewController *)v10 setZoomAlertManager:v12];

    [(ZWRootViewController *)v10 setIsMainDisplay:v5];
    [(ZWRootViewController *)v10 setScreen:v9];
    v13 = +[ZWEventProcessor defaultEventProcessor];
    [(ZWRootViewController *)v10 setEventManager:v13];
    v82 = v13;
    if (v5)
    {
      [v13 setMainDisplayDelegate:v10];
    }
    else
    {
      v14 = [v13 externalDisplayDelegates];
      [v14 addPointer:v10];
    }
    v10->_cachedIsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
    objc_initWeak(&location, v10);
    v15 = +[NSNotificationCenter defaultCenter];
    v16 = +[NSOperationQueue mainQueue];
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke;
    v108[3] = &unk_79240;
    objc_copyWeak(&v109, &location);
    uint64_t v17 = [v15 addObserverForName:UIAccessibilityVoiceOverStatusDidChangeNotification object:0 queue:v16 usingBlock:v108];
    id voiceOverStatusChangedNotificationObserverToken = v10->_voiceOverStatusChangedNotificationObserverToken;
    v10->_id voiceOverStatusChangedNotificationObserverToken = (id)v17;

    dispatch_queue_t v19 = dispatch_queue_create("ZWCachedValuesSerialQueue", 0);
    [(ZWRootViewController *)v10 setCachedValuesSerialQueue:v19];
    [(ZWRootViewController *)v10 _initializeEventUIContext:&v10->_eventUIContext];
    [(ZWRootViewController *)v10 _initializeEventUIContext:&v10->_eventUIForInProgressFluidSwitcherGestureContext];
    dispatch_queue_t v81 = v19;
    id v20 = objc_alloc((Class)AXDispatchTimer);
    id v21 = &_dispatch_main_q;
    id v22 = [v20 initWithTargetSerialQueue:&_dispatch_main_q];

    [(ZWRootViewController *)v10 setIdleTouchTimer:v22];
    [v22 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v80 = v22;
    v23 = [[ZWZoomSlugViewController alloc] initWithNibName:0 bundle:0];
    [(ZWRootViewController *)v10 setSlugViewController:v23];
    [(ZWZoomSlugViewController *)v23 setDelegate:v10];
    v79 = v23;
    v24 = +[ZWCoalescedSettings sharedInstance];
    [v24 zoomFactor];
    double v26 = v25;

    v27 = +[ZWCoalescedSettings sharedInstance];
    [v27 zoomPanOffset];
    double v29 = v28;
    double v31 = v30;
    id v85 = v9;

    v32 = +[AXSettings sharedInstance];
    v84 = [v32 zoomCurrentLensEffect];

    v33 = +[AXSettings sharedInstance];
    v34 = objc_alloc_init(ZWKeyboardContext);
    [(ZWRootViewController *)v10 setKbContext:v34];

    -[ZWKeyboardContext setKeyboardFrame:](v10->_kbContext, "setKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    -[ZWKeyboardContext setZoomFollowsFocus:](v10->_kbContext, "setZoomFollowsFocus:", [v33 zoomShouldFollowFocus]);
    -[ZWKeyboardContext setZoomRepositionsForKeyboard:](v10->_kbContext, "setZoomRepositionsForKeyboard:", [v33 zoomAlwaysUseWindowedZoomForTyping]);
    v35 = objc_alloc_init(ZWLensAutopanner);
    [(ZWRootViewController *)v10 setLensAutopanner:v35];
    [(ZWLensAutopanner *)v35 setDelegate:v10];
    v77 = v35;
    v36 = -[ZWZoomLensViewController initWithZoomFactor:zoomPanOffset:lensEffect:screen:]([ZWZoomPIPLensViewController alloc], "initWithZoomFactor:zoomPanOffset:lensEffect:screen:", v84, v85, v26, v29, v31);
    [(ZWRootViewController *)v10 setPipLensViewController:v36];
    [(ZWZoomLensViewController *)v36 setDelegate:v10];
    [(ZWZoomPIPLensViewController *)v36 setPipDelegate:v10];
    v37 = -[ZWZoomLensViewController initWithZoomFactor:zoomPanOffset:lensEffect:screen:]([ZWZoomDockedLensViewController alloc], "initWithZoomFactor:zoomPanOffset:lensEffect:screen:", v84, v85, v26, v29, v31);
    [(ZWRootViewController *)v10 setDockedLensViewController:v37];
    [(ZWZoomLensViewController *)v37 setDelegate:v10];
    [(ZWZoomDockedLensViewController *)v37 setDockedDelegate:v10];
    v38 = -[ZWZoomLensViewController initWithZoomFactor:zoomPanOffset:lensEffect:screen:]([ZWZoomFullscreenLensViewController alloc], "initWithZoomFactor:zoomPanOffset:lensEffect:screen:", v84, v85, v26, v29, v31);
    [(ZWRootViewController *)v10 setFullscreenLensViewController:v38];
    [(ZWZoomLensViewController *)v38 setDelegate:v10];
    v75 = v38;
    v83 = [[ZWMenuViewController alloc] initWithNibName:0 bundle:0];
    [(ZWRootViewController *)v10 setMenuViewController:v83];
    v39 = [(ZWRootViewController *)v10 menuViewController];
    [v39 setModalPresentationStyle:7];

    v40 = [(ZWRootViewController *)v10 menuViewController];
    v41 = [v40 popoverPresentationController];
    [v41 setDelegate:v10];

    [(ZWMenuViewController *)v83 setDelegate:v10];
    [(ZWRootViewController *)v10 eventManager];
    if (v5) {
      v42 = {;
    }
      v43 = [v42 fullscreenEventHandler];
      [v43 setZoomDelegate:v10];
    }
    else {
      v42 = {;
    }
      v43 = [v42 fullscreenEventHandler];
      v44 = [v43 externalDisplayZoomDelegates];
      [v44 addPointer:v10];
    }
    v45 = +[AXSettings sharedInstance];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_2;
    v106[3] = &unk_78C80;
    objc_copyWeak(&v107, &location);
    [v45 registerUpdateBlock:v106 forRetrieveSelector:"zoomPreferredLensModes" withListener:v10];

    objc_destroyWeak(&v107);
    v46 = +[AXSettings sharedInstance];
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_3;
    v104[3] = &unk_78C80;
    objc_copyWeak(&v105, &location);
    [v46 registerUpdateBlock:v104 forRetrieveSelector:"zoomShouldShowSlug" withListener:v10];

    objc_destroyWeak(&v105);
    v47 = +[AXSettings sharedInstance];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_4;
    v102[3] = &unk_78C80;
    objc_copyWeak(&v103, &location);
    [v47 registerUpdateBlock:v102 forRetrieveSelector:"zoomCurrentLensEffect" withListener:v10];

    objc_destroyWeak(&v103);
    v48 = +[AXSettings sharedInstance];
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_5;
    v99[3] = &unk_78DA8;
    objc_copyWeak(&v101, &location);
    id v49 = v33;
    id v100 = v49;
    [v48 registerUpdateBlock:v99 forRetrieveSelector:"zoomShouldFollowFocus" withListener:v10];

    objc_destroyWeak(&v101);
    v50 = +[AXSettings sharedInstance];
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_6;
    v96[3] = &unk_78DA8;
    objc_copyWeak(&v98, &location);
    id v51 = v49;
    id v97 = v51;
    [v50 registerUpdateBlock:v96 forRetrieveSelector:"zoomAlwaysUseWindowedZoomForTyping" withListener:v10];

    objc_destroyWeak(&v98);
    v52 = +[AXSettings sharedInstance];
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_7;
    v94[3] = &unk_78C80;
    objc_copyWeak(&v95, &location);
    [v52 registerUpdateBlock:v94 forRetrieveSelector:"zoomPreferredMaximumZoomScale" withListener:v10];

    objc_destroyWeak(&v95);
    v53 = +[AXSettings sharedInstance];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_8;
    v92[3] = &unk_78C80;
    objc_copyWeak(&v93, &location);
    [v53 registerUpdateBlock:v92 forRetrieveSelector:"zoomCurrentLensMode" withListener:v10];

    objc_destroyWeak(&v93);
    v54 = +[AXSettings sharedInstance];
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_9;
    v90[3] = &unk_78C80;
    objc_copyWeak(&v91, &location);
    [v54 registerUpdateBlock:v90 forRetrieveSelector:"zoomPreferredCurrentDockPosition" withListener:v10];

    objc_destroyWeak(&v91);
    v55 = +[AXSettings sharedInstance];
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_10;
    v88[3] = &unk_78C80;
    objc_copyWeak(&v89, &location);
    [v55 registerUpdateBlock:v88 forRetrieveSelector:"zoomShowWhileMirroring" withListener:v10];

    objc_destroyWeak(&v89);
    if (ZOTTimeSinceBoot() <= 99)
    {
      v56 = +[ZWCoalescedSettings sharedInstance];
      [v56 setZoomInStandby:1];
    }
    v10->_snarfingWheelEventsForPan = 0;
    v57 = objc_alloc_init(ZWSmartZoomManager);
    [(ZWRootViewController *)v10 setSmartZoom:v57];
    [(ZWSmartZoomManager *)v57 setDelegate:v10];
    [(ZWRootViewController *)v10 _enableSmartZoomIfNeeded];
    [(ZWRootViewController *)v10 _updateMinimapStatus];
    v58 = (void *)AXAssertionTypeDisableNotificationCenterGesture;
    id v59 = +[AXAssertion assertionWithType:AXAssertionTypeDisableNotificationCenterGesture identifier:@"Zoom: Lens on screeen edge"];
    uint64_t v60 = AXAssertionTypeDisableControlCenterGesture;
    id v61 = +[AXAssertion assertionWithType:AXAssertionTypeDisableControlCenterGesture identifier:@"Zoom: Lens on screeen edge"];
    id v62 = +[AXAssertion assertionWithType:v58 identifier:@"Zoom: Fullscreen lens not on edge"];
    id v63 = +[AXAssertion assertionWithType:v60 identifier:@"Zoom: Fullscreen lens not on edge"];
    [(ZWRootViewController *)v10 _removeAllSystemGestureDisablingAssertions];
    int v64 = _AXSVoiceOverTouchEnabled();
    if (v64)
    {
      v58 = +[AXVoiceOverServer server];
      id v65 = [v58 isBrailleInputUIShowing];
    }
    else
    {
      id v65 = 0;
    }
    [(ZWRootViewController *)v10 setBrailleInputUIIsShowing:v65];
    if (v64) {

    }
    +[NSDate timeIntervalSinceReferenceDate];
    v10->_lastEdgePanHapticTime = v66;
    v67 = +[NSMutableSet set];
    [(ZWRootViewController *)v10 setDeactivatedAppIDs:v67];

    id v68 = [objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
    [(ZWRootViewController *)v10 setFeedbackGenerator:v68];

    v69 = +[AXSpeakFingerManager sharedInstance];
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_11;
    v86[3] = &unk_78C80;
    objc_copyWeak(&v87, &location);
    [v69 registerBlockForStateChange:v86];

    if (_AXSZoomSpeakUnderFingerEnabled() && !_AXSApplicationAccessibilityEnabled()) {
      _AXSApplicationAccessibilitySetEnabled();
    }
    id v70 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(ZWRootViewController *)v10 setKeyRepeatTimer:v70];

    v71 = [(ZWRootViewController *)v10 keyRepeatTimer];
    [v71 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

    [(ZWRootViewController *)v10 setLastKeyboardCommand:16];
    v72 = [[ZWFakeLaserViewController alloc] initWithZoomRootVC:v10];
    [(ZWRootViewController *)v10 setFakeLaserVC:v72];

    v73 = objc_opt_new();
    [(ZWRootViewController *)v10 setPointerClientController:v73];

    [(ZWRootViewController *)v10 setZoomIsAnimating:0];
    objc_destroyWeak(&v87);

    objc_destroyWeak(&v109);
    objc_destroyWeak(&location);

    id v9 = v85;
  }

  return v10;
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[64] = UIAccessibilityIsVoiceOverRunning();
  [WeakRetained _updateStealingSingleFingerPanning:0 showHUDMessage:0];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained pipLensViewController];
  [v1 preferredLensModesDidChange];

  v2 = [WeakRetained fullscreenLensViewController];
  [v2 preferredLensModesDidChange];

  v3 = [WeakRetained dockedLensViewController];
  [v3 preferredLensModesDidChange];

  v4 = [WeakRetained slugViewController];
  [v4 preferredLensModesDidChange];

  BOOL v5 = [WeakRetained menuViewController];
  [v5 preferredLensModesDidChange];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSlugLayoutAnimated:0];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained menuViewController];
  [v1 zoomCurrentLensEffectDidChange];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[116], "setZoomFollowsFocus:", objc_msgSend(*(id *)(a1 + 32), "zoomShouldFollowFocus"));
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[116], "setZoomRepositionsForKeyboard:", objc_msgSend(*(id *)(a1 + 32), "zoomAlwaysUseWindowedZoomForTyping"));
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_7(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v17 = objc_loadWeakRetained((id *)(a1 + 32));
  [v17 zoomFactor];
  objc_msgSend(v17, "setZoomFactorRespectingUserPreferredMaximumZoom:");

  v2 = [v17 activeLensViewController];
  id WeakRetained = objc_loadWeakRetained(v1);
  v4 = [WeakRetained activeLensViewController];
  id v5 = [v4 inStandbyMode];
  id v6 = objc_loadWeakRetained(v1);
  [v6 zoomFactor];
  double v8 = v7;
  id v9 = objc_loadWeakRetained(v1);
  [v9 zoomPanOffset];
  double v11 = v10;
  double v13 = v12;
  id v14 = objc_loadWeakRetained(v1);
  v15 = [v14 activeLensViewController];
  v16 = [v15 lensEffect];
  objc_msgSend(v2, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", v5, v16, 1, 0, v8, v11, v13);
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSettings sharedInstance];
  v2 = [v1 zoomCurrentLensMode];

  if ([v2 length])
  {
    v3 = [WeakRetained activeZoomMode];
    unsigned __int8 v4 = [v3 isEqualToString:v2];

    if ((v4 & 1) == 0) {
      [WeakRetained _transitionToLensForMode:v2 animated:1 completion:0];
    }
  }
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSettings sharedInstance];
  v2 = [v1 zoomPreferredCurrentDockPosition];
  [WeakRetained handleSettingsAppDidUpdatePreferredDockPosition:v2];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSettings sharedInstance];
  if ([v1 zoomShowWhileMirroring]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = 16;
  }
  v3 = [WeakRetained view];
  unsigned __int8 v4 = [v3 layer];
  [v4 setDisableUpdateMask:v2];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_11(uint64_t a1)
{
  if (_AXSZoomTouchEnabled())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_12;
    block[3] = &unk_78C80;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v3);
  }
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_12(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained slugViewController];
  [v3 updateUIForSpeakFingerStateChange];

  id v4 = objc_loadWeakRetained(v1);
  [v4 _updateEventUIContextForSpeakFingerStateChange];
}

- (void)dealloc
{
  id v3 = [(ZWRootViewController *)self eventManager];
  [v3 cleanup];

  [(ZWRootViewController *)self _removeAllSystemGestureDisablingAssertions];
  id v4 = [(ZWRootViewController *)self smartZoom];
  [v4 disableSmartZoom];

  id v5 = [(ZWRootViewController *)self smartZoom];
  [v5 setDelegate:0];

  if (self->_voiceOverStatusChangedNotificationObserverToken)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self->_voiceOverStatusChangedNotificationObserverToken name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    id voiceOverStatusChangedNotificationObserverToken = self->_voiceOverStatusChangedNotificationObserverToken;
    self->_id voiceOverStatusChangedNotificationObserverToken = 0;
  }
  if ([(ZWRootViewController *)self isViewLoaded])
  {
    double v8 = [(ZWRootViewController *)self slugViewController];
    [v8 removeObserver:self forKeyPath:@"slugRingView.bounds" context:&ZWZoomItemObserverContextID];

    id v9 = [(ZWRootViewController *)self slugViewController];
    [v9 removeObserver:self forKeyPath:@"view.center" context:&ZWZoomItemObserverContextID];

    double v10 = [(ZWRootViewController *)self slugViewController];
    [v10 removeObserver:self forKeyPath:@"userIsInteractingWithSlug" context:&ZWZoomItemObserverContextID];

    double v11 = [(ZWRootViewController *)self menuViewController];
    [v11 removeObserver:self forKeyPath:@"userIsInteractingWithMenu" context:&ZWZoomItemObserverContextID];
  }
  uint64_t v12 = [(ZWRootViewController *)self lensAutopanner];
  [(id)v12 setDelegate:0];

  LOBYTE(v12) = [(ZWRootViewController *)self isMainDisplay];
  double v13 = [(ZWRootViewController *)self eventManager];
  id v14 = v13;
  if (v12)
  {
    [v13 setMainDisplayDelegate:0];
LABEL_13:

    goto LABEL_14;
  }
  v15 = [v13 externalDisplayDelegates];
  id v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    while (1)
    {
      v18 = [(ZWRootViewController *)self eventManager];
      dispatch_queue_t v19 = [v18 externalDisplayDelegates];
      id v20 = (ZWRootViewController *)[v19 pointerAtIndex:v17];

      if (v20 == self) {
        break;
      }
      ++v17;
      id v21 = [(ZWRootViewController *)self eventManager];
      id v22 = [v21 externalDisplayDelegates];
      id v23 = [v22 count];

      if ((unint64_t)v23 <= v17) {
        goto LABEL_14;
      }
    }
    id v14 = [(ZWRootViewController *)self eventManager];
    v24 = [v14 externalDisplayDelegates];
    [v24 removePointerAtIndex:v17];

    goto LABEL_13;
  }
LABEL_14:
  double v25 = [(ZWRootViewController *)self pipLensViewController];
  [v25 setDelegate:0];

  double v26 = [(ZWRootViewController *)self dockedLensViewController];
  [v26 setDelegate:0];

  v27 = [(ZWRootViewController *)self fullscreenLensViewController];
  [v27 setDelegate:0];

  double v28 = [(ZWRootViewController *)self slugViewController];
  [v28 setDelegate:0];

  double v29 = [(ZWRootViewController *)self keyRepeatTimer];
  [v29 cancel];

  double v30 = [(ZWRootViewController *)self hitTestCategoryAssertion];
  [v30 invalidate];

  v31.receiver = self;
  v31.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v31 dealloc];
}

- (void)_removePIPSystemGestureDisablingAssertions
{
  [(ZWRootViewController *)self setDisableNotificationCenterAssertionPIPLens:0];

  [(ZWRootViewController *)self setDisableControlCenterAssertionPIPLens:0];
}

- (void)_removeFullscreenSystemGestureDisablingAssertions
{
  [(ZWRootViewController *)self setDisableNotificationCenterAssertionFullscreenLens:0];

  [(ZWRootViewController *)self setDisableControlCenterAssertionFullscreenLens:0];
}

- (void)_removeHomeGestureDisablingAssertion
{
}

- (void)_removeAllSystemGestureDisablingAssertions
{
  [(ZWRootViewController *)self _removePIPSystemGestureDisablingAssertions];
  [(ZWRootViewController *)self _removeFullscreenSystemGestureDisablingAssertions];

  [(ZWRootViewController *)self _removeHomeGestureDisablingAssertion];
}

- (void)_updateSystemGestureDisablingAssertions
{
  id v3 = [(ZWRootViewController *)self activeLensViewController];
  id v4 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v3 != v4
    && ([(ZWRootViewController *)self activeLensViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(ZWRootViewController *)self pipLensViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    [(ZWRootViewController *)self _updateSystemGestureDisablingAssertionsForPipLensPosition];
  }
  else
  {
    [(ZWRootViewController *)self _updateSystemGestureDisablingAssertionsForFullscreenZoom];
  }
}

- (void)_updateSystemGestureDisablingAssertionsForPipLensPosition
{
  if ([(ZWRootViewController *)self _pipLensIsNearTopOfScreen])
  {
    id v3 = [(ZWRootViewController *)self disableNotificationCenterAssertionPIPLens];

    if (!v3)
    {
      id v4 = +[AXAssertion assertionWithType:AXAssertionTypeDisableNotificationCenterGesture identifier:@"Zoom: Lens on screeen edge"];
      [(ZWRootViewController *)self setDisableNotificationCenterAssertionPIPLens:v4];
    }
  }
  else
  {
    [(ZWRootViewController *)self setDisableNotificationCenterAssertionPIPLens:0];
  }
  if (AXDeviceHasHomeButton() && !AXDeviceIsPad())
  {
    if (![(ZWRootViewController *)self _pipLensIsNearBottomOfScreen]) {
      goto LABEL_14;
    }
  }
  else if (![(ZWRootViewController *)self _pipLensIsNearTopOfScreen] {
         || ![(ZWRootViewController *)self _pipLensIsNearRightOfScreen])
  }
  {
LABEL_14:
    [(ZWRootViewController *)self setDisableControlCenterAssertionPIPLens:0];
    return;
  }
  if (![(ZWRootViewController *)self _shouldBlockShowControlCenterGesture]) {
    goto LABEL_14;
  }
  id v5 = [(ZWRootViewController *)self disableControlCenterAssertionPIPLens];

  if (!v5)
  {
    id v6 = +[AXAssertion assertionWithType:AXAssertionTypeDisableControlCenterGesture identifier:@"Zoom: Lens on screeen edge"];
    [(ZWRootViewController *)self setDisableControlCenterAssertionPIPLens:v6];
  }
}

- (void)_loadZoomTouchExtras
{
  uint64_t v2 = +[NSBundle bundleWithPath:@"/System/Library/AccessibilityBundles/ZoomTouchExtras.axbundle"];
  if (v2)
  {
    id v3 = v2;
    [v2 load];
    objc_msgSend(objc_msgSend(v3, "principalClass"), "initialize");
    uint64_t v2 = v3;
  }
}

- (void)_initializeZoomSettingsIfNeeded
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[ZWCoalescedSettings sharedInstance];
  if (([v3 zoomPreferencesWereInitialized] & 1) == 0)
  {
    __int16 v17 = 0;
    uint64_t v16 = 0;
    id v5 = +[AXSettings sharedInstance];
    [v5 zoomUserHadLegacyZoomEnabled:(char *)&v17 + 1 wasZoomedIn:&v17 withScale:&v16];

    double y = CGPointZero.y;
    objc_msgSend(v4, "setZoomPanOffset:", CGPointZero.x, y);
    [(ZWRootViewController *)self _lensDefaultSize];
    objc_msgSend(v4, "setZoomWindowFrame:", CGPointZero.x, y, v7, v8);
    [v4 setDockSize:0.5];
    [v3 setZoomCurrentLensEffect:AXZoomLensEffectNone];
    objc_msgSend(v4, "setZoomSlugNormalizedPosition:", 1.0, 0.5);
    [v3 setZoomShouldShowSlug:0];
    [v3 zoomPreferredMaximumZoomScale];
    if (v9 == 0.0) {
      [v3 setZoomPreferredMaximumZoomScale:8.0];
    }
    double v10 = AXZoomUserSelectableLensModes();
    [v3 setZoomPreferredLensModes:v10];

    [v3 setZoomShouldAllowFullscreenAutopanning:1];
    if (HIBYTE(v17))
    {
      LOBYTE(v15) = 1;
      _AXLogWithFacility();
      double v11 = (double *)&v16;
      if (!(_BYTE)v17) {
        double v11 = (double *)&AXZoomMinimumZoomLevel;
      }
      objc_msgSend(v4, "setZoomFactor:", *v11, v15, @"Determined that legacy zoom had been set up. Setting zoom window up to look like legacy zoom");
      [v3 setZoomCurrentLensMode:AXZoomLensModeFullscreen];
      [v3 setZoomShouldFollowFocus:0];
      [v3 setZoomPreferredCurrentLensMode:AXZoomLensModeFullscreen];
    }
    else
    {
      uint64_t v12 = AXZoomLensDefault();
      [v4 setZoomFactor:2.0];
      [v3 setZoomPreferredCurrentLensMode:v12];
      [v3 setZoomCurrentLensMode:v12];
      [v3 setZoomShouldFollowFocus:1];
    }
    [v3 setZoomPreferencesWereInitialized:1];
  }
  if ([v4 zoomInStandby])
  {
    double v13 = [v3 zoomPreferredCurrentLensMode];
    unsigned int v14 = [v13 isEqualToString:AXZoomLensModeWindow];

    if (v14) {
      [v3 setZoomCurrentLensEffect:AXZoomLensEffectNone];
    }
  }
  if (([v3 zoomShouldFollowFocus] & 1) == 0
    && [v3 zoomAlwaysUseWindowedZoomForTyping])
  {
    [v3 setZoomAlwaysUseWindowedZoomForTyping:0];
  }
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v45 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  double v7 = +[AXSettings sharedInstance];
  if ([v7 zoomShowWhileMirroring]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 16;
  }
  double v9 = [v45 layer];
  [v9 setDisableUpdateMask:v8];

  [(ZWRootViewController *)self setView:v45];
  id v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWRootViewController *)self setContainerView:v10];

  double v11 = [(ZWRootViewController *)self containerView];
  [v11 setAutoresizingMask:18];

  uint64_t v12 = [(ZWRootViewController *)self containerView];
  [v45 addSubview:v12];

  double v13 = -[ZWTouchTrapView initWithFrame:]([ZWTouchTrapView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWRootViewController *)self setTouchTrapView:v13];

  unsigned int v14 = [(ZWRootViewController *)self touchTrapView];
  [v14 setAutoresizingMask:18];

  uint64_t v15 = [(ZWRootViewController *)self touchTrapView];
  [v45 addSubview:v15];

  uint64_t v16 = [(ZWRootViewController *)self touchTrapView];
  [v16 setDelegate:self];

  __int16 v17 = [(ZWRootViewController *)self fakeLaserVC];
  [(ZWRootViewController *)self addChildViewController:v17];

  v18 = [(ZWRootViewController *)self containerView];
  dispatch_queue_t v19 = [(ZWRootViewController *)self fakeLaserVC];
  id v20 = [v19 view];
  [v18 addSubview:v20];

  id v21 = [(ZWRootViewController *)self containerView];
  id v22 = [(ZWRootViewController *)self fakeLaserVC];
  id v23 = [v22 view];
  [v21 bringSubviewToFront:v23];

  id v24 = objc_alloc_init((Class)UIScrollView);
  id v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10000.0, 10000.0);
  [(ZWRootViewController *)self setScrollTrapView:v25];

  double v26 = +[UIColor clearColor];
  v27 = [(ZWRootViewController *)self scrollTrapView];
  [v27 setBackgroundColor:v26];

  double v28 = [(ZWRootViewController *)self scrollTrapView];
  [v28 setAlpha:0.0];

  double v29 = [(ZWRootViewController *)self scrollTrapView];
  double v30 = [v29 layer];
  [v30 setHitTestsAsOpaque:1];

  objc_super v31 = [(ZWRootViewController *)self containerView];
  [v31 addSubview:v24];

  v32 = [(ZWRootViewController *)self containerView];
  v33 = [(ZWRootViewController *)self scrollTrapView];
  [v32 addSubview:v33];

  [v24 setDelegate:self];
  [v24 setBounces:0];
  [v24 setHidden:1];
  objc_msgSend(v24, "setContentSize:", 10000.0, 10000.0);
  objc_msgSend(v24, "setContentOffset:", 5000.0, 5000.0);
  v34 = [(ZWRootViewController *)self containerView];
  v35 = [v24 panGestureRecognizer];
  [v34 addGestureRecognizer:v35];

  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = [(ZWRootViewController *)self containerView];
  id v37 = objc_msgSend(v24, "ax_pinConstraintsInAllDimensionsToView:", v36);

  v38 = [(ZWRootViewController *)self scrollTrapView];
  v39 = [(ZWRootViewController *)self containerView];
  id v40 = objc_msgSend(v38, "ax_pinConstraintsInAllDimensionsToView:", v39);

  [v45 setHidden:1];
  v41 = [(ZWRootViewController *)self slugViewController];
  [v41 addObserver:self forKeyPath:@"view.center" options:1 context:&ZWZoomItemObserverContextID];

  v42 = [(ZWRootViewController *)self slugViewController];
  [v42 addObserver:self forKeyPath:@"slugRingView.bounds" options:1 context:&ZWZoomItemObserverContextID];

  v43 = [(ZWRootViewController *)self slugViewController];
  [v43 addObserver:self forKeyPath:@"userIsInteractingWithSlug" options:1 context:&ZWZoomItemObserverContextID];

  v44 = [(ZWRootViewController *)self menuViewController];
  [v44 addObserver:self forKeyPath:@"userIsInteractingWithMenu" options:1 context:&ZWZoomItemObserverContextID];
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v47 viewDidLoad];
  [(ZWRootViewController *)self _updateZoomListeners];
  id v3 = [(ZWRootViewController *)self slugViewController];
  [(ZWRootViewController *)self addChildViewController:v3];

  id v4 = [(ZWRootViewController *)self containerView];
  id v5 = [(ZWRootViewController *)self slugViewController];
  id v6 = [v5 view];
  [v4 addSubview:v6];

  double v7 = [(ZWRootViewController *)self slugViewController];
  [v7 didMoveToParentViewController:self];

  v46 = [(ZWRootViewController *)self containerView];
  uint64_t v8 = [(ZWRootViewController *)self slugViewController];
  double v9 = [v8 view];

  id v10 = [(ZWRootViewController *)self slugViewController];
  double v11 = [v10 slugRingView];

  int v12 = AXResistAllCompressingAndStretching[0];
  int v13 = AXResistAllCompressingAndStretching[1];
  int v14 = AXResistAllCompressingAndStretching[2];
  int v15 = AXResistAllCompressingAndStretching[3];
  LODWORD(v16) = AXResistAllCompressingAndStretching[0];
  LODWORD(v17) = v13;
  LODWORD(v18) = v14;
  LODWORD(v19) = v15;
  objc_msgSend(v9, "ax_setContentHuggingAndCompressionResistance:", v16, v17, v18, v19);
  LODWORD(v20) = v12;
  LODWORD(v21) = v13;
  LODWORD(v22) = v14;
  LODWORD(v23) = v15;
  objc_msgSend(v11, "ax_setContentHuggingAndCompressionResistance:", v20, v21, v22, v23);
  id v24 = [v46 safeAreaLayoutGuide];
  id v25 = [v11 leadingAnchor];
  double v26 = [v24 leadingAnchor];
  v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26];
  [(ZWRootViewController *)self setSlugRingLeadingConstraint:v27];

  double v28 = [v11 trailingAnchor];
  double v29 = [v24 trailingAnchor];
  double v30 = [v28 constraintLessThanOrEqualToAnchor:v29];
  [(ZWRootViewController *)self setSlugRingTrailingConstraint:v30];

  objc_super v31 = [v11 topAnchor];
  v32 = [v24 topAnchor];
  int HasJindo = AXDeviceHasJindo();
  double v34 = 0.0;
  if (HasJindo) {
    double v34 = 5.0;
  }
  v35 = [v31 constraintGreaterThanOrEqualToAnchor:v32 constant:v34];
  [(ZWRootViewController *)self setSlugRingTopConstraint:v35];

  v36 = [v11 bottomAnchor];
  id v37 = [v24 bottomAnchor];
  v38 = [v36 constraintLessThanOrEqualToAnchor:v37];
  [(ZWRootViewController *)self setSlugRingBottomConstraint:v38];

  v39 = [(ZWRootViewController *)self slugRingLeadingConstraint];
  v48[0] = v39;
  id v40 = [(ZWRootViewController *)self slugRingTrailingConstraint];
  v48[1] = v40;
  v41 = [(ZWRootViewController *)self slugRingTopConstraint];
  v48[2] = v41;
  v42 = [(ZWRootViewController *)self slugRingBottomConstraint];
  v48[3] = v42;
  v43 = +[NSArray arrayWithObjects:v48 count:4];
  +[NSLayoutConstraint activateConstraints:v43];

  v44 = +[AXSettings sharedInstance];
  id v45 = [v44 zoomPreferredCurrentLensMode];
  [(ZWRootViewController *)self _transitionToLensForMode:v45 animated:0 completion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v4 viewDidAppear:a3];
  [(ZWRootViewController *)self _updateZoomListeners];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v4 viewWillDisappear:a3];
  [(ZWRootViewController *)self _removeAllSystemGestureDisablingAssertions];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v10 viewWillAppear:a3];
  objc_super v4 = [(ZWRootViewController *)self containerView];
  id v5 = [(ZWRootViewController *)self slugViewController];
  id v6 = [v5 view];
  [v4 bringSubviewToFront:v6];

  [(ZWRootViewController *)self _updateSlugLayoutAnimated:0];
  double v7 = [(ZWRootViewController *)self containerView];
  uint64_t v8 = [(ZWRootViewController *)self fakeLaserVC];
  double v9 = [v8 view];
  [v7 bringSubviewToFront:v9];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v39 didMoveToParentViewController:v4];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3010000000;
  v36[3] = "";
  CGSize v37 = CGSizeZero;
  block[7] = _NSConcreteStackBlock;
  block[8] = 3221225472;
  block[9] = __54__ZWRootViewController_didMoveToParentViewController___block_invoke;
  block[10] = &unk_79268;
  block[11] = self;
  block[12] = v38;
  block[13] = v36;
  AXPerformBlockSynchronouslyOnMainThread();
  id v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __54__ZWRootViewController_didMoveToParentViewController___block_invoke_2;
  block[3] = &unk_79290;
  void block[4] = self;
  block[5] = v38;
  block[6] = v36;
  dispatch_sync(v5, block);

  id v6 = [v4 view];
  double v7 = [v6 window];

  id v8 = [v7 _contextId];
  double v9 = +[NSNumber numberWithUnsignedInt:v8];
  v41 = v9;
  objc_super v10 = +[NSArray arrayWithObjects:&v41 count:1];
  BKSHIDServicesExcludeCAContextsFromHitTestingForZoomSenders();

  double v11 = [(ZWRootViewController *)self hitTestCategoryAssertion];
  [v11 invalidate];

  if (v8)
  {
    int v12 = +[BKSTouchEventService sharedInstance];
    int v13 = +[NSNumber numberWithUnsignedInt:v8];
    id v40 = v13;
    int v14 = +[NSArray arrayWithObjects:&v40 count:1];
    int v15 = [v12 setContextIDs:v14 forHitTestContextCategory:1];
    [(ZWRootViewController *)self setHitTestCategoryAssertion:v15];
  }
  if (ZWLaserIsEnabled())
  {
    if (v7 && v8)
    {
      if (self->_pointerEventStream)
      {
        double v16 = [(ZWRootViewController *)self pointerEventStream];
        [v16 invalidate];
      }
      double v30 = +[BKSMousePointerService sharedInstance];
      double v17 = [(ZWRootViewController *)self view];
      double v18 = [v17 window];
      double v19 = [v18 screen];
      double v20 = [v19 displayConfiguration];
      double v21 = [v20 hardwareIdentifier];
      double v22 = [v30 requestGlobalMouseEventsForDisplay:v21 targetContextID:v8];
      [(ZWRootViewController *)self setPointerEventStream:v22];

      double v23 = [(ZWRootViewController *)self view];
      id v24 = [v23 window];
      id v25 = [v24 screen];
      double v26 = [v25 displayIdentity];
      LODWORD(v17) = [v26 displayID];

      v27 = [(ZWRootViewController *)self cachedValuesSerialQueue];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = __54__ZWRootViewController_didMoveToParentViewController___block_invoke_3;
      v32[3] = &unk_78E40;
      v32[4] = self;
      int v33 = (int)v8;
      int v34 = (int)v17;
      double v28 = v32;
    }
    else
    {
      double v29 = [(ZWRootViewController *)self pointerEventStream];
      [v29 invalidate];

      [(ZWRootViewController *)self setPointerEventStream:0];
      v27 = [(ZWRootViewController *)self cachedValuesSerialQueue];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = __54__ZWRootViewController_didMoveToParentViewController___block_invoke_4;
      v31[3] = &unk_78CA8;
      v31[4] = self;
      double v28 = v31;
    }
    dispatch_sync(v27, v28);
  }
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

void __54__ZWRootViewController_didMoveToParentViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  id v3 = [v2 window];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 interfaceOrientation];

  id v7 = [*(id *)(a1 + 32) screen];
  [v7 bounds];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
}

void __54__ZWRootViewController_didMoveToParentViewController___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 80) = *(void *)(*(void *)(a1[5] + 8) + 24);
  *(void *)(a1[4] + 384) = *(void *)(*(void *)(a1[5] + 8) + 24);
  *(_OWORD *)(a1[4] + 96) = *(_OWORD *)(*(void *)(a1[6] + 8) + 32);
  *(_OWORD *)(a1[4] + 400) = *(_OWORD *)(*(void *)(a1[6] + 8) + 32);
  v1 = (void *)a1[4];
  uint64_t v2 = v1 + 10;
  id v8 = [v1 activeLensViewController];
  id v3 = [v8 lensZoomView];
  objc_msgSend(v3, "zw_convertBoundsToScreenCoordinates");
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v6;
  v2[7] = v7;
}

uint64_t __54__ZWRootViewController_didMoveToParentViewController___block_invoke_3(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 88) = *(_DWORD *)(result + 40);
  *(_DWORD *)(*(void *)(result + 32) + 92) = *(_DWORD *)(result + 44);
  return result;
}

uint64_t __54__ZWRootViewController_didMoveToParentViewController___block_invoke_4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 88) = 0;
  *(_DWORD *)(*(void *)(result + 32) + 92) = 0;
  return result;
}

- (void)_prepareToHandleZoomLevelAdjustmentViaGesture
{
  id v3 = [(ZWRootViewController *)self activeLensViewController];
  unsigned int v4 = [v3 inStandbyMode];

  if (v4) {
    double v5 = AXZoomMinimumZoomLevel;
  }
  else {
    [(ZWRootViewController *)self zoomFactor];
  }
  self->_zoomFactorBeforeUserAdjustingGesture = v5;
}

- (void)_handleZoomLevelAdjustmentViaGesture:(CGPoint)a3
{
  if (self->_zoomFactorBeforeUserAdjustingGesture + a3.y * -0.02 >= AXZoomMinimumZoomLevel) {
    double v4 = self->_zoomFactorBeforeUserAdjustingGesture + a3.y * -0.02;
  }
  else {
    double v4 = AXZoomMinimumZoomLevel;
  }
  double v5 = +[AXSettings sharedInstance];
  [v5 zoomPreferredMaximumZoomScale];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }

  [(ZWRootViewController *)self _updateZoomFactor:0 animated:v8];
}

- (void)_updateSlugConstraintsForOrientation:(int64_t)a3
{
  if ((AXDeviceHasHomeButton() & 1) == 0 && (AXDeviceIsPad() & 1) == 0)
  {
    double v5 = [(ZWRootViewController *)self view];
    [v5 safeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if ((unint64_t)(a3 - 1) > 1)
    {
      if (a3 == 3)
      {
        double v20 = ZOOMLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v24 = 0;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Updating slug constraints for landscape left orientation", v24, 2u);
        }

        if (v9 != 0.0) {
          double v7 = 0.0;
        }
        double v21 = [(ZWRootViewController *)self slugRingLeadingConstraint];
        [v21 setConstant:v7];

        double v22 = [(ZWRootViewController *)self slugRingTrailingConstraint];
        [v22 setConstant:-5.0];

        double v14 = 5.0 - v7;
      }
      else
      {
        if (a3 != 4) {
          return;
        }
        double v16 = ZOOMLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v25 = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Updating slug constraints for landscape right orientation", v25, 2u);
        }

        if (v11 == 0.0) {
          double v17 = -v7;
        }
        else {
          double v17 = 0.0;
        }
        double v18 = [(ZWRootViewController *)self slugRingLeadingConstraint];
        [v18 setConstant:5.0];

        double v19 = [(ZWRootViewController *)self slugRingTrailingConstraint];
        [v19 setConstant:v17];

        double v14 = v17 + 5.0;
      }
    }
    else
    {
      int v12 = ZOOMLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Updating slug constraints for portrait orientaiton", buf, 2u);
      }

      int v13 = [(ZWRootViewController *)self slugRingLeadingConstraint];
      double v14 = 0.0;
      [v13 setConstant:0.0];

      int v15 = [(ZWRootViewController *)self slugRingTrailingConstraint];
      [v15 setConstant:0.0];

      if (AXDeviceHasJindo()) {
        double v14 = 5.0;
      }
    }
    double v23 = [(ZWRootViewController *)self slugRingTopConstraint];
    [v23 setConstant:v14];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isZoomLensVisible
{
  id v3 = [(ZWRootViewController *)self activeLensViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    double v5 = [(ZWRootViewController *)self activeLensViewController];
    double v6 = [v5 view];

    double v7 = [v6 window];
    if (v7 && ([v6 alpha], v8 > 0.0)) {
      unsigned int v4 = [v6 isHidden] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)isZoomSlugVisible
{
  id v3 = [(ZWRootViewController *)self slugViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    double v5 = [(ZWRootViewController *)self slugViewController];
    double v6 = [v5 view];

    double v7 = [v6 window];
    if (v7 && ([v6 alpha], v8 > 0.0)) {
      unsigned int v4 = [v6 isHidden] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (id)title
{
  return ZWLocString(@"ZW_TITLE");
}

- (double)zoomFactor
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __34__ZWRootViewController_zoomFactor__block_invoke;
  v5[3] = &unk_792B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedValuesSerialQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __34__ZWRootViewController_zoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 208);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __38__ZWRootViewController_setZoomFactor___block_invoke;
  v11[3] = &unk_78E40;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_sync(cachedValuesSerialQueue, v11);
  double v5 = [(ZWRootViewController *)self activeLensViewController];
  [(ZWRootViewController *)self zoomPanOffset];
  objc_msgSend(v5, "validPanOffsetForProposedOffset:proposedZoomFactor:");
  double v7 = v6;
  double v9 = v8;

  double v10 = [(ZWRootViewController *)self activeLensViewController];
  [(ZWRootViewController *)self zoomPanOffset];
  objc_msgSend(v10, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0);

  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v7, v9);
  [(ZWRootViewController *)self _updateZoomListeners];
}

double __38__ZWRootViewController_setZoomFactor___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 208) = result;
  return result;
}

- (double)zoomFactorRespectingUserPreferredMaximumZoom:(double)a3
{
  unsigned int v4 = +[AXSettings sharedInstance];
  [v4 zoomPreferredMaximumZoomScale];
  double v6 = v5;

  return fmin(a3, v6);
}

- (double)setZoomFactorRespectingUserPreferredMaximumZoom:(double)a3
{
  if (AXZoomMinimumZoomLevel > a3) {
    a3 = AXZoomMinimumZoomLevel;
  }
  [(ZWRootViewController *)self zoomFactorRespectingUserPreferredMaximumZoom:a3];
  double v5 = v4;
  -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:");
  return v5;
}

- (CGPoint)zoomPanOffset
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  double v11 = "";
  cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __37__ZWRootViewController_zoomPanOffset__block_invoke;
  v7[3] = &unk_792B8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(cachedValuesSerialQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.double y = v6;
  result.x = v5;
  return result;
}

__n128 __37__ZWRootViewController_zoomPanOffset__block_invoke(uint64_t a1)
{
  v1 = (__n128 *)(*(void *)(a1 + 32) + 360);
  __n128 result = *v1;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__ZWRootViewController_setZoomPanOffset___block_invoke;
  block[3] = &unk_78CD0;
  void block[4] = self;
  CGPoint v6 = a3;
  dispatch_sync(cachedValuesSerialQueue, block);
  [(ZWRootViewController *)self _updateZoomListeners];
}

__n128 __41__ZWRootViewController_setZoomPanOffset___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(a1 + 32) + 360) = result;
  return result;
}

- (BOOL)_isZoomedToMinimum
{
  [(ZWRootViewController *)self zoomFactor];
  return vabdd_f64(v2, AXZoomMinimumZoomLevel) <= 0.0001;
}

- (BOOL)_smartZoomFocusedElementIsBeingSampled
{
  double v3 = [(ZWRootViewController *)self smartZoom];
  [v3 focusRect];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  uint64_t v12 = [(ZWRootViewController *)self activeLensViewController];
  uint64_t v13 = [v12 lensZoomView];
  [v13 sampleRect];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  uint64_t v22 = v5;
  uint64_t v23 = v7;
  uint64_t v24 = v9;
  uint64_t v25 = v11;
  uint64_t v26 = v15;
  uint64_t v27 = v17;
  uint64_t v28 = v19;
  uint64_t v29 = v21;

  return CGRectIntersectsRect(*(CGRect *)&v22, *(CGRect *)&v26);
}

- (void)showZoomSlugAndLens:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ZWRootViewController *)self view];
  [v7 setHidden:0];

  uint64_t v8 = [(ZWRootViewController *)self zoomAlertManager];
  [v8 showZoomEnabledAlertIfAppropriate];

  uint64_t v9 = +[AXSettings sharedInstance];
  uint64_t v10 = [v9 zoomPreferredCurrentLensMode];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke;
  v12[3] = &unk_78F28;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(ZWRootViewController *)self _transitionToLensForMode:v10 animated:1 completion:v12];
}

void __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  double v3 = [*(id *)(a1 + 32) pipLensViewController];
  if (v2 != v3)
  {

LABEL_4:
    id v6 = [*(id *)(a1 + 32) activeLensViewController];
    uint64_t v7 = +[AXSettings sharedInstance];
    uint64_t v8 = [v7 zoomCurrentLensEffect];
    [v6 updateLensEffect:v8 animated:1 completion:0];

    goto LABEL_5;
  }
  uint64_t v4 = [*(id *)(a1 + 32) activeLensViewController];
  unsigned __int8 v5 = [v4 inStandbyMode];

  if ((v5 & 1) == 0) {
    goto LABEL_4;
  }
LABEL_5:
  [*(id *)(a1 + 32) _updateLensLayout];
  [*(id *)(a1 + 32) _updateSlugLayoutAnimated:0];
  id v9 = *(id *)(a1 + 40);
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  double v3 = [*(id *)(a1 + 32) pipLensViewController];

  if (v2 == v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    unsigned __int8 v5 = [v4 activeLensViewController];
    [v4 _updateLensEdgeMaskForZoomController:v5];
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_3;
  v22[3] = &unk_78F28;
  char v24 = *(unsigned char *)(a1 + 48);
  id v6 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v6;
  uint64_t v7 = objc_retainBlock(v22);
  int v8 = _AXSZoomTouchToggledByPreferenceSwitch();
  _AXSZoomTouchSetToggledByPreferenceSwitch();
  id v9 = [*(id *)(a1 + 32) view];
  uint64_t v10 = [v9 window];

  if (v8)
  {
    id v11 = [*(id *)(a1 + 32) activeLensViewController];
    uint64_t v12 = [*(id *)(a1 + 32) pipLensViewController];
    if (v11 == v12)
    {
      CGFloat x = CGRectNull.origin.x;
      CGFloat y = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      CGFloat height = CGRectNull.size.height;
    }
    else
    {
      id v13 = +[AXBackBoardServer server];
      objc_msgSend(v13, "zoomInitialFocusRectWithQueryingContext:", objc_msgSend(v10, "_contextId"));
      CGFloat x = v14;
      CGFloat y = v16;
      CGFloat width = v18;
      CGFloat height = v20;
    }
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  if (CGRectIsEmpty(v25))
  {
    ((void (*)(void *))v7[2])(v7);
  }
  else
  {
    AXUIConvertRectFromContextToScreenSpace();
    objc_msgSend(v10, "convertRect:fromWindow:", 0);
    objc_msgSend(v10, "_convertRectToSceneReferenceSpace:");
    objc_msgSend(*(id *)(a1 + 32), "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 1, 1, 1, v7);
  }
}

uint64_t __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    double v2 = [*(id *)(a1 + 32) eventManager];
    [v2 beginHandlingHIDEventsForReason:@"Zoom wants them"];
  }
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)hideZoomSlugAndLens:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  [(ZWRootViewController *)self _removeAllSystemGestureDisablingAssertions];
  uint64_t v7 = [(ZWRootViewController *)self zoomAlertManager];
  [v7 showZoomDisabledAlertIfAppropriate];

  int v8 = +[ZWCoalescedSettings sharedInstance];
  unsigned __int8 v9 = [v8 zoomInStandby];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __55__ZWRootViewController_hideZoomSlugAndLens_completion___block_invoke;
  v11[3] = &unk_792E0;
  unsigned __int8 v13 = v9;
  BOOL v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(ZWRootViewController *)self _transitionToLens:0 animated:1 completion:v11];
}

uint64_t __55__ZWRootViewController_hideZoomSlugAndLens_completion___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setHidden:1];

  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = +[ZWCoalescedSettings sharedInstance];
  [v4 setZoomInStandby:v3];

  if (*(unsigned char *)(a1 + 49))
  {
    unsigned __int8 v5 = [*(id *)(a1 + 32) eventManager];
    [v5 endHandlingHIDEventsForReason:@"Zoom wants them"];
  }
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)handleKeyboardWillAppearWithFrame:(CGRect)a3 inAppWithBundleID:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v11 = [v10 ignoreLogging];

  if ((v11 & 1) == 0)
  {
    id v12 = +[AXSubsystemZoom identifier];
    unsigned __int8 v13 = AXLoggerForFacility();

    os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = AXColorizeFormatLog();
      v25.origin.double x = x;
      v25.origin.double y = y;
      v25.size.double width = width;
      v25.size.double height = height;
      uint64_t v21 = NSStringFromCGRect(v25);
      id v22 = v9;
      double v16 = _AXStringForArgs();

      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138543362;
        char v24 = v16;
        _os_log_impl(&dword_0, v13, v14, "%{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v17 = [(ZWRootViewController *)self deactivatedAppIDs];
  unsigned __int8 v18 = [v17 containsObject:v9];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = +[NSDate distantPast];
    [v19 timeIntervalSinceReferenceDate];
    self->_lastKeyboardDismissal = v20;

    -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", x, y, width, height);
  }
}

- (void)handleKeyboardWillHideInAppWithBundleID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[AXSubsystemZoom identifier];
    int v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = AXColorizeFormatLog();
      id v15 = v4;
      unsigned __int8 v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v12 = [(ZWRootViewController *)self deactivatedAppIDs];
  unsigned __int8 v13 = [v12 containsObject:v4];

  if ((v13 & 1) == 0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastKeyboardDismissal = v14;
    -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)zoomListenerRegisteredForAllAttributeUpdatesCoalesced:(BOOL)a3 clientIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    os_log_type_t v9 = +[AXSubsystemZoom identifier];
    id v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = AXColorizeFormatLog();
      id v14 = v6;
      BOOL v15 = v4;
      unsigned __int8 v13 = _AXStringForArgs();
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v13;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  -[ZWRootViewController setZoomIsAnimating:](self, "setZoomIsAnimating:", 0, v14, v15);
  [(ZWRootViewController *)self _updateZoomListeners];
}

- (void)zoomListenerRegisteredForAttributeUpdatesImmediately:(id)a3 registered:(BOOL)a4 clientIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  unsigned __int8 v8 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    id v10 = +[AXSubsystemZoom identifier];
    os_log_type_t v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      unsigned __int8 v13 = AXColorizeFormatLog();
      id v15 = v7;
      BOOL v16 = v5;
      id v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v18 = v14;
        _os_log_impl(&dword_0, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  -[ZWRootViewController setZoomIsAnimating:](self, "setZoomIsAnimating:", 0, v15, v16);
  [(ZWRootViewController *)self _updateZoomListeners];
}

- (void)handleFocusChangedWithType:(int64_t)a3 rect:(CGRect)a4 keyboardFrame:(CGRect)a5 contextId:(unsigned int)a6 appID:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a4.size.height;
  double v13 = a4.size.width;
  double v14 = a4.origin.y;
  double v15 = a4.origin.x;
  id v18 = a7;
  if (v18)
  {
    uint64_t v19 = [(ZWRootViewController *)self deactivatedAppIDs];
    unsigned __int8 v20 = [v19 containsObject:v18];

    if ((v20 & 1) == 0)
    {
      if (v7)
      {
        uint64_t v21 = +[AXBackBoardServer server];
        id v22 = [(ZWRootViewController *)self view];
        id v23 = [v22 window];
        objc_msgSend(v21, "convertFrame:fromContextId:toContextId:", v7, objc_msgSend(v23, "_contextId"), v15, v14, v13, v12);

        char v24 = [(ZWRootViewController *)self view];
        CGRect v25 = [v24 window];
        AXUIConvertRectFromContextToScreenSpace();
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;

        int v34 = [(ZWRootViewController *)self view];
        v35 = [v34 window];
        objc_msgSend(v35, "convertRect:fromWindow:", 0, v27, v29, v31, v33);
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;

        v44 = [(ZWRootViewController *)self view];
        id v45 = [v44 window];
        objc_msgSend(v45, "_convertRectToSceneReferenceSpace:", v37, v39, v41, v43);
        double v15 = v46;
        double v14 = v47;
        double v13 = v48;
        double v12 = v49;
      }
      v50 = +[AXSubsystemZoom sharedInstance];
      unsigned __int8 v51 = [v50 ignoreLogging];

      if ((v51 & 1) == 0)
      {
        v52 = +[AXSubsystemZoom identifier];
        v53 = AXLoggerForFacility();

        os_log_type_t v54 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = AXColorizeFormatLog();
          v77.origin.double x = v15;
          v77.origin.double y = v14;
          v77.size.double width = v13;
          v77.size.double height = v12;
          v56 = NSStringFromCGRect(v77);
          v78.origin.double x = x;
          v78.origin.double y = y;
          v78.size.double width = width;
          v78.size.double height = height;
          NSStringFromCGRect(v78);
          v74 = v73 = v56;
          int64_t v72 = a3;
          v57 = _AXStringForArgs();

          if (os_log_type_enabled(v53, v54))
          {
            *(_DWORD *)buf = 138543362;
            v76 = v57;
            _os_log_impl(&dword_0, v53, v54, "%{public}@", buf, 0xCu);
          }
        }
      }
      v79.origin.double x = x;
      v79.origin.double y = y;
      v79.size.double width = width;
      v79.size.double height = height;
      if (!CGRectIsEmpty(v79)) {
        -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", x, y, width, height);
      }
      if ((unint64_t)(a3 - 1) > 1 || _AXSVoiceOverTouchEnabled())
      {
        if (a3 == 5)
        {
          if (!_AXSFullKeyboardAccessEnabled()) {
            goto LABEL_39;
          }
        }
        else if (a3 == 3 && !_AXSAssistiveTouchScannerEnabled())
        {
          goto LABEL_39;
        }
        v58 = [(ZWRootViewController *)self eventManager];
        id v59 = [v58 fullscreenEventHandler];
        unsigned __int8 v60 = [v59 anyFingerDown];

        if (!a3 || (v60 & 1) == 0)
        {
          id v61 = [(ZWRootViewController *)self view];
          id v62 = [v61 window];
          unsigned int v63 = [v62 _contextId];

          if (v63 != v7)
          {
            int v64 = [(ZWRootViewController *)self activeLensViewController];
            unsigned int v65 = [v64 inStandbyMode];

            +[NSDate timeIntervalSinceReferenceDate];
            double v67 = v66;
            if (a3)
            {
              if (vabdd_f64(v66, self->_lastTypingFocusChangeTime) >= 0.2) {
                int v68 = v65 ^ 1;
              }
              else {
                int v68 = 0;
              }
              if (a3 == 2 && [(ZWKeyboardContext *)self->_kbContext isKeyboardVisible])
              {
                if ((v68 & ~[(ZWKeyboardContext *)self->_kbContext zoomRepositionsForKeyboard] & 1) == 0)goto LABEL_39; {
              }
                }
              else if (!v68)
              {
                goto LABEL_39;
              }
              goto LABEL_38;
            }
            self->_lastTypingFocusChangeTime = v66;
            v69 = [(ZWRootViewController *)self activeLensViewController];
            id v70 = [(ZWRootViewController *)self fullscreenLensViewController];
            if (v69 == v70
              && ![(ZWKeyboardContext *)self->_kbContext zoomRepositionsForKeyboard])
            {
              unsigned __int8 v71 = [(ZWKeyboardContext *)self->_kbContext zoomFollowsFocus];

              LOBYTE(v65) = v71 ^ 1 | v65;
            }
            else
            {
            }
            if (vabdd_f64(v67, self->_lastKeyboardDismissal) >= 0.25 && (v65 & 1) == 0) {
LABEL_38:
            }
              -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:](self, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 1, a3 != 0, a3 == 0, 0, v15, v14, v13, v12);
          }
        }
      }
    }
  }
LABEL_39:
}

- (void)handleLockButtonWasPressed
{
  uint64_t v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      unsigned __int8 v8 = AXColorizeFormatLog();
      unsigned __int8 v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v14 = 138543362;
        double v15 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  id v10 = [(ZWRootViewController *)self activeLensViewController];
  os_log_type_t v11 = [(ZWRootViewController *)self pipLensViewController];

  if (v10 == v11)
  {
    [(ZWRootViewController *)self _setPIPLensResizingEnabled:0];
  }
  else
  {
    double v12 = [(ZWRootViewController *)self activeLensViewController];
    double v13 = [(ZWRootViewController *)self dockedLensViewController];

    if (v12 == v13) {
      [(ZWRootViewController *)self _setDockResizingEnabled:0];
    }
  }
  [(ZWRootViewController *)self _dismissMenuAnimated:0];
}

- (void)handleDeviceWasUnlocked
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastDeviceUnlockTime = v3;
}

- (void)handleDeviceWillWake
{
  id v2 = [(ZWRootViewController *)self slugViewController];
  [v2 wakeSlug];
}

- (void)handleHomeButtonWasPressed
{
}

- (void)handleSettingsAppDidUpdatePreferredLensMode:(id)a3
{
}

- (void)handleSettingsAppDidUpdatePreferredDockPosition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ZWRootViewController *)self dockedLensViewController];
  [v5 setDockPositionIsTransitioning:1];

  id v6 = [(ZWRootViewController *)self dockedLensViewController];
  os_log_type_t v7 = [v6 stringForCurrentDockPosition];
  unsigned __int8 v8 = [v7 isEqualToString:v4];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = [(ZWRootViewController *)self activeLensViewController];
    unsigned __int8 v10 = [v9 inStandbyMode];

    if (v10)
    {
      os_log_type_t v11 = [(ZWRootViewController *)self dockedLensViewController];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_5;
      v23[3] = &unk_78CA8;
      v23[4] = self;
      [v11 transitionToDockPosition:v4 completion:v23];
    }
    else
    {
      double v12 = [(ZWRootViewController *)self activeLensViewController];
      double v13 = [(ZWRootViewController *)self activeLensViewController];
      [v13 zoomFactor];
      double v15 = v14;
      BOOL v16 = [(ZWRootViewController *)self activeLensViewController];
      [v16 zoomPanOffset];
      double v18 = v17;
      double v20 = v19;
      uint64_t v21 = +[AXSettings sharedInstance];
      id v22 = [v21 zoomCurrentLensEffect];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke;
      v24[3] = &unk_79118;
      v24[4] = self;
      id v25 = v4;
      objc_msgSend(v12, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, v22, 1, v24, v15, v18, v20);

      os_log_type_t v11 = v25;
    }
  }
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_2;
  v4[3] = &unk_78CA8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 transitionToDockPosition:v3 completion:v4];
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeLensViewController];
  uint64_t v3 = [*(id *)(a1 + 32) activeLensViewController];
  [v3 zoomFactor];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 32) activeLensViewController];
  [v6 zoomPanOffset];
  double v8 = v7;
  double v10 = v9;
  os_log_type_t v11 = +[AXSettings sharedInstance];
  double v12 = [v11 zoomCurrentLensEffect];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_3;
  v13[3] = &unk_78CA8;
  v13[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v12, 1, v13, v5, v8, v10);
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  [v2 setDockPositionIsTransitioning:0];

  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v3 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_4;
  block[3] = &unk_78CA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  [v2 setDockPositionIsTransitioning:0];

  uint64_t v3 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_6;
  block[3] = &unk_78CA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

- (void)handleSettingsAppDidUpdateIdleSlugOpacity:(double)a3
{
  id v4 = [(ZWRootViewController *)self slugViewController];
  [v4 updateIdleSlugOpacityAndPreviewImmediately:a3];
}

- (void)handleFluidSwitcherGestureWillBegin
{
  uint64_t v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = AXColorizeFormatLog();
      double v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  double v10 = [(ZWRootViewController *)self activeLensViewController];
  [v10 handleFluidSwitcherGestureWillBegin];

  os_log_type_t v11 = [(ZWRootViewController *)self activeLensViewController];
  if ([v11 inStandbyMode])
  {
  }
  else
  {
    double v12 = [(ZWRootViewController *)self activeLensViewController];
    double v13 = [(ZWRootViewController *)self fullscreenLensViewController];

    if (v12 == v13)
    {
      double v14 = [(ZWRootViewController *)self activeLensViewController];
      [v14 zoomFactor];
      uint64_t v16 = v15;

      double v17 = [(ZWRootViewController *)self activeLensViewController];
      [v17 zoomPanOffset];
      uint64_t v19 = v18;
      uint64_t v21 = v20;

      id v22 = [(ZWRootViewController *)self activeLensViewController];
      id v23 = [v22 lensZoomView];
      objc_msgSend(v23, "zw_convertBoundsToScreenCoordinates");
      uint64_t v25 = v24;
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      uint64_t v31 = v30;

      [(ZWRootViewController *)self _unzoomDueToAppTransitionIfNeeded];
      self->_inStandbyForFluidSwitcherGesture = 1;
      cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = __59__ZWRootViewController_handleFluidSwitcherGestureWillBegin__block_invoke;
      v33[3] = &unk_79308;
      v33[4] = self;
      v33[5] = v16;
      v33[6] = v19;
      v33[7] = v21;
      v33[8] = v25;
      v33[9] = v27;
      v33[10] = v29;
      v33[11] = v31;
      dispatch_sync(cachedValuesSerialQueue, v33);
    }
  }
}

__n128 __59__ZWRootViewController_handleFluidSwitcherGestureWillBegin__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 512) = *(void *)(a1 + 40);
  *(_OWORD *)(*(void *)(a1 + 32) + 664) = *(_OWORD *)(a1 + 48);
  uint64_t v1 = *(void *)(a1 + 32) + 384;
  __n128 result = *(__n128 *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 80);
  *(__n128 *)(v1 + 32) = result;
  *(_OWORD *)(v1 + 48) = v3;
  return result;
}

- (void)handleAppActivationAnimationWillBegin
{
  long long v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = AXColorizeFormatLog();
      double v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        os_log_type_t v11 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(ZWRootViewController *)self _unzoomDueToAppTransitionIfNeeded];
}

- (void)handleAppDeactivationAnimationWillBegin
{
  long long v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = AXColorizeFormatLog();
      double v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        os_log_type_t v11 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(ZWRootViewController *)self _unzoomDueToAppTransitionIfNeeded];
}

- (void)handleFluidSwitcherGestureDidFinish
{
  long long v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = AXColorizeFormatLog();
      double v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        os_log_type_t v11 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(ZWRootViewController *)self _rezoomDueToAppTransitionIfNeeded];
  self->_inStandbyForFluidSwitcherGesture = 0;
}

- (void)handleFluidSwitcherGestureDidFinishWithDock
{
  long long v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = AXColorizeFormatLog();
      double v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        os_log_type_t v11 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(ZWRootViewController *)self _rezoomDueToDockIfNeeded];
  self->_inStandbyForFluidSwitcherGesture = 0;
}

- (void)handleAppActivationAnimationDidFinish
{
  long long v3 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = +[AXSubsystemZoom identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = AXColorizeFormatLog();
      double v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        os_log_type_t v11 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(ZWRootViewController *)self _rezoomDueToAppTransitionIfNeeded];
}

- (void)handleDeviceReturnedToClockAtIdle
{
  [(ZWRootViewController *)self setZoomWasUnzoomedDueToAppTransition:0];
  id v3 = [(ZWRootViewController *)self activeLensViewController];
  objc_msgSend(v3, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, AXZoomLensEffectNone, 1, 0, AXZoomMinimumZoomLevel, CGPointZero.x, CGPointZero.y);
}

- (void)handleCarouselLockBegan
{
  [(ZWRootViewController *)self setCarouselLockActive:1];
  id v3 = [(ZWRootViewController *)self activeLensViewController];
  objc_msgSend(v3, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, AXZoomLensEffectNone, 1, 0, AXZoomMinimumZoomLevel, CGPointZero.x, CGPointZero.y);
}

- (void)handleCarouselLockEnded
{
}

- (void)handleSubstantialAppTransition
{
  id v2 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = +[AXSubsystemZoom identifier];
    double v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = AXColorizeFormatLog();
      double v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v9 = 138543362;
        int v10 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)handleAppDidBecomeActiveWithID:(id)a3 initialKeyboardFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if ([(ZWRootViewController *)self isViewLoaded])
  {
    int v10 = [(ZWRootViewController *)self deactivatedAppIDs];
    [v10 removeObject:v9];

    os_log_type_t v11 = +[AXSubsystemZoom sharedInstance];
    unsigned __int8 v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      double v13 = +[AXSubsystemZoom identifier];
      double v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = AXColorizeFormatLog();
        v22.origin.double x = x;
        v22.origin.double y = y;
        v22.size.double width = width;
        v22.size.double height = height;
        NSStringFromCGRect(v22);
        uint64_t v19 = v18 = v9;
        double v17 = _AXStringForArgs();

        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v21 = v17;
          _os_log_impl(&dword_0, v14, v15, "%{public}@", buf, 0xCu);
        }
      }
    }
    [(ZWRootViewController *)self _rezoomDueToAppTransitionIfNeeded];
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    if (!CGRectIsEmpty(v23)) {
      -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", x, y, width, height);
    }
  }
}

- (void)handleAppDidEnterBackgroundWithID:(id)a3
{
  id v4 = a3;
  double v5 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    os_log_type_t v7 = +[AXSubsystemZoom identifier];
    double v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = AXColorizeFormatLog();
      id v15 = v4;
      os_log_type_t v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        double v17 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if ([(ZWRootViewController *)self isViewLoaded])
  {
    [(ZWRootViewController *)self _rezoomDueToAppTransitionIfNeeded];
    unsigned __int8 v12 = [(ZWRootViewController *)self deactivatedAppIDs];
    unsigned __int8 v13 = [v12 containsObject:v4];

    if ((v13 & 1) == 0) {
      -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    }
    double v14 = [(ZWRootViewController *)self deactivatedAppIDs];
    [v14 addObject:v4];
  }
}

- (void)handleAppSwitcherRevealAnimationWillBegin
{
  _AXLogWithFacility();
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;

  -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", CGRectNull.origin.x, y, width, height);
}

- (id)activeZoomMode
{
  unsigned __int8 v3 = [(ZWRootViewController *)self activeLensViewController];
  id v4 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v3 == v4)
  {
    int v10 = (id *)&AXZoomLensModeFullscreen;
  }
  else
  {
    double v5 = [(ZWRootViewController *)self activeLensViewController];
    unsigned __int8 v6 = [(ZWRootViewController *)self pipLensViewController];

    if (v5 == v6)
    {
      int v10 = (id *)&AXZoomLensModeWindow;
    }
    else
    {
      os_log_type_t v7 = [(ZWRootViewController *)self activeLensViewController];
      double v8 = [(ZWRootViewController *)self dockedLensViewController];

      if (v7 != v8)
      {
        os_log_type_t v9 = &stru_796A0;
        goto LABEL_9;
      }
      int v10 = (id *)&AXZoomLensModeWindowAnchored;
    }
  }
  os_log_type_t v9 = (__CFString *)*v10;
LABEL_9:

  return v9;
}

- (double)handleAppActivationAnimationDelay
{
  return -1.0;
}

- (double)handleAppDeactivationAnimationDelay
{
  return -1.0;
}

- (double)handleAppSwitcherRevealAnimationDelay
{
  return -1.0;
}

- (void)handleDragWillStart
{
  cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__ZWRootViewController_handleDragWillStart__block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_sync(cachedValuesSerialQueue, block);
}

uint64_t __43__ZWRootViewController_handleDragWillStart__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) |= 0x1000u;
  return result;
}

- (void)handleDragWillEnd
{
  cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__ZWRootViewController_handleDragWillEnd__block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_sync(cachedValuesSerialQueue, block);
}

uint64_t __41__ZWRootViewController_handleDragWillEnd__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) &= ~0x1000u;
  return result;
}

- (CGRect)zoomFrame
{
  unsigned __int8 v3 = [(ZWRootViewController *)self activeLensViewController];
  id v4 = [v3 lensZoomView];
  [v4 effectiveZoomViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  unsigned __int8 v13 = [(ZWRootViewController *)self activeLensViewController];
  double v14 = [(ZWRootViewController *)self pipLensViewController];

  if (v13 == v14)
  {
    uint64_t v24 = [(ZWRootViewController *)self view];
    uint64_t v26 = [(ZWRootViewController *)self pipLensViewController];
    uint64_t v27 = [v26 lensChromeView];
    objc_msgSend(v24, "convertRect:fromView:", v27, v6, v8, v10, v12);
    double v6 = v28;
    double v8 = v29;
    double v10 = v30;
    double v12 = v31;

LABEL_10:
  }
  else
  {
    id v15 = [(ZWRootViewController *)self activeLensViewController];
    uint64_t v16 = [(ZWRootViewController *)self dockedLensViewController];

    if (v15 == v16)
    {
      double v17 = [(ZWRootViewController *)self dockedLensViewController];
      [v17 zoomRegionFrame];
      double v6 = v18;
      double v8 = v19;
      double v10 = v20;
      double v12 = v21;

      CGRect v22 = [(ZWRootViewController *)self dockedLensViewController];
      id v23 = [v22 dockPosition];

      switch((unint64_t)v23)
      {
        case 0uLL:
          uint64_t v24 = [(ZWRootViewController *)self dockedLensViewController];
          [v24 screenShift];
          double v8 = v8 - v25;
          goto LABEL_10;
        case 1uLL:
          uint64_t v24 = [(ZWRootViewController *)self dockedLensViewController];
          [v24 screenShift];
          double v6 = v6 - v40;
          goto LABEL_10;
        case 2uLL:
          uint64_t v24 = [(ZWRootViewController *)self dockedLensViewController];
          double v32 = [v24 dockedLensView];
          [v32 bounds];
          double v34 = v33;
          v35 = [(ZWRootViewController *)self dockedLensViewController];
          [v35 screenShift];
          double v6 = v6 + v34 - v36;
          goto LABEL_8;
        case 3uLL:
          uint64_t v24 = [(ZWRootViewController *)self dockedLensViewController];
          double v32 = [v24 dockedLensView];
          [v32 bounds];
          double v38 = v37;
          v35 = [(ZWRootViewController *)self dockedLensViewController];
          [v35 screenShift];
          double v8 = v8 + v38 - v39;
LABEL_8:

          goto LABEL_10;
        default:
          break;
      }
    }
  }
  double v41 = v6;
  double v42 = v8;
  double v43 = v10;
  double v44 = v12;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (double)zoomLevel
{
  [(ZWRootViewController *)self zoomLevelWithFullscreenEventHandler:0];
  return result;
}

- (double)reachabilityScaleFactor
{
  unsigned __int8 v3 = [(ZWRootViewController *)self activeLensViewController];
  id v4 = [(ZWRootViewController *)self fullscreenLensViewController];
  double v5 = 1.0;
  if (v3 == v4)
  {
    double v6 = +[ZWCoalescedSettings sharedInstance];
    if (([v6 zoomInStandby] & 1) == 0)
    {
      [(ZWRootViewController *)self zoomFactor];
      double v5 = 1.0 / v7;
    }
  }
  return v5;
}

- (void)_focusLensOnRect:(CGRect)a3 panLensContent:(BOOL)a4 recentreLens:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a7;
  uint64_t v16 = [(ZWRootViewController *)self containerView];
  objc_msgSend(v16, "zw_convertRectFromScreenCoordinates:", x, y, width, height);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = +[AXSettings sharedInstance];
  unsigned int v26 = [v25 zoomDebugShowExternalFocusRect];

  if (v26)
  {
    uint64_t v27 = [(ZWRootViewController *)self debugFocusView];

    if (!v27)
    {
      id v28 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(ZWRootViewController *)self setDebugFocusView:v28];
      double v29 = [(ZWRootViewController *)self containerView];
      [v29 addSubview:v28];

      double v30 = +[UIColor greenColor];
      [v28 setBackgroundColor:v30];
    }
    double v31 = [(ZWRootViewController *)self debugFocusView];
    objc_msgSend(v31, "setFrame:", v18, v20, v22, v24);

    double v32 = [(ZWRootViewController *)self containerView];
    double v33 = [(ZWRootViewController *)self debugFocusView];
    [v32 bringSubviewToFront:v33];
  }
  [(ZWRootViewController *)self activeLensViewController];
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = __89__ZWRootViewController__focusLensOnRect_panLensContent_recentreLens_animated_completion___block_invoke;
  v95[3] = &unk_79330;
  BOOL v103 = a4;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  id v96 = v34;
  id v97 = self;
  double v99 = v18;
  double v100 = v20;
  double v101 = v22;
  double v102 = v24;
  BOOL v104 = v7;
  id v35 = v15;
  id v98 = v35;
  BOOL v105 = v8;
  double v36 = objc_retainBlock(v95);
  CGFloat v93 = v24;
  CGFloat v94 = v20;
  CGFloat v92 = v22;
  if ([(ZWKeyboardContext *)self->_kbContext isKeyboardVisible]) {
    unsigned int v37 = [(ZWKeyboardContext *)self->_kbContext zoomRepositionsForKeyboard];
  }
  else {
    unsigned int v37 = 0;
  }
  double v38 = [v34 view];
  double v39 = [v34 view];
  [v39 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = [(ZWRootViewController *)self containerView];
  objc_msgSend(v38, "convertRect:toView:", v48, v41, v43, v45, v47);
  double v50 = v49;
  double v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;

  v57 = [(ZWRootViewController *)self activeLensViewController];
  v58 = [(ZWRootViewController *)self pipLensViewController];

  if (v57 == v58)
  {
    UIRectInset();
    double v50 = v59;
    double v52 = v60;
    CGFloat v54 = v61;
    CGFloat v56 = v62;
  }
  double v63 = CGPointZero.x;
  double v64 = CGPointZero.y;
  if (((v37 | !v8) & 1) == 0)
  {
    CGFloat v90 = CGPointZero.y;
    CGFloat v91 = CGPointZero.x;
    v107.origin.double x = v50;
    v107.origin.double y = v52;
    v107.size.double width = v54;
    v107.size.double height = v56;
    double MidX = CGRectGetMidX(v107);
    v108.origin.double x = v50;
    v108.origin.double y = v52;
    v108.size.double width = v54;
    v108.size.double height = v56;
    double MidY = CGRectGetMidY(v108);
    v109.origin.double x = v18;
    v109.origin.double y = v94;
    v109.size.double width = v92;
    v109.size.double height = v93;
    double v68 = CGRectGetMidX(v109);
    v110.origin.double x = v18;
    v110.origin.double y = v94;
    v110.size.double width = v92;
    v110.size.double height = v93;
    double v69 = CGRectGetMidY(v110);
    id v70 = [(ZWRootViewController *)self fullscreenLensViewController];

    if (v34 == v70)
    {
      [(ZWRootViewController *)self zoomPanOffset];
      double v63 = v68 - MidX - v79;
      double v64 = v69 - MidY - v80;
    }
    else
    {
      id v71 = [(ZWRootViewController *)self pipLensViewController];

      if (v34 == v71)
      {
        [(ZWRootViewController *)self zoomFrame];
        double v81 = CGRectGetMidX(v111);
        [(ZWRootViewController *)self zoomFrame];
        double v63 = v68 - v81;
        double v64 = v69 - CGRectGetMidY(v112);
      }
      else
      {
        id v72 = [(ZWRootViewController *)self dockedLensViewController];

        double v64 = v90;
        double v63 = CGPointZero.x;
        if (v34 == v72)
        {
          v73 = [(ZWRootViewController *)self dockedLensViewController];
          v74 = v73;
          double v75 = v18;
          double v76 = v94;
          double v77 = v92;
          double v78 = v93;
LABEL_29:
          objc_msgSend(v73, "deltaForDockedZoomMovementToRect:", v75, v76, v77, v78, *(void *)&v90, *(void *)&v91);
          double v63 = v88;
          double v64 = v89;
        }
      }
    }
LABEL_30:
    -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:", v34, v7, 1, 1, 1, v63, v64, *(void *)&v90, *(void *)&v91);
    goto LABEL_31;
  }
  double v65 = v94;
  if ((v37 & 1) == 0)
  {
    v106.origin.double x = v50;
    v106.origin.double y = v52;
    v106.size.double width = v54;
    v106.size.double height = v56;
    v121.origin.double x = v18;
    v121.origin.double y = v94;
    v121.size.double width = v92;
    v121.size.double height = v93;
    if (!CGRectContainsRect(v106, v121))
    {
      if (v18 >= v50)
      {
        v113.origin.double x = v18;
        v113.origin.double y = v94;
        v113.size.double width = v92;
        v113.size.double height = v93;
        double MaxX = CGRectGetMaxX(v113);
        v114.origin.double x = v50;
        v114.origin.double y = v52;
        v114.size.double width = v54;
        v114.size.double height = v56;
        BOOL v83 = MaxX <= CGRectGetMaxX(v114);
        double v65 = v94;
        if (!v83)
        {
          v115.origin.double x = v18;
          v115.origin.double y = v94;
          v115.size.double width = v92;
          v115.size.double height = v93;
          double v84 = CGRectGetMaxX(v115);
          v116.origin.double x = v50;
          v116.origin.double y = v52;
          v116.size.double width = v54;
          v116.size.double height = v56;
          double v63 = v84 - CGRectGetMaxX(v116);
          double v65 = v94;
        }
      }
      else
      {
        double v63 = v18 - v50;
      }
      if (v65 >= v52)
      {
        v117.origin.double x = v18;
        v117.origin.double y = v65;
        v117.size.double width = v92;
        v117.size.double height = v93;
        double MaxY = CGRectGetMaxY(v117);
        v118.origin.double x = v50;
        v118.origin.double y = v52;
        v118.size.double width = v54;
        v118.size.double height = v56;
        BOOL v83 = MaxY <= CGRectGetMaxY(v118);
        double v65 = v94;
        if (!v83)
        {
          v119.origin.double x = v18;
          v119.origin.double y = v94;
          v119.size.double width = v92;
          v119.size.double height = v93;
          double v86 = CGRectGetMaxY(v119);
          v120.origin.double x = v50;
          v120.origin.double y = v52;
          v120.size.double width = v54;
          v120.size.double height = v56;
          double v64 = v86 - CGRectGetMaxY(v120);
          double v65 = v94;
        }
      }
      else
      {
        double v64 = v65 - v52;
      }
      id v87 = [(ZWRootViewController *)self dockedLensViewController];

      if (v34 != v87) {
        goto LABEL_30;
      }
      v73 = [(ZWRootViewController *)self dockedLensViewController];
      v74 = v73;
      double v75 = v18;
      double v76 = v65;
      double v77 = v92;
      double v78 = v93;
      goto LABEL_29;
    }
  }
LABEL_31:
  ((void (*)(void *))v36[2])(v36);
}

id __89__ZWRootViewController__focusLensOnRect_panLensContent_recentreLens_animated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    id v2 = *(void **)(a1 + 32);
    unsigned __int8 v3 = [*(id *)(a1 + 40) dockedLensViewController];

    if (v2 == v3)
    {
      double v18 = [*(id *)(a1 + 40) dockedLensViewController];
      objc_msgSend(v18, "deltaForDockedZoomMovementToRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      double v20 = v19;
      double v22 = v21;

      objc_msgSend(*(id *)(a1 + 40), "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 89), 1, 1, 1, v20, v22);
    }
    else if (!*(unsigned char *)(a1 + 90))
    {
      [*(id *)(a1 + 40) zoomFactor];
      double v5 = v4;
      objc_msgSend(*(id *)(a1 + 32), "offsetIgnoringValidOffsetConstraintsByPanningToRect:zoomFacotr:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), v4);
      double v7 = v6;
      double v9 = v8;
      objc_msgSend(*(id *)(a1 + 32), "offsetByPanningToRect:zoomFactor:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), v5);
      double v11 = v10;
      double v13 = v12;
      objc_msgSend(*(id *)(a1 + 32), "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 1, v7, v9, v10, v12);
      objc_msgSend(*(id *)(a1 + 40), "setZoomPanOffset:", v11, v13);
      double v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(unsigned __int8 *)(a1 + 89);
      uint64_t v16 = *(void *)(a1 + 48);
      return objc_msgSend(v14, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v15, v16, v5, v11, v13, -1.0);
    }
  }
  id result = *(id *)(a1 + 48);
  if (result)
  {
    double v23 = (uint64_t (*)(void))*((void *)result + 2);
    return (id)v23();
  }
  return result;
}

- (void)zoomInToPoint:(CGPoint)a3 withZoomFactor:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  double v10 = [(ZWRootViewController *)self activeLensViewController];
  double v11 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v10 == v11)
  {
    unsigned int v26 = [(ZWRootViewController *)self view];
    [v26 frame];
    AX_CGRectGetCenter();
    double v28 = v27;
    double v30 = v29;

    -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", x - v28, y - v30);
    [(ZWRootViewController *)self setZoomFactorRespectingUserPreferredMaximumZoom:a4];
    double v32 = v31;
    double v33 = +[AXSettings sharedInstance];
    double v22 = [v33 zoomCurrentLensEffect];

    id v34 = [(ZWRootViewController *)self activeLensViewController];
    [(ZWRootViewController *)self zoomPanOffset];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke;
    v52[3] = &unk_78CA8;
    v52[4] = self;
    objc_msgSend(v34, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v22, v5, v52, v32, v35, v36);

    [(ZWRootViewController *)self _updateZoomListeners];
    unsigned int v37 = +[ZWCoalescedSettings sharedInstance];
    [v37 setZoomInStandby:0];

    double v38 = [(ZWRootViewController *)self containerView];
    double v39 = [(ZWRootViewController *)self minimapView];
    [v38 bringSubviewToFront:v39];

    double v23 = [(ZWRootViewController *)self kbContext];
    [v23 keyboardFrame];
    -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:");
LABEL_6:

    return;
  }
  double v12 = [(ZWRootViewController *)self activeLensViewController];
  double v13 = [(ZWRootViewController *)self pipLensViewController];

  if (v12 != v13)
  {
    double v14 = [(ZWRootViewController *)self activeLensViewController];
    uint64_t v15 = [(ZWRootViewController *)self dockedLensViewController];

    if (v14 != v15) {
      return;
    }
    -[ZWRootViewController _physicalScreenPointForVirtualScreenPoint:](self, "_physicalScreenPointForVirtualScreenPoint:", x, y);
    double v17 = v16;
    double v19 = v18;
    double v20 = [(ZWRootViewController *)self dockedLensViewController];
    objc_msgSend(v20, "moveDockedZoomToPhysicalScreenPoint:animated:", 0, v17, v19);

    double v21 = +[AXSettings sharedInstance];
    double v22 = [v21 zoomCurrentLensEffect];

    double v23 = [(ZWRootViewController *)self activeLensViewController];
    [(ZWRootViewController *)self zoomPanOffset];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_4;
    v49[3] = &unk_78CA8;
    v49[4] = self;
    objc_msgSend(v23, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v22, 1, v49, a4, v24, v25);
    goto LABEL_6;
  }
  double v40 = [(ZWRootViewController *)self view];
  objc_msgSend(v40, "zw_convertRectToScreenCoordinates:", x, y, 2.0, 2.0);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_2;
  v50[3] = &unk_79358;
  v50[4] = self;
  *(double *)&v50[5] = v42;
  *(double *)&v50[6] = v44;
  *(double *)&v50[7] = v46;
  *(double *)&v50[8] = v48;
  *(double *)&v50[9] = a4;
  BOOL v51 = v5;
  -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:](self, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 0, 1, 0, v50, v42, v44, v46, v48);
}

id __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateMinimapStatus];
}

void __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerView];
  objc_msgSend(v2, "zw_convertRectFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = [*(id *)(a1 + 32) activeLensViewController];
  objc_msgSend(v11, "offsetByPanningToRect:zoomFactor:", v4, v6, v8, v10, *(double *)(a1 + 72));
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:", v13, v15);
  double v16 = +[AXSettings sharedInstance];
  double v17 = [v16 zoomCurrentLensEffect];

  double v18 = [*(id *)(a1 + 32) activeLensViewController];
  double v19 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) zoomPanOffset];
  uint64_t v20 = *(unsigned __int8 *)(a1 + 80);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_3;
  v23[3] = &unk_78CA8;
  v23[4] = *(void *)(a1 + 32);
  objc_msgSend(v18, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v17, v20, v23, v19, v21, v22);
}

id __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateMinimapStatus];
}

id __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateMinimapStatus];
}

- (void)_initializeEventUIContext:(id *)a3
{
  double v5 = [(ZWRootViewController *)self screen];
  [v5 bounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  id v10 = [(ZWRootViewController *)self interfaceOrientation];
  double v11 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__ZWRootViewController__initializeEventUIContext___block_invoke;
  block[3] = &unk_79010;
  block[6] = v7;
  block[7] = v9;
  block[8] = v10;
  void block[4] = self;
  void block[5] = a3;
  dispatch_sync(v11, block);
}

void __50__ZWRootViewController__initializeEventUIContext___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 40) + 16) = *(_OWORD *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)uint64_t v2 = *(void *)(a1 + 64);
  *(void *)(v2 + 8) = 0;
  CGPoint origin = CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGPoint *)(v2 + 32) = CGRectNull.origin;
  *(CGSize *)(v2 + 48) = size;
  uint64_t v5 = *(void *)(a1 + 40);
  *(CGPoint *)(v5 + 64) = origin;
  *(CGSize *)(v5 + 80) = size;
  uint64_t v6 = *(void *)(a1 + 40);
  *(CGPoint *)(v6 + 96) = origin;
  *(CGSize *)(v6 + 112) = size;
  uint64_t v7 = *(void *)(a1 + 40);
  *(CGPoint *)(v7 + 208) = origin;
  *(CGSize *)(v7 + 224) = size;
  uint64_t v8 = *(void *)(a1 + 40);
  *(CGPoint *)(v8 + 240) = origin;
  *(CGSize *)(v8 + 256) = size;
  uint64_t v9 = *(void *)(a1 + 40);
  *(CGPoint *)(v9 + 176) = origin;
  *(CGSize *)(v9 + 192) = size;
  uint64_t v10 = *(void *)(a1 + 40);
  *(CGPoint *)(v10 + 144) = origin;
  *(CGSize *)(v10 + 160) = size;
  *(void *)(*(void *)(a1 + 40) + 136) = 0;
  double v11 = +[ZWCoalescedSettings sharedInstance];
  [v11 zoomFactor];
  *(void *)(*(void *)(a1 + 40) + 128) = v12;

  uint64_t v13 = *(void *)(a1 + 40);
  double v14 = +[ZWCoalescedSettings sharedInstance];
  [v14 zoomPanOffset];
  *(void *)(v13 + 280) = v15;
  *(void *)(v13 + 288) = v16;

  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~1u;
  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~2u;
  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~8u;
  double v17 = +[AXSettings sharedInstance];
  double v18 = [v17 zoomCurrentLensMode];
  if ([v18 isEqualToString:AXZoomLensModeFullscreen]) {
    __int16 v19 = 16;
  }
  else {
    __int16 v19 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 40) + 296) = *(_WORD *)(*(void *)(a1 + 40) + 296) & 0xFFEF | v19;

  uint64_t v20 = +[AXSettings sharedInstance];
  double v21 = [v20 zoomCurrentLensMode];
  if ([v21 isEqualToString:AXZoomLensModeWindowAnchored]) {
    __int16 v22 = 32;
  }
  else {
    __int16 v22 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 40) + 296) = *(_WORD *)(*(void *)(a1 + 40) + 296) & 0xFFDF | v22;

  double v23 = [*(id *)(a1 + 32) dockedLensViewController];
  if ([v23 zoomRegionVisible]) {
    __int16 v24 = 64;
  }
  else {
    __int16 v24 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 40) + 296) = *(_WORD *)(*(void *)(a1 + 40) + 296) & 0xFFBF | v24;

  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~0x80u;
  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~0x100u;
  double v25 = +[AXSettings sharedInstance];
  id v29 = [v25 zoomPreferredCurrentDockPosition];

  if ([v29 isEqualToString:AXZoomDockPositionLeft])
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = 1;
LABEL_16:
    *(void *)(v26 + 272) = v27;
    goto LABEL_17;
  }
  if ([v29 isEqualToString:AXZoomDockPositionRight])
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = 2;
    goto LABEL_16;
  }
  unsigned int v28 = [v29 isEqualToString:AXZoomDockPositionBottom];
  uint64_t v26 = *(void *)(a1 + 40);
  if (v28)
  {
    uint64_t v27 = 3;
    goto LABEL_16;
  }
  *(void *)(v26 + 272) = 0;
LABEL_17:
  *(_WORD *)(v26 + 296) &= ~0x1000u;
  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~0x2000u;
  *(_WORD *)(*(void *)(a1 + 40) + 296) &= ~0x4000u;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 != &ZWZoomItemObserverContextID) {
    goto LABEL_2;
  }
  id v13 = [(ZWRootViewController *)self activeLensViewController];

  if (v13 == v11)
  {
    if (([v10 isEqualToString:@"view.center"] & 1) != 0
      || ([v10 isEqualToString:@"lensZoomView.center"] & 1) != 0
      || ([v10 isEqualToString:@"lensZoomView.bounds"] & 1) != 0
      || ([v10 isEqualToString:@"zoomPanOffset"] & 1) != 0
      || ([v10 isEqualToString:@"zoomFactor"] & 1) != 0
      || ([v10 isEqualToString:@"zoomRegionFrame"] & 1) != 0
      || [v10 isEqualToString:@"zoomRegionVisible"])
    {
      uint64_t v16 = [(ZWRootViewController *)self cachedValuesSerialQueue];
      double v17 = v16;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v25[3] = &unk_78CA8;
      v25[4] = self;
      double v18 = v25;
      goto LABEL_19;
    }
    if ([v10 isEqualToString:@"userIsInteractingWithLens"])
    {
      uint64_t v16 = [(ZWRootViewController *)self cachedValuesSerialQueue];
      double v17 = v16;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v24[3] = &unk_78CA8;
      v24[4] = self;
      double v18 = v24;
      goto LABEL_19;
    }
    if ([v10 isEqualToString:@"inStandbyMode"])
    {
      uint64_t v16 = [(ZWRootViewController *)self cachedValuesSerialQueue];
      double v17 = v16;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v23[3] = &unk_78CA8;
      v23[4] = self;
      double v18 = v23;
      goto LABEL_19;
    }
  }
  else
  {
    id v14 = [(ZWRootViewController *)self slugViewController];

    if (v14 == v11)
    {
      if (([v10 isEqualToString:@"view.center"] & 1) != 0
        || [v10 isEqualToString:@"slugRingView.bounds"])
      {
        uint64_t v16 = [(ZWRootViewController *)self cachedValuesSerialQueue];
        double v17 = v16;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
        block[3] = &unk_78CA8;
        void block[4] = self;
        double v18 = block;
        goto LABEL_19;
      }
      if ([v10 isEqualToString:@"userIsInteractingWithSlug"])
      {
        uint64_t v16 = [(ZWRootViewController *)self cachedValuesSerialQueue];
        double v17 = v16;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_5;
        v21[3] = &unk_78CA8;
        v21[4] = self;
        double v18 = v21;
        goto LABEL_19;
      }
    }
    else
    {
      id v15 = [(ZWRootViewController *)self menuViewController];

      if (v15 == v11 && [v10 isEqualToString:@"userIsInteractingWithMenu"])
      {
        uint64_t v16 = [(ZWRootViewController *)self cachedValuesSerialQueue];
        double v17 = v16;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_6;
        v20[3] = &unk_78CA8;
        v20[4] = self;
        double v18 = v20;
LABEL_19:
        dispatch_sync(v16, v18);

        goto LABEL_20;
      }
    }
  }
LABEL_2:
  v19.receiver = self;
  v19.super_class = (Class)ZWRootViewController;
  [(ZWRootViewController *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_20:
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = v2 + 10;
  double v4 = [v2 activeLensViewController];
  uint64_t v5 = [v4 lensZoomView];
  objc_msgSend(v5, "zw_convertBoundsToScreenCoordinates");
  v3[4] = v6;
  v3[5] = v7;
  v3[6] = v8;
  v3[7] = v9;

  id v10 = [*(id *)(a1 + 32) activeLensViewController];
  id v11 = [*(id *)(a1 + 32) dockedLensViewController];

  if (v10 == v11)
  {
    id v12 = [*(id *)(a1 + 32) dockedLensViewController];
    [v12 screenShift];
    *(void *)(*(void *)(a1 + 32) + 216) = v13;

    id v14 = *(void **)(a1 + 32);
    id v15 = v14 + 10;
    uint64_t v16 = [v14 dockedLensViewController];
    double v17 = [v16 dockedLensView];
    [v17 frame];
    v15[18] = v18;
    v15[19] = v19;
    v15[20] = v20;
    v15[21] = v21;

    __int16 v22 = *(void **)(a1 + 32);
    double v23 = v22 + 10;
    __int16 v24 = [v22 dockedLensViewController];
    [v24 zoomRegionFrame];
    v23[22] = v25;
    v23[23] = v26;
    v23[24] = v27;
    v23[25] = v28;

    id v29 = *(void **)(a1 + 32);
    double v30 = v29 + 10;
    double v31 = [v29 dockedLensViewController];
    double v32 = [v31 toggleZoomRegionButton];
    [v32 frame];
    v30[26] = v33;
    v30[27] = v34;
    v30[28] = v35;
    v30[29] = v36;

    unsigned int v37 = *(void **)(a1 + 32);
    double v38 = v37 + 10;
    double v39 = [v37 dockedLensViewController];
    [v39 frameForResizeDrag];
    v38[30] = v40;
    v38[31] = v41;
    v38[32] = v42;
    v38[33] = v43;

    id v45 = [*(id *)(a1 + 32) dockedLensViewController];
    if ([v45 zoomRegionVisible]) {
      __int16 v44 = 64;
    }
    else {
      __int16 v44 = 0;
    }
    *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFBF | v44;
  }
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeLensViewController];
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFFE | (unsigned __int16)[v2 userIsInteractingWithLens];
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) activeLensViewController];
  if ([v3 inStandbyMode]) {
    __int16 v2 = 128;
  }
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFF7F | v2;
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  __int16 v2 = v1 + 10;
  id v7 = [v1 slugViewController];
  [v7 slugRingViewBoundsInScreenCoordinates];
  v2[8] = v3;
  v2[9] = v4;
  v2[10] = v5;
  v2[11] = v6;
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_5(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) slugViewController];
  if ([v3 userIsInteractingWithSlug]) {
    __int16 v2 = 2;
  }
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFFD | v2;
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_6(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) menuViewController];
  if ([v3 userIsInteractingWithMenu]) {
    __int16 v2 = 8;
  }
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFF7 | v2;
}

- (void)_disableZoomWindowHitTesting
{
  id v4 = [(ZWRootViewController *)self view];
  __int16 v2 = [v4 window];
  id v3 = [v2 layer];
  [v3 setAllowsHitTesting:0];
}

- (void)_enableZoomWindowHitTesting
{
  id v4 = [(ZWRootViewController *)self view];
  __int16 v2 = [v4 window];
  id v3 = [v2 layer];
  [v3 setAllowsHitTesting:1];
}

- (void)_transitionToLensForMode:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  uint64_t v8 = AXZoomLensModeFullscreen;
  id v9 = a5;
  if ([v15 isEqualToString:v8])
  {
    uint64_t v10 = [(ZWRootViewController *)self fullscreenLensViewController];
LABEL_7:
    id v11 = (void *)v10;
    goto LABEL_8;
  }
  if ([v15 isEqualToString:AXZoomLensModeWindow])
  {
    uint64_t v10 = [(ZWRootViewController *)self pipLensViewController];
    goto LABEL_7;
  }
  if ([v15 isEqualToString:AXZoomLensModeWindowAnchored])
  {
    uint64_t v10 = [(ZWRootViewController *)self dockedLensViewController];
    goto LABEL_7;
  }
  id v14 = v15;
  _AXAssert();
  id v11 = 0;
LABEL_8:
  id v12 = objc_msgSend(v11, "identifier", v14);
  uint64_t v13 = +[AXSettings sharedInstance];
  [v13 setZoomPreferredCurrentLensMode:v12];

  [(ZWRootViewController *)self _transitionToLens:v11 animated:v6 completion:v9];
}

- (void)_transitionToLens:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ([(ZWRootViewController *)self isViewLoaded])
  {
    [(ZWRootViewController *)self _setPIPLensResizingEnabled:0];
    [(ZWRootViewController *)self _setDockResizingEnabled:0];
    if (![(ZWRootViewController *)self isActiveLensTransitioning])
    {
      [(ZWRootViewController *)self setActiveLensTransitioning:1];
      id v10 = [(ZWRootViewController *)self activeLensViewController];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke;
      v54[3] = &unk_78FC0;
      v54[4] = self;
      double v55 = v9;
      id v11 = objc_retainBlock(v54);
      id v12 = [(ZWRootViewController *)self pipLensViewController];

      if (v12 != v8) {
        [(ZWRootViewController *)self _removePIPSystemGestureDisablingAssertions];
      }
      id v13 = [(ZWRootViewController *)self fullscreenLensViewController];

      if (v13 != v8) {
        [(ZWRootViewController *)self _removeFullscreenSystemGestureDisablingAssertions];
      }
      id v14 = [(ZWRootViewController *)self view];
      [v14 setUserInteractionEnabled:0];

      if (v10 == v8)
      {
        ((void (*)(void *))v11[2])(v11);
      }
      else
      {
        id v15 = [(ZWRootViewController *)self pipLensViewController];

        if (v10 == v15) {
          [(ZWRootViewController *)self _removePIPSystemGestureDisablingAssertions];
        }
        id v16 = [(ZWRootViewController *)self fullscreenLensViewController];

        if (v10 == v16) {
          [(ZWRootViewController *)self _removeFullscreenSystemGestureDisablingAssertions];
        }
        double v17 = +[AXSettings sharedInstance];
        uint64_t v18 = [v17 zoomCurrentLensEffect];

        double y = CGPointZero.y;
        [(ZWRootViewController *)self zoomFactor];
        -[ZWRootViewController setZoomFactorRespectingUserPreferredMaximumZoom:](self, "setZoomFactorRespectingUserPreferredMaximumZoom:");
        uint64_t v21 = v20;
        __int16 v22 = +[ZWCoalescedSettings sharedInstance];
        unsigned __int8 v23 = [v22 zoomInStandby];

        -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", CGPointZero.x, y);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_3;
        v44[3] = &unk_793A8;
        v44[4] = self;
        id v45 = v8;
        unsigned __int8 v52 = v23;
        uint64_t v49 = v21;
        CGFloat x = CGPointZero.x;
        double v51 = y;
        id v24 = v18;
        id v46 = v24;
        BOOL v53 = v6;
        id v25 = v10;
        id v47 = v25;
        double v48 = v11;
        uint64_t v26 = objc_retainBlock(v44);
        uint64_t v27 = v26;
        if (v25)
        {
          [(ZWRootViewController *)self _endObservingValuesForLens:v25];
          uint64_t v28 = AXZoomLensEffectNone;
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_7;
          v36[3] = &unk_793D0;
          id v37 = v25;
          uint64_t v40 = v21;
          CGFloat v41 = CGPointZero.x;
          double v42 = y;
          id v38 = v24;
          BOOL v43 = v6;
          id v39 = v27;
          [v37 updateLensEffect:v28 animated:v6 completion:v36];
        }
        else
        {
          ((void (*)(void *))v26[2])(v26);
        }
      }
      goto LABEL_26;
    }
  }
  else
  {
    id v29 = +[AXSubsystemZoom sharedInstance];
    unsigned __int8 v30 = [v29 ignoreLogging];

    if ((v30 & 1) == 0)
    {
      double v31 = +[AXSubsystemZoom identifier];
      double v32 = AXLoggerForFacility();

      os_log_type_t v33 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = AXColorizeFormatLog();
        uint64_t v35 = _AXStringForArgs();
        if (os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v35;
          _os_log_impl(&dword_0, v32, v33, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  if (v9) {
    v9[2](v9);
  }
LABEL_26:
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 1152);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_2;
  block[3] = &unk_78CA8;
  void block[4] = v2;
  dispatch_sync(v3, block);
  id v4 = [*(id *)(a1 + 32) containerView];
  uint64_t v5 = [*(id *)(a1 + 32) slugViewController];
  BOOL v6 = [v5 view];
  [v4 bringSubviewToFront:v6];

  id v7 = [*(id *)(a1 + 32) containerView];
  id v8 = [*(id *)(a1 + 32) fakeLaserVC];
  id v9 = [v8 view];
  [v7 bringSubviewToFront:v9];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
  id v11 = [*(id *)(a1 + 32) view];
  [v11 setUserInteractionEnabled:1];

  [*(id *)(a1 + 32) setActiveLensTransitioning:0];
  id v12 = [*(id *)(a1 + 32) activeZoomMode];
  id v13 = +[AXSettings sharedInstance];
  [v13 setZoomCurrentLensMode:v12];

  id v14 = [*(id *)(a1 + 32) lensTransitionUnitTestCallback];

  if (v14)
  {
    id v15 = [*(id *)(a1 + 32) lensTransitionUnitTestCallback];
    v15[2](v15, *(void *)(a1 + 32));
  }
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeLensViewController];
  id v3 = [*(id *)(a1 + 32) fullscreenLensViewController];
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFEF | (16 * (v2 == v3));

  id v4 = [*(id *)(a1 + 32) activeLensViewController];
  uint64_t v5 = [*(id *)(a1 + 32) dockedLensViewController];
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFDF | (32 * (v4 == v5));

  id v7 = [*(id *)(a1 + 32) dockedLensViewController];
  if ([v7 zoomRegionVisible]) {
    __int16 v6 = 64;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFBF | v6;
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setActiveLensViewController:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    if (([v2 inStandbyMode] & 1) == 0) {
      _AXAssert();
    }
    [*(id *)(a1 + 32) _beginObservingValuesForLens:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addChildViewController:*(void *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) containerView];
    id v4 = [*(id *)(a1 + 40) view];
    [v3 addSubview:v4];

    uint64_t v5 = [*(id *)(a1 + 32) containerView];
    __int16 v6 = [*(id *)(a1 + 40) view];
    [v5 sendSubviewToBack:v6];

    [*(id *)(a1 + 32) _applyInitialConstraintsForLensViewController:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) didMoveToParentViewController:*(void *)(a1 + 32)];
    id v7 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_4;
    block[3] = &unk_79118;
    id v8 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v21 = v8;
    dispatch_sync(v7, block);

    uint64_t v9 = *(unsigned __int8 *)(a1 + 96);
    double v10 = *(double *)(a1 + 72);
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 97);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_5;
    v15[3] = &unk_79380;
    v15[4] = *(void *)(a1 + 32);
    char v19 = v9;
    id v16 = v11;
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    objc_msgSend(v16, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", v9, v12, v13, v15, v10, *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
  else
  {
    id v14 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v14();
  }
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)(a1 + 32) + 80);
  id v3 = [*(id *)(a1 + 40) lensZoomView];
  objc_msgSend(v3, "zw_convertBoundsToScreenCoordinates");
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v6;
  v2[7] = v7;

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) dockedLensViewController];

  if (v8 == v9)
  {
    double v10 = [*(id *)(a1 + 32) dockedLensViewController];
    [v10 screenShift];
    *(void *)(*(void *)(a1 + 32) + 216) = v11;

    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = v12 + 10;
    id v14 = [v12 dockedLensViewController];
    id v15 = [v14 dockedLensView];
    [v15 frame];
    v13[18] = v16;
    v13[19] = v17;
    v13[20] = v18;
    v13[21] = v19;

    uint64_t v20 = *(void **)(a1 + 32);
    id v21 = v20 + 10;
    __int16 v22 = [v20 dockedLensViewController];
    [v22 zoomRegionFrame];
    v21[22] = v23;
    v21[23] = v24;
    v21[24] = v25;
    v21[25] = v26;

    uint64_t v27 = [*(id *)(a1 + 32) dockedLensViewController];
    if ([v27 zoomRegionVisible]) {
      __int16 v28 = 64;
    }
    else {
      __int16 v28 = 0;
    }
    *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFBF | v28;

    id v29 = *(void **)(a1 + 32);
    unsigned __int8 v30 = v29 + 10;
    double v31 = [v29 dockedLensViewController];
    double v32 = [v31 toggleZoomRegionButton];
    [v32 frame];
    v30[26] = v33;
    v30[27] = v34;
    v30[28] = v35;
    v30[29] = v36;

    id v37 = *(void **)(a1 + 32);
    id v38 = v37 + 10;
    id v43 = [v37 dockedLensViewController];
    [v43 frameForResizeDrag];
    v38[30] = v39;
    v38[31] = v40;
    v38[32] = v41;
    v38[33] = v42;
  }
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_5(uint64_t a1)
{
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  AXPerformBlockAsynchronouslyOnMainThread();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v2, v3, v4, v5);
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAllSystemGestureDisablingAssertions];
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) pipLensViewController];
    if (v2 == v3)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      uint64_t v5 = [*(id *)(a1 + 32) pipLensViewController];

      if (v4 != v5)
      {
        id v6 = [*(id *)(a1 + 32) disableNotificationCenterAssertionPIPLens];

        if (v6) {
          _AXAssert();
        }
        id v7 = [*(id *)(a1 + 32) disableControlCenterAssertionPIPLens];

        if (v7) {
          _AXAssert();
        }
        [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
      }
    }
    else
    {
    }
    if (!*(unsigned char *)(a1 + 56))
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 32) fullscreenLensViewController];
      if (v8 == v9)
      {
        double v10 = *(void **)(a1 + 48);
        uint64_t v11 = [*(id *)(a1 + 32) fullscreenLensViewController];

        if (v10 != v11)
        {
          uint64_t v12 = [*(id *)(a1 + 32) disableNotificationCenterAssertionFullscreenLens];

          if (v12) {
            _AXAssert();
          }
          uint64_t v13 = [*(id *)(a1 + 32) disableControlCenterAssertionFullscreenLens];

          if (v13) {
            _AXAssert();
          }
          id v14 = *(void **)(a1 + 32);
          [v14 _updateSystemGestureDisablingAssertions];
        }
      }
      else
      {
      }
    }
  }
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_7(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_8;
  v6[3] = &unk_78FC0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  objc_msgSend(v7, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, v4, v5, v6, v2, *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  double v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)_beginObservingValuesForLens:(id)a3
{
  id v6 = a3;
  [v6 addObserver:self forKeyPath:@"lensZoomView.bounds" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"view.center" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"lensZoomView.center" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"userIsInteractingWithLens" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"inStandbyMode" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"zoomPanOffset" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"zoomFactor" options:1 context:&ZWZoomItemObserverContextID];
  id v4 = [(ZWRootViewController *)self dockedLensViewController];

  uint64_t v5 = v6;
  if (v4 == v6)
  {
    [v6 addObserver:self forKeyPath:@"zoomRegionFrame" options:1 context:&ZWZoomItemObserverContextID];
    [v6 addObserver:self forKeyPath:@"zoomRegionVisible" options:1 context:&ZWZoomItemObserverContextID];
    uint64_t v5 = v6;
  }
}

- (void)_endObservingValuesForLens:(id)a3
{
  id v6 = a3;
  [v6 removeObserver:self forKeyPath:@"lensZoomView.bounds" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"view.center" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"lensZoomView.center" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"userIsInteractingWithLens" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"inStandbyMode" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"zoomPanOffset" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"zoomFactor" context:&ZWZoomItemObserverContextID];
  id v4 = [(ZWRootViewController *)self dockedLensViewController];

  uint64_t v5 = v6;
  if (v4 == v6)
  {
    [v6 removeObserver:self forKeyPath:@"zoomRegionFrame" context:&ZWZoomItemObserverContextID];
    [v6 removeObserver:self forKeyPath:@"zoomRegionVisible" context:&ZWZoomItemObserverContextID];
    uint64_t v5 = v6;
  }
}

- (void)_applyInitialConstraintsForLensViewController:(id)a3
{
  id v44 = a3;
  id v4 = [(ZWRootViewController *)self containerView];
  id v5 = [(ZWRootViewController *)self pipLensViewController];

  id v6 = [v44 view];
  if (v5 == v44)
  {
    uint64_t v13 = [v44 lensZoomView];
    id v14 = [v44 lensChromeView];
    int v15 = AXResistAllCompressingAndStretching[0];
    int v16 = AXResistAllCompressingAndStretching[1];
    int v17 = AXResistAllCompressingAndStretching[2];
    int v18 = AXResistAllCompressingAndStretching[3];
    LODWORD(v19) = AXResistAllCompressingAndStretching[0];
    LODWORD(v20) = v16;
    LODWORD(v21) = v17;
    LODWORD(v22) = v18;
    objc_msgSend(v6, "ax_setContentHuggingAndCompressionResistance:", v19, v20, v21, v22);
    LODWORD(v23) = v15;
    LODWORD(v24) = v16;
    LODWORD(v25) = v17;
    LODWORD(v26) = v18;
    objc_msgSend(v13, "ax_setContentHuggingAndCompressionResistance:", v23, v24, v25, v26);
    LODWORD(v27) = v15;
    LODWORD(v28) = v16;
    LODWORD(v29) = v17;
    LODWORD(v30) = v18;
    objc_msgSend(v14, "ax_setContentHuggingAndCompressionResistance:", v27, v28, v29, v30);
    double v31 = +[NSLayoutConstraint constraintWithItem:v14 attribute:3 relatedBy:1 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v31];

    double v32 = +[NSLayoutConstraint constraintWithItem:v14 attribute:4 relatedBy:-1 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v32];

    uint64_t v33 = +[NSLayoutConstraint constraintWithItem:v14 attribute:1 relatedBy:1 toItem:v4 attribute:1 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v33];

    uint64_t v34 = +[NSLayoutConstraint constraintWithItem:v14 attribute:2 relatedBy:-1 toItem:v4 attribute:2 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v34];

    uint64_t v35 = +[NSLayoutConstraint constraintWithItem:v6 attribute:1 relatedBy:0 toItem:v4 attribute:1 multiplier:1.0 constant:0.0];
    LODWORD(v36) = 1148780544;
    [v35 setPriority:v36];
    [(ZWRootViewController *)self setLensDragXConstraint:v35];
    [v4 addConstraint:v35];
    id v37 = +[NSLayoutConstraint constraintWithItem:v6 attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];

    LODWORD(v38) = 1148780544;
    [v37 setPriority:v38];
    [(ZWRootViewController *)self setLensDragYConstraint:v37];
    [v4 addConstraint:v37];
    uint64_t v39 = [(ZWRootViewController *)self lensWidthConstraint];

    if (!v39)
    {
      uint64_t v40 = +[NSLayoutConstraint constraintWithItem:v13 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
      [(ZWRootViewController *)self setLensWidthConstraint:v40];

      uint64_t v41 = [(ZWRootViewController *)self lensWidthConstraint];
      [v6 addConstraint:v41];

      uint64_t v42 = +[NSLayoutConstraint constraintWithItem:v13 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
      [(ZWRootViewController *)self setLensHeightConstraint:v42];

      id v43 = [(ZWRootViewController *)self lensHeightConstraint];
      [v6 addConstraint:v43];
    }
    [(ZWRootViewController *)self _updateLensLayout];
  }
  else
  {
    if (!v6 || !v4) {
      _AXAssert();
    }
    double v7 = ZWGetTestingScreenSize();
    HIDWORD(v9) = HIDWORD(CGSizeZero.width);
    double height = CGSizeZero.height;
    if (v7 == CGSizeZero.width && v8 == height)
    {
      LODWORD(v7) = AXResistAllCompressingAndStretching[0];
      LODWORD(v8) = AXResistAllCompressingAndStretching[1];
      LODWORD(v9) = AXResistAllCompressingAndStretching[2];
      LODWORD(height) = AXResistAllCompressingAndStretching[3];
      objc_msgSend(v6, "ax_setContentHuggingAndCompressionResistance:", v7, v8, v9, height);
      id v12 = objc_msgSend(v6, "ax_pinConstraintsInAllDimensionsToView:", v4);
    }
  }
}

- (void)setActiveLensViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activeLensViewController, a3);
  id v4 = [(ZWRootViewController *)self menuViewController];
  [v4 lensModeDidChange];
}

- (void)_updateKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  IsEmptdouble y = CGRectIsEmpty(a3);
  BOOL v10 = IsEmpty;
  if (IsEmpty)
  {
    double v11 = CGRectNull.origin.x;
    double v12 = CGRectNull.origin.y;
    double v13 = CGRectNull.size.width;
    double v14 = CGRectNull.size.height;
  }
  else
  {
    uint64_t v3 = [(ZWRootViewController *)self view];
    objc_msgSend(v3, "zw_convertRectFromScreenCoordinates:", x, y, width, height);
  }
  -[ZWKeyboardContext setKeyboardFrame:](self->_kbContext, "setKeyboardFrame:", v11, v12, v13, v14);
  if (!v10) {

  }
  [(ZWKeyboardContext *)self->_kbContext setUserMovedKeyboardLens:0];
  int v15 = +[AXSubsystemZoom sharedInstance];
  unsigned __int8 v16 = [v15 ignoreLogging];

  if ((v16 & 1) == 0)
  {
    int v17 = +[AXSubsystemZoom identifier];
    int v18 = AXLoggerForFacility();

    os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v19))
    {
      double v20 = AXColorizeFormatLog();
      [(ZWKeyboardContext *)self->_kbContext keyboardFrame];
      double v29 = NSStringFromCGRect(v36);
      double v21 = _AXStringForArgs();

      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v21;
        _os_log_impl(&dword_0, v18, v19, "%{public}@", buf, 0xCu);
      }
    }
  }
  double v22 = [(ZWRootViewController *)self activeLensViewController];
  if ([(ZWKeyboardContext *)self->_kbContext isKeyboardVisible]
    && ![(ZWKeyboardContext *)self->_kbContext userMovedKeyboardLens])
  {
    if (([v22 inStandbyMode] & 1) == 0
      && ![(ZWRootViewController *)self _isZoomedToMinimum])
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = __45__ZWRootViewController__updateKeyboardFrame___block_invoke;
      v33[3] = &unk_78CA8;
      v33[4] = self;
      double v25 = objc_retainBlock(v33);
      unsigned int v26 = [(ZWKeyboardContext *)self->_kbContext zoomRepositionsForKeyboard];
      double v27 = [(ZWRootViewController *)self pipLensViewController];

      if (v22 == v27)
      {
        if ([(ZWKeyboardContext *)self->_kbContext zoomRepositionsForKeyboard]) {
          ((void (*)(void *))v25[2])(v25);
        }
      }
      else if (v26)
      {
        double v28 = [(ZWRootViewController *)self pipLensViewController];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = __45__ZWRootViewController__updateKeyboardFrame___block_invoke_2;
        v31[3] = &unk_78CF8;
        double v32 = v25;
        [(ZWRootViewController *)self _transitionToLens:v28 animated:0 completion:v31];
      }
    }
  }
  else
  {
    double v23 = +[AXSettings sharedInstance];
    double v24 = [v23 zoomPreferredCurrentLensMode];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __45__ZWRootViewController__updateKeyboardFrame___block_invoke_3;
    v30[3] = &unk_78CA8;
    v30[4] = self;
    [(ZWRootViewController *)self _transitionToLensForMode:v24 animated:1 completion:v30];
  }
  [(ZWRootViewController *)self _updateSlugLayoutAnimated:1];
}

void __45__ZWRootViewController__updateKeyboardFrame___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLensLayout];
  id v2 = [*(id *)(a1 + 32) activeLensViewController];
  [v2 updateLensChromeAnimated:1];
}

uint64_t __45__ZWRootViewController__updateKeyboardFrame___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__ZWRootViewController__updateKeyboardFrame___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLensLayout];
  id v2 = [*(id *)(a1 + 32) activeLensViewController];
  [v2 updateLensChromeAnimated:1];
}

- (void)_updateLensLayout
{
  [(ZWRootViewController *)self _determineSuitableLensFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ZWRootViewController *)self lensDragXConstraint];
  [v11 setConstant:v4];

  double v12 = [(ZWRootViewController *)self lensDragYConstraint];
  [v12 setConstant:v6];

  double v13 = [(ZWRootViewController *)self lensWidthConstraint];
  [v13 setConstant:v8];

  id v14 = [(ZWRootViewController *)self lensHeightConstraint];
  [v14 setConstant:v10];
}

- (CGRect)_determineSuitableLensFrame
{
  double v3 = [(ZWRootViewController *)self activeLensViewController];
  double v4 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v3 == v4)
  {
    uint64_t v33 = [(ZWRootViewController *)self containerView];
    [v33 bounds];
    double v17 = v34;
    double v19 = v35;
    double v21 = v36;
    double v23 = v37;

    double v24 = 0.0;
  }
  else if ([(ZWKeyboardContext *)self->_kbContext isKeyboardVisible] {
         && ![(ZWKeyboardContext *)self->_kbContext userMovedKeyboardLens]
  }
         && [(ZWKeyboardContext *)self->_kbContext zoomRepositionsForKeyboard])
  {
    [(ZWKeyboardContext *)self->_kbContext keyboardFrame];
    double v5 = [(ZWRootViewController *)self containerView];
    [v5 frame];
    AX_CGRectBySubtractingRect();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    id v14 = [v3 view];
    int v15 = [v3 lensZoomView];
    objc_msgSend(v14, "convertRect:toView:", v15, v7, v9, v11, v13);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v24 = -18.0;
  }
  else
  {
    double v25 = +[ZWCoalescedSettings sharedInstance];
    [v25 zoomWindowFrame];
    double v17 = v26;
    double v19 = v27;
    double v21 = v28;
    double v23 = v29;

    double v24 = -18.0;
    if (v21 == CGSizeZero.width && v23 == CGSizeZero.height)
    {
      [(ZWRootViewController *)self _lensDefaultSize];
      double v21 = v31;
      double v23 = v32;
    }
  }
  [(ZWRootViewController *)self _lensMinimumSize];
  double v39 = v38;
  double v41 = v40;
  [(ZWRootViewController *)self _lensMaximumSize];
  if (v21 >= v39) {
    double v44 = v21;
  }
  else {
    double v44 = v39;
  }
  if (v44 >= v42) {
    double v45 = v42;
  }
  else {
    double v45 = v44;
  }
  if (v23 >= v41) {
    double v46 = v23;
  }
  else {
    double v46 = v41;
  }
  if (v46 >= v43) {
    double v47 = v43;
  }
  else {
    double v47 = v46;
  }
  double v48 = [(ZWRootViewController *)self containerView];
  [v48 bounds];
  double v50 = v49 - v45;

  if (v17 >= v50) {
    double v51 = v50;
  }
  else {
    double v51 = v17;
  }
  if (v24 >= v51) {
    double v52 = v24;
  }
  else {
    double v52 = v51;
  }
  BOOL v53 = [(ZWRootViewController *)self containerView];
  [v53 bounds];
  double v55 = v54 - v47;

  if (v19 >= v55) {
    double v56 = v55;
  }
  else {
    double v56 = v19;
  }
  if (v24 >= v56) {
    double v57 = v24;
  }
  else {
    double v57 = v56;
  }

  double v58 = v52;
  double v59 = v57;
  double v60 = v45;
  double v61 = v47;
  result.size.double height = v61;
  result.size.double width = v60;
  result.origin.double y = v59;
  result.origin.double x = v58;
  return result;
}

- (CGSize)_lensDefaultSize
{
  double v3 = +[AXSettings sharedInstance];
  double v4 = [v3 zoomPreferredCurrentLensMode];

  if ([v4 isEqualToString:AXZoomLensModeWindowAnchored])
  {
    [(ZWRootViewController *)self _lensMaximumSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    int IsPad = AXDeviceIsPad();
    if (IsPad) {
      double v8 = 300.0;
    }
    else {
      double v8 = 200.0;
    }
    if (IsPad) {
      double v6 = 400.0;
    }
    else {
      double v6 = 320.0;
    }
  }

  double v10 = v6;
  double v11 = v8;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_lensMinimumSize
{
  double v3 = [(ZWRootViewController *)self activeLensViewController];
  double v4 = [(ZWRootViewController *)self dockedLensViewController];

  double v5 = 90.0;
  double v6 = 90.0;
  if (v3 == v4)
  {
    double v7 = [(ZWRootViewController *)self dockedLensViewController];
    if ([v7 dockPosition])
    {
      double v8 = [(ZWRootViewController *)self dockedLensViewController];
      double v9 = (char *)[v8 dockPosition];

      if (v9 != (unsigned char *)&dword_0 + 3)
      {
        double v10 = [(ZWRootViewController *)self dockedLensViewController];
        double v11 = [v10 view];
        [v11 bounds];
        double v5 = v12 * 0.1;
        double v13 = [(ZWRootViewController *)self dockedLensViewController];
        id v14 = [v13 view];
        [v14 bounds];
        double v6 = v15;
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
    }
    double v10 = [(ZWRootViewController *)self dockedLensViewController];
    double v11 = [v10 view];
    [v11 bounds];
    double v5 = v16;
    double v13 = [(ZWRootViewController *)self dockedLensViewController];
    id v14 = [v13 view];
    [v14 bounds];
    double v6 = v17 * 0.1;
    goto LABEL_7;
  }
LABEL_8:
  double v18 = v5;
  double v19 = v6;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)_lensMaximumSize
{
  double v3 = [(ZWRootViewController *)self activeLensViewController];
  double v4 = [(ZWRootViewController *)self dockedLensViewController];

  if (v3 == v4)
  {
    double v7 = [(ZWRootViewController *)self dockedLensViewController];
    if ([v7 dockPosition])
    {
      double v8 = [(ZWRootViewController *)self dockedLensViewController];
      double v9 = (char *)[v8 dockPosition];

      if (v9 != (unsigned char *)&dword_0 + 3)
      {
        double v10 = [(ZWRootViewController *)self dockedLensViewController];
        double v11 = [v10 view];
        [v11 bounds];
        double v13 = v12 * 0.5;
        id v14 = [(ZWRootViewController *)self dockedLensViewController];
        double v15 = [v14 view];
        [v15 bounds];
        double v17 = v16;
LABEL_10:

        double v5 = v13;
        double v6 = v17;
        goto LABEL_11;
      }
    }
    else
    {
    }
    double v10 = [(ZWRootViewController *)self dockedLensViewController];
    double v11 = [v10 view];
    [v11 bounds];
    double v13 = v18;
    id v14 = [(ZWRootViewController *)self dockedLensViewController];
    double v15 = [v14 view];
    [v15 bounds];
    double v17 = v19 * 0.5;
    goto LABEL_10;
  }

  [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
LABEL_11:
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGPoint)_slugOriginForNormalizedPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(ZWRootViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(ZWRootViewController *)self slugViewController];
  double v12 = [v11 view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  double v17 = x * (v8 - v14);
  double v18 = y * (v10 - v16);
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)_slugNormalizedPositionForCurrentPosition
{
  double v3 = [(ZWRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(ZWRootViewController *)self slugViewController];
  double v9 = [v8 view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11 / (v5 - v15);
  double v19 = v13 / (v7 - v17);
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)_updateSlugLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ZWRootViewController *)self viewIfLoaded];

  if (v5)
  {
    double v6 = [(ZWRootViewController *)self containerView];
    double v7 = [(ZWRootViewController *)self slugViewController];
    double v8 = [v7 view];

    double v9 = +[AXSettings sharedInstance];
    if ([v9 zoomShouldShowSlug]) {
      uint64_t v10 = [(ZWRootViewController *)self isMainDisplay] ^ 1;
    }
    else {
      uint64_t v10 = 1;
    }
    [v8 setHidden:v10];

    double v11 = [(ZWRootViewController *)self slugRingDragXConstraint];

    if (!v11)
    {
      double v12 = +[NSLayoutConstraint constraintWithItem:v8 attribute:1 relatedBy:0 toItem:v6 attribute:1 multiplier:1.0 constant:0.0];
      LODWORD(v13) = 1148780544;
      [v12 setPriority:v13];
      [(ZWRootViewController *)self setSlugRingDragXConstraint:v12];
      [v6 addConstraint:v12];
      double v14 = +[NSLayoutConstraint constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v6 attribute:3 multiplier:1.0 constant:0.0];

      LODWORD(v15) = 1148780544;
      [v14 setPriority:v15];
      [(ZWRootViewController *)self setSlugRingDragYConstraint:v14];
      [v6 addConstraint:v14];
    }
    double v16 = +[ZWCoalescedSettings sharedInstance];
    [v16 zoomSlugNormalizedPosition];
    double v18 = v17;
    double v20 = v19;

    -[ZWRootViewController _slugOriginForNormalizedPosition:](self, "_slugOriginForNormalizedPosition:", v18, v20);
    double v22 = v21;
    double v24 = v23;
    if ([(ZWKeyboardContext *)self->_kbContext isKeyboardVisible])
    {
      [(ZWKeyboardContext *)self->_kbContext keyboardFrame];
      double y = v39.origin.y;
      v38.double x = v22;
      v38.double y = v24;
      if (CGRectContainsPoint(v39, v38))
      {
        [v8 bounds];
        double v24 = y - v26;
      }
    }
    [(ZWRootViewController *)self _updateSlugConstraintsForOrientation:[(ZWRootViewController *)self interfaceOrientation]];
    double v27 = fabs(v22);
    BOOL v28 = v27 <= INFINITY;
    if (v27 >= INFINITY) {
      double v29 = 0.0;
    }
    else {
      double v29 = v22;
    }
    if (v28) {
      double v22 = v29;
    }
    double v30 = fabs(v24);
    BOOL v31 = v30 <= INFINITY;
    if (v30 >= INFINITY) {
      double v32 = 0.0;
    }
    else {
      double v32 = v24;
    }
    if (v31) {
      double v24 = v32;
    }
    uint64_t v33 = [(ZWRootViewController *)self slugRingDragXConstraint];
    [v33 setConstant:v22];

    double v34 = [(ZWRootViewController *)self slugRingDragYConstraint];
    [v34 setConstant:v24];

    double v35 = 0.3;
    if (!v3) {
      double v35 = 0.0;
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke;
    v37[3] = &unk_78CA8;
    v37[4] = self;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_2;
    v36[3] = &unk_793F8;
    void v36[4] = self;
    +[UIView animateWithDuration:v37 animations:v36 completion:v35];
  }
}

void __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) slugViewController];
  BOOL v3 = [v2 view];
  unsigned __int8 v4 = [v3 isHidden];

  if (v4)
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  else
  {
    double v9 = [*(id *)(a1 + 32) slugViewController];
    [v9 slugRingViewBoundsInScreenCoordinates];
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
  }
  double v14 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_3;
  block[3] = &unk_79010;
  void block[4] = *(void *)(a1 + 32);
  *(CGFloat *)&void block[5] = x;
  *(CGFloat *)&block[6] = y;
  *(CGFloat *)&block[7] = width;
  *(CGFloat *)&block[8] = height;
  dispatch_sync(v14, block);
}

__n128 __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 80;
  __n128 result = *(__n128 *)(a1 + 56);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)(a1 + 40);
  *(__n128 *)(v1 + 80) = result;
  return result;
}

- (void)_updateZoomFactor:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:");
  double v7 = [(ZWRootViewController *)self activeLensViewController];
  [(ZWRootViewController *)self zoomPanOffset];
  double v9 = v8;
  double v11 = v10;
  double v12 = +[AXSettings sharedInstance];
  double v13 = [v12 zoomCurrentLensEffect];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __51__ZWRootViewController__updateZoomFactor_animated___block_invoke;
  v14[3] = &unk_78CA8;
  v14[4] = self;
  objc_msgSend(v7, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v13, v4, v14, a3, v9, v11);
}

id __51__ZWRootViewController__updateZoomFactor_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)zoomLensViewControllerDidChangeStandbyMode:(id)a3
{
  id v4 = a3;
  double v5 = [(ZWRootViewController *)self slugViewController];
  +[ZWZoomSlugViewController longPressDurationForStandByMode:](ZWZoomSlugViewController, "longPressDurationForStandByMode:", [v4 inStandbyMode]);
  objc_msgSend(v5, "updateLongPressDuration:");

  [(ZWRootViewController *)self _setPIPLensResizingEnabled:0];
  [(ZWRootViewController *)self _setDockResizingEnabled:0];
  [(ZWRootViewController *)self stopZoomMovementWithVelocityWithFullscreenEventHandler:0];
  [(ZWRootViewController *)self currentUIContextForEventProcessor:0];
  if (!CGRectIsNull(v13))
  {
    double v6 = [(ZWRootViewController *)self menuViewController];
    [v6 standbyModeDidChange];
  }
  id v7 = [(ZWRootViewController *)self activeLensViewController];
  if (v7 == v4)
  {
    double v8 = [(ZWRootViewController *)self activeLensViewController];
    double v9 = [(ZWRootViewController *)self pipLensViewController];

    if (v8 == v9)
    {
      if ([v4 inStandbyMode]) {
        [(ZWRootViewController *)self _removePIPSystemGestureDisablingAssertions];
      }
      else {
        [(ZWRootViewController *)self _updateSystemGestureDisablingAssertions];
      }
    }
  }
  else
  {
  }
  id v10 = [(ZWRootViewController *)self activeLensViewController];
  if (v10 == v4)
  {
    double v11 = [(ZWRootViewController *)self activeLensViewController];
    double v12 = [(ZWRootViewController *)self fullscreenLensViewController];

    if (v11 == v12)
    {
      if ([v4 inStandbyMode]) {
        [(ZWRootViewController *)self _removeFullscreenSystemGestureDisablingAssertions];
      }
      else {
        [(ZWRootViewController *)self _updateSystemGestureDisablingAssertions];
      }
    }
  }
  else
  {
  }
}

- (void)zoomLensViewControllerUpdateUIForStandby:(id)a3 completion:(id)a4
{
  id v11 = a3;
  double v6 = (void (**)(void))a4;
  id v7 = [(ZWRootViewController *)self dockedLensViewController];
  if (v7 == v11)
  {
    double v8 = [(ZWRootViewController *)self activeLensViewController];
    double v9 = [(ZWRootViewController *)self dockedLensViewController];

    if (v8 == v9)
    {
      id v10 = [(ZWRootViewController *)self dockedLensViewController];
      [v10 showOrHideUIForStandbyModeWithCompletion:v6];

      goto LABEL_7;
    }
  }
  else
  {
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_7:
  [(ZWRootViewController *)self _updateZoomListeners];
}

- (void)didStartAnimation
{
  [(ZWRootViewController *)self setZoomIsAnimating:1];

  [(ZWRootViewController *)self _updateZoomListeners];
}

- (void)didEndAnimation
{
  [(ZWRootViewController *)self setZoomIsAnimating:0];

  [(ZWRootViewController *)self _updateZoomListeners];
}

- (BOOL)_pipLensIsNearTopOfScreen
{
  id v2 = [(ZWRootViewController *)self pipLensViewController];
  BOOL v3 = [v2 view];
  [v3 frame];
  double v5 = v4;

  return v5 < 30.0;
}

- (BOOL)_pipLensIsNearRightOfScreen
{
  BOOL v3 = [(ZWRootViewController *)self pipLensViewController];
  double v4 = [v3 view];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  CGRect v13 = [(ZWRootViewController *)self view];
  [v13 bounds];
  double v15 = v14;

  v17.origin.CGFloat x = v6;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v10;
  v17.size.CGFloat height = v12;
  return v15 - CGRectGetMaxX(v17) < 30.0;
}

- (BOOL)_pipLensIsNearBottomOfScreen
{
  BOOL v3 = [(ZWRootViewController *)self pipLensViewController];
  double v4 = [v3 view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(ZWRootViewController *)self view];
  [v9 bounds];
  double v11 = v10;

  return vabdd_f64(v6 + v8, v11) < 30.0;
}

- (void)_resizeZoomLensByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v18 = [(ZWRootViewController *)self activeLensViewController];
  id v6 = [(ZWRootViewController *)self pipLensViewController];
  if (v18 == v6)
  {
  }
  else
  {
    double v7 = [(ZWRootViewController *)self dockedLensViewController];

    if (!v7) {
      _AXAssert();
    }
  }
  double v8 = [(ZWRootViewController *)self activeLensViewController];
  double v9 = [(ZWRootViewController *)self pipLensViewController];

  if (v8 == v9)
  {
    id v14 = [v18 activeResizeHandle];
    double v12 = x;
    double v13 = y;
    switch((unint64_t)v14)
    {
      case 0uLL:
      case 1uLL:
        goto LABEL_21;
      case 2uLL:
        double v12 = -x;
        double v13 = -y;
        goto LABEL_21;
      case 3uLL:
LABEL_14:
        double v13 = -y;
        double v12 = 0.0;
        goto LABEL_17;
      case 4uLL:
        double v13 = -y;
        double v12 = x;
LABEL_17:
        double x = 0.0;
        goto LABEL_21;
      case 5uLL:
        double v12 = x;
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        double v13 = 0.0;
        goto LABEL_21;
      case 6uLL:
LABEL_12:
        double v12 = x;
        double v13 = y;
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        goto LABEL_21;
      case 7uLL:
LABEL_11:
        double v13 = y;
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        double v12 = 0.0;
        goto LABEL_21;
      case 8uLL:
        double v12 = -x;
        double v13 = y;
        goto LABEL_20;
      case 9uLL:
LABEL_13:
        double v12 = -x;
        double v13 = 0.0;
LABEL_20:
        double y = 0.0;
        goto LABEL_21;
      default:
        CGRect v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14, x, y);
        _AXAssert();

        goto LABEL_22;
    }
  }
  double v10 = [(ZWRootViewController *)self activeLensViewController];
  double v11 = [(ZWRootViewController *)self dockedLensViewController];

  if (v10 == v11)
  {
    double v15 = [(ZWRootViewController *)self dockedLensViewController];
    id v16 = [v15 dockPosition];

    switch((unint64_t)v16)
    {
      case 0uLL:
        goto LABEL_11;
      case 1uLL:
        goto LABEL_12;
      case 2uLL:
        goto LABEL_13;
      case 3uLL:
        goto LABEL_14;
      default:
        break;
    }
  }
  double v12 = x;
  double v13 = y;
LABEL_21:
  -[ZWRootViewController _resizeZoomLensWithAdjustment:lensPositionCompensation:](self, "_resizeZoomLensWithAdjustment:lensPositionCompensation:", v12, v13, x, y);
LABEL_22:
}

- (void)_resizeZoomLensWithAdjustment:(CGPoint)a3 lensPositionCompensation:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v72 = [(ZWRootViewController *)self activeLensViewController];
  id v9 = [(ZWRootViewController *)self pipLensViewController];
  double v71 = x;
  if (v72 == v9)
  {
  }
  else
  {
    double v10 = [(ZWRootViewController *)self dockedLensViewController];

    if (!v10) {
      _AXAssert();
    }
  }
  double v11 = [v72 lensZoomView];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;

  double v16 = v7 + v13;
  double v17 = v6 + v15;
  [(ZWRootViewController *)self _lensMinimumSize];
  double v19 = v18;
  double v21 = v20;
  [(ZWRootViewController *)self _lensMaximumSize];
  if (v16 >= v19) {
    double v24 = v16;
  }
  else {
    double v24 = v19;
  }
  if (v24 >= v22) {
    double v25 = v22;
  }
  else {
    double v25 = v24;
  }
  if (v17 >= v21) {
    double v26 = v17;
  }
  else {
    double v26 = v21;
  }
  if (v26 >= v23) {
    double v27 = v23;
  }
  else {
    double v27 = v26;
  }
  [(ZWRootViewController *)self zoomFactor];
  double v29 = v28;
  [(ZWRootViewController *)self zoomPanOffset];
  double v31 = v30;
  double v33 = v32;
  double v34 = [(ZWRootViewController *)self activeLensViewController];
  double v35 = [(ZWRootViewController *)self dockedLensViewController];

  if (v34 == v35)
  {
    double v69 = v31;
    [(ZWRootViewController *)self zoomFrame];
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v59 = [(ZWRootViewController *)self dockedLensViewController];
    objc_msgSend(v59, "resizeDock:animated:", 0, v25, v27);

    [(ZWRootViewController *)self zoomFrame];
    double v61 = v60;
    [(ZWRootViewController *)self zoomFrame];
    double v63 = v62;
    double v64 = [(ZWRootViewController *)self dockedLensViewController];
    double v65 = (char *)[v64 dockPosition];

    if (v65 == (unsigned char *)&dword_0 + 2)
    {
      double v52 = v52 + v56 - v61;
    }
    else
    {
      double v66 = [(ZWRootViewController *)self dockedLensViewController];
      double v67 = (char *)[v66 dockPosition];

      if (v67 == (unsigned char *)&dword_0 + 3) {
        double v54 = v54 + v58 - v63;
      }
    }
    objc_msgSend(v72, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v29, v69, v33, -1.0);
    double v68 = [(ZWRootViewController *)self view];
    objc_msgSend(v68, "zw_convertRectToScreenCoordinates:", v52, v54, v61, v63);
    -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:](self, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 1, 1, 0, 0);
  }
  else
  {
    double v36 = v27 - v15;
    double v37 = v25 - v13;
    if (v27 - v15 < 0.0) {
      double v36 = -(v27 - v15);
    }
    double v38 = -v36;
    if (y >= -v36) {
      double v38 = y;
    }
    if (v38 < v36) {
      double v36 = v38;
    }
    double v70 = v36;
    double v39 = -v37;
    if (v37 >= 0.0) {
      double v39 = v25 - v13;
    }
    double v40 = -v39;
    if (v71 >= -v39) {
      double v40 = v71;
    }
    double v41 = v31;
    if (v40 >= v39) {
      double v42 = v39;
    }
    else {
      double v42 = v40;
    }
    double v43 = +[ZWCoalescedSettings sharedInstance];
    [v43 zoomWindowFrame];
    double v45 = v44;
    double v47 = v46;

    double v48 = +[ZWCoalescedSettings sharedInstance];
    objc_msgSend(v48, "setZoomWindowFrame:", v45, v47, v25, v27);

    double v49 = [(ZWRootViewController *)self lensWidthConstraint];
    [v49 setConstant:v25];

    double v50 = [(ZWRootViewController *)self lensHeightConstraint];
    [v50 setConstant:v27];

    objc_msgSend(v72, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v29, v41, v33, -1.0);
    -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:", v72, 0, 1, 0, 0, v42, v70);
  }
}

- (void)_moveZoomItemWithControllerToDodgeJindo:(id)a3 byDelta:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = v7;
  if (y >= 0.0)
  {
    id v9 = [v7 view];
    [v9 frame];
    double v11 = x + v10;
    double v12 = [(ZWRootViewController *)self slugRingDragXConstraint];
    [v12 setConstant:v11];

    [v9 frame];
    double v14 = y + v13;
    double v15 = [(ZWRootViewController *)self slugRingDragYConstraint];
    [v15 setConstant:v14];

    [v9 setNeedsLayout];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __72__ZWRootViewController__moveZoomItemWithControllerToDodgeJindo_byDelta___block_invoke;
    v19[3] = &unk_78CD0;
    id v20 = v9;
    double v21 = x;
    double v22 = y;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __72__ZWRootViewController__moveZoomItemWithControllerToDodgeJindo_byDelta___block_invoke_2;
    v17[3] = &unk_79420;
    v17[4] = self;
    id v18 = v8;
    id v16 = v9;
    +[UIView animateWithDuration:v19 animations:v17 completion:0.2];
  }
}

id __72__ZWRootViewController__moveZoomItemWithControllerToDodgeJindo_byDelta___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) frame];
  double v7 = *(double *)(a1 + 40) + v6;
  [*(id *)(a1 + 32) frame];
  double v9 = *(double *)(a1 + 48) + v8;
  double v10 = *(void **)(a1 + 32);

  return objc_msgSend(v10, "setFrame:", v7, v9, v3, v5);
}

id __72__ZWRootViewController__moveZoomItemWithControllerToDodgeJindo_byDelta___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _slugNormalizedPositionForCurrentPosition];
  double v3 = v2;
  double v5 = v4;
  double v6 = +[ZWCoalescedSettings sharedInstance];
  objc_msgSend(v6, "setZoomSlugNormalizedPosition:", v3, v5);

  double v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);

  return [v7 _updateLensEdgeMaskForZoomController:v8];
}

- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6
{
}

- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6 shouldUseFullDeltaForDockedMode:(BOOL)a7 shouldPan:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v77 = a5;
  double y = a4.y;
  double x = a4.x;
  id v14 = a3;
  uint64_t v15 = [v14 view];
  id v16 = [(ZWRootViewController *)self activeLensViewController];

  double v78 = (void *)v15;
  if (v16 != v14)
  {
    double v17 = [(ZWRootViewController *)self slugRingDragXConstraint];
    id v18 = [(ZWRootViewController *)self slugRingDragYConstraint];
    LOBYTE(v19) = 0;
    goto LABEL_26;
  }
  BOOL v76 = a6;
  if ([(ZWKeyboardContext *)self->_kbContext isKeyboardVisible]) {
    [(ZWKeyboardContext *)self->_kbContext setUserMovedKeyboardLens:1];
  }
  id v20 = [(ZWRootViewController *)self activeLensViewController];
  double v21 = [(ZWRootViewController *)self pipLensViewController];
  if (v20 == v21) {
    unint64_t v22 = [(ZWRootViewController *)self pipLensEdgeMask];
  }
  else {
    unint64_t v22 = 15;
  }

  [(ZWRootViewController *)self zoomPanOffset];
  if (v8)
  {
    double v25 = v23;
    double v26 = v24;
    double v27 = [(ZWRootViewController *)self activeLensViewController];
    unsigned int v28 = objc_msgSend(v27, "shouldPanZoomContentForAxis:delta:edgeMask:", 2, v22, x, y);

    if (v28)
    {
      double v29 = [(ZWRootViewController *)self activeLensViewController];
      [(ZWRootViewController *)self zoomFactor];
      objc_msgSend(v29, "offsetByPanningWithDelta:axis:zoomFactor:", 2, x, y, v30);
      double v32 = v31;

      double v33 = [(ZWRootViewController *)self activeLensViewController];
      [(ZWRootViewController *)self zoomFactor];
      objc_msgSend(v33, "offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:", 2, x, y, v34);
      double v25 = v35;
    }
    else
    {
      double v32 = v25;
    }
    double v36 = [(ZWRootViewController *)self activeLensViewController];
    unsigned int v19 = objc_msgSend(v36, "shouldPanZoomContentForAxis:delta:edgeMask:", 4, v22, x, y);

    if (v19)
    {
      double v37 = [(ZWRootViewController *)self activeLensViewController];
      [(ZWRootViewController *)self zoomFactor];
      objc_msgSend(v37, "offsetByPanningWithDelta:axis:zoomFactor:", 4, x, y, v38);
      double v26 = v39;

      double v40 = [(ZWRootViewController *)self activeLensViewController];
      [(ZWRootViewController *)self zoomFactor];
      objc_msgSend(v40, "offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:", 4, x, y, v41);
      double v43 = v42;
    }
    else
    {
      if (!v28)
      {
        LOBYTE(v19) = 0;
        goto LABEL_19;
      }
      LOBYTE(v28) = 1;
      double v43 = v26;
    }
    double v44 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v44, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", v9, v25, v43, v32, v26);

    -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v32, v26);
    double v45 = [(ZWRootViewController *)self activeLensViewController];
    [(ZWRootViewController *)self zoomFactor];
    objc_msgSend(v45, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v77, 0);
  }
  else
  {
    LOBYTE(v19) = 0;
    LOBYTE(v28) = 0;
  }
LABEL_19:
  double v17 = [(ZWRootViewController *)self lensDragXConstraint];
  id v18 = [(ZWRootViewController *)self lensDragYConstraint];
  if ([(ZWKeyboardContext *)self->_kbContext isKeyboardVisible])
  {
    if (![(ZWKeyboardContext *)self->_kbContext userMovedKeyboardLens])
    {
      double v46 = +[AXSettings sharedInstance];
      double v47 = [v46 zoomPreferredCurrentLensMode];
      unsigned int v48 = [v47 isEqual:AXZoomLensModeWindow];

      if (v48)
      {
        double v49 = +[ZWCoalescedSettings sharedInstance];
        [v49 zoomWindowFrame];
        double v51 = v50;
        double v53 = v52;

        double v54 = [(ZWRootViewController *)self lensWidthConstraint];
        [v54 setConstant:v51];

        double v55 = [(ZWRootViewController *)self lensHeightConstraint];
        [v55 setConstant:v53];

        double v56 = [(ZWRootViewController *)self activeLensViewController];
        double v57 = [v56 view];
        [v57 frame];
        double v59 = (v58 - v51) * 0.5;
        [v17 constant];
        [v17 setConstant:v60 + v59];

        double v61 = [(ZWRootViewController *)self activeLensViewController];
        double v62 = [v61 view];
        [v62 frame];
        double v64 = v63 - v53;
        [v18 constant];
        [v18 setConstant:v65 + v64];
      }
    }
  }
  a6 = v76;
  if ((v28 & 1) == 0)
  {
LABEL_26:
    [v17 constant];
    [v17 setConstant:x + v68];
    int v66 = 0;
    char v67 = 0;
    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  int v66 = 1;
  if ((v19 & 1) == 0)
  {
LABEL_27:
    [v18 constant];
    [v18 setConstant:y + v69];
    char v67 = 1;
    goto LABEL_28;
  }
  char v67 = 0;
LABEL_28:
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke;
  v84[3] = &unk_78E90;
  id v70 = v14;
  id v85 = v70;
  double v86 = self;
  BOOL v87 = a6;
  double v71 = objc_retainBlock(v84);
  id v72 = v71;
  if ((v67 & 1) != 0 || !v66)
  {
    BOOL v74 = v16 == v14;
    v73 = v78;
    [v78 setNeedsLayout];
    if (v77) {
      double v75 = 0.4;
    }
    else {
      double v75 = 0.0;
    }
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_2;
    v82[3] = &unk_78CA8;
    id v83 = v78;
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_3;
    v79[3] = &unk_79448;
    BOOL v81 = v74;
    v79[4] = self;
    id v80 = v72;
    +[UIView animateWithDuration:v82 animations:v79 completion:v75];
  }
  else
  {
    ((void (*)(void *))v71[2])(v71);
    v73 = v78;
  }
}

id __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) activeLensViewController];
  if (v2 != v3) {
    goto LABEL_4;
  }
  double v4 = *(void **)(a1 + 32);
  double v5 = [*(id *)(a1 + 40) pipLensViewController];
  if (v4 != v5)
  {

    double v3 = v2;
LABEL_4:

    goto LABEL_5;
  }
  int v14 = *(unsigned __int8 *)(a1 + 48);

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 40) lensDragXConstraint];
    [v15 constant];
    double v17 = v16;
    id v18 = [*(id *)(a1 + 40) lensDragYConstraint];
    [v18 constant];
    double v20 = v19;
    double v21 = [*(id *)(a1 + 40) lensWidthConstraint];
    [v21 constant];
    double v23 = v22;
    double v24 = [*(id *)(a1 + 40) lensHeightConstraint];
    [v24 constant];
    double v26 = v25;
    double v27 = +[ZWCoalescedSettings sharedInstance];
    objc_msgSend(v27, "setZoomWindowFrame:", v17, v20, v23, v26);

    [*(id *)(a1 + 40) _updateLensLayout];
    goto LABEL_11;
  }
LABEL_5:
  double v6 = *(void **)(a1 + 32);
  double v7 = [*(id *)(a1 + 40) slugViewController];
  if (v6 == v7)
  {
    int v8 = *(unsigned __int8 *)(a1 + 48);

    if (v8)
    {
      [*(id *)(a1 + 40) _slugNormalizedPositionForCurrentPosition];
      double v10 = v9;
      double v12 = v11;
      double v13 = +[ZWCoalescedSettings sharedInstance];
      objc_msgSend(v13, "setZoomSlugNormalizedPosition:", v10, v12);
    }
  }
  else
  {
  }
LABEL_11:
  uint64_t v29 = *(void *)(a1 + 32);
  unsigned int v28 = *(void **)(a1 + 40);

  return [v28 _updateLensEdgeMaskForZoomController:v29];
}

id __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_3(uint64_t a1)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _updateSystemGestureDisablingAssertions];
  }
  return result;
}

- (void)_updateLensEdgeMaskForZoomController:(id)a3
{
  id v50 = a3;
  double v4 = [(ZWRootViewController *)self containerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(ZWRootViewController *)self pipLensViewController];

  if (v13 == v50)
  {
    double v23 = [v50 lensChromeView];
    [v23 bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v25 = [(ZWRootViewController *)self containerView];
    double v24 = v25;
    double v26 = v32;
    double v27 = v34;
    double v28 = v36;
    double v29 = v38;
    double v30 = v23;
  }
  else
  {
    int v14 = [v50 view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [(ZWRootViewController *)self containerView];
    double v24 = [v50 view];
    double v25 = v23;
    double v26 = v16;
    double v27 = v18;
    double v28 = v20;
    double v29 = v22;
    double v30 = v24;
  }
  objc_msgSend(v25, "convertRect:fromView:", v30, v26, v27, v28, v29);
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = vabdd_f64(v42, v12 - v46);
  uint64_t v48 = (vabdd_f64(v42, v8) < 1.0) | (8 * (vabdd_f64(v40, v6) < 1.0)) | (2 * (vabdd_f64(v40, v10 - v44) < 1.0)) | (4 * (v47 < 1.0));
  id v49 = [(ZWRootViewController *)self pipLensViewController];

  if (v49 == v50) {
    [(ZWRootViewController *)self setPipLensEdgeMask:v48];
  }
  else {
    [(ZWRootViewController *)self setSlugEdgeMask:v48];
  }
}

- (void)_unzoomDueToAppTransitionIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v4 = vabdd_f64(v3, self->_lastDeviceUnlockTime);
    double v5 = [(ZWRootViewController *)self activeLensViewController];
    double v6 = v5;
    if (v4 >= 0.5 && ([v5 inStandbyMode] & 1) == 0)
    {
      double v7 = [(ZWRootViewController *)self activeLensViewController];
      double v8 = [(ZWRootViewController *)self fullscreenLensViewController];

      if (v7 == v8)
      {
        [(ZWRootViewController *)self setZoomWasUnzoomedDueToAppTransition:1];
        [(ZWRootViewController *)self setZoomIsAnimatingDueToTransition:1];
        [(ZWRootViewController *)self zoomPanOffset];
        -[ZWRootViewController setPanOffsetXBeforeTransition:](self, "setPanOffsetXBeforeTransition:");
        double v9 = [(ZWRootViewController *)self activeLensViewController];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = __57__ZWRootViewController__unzoomDueToAppTransitionIfNeeded__block_invoke;
        v10[3] = &unk_78CA8;
        v10[4] = self;
        objc_msgSend(v9, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, AXZoomLensEffectNone, 1, v10, AXZoomMinimumZoomLevel, CGPointZero.x, CGPointZero.y);
      }
    }
  }
}

id __57__ZWRootViewController__unzoomDueToAppTransitionIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setZoomIsAnimatingDueToTransition:0];
  id result = [*(id *)(a1 + 32) triedToRezoomForDockTransition];
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _rezoomDueToDockIfNeeded];
  }
  return result;
}

- (void)_rezoomDueToAppTransitionIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled()
    && ![(ZWRootViewController *)self triedToRezoomForDockTransition]
    && [(ZWRootViewController *)self zoomWasUnzoomedDueToAppTransition])
  {
    [(ZWRootViewController *)self setZoomWasUnzoomedDueToAppTransition:0];
    [(ZWRootViewController *)self zoomPanOffset];
    double v4 = v3;
    double v6 = v5;
    [(ZWRootViewController *)self zoomFactor];
    double v8 = v7;
    double v9 = [(ZWRootViewController *)self activeLensViewController];
    double v10 = [(ZWRootViewController *)self fullscreenLensViewController];

    if (v9 == v10)
    {
      double v11 = [(ZWRootViewController *)self fullscreenLensViewController];
      [v11 maximumPanOffsetWithZoomFactor:v8];
      double v13 = v12;

      double v6 = -v13;
      double v4 = 0.0;
      -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", 0.0, v6);
    }
    int v14 = +[AXSettings sharedInstance];
    id v16 = [v14 zoomCurrentLensEffect];

    double v15 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v15, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v16, 1, 0, v8, v4, v6);
  }
}

- (void)_rezoomDueToDockIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    if ([(ZWRootViewController *)self zoomIsAnimatingDueToTransition])
    {
      [(ZWRootViewController *)self setTriedToRezoomForDockTransition:1];
    }
    else
    {
      [(ZWRootViewController *)self setTriedToRezoomForDockTransition:0];
      double v3 = +[AXSpringBoardServer server];
      unsigned __int8 v4 = [v3 isDockVisible];

      if (v4)
      {
        if ([(ZWRootViewController *)self zoomWasUnzoomedDueToAppTransition])
        {
          [(ZWRootViewController *)self setZoomWasUnzoomedDueToAppTransition:0];
          [(ZWRootViewController *)self zoomPanOffset];
          double v6 = v5;
          double v8 = v7;
          [(ZWRootViewController *)self zoomFactor];
          double v10 = v9;
          double v11 = [(ZWRootViewController *)self activeLensViewController];
          double v12 = [(ZWRootViewController *)self fullscreenLensViewController];

          if (v11 == v12)
          {
            double v13 = [(ZWRootViewController *)self fullscreenLensViewController];
            [v13 maximumPanOffsetWithZoomFactor:v10];
            double v8 = v14;

            [(ZWRootViewController *)self panOffsetXBeforeTransition];
            double v6 = v15;
            -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:");
          }
          id v16 = +[AXSettings sharedInstance];
          id v18 = [v16 zoomCurrentLensEffect];

          double v17 = [(ZWRootViewController *)self activeLensViewController];
          objc_msgSend(v17, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v18, 1, 0, v10, v6, v8);
        }
      }
      else
      {
        [(ZWRootViewController *)self _rezoomDueToAppTransitionIfNeeded];
      }
    }
  }
}

- (void)_toggleZoomStandby
{
  if ([(ZWRootViewController *)self zoomIsAnimatingDueToStandbyToggle])
  {
    [(ZWRootViewController *)self setTriedToToggleStandbyDuringAnimation:1];
  }
  else
  {
    [(ZWRootViewController *)self setTriedToToggleStandbyDuringAnimation:0];
    [(ZWRootViewController *)self setZoomIsAnimatingDueToStandbyToggle:1];
    [(ZWRootViewController *)self _updateZoomListeners];
    double v3 = [(ZWRootViewController *)self activeLensViewController];
    [(ZWRootViewController *)self zoomFactor];
    double v5 = v4;
    if (-[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:"))
    {
      double v6 = +[ZWCoalescedSettings sharedInstance];
      [v6 zoomFactor];
      double v5 = v7;

      if ([(ZWRootViewController *)self _isZoomFactorAtMinimum:v5]) {
        double v5 = AXZoomDefaultZoomLevel;
      }
    }
    [(ZWRootViewController *)self setZoomFactor:v5];
    [(ZWRootViewController *)self zoomPanOffset];
    double v9 = v8;
    double v11 = v10;
    if ([v3 inStandbyMode])
    {
      double v12 = [(ZWRootViewController *)self smartZoom];
      unsigned int v13 = [v12 isEnabled];

      if (v13)
      {
        double v14 = [(ZWRootViewController *)self smartZoom];
        [v14 focusRect];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        v38.origin.double x = v16;
        v38.origin.double y = v18;
        v38.size.CGFloat width = v20;
        v38.size.CGFloat height = v22;
        if (!CGRectIsEmpty(v38))
        {
          double v23 = [(ZWRootViewController *)self containerView];
          objc_msgSend(v23, "zw_convertRectFromScreenCoordinates:", v16, v18, v20, v22);
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          objc_msgSend(v3, "offsetByPanningToRect:zoomFactor:", v25, v27, v29, v31, v5);
          double v9 = v32;
          double v11 = v33;
        }
      }
    }
    double v34 = +[AXSettings sharedInstance];
    double v35 = [v34 zoomCurrentLensEffect];

    [(ZWRootViewController *)self _updateLensLayout];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __42__ZWRootViewController__toggleZoomStandby__block_invoke;
    v36[3] = &unk_78CA8;
    void v36[4] = self;
    objc_msgSend(v3, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", objc_msgSend(v3, "inStandbyMode") ^ 1, v35, 1, v36, v5, v9, v11);
  }
}

id __42__ZWRootViewController__toggleZoomStandby__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  [*(id *)(a1 + 32) _updateMinimapStatus];
  [*(id *)(a1 + 32) setZoomIsAnimatingDueToStandbyToggle:0];
  id result = [*(id *)(a1 + 32) triedToToggleStandbyDuringAnimation];
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _toggleZoomStandby];
  }
  return result;
}

- (void)_setPIPLensResizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ZWRootViewController *)self touchTrapView];
  [v5 setEnabled:v3];

  double v6 = [(ZWRootViewController *)self pipLensViewController];
  [v6 setInLensResizingMode:v3];

  double v7 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __51__ZWRootViewController__setPIPLensResizingEnabled___block_invoke;
  v8[3] = &unk_78B78;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(v7, v8);
}

uint64_t __51__ZWRootViewController__setPIPLensResizingEnabled___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) = *(_WORD *)(*(void *)(result + 32) + 376) & 0xFEFF | (*(unsigned __int8 *)(result + 40) << 8);
  return result;
}

- (void)_setDockResizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ZWRootViewController *)self touchTrapView];
  [v5 setEnabled:v3];

  double v6 = [(ZWRootViewController *)self dockedLensViewController];
  [v6 setInDockResizingMode:v3];

  double v7 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __48__ZWRootViewController__setDockResizingEnabled___block_invoke;
  v8[3] = &unk_78B78;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(v7, v8);
}

uint64_t __48__ZWRootViewController__setDockResizingEnabled___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) = *(_WORD *)(*(void *)(result + 32) + 376) & 0xFEFF | (*(unsigned __int8 *)(result + 40) << 8);
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  double v8 = ZOOMLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(ZWRootViewController *)self view];
    [v9 bounds];
    v52.CGFloat width = v10;
    v52.CGFloat height = v11;
    double v12 = NSStringFromCGSize(v52);
    v53.CGFloat width = width;
    v53.CGFloat height = height;
    unsigned int v13 = NSStringFromCGSize(v53);
    *(_DWORD *)buf = 138412546;
    id v49 = v12;
    __int16 v50 = 2112;
    double v51 = v13;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Zoom window will transition from size %@ to %@", buf, 0x16u);
  }
  double v14 = [(ZWRootViewController *)self activeLensViewController];
  double v15 = [(ZWRootViewController *)self fullscreenLensViewController];

  BOOL v16 = v14 == v15;
  if (v14 == v15) {
    +[UIView setAnimationsEnabled:0];
  }
  double v17 = [(ZWRootViewController *)self slugViewController];
  double v18 = [v17 view];
  [v18 alpha];
  uint64_t v20 = v19;

  double v21 = [(ZWRootViewController *)self slugViewController];
  double v22 = [v21 view];
  [v22 setAlpha:0.0];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v47[3] = &unk_79470;
  v47[4] = self;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v45[3] = &unk_79498;
  BOOL v46 = v16;
  v45[4] = self;
  v45[5] = v20;
  [v7 animateAlongsideTransition:v47 completion:v45];

  double v23 = [(ZWRootViewController *)self activeLensViewController];
  double v24 = [(ZWRootViewController *)self pipLensViewController];

  if (v23 == v24)
  {
    double v43 = width;
    double v44 = height;
    double v25 = [(ZWRootViewController *)self activeLensViewController];
    double v26 = [v25 view];
    [v26 frame];

    UIRectInset();
    CGFloat x = v54.origin.x;
    CGFloat y = v54.origin.y;
    double v29 = v54.size.width;
    double v30 = v54.size.height;
    double MinX = CGRectGetMinX(v54);
    double v32 = [(ZWRootViewController *)self view];
    [v32 frame];
    double v34 = v33;
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.CGFloat width = v29;
    v55.size.CGFloat height = v30;
    double v35 = v34 - CGRectGetMaxX(v55);

    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = v29;
    v56.size.CGFloat height = v30;
    double MinY = CGRectGetMinY(v56);
    double v37 = [(ZWRootViewController *)self view];
    [v37 frame];
    double v39 = v38;
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = v29;
    v57.size.CGFloat height = v30;
    double v40 = v39 - CGRectGetMaxY(v57);

    if (MinX + v35 > 0.5)
    {
      double v41 = [(ZWRootViewController *)self lensDragXConstraint];
      [v41 setConstant:MinX * (v43 - v29) / (MinX + v35) + -18.0];
    }
    if (MinY + v40 > 0.5)
    {
      double v42 = [(ZWRootViewController *)self lensDragYConstraint];
      [v42 setConstant:(v44 - v30) * MinY / (MinY + v40) + -18.0];
    }
  }
}

id __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSlugLayoutAnimated:1];
}

void __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    +[UIView setAnimationsEnabled:1];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v11[3] = &unk_78E40;
  v11[4] = *(void *)(a1 + 32);
  void v11[5] = *(void *)(a1 + 40);
  +[UIView animateWithDuration:v11 animations:0.25];
  double v4 = [*(id *)(a1 + 32) activeLensViewController];
  double v5 = [v4 lensZoomView];
  [v5 zoomPanOffset];
  objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:");

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3010000000;
  v9[3] = "";
  CGSize v10 = CGSizeZero;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[7] = _NSConcreteStackBlock;
  v7[8] = 3221225472;
  v7[9] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v7[10] = &unk_79268;
  v7[11] = *(void *)(a1 + 32);
  v7[12] = v8;
  v7[13] = v9;
  AXPerformBlockSynchronouslyOnMainThread();
  double v6 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
  v7[3] = &unk_79290;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = v8;
  void v7[6] = v9;
  dispatch_sync(v6, v7);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);
}

void __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) slugViewController];
  double v2 = [v3 view];
  [v2 setAlpha:v1];
}

void __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  id v3 = [v2 window];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 interfaceOrientation];

  id v7 = [*(id *)(a1 + 32) screen];
  [v7 bounds];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
}

__n128 __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = v2 + 10;
  uint64_t v4 = [v2 activeLensViewController];
  uint64_t v5 = [v4 lensZoomView];
  objc_msgSend(v5, "zw_convertBoundsToScreenCoordinates");
  v3[4] = v6;
  v3[5] = v7;
  v3[6] = v8;
  v3[7] = v9;

  CGSize v10 = [*(id *)(a1 + 32) activeLensViewController];
  CGFloat v11 = [*(id *)(a1 + 32) dockedLensViewController];

  if (v10 == v11)
  {
    double v12 = [*(id *)(a1 + 32) dockedLensViewController];
    [v12 screenShift];
    *(void *)(*(void *)(a1 + 32) + 216) = v13;

    double v14 = *(void **)(a1 + 32);
    double v15 = v14 + 10;
    BOOL v16 = [v14 dockedLensViewController];
    double v17 = [v16 dockedLensView];
    [v17 frame];
    v15[18] = v18;
    v15[19] = v19;
    v15[20] = v20;
    v15[21] = v21;

    double v22 = *(void **)(a1 + 32);
    double v23 = v22 + 10;
    double v24 = [v22 dockedLensViewController];
    [v24 zoomRegionFrame];
    v23[22] = v25;
    v23[23] = v26;
    v23[24] = v27;
    v23[25] = v28;

    double v29 = *(void **)(a1 + 32);
    double v30 = v29 + 10;
    double v31 = [v29 dockedLensViewController];
    double v32 = [v31 toggleZoomRegionButton];
    [v32 frame];
    v30[26] = v33;
    v30[27] = v34;
    v30[28] = v35;
    v30[29] = v36;

    double v37 = *(void **)(a1 + 32);
    double v38 = v37 + 10;
    double v39 = [v37 dockedLensViewController];
    [v39 frameForResizeDrag];
    v38[30] = v40;
    v38[31] = v41;
    v38[32] = v42;
    v38[33] = v43;
  }
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(void *)(*(void *)(a1 + 32) + 384) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(_OWORD *)(*(void *)(a1 + 32) + 96) = *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  *(__n128 *)(*(void *)(a1 + 32) + 400) = result;
  return result;
}

- (void)setTestingScreenSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  ZWSetTestingScreenSize(a3.width, a3.height);
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    uint64_t v7 = +[UIScreen mainScreen];
    [v7 bounds];
    double width = v8;
    double height = v9;
  }
  CGSize v10 = [(ZWRootViewController *)self containerView];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, width, height);

  id v11 = [(ZWRootViewController *)self activeLensViewController];
  [(ZWRootViewController *)self _applyInitialConstraintsForLensViewController:v11];
}

- (CGSize)_screenSizeForCurrentOrientation
{
  if (!self->_inUnitTestingMode
    || (ZWGetTestingScreenSize() == CGSizeZero.width ? (BOOL v4 = v3 == CGSizeZero.height) : (BOOL v4 = 0), v4))
  {
    uint64_t v7 = [(ZWRootViewController *)self screen];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;

    double v5 = v9;
    double v6 = v11;
  }
  else
  {
    double v5 = ZWGetTestingScreenSize();
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGPoint)_denormalizePointForCurrentOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
  double v6 = x * v5;
  double v8 = y * v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGPoint)_denormalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4
{
  double v4 = a4.origin.x + a3.x * a4.size.width;
  double v5 = a4.origin.y + a3.y * a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_normalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4
{
  double v4 = (a3.x - a4.origin.x) / a4.size.width;
  double v5 = (a3.y - a4.origin.y) / a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_physicalScreenPointForVirtualScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(ZWRootViewController *)self zoomFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(ZWRootViewController *)self activeLensViewController];
  double v15 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v14 == v15)
  {
    [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
    -[ZWRootViewController _normalizePoint:withRespectToFrame:](self, "_normalizePoint:withRespectToFrame:", x, y, v7, v9, v11, v13);
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:");
    double x = v24;
    double y = v25;
  }
  else
  {
    BOOL v16 = [(ZWRootViewController *)self activeLensViewController];
    double v17 = [(ZWRootViewController *)self pipLensViewController];

    if (v16 == v17)
    {
      -[ZWRootViewController _normalizePoint:withRespectToFrame:](self, "_normalizePoint:withRespectToFrame:", x, y, v7, v9, v11, v13);
      double v27 = v26;
      double v29 = v28;
      double v30 = [(ZWRootViewController *)self pipLensViewController];
      double v31 = [v30 lensChromeView];
      double v32 = [(ZWRootViewController *)self pipLensViewController];
      uint64_t v33 = [v32 lensChromeView];
      [v33 bounds];
      objc_msgSend(v31, "convertRect:toView:", 0);
      -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:", v27, v29, v34, v35, v36, v37);
      double x = v38;
      double y = v39;

LABEL_13:
    }
    else
    {
      uint64_t v18 = [(ZWRootViewController *)self activeLensViewController];
      uint64_t v19 = [(ZWRootViewController *)self dockedLensViewController];

      if (v18 == v19)
      {
        uint64_t v20 = [(ZWRootViewController *)self dockedLensViewController];
        id v21 = [v20 dockPosition];

        switch((unint64_t)v21)
        {
          case 0uLL:
            double v22 = [(ZWRootViewController *)self dockedLensViewController];
            [v22 screenShift];
            double y = y + v23;
            goto LABEL_9;
          case 1uLL:
            double v22 = [(ZWRootViewController *)self dockedLensViewController];
            [v22 screenShift];
            double x = x + v40;
LABEL_9:

            break;
          case 2uLL:
            double v30 = [(ZWRootViewController *)self dockedLensViewController];
            [v30 screenShift];
            double v42 = v41;
            uint64_t v43 = [(ZWRootViewController *)self dockedLensViewController];
            double v44 = [v43 dockedLensView];
            [v44 bounds];
            double x = x + v42 - v45;
            goto LABEL_12;
          case 3uLL:
            double v30 = [(ZWRootViewController *)self dockedLensViewController];
            [v30 screenShift];
            double v47 = v46;
            uint64_t v43 = [(ZWRootViewController *)self dockedLensViewController];
            double v44 = [v43 dockedLensView];
            [v44 bounds];
            double y = y + v47 - v48;
LABEL_12:

            goto LABEL_13;
          default:
            break;
        }
      }
    }
  }
  double v49 = x;
  double v50 = y;
  result.double y = v50;
  result.double x = v49;
  return result;
}

- (CGPoint)_virtualScreenPointForPhysicalScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(ZWRootViewController *)self zoomFrame];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v10 = [(ZWRootViewController *)self activeLensViewController];
  double v11 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v10 == v11)
  {
    [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
    -[ZWRootViewController _normalizePoint:withRespectToFrame:](self, "_normalizePoint:withRespectToFrame:", x, y, 0.0, 0.0, v20, v21);
    double v22 = self;
LABEL_8:
    [(ZWRootViewController *)v22 _denormalizePoint:v49 withRespectToFrame:v50];
    double x = v35;
    double y = v36;
    goto LABEL_9;
  }
  double v12 = [(ZWRootViewController *)self activeLensViewController];
  double v13 = [(ZWRootViewController *)self pipLensViewController];

  if (v12 == v13)
  {
    double v23 = [(ZWRootViewController *)self pipLensViewController];
    double v24 = [v23 lensChromeView];
    double v25 = [(ZWRootViewController *)self pipLensViewController];
    double v26 = [v25 lensChromeView];
    [v26 bounds];
    objc_msgSend(v24, "convertRect:toView:", 0);
    double v28 = v27;
    double v30 = v29;
    uint64_t v49 = v7;
    uint64_t v50 = v9;
    double v32 = v31;
    double v34 = v33;

    -[ZWRootViewController _normalizePoint:withRespectToFrame:](self, "_normalizePoint:withRespectToFrame:", x, y, v28, v30, v32, v34);
    double v22 = self;
    goto LABEL_8;
  }
  double v14 = [(ZWRootViewController *)self activeLensViewController];
  double v15 = [(ZWRootViewController *)self dockedLensViewController];

  if (v14 == v15)
  {
    BOOL v16 = [(ZWRootViewController *)self dockedLensViewController];
    id v17 = [v16 dockPosition];

    switch((unint64_t)v17)
    {
      case 0uLL:
        uint64_t v18 = [(ZWRootViewController *)self dockedLensViewController];
        [v18 screenShift];
        double y = y - v19;
        goto LABEL_11;
      case 1uLL:
        uint64_t v18 = [(ZWRootViewController *)self dockedLensViewController];
        [v18 screenShift];
        double x = x - v39;
LABEL_11:

        break;
      case 2uLL:
        double v40 = [(ZWRootViewController *)self dockedLensViewController];
        [v40 screenShift];
        double v42 = v41;
        uint64_t v43 = [(ZWRootViewController *)self dockedLensViewController];
        double v44 = [v43 dockedLensView];
        [v44 bounds];
        double x = x - (v42 - v45);
        goto LABEL_14;
      case 3uLL:
        double v40 = [(ZWRootViewController *)self dockedLensViewController];
        [v40 screenShift];
        double v47 = v46;
        uint64_t v43 = [(ZWRootViewController *)self dockedLensViewController];
        double v44 = [v43 dockedLensView];
        [v44 bounds];
        double y = y - (v47 - v48);
LABEL_14:

        break;
      default:
        break;
    }
  }
LABEL_9:
  double v37 = x;
  double v38 = y;
  result.double y = v38;
  result.double x = v37;
  return result;
}

- (void)_presentMenuWithAnchorView:(id)a3 animated:(BOOL)a4 ignoreCooldown:(BOOL)a5
{
  id v7 = a3;
  uint64_t v8 = [(ZWRootViewController *)self presentedViewController];
  uint64_t v9 = [(ZWRootViewController *)self menuViewController];

  if (v8 != v9)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    if (a5 || vabdd_f64(v10, self->_lastMenuDismissalTime) >= 0.75)
    {
      double v11 = [(ZWRootViewController *)self traitCollection];
      if (![v11 userInterfaceIdiom])
      {
        uint64_t v12 = [(ZWRootViewController *)self view];

        id v7 = (id)v12;
      }
      [v7 bounds];
      double v14 = v13;
      double MidY = v15;
      double v18 = v17;
      double v20 = v19;
      id v21 = [(ZWRootViewController *)self view];

      if (v7 == v21)
      {
        v51.origin.double x = v14;
        v51.origin.double y = MidY;
        v51.size.double width = v18;
        v51.size.double height = v20;
        CGFloat MidX = CGRectGetMidX(v51);
        v52.origin.double x = v14;
        v52.origin.double y = MidY;
        v52.size.double width = v18;
        v52.size.double height = v20;
        double MidY = CGRectGetMidY(v52);
        uint64_t v22 = 0;
        double v20 = 1.0;
        double v18 = 1.0;
        double v14 = MidX;
      }
      else
      {
        uint64_t v22 = 15;
      }
      double v24 = ZOOMLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v53.origin.double x = v14;
        v53.origin.double y = MidY;
        v53.size.double width = v18;
        v53.size.double height = v20;
        double v25 = NSStringFromCGRect(v53);
        double v26 = [(ZWRootViewController *)self view];
        [v26 bounds];
        double v27 = NSStringFromCGRect(v54);
        *(_DWORD *)buf = 138412802;
        double v46 = v25;
        __int16 v47 = 2112;
        id v48 = v7;
        __int16 v49 = 2112;
        uint64_t v50 = v27;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Displaying Zoom Menu at popover rect: %@, anchor view: %@, view bounds: %@", buf, 0x20u);
      }
      double v28 = [(ZWRootViewController *)self slugViewController];
      double v29 = [v28 view];
      double v30 = [v29 window];

      if (v30)
      {
        double v31 = [(ZWRootViewController *)self slugViewController];
        double v32 = [v31 view];
        double v44 = v32;
        double v33 = +[NSArray arrayWithObjects:&v44 count:1];
        double v34 = [(ZWRootViewController *)self menuViewController];
        double v35 = [v34 popoverPresentationController];
        [v35 setPassthroughViews:v33];
      }
      double v36 = [(ZWRootViewController *)self menuViewController];
      double v37 = [v36 popoverPresentationController];
      objc_msgSend(v37, "setSourceRect:", v14, MidY, v18, v20);

      double v38 = [(ZWRootViewController *)self menuViewController];
      double v39 = [v38 popoverPresentationController];
      [v39 setSourceView:v7];

      double v40 = [(ZWRootViewController *)self menuViewController];
      double v41 = [v40 popoverPresentationController];
      [v41 setPermittedArrowDirections:v22];

      double v42 = [(ZWRootViewController *)self menuViewController];
      uint64_t v43 = [(ZWRootViewController *)self zoomMenuVisibilityChangedUnitTestCallback];
      [(ZWRootViewController *)self presentViewController:v42 animated:1 completion:v43];
    }
  }
}

- (void)_dismissMenuAnimated:(BOOL)a3
{
  double v4 = [(ZWRootViewController *)self presentedViewController];
  double v5 = [(ZWRootViewController *)self menuViewController];

  if (v4 == v5)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastMenuDismissalTime = v6;
    id v7 = [(ZWRootViewController *)self menuViewController];
    uint64_t v8 = [v7 presentingViewController];
    uint64_t v9 = [(ZWRootViewController *)self zoomMenuVisibilityChangedUnitTestCallback];
    [v8 dismissViewControllerAnimated:1 completion:v9];

    [(ZWRootViewController *)self _menuDidDisappear];
  }
}

- (void)_menuDidDisappear
{
  double v3 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__ZWRootViewController__menuDidDisappear__block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_sync(v3, block);

  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  double v4 = [(ZWRootViewController *)self menuViewController];
  double v5 = [v4 view];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v5);
}

__n128 __41__ZWRootViewController__menuDidDisappear__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 80;
  __n128 result = (__n128)CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGPoint *)(v1 + 96) = CGRectNull.origin;
  *(CGSize *)(v1 + 112) = size;
  return result;
}

- (void)willBeginAutopanningLensWithAutopanner:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__ZWRootViewController_willBeginAutopanningLensWithAutopanner___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __63__ZWRootViewController_willBeginAutopanningLensWithAutopanner___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) activeLensViewController];
    [v4 updateLensChromeAnimated:1];
  }
}

- (void)didFinishAutopanningLensWithAutopanner:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__ZWRootViewController_didFinishAutopanningLensWithAutopanner___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __63__ZWRootViewController_didFinishAutopanningLensWithAutopanner___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) activeLensViewController];
    [v4 updateLensChromeAnimated:1];
  }
}

- (void)autopanner:(id)a3 didAutopanByDelta:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__ZWRootViewController_autopanner_didAutopanByDelta___block_invoke;
  block[3] = &unk_78CD0;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __53__ZWRootViewController_autopanner_didAutopanByDelta___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 activeLensViewController];
    objc_msgSend(v4, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v5, 0, 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (BOOL)_inSpeakUnderFingerMode
{
  double v2 = +[AXSpeakFingerManager sharedInstance];
  if ([v2 speakFingerState] == (char *)&dword_0 + 1)
  {
    char v3 = 1;
  }
  else
  {
    id v4 = +[AXSpeakFingerManager sharedInstance];
    char v3 = [v4 speakFingerState] == &dword_4;
  }
  return v3;
}

- (void)_updateEventUIContextForSpeakFingerStateChange
{
  unsigned __int8 v3 = [(ZWRootViewController *)self _inSpeakUnderFingerMode];
  id v4 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __70__ZWRootViewController__updateEventUIContextForSpeakFingerStateChange__block_invoke;
  v5[3] = &unk_78B78;
  v5[4] = self;
  unsigned __int8 v6 = v3;
  dispatch_sync(v4, v5);
}

uint64_t __70__ZWRootViewController__updateEventUIContextForSpeakFingerStateChange__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) = *(_WORD *)(*(void *)(result + 32) + 376) & 0xFFFB | (4 * (*(unsigned char *)(result + 40) & 0x3F));
  return result;
}

- (void)toggleZoomMenu
{
  unsigned __int8 v3 = [(ZWRootViewController *)self presentedViewController];
  id v4 = [(ZWRootViewController *)self menuViewController];

  if (v3 == v4)
  {
    [(ZWRootViewController *)self _dismissMenuAnimated:1];
  }
  else
  {
    if ([(ZWRootViewController *)self isZoomSlugVisible])
    {
      id v5 = [(ZWRootViewController *)self slugViewController];
      id v6 = [v5 slugRingView];
    }
    else
    {
      id v6 = [(ZWRootViewController *)self view];
    }
    [(ZWRootViewController *)self _presentMenuWithAnchorView:v6 animated:1 ignoreCooldown:0];
  }
}

- (void)_handleSlugAction:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      if (!UIAccessibilityIsVoiceOverRunning())
      {
        double v17 = [(ZWRootViewController *)self presentedViewController];
        double v18 = [(ZWRootViewController *)self menuViewController];

        if (v17 == v18) {
          [(ZWRootViewController *)self _dismissMenuAnimated:1];
        }
        double v19 = +[AXSpeakFingerManager sharedInstance];
        double v20 = (char *)[v19 speakFingerState];

        id v21 = +[AXSpeakFingerManager sharedInstance];
        id v25 = v21;
        if (v20 == (unsigned char *)&dword_0 + 2) {
          [v21 speakUnderFingerModeStarted];
        }
        else {
          [v21 userManuallyExitedSpeakUnderFingerMode];
        }
        goto LABEL_31;
      }
      uint64_t v8 = +[AXSubsystemZoom sharedInstance];
      unsigned __int8 v9 = [v8 ignoreLogging];

      if ((v9 & 1) == 0)
      {
        double v10 = +[AXSubsystemZoom identifier];
        double v11 = AXLoggerForFacility();

        os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v11, v12))
        {
          double v13 = AXColorizeFormatLog();
          double v14 = _AXStringForArgs();
          if (os_log_type_enabled(v11, v12))
          {
            *(_DWORD *)buf = 138543362;
            double v27 = v14;
            _os_log_impl(&dword_0, v11, v12, "%{public}@", buf, 0xCu);
          }
        }
      }
      break;
    case 2:
      double v15 = [(ZWRootViewController *)self presentedViewController];
      BOOL v16 = [(ZWRootViewController *)self menuViewController];

      if (v15 == v16) {
        [(ZWRootViewController *)self _dismissMenuAnimated:1];
      }
      [(ZWRootViewController *)self _toggleZoomStandby];
      break;
    case 1:
      id v4 = [(ZWRootViewController *)self presentedViewController];
      id v5 = [(ZWRootViewController *)self menuViewController];

      if (v4 != v5)
      {
        id v6 = [(ZWRootViewController *)self activeLensViewController];
        id v7 = [(ZWRootViewController *)self pipLensViewController];
        if (v6 == v7)
        {
          uint64_t v22 = [(ZWRootViewController *)self pipLensViewController];
          unsigned int v23 = [v22 isInLensResizingMode];

          if (v23) {
            [(ZWRootViewController *)self toggleLensResizeModeWithMenuViewController:0];
          }
        }
        else
        {
        }
        id v25 = [(ZWRootViewController *)self slugViewController];
        double v24 = [v25 slugRingView];
        [(ZWRootViewController *)self _presentMenuWithAnchorView:v24 animated:1 ignoreCooldown:0];

LABEL_31:

        return;
      }
      [(ZWRootViewController *)self _dismissMenuAnimated:1];
      break;
    default:
      return;
  }
}

- (void)slugWasSingleTappedWithSlugViewController:(id)a3
{
  id v4 = +[AXSpeakFingerManager sharedInstance];
  id v5 = (char *)[v4 speakFingerState];

  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    id v6 = +[AXSettings sharedInstance];
    -[ZWRootViewController _handleSlugAction:](self, "_handleSlugAction:", [v6 zoomSlugSingleTapAction]);
  }
  else
  {
    [(ZWRootViewController *)self _handleSlugAction:3];
  }
}

- (void)slugWasDoubleTappedWithSlugViewController:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  -[ZWRootViewController _handleSlugAction:](self, "_handleSlugAction:", [v4 zoomSlugDoubleTapAction]);
}

- (void)slugWasTripleTappedWithSlugViewController:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  -[ZWRootViewController _handleSlugAction:](self, "_handleSlugAction:", [v4 zoomSlugTripleTapAction]);
}

- (void)zoomSlugViewController:(id)a3 didDragSlug:(id)a4 withDelta:(CGPoint)a5
{
}

- (BOOL)shouldBeginAutopanningLensWithSlugViewController:(id)a3
{
  unsigned __int8 v3 = [(ZWRootViewController *)self activeLensViewController];
  char v4 = [v3 inStandbyMode] ^ 1;

  return v4;
}

- (void)wantsToStartAutopannerWithSlugViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ZWRootViewController *)self lensAutopanner];
  [v5 setDataSource:v4];

  id v6 = [(ZWRootViewController *)self lensAutopanner];
  [v6 start];
}

- (void)wantsToStopAutopannerWithSlugViewController:(id)a3
{
  id v4 = [(ZWRootViewController *)self lensAutopanner];
  [v4 stop];

  id v5 = [(ZWRootViewController *)self lensAutopanner];
  [v5 setDataSource:0];

  [(ZWRootViewController *)self _updateSystemGestureDisablingAssertions];
}

- (BOOL)shouldShowSlugWithSlugViewController:(id)a3
{
  unsigned __int8 v3 = [(ZWRootViewController *)self activeLensViewController];
  char v4 = [v3 userIsMovingLens] ^ 1;

  return v4;
}

- (BOOL)attemptOrbZoomIfAppropriateWithSlugViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ZWRootViewController *)self activeLensViewController];
  unsigned int v6 = [v5 inStandbyMode];

  if (v6)
  {
    id v7 = [(ZWRootViewController *)self view];
    uint64_t v8 = [v4 view];
    [v8 center];
    objc_msgSend(v7, "zw_convertPointToScreenCoordinates:");
    double v10 = v9;
    double v12 = v11;

    double v13 = [(ZWRootViewController *)self screen];
    [v13 scale];
    double v15 = v10 * v14;

    BOOL v16 = [(ZWRootViewController *)self screen];
    [v16 scale];
    double v18 = v12 * v17;

    *((_WORD *)&self->_eventUIContext + 148) |= 0x800u;
    -[ZWRootViewController fullscreenEventHandler:didStartOrbAtLocation:](self, "fullscreenEventHandler:didStartOrbAtLocation:", 0, v15, v18);
  }

  return v6;
}

- (void)updateOrbZoomAtPoint:(CGPoint)a3 withSlugViewController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(ZWRootViewController *)self view];
  objc_msgSend(v7, "zw_convertPointToScreenCoordinates:", x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(ZWRootViewController *)self screen];
  [v12 scale];
  double v14 = v9 * v13;

  double v15 = [(ZWRootViewController *)self screen];
  [v15 scale];
  double v17 = v11 * v16;

  -[ZWRootViewController fullscreenEventHandler:updateOrbMovementAtLocation:](self, "fullscreenEventHandler:updateOrbMovementAtLocation:", 0, v14, v17);
}

- (void)endOrbZoomWithSlugViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ZWRootViewController *)self view];
  unsigned int v6 = [v4 view];

  [v6 center];
  objc_msgSend(v5, "zw_convertPointToScreenCoordinates:");
  double v8 = v7;
  double v10 = v9;

  double v11 = [(ZWRootViewController *)self screen];
  [v11 scale];
  double v13 = v8 * v12;

  double v14 = [(ZWRootViewController *)self screen];
  [v14 scale];
  double v16 = v10 * v15;

  *((_WORD *)&self->_eventUIContext + 148) &= ~0x800u;

  -[ZWRootViewController fullscreenEventHandler:didEndOrbAtLocation:](self, "fullscreenEventHandler:didEndOrbAtLocation:", 0, v13, v16);
}

- (void)zoomLensViewController:(id)a3 willBeginMovingLens:(id)a4
{
  self->_lensDeltaSinceInitialMove = CGPointZero;
}

- (void)zoomLensViewController:(id)a3 didMoveLens:(id)a4 withDelta:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v13 = a3;
  CGFloat v8 = y + self->_lensDeltaSinceInitialMove.y;
  self->_lensDeltaSinceInitialMove.double x = x + self->_lensDeltaSinceInitialMove.x;
  self->_lensDeltaSinceInitialMove.double y = v8;
  id v9 = [(ZWRootViewController *)self pipLensViewController];
  if (v9 == v13)
  {
    unsigned int v10 = [v13 isInLensResizingMode];

    if (v10)
    {
      if ([v13 activeResizeHandle] == (char *)&dword_0 + 1)
      {
        -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v13, 0, 1, x, y);
LABEL_10:
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
        goto LABEL_12;
      }
LABEL_9:
      -[ZWRootViewController _resizeZoomLensByDelta:](self, "_resizeZoomLensByDelta:", x, y);
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v11 = [(ZWRootViewController *)self dockedLensViewController];
  if (v11 == v13)
  {
    unsigned int v12 = [v13 isInDockResizingMode];

    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

LABEL_11:
  -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v13, 0, 1, x, y);
LABEL_12:
}

- (BOOL)shouldHideGrabbersWithZoomLensViewController:(id)a3
{
  return [(ZWKeyboardContext *)self->_kbContext isKeyboardVisible];
}

- (void)zoomLensViewController:(id)a3 grabberDidReceiveTap:(id)a4
{
}

- (void)dockedLensViewController:(id)a3 toggleButtonDidReceiveLongPress:(id)a4
{
}

- (void)dockedLensViewController:(id)a3 zoomRegionVisibilityWasChanged:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __80__ZWRootViewController_dockedLensViewController_zoomRegionVisibilityWasChanged___block_invoke;
  v8[3] = &unk_78B78;
  void v8[4] = self;
  BOOL v9 = v4;
  dispatch_sync(v6, v8);

  double v7 = [(ZWRootViewController *)self axuiService];
  [v7 notifyOtherDisplaysOfDockedZoomRegionVisibilityChange:v4];
}

uint64_t __80__ZWRootViewController_dockedLensViewController_zoomRegionVisibilityWasChanged___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) = *(_WORD *)(*(void *)(result + 32) + 376) & 0xFFBF | ((*(unsigned char *)(result + 40) & 3) << 6);
  return result;
}

- (void)handleWasDraggedWithDockedLensViewController:(id)a3
{
}

- (void)doneResizingDockWithDockedLensViewController:(id)a3
{
}

- (BOOL)userIsInteractingWithSlugWithDockedLensViewController:(id)a3
{
  unsigned __int8 v3 = [(ZWRootViewController *)self slugViewController];
  unsigned __int8 v4 = [v3 userIsInteractingWithSlug];

  return v4;
}

- (BOOL)isZoomMovingWithVelocityWithDockedLensViewController:(id)a3
{
  return self->_fullScreenZoomVelocity > 0.0;
}

- (void)updateDockedZoomRegionVisibility:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(ZWRootViewController *)self dockedLensViewController];
  unsigned int v6 = [v5 zoomRegionVisible];

  if (v6 != v3)
  {
    id v7 = [(ZWRootViewController *)self dockedLensViewController];
    [v7 toggleZoomRegionVisibility];
  }
}

- (void)dismissMenuWithMenuViewController:(id)a3
{
}

- (void)menuViewController:(id)a3 finishedAdjustingZoomFactor:(double)a4
{
  id v7 = a3;
  if (![(ZWRootViewController *)self _isZoomFactorAtMinimum:a4])
  {
    unsigned int v6 = +[ZWCoalescedSettings sharedInstance];
    [v6 setZoomFactor:a4];
  }
  [(ZWRootViewController *)self menuViewController:v7 adjustZoomFactor:0 animated:a4];
}

- (void)menuViewController:(id)a3 adjustZoomFactor:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  -[ZWRootViewController _updateZoomFactor:animated:](self, "_updateZoomFactor:animated:", a5);
  id v14 = [(ZWRootViewController *)self activeLensViewController];
  id v8 = [(ZWRootViewController *)self dockedLensViewController];
  if (v14 == v8)
  {
    BOOL v9 = [(ZWRootViewController *)self dockedLensViewController];
    unsigned int v10 = [v9 zoomRegionVisible];

    if (!v10) {
      return;
    }
    id v14 = [(ZWRootViewController *)self dockedLensViewController];
    id v8 = [(ZWRootViewController *)self dockedLensViewController];
    [v8 zoomPanOffset];
    if (v5) {
      double v13 = 0.3;
    }
    else {
      double v13 = -1.0;
    }
    objc_msgSend(v14, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v5, 0, a4, v11, v12, v13);
  }
}

- (void)menuViewController:(id)a3 didChooseLensEffect:(id)a4
{
  id v17 = a4;
  BOOL v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 zoomCurrentLensEffect];
  unsigned __int8 v7 = [v6 isEqualToString:v17];

  if ((v7 & 1) == 0)
  {
    id v8 = +[AXSettings sharedInstance];
    [v8 setZoomCurrentLensEffect:v17];
  }
  BOOL v9 = [(ZWRootViewController *)self activeLensViewController];
  if ([v9 inStandbyMode])
  {
    unsigned int v10 = [(ZWRootViewController *)self activeLensViewController];
    pipLensViewController = self->_pipLensViewController;

    if (v10 == pipLensViewController)
    {
      double v12 = [(ZWRootViewController *)self activeLensViewController];
      [(ZWRootViewController *)self zoomFactor];
      double v14 = v13;
      [(ZWRootViewController *)self zoomPanOffset];
      objc_msgSend(v12, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v17, 1, 0, v14, v15, v16);
      goto LABEL_8;
    }
  }
  else
  {
  }
  double v12 = [(ZWRootViewController *)self activeLensViewController];
  [v12 updateLensEffect:v17 animated:1 completion:0];
LABEL_8:
}

- (void)menuViewController:(id)a3 didChooseZoomMode:(id)a4 withCompletion:(id)a5
{
  id v11 = a4;
  unsigned int v6 = (void (**)(void))a5;
  unsigned __int8 v7 = +[AXSettings sharedInstance];
  id v8 = [v7 zoomCurrentLensMode];
  unsigned __int8 v9 = [v8 isEqualToString:v11];

  if ((v9 & 1) == 0)
  {
    unsigned int v10 = +[AXSettings sharedInstance];
    [v10 setZoomCurrentLensMode:v11];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)menuViewController:(id)a3 didChooseDockPosition:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = [(ZWRootViewController *)self dockedLensViewController];
  [v9 setDockPositionIsTransitioning:1];

  +[CATransaction begin];
  +[CATransaction setCompletionBlock:v8];

  unsigned int v10 = +[AXSettings sharedInstance];
  id v11 = [v10 zoomPreferredCurrentDockPosition];
  unsigned __int8 v12 = [v11 isEqualToString:v7];

  if ((v12 & 1) == 0)
  {
    double v13 = [(ZWRootViewController *)self activeLensViewController];
    unsigned __int8 v14 = [v13 inStandbyMode];

    if (v14)
    {
      double v15 = [(ZWRootViewController *)self dockedLensViewController];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_5;
      v28[3] = &unk_78CA8;
      v28[4] = self;
      [v15 transitionToDockPosition:v7 completion:v28];
    }
    else
    {
      double v16 = [(ZWRootViewController *)self activeLensViewController];
      id v17 = [(ZWRootViewController *)self activeLensViewController];
      [v17 zoomFactor];
      double v19 = v18;
      double v20 = [(ZWRootViewController *)self activeLensViewController];
      [v20 zoomPanOffset];
      double v22 = v21;
      double v24 = v23;
      id v25 = +[AXSettings sharedInstance];
      double v26 = [v25 zoomCurrentLensEffect];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke;
      v29[3] = &unk_79118;
      v29[4] = self;
      id v30 = v7;
      objc_msgSend(v16, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, v26, 1, v29, v19, v22, v24);

      double v15 = v30;
    }

    double v27 = +[AXSettings sharedInstance];
    [v27 setZoomPreferredCurrentDockPosition:v7];
  }
  +[CATransaction commit];
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  double v2 = [*(id *)(a1 + 32) dockedLensViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_2;
  v4[3] = &unk_78CA8;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 transitionToDockPosition:v3 completion:v4];
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  uint64_t v3 = [*(id *)(a1 + 32) activeLensViewController];
  [v3 zoomFactor];
  double v5 = v4;
  unsigned int v6 = [*(id *)(a1 + 32) activeLensViewController];
  [v6 zoomPanOffset];
  double v8 = v7;
  double v10 = v9;
  id v11 = +[AXSettings sharedInstance];
  unsigned __int8 v12 = [v11 zoomCurrentLensEffect];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_3;
  v13[3] = &unk_78CA8;
  v13[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v12, 1, v13, v5, v8, v10);
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) dockedLensViewController];
  [v2 setDockPositionIsTransitioning:0];

  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v3 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_4;
  block[3] = &unk_78CA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  [v2 setDockPositionIsTransitioning:0];

  uint64_t v3 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_6;
  block[3] = &unk_78CA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

- (BOOL)toggleSlugVisibilityWithMenuViewController:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 zoomShouldShowSlug] ^ 1;
  [v3 setZoomShouldShowSlug:v4];

  return v4;
}

- (BOOL)togglePeekZoomWithMenuViewController:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 zoomPeekZoomEnabled] ^ 1;
  [v3 setZoomPeekZoomEnabled:v4];

  return v4;
}

- (void)_exitStandbyIfNecessary
{
  uint64_t v3 = +[ZWCoalescedSettings sharedInstance];
  unsigned int v4 = [v3 zoomInStandby];

  if (v4)
  {
    double v5 = [(ZWRootViewController *)self activeLensViewController];
    unsigned int v6 = +[ZWCoalescedSettings sharedInstance];
    [v6 zoomFactor];
    double v8 = v7;
    [(ZWRootViewController *)self zoomPanOffset];
    double v10 = v9;
    double v12 = v11;
    double v13 = +[AXSettings sharedInstance];
    unsigned __int8 v14 = [v13 zoomCurrentLensEffect];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __47__ZWRootViewController__exitStandbyIfNecessary__block_invoke;
    v15[3] = &unk_78CA8;
    v15[4] = self;
    objc_msgSend(v5, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v14, 1, v15, v8, v10, v12);
  }
}

id __47__ZWRootViewController__exitStandbyIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)toggleLensVisibilityWithMenuViewController:(id)a3
{
  [(ZWRootViewController *)self zoomPanOffset];
  double v5 = v4;
  double v7 = v6;
  double v8 = +[ZWCoalescedSettings sharedInstance];
  [v8 zoomFactor];
  double v10 = v9;

  [(ZWRootViewController *)self _dismissMenuAnimated:1];
  double v11 = +[AXSettings sharedInstance];
  double v12 = [v11 zoomCurrentLensEffect];

  double v13 = +[ZWCoalescedSettings sharedInstance];
  unsigned int v14 = [v13 zoomInStandby];

  uint64_t v15 = v14 ^ 1;
  double v16 = +[ZWCoalescedSettings sharedInstance];
  [v16 setZoomInStandby:v15];

  [(ZWRootViewController *)self setZoomFactor:v10];
  id v17 = [(ZWRootViewController *)self activeLensViewController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __67__ZWRootViewController_toggleLensVisibilityWithMenuViewController___block_invoke;
  v19[3] = &unk_78CA8;
  void v19[4] = self;
  objc_msgSend(v17, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", v15, v12, 1, v19, v10, v5, v7);

  double v18 = [(ZWRootViewController *)self kbContext];
  [v18 keyboardFrame];
  -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:");
}

id __67__ZWRootViewController_toggleLensVisibilityWithMenuViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)toggleLensResizeModeWithMenuViewController:(id)a3
{
  [(ZWRootViewController *)self _dismissMenuAnimated:1];
  double v4 = [(ZWRootViewController *)self activeLensViewController];
  double v5 = [(ZWRootViewController *)self pipLensViewController];

  if (v4 == v5)
  {
    double v6 = [(ZWRootViewController *)self pipLensViewController];
    uint64_t v7 = [v6 isInLensResizingMode] ^ 1;

    [(ZWRootViewController *)self _setPIPLensResizingEnabled:v7];
    [(ZWRootViewController *)self _exitStandbyIfNecessary];
  }
}

- (BOOL)inFullscreenModeForMenuViewController:(id)a3
{
  uint64_t v3 = self;
  double v4 = [(ZWRootViewController *)self activeLensViewController];
  double v5 = [(ZWRootViewController *)v3 fullscreenLensViewController];
  LOBYTE(v3) = v4 == v5;

  return (char)v3;
}

- (BOOL)inPIPModeForMenuViewController:(id)a3
{
  uint64_t v3 = self;
  double v4 = [(ZWRootViewController *)self activeLensViewController];
  double v5 = [(ZWRootViewController *)v3 pipLensViewController];
  LOBYTE(v3) = v4 == v5;

  return (char)v3;
}

- (BOOL)inDockedModeForMenuViewController:(id)a3
{
  uint64_t v3 = self;
  double v4 = [(ZWRootViewController *)self activeLensViewController];
  double v5 = [(ZWRootViewController *)v3 dockedLensViewController];
  LOBYTE(v3) = v4 == v5;

  return (char)v3;
}

- (BOOL)inStandByForMenuViewController:(id)a3
{
  uint64_t v3 = [(ZWRootViewController *)self activeLensViewController];
  unsigned __int8 v4 = [v3 inStandbyMode];

  return v4;
}

- (double)zoomFactorForMenuViewController:(id)a3
{
  unsigned __int8 v4 = [(ZWRootViewController *)self activeLensViewController];
  unsigned int v5 = [v4 inStandbyMode];

  if (v5) {
    return AXZoomMinimumZoomLevel;
  }

  [(ZWRootViewController *)self zoomFactor];
  return result;
}

- (void)menuDidAppear:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  double v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = __38__ZWRootViewController_menuDidAppear___block_invoke;
  double v11 = &unk_79118;
  double v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v8);

  LODWORD(v5) = UIAccessibilityLayoutChangedNotification;
  uint64_t v7 = objc_msgSend(v6, "view", v8, v9, v10, v11, v12);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v7);

  [(ZWRootViewController *)self _setPIPLensResizingEnabled:0];
  [(ZWRootViewController *)self _setDockResizingEnabled:0];
}

void __38__ZWRootViewController_menuDidAppear___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)(*(void *)(a1 + 32) + 80);
  id v6 = [*(id *)(a1 + 40) view];
  objc_msgSend(v6, "zw_convertBoundsToScreenCoordinates");
  v1[12] = v2;
  v1[13] = v3;
  v1[14] = v4;
  v1[15] = v5;
}

- (void)externalClientSetZoomFactor:(double)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke;
  v7[3] = &unk_78E40;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  uint64_t v4 = objc_retainBlock(v7);
  uint64_t v5 = v4;
  if (self->_inUnitTestingMode)
  {
    ((void (*)(void *))v4[2])(v4);
  }
  else
  {
    id v6 = v4;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

id __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) zoomFactorRespectingUserPreferredMaximumZoom:*(double *)(a1 + 40)];
  double v3 = v2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isZoomFactorAtMinimum:") & 1) == 0)
  {
    uint64_t v4 = +[ZWCoalescedSettings sharedInstance];
    [v4 setZoomFactor:v3];
  }
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 menuViewController:0 adjustZoomFactor:1 animated:v3];
}

uint64_t __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)externalClientSetZoomPanOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(ZWRootViewController *)self zoomPanOffset];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke;
  v11[3] = &unk_78CD0;
  v11[4] = self;
  *(double *)&void v11[5] = x - v6;
  *(double *)&void v11[6] = y - v7;
  double v8 = objc_retainBlock(v11);
  uint64_t v9 = v8;
  if (self->_inUnitTestingMode)
  {
    ((void (*)(void *))v8[2])(v8);
  }
  else
  {
    double v10 = v8;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 activeLensViewController];
    objc_msgSend(v4, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v5, 1, 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

uint64_t __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)externalClientWantsToAutopan:(CGPoint)a3 withPanningStyle:(unint64_t)a4
{
  id v5 = [(ZWRootViewController *)self activeLensViewController];
  unsigned __int8 v6 = [v5 inStandbyMode];

  if ((v6 & 1) == 0)
  {
    [(ZWRootViewController *)self zoomFrame];
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __70__ZWRootViewController_externalClientWantsToAutopan_withPanningStyle___block_invoke(uint64_t a1)
{
  double v62 = 0.0;
  uint64_t v2 = *(void *)(a1 + 40);
  switch(v2)
  {
    case 0:
      double v7 = *(void **)(a1 + 32);
      [v7 zoomFactor];
      objc_msgSend(v7, "zoomFrameForPanningContinuouslyToPoint:zoomFactor:", *(double *)(a1 + 48), *(double *)(a1 + 56), v8);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      id v17 = [*(id *)(a1 + 32) activeLensViewController];
      double v18 = [*(id *)(a1 + 32) dockedLensViewController];

      if (v17 != v18)
      {
        double v19 = [*(id *)(a1 + 32) view];
        double v20 = [v19 window];
        double v21 = [*(id *)(a1 + 32) view];
        double v22 = [v21 window];
        objc_msgSend(v22, "convertRect:fromWindow:", 0, v10, v12, v14, v16);
        objc_msgSend(v20, "_convertRectToSceneReferenceSpace:");
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;

        double v31 = *(void **)(a1 + 32);
        double v32 = v24;
        double v33 = v26;
        double v34 = v28;
        double v35 = v30;
        uint64_t v36 = 0;
LABEL_10:
        objc_msgSend(v31, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 1, v36, 0, 0, v32, v33, v34, v35);
        break;
      }
      AX_CGRectGetCenter();
      CGRect v55 = *(void **)(a1 + 32);
LABEL_13:
      objc_msgSend(v55, "_physicalScreenPointForVirtualScreenPoint:", v53, v54);
      double v57 = v56;
      double v59 = v58;
      double v60 = [*(id *)(a1 + 32) dockedLensViewController];
      objc_msgSend(v60, "moveDockedZoomToPhysicalScreenPoint:animated:", 0, v57, v59);

      break;
    case 1:
      double v37 = *(double *)(a1 + 48);
      double v38 = *(double *)(a1 + 56);
      double v39 = [*(id *)(a1 + 32) activeLensViewController];
      double v40 = [*(id *)(a1 + 32) dockedLensViewController];

      if (v39 != v40)
      {
        double v41 = [*(id *)(a1 + 32) view];
        double v42 = [v41 window];
        uint64_t v43 = [*(id *)(a1 + 32) view];
        double v44 = [v43 window];
        objc_msgSend(v44, "convertRect:fromWindow:", 0, v37 + -1.0, v38 + -1.0, 2.0, 2.0);
        objc_msgSend(v42, "_convertRectToSceneReferenceSpace:");
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;

        double v31 = *(void **)(a1 + 32);
        double v32 = v46;
        double v33 = v48;
        double v34 = v50;
        double v35 = v52;
        uint64_t v36 = 1;
        goto LABEL_10;
      }
      CGRect v55 = *(void **)(a1 + 32);
      double v53 = *(double *)(a1 + 48);
      double v54 = *(double *)(a1 + 56);
      goto LABEL_13;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_normalizePoint:withRespectToFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      double v4 = v3;
      double v6 = v5;
      if (objc_msgSend(*(id *)(a1 + 32), "fullscreenEventHandler:autopanShouldStartWithPoint:speedFactor:initialSingleFingerLocation:fingerCount:pointHasBeenMapped:", 0, &v62, 1, v3, v5, v3, v5, 1.0))objc_msgSend(*(id *)(a1 + 32), "fullscreenEventHandler:autopanWithLocation:initialSingleFingerLocation:distance:animationDuration:useGutterDistance:pointHasBeenMapped:", 0, 0, 1, v4, {
          v6,
      }
          v4,
          v6,
          v62 * 4.0,
          0.0166666675);
      break;
  }
  double v61 = [*(id *)(a1 + 32) activeLensViewController];
  [v61 zoomMovementDidEnd];
}

- (CGRect)zoomFrameForPanningContinuouslyToPoint:(CGPoint)a3 zoomFactor:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(ZWRootViewController *)self activeLensViewController];
  unsigned __int8 v9 = [v8 inStandbyMode];
  double v10 = 1.0;
  if ((v9 & 1) == 0) {
    [(ZWRootViewController *)self zoomFactor];
  }
  double v11 = v10 / a4;

  [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
  double v13 = v12;
  double v15 = v14;
  [(ZWRootViewController *)self zoomFrame];
  double v17 = v11 * v16;
  double v19 = v11 * v18;
  double v20 = x + -x / v13 * v17;
  double v21 = y + -y / v15 * v19;
  result.size.double height = v19;
  result.size.double width = v17;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- ($2F34F6A4A708D3F7715AC605E075D30F)currentUIContextForEventProcessor:(SEL)a3
{
  id v6 = a4;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x15010000000;
  double v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  if (self->_inStandbyForFluidSwitcherGesture)
  {
    double v7 = [(ZWRootViewController *)self cachedValuesSerialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke;
    block[3] = &unk_792B8;
    void block[4] = self;
    void block[5] = &v13;
    dispatch_sync(v7, block);
  }
  else
  {
    double v8 = [(ZWRootViewController *)self cachedValuesSerialQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke_2;
    v11[3] = &unk_792B8;
    v11[4] = self;
    void v11[5] = &v13;
    dispatch_sync(v8, v11);

    unsigned __int8 v9 = v14;
    if ((v14[41] & 0x80) != 0)
    {
      *(CGPoint *)(v14 + 39) = CGPointZero;
      v9[20] = AXZoomMinimumZoomLevel;
    }
  }
  memcpy(retstr, v14 + 4, sizeof($2F34F6A4A708D3F7715AC605E075D30F));
  _Block_object_dispose(&v13, 8);

  return result;
}

void *__58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke(uint64_t a1)
{
  return memcpy((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), (const void *)(*(void *)(a1 + 32) + 384), 0x130uLL);
}

void *__58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke_2(uint64_t a1)
{
  return memcpy((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), (const void *)(*(void *)(a1 + 32) + 80), 0x130uLL);
}

- (int64_t)currentInterfaceOrientationForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __69__ZWRootViewController_currentInterfaceOrientationForEventProcessor___block_invoke;
  v8[3] = &unk_792B8;
  void v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(v5, v8);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __69__ZWRootViewController_currentInterfaceOrientationForEventProcessor___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (CGSize)currentScreenSizeForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x3010000000;
  double v14 = "";
  CGSize v15 = CGSizeZero;
  double v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __59__ZWRootViewController_currentScreenSizeForEventProcessor___block_invoke;
  v10[3] = &unk_792B8;
  v10[4] = self;
  void v10[5] = &v11;
  dispatch_sync(v5, v10);

  double v6 = v12[4];
  double v7 = v12[5];
  _Block_object_dispose(&v11, 8);

  double v8 = v6;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

__n128 __59__ZWRootViewController_currentScreenSizeForEventProcessor___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 96);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (unsigned)currentWindowContextIdForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  double v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __64__ZWRootViewController_currentWindowContextIdForEventProcessor___block_invoke;
  v7[3] = &unk_792B8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  LODWORD(self) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return self;
}

uint64_t __64__ZWRootViewController_currentWindowContextIdForEventProcessor___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 88);
  return result;
}

- (unsigned)currentDisplayIdForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  double v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __58__ZWRootViewController_currentDisplayIdForEventProcessor___block_invoke;
  v7[3] = &unk_792B8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  LODWORD(self) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return self;
}

uint64_t __58__ZWRootViewController_currentDisplayIdForEventProcessor___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 92);
  return result;
}

- (void)eventProcessor:(id)a3 didGetFirstTouchAtLocation:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__ZWRootViewController_eventProcessor_didGetFirstTouchAtLocation___block_invoke;
  block[3] = &unk_78CD0;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __66__ZWRootViewController_eventProcessor_didGetFirstTouchAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) idleTouchTimer];
  [v2 cancel];

  double v3 = [*(id *)(a1 + 32) slugViewController];
  id v4 = [*(id *)(a1 + 32) slugViewController];
  CGPoint v5 = [v4 view];
  objc_msgSend(v5, "zw_convertPointFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v3, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");

  double v6 = [*(id *)(a1 + 32) activeLensViewController];
  double v7 = [*(id *)(a1 + 32) activeLensViewController];
  uint64_t v8 = [v7 view];
  objc_msgSend(v8, "zw_convertPointFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v6, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");

  id v11 = [*(id *)(a1 + 32) menuViewController];
  double v9 = [*(id *)(a1 + 32) menuViewController];
  uint64_t v10 = [v9 view];
  objc_msgSend(v10, "zw_convertPointFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v11, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");
}

- (void)eventProcessor:(id)a3 didGetTouchInSpeakFingerMode:(CGPoint)a4 firstTouchWentIntoLens:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  double v9 = [(ZWRootViewController *)self activeLensViewController];
  uint64_t v10 = [(ZWRootViewController *)self pipLensViewController];
  if (v9 != v10 || v5)
  {

    goto LABEL_7;
  }
  id v11 = [(ZWRootViewController *)self activeLensViewController];
  unsigned __int8 v12 = [v11 inStandbyMode];

  if ((v12 & 1) == 0)
  {
    [(ZWRootViewController *)self _determineSuitableLensFrame];
    v21.double x = x;
    v21.double y = y;
    if (!CGRectContainsPoint(v22, v21))
    {
      self->_pipWasOnBeforeSpeakFingerStarted = 1;
      uint64_t v13 = +[AXSettings sharedInstance];
      double v9 = [v13 zoomCurrentLensEffect];

      double v14 = [(ZWRootViewController *)self activeLensViewController];
      [(ZWRootViewController *)self zoomFactor];
      double v16 = v15;
      [(ZWRootViewController *)self zoomPanOffset];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __91__ZWRootViewController_eventProcessor_didGetTouchInSpeakFingerMode_firstTouchWentIntoLens___block_invoke;
      v20[3] = &unk_78CA8;
      v20[4] = self;
      objc_msgSend(v14, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, v9, 0, v20, v16, v17, v18);

LABEL_7:
    }
  }
  long long v19 = +[AXSpeakFingerManager sharedInstance];
  objc_msgSend(v19, "speakElementAtLocation:", x, y);
}

id __91__ZWRootViewController_eventProcessor_didGetTouchInSpeakFingerMode_firstTouchWentIntoLens___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertionsForFullscreenZoom];
}

- (BOOL)eventProcessor:(id)a3 didGetWheelEventWithDelta:(int64_t)a4
{
  [(ZWRootViewController *)self zoomFactor];
  if (v6 <= AXZoomMinimumZoomLevel)
  {
    unsigned int v8 = 0;
  }
  else
  {
    double v7 = [(ZWRootViewController *)self activeLensViewController];
    unsigned int v8 = [v7 inStandbyMode] ^ 1;
  }
  BOOL v9 = self->_snarfingWheelEventsForZoom
    || (char *)[(ZWRootViewController *)self lastKeyboardCommand] == (char *)&dword_C + 2;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke;
  v22[3] = &unk_78CA8;
  v22[4] = self;
  uint64_t v10 = objc_retainBlock(v22);
  if (v8)
  {
    BOOL v11 = !self->_snarfingWheelEventsForPan && !v9;
    if (!v11 && ![(ZWRootViewController *)self carouselLockActive]) {
      goto LABEL_15;
    }
  }
  if (!self->_inUnitTestingMode)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_2;
    block[3] = &unk_78CF8;
    CGPoint v21 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    if (v9) {
      goto LABEL_15;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  ((void (*)(void *))v10[2])(v10);
  if (!v9) {
    goto LABEL_18;
  }
LABEL_15:
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_3;
  v18[3] = &unk_794C0;
  BOOL v19 = v9;
  v18[4] = self;
  v18[5] = a4;
  unsigned __int8 v12 = objc_retainBlock(v18);
  uint64_t v13 = v12;
  if (self->_inUnitTestingMode)
  {
    ((void (*)(void *))v12[2])(v12);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_4;
    v16[3] = &unk_78CF8;
    double v17 = v12;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
  }
  BOOL v14 = 1;
LABEL_21:

  return v14;
}

uint64_t __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 896) = 0;
  return result;
}

uint64_t __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    [v3 _handleZoomWheelEventWithDelta:v4];
  }
  else {
    [v3 _handlePanWheelEventWithDelta:v4];
  }
  [*(id *)(a1 + 32) sendUserEventOccurred];
  BOOL v5 = *(void **)(a1 + 32);

  return [v5 _updateMinimapStatus];
}

uint64_t __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eventProcessor:(id)a3 didGetPanEventWithDelta:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __63__ZWRootViewController_eventProcessor_didGetPanEventWithDelta___block_invoke;
  v4[3] = &unk_78E40;
  v4[4] = self;
  void v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id __63__ZWRootViewController_eventProcessor_didGetPanEventWithDelta___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) snarfingWheelEventsForPan];
  [*(id *)(a1 + 32) setSnarfingWheelEventsForPan:1];
  [*(id *)(a1 + 32) _handlePanWheelEventWithDelta:*(void *)(a1 + 40) animated:1 animationDuration:0.3];
  [*(id *)(a1 + 32) sendUserEventOccurred];
  [*(id *)(a1 + 32) _updateMinimapStatus];
  double v3 = *(void **)(a1 + 32);

  return [v3 setSnarfingWheelEventsForPan:v2];
}

- (void)eventProcessor:(id)a3 didReceiveKeyboardEventWithCommand:(int64_t)a4
{
}

id __74__ZWRootViewController_eventProcessor_didReceiveKeyboardEventWithCommand___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeyboardCommand:*(void *)(a1 + 40) isRepeatCommand:0];
}

- (void)moveCursorToCurrentFakeCursorLocation
{
  double v3 = [(ZWRootViewController *)self fakeLaserVC];
  uint64_t v4 = [v3 fingerController];
  BOOL v5 = [v4 fingerContainerView];
  double v6 = [(ZWRootViewController *)self fakeLaserVC];
  double v7 = [v6 fingerController];
  unsigned int v8 = [v7 fingerModels];
  BOOL v9 = [v8 firstObject];
  [v9 location];
  objc_msgSend(v5, "convertPoint:toView:", 0);
  double v11 = v10;
  double v13 = v12;

  -[ZWRootViewController _virtualScreenPointForPhysicalScreenPoint:](self, "_virtualScreenPointForPhysicalScreenPoint:", v11, v13);
  double v15 = v14;
  double v17 = v16;
  id v22 = +[BKSMousePointerService sharedInstance];
  id v18 = objc_alloc((Class)BKSContextRelativePoint);
  BOOL v19 = [(ZWRootViewController *)self view];
  long long v20 = [v19 window];
  id v21 = objc_msgSend(v18, "initWithPoint:contextID:", objc_msgSend(v20, "_contextId"), v15, v17);
  [v22 setContextRelativePointerPosition:v21 onDisplay:0 withAnimationParameters:0 restrictingToPID:0xFFFFFFFFLL];
}

- (void)eventProcessor:(id)a3 didGetPointerEventAtLocation:(CGPoint)a4 withEventRep:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  AXPerformBlockOnMainThread();
}

void __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke(uint64_t a1)
{
  if (ZWLaserIsEnabled())
  {
    v131 = [*(id *)(a1 + 32) pointerControllerInfo];
    [v131 pointerButtonMask];
    if (v2 <= 0.0)
    {
      [v131 pointerButtonClickCount];
      BOOL v3 = v4 > 0.0;
    }
    else
    {
      BOOL v3 = 1;
    }
    uint64_t v137 = 0;
    v138 = &v137;
    uint64_t v139 = 0x2020000000;
    char v140 = 0;
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(NSObject **)(v5 + 1152);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_2;
    block[3] = &unk_792B8;
    void block[4] = v5;
    void block[5] = &v137;
    dispatch_sync(v6, block);
    BOOL v130 = v3;
    if (!v3)
    {
      double v7 = [*(id *)(a1 + 40) redirectPointerAssertion];
      if (v7
        && ([*(id *)(a1 + 40) redirectPointerLocation], vabdd_f64(v8, *(double *)(a1 + 48)) < 0.001))
      {
        [*(id *)(a1 + 40) redirectPointerLocation];
        BOOL v10 = vabdd_f64(v9, *(double *)(a1 + 56)) < 0.001;

        if (v10)
        {
LABEL_84:
          _Block_object_dispose(&v137, 8);

          return;
        }
      }
      else
      {
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setLastPointerLocation:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    if (!v130) {
      goto LABEL_17;
    }
    if (!*((unsigned char *)v138 + 24))
    {
      double v11 = [*(id *)(a1 + 40) presentedViewController];
      double v12 = [*(id *)(a1 + 40) menuViewController];
      BOOL v13 = v11 == v12;

      if (v13) {
        [*(id *)(a1 + 40) _dismissMenuAnimated:1];
      }
    }
    double v14 = *(double *)(a1 + 48);
    double v15 = *(double *)(a1 + 56);
    double v16 = [*(id *)(a1 + 40) redirectPointerAssertion];
    BOOL v17 = v16 == 0;

    if (v17)
    {
LABEL_17:
      objc_msgSend(*(id *)(a1 + 40), "_physicalScreenPointForVirtualScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      double v14 = v18;
      double v15 = v19;
      int v129 = 0;
    }
    else
    {
      int v129 = 1;
    }
    long long v20 = [*(id *)(a1 + 40) view];
    id v21 = [v20 window];
    id v22 = objc_msgSend(v21, "hitTest:withEvent:", 0, v14, v15);

    double v23 = v15;
    double v24 = v14;
    for (id i = *(id *)(a1 + 40); ; id i = (id)v28)
    {
      long long v26 = [i presentedViewController];
      BOOL v27 = v26 == 0;

      if (v27) {
        break;
      }
      uint64_t v28 = [i presentedViewController];
    }
    if (i == *(id *)(a1 + 40)) {
      long long v29 = 0;
    }
    else {
      long long v29 = i;
    }
    id v30 = v29;

    v134[0] = _NSConcreteStackBlock;
    v134[1] = 3221225472;
    v134[2] = __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_3;
    v134[3] = &unk_794E8;
    v134[4] = *(void *)(a1 + 40);
    id v31 = v30;
    id v135 = v31;
    long long v32 = [v22 _accessibilityFindAncestor:v134 startWithSelf:1];
    if (v32)
    {
      long long v33 = [*(id *)(a1 + 40) slugViewController];
      long long v34 = [v33 view];
      long long v35 = v32;
      if (v32 != v34)
      {
        uint64_t v36 = [v31 view];
        if (v32 != v36)
        {
          if (v130)
          {
            BOOL v37 = *((unsigned char *)v138 + 24) == 0;

            if (v37)
            {
              if (*((unsigned char *)v138 + 24))
              {
                BOOL v38 = 0;
                goto LABEL_68;
              }
              goto LABEL_59;
            }
LABEL_36:
            double v39 = [*(id *)(a1 + 40) lastHoveredView];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              double v41 = [*(id *)(a1 + 40) lastHoveredView];
              [v41 setHighlighted:0];
            }
            double v42 = [v31 view];
            if (v32) {
              BOOL v43 = v32 == v42;
            }
            else {
              BOOL v43 = 0;
            }
            int v44 = v43;

            if (v44)
            {
              double v45 = [v22 _accessibilityFindAncestor:&__block_literal_global_6 startWithSelf:1];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v45 setHighlighted:1];
                id v46 = v45;

                id v22 = v46;
              }
              double v47 = [v31 view];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v48 = [v47 contentView];

                double v47 = (void *)v48;
              }
              double v49 = [*(id *)(a1 + 40) fakeLaserVC];
              id v50 = [v49 parentViewController];
              BOOL v51 = v50 == v31;

              if (!v51)
              {
                double v52 = [*(id *)(a1 + 40) fakeLaserVC];
                double v53 = [v52 view];
                [v53 removeFromSuperview];

                double v54 = [*(id *)(a1 + 40) fakeLaserVC];
                [v54 removeFromParentViewController];

                CGRect v55 = [*(id *)(a1 + 40) fakeLaserVC];
                [v31 addChildViewController:v55];

                double v56 = [*(id *)(a1 + 40) fakeLaserVC];
                double v57 = [v56 view];
                [v47 addSubview:v57];

                double v58 = [*(id *)(a1 + 40) fakeLaserVC];
                [v58 didMoveToParentViewController:v31];

                double v59 = [*(id *)(a1 + 40) fakeLaserVC];
                double v60 = [v59 view];
                [v47 bringSubviewToFront:v60];
              }
              double v61 = [*(id *)(a1 + 40) view];
              objc_msgSend(v61, "convertPoint:toView:", v47, v14, v15);
              double v14 = v62;
              double v15 = v63;
            }
            else
            {
              double v64 = [*(id *)(a1 + 40) fakeLaserVC];
              double v65 = [v64 parentViewController];
              BOOL v66 = v65 == *(void **)(a1 + 40);

              if (v66)
              {
LABEL_55:
                double v78 = [*(id *)(a1 + 40) hidePointerAssertion];
                BOOL v79 = v78 == 0;

                if (v79)
                {
                  id v80 = [*(id *)(*(void *)(a1 + 40) + 1200) persistentlyHidePointerAssertionForReason:3];
                  [*(id *)(a1 + 40) setHidePointerAssertion:v80];
                }
                BOOL v81 = [*(id *)(a1 + 40) redirectPointerAssertion];
                v82 = +[BKSMousePointerService sharedInstance];
                id v83 = objc_alloc((Class)BKSContextRelativePoint);
                double v84 = [*(id *)(a1 + 40) view];
                id v85 = [v84 window];
                id v86 = objc_msgSend(v83, "initWithPoint:contextID:", objc_msgSend(v85, "_contextId"), v24, v23);
                BOOL v87 = [v82 acquireButtonDownPointerRepositionAssertionForReason:@"Pointer is over Zoom UI" contextRelativePointerPosition:v86 onDisplay:0 restrictingToPID:0xFFFFFFFFLL];
                [*(id *)(a1 + 40) setRedirectPointerAssertion:v87];

                objc_msgSend(*(id *)(a1 + 40), "setRedirectPointerLocation:", v24, v23);
                [v81 invalidate];
                double v88 = [*(id *)(a1 + 40) fakeLaserVC];
                double v89 = [v88 fingerController];
                CGFloat v90 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", v14, v15);
                v141 = v90;
                CGFloat v91 = +[NSArray arrayWithObjects:&v141 count:1];
                objc_msgSend(v89, "showFingerModels:animated:startPointForAnimation:", v91, 0, v14, v15);

                uint64_t v92 = *(void *)(a1 + 40);
                CGFloat v93 = *(NSObject **)(v92 + 1152);
                v133[0] = _NSConcreteStackBlock;
                v133[1] = 3221225472;
                v133[2] = __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_5;
                v133[3] = &unk_78CA8;
                v133[4] = v92;
                dispatch_sync(v93, v133);

                BOOL v38 = 0;
LABEL_67:
                if (!v130)
                {
                  CGRect v117 = [*(id *)(a1 + 40) fakeLaserVC];
                  CGRect v118 = [v117 fingerController];
                  CGRect v119 = [v118 fingerModels];
                  CGRect v120 = [v119 firstObject];
                  unsigned int v121 = [v120 isPressed];

                  if (!v121) {
                    goto LABEL_77;
                  }
                  CGRect v115 = [*(id *)(a1 + 40) fakeLaserVC];
                  CGRect v116 = [v115 fingerController];
                  [v116 liftFingersUpAnimated:1 sendTouchEvents:0];
                  goto LABEL_76;
                }
LABEL_68:
                [v131 pointerButtonMask];
                if (v107 == 0.0)
                {
                  if (*((unsigned char *)v138 + 24))
                  {
                    CGRect v108 = [*(id *)(a1 + 40) redirectPointerAssertion];
                    BOOL v109 = v108 == 0;

                    if (!v109)
                    {
                      [*(id *)(a1 + 40) moveCursorToCurrentFakeCursorLocation];
                      BOOL v38 = 1;
                    }
                  }
                }
                CGRect v110 = [*(id *)(a1 + 40) fakeLaserVC];
                CGRect v111 = [v110 fingerController];
                CGRect v112 = [v111 fingerModels];
                CGRect v113 = [v112 firstObject];
                unsigned __int8 v114 = [v113 isPressed];

                if (v114)
                {
LABEL_77:
                  v122 = [*(id *)(a1 + 40) lastHoveredView];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v123 = [*(id *)(a1 + 40) lastHoveredView];
                    BOOL v124 = v123 == v22;

                    if (v124)
                    {
LABEL_81:
                      [*(id *)(a1 + 40) setLastHoveredView:v22];
                      v125 = [*(id *)(a1 + 40) slugViewController];
                      unsigned int v126 = [v125 userIsInteractingWithSlug];

                      if (((v129 | v126 | v38) & 1) == 0)
                      {
                        v127 = *(void **)(a1 + 40);
                        v128 = +[AXSettings sharedInstance];
                        objc_msgSend(v127, "externalClientWantsToAutopan:withPanningStyle:", objc_msgSend(v128, "laserZoomPanningStyle"), *(double *)(a1 + 48), *(double *)(a1 + 56));
                      }
                      goto LABEL_84;
                    }
                    v122 = [*(id *)(a1 + 40) lastHoveredView];
                    [v122 setHighlighted:0];
                  }

                  goto LABEL_81;
                }
                CGRect v115 = [*(id *)(a1 + 40) fakeLaserVC];
                CGRect v116 = [v115 fingerController];
                [v116 pressFingersDownAnimated:1 sendTouchEvents:0];
LABEL_76:

                goto LABEL_77;
              }
              char v67 = [*(id *)(a1 + 40) fakeLaserVC];
              double v68 = [v67 view];
              [v68 removeFromSuperview];

              double v69 = [*(id *)(a1 + 40) fakeLaserVC];
              [v69 removeFromParentViewController];

              id v70 = *(void **)(a1 + 40);
              double v71 = [v70 fakeLaserVC];
              [v70 addChildViewController:v71];

              id v72 = [*(id *)(a1 + 40) containerView];
              v73 = [*(id *)(a1 + 40) fakeLaserVC];
              BOOL v74 = [v73 view];
              [v72 addSubview:v74];

              double v75 = [*(id *)(a1 + 40) containerView];
              BOOL v76 = [*(id *)(a1 + 40) fakeLaserVC];
              BOOL v77 = [v76 view];
              [v75 bringSubviewToFront:v77];

              double v45 = [*(id *)(a1 + 40) fakeLaserVC];
              [v45 didMoveToParentViewController:*(void *)(a1 + 40)];
            }

            goto LABEL_55;
          }

LABEL_59:
          CGFloat v94 = [*(id *)(a1 + 40) redirectPointerAssertion];
          BOOL v95 = v94 == 0;

          if (!v95)
          {
            id v96 = [*(id *)(a1 + 40) redirectPointerAssertion];
            [v96 invalidate];

            [*(id *)(a1 + 40) setRedirectPointerAssertion:0];
          }
          id v97 = [*(id *)(a1 + 40) hidePointerAssertion];
          BOOL v98 = v97 == 0;

          if (v98)
          {
            BOOL v38 = 0;
          }
          else
          {
            double v99 = [*(id *)(a1 + 40) fakeLaserVC];
            double v100 = [v99 fingerController];
            double v101 = [v100 fingerModels];
            BOOL v38 = [v101 count] != 0;

            if (v38) {
              [*(id *)(a1 + 40) moveCursorToCurrentFakeCursorLocation];
            }
            double v102 = [*(id *)(a1 + 40) hidePointerAssertion];
            [v102 invalidate];

            [*(id *)(a1 + 40) setHidePointerAssertion:0];
          }
          BOOL v103 = [*(id *)(a1 + 40) fakeLaserVC];
          BOOL v104 = [v103 fingerController];
          objc_msgSend(v104, "clearAllFingersAnimated:endPointForAnimation:", 0, CGPointZero.x, CGPointZero.y);

          uint64_t v105 = *(void *)(a1 + 40);
          CGRect v106 = *(NSObject **)(v105 + 1152);
          v132[0] = _NSConcreteStackBlock;
          v132[1] = 3221225472;
          v132[2] = __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_6;
          v132[3] = &unk_78CA8;
          v132[4] = v105;
          dispatch_sync(v106, v132);
          goto LABEL_67;
        }

        long long v35 = v34;
      }

      goto LABEL_36;
    }
    if (v130 && *((unsigned char *)v138 + 24)) {
      goto LABEL_36;
    }
    goto LABEL_59;
  }
}

uint64_t __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_WORD *)(*(void *)(result + 32) + 376) & 0x2000) != 0;
  return result;
}

BOOL __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) slugViewController];
  id v5 = [v4 view];
  if (v5 == v3)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) view];
    BOOL v7 = v6 == v3;
  }
  return v7;
}

BOOL __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_4(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_5(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) |= 0x2000u;
  return result;
}

uint64_t __81__ZWRootViewController_eventProcessor_didGetPointerEventAtLocation_withEventRep___block_invoke_6(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) &= ~0x2000u;
  return result;
}

- (void)sendUserEventOccurred
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastEventTime > 1.5)
  {
    double v4 = +[AXUserEventTimer sharedInstance];
    [v4 userEventOccurred];

    self->_lastEventTime = Current;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [(ZWRootViewController *)self setScrollBeganWhileSnarfingScrolls:(char *)[(ZWRootViewController *)self lastKeyboardCommand] == (char *)&dword_C + 2];
  [(ZWRootViewController *)self setLastScrollTrapOffset:5000.0];
  objc_msgSend(v4, "setContentOffset:", 5000.0, 5000.0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v13 = a3;
  if ([(ZWRootViewController *)self scrollBeganWhileSnarfingScrolls])
  {
    [v13 contentOffset];
    double v5 = v4;
    [(ZWRootViewController *)self lastScrollTrapOffset];
    double v7 = v5 - v6;
    [v13 contentOffset];
    [(ZWRootViewController *)self setLastScrollTrapOffset:v8];
    double v9 = +[BKSMousePointerService sharedInstance];
    BOOL v10 = [v9 globalDevicePreferences];
    unsigned int v11 = [v10 enableNaturalScrolling];

    double v12 = -v7;
    if (v11) {
      double v12 = v7;
    }
    [(ZWRootViewController *)self _handleZoomWheelEventWithDelta:(uint64_t)v12];
  }
}

- (CGPoint)pointerLocationToZoomInToWithZoomFactor:(double)a3
{
  [(ZWRootViewController *)self lastPointerLocation];
  double v6 = v5;
  double v8 = v7;
  double v9 = +[AXSettings sharedInstance];
  id v10 = [v9 laserZoomPanningStyle];

  if (v10)
  {
    double v11 = v6;
    double v12 = v8;
  }
  else
  {
    -[ZWRootViewController zoomFrameForPanningContinuouslyToPoint:zoomFactor:](self, "zoomFrameForPanningContinuouslyToPoint:zoomFactor:", v6, v8, a3);
    AX_CGRectGetCenter();
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)_handleZoomWheelEventWithDelta:(int64_t)a3
{
  double v5 = [(ZWRootViewController *)self activeLensViewController];
  double v6 = 1.0;
  if (([v5 inStandbyMode] & 1) == 0)
  {
    [(ZWRootViewController *)self zoomFactor];
    double v6 = v7;
  }

  [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
  double v9 = v6 * (v8 / (v8 - (double)a3));
  if (v9 < AXZoomMinimumZoomLevel) {
    double v9 = AXZoomMinimumZoomLevel;
  }
  [(ZWRootViewController *)self setZoomFactorRespectingUserPreferredMaximumZoom:v9];
  -[ZWRootViewController pointerLocationToZoomInToWithZoomFactor:](self, "pointerLocationToZoomInToWithZoomFactor:");
  -[ZWRootViewController zoomInToPoint:withZoomFactor:animated:](self, "zoomInToPoint:withZoomFactor:animated:", 0);
  self->_lastWheelDelta = (double)a3;
}

- (void)_handlePanWheelEventWithDelta:(int64_t)a3
{
}

- (void)_handlePanWheelEventWithDelta:(int64_t)a3 animated:(BOOL)a4 animationDuration:(double)a5
{
  BOOL v5 = a4;
  double v7 = (double)a3 * 0.7;
  double v8 = (double)(uint64_t)v7 * 0.5 + self->_lastWheelDelta;
  [(ZWRootViewController *)self zoomPanOffset];
  -[ZWRootViewController mirrorPanOffsetForRTLIfNecessary:](self, "mirrorPanOffsetForRTLIfNecessary:");
  double v10 = v9;
  double v12 = v11;
  [(ZWRootViewController *)self zoomFactor];
  double v76 = v13;
  double v14 = [(ZWRootViewController *)self activeLensViewController];
  [(ZWRootViewController *)self zoomFactor];
  objc_msgSend(v14, "maximumPanOffsetWithZoomFactor:");
  double v16 = v15;
  double v18 = v17;

  double v19 = [(ZWRootViewController *)self activeLensViewController];
  long long v20 = [v19 view];
  [v20 bounds];
  double v22 = v21;
  [(ZWRootViewController *)self zoomFactor];
  double v24 = v22 / v23 * 0.67;

  if ([(ZWRootViewController *)self _watchUIInverted]) {
    double v25 = -1.0;
  }
  else {
    double v25 = 1.0;
  }
  if (self->_isSweepingToNextZoomRow)
  {
    long long v26 = [(ZWRootViewController *)self activeLensViewController];
    BOOL v27 = [v26 view];
    [v27 bounds];
    double v29 = v24 / v28;

    double v10 = v10 - v8 * 4.0;
    double v12 = v12 + v8 * v29 * 4.0;
    if (v8 <= 0.0)
    {
      double v31 = (double)(uint64_t)v7;
      double v30 = a5;
      if (v10 > v16)
      {
        double v32 = v10 - v16;
        double v10 = v10 - (v10 - v16);
LABEL_19:
        double v12 = v12 + v32 * v29;
        double v40 = v32 + self->_accruedOvershoot;
        self->_accruedOvershoot = v40;
        if (fabs(v40) > 60.0)
        {
          self->_isSweepingToNextZoomRow = 0;
          self->_accruedOvershoot = 0.0;
          self->_haveTriedScrollingDuringZoomSweep = 0;
        }
      }
    }
    else
    {
      double v31 = (double)(uint64_t)v7;
      double v30 = a5;
      if (v10 < -v16)
      {
        double v32 = v10 + v16;
        double v10 = v10 + v10 + v16;
        goto LABEL_19;
      }
    }
LABEL_37:
    double v39 = v76;
    goto LABEL_38;
  }
  double v33 = v18;
  double v34 = v24 * 0.5;
  double v35 = v8 + v10;
  if (v8 <= 0.0 || v35 <= v16)
  {
    uint64_t v37 = (uint64_t)v7;
    if (v8 > 0.0)
    {
      if (v37 < 1 || v35 <= v16)
      {
        double v10 = v8 + v10;
        double v31 = (double)(uint64_t)v7;
        double v30 = a5;
        goto LABEL_37;
      }
      double v38 = v12 - v33;
      double v39 = v76;
      goto LABEL_42;
    }
    double v44 = -v16;
    if (v35 >= -v16)
    {
      double v39 = v76;
      if ((v37 & 0x8000000000000000) == 0 || v35 >= v44)
      {
LABEL_45:
        double v10 = v35;
        double v31 = (double)(uint64_t)v7;
        double v30 = a5;
        goto LABEL_38;
      }
      double v38 = v12 + v33;
LABEL_42:
      if (fabs(v38) <= 2.0)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v56 = v55;
        if (v55 - self->_lastEdgePanHapticTime > 1.5)
        {
          AudioServicesPlaySystemSound(0x581u);
          self->_lastEdgePanHapticTime = v56;
        }
      }
      goto LABEL_45;
    }
    double v45 = v44 - v35 + self->_accruedOvershoot;
    self->_accruedOvershoot = v45;
    BOOL v46 = fabs(v45) > 3.75 && v12 < -(v33 - v34 * 2.0);
    double v39 = v76;
    if (!v46)
    {
      double v31 = (double)(uint64_t)v7;
      double v30 = a5;
      goto LABEL_34;
    }
    double v31 = (double)(uint64_t)v7;
    double v30 = a5;
    if (self->_haveTriedScrollingDuringZoomSweep) {
      goto LABEL_34;
    }
    double v57 = v33;
    if (self->_inUnitTestingMode)
    {
      double v58 = v34;
      if ([(ZWRootViewController_UnitTestDelegate *)self->_unitTestDelegate scrollContentWithAmount:-v34])
      {
LABEL_49:
        double v12 = v12 + v58;
        goto LABEL_34;
      }
    }
    else
    {
      double v58 = v34;
      BOOL v66 = +[AXElement systemWideElement];
      char v67 = [v66 systemApplication];
      double v68 = [v67 currentApplications];
      BOOL v74 = [v68 firstObject];

      double v69 = [v74 uiElement];
      CFStringRef v77 = @"scrollAmount";
      id v70 = +[NSNumber numberWithDouble:-(v58 * v25)];
      double v78 = v70;
      double v71 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      unsigned int v72 = [v69 performAXAction:2047 withValue:v71];

      if (v72) {
        goto LABEL_49;
      }
    }
    if (v12 <= -v57) {
      goto LABEL_38;
    }
LABEL_55:
    self->_haveTriedScrollingDuringZoomSweep = 1;
    goto LABEL_34;
  }
  double v41 = v35 - v16 + self->_accruedOvershoot;
  self->_accruedOvershoot = v41;
  if (fabs(v41) <= 3.75)
  {
    double v31 = (double)(uint64_t)v7;
    double v30 = a5;
    double v39 = v76;
    goto LABEL_34;
  }
  double v31 = (double)(uint64_t)v7;
  double v30 = a5;
  double v39 = v76;
  if (!self->_haveTriedScrollingDuringZoomSweep && v12 > v33 + v34 * -2.0)
  {
    double v42 = v33;
    if (self->_inUnitTestingMode)
    {
      double v43 = v34;
      if ([(ZWRootViewController_UnitTestDelegate *)self->_unitTestDelegate scrollContentWithAmount:v34])
      {
LABEL_26:
        double v12 = v12 - v43;
        goto LABEL_34;
      }
    }
    else
    {
      double v43 = v34;
      double v59 = +[AXElement systemWideElement];
      double v60 = [v59 systemApplication];
      double v61 = [v60 currentApplications];
      v73 = [v61 firstObject];

      double v62 = [v73 uiElement];
      CFStringRef v79 = @"scrollAmount";
      double v63 = +[NSNumber numberWithDouble:v25 * v43];
      id v80 = v63;
      double v64 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      unsigned int v65 = [v62 performAXAction:2047 withValue:v64];

      if (v65) {
        goto LABEL_26;
      }
    }
    if (v12 >= v42) {
      goto LABEL_38;
    }
    goto LABEL_55;
  }
LABEL_34:
  if (fabs(self->_accruedOvershoot) > 15.0)
  {
    self->_isSweepingToNextZoomRow = 1;
    self->_accruedOvershoot = 0.0;
    self->_haveTriedScrollingDuringZoomSweep = 0;
  }
LABEL_38:
  double v47 = [(ZWRootViewController *)self activeLensViewController];
  -[ZWRootViewController mirrorPanOffsetForRTLIfNecessary:](self, "mirrorPanOffsetForRTLIfNecessary:", v10, v12);
  objc_msgSend(v47, "validPanOffsetForProposedOffset:proposedZoomFactor:");
  double v48 = v12;
  double v50 = v49;
  double v52 = v51;

  double v53 = [(ZWRootViewController *)self activeLensViewController];
  -[ZWRootViewController mirrorPanOffsetForRTLIfNecessary:](self, "mirrorPanOffsetForRTLIfNecessary:", v10, v48);
  objc_msgSend(v53, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0);

  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v50, v52);
  double v54 = [(ZWRootViewController *)self activeLensViewController];
  objc_msgSend(v54, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v5, 0, v39, v50, v52, v30);

  self->_lastWheelDelta = v31;
}

- (void)_handleKeyboardCommand:(int64_t)a3 isRepeatCommand:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a4) {
    [(AXDispatchTimer *)self->_keyRepeatTimer cancel];
  }
  if ((char *)[(ZWRootViewController *)self lastKeyboardCommand] == (char *)&dword_0 + 3
    && [(ZWRootViewController *)self toggleStandbyOnNextCommandChange])
  {
    [(ZWRootViewController *)self setToggleStandbyOnNextCommandChange:0];
    [(ZWRootViewController *)self _toggleZoomStandby];
  }
  if ((char *)[(ZWRootViewController *)self lastKeyboardCommand] == (char *)&dword_C + 2)
  {
    self->_lastWheelDelta = 0.0;
    double v7 = [(ZWRootViewController *)self scrollTrapView];
    [v7 setAlpha:0.0];

    cachedValuesSerialQueue = self->_cachedValuesSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke;
    block[3] = &unk_78CA8;
    void block[4] = self;
    dispatch_sync(cachedValuesSerialQueue, block);
  }
  switch(a3)
  {
    case 0:
      [(ZWRootViewController *)self zoomFactor];
      double v31 = v30;
      double v32 = [(ZWRootViewController *)self activeLensViewController];
      unsigned int v33 = [v32 inStandbyMode];

      double v34 = AXZoomMinimumZoomLevel;
      if (!v33) {
        double v34 = v31;
      }
      [(ZWRootViewController *)self fullscreenEventHandler:0 setZoomLevel:v34 * 1.1 duration:0.0];
      a3 = 0;
      goto LABEL_81;
    case 1:
      [(ZWRootViewController *)self zoomFactor];
      [(ZWRootViewController *)self fullscreenEventHandler:0 setZoomLevel:v35 * 0.9 duration:0.0];
      int v36 = 1;
      a3 = 1;
      goto LABEL_82;
    case 2:
      uint64_t v37 = [(ZWRootViewController *)self presentedViewController];
      double v38 = [(ZWRootViewController *)self menuViewController];

      if (v37 == v38) {
        [(ZWRootViewController *)self _dismissMenuAnimated:1];
      }
      [(ZWRootViewController *)self _toggleZoomStandby];
      a3 = 2;
      goto LABEL_70;
    case 3:
      if (![(ZWRootViewController *)self zoomIsAnimatingDueToStandbyToggle])
      {
        [(ZWRootViewController *)self setToggleStandbyOnNextCommandChange:1];
        [(ZWRootViewController *)self _toggleZoomStandby];
      }
      a3 = 3;
      goto LABEL_70;
    case 4:
    case 5:
      double v18 = [(ZWRootViewController *)self activeLensViewController];
      unsigned __int8 v19 = [v18 inStandbyMode];

      if (v19) {
        goto LABEL_70;
      }
      long long v20 = AXZoomUserSelectableLensModes();
      double v21 = [(ZWRootViewController *)self activeZoomMode];
      double v22 = (char *)[v20 indexOfObject:v21];

      if (a3 == 4)
      {
        if (v22 + 1 < [v20 count]) {
          double v23 = v22 + 1;
        }
        else {
          double v23 = 0;
        }
      }
      else if (v22)
      {
        double v23 = v22 - 1;
      }
      else
      {
        double v23 = (char *)[v20 count] - 1;
      }
      double v53 = [v20 objectAtIndex:v23];
      [(ZWRootViewController *)self _transitionToLensForMode:v53 animated:1 completion:0];

LABEL_69:
LABEL_70:
      int v36 = v4;
      goto LABEL_82;
    case 6:
    case 7:
    case 8:
    case 9:
      double v9 = [(ZWRootViewController *)self activeLensViewController];
      unsigned __int8 v10 = [v9 inStandbyMode];

      if (v10) {
        goto LABEL_70;
      }
      [(ZWRootViewController *)self zoomFrame];
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      switch(a3)
      {
        case 6:
          if (v11 >= v12) {
            double v15 = v11;
          }
          else {
            double v15 = v12;
          }
          double v16 = CGPointZero.x + v15 / -5.0;
          if (v16 >= v11 * -0.5) {
            double x = v16;
          }
          else {
            double x = v11 * -0.5;
          }
          break;
        case 7:
          if (v11 >= v12) {
            double v45 = v11;
          }
          else {
            double v45 = v12;
          }
          double v46 = CGPointZero.x + v45 / 5.0;
          if (v46 >= v11 * 0.5) {
            double x = v11 * 0.5;
          }
          else {
            double x = v46;
          }
          break;
        case 8:
          if (v11 >= v12) {
            double v47 = v11;
          }
          else {
            double v47 = v12;
          }
          double v48 = y + v47 / -5.0;
          if (v48 >= v12 * -0.5) {
            double y = v48;
          }
          else {
            double y = v12 * -0.5;
          }
          break;
        case 9:
          if (v11 >= v12) {
            double v49 = v11;
          }
          else {
            double v49 = v12;
          }
          double v50 = y + v49 / 5.0;
          if (v50 >= v12 * 0.5) {
            double y = v12 * 0.5;
          }
          else {
            double y = v50;
          }
          break;
        default:
          break;
      }
      double v51 = [(ZWRootViewController *)self activeLensViewController];
      int v36 = 1;
      -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:", v51, 0, 1, 1, 1, x, y);

      double v52 = [(ZWRootViewController *)self activeLensViewController];
      [v52 zoomMovementDidEnd];

      goto LABEL_82;
    case 10:
    case 11:
    case 12:
    case 13:
      double v17 = [(ZWRootViewController *)self activeLensViewController];
      if (![v17 inStandbyMode])
      {
        double v24 = [(ZWRootViewController *)self activeLensViewController];
        double v25 = [(ZWRootViewController *)self fullscreenLensViewController];

        if (v24 == v25) {
          goto LABEL_81;
        }
        long long v26 = [(ZWRootViewController *)self activeLensViewController];
        BOOL v27 = [(ZWRootViewController *)self dockedLensViewController];

        if (v26 != v27)
        {
LABEL_27:
          [(ZWRootViewController *)self _lensMinimumSize];
          switch(a3)
          {
            case 10:
              goto LABEL_78;
            case 11:
              goto LABEL_76;
            case 12:
              goto LABEL_46;
            case 13:
              goto LABEL_74;
            default:
              double v28 = CGPointZero.x;
              double v29 = CGPointZero.y;
              goto LABEL_79;
          }
        }
        double v41 = [(ZWRootViewController *)self dockedLensViewController];
        id v42 = [v41 dockPosition];

        if (v42)
        {
          double v43 = [(ZWRootViewController *)self dockedLensViewController];
          double v44 = (char *)[v43 dockPosition];

          if (v44 != (unsigned char *)&dword_0 + 2) {
            goto LABEL_27;
          }
          if (a3 == 12)
          {
            [(ZWRootViewController *)self _lensMinimumSize];
LABEL_78:
            double v29 = 0.0;
LABEL_79:
            a3 = 10;
          }
          else
          {
            if (a3 != 10) {
              goto LABEL_27;
            }
            [(ZWRootViewController *)self _lensMinimumSize];
LABEL_46:
            double v28 = -v28;
            double v29 = 0.0;
            a3 = 12;
          }
        }
        else if (a3 == 13)
        {
          [(ZWRootViewController *)self _lensMinimumSize];
LABEL_76:
          double v28 = 0.0;
          a3 = 11;
        }
        else
        {
          if (a3 != 11) {
            goto LABEL_27;
          }
          [(ZWRootViewController *)self _lensMinimumSize];
LABEL_74:
          double v29 = -v29;
          double v28 = 0.0;
          a3 = 13;
        }
        -[ZWRootViewController _resizeZoomLensWithAdjustment:lensPositionCompensation:](self, "_resizeZoomLensWithAdjustment:lensPositionCompensation:", v28, v29, v28 * -0.5, v29 * -0.5);
        goto LABEL_81;
      }

LABEL_81:
      int v36 = 1;
LABEL_82:
      int v54 = _AXSKeyRepeatEnabled();
      if (v36 && v54)
      {
        if (v4) {
          _AXSKeyRepeatInterval();
        }
        else {
          _AXSKeyRepeatDelay();
        }
        double v56 = v55;
        double v57 = [(ZWRootViewController *)self keyRepeatTimer];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke_3;
        v59[3] = &unk_78E40;
        v59[4] = self;
        v59[5] = a3;
        [v57 afterDelay:v59 processBlock:v56];
      }
      unsigned int v58 = [(ZWRootViewController *)self shouldSuppressKeyCommandHUD];
      [(ZWRootViewController *)self setShouldSuppressKeyCommandHUD:a3 != 16];
      if (v58 != [(ZWRootViewController *)self shouldSuppressKeyCommandHUD]) {
        [(ZWRootViewController *)self _updateZoomListeners];
      }
      [(ZWRootViewController *)self setLastKeyboardCommand:a3];
      return;
    case 14:
      double v39 = [(ZWRootViewController *)self scrollTrapView];
      [v39 setAlpha:0.01];

      double v40 = self->_cachedValuesSerialQueue;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke_2;
      v60[3] = &unk_78CA8;
      v60[4] = self;
      dispatch_sync(v40, v60);
      a3 = 14;
      goto LABEL_70;
    case 15:
    case 16:
      long long v20 = [(ZWRootViewController *)self keyRepeatTimer];
      [v20 cancel];
      goto LABEL_69;
    default:
      goto LABEL_70;
  }
}

uint64_t __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) &= ~0x4000u;
  return result;
}

uint64_t __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke_2(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) |= 0x4000u;
  return result;
}

id __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeyboardCommand:*(void *)(a1 + 40) isRepeatCommand:1];
}

- (CGPoint)mirrorPanOffsetForRTLIfNecessary:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  BOOL v5 = (char *)[UIApp userInterfaceLayoutDirection];
  double v6 = -x;
  if (v5 != (unsigned char *)&dword_0 + 1) {
    double v6 = x;
  }
  double v7 = y;
  result.CGFloat y = v7;
  result.double x = v6;
  return result;
}

- (void)lastFingerWasLiftedWithEventProcessor:(id)a3 firstTouchWentIntoSlug:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke;
  v4[3] = &unk_78B78;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _enableZoomWindowHitTesting];
  id v2 = [*(id *)(a1 + 32) idleTouchTimer];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_2;
  v21[3] = &unk_78CA8;
  v21[4] = *(void *)(a1 + 32);
  [v2 afterDelay:v21 processBlock:2.0];

  id v3 = [*(id *)(a1 + 32) presentedViewController];
  BOOL v4 = [*(id *)(a1 + 32) menuViewController];

  if (v3 != v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) cachedValuesSerialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_3;
    block[3] = &unk_78CA8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_sync(v5, block);
  }
  double v6 = +[AXSpeakFingerManager sharedInstance];
  if ([v6 speakFingerState] != &dword_4) {
    goto LABEL_11;
  }
  double v7 = [*(id *)(a1 + 32) activeLensViewController];
  double v8 = [*(id *)(a1 + 32) pipLensViewController];
  if (v7 != v8)
  {

LABEL_10:
    goto LABEL_11;
  }
  double v9 = [*(id *)(a1 + 32) activeLensViewController];
  if (![v9 inStandbyMode])
  {

    goto LABEL_10;
  }
  int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 815);

  if (!v10) {
    goto LABEL_12;
  }
  double v11 = +[AXSettings sharedInstance];
  double v6 = [v11 zoomCurrentLensEffect];

  double v12 = [*(id *)(a1 + 32) activeLensViewController];
  [*(id *)(a1 + 32) zoomFactor];
  double v14 = v13;
  [*(id *)(a1 + 32) zoomPanOffset];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_4;
  v19[3] = &unk_78CA8;
  void v19[4] = *(void *)(a1 + 32);
  objc_msgSend(v12, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v6, 1, v19, v14, v15, v16);

  *(unsigned char *)(*(void *)(a1 + 32) + 815) = 0;
LABEL_11:

LABEL_12:
  double v17 = +[AXSpeakFingerManager sharedInstance];
  if ([v17 speakFingerState] == &dword_4)
  {
    int v18 = *(unsigned __int8 *)(a1 + 40);

    if (v18) {
      return;
    }
    double v17 = +[AXSpeakFingerManager sharedInstance];
    [v17 fingerWasLiftedInSpeakUnderFingerMode];
  }
}

void __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) slugViewController];
  [v2 userInteractionHasBecomeIdle];

  id v3 = [*(id *)(a1 + 32) activeLensViewController];
  [v3 userInteractionHasBecomeIdle];

  id v4 = [*(id *)(a1 + 32) menuViewController];
  [v4 userInteractionHasBecomeIdle];
}

__n128 __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 80;
  __n128 result = (__n128)CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGPoint *)(v1 + 96) = CGRectNull.origin;
  *(CGSize *)(v1 + 112) = size;
  return result;
}

id __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertionsForFullscreenZoom];
}

- (void)didGetToggleZoomGestureWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__ZWRootViewController_didGetToggleZoomGestureWithEventProcessor___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __66__ZWRootViewController_didGetToggleZoomGestureWithEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleZoomStandby];
}

- (void)didGetTogglePanningModeGestureWithATVEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__ZWRootViewController_didGetTogglePanningModeGestureWithATVEventProcessor___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __76__ZWRootViewController_didGetTogglePanningModeGestureWithATVEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleStealingSingleFingerPanning];
}

- (void)wantsToStartAutopannerWithATVEventProcessor:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __68__ZWRootViewController_wantsToStartAutopannerWithATVEventProcessor___block_invoke;
  v4[3] = &unk_79118;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __68__ZWRootViewController_wantsToStartAutopannerWithATVEventProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) lensAutopanner];
  [v3 setDataSource:v2];

  id v4 = [*(id *)(a1 + 32) lensAutopanner];
  [v4 start];
}

- (void)wantsToStopAutopannerWithATVEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__ZWRootViewController_wantsToStopAutopannerWithATVEventProcessor___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __67__ZWRootViewController_wantsToStopAutopannerWithATVEventProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lensAutopanner];
  [v2 stop];

  id v3 = [*(id *)(a1 + 32) lensAutopanner];
  [v3 setDataSource:0];
}

- (void)didGetSpeakContentGestureWithATVEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71__ZWRootViewController_didGetSpeakContentGestureWithATVEventProcessor___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __71__ZWRootViewController_didGetSpeakContentGestureWithATVEventProcessor___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) smartZoom];
  [v1 speakContent];
}

- (void)atvEventProcessor:(id)a3 adjustZoomLevelWithDelta:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__ZWRootViewController_atvEventProcessor_adjustZoomLevelWithDelta___block_invoke;
  block[3] = &unk_78CD0;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __67__ZWRootViewController_atvEventProcessor_adjustZoomLevelWithDelta___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleZoomLevelAdjustmentViaGesture:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)shouldSendTapEventWithATVEventProcessor:(id)a3
{
  if ([(ZWRootViewController *)self _isZoomedToMinimum]
    || ([(ZWRootViewController *)self activeLensViewController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 inStandbyMode],
        v4,
        (v5 & 1) != 0)
    || [(ZWRootViewController *)self _smartZoomFocusedElementIsBeingSampled])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    double v8 = [(ZWRootViewController *)self smartZoom];
    double v9 = [(ZWRootViewController *)self activeLensViewController];
    int v10 = [v9 lensZoomView];
    [v10 sampleRect];
    unsigned int v6 = objc_msgSend(v8, "setNativeFocusOnBestElementNearRect:") ^ 1;
  }
  return v6;
}

- (void)blockHomeGestureIfNeededWithEventProcessor:(id)a3
{
  id v4 = [(ZWRootViewController *)self disableHomeGestureAssertion];

  if (!v4)
  {
    id v5 = +[AXAssertion assertionWithType:AXAssertionTypeDisableSystemGestures identifier:@"Interacting with Zoom UI"];
    [(ZWRootViewController *)self setDisableHomeGestureAssertion:v5];
  }
}

- (void)didGetTouchOutsideZoomMenuWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__ZWRootViewController_didGetTouchOutsideZoomMenuWithEventProcessor___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __69__ZWRootViewController_didGetTouchOutsideZoomMenuWithEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissMenuAnimated:1];
}

- (void)didGetTouchOutsideLensChromeWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71__ZWRootViewController_didGetTouchOutsideLensChromeWithEventProcessor___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __71__ZWRootViewController_didGetTouchOutsideLensChromeWithEventProcessor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDockResizingEnabled:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _setPIPLensResizingEnabled:0];
}

- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerDoubleTapAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(ZWRootViewController *)self _dismissMenuAnimated:1];
  [(ZWRootViewController *)self zoomFactor];
  double v8 = v7;
  double v9 = [(ZWRootViewController *)self activeLensViewController];
  int v10 = v9;
  BOOL v11 = y == -1.0 && x == -1.0;
  unsigned int v12 = [v9 inStandbyMode];
  double v13 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v10 == v13 && vabdd_f64(v8, AXZoomMinimumZoomLevel) < 0.0001)
  {
    double v14 = +[ZWCoalescedSettings sharedInstance];
    [v14 zoomFactor];
    double v8 = v15;

    if ([(ZWRootViewController *)self _isZoomFactorAtMinimum:v8]) {
      double v8 = AXZoomDefaultZoomLevel;
    }
    unsigned int v12 = 1;
  }
  if (!v11)
  {
    unsigned int v33 = [(ZWRootViewController *)self view];
    double v17 = ZWConvertPointInScreenPixelsToViewCoordinates(v33, x, y);
    double v19 = v34;

    if (!v12) {
      goto LABEL_11;
    }
LABEL_16:
    -[ZWRootViewController zoomInToPoint:withZoomFactor:animated:](self, "zoomInToPoint:withZoomFactor:animated:", 1, v17, v19, v8);
    goto LABEL_21;
  }
  [(ZWRootViewController *)self pointerLocationToZoomInToWithZoomFactor:v8];
  double v17 = v16;
  double v19 = v18;
  if (v12) {
    goto LABEL_16;
  }
LABEL_11:
  long long v20 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v10 == v20)
  {
    [(ZWRootViewController *)self setZoomFactorRespectingUserPreferredMaximumZoom:v8];
    double v36 = v35;
    uint64_t v37 = +[AXSettings sharedInstance];
    double v24 = [v37 zoomCurrentLensEffect];

    double v38 = [(ZWRootViewController *)self activeLensViewController];
    [(ZWRootViewController *)self zoomPanOffset];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke;
    v49[3] = &unk_78CA8;
    v49[4] = self;
    objc_msgSend(v38, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, v24, 1, v49, v36, v39, v40);

    double v41 = +[ZWCoalescedSettings sharedInstance];
    [v41 setZoomInStandby:1];

    id v42 = [(ZWRootViewController *)self containerView];
    double v43 = [(ZWRootViewController *)self minimapView];
    [v42 bringSubviewToFront:v43];

    double v25 = [(ZWRootViewController *)self kbContext];
    [v25 keyboardFrame];
    -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:");
LABEL_20:

    goto LABEL_21;
  }
  double v21 = [(ZWRootViewController *)self pipLensViewController];

  if (v10 == v21)
  {
    double v44 = +[AXSettings sharedInstance];
    double v24 = [v44 zoomCurrentLensEffect];

    double v25 = [(ZWRootViewController *)self activeLensViewController];
    long long v26 = [(ZWRootViewController *)self activeLensViewController];
    uint64_t v27 = [v26 inStandbyMode] ^ 1;
    [(ZWRootViewController *)self zoomPanOffset];
    double v29 = v45;
    double v31 = v46;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_2;
    v48[3] = &unk_78CA8;
    void v48[4] = self;
    double v32 = v48;
    goto LABEL_19;
  }
  double v22 = [(ZWRootViewController *)self dockedLensViewController];

  if (v10 == v22)
  {
    double v23 = +[AXSettings sharedInstance];
    double v24 = [v23 zoomCurrentLensEffect];

    double v25 = [(ZWRootViewController *)self activeLensViewController];
    long long v26 = [(ZWRootViewController *)self activeLensViewController];
    uint64_t v27 = [v26 inStandbyMode] ^ 1;
    [(ZWRootViewController *)self zoomPanOffset];
    double v29 = v28;
    double v31 = v30;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_3;
    v47[3] = &unk_78CA8;
    v47[4] = self;
    double v32 = v47;
LABEL_19:
    objc_msgSend(v25, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", v27, v24, 1, v32, v8, v29, v31);

    goto LABEL_20;
  }
LABEL_21:
}

id __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateMinimapStatus];
}

id __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateMinimapStatus];
}

id __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateMinimapStatus];
}

- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerTripleTapAtLocation:(CGPoint)a4
{
  if ((AXDeviceIsTV() & 1) == 0)
  {
    [(ZWRootViewController *)self toggleZoomMenu];
  }
}

- (void)_updateOrbLocation:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  double v9 = (void (**)(void))a5;
  *((_WORD *)&self->_eventUIContext + 148) |= 0x200u;
  int v10 = [(ZWRootViewController *)self slugViewController];
  [v10 setShouldHideWhileOrbing:1];

  BOOL v11 = [(ZWRootViewController *)self activeLensViewController];
  unsigned int v12 = [(ZWRootViewController *)self pipLensViewController];

  if (v11 == v12)
  {
    double v30 = [(ZWRootViewController *)self screen];
    [v30 scale];
    double v32 = ZWConvertPointInScreenPixelsToScreenCoordinates(x, y, v31);
    double v34 = v33;

    double v35 = [(ZWRootViewController *)self pipLensViewController];
    double v36 = [v35 lensChromeView];
    [v36 bounds];
    double v38 = v37 * 0.5 - ZWZoomEdgeSlackAmount();

    double v39 = v34 - v38;
    if ((*((_WORD *)&self->_eventUIContext + 148) & 0x400) != 0)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = __63__ZWRootViewController__updateOrbLocation_animated_completion___block_invoke;
      v45[3] = &unk_79578;
      v45[4] = self;
      double v47 = v32;
      double v48 = v39;
      __asm { FMOV            V0.2D, #2.0 }
      long long v49 = _Q0;
      double v46 = v9;
      -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:](self, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 0, 1, v5, v45, v32, v39, 2.0, 2.0);
    }
    else
    {
      -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:](self, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 1, 1, v5, v9, v32, v39, 2.0, 2.0);
    }
  }
  else
  {
    double v13 = [(ZWRootViewController *)self view];
    double v14 = ZWConvertPointInScreenPixelsToViewCoordinates(v13, x, y);
    double v16 = v15;

    double v17 = [(ZWRootViewController *)self slugViewController];
    double v18 = [v17 view];
    [v18 frame];
    AX_CGRectGetCenter();
    double v20 = v19;
    double v22 = v21;

    double v23 = (v14 - v20) * 3.5;
    double v24 = (v16 - v22) * 3.5;
    [(ZWRootViewController *)self lastOrbLocation];
    double v26 = v25;
    [(ZWRootViewController *)self lastOrbLocation];
    double v28 = v27;
    -[ZWRootViewController setLastOrbLocation:](self, "setLastOrbLocation:", v23, v24);
    if ((*((_WORD *)&self->_eventUIContext + 148) & 0x400) == 0)
    {
      double v29 = [(ZWRootViewController *)self activeLensViewController];
      -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v29, 0, 1, v23 - v26, v24 - v28);
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __63__ZWRootViewController__updateOrbLocation_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeLensViewController];
  [*(id *)(a1 + 32) zoomFactor];
  objc_msgSend(v2, "offsetByPanningToRect:zoomFactor:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), v3);
  objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:");

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)fullscreenEventHandler:(id)a3 didStartOrbAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
  *((_WORD *)&self->_eventUIContext + 148) |= 0x400u;
  double v7 = [(ZWRootViewController *)self activeLensViewController];
  [(ZWRootViewController *)self _transitionToLens:v7 animated:1 completion:&__block_literal_global_532];

  double v8 = [(ZWRootViewController *)self activeLensViewController];
  double v9 = [(ZWRootViewController *)self pipLensViewController];

  if (v8 == v9)
  {
    int v10 = [(ZWRootViewController *)self pipLensViewController];
    [v10 setOffsetZoomWindow:1];
  }
  double v11 = CGPointZero.y;
  -[ZWRootViewController setLastOrbLocation:](self, "setLastOrbLocation:", CGPointZero.x, v11);
  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", CGPointZero.x, v11);
  unsigned int v12 = +[AXSettings sharedInstance];
  double v13 = [v12 zoomCurrentLensEffect];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_2;
  v15[3] = &unk_79118;
  v15[4] = self;
  id v16 = v13;
  id v14 = v13;
  -[ZWRootViewController _updateOrbLocation:animated:completion:](self, "_updateOrbLocation:animated:completion:", 0, v15, x, y);
}

void __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeLensViewController];
  double v3 = [*(id *)(a1 + 32) activeLensViewController];
  [v3 zoomFactor];
  double v5 = v4;
  [*(id *)(a1 + 32) zoomPanOffset];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_3;
  v9[3] = &unk_78CA8;
  uint64_t v6 = *(void *)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v6, 1, v9, v5, v7, v8);
}

uint64_t __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_3(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376) &= ~0x400u;
  return result;
}

- (void)fullscreenEventHandler:(id)a3 didEndOrbAtLocation:(CGPoint)a4
{
  [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
  *((_WORD *)&self->_eventUIContext + 148) &= ~0x200u;
  double v5 = [(ZWRootViewController *)self slugViewController];
  [v5 setShouldHideWhileOrbing:0];

  uint64_t v6 = [(ZWRootViewController *)self activeLensViewController];
  double v7 = +[AXSettings sharedInstance];
  double v8 = [v7 zoomCurrentLensEffect];

  [(ZWRootViewController *)self zoomFactor];
  double v10 = v9;
  [(ZWRootViewController *)self zoomPanOffset];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __67__ZWRootViewController_fullscreenEventHandler_didEndOrbAtLocation___block_invoke;
  v16[3] = &unk_78CA8;
  void v16[4] = self;
  objc_msgSend(v6, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 1, v8, 1, v16, v10, v11, v12);
  double v13 = [(ZWRootViewController *)self activeLensViewController];
  id v14 = [(ZWRootViewController *)self pipLensViewController];

  if (v13 == v14)
  {
    double v15 = [(ZWRootViewController *)self pipLensViewController];
    [v15 setOffsetZoomWindow:0];
  }
}

id __67__ZWRootViewController_fullscreenEventHandler_didEndOrbAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)fullscreenEventHandler:(id)a3 updateOrbMovementAtLocation:(CGPoint)a4
{
  if ((*((_WORD *)&self->_eventUIContext + 148) & 0x400) == 0) {
    -[ZWRootViewController _updateOrbLocation:animated:completion:](self, "_updateOrbLocation:animated:completion:", 1, 0, a4.x, a4.y);
  }
}

- (void)fullscreenEventHandler:(id)a3 didThreeFingerOrbAtLocation:(CGPoint)a4
{
  double v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 zoomPeekZoomEnabled];
  char v7 = v6;
  uint64_t v8 = v6 ^ 1;

  double v9 = +[AXSettings sharedInstance];
  [v9 setZoomPeekZoomEnabled:v8];

  double v10 = [(ZWRootViewController *)self zoomAlertManager];
  id v11 = v10;
  if (v7) {
    [v10 showOrbZoomToggleOff];
  }
  else {
    [v10 showOrbZoomToggleOn];
  }
}

- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerSingleTapAtLocation:(CGPoint)a4
{
  id v8 = [(ZWRootViewController *)self activeLensViewController];
  if ([v8 inStandbyMode])
  {
  }
  else
  {
    [(ZWRootViewController *)self zoomFactor];
    double v6 = v5;
    double v7 = AXZoomMinimumZoomLevel;

    if (v6 > v7)
    {
      [(ZWRootViewController *)self _updateMinimapStatus];
    }
  }
}

- (void)fullscreenEventHandler:(id)a3 didReceiveOneFingerDownAtLocation:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke;
  block[3] = &unk_78CD0;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) activeLensViewController];
  id v2 = [*(id *)(a1 + 32) dockedLensViewController];
  if (v13 == v2)
  {
    double v3 = [*(id *)(a1 + 32) dockedLensViewController];
    unsigned int v4 = [v3 zoomRegionVisible];

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_denormalizePointForCurrentOrientation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      double v6 = v5;
      double v8 = v7;
      double v9 = [*(id *)(a1 + 32) dockedLensViewController];
      double v10 = [v9 dockedLensView];
      [v10 frame];
      v16.double x = v6;
      v16.double y = v8;
      BOOL v11 = CGRectContainsPoint(v17, v16);

      if (!v11)
      {
        +[CATransaction begin];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_2;
        v14[3] = &unk_78CA8;
        v14[4] = *(void *)(a1 + 32);
        +[CATransaction setCompletionBlock:v14];
        double v12 = [*(id *)(a1 + 32) dockedLensViewController];
        objc_msgSend(v12, "interceptFingerDownAtLocation:", v6, v8);

        +[CATransaction commit];
      }
    }
  }
  else
  {
  }
}

void __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 1152);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_3;
  block[3] = &unk_78CA8;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) dockedLensViewController];
  if ([v3 zoomRegionVisible]) {
    __int16 v2 = 64;
  }
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFBF | v2;
}

- (double)zoomLevelWithFullscreenEventHandler:(id)a3
{
  unsigned int v4 = [(ZWRootViewController *)self activeLensViewController];
  unsigned int v5 = [v4 inStandbyMode];

  if (v5) {
    return AXZoomMinimumZoomLevel;
  }

  [(ZWRootViewController *)self zoomFactor];
  return result;
}

- (void)fullscreenEventHandler:(id)a3 setZoomLevel:(double)a4 duration:(double)a5
{
  -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:", a3, a4, a5);
  [(ZWRootViewController *)self zoomPanOffset];
  double x = v7;
  double y = v9;
  if (vabdd_f64(a4, AXZoomMinimumZoomLevel) <= 0.0001 || AXZoomMinimumZoomLevel >= a4)
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", CGPointZero.x, y);
  }
  [(ZWRootViewController *)self setZoomFactorRespectingUserPreferredMaximumZoom:a4];
  double v13 = v12;
  id v14 = [(ZWRootViewController *)self activeLensViewController];
  if ([v14 inStandbyMode])
  {
    double v15 = +[AXSettings sharedInstance];
    CGPoint v16 = [v15 zoomCurrentLensEffect];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __69__ZWRootViewController_fullscreenEventHandler_setZoomLevel_duration___block_invoke;
    v17[3] = &unk_78CA8;
    v17[4] = self;
    objc_msgSend(v14, "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:", 0, v16, 0, v17, v13, x, y);
  }
  else
  {
    objc_msgSend(v14, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v13, x, y, -1.0);
  }
}

id __69__ZWRootViewController_fullscreenEventHandler_setZoomLevel_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)fullscreenEventHandler:(id)a3 setZoomLevelFromTrackpadGesture:(double)a4
{
  -[ZWRootViewController zoomFactorRespectingUserPreferredMaximumZoom:](self, "zoomFactorRespectingUserPreferredMaximumZoom:", a3, a4);
  -[ZWRootViewController pointerLocationToZoomInToWithZoomFactor:](self, "pointerLocationToZoomInToWithZoomFactor:");

  -[ZWRootViewController zoomInToPoint:withZoomFactor:animated:](self, "zoomInToPoint:withZoomFactor:animated:", 0);
}

- (void)fullscreenEventHandler:(id)a3 updateZoomMovementWithPoint:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__ZWRootViewController_fullscreenEventHandler_updateZoomMovementWithPoint___block_invoke;
  block[3] = &unk_78CD0;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __75__ZWRootViewController_fullscreenEventHandler_updateZoomMovementWithPoint___block_invoke(uint64_t a1)
{
  id v33 = [*(id *)(a1 + 32) activeLensViewController];
  if (([v33 inStandbyMode] & 1) == 0)
  {
    [*(id *)(a1 + 32) _dismissMenuAnimated:1];
    __int16 v2 = [*(id *)(a1 + 32) view];
    id v3 = [v2 window];
    objc_msgSend(v3, "_convertPointFromSceneReferenceSpace:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v5 = v4;
    double v7 = v6;

    *(unsigned char *)(*(void *)(a1 + 32) + 688) = 1;
    double v8 = v5 / ZOTMainScreenScaleFactor();
    double v9 = v7 / ZOTMainScreenScaleFactor();
    double v10 = [*(id *)(a1 + 32) activeLensViewController];
    BOOL v11 = [*(id *)(a1 + 32) dockedLensViewController];
    if (v10 == v11)
    {
      double v13 = [*(id *)(a1 + 32) dockedLensViewController];
      unsigned int v14 = [v13 zoomRegionVisible];

      double v12 = -v8;
      if (v14)
      {
        double v9 = -v9;
        double v8 = -v8;
      }
    }
    else
    {
    }
    objc_msgSend(*(id *)(a1 + 32), "zoomFactor", v12);
    double v16 = v15;
    [*(id *)(a1 + 32) zoomPanOffset];
    double v19 = *(double **)(a1 + 32);
    double v20 = v19[87];
    double v21 = v19[88];
    if (CGPointZero.x == v20 && CGPointZero.y == v21)
    {
      v19[87] = v8;
      v19[88] = v9;
      double v22 = (void *)(*(void *)(a1 + 32) + 712);
      *double v22 = v17;
      v22[1] = v18;
      goto LABEL_11;
    }
    double v23 = (v21 - v9) / v16;
    double v24 = (v20 - v8) / v16 + v19[89];
    double v25 = v23 + v19[90];
    double v26 = [v19 activeLensViewController];
    objc_msgSend(v26, "validPanOffsetForProposedOffset:proposedZoomFactor:", v24, v25, v16);
    double v28 = v27;
    double v30 = v29;

    double v31 = [*(id *)(a1 + 32) activeLensViewController];
    objc_msgSend(v31, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0, v24, v25, v28, v30);

    objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:", v28, v30);
    double v32 = [*(id *)(a1 + 32) activeLensViewController];
    objc_msgSend(v32, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 1, 0, v16, v28, v30, 0.1);

    *(unsigned char *)(*(void *)(a1 + 32) + 688) = 0;
  }
  [*(id *)(a1 + 32) _updateMinimapStatus];
LABEL_11:
}

- (BOOL)isZoomMovingWithVelocityWithFullscreenEventHandler:(id)a3
{
  return self->_fullScreenZoomVelocity > 0.0;
}

- (void)stopZoomMovementWithVelocityWithFullscreenEventHandler:(id)a3
{
  movementTimer = self->_movementTimer;
  if (movementTimer)
  {
    [(CADisplayLink *)movementTimer invalidate];
    double v5 = self->_movementTimer;
    self->_movementTimer = 0;
  }
  self->_fullScreenZoomVelocitdouble y = 0.0;

  [(ZWRootViewController *)self _updateSystemGestureDisablingAssertions];
}

- (void)endZoomMovementWithFullscreenEventHandler:(id)a3
{
  self->_fullScreenZoomStartPosition = CGPointZero;
  id v3 = [(ZWRootViewController *)self activeLensViewController];
  [v3 zoomMovementDidEnd];
}

- (void)fullscreenEventHandler:(id)a3 continueZoomMovementWithVelocity:(double)a4 angle:(double)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __86__ZWRootViewController_fullscreenEventHandler_continueZoomMovementWithVelocity_angle___block_invoke;
  v8[3] = &unk_79550;
  void v8[4] = self;
  id v9 = a3;
  double v10 = a4;
  double v11 = a5;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void __86__ZWRootViewController_fullscreenEventHandler_continueZoomMovementWithVelocity_angle___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) activeLensViewController];
  if (([v14 inStandbyMode] & 1) == 0)
  {
    [*(id *)(a1 + 32) stopZoomMovementWithVelocityWithFullscreenEventHandler:*(void *)(a1 + 40)];
    if (*(double *)(a1 + 48) >= 125.0)
    {
      [*(id *)(a1 + 32) _interfaceAwareAdjustedAngleForScreenAngle:*(double *)(a1 + 56)];
      double v3 = v2;
      BOOL v4 = 1;
      *(unsigned char *)(*(void *)(a1 + 32) + 688) = 1;
      uint64_t v5 = *(void *)(a1 + 32) + 736;
      *(double *)uint64_t v5 = ZOTCalculateDistanceForAngle(v2);
      *(void *)(v5 + 8) = v6;
      *(double *)(*(void *)(a1 + 32) + 728) = ZOTNormalizeVelocity(*(double *)(a1 + 48));
      if (v3 <= 60.0 || v3 >= 120.0) {
        BOOL v4 = v3 < 300.0 && v3 > 240.0;
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 753) = v4;
      BOOL v8 = 1;
      if (v3 >= 30.0 && v3 <= 330.0)
      {
        BOOL v8 = v3 > 150.0;
        if (v3 >= 210.0) {
          BOOL v8 = 0;
        }
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 752) = v8;
      *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 760) = CFAbsoluteTimeGetCurrent();
      uint64_t v9 = +[CADisplayLink displayLinkWithTarget:*(void *)(a1 + 32) selector:"_zoomMovementHeartbeat"];
      uint64_t v10 = *(void *)(a1 + 32);
      double v11 = *(void **)(v10 + 768);
      *(void *)(v10 + 768) = v9;

      double v12 = *(void **)(*(void *)(a1 + 32) + 768);
      double v13 = +[NSRunLoop mainRunLoop];
      [v12 addToRunLoop:v13 forMode:NSRunLoopCommonModes];

      *(unsigned char *)(*(void *)(a1 + 32) + 688) = 0;
    }
  }
}

- (void)blockNotificationCenterGestureIfNeededWithFullscreenEventHandler:(id)a3
{
  unsigned int v4 = [(ZWRootViewController *)self _shouldBlockShowNotificationGesture];
  uint64_t v5 = [(ZWRootViewController *)self disableNotificationCenterAssertionFullscreenLens];

  if (!v4 || v5)
  {
    if ((v4 & 1) == 0)
    {
      [(ZWRootViewController *)self setDisableNotificationCenterAssertionFullscreenLens:0];
    }
  }
  else
  {
    id v6 = +[AXAssertion assertionWithType:AXAssertionTypeDisableNotificationCenterGesture identifier:@"Zoom: Fullscreen lens not on edge"];
    [(ZWRootViewController *)self setDisableNotificationCenterAssertionFullscreenLens:v6];
  }
}

- (void)blockControlCenterGestureIfNeededWithFullscreenEventHandler:(id)a3
{
  unsigned int v4 = [(ZWRootViewController *)self _shouldBlockShowControlCenterGesture];
  uint64_t v5 = [(ZWRootViewController *)self disableControlCenterAssertionFullscreenLens];

  if (!v4 || v5)
  {
    if ((v4 & 1) == 0)
    {
      [(ZWRootViewController *)self setDisableControlCenterAssertionFullscreenLens:0];
    }
  }
  else
  {
    id v6 = +[AXAssertion assertionWithType:AXAssertionTypeDisableControlCenterGesture identifier:@"Zoom: Fullscreen lens not on edge"];
    [(ZWRootViewController *)self setDisableControlCenterAssertionFullscreenLens:v6];
  }
}

- (double)storedZoomLevelWithFullscreenEventHandler:(id)a3
{
  double v3 = +[ZWCoalescedSettings sharedInstance];
  [v3 zoomFactor];
  double v5 = v4;

  return v5;
}

- (CGPoint)zoomLocationWithFullscreenEventHandler:(id)a3
{
  double v3 = +[ZWCoalescedSettings sharedInstance];
  [v3 zoomPanOffset];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)fullscreenEventHandler:(id)a3 storeZoomLevel:(double)a4 location:(CGPoint)a5 zoomed:(BOOL)a6 forKey:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v10 = +[ZWCoalescedSettings sharedInstance];
  unsigned __int8 v11 = [v10 zoomInStandby];

  if ((v11 & 1) == 0)
  {
    [(ZWRootViewController *)self zoomFactor];
    unsigned int v12 = -[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:");
    double v13 = +[ZWCoalescedSettings sharedInstance];
    id v14 = v13;
    if (v12)
    {
      [v13 setZoomInStandby:1];
    }
    else
    {
      [v13 setZoomInStandby:0];

      [(ZWRootViewController *)self zoomFactor];
      double v16 = v15;
      id v14 = +[ZWCoalescedSettings sharedInstance];
      [v14 setZoomFactor:v16];
    }
  }
  id v17 = +[ZWCoalescedSettings sharedInstance];
  objc_msgSend(v17, "setZoomPanOffset:", x, y);
}

- (void)setGutterDistanceForUnitTests:(double)a3 scaleFactor:(double)a4
{
  if (self->_inUnitTestingMode)
  {
    ZOTSetGutterDistanceForUnitTests(a3);
    ZOTSetUnitTestScaleFactor(a4);
  }
}

- (BOOL)usingRelativePushPanningWithFullscreenEventHandler:(id)a3
{
  return self->_usingRelativePushPanning;
}

- (void)fullscreenEventHandler:(id)a3 setUsingRelativePushPanning:(BOOL)a4
{
  self->_usingRelativePushPanning = a4;
}

- (BOOL)fullscreenEventHandler:(id)a3 autopanWithLocation:(CGPoint)a4 initialSingleFingerLocation:(CGPoint)a5 distance:(double)a6 animationDuration:(double)a7 useGutterDistance:(BOOL)a8 pointHasBeenMapped:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double y = a4.y;
  double x = a4.x;
  id v16 = a3;
  double v102 = a7;
  if (v9)
  {
    [(ZWRootViewController *)self zoomFrame];
    double v18 = v17;
    double v20 = v19;
    double width = v21;
    double height = v23;
    [(ZWRootViewController *)self zoomFrame];
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:", x, y, v25, v26, v27, v28);
  }
  else
  {
    double v31 = [(ZWRootViewController *)self activeLensViewController];
    double v32 = [(ZWRootViewController *)self fullscreenLensViewController];

    if (v31 == v32)
    {
      [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
      double width = v37;
      double height = v38;
      -[ZWRootViewController _denormalizePointForCurrentOrientation:](self, "_denormalizePointForCurrentOrientation:", x, y);
      double x = v39;
      double y = v40;
      double v20 = 0.0;
      double v18 = 0.0;
      goto LABEL_12;
    }
    id v33 = [(ZWRootViewController *)self activeLensViewController];
    double v34 = [(ZWRootViewController *)self pipLensViewController];

    if (v33 == v34)
    {
      double v41 = [(ZWRootViewController *)self pipLensViewController];
      id v42 = [v41 view];
      double v43 = [(ZWRootViewController *)self pipLensViewController];
      double v44 = [v43 view];
      [v44 bounds];
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v53 = [(ZWRootViewController *)self containerView];
      objc_msgSend(v42, "convertRect:toView:", v53, v46, v48, v50, v52);

      UIRectInset();
      double v18 = v54;
      double v20 = v55;
      double width = v56;
      double height = v57;
    }
    else
    {
      double v35 = [(ZWRootViewController *)self activeLensViewController];
      double v36 = [(ZWRootViewController *)self dockedLensViewController];

      if (v35 != v36)
      {
        double v18 = CGRectZero.origin.x;
        double v20 = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        goto LABEL_12;
      }
      unsigned int v58 = [(ZWRootViewController *)self dockedLensViewController];
      double v59 = [v58 dockedLensView];
      [v59 frame];
      double v18 = v60;
      double v20 = v61;
      double width = v62;
      double height = v63;
    }
    -[ZWRootViewController _denormalizePointForCurrentOrientation:](self, "_denormalizePointForCurrentOrientation:", x, y, *(void *)&v102);
  }
  double x = v29;
  double y = v30;
LABEL_12:
  int v64 = ZOTScreenRegionForPoint(v10, x, y, v18, v20, width, height);
  if (self->_usingRelativePushPanning) {
    int v64 = ZOTScreenRegionForRelativePushPan((uint64_t)[(ZWRootViewController *)self interfaceOrientation]);
  }
  if (v64)
  {
    double v65 = CGPointZero.y;
    if ((v64 & 4) != 0) {
      double v66 = a6;
    }
    else {
      double v66 = 0.0;
    }
    double v67 = v65 - v66;
    double v68 = v65 + a6;
    if ((v64 & 8) != 0) {
      double v69 = v68;
    }
    else {
      double v69 = v67;
    }
    if ((v64 & 8) != 0) {
      char v70 = 1;
    }
    else {
      char v70 = (v64 & 4) >> 2;
    }
    if (v64) {
      double v71 = a6;
    }
    else {
      double v71 = 0.0;
    }
    double v72 = CGPointZero.x - v71;
    if ((v64 & 2) != 0) {
      char v73 = 1;
    }
    else {
      char v73 = v64 & 1;
    }
    if ((v64 & 2) != 0) {
      double v74 = CGPointZero.x + a6;
    }
    else {
      double v74 = v72;
    }
    [(ZWRootViewController *)self zoomFactor];
    double v76 = v75;
    [(ZWRootViewController *)self zoomPanOffset];
    double v78 = v74 + v77;
    double v80 = v69 + v79;
    BOOL v81 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v81, "validPanOffsetForProposedOffset:proposedZoomFactor:", v78, v80, v76);
    double v83 = v82;
    double v85 = v84;

    id v86 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v86, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 1, v78, v80, v83, v85);

    double v87 = vabdd_f64(v83, v78);
    double v88 = vabdd_f64(v85, v80);
    double v89 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v89, "offsetByPanningWithDelta:axis:zoomFactor:", 6, v74, v69, v76);
    double v91 = v90;
    double v93 = v92;

    [(ZWRootViewController *)self zoomPanOffset];
    BOOL v96 = v91 == v95 && v93 == v94;
    if (!v96
      || ([(ZWRootViewController *)self activeLensViewController],
          id v97 = objc_claimAutoreleasedReturnValue(),
          [(ZWRootViewController *)self fullscreenLensViewController],
          BOOL v98 = objc_claimAutoreleasedReturnValue(),
          v98,
          v97,
          v97 == v98))
    {
      -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v91, v93);
      double v99 = block;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke_2;
      block[3] = &unk_79010;
      void block[4] = self;
      *(double *)&void block[5] = v76;
      *(double *)&void block[6] = v91;
      *(double *)&block[7] = v93;
      block[8] = v103;
    }
    else
    {
      double v99 = v105;
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke;
      v105[3] = &unk_78CD0;
      v105[4] = self;
      *(double *)&v105[5] = v74;
      *(double *)&v105[6] = v69;
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v99);
    BOOL v100 = v73 & (v87 < 2.22044605e-16) | v70 & (v88 < 2.22044605e-16);
  }
  else
  {
    BOOL v100 = 0;
  }

  return v100;
}

id __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [v2 activeLensViewController];
  objc_msgSend(v2, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v3, 0, 1, *(double *)(a1 + 40), *(double *)(a1 + 48));

  double v4 = *(void **)(a1 + 32);

  return [v4 _updateMinimapStatus];
}

id __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) activeLensViewController];
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 64);
  double v5 = [*(id *)(a1 + 32) fullscreenZoomDidAutopanUnitTestCallback];
  objc_msgSend(v2, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 1, v5, v3, *(double *)(a1 + 48), *(double *)(a1 + 56), v4);

  double v6 = *(void **)(a1 + 32);

  return [v6 _updateMinimapStatus];
}

- (BOOL)fullscreenEventHandler:(id)a3 autopanShouldStartWithPoint:(CGPoint)a4 speedFactor:(double *)a5 initialSingleFingerLocation:(CGPoint)a6 fingerCount:(double)a7 pointHasBeenMapped:(BOOL)a8
{
  BOOL v8 = a8;
  double y = a6.y;
  double x = a6.x;
  double v13 = a4.y;
  double v14 = a4.x;
  [(ZWRootViewController *)self zoomFactor];
  double v64 = v16;
  double v17 = [(ZWRootViewController *)self activeLensViewController];
  double v63 = a7;
  if (v8)
  {
    [(ZWRootViewController *)self zoomFrame];
    double v19 = v18;
    double v21 = v20;
    double width = v22;
    double height = v24;
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:", v14, v13, v18, v20, v22, v24);
    double v14 = v26;
    double v13 = v27;
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:");
LABEL_8:
    double x = v28;
    double y = v29;
    goto LABEL_9;
  }
  double v30 = [(ZWRootViewController *)self activeLensViewController];
  double v31 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v30 == v31)
  {
    [(ZWRootViewController *)self _screenSizeForCurrentOrientation];
    double width = v34;
    double height = v35;
    -[ZWRootViewController _denormalizePointForCurrentOrientation:](self, "_denormalizePointForCurrentOrientation:", v14, v13);
    double v14 = v36;
    double v13 = v37;
    -[ZWRootViewController _denormalizePointForCurrentOrientation:](self, "_denormalizePointForCurrentOrientation:", x, y);
    double x = v38;
    double y = v39;
    double v21 = 0.0;
    double v19 = 0.0;
  }
  else
  {
    double v32 = [(ZWRootViewController *)self activeLensViewController];
    id v33 = [(ZWRootViewController *)self pipLensViewController];

    if (v32 == v33)
    {
      double v40 = [(ZWRootViewController *)self pipLensViewController];
      double v41 = [v40 view];
      id v42 = [(ZWRootViewController *)self pipLensViewController];
      double v43 = [v42 view];
      [v43 bounds];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v52 = [(ZWRootViewController *)self containerView];
      objc_msgSend(v41, "convertRect:toView:", v52, v45, v47, v49, v51);

      UIRectInset();
      double v19 = v53;
      double v21 = v54;
      double width = v55;
      double height = v56;
      -[ZWRootViewController _denormalizePointForCurrentOrientation:](self, "_denormalizePointForCurrentOrientation:", v14, v13);
      double v14 = v57;
      double v13 = v58;
      -[ZWRootViewController _denormalizePointForCurrentOrientation:](self, "_denormalizePointForCurrentOrientation:", x, y);
      goto LABEL_8;
    }
    double v19 = CGRectZero.origin.x;
    double v21 = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
LABEL_9:
  char started = 0;
  if (([v17 inStandbyMode] & 1) == 0 && v64 > AXZoomMinimumZoomLevel)
  {
    BOOL usingRelativePushPanning = self->_usingRelativePushPanning;
    char started = ZOTShouldStartAutopan(a5, &usingRelativePushPanning, v14, v13, v63, x, y, v64, v59, v60, v19, v21, width, height);
    self->_BOOL usingRelativePushPanning = usingRelativePushPanning;
  }

  return started;
}

- (BOOL)_watchUIInverted
{
  return 0;
}

- (int64_t)interfaceOrientationWithFullscreenEventHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __71__ZWRootViewController_interfaceOrientationWithFullscreenEventHandler___block_invoke;
  v8[3] = &unk_792B8;
  void v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(v5, v8);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __71__ZWRootViewController_interfaceOrientationWithFullscreenEventHandler___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)touchTrapView:(id)a3 didTrapTouches:(id)a4 withEvent:(id)a5
{
  id v9 = a3;
  int64_t v6 = [(ZWRootViewController *)self pipLensViewController];
  if ([v6 isInLensResizingMode])
  {
  }
  else
  {
    double v7 = [(ZWRootViewController *)self dockedLensViewController];
    unsigned __int8 v8 = [v7 isInDockResizingMode];

    if ((v8 & 1) == 0) {
      _AXAssert();
    }
  }
  [(ZWRootViewController *)self touchTrapViewActivated:v9];
}

- (void)touchTrapViewActivated:(id)a3
{
  [(ZWRootViewController *)self _setPIPLensResizingEnabled:0];

  [(ZWRootViewController *)self _setDockResizingEnabled:0];
}

- (BOOL)touchTrapView:(id)a3 shouldReportSelfInHitTestAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unsigned __int8 v8 = [(ZWRootViewController *)self activeLensViewController];
  id v9 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v8 == v9) {
    goto LABEL_12;
  }
  BOOL v10 = [(ZWRootViewController *)self activeLensViewController];
  uint64_t v11 = [(ZWRootViewController *)self pipLensViewController];
  if (v10 == v11)
  {
    uint64_t v12 = [(ZWRootViewController *)self pipLensViewController];
    unsigned int v13 = [v12 isInLensResizingMode];

    if (!v13) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v14 = [(ZWRootViewController *)self activeLensViewController];
  double v15 = [(ZWRootViewController *)self dockedLensViewController];
  if (v14 == v15)
  {
    double v16 = [(ZWRootViewController *)self dockedLensViewController];
    unsigned int v17 = [v16 isInDockResizingMode];

    if (!v17) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v18 = [(ZWRootViewController *)self activeLensViewController];
  double v19 = [v18 view];
  objc_msgSend(v7, "convertPoint:toView:", v19, x, y);
  double v21 = v20;
  double v23 = v22;

  double v24 = [(ZWRootViewController *)self activeLensViewController];
  double v25 = [(ZWRootViewController *)self dockedLensViewController];
  if (v24 != v25)
  {

    goto LABEL_11;
  }
  double v26 = [(ZWRootViewController *)self dockedLensViewController];
  double v27 = [v26 toggleZoomRegionButton];
  [v27 frame];
  v40.double x = v21;
  v40.double y = v23;
  BOOL v28 = CGRectContainsPoint(v41, v40);

  if (v28)
  {
LABEL_12:
    char v31 = 0;
    goto LABEL_13;
  }
LABEL_11:
  double v29 = [(ZWRootViewController *)self pipLensViewController];
  id v30 = objc_msgSend(v29, "lensEdgeForTouchAtLocation:", v21, v23);

  if ((unint64_t)v30 > 1) {
    goto LABEL_12;
  }
  id v33 = [(ZWRootViewController *)self slugViewController];
  double v34 = [v33 view];
  if ([v34 isHidden])
  {

    char v31 = 1;
  }
  else
  {
    double v35 = [(ZWRootViewController *)self slugViewController];
    double v36 = [v35 view];
    double v37 = [(ZWRootViewController *)self slugViewController];
    double v38 = [v37 view];
    objc_msgSend(v7, "convertPoint:toView:", v38, x, y);
    unsigned __int8 v39 = objc_msgSend(v36, "pointInside:withEvent:", 0);

    char v31 = v39 ^ 1;
  }
LABEL_13:

  return v31;
}

- (void)_updateSystemGestureDisablingAssertionsForFullscreenZoom
{
  [(ZWRootViewController *)self blockControlCenterGestureIfNeededWithFullscreenEventHandler:0];

  [(ZWRootViewController *)self blockNotificationCenterGestureIfNeededWithFullscreenEventHandler:0];
}

- (void)_zoomMovementHeartbeat
{
  double v3 = CFAbsoluteTimeGetCurrent() - self->_lastUpdateVelocityTime;

  [(ZWRootViewController *)self _zoomMovementHeartbeat:0 fullscreenEventHandler:v3];
}

- (void)_zoomMovementHeartbeat:(double)a3 fullscreenEventHandler:(id)a4
{
  id v41 = a4;
  [(ZWRootViewController *)self zoomFactor];
  double v7 = v6;
  [(ZWRootViewController *)self zoomPanOffset];
  double v9 = v8;
  double v11 = v10;
  ZOTDistanceForTimeAndVelocityWithMaxDistance(a3);
  double v13 = v12;
  double v15 = v14;
  double v16 = fabs(v14);
  if (fabs(v12) >= 1.0 || v16 >= 1.0)
  {
    self->_validatePanOffsetWithFullscreen = 1;
    double v18 = v9 + v12;
    double v19 = v11 + v15;
    double v20 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v20, "validPanOffsetForProposedOffset:proposedZoomFactor:", v18, v11 + v15, v7);
    double v22 = v21;
    double v24 = v23;

    double v25 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v25, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0, v18, v19, v22, v24);

    double v26 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v26, "offsetByPanningWithDelta:axis:zoomFactor:", 6, v13, v15, v7);
    double v28 = v27;
    double v30 = v29;

    -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v28, v30);
    char v31 = [(ZWRootViewController *)self activeLensViewController];
    objc_msgSend(v31, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v7, v28, v30, -1.0);

    self->_validatePanOffsetWithFullscreen = 0;
    if (v22 == v28 && v24 == v30)
    {
      double v33 = vabdd_f64(v24, v19);
      double v34 = [(ZWRootViewController *)self activeLensViewController];
      double v35 = [(ZWRootViewController *)self dockedLensViewController];

      if (v34 != v35)
      {
LABEL_19:
        if ((v33 < 2.22044605e-16 || !self->_careBorderY)
          && (vabdd_f64(v22, v18) < 2.22044605e-16 || !self->_careBorderX))
        {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      double v36 = [(ZWRootViewController *)self dockedLensViewController];
      if ([v36 dockPosition])
      {
        double v37 = [(ZWRootViewController *)self dockedLensViewController];
        double v38 = (char *)[v37 dockPosition];

        if (v38 != (unsigned char *)&dword_0 + 3)
        {
          uint64_t v39 = 752;
          goto LABEL_16;
        }
      }
      else
      {
      }
      uint64_t v39 = 753;
LABEL_16:
      if (*((unsigned char *)&self->super.super.super.isa + v39))
      {
        CGPoint v40 = [(ZWRootViewController *)self dockedLensViewController];
        *((unsigned char *)&self->super.super.super.isa + v39) = [v40 zoomRegionOnScreenReplicatorEdge];
      }
      else
      {
        *((unsigned char *)&self->super.super.super.isa + v39) = 0;
      }
      goto LABEL_19;
    }
  }
LABEL_23:
  [(ZWRootViewController *)self stopZoomMovementWithVelocityWithFullscreenEventHandler:v41];
LABEL_24:
}

- (double)_calculateDurationForVelocity:(double)a3
{
  return a3 * 2300.0 * 0.125 * sqrt(pow(a3 * 2300.0, 1.5));
}

- (BOOL)_shouldBlockShowNotificationGesture
{
  double v3 = [(ZWRootViewController *)self activeLensViewController];
  id v4 = [(ZWRootViewController *)self fullscreenLensViewController];

  if (v3 != v4) {
    return 0;
  }
  double v5 = [(ZWRootViewController *)self activeLensViewController];
  if ([v5 inStandbyMode])
  {

    return 0;
  }
  unsigned __int8 v6 = [(ZWRootViewController *)self _isZoomedToMinimum];

  if (v6) {
    return 0;
  }
  double v8 = [(ZWRootViewController *)self activeLensViewController];
  double v9 = [v8 lensZoomView];
  double v10 = [v9 zoomReplicatorLayer];
  [v10 position];
  double v12 = v11;

  double v13 = [(ZWRootViewController *)self activeLensViewController];
  double v14 = [v13 lensZoomView];
  double v15 = [v14 zoomReplicatorLayer];
  [v15 bounds];
  double v17 = v16;

  return v12 + v17 * -0.5 >= 15.0;
}

- (BOOL)_shouldBlockShowControlCenterGesture
{
  double v3 = [(ZWRootViewController *)self activeLensViewController];
  if ([v3 inStandbyMode])
  {

    return 0;
  }
  unsigned __int8 v4 = [(ZWRootViewController *)self _isZoomedToMinimum];

  if (v4) {
    return 0;
  }
  double v5 = [(ZWRootViewController *)self activeLensViewController];
  [v5 zoomPanOffset];
  double v7 = v6;

  double v8 = [(ZWRootViewController *)self activeLensViewController];
  double v9 = [(ZWRootViewController *)self activeLensViewController];
  [v9 zoomFactor];
  objc_msgSend(v8, "maximumPanOffsetWithZoomFactor:");
  double v11 = v10;

  if (!AXDeviceHasHomeButton() || !AXDeviceIsPhoneIdiom()) {
    return v7 + v11 >= 30.0;
  }
  double v12 = [(ZWRootViewController *)self activeLensViewController];
  double v13 = [(ZWRootViewController *)self fullscreenLensViewController];

  BOOL result = 0;
  if (v12 == v13 && v11 - v7 >= 30.0) {
    return 1;
  }
  return result;
}

- (double)_interfaceAwareAdjustedAngleForScreenAngle:(double)a3
{
  unsigned __int8 v4 = [(ZWRootViewController *)self view];
  double v5 = [v4 window];
  id v6 = [v5 interfaceOrientation];

  switch((unint64_t)v6)
  {
    case 0uLL:
    case 1uLL:
      double result = a3;
      break;
    case 2uLL:
      double result = a3 + -180.0;
      if (a3 + -180.0 < 0.0)
      {
        double v8 = 180.0;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      double result = a3 + -270.0;
      if (a3 + -270.0 < 0.0)
      {
        double v8 = 90.0;
        goto LABEL_10;
      }
      break;
    case 4uLL:
      double result = a3 + -90.0;
      if (a3 + -90.0 < 0.0)
      {
        double v8 = 270.0;
LABEL_10:
        double result = a3 + v8;
      }
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (CGPoint)_convertPointFromNormalizedToWindow:(CGPoint)a3
{
  double v4 = ZOTDenormalizePoint(a3.x);
  double v6 = v5;
  double v7 = [(ZWRootViewController *)self view];
  double v8 = [v7 window];
  double v9 = ZWConvertPointInScreenPixelsToViewCoordinates(v8, v4, v6);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 0;
}

- (void)handleReachabilityToggled:(double)a3
{
  double v5 = [(ZWRootViewController *)self activeLensViewController];
  unsigned __int8 v6 = [v5 inStandbyMode];

  if ((v6 & 1) == 0)
  {
    [(ZWRootViewController *)self reachabilityOffset];
    double v8 = v7;
    if (vabdd_f64(a3, v7) >= 0.00000011920929)
    {
      double v9 = [(ZWRootViewController *)self activeLensViewController];
      double v10 = [(ZWRootViewController *)self pipLensViewController];

      if (v9 == v10)
      {
        double v11 = [(ZWRootViewController *)self activeLensViewController];
        -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:](self, "_moveZoomItemWithController:byDelta:animated:userInitiated:", v11, 0, 0, 0.0, a3 - v8);
      }
      [(ZWRootViewController *)self setReachabilityOffset:a3];
    }
  }
}

- (void)didAnimateForReachabilityToOffset:(double)a3
{
  double v4 = [(ZWRootViewController *)self cachedValuesSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__ZWRootViewController_didAnimateForReachabilityToOffset___block_invoke;
  block[3] = &unk_78CA8;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __58__ZWRootViewController_didAnimateForReachabilityToOffset___block_invoke(uint64_t a1)
{
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 112)))
  {
    double v2 = *(void **)(a1 + 32);
    double v3 = v2 + 10;
    double v4 = [v2 activeLensViewController];
    double v5 = [v4 lensZoomView];
    objc_msgSend(v5, "zw_convertBoundsToScreenCoordinates");
    v3[4] = v6;
    v3[5] = v7;
    v3[6] = v8;
    v3[7] = v9;
  }
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 176)))
  {
    double v10 = *(void **)(a1 + 32);
    double v11 = v10 + 10;
    double v12 = [v10 menuViewController];
    double v13 = [v12 view];
    objc_msgSend(v13, "zw_convertBoundsToScreenCoordinates");
    v11[12] = v14;
    v11[13] = v15;
    v11[14] = v16;
    v11[15] = v17;
  }
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 144)))
  {
    double v18 = *(void **)(a1 + 32);
    double v19 = v18 + 10;
    double v20 = [v18 slugViewController];
    [v20 slugRingViewBoundsInScreenCoordinates];
    v19[8] = v21;
    v19[9] = v22;
    v19[10] = v23;
    v19[11] = v24;
  }
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 224)))
  {
    double v25 = *(void **)(a1 + 32);
    double v26 = v25 + 10;
    double v27 = [v25 dockedLensViewController];
    double v28 = [v27 dockedLensView];
    [v28 frame];
    v26[18] = v29;
    v26[19] = v30;
    v26[20] = v31;
    v26[21] = v32;
  }
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 256)))
  {
    double v33 = *(void **)(a1 + 32);
    double v34 = v33 + 10;
    double v35 = [v33 dockedLensViewController];
    [v35 zoomRegionFrame];
    v34[22] = v36;
    v34[23] = v37;
    v34[24] = v38;
    v34[25] = v39;
  }
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 288)))
  {
    CGPoint v40 = *(void **)(a1 + 32);
    id v41 = v40 + 10;
    id v42 = [v40 dockedLensViewController];
    double v43 = [v42 toggleZoomRegionButton];
    [v43 frame];
    v41[26] = v44;
    v41[27] = v45;
    v41[28] = v46;
    v41[29] = v47;
  }
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 320)))
  {
    double v48 = *(void **)(a1 + 32);
    double v49 = v48 + 10;
    id v54 = [v48 dockedLensViewController];
    [v54 frameForResizeDrag];
    v49[30] = v50;
    v49[31] = v51;
    v49[32] = v52;
    v49[33] = v53;
  }
}

- (void)_updateZoomListeners
{
  v23[0] = ZWAttributeKeyAppActivationAnimationStartDelay;
  [(ZWRootViewController *)self handleAppActivationAnimationDelay];
  uint64_t v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v24[0] = v22;
  v23[1] = ZWAttributeKeyAppDeactivationAnimationStartDelay;
  [(ZWRootViewController *)self handleAppDeactivationAnimationDelay];
  uint64_t v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v24[1] = v21;
  v23[2] = ZWAttributeKeyAppSwitcherRevealAnimationStartDelay;
  [(ZWRootViewController *)self handleAppSwitcherRevealAnimationDelay];
  double v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v24[2] = v20;
  v23[3] = ZWAttributeKeyReachabilityScaleFactor;
  [(ZWRootViewController *)self reachabilityScaleFactor];
  double v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v24[3] = v19;
  v23[4] = ZWAttributeKeyZoomLevel;
  [(ZWRootViewController *)self zoomLevel];
  double v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v24[4] = v18;
  void v23[5] = ZWAttributeKeyZoomFrame;
  [(ZWRootViewController *)self zoomFrame];
  uint64_t v17 = NSStringFromCGRect(v25);
  void v24[5] = v17;
  v23[6] = ZWAttributeKeyActiveZoomMode;
  uint64_t v16 = [(ZWRootViewController *)self activeZoomMode];
  v24[6] = v16;
  v23[7] = ZWAttributeKeyInStandbyMode;
  uint64_t v15 = [(ZWRootViewController *)self activeLensViewController];
  uint64_t v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 inStandbyMode]);
  v24[7] = v14;
  v23[8] = ZWAttributeKeyShouldSuppressKeyCommandHUD;
  double v3 = +[NSNumber numberWithBool:[(ZWRootViewController *)self shouldSuppressKeyCommandHUD]];
  v24[8] = v3;
  v23[9] = ZWAttributeKeyIsAnimating;
  BOOL v4 = [(ZWRootViewController *)self zoomIsAnimatingDueToTransition]
    || [(ZWRootViewController *)self zoomIsAnimatingDueToStandbyToggle]
    || [(ZWRootViewController *)self zoomIsAnimating];
  double v5 = +[NSNumber numberWithInt:v4];
  v24[9] = v5;
  v23[10] = ZWAttributeKeyDisplayID;
  uint64_t v6 = [(ZWRootViewController *)self view];
  uint64_t v7 = [v6 window];
  uint64_t v8 = [v7 screen];
  uint64_t v9 = [v8 displayIdentity];
  double v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 displayID]);
  v24[10] = v10;
  v23[11] = ZWAttributeKeyIsMainDisplay;
  double v11 = +[NSNumber numberWithBool:[(ZWRootViewController *)self isMainDisplay]];
  v24[11] = v11;
  double v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:12];

  double v13 = [(ZWRootViewController *)self axuiService];
  [v13 updateZoomListeners:v12];
}

- (BOOL)_isZoomFactorAtMinimum:(double)a3
{
  BOOL v3 = vabdd_f64(a3, AXZoomMinimumZoomLevel) <= 0.0001;
  return AXZoomMinimumZoomLevel >= a3 || v3;
}

- (void)updateFocusWithSmartZoom:(id)a3
{
  id v6 = a3;
  AXDeviceIsTV();
  if ([(ZWKeyboardContext *)self->_kbContext zoomFollowsFocus])
  {
    BOOL v4 = [(ZWRootViewController *)self lensAutopanner];
    unsigned __int8 v5 = [v4 isAutomovingLens];

    if ((v5 & 1) == 0)
    {
      [v6 focusRect];
      -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:](self, "_focusLensOnRect:panLensContent:recentreLens:animated:completion:", 1, 1, 0, 0);
    }
  }
}

- (BOOL)isZoomInStandByModeWithSmartZoom:(id)a3
{
  BOOL v3 = [(ZWRootViewController *)self activeLensViewController];
  unsigned __int8 v4 = [v3 inStandbyMode];

  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setInUnitTestingMode:(BOOL)a3
{
  self->_inUnitTestingMode = a3;
}

- (void)setUnitTestDelegate:(id)a3
{
}

- (id)getLastSpeakUnderFingerPhrase
{
  double v2 = +[AXSpeakFingerManager sharedInstance];
  BOOL v3 = [v2 getLastSpeakUnderFingerPhrase];

  return v3;
}

- (AXUIService)axuiService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axuiService);

  return (AXUIService *)WeakRetained;
}

- (void)setAxuiService:(id)a3
{
}

- (BOOL)brailleInputUIIsShowing
{
  return self->_brailleInputUIIsShowing;
}

- (void)setBrailleInputUIIsShowing:(BOOL)a3
{
  self->_brailleInputUIIsShowing = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (ZWTouchTrapView)touchTrapView
{
  return self->_touchTrapView;
}

- (void)setTouchTrapView:(id)a3
{
}

- (UIView)scrollTrapView
{
  return self->_scrollTrapView;
}

- (void)setScrollTrapView:(id)a3
{
}

- (ZWUIMinimapView)minimapView
{
  return self->_minimapView;
}

- (void)setMinimapView:(id)a3
{
}

- (ZWAlertManager)zoomAlertManager
{
  return self->_zoomAlertManager;
}

- (void)setZoomAlertManager:(id)a3
{
}

- (BOOL)zoomWasUnzoomedDueToAppTransition
{
  return self->_zoomWasUnzoomedDueToAppTransition;
}

- (void)setZoomWasUnzoomedDueToAppTransition:(BOOL)a3
{
  self->_zoomWasUnzoomedDueToAppTransition = a3;
}

- (BOOL)zoomIsAnimatingDueToTransition
{
  return self->_zoomIsAnimatingDueToTransition;
}

- (void)setZoomIsAnimatingDueToTransition:(BOOL)a3
{
  self->_zoomIsAnimatingDueToTransition = a3;
}

- (BOOL)triedToRezoomForDockTransition
{
  return self->_triedToRezoomForDockTransition;
}

- (void)setTriedToRezoomForDockTransition:(BOOL)a3
{
  self->_triedToRezoomForDockTransition = a3;
}

- (BOOL)zoomIsAnimatingDueToStandbyToggle
{
  return self->_zoomIsAnimatingDueToStandbyToggle;
}

- (void)setZoomIsAnimatingDueToStandbyToggle:(BOOL)a3
{
  self->_zoomIsAnimatingDueToStandbyToggle = a3;
}

- (BOOL)zoomIsAnimating
{
  return self->_zoomIsAnimating;
}

- (void)setZoomIsAnimating:(BOOL)a3
{
  self->_zoomIsAnimating = a3;
}

- (BOOL)triedToToggleStandbyDuringAnimation
{
  return self->_triedToToggleStandbyDuringAnimation;
}

- (void)setTriedToToggleStandbyDuringAnimation:(BOOL)a3
{
  self->_triedToToggleStandbyDuringAnimation = a3;
}

- (BOOL)toggleStandbyOnNextCommandChange
{
  return self->_toggleStandbyOnNextCommandChange;
}

- (void)setToggleStandbyOnNextCommandChange:(BOOL)a3
{
  self->_toggleStandbyOnNextCommandChange = a3;
}

- (double)panOffsetXBeforeTransition
{
  return self->_panOffsetXBeforeTransition;
}

- (void)setPanOffsetXBeforeTransition:(double)a3
{
  self->_panOffsetXBeforeTransition = a3;
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (ZWSmartZoomManager)smartZoom
{
  return self->_smartZoom;
}

- (void)setSmartZoom:(id)a3
{
}

- (double)lastWheelDelta
{
  return self->_lastWheelDelta;
}

- (void)setLastWheelDelta:(double)a3
{
  self->_lastWheelDelta = a3;
}

- (double)lastScrollTrapOffset
{
  return self->_lastScrollTrapOffset;
}

- (void)setLastScrollTrapOffset:(double)a3
{
  self->_lastScrollTrapOffset = a3;
}

- (BOOL)scrollBeganWhileSnarfingScrolls
{
  return self->_scrollBeganWhileSnarfingScrolls;
}

- (void)setScrollBeganWhileSnarfingScrolls:(BOOL)a3
{
  self->_scrollBeganWhileSnarfingScrolls = a3;
}

- (double)accruedOvershoot
{
  return self->_accruedOvershoot;
}

- (void)setAccruedOvershoot:(double)a3
{
  self->_accruedOvershoot = a3;
}

- (BOOL)isSweepingToNextZoomRow
{
  return self->_isSweepingToNextZoomRow;
}

- (void)setIsSweepingToNextZoomRow:(BOOL)a3
{
  self->_isSweepingToNextZoomRow = a3;
}

- (BOOL)haveTriedScrollingDuringZoomSweep
{
  return self->_haveTriedScrollingDuringZoomSweep;
}

- (void)setHaveTriedScrollingDuringZoomSweep:(BOOL)a3
{
  self->_haveTriedScrollingDuringZoomSweep = a3;
}

- (double)lastEventTime
{
  return self->_lastEventTime;
}

- (void)setLastEventTime:(double)a3
{
  self->_lastEventTime = a3;
}

- (BOOL)snarfingWheelEventsForPan
{
  return self->_snarfingWheelEventsForPan;
}

- (void)setSnarfingWheelEventsForPan:(BOOL)a3
{
  self->_snarfingWheelEventsForPan = a3;
}

- (BOOL)snarfingWheelEventsForZoom
{
  return self->_snarfingWheelEventsForZoom;
}

- (void)setSnarfingWheelEventsForZoom:(BOOL)a3
{
  self->_snarfingWheelEventsForZoom = a3;
}

- (BOOL)carouselLockActive
{
  return self->_carouselLockActive;
}

- (void)setCarouselLockActive:(BOOL)a3
{
  self->_carouselLockActive = a3;
}

- (ZWKeyboardContext)kbContext
{
  return self->_kbContext;
}

- (void)setKbContext:(id)a3
{
}

- (AXAssertion)disableNotificationCenterAssertionPIPLens
{
  return self->_disableNotificationCenterAssertionPIPLens;
}

- (void)setDisableNotificationCenterAssertionPIPLens:(id)a3
{
}

- (AXAssertion)disableControlCenterAssertionPIPLens
{
  return self->_disableControlCenterAssertionPIPLens;
}

- (void)setDisableControlCenterAssertionPIPLens:(id)a3
{
}

- (AXAssertion)disableNotificationCenterAssertionFullscreenLens
{
  return self->_disableNotificationCenterAssertionFullscreenLens;
}

- (void)setDisableNotificationCenterAssertionFullscreenLens:(id)a3
{
}

- (AXAssertion)disableControlCenterAssertionFullscreenLens
{
  return self->_disableControlCenterAssertionFullscreenLens;
}

- (void)setDisableControlCenterAssertionFullscreenLens:(id)a3
{
}

- (AXAssertion)disableHomeGestureAssertion
{
  return self->_disableHomeGestureAssertion;
}

- (void)setDisableHomeGestureAssertion:(id)a3
{
}

- (ZWZoomLensViewController)activeLensViewController
{
  return self->_activeLensViewController;
}

- (BOOL)isActiveLensTransitioning
{
  return self->_activeLensTransitioning;
}

- (void)setActiveLensTransitioning:(BOOL)a3
{
  self->_activeLensTransitioning = a3;
}

- (ZWLensAutopanner)lensAutopanner
{
  return self->_lensAutopanner;
}

- (void)setLensAutopanner:(id)a3
{
}

- (ZWZoomPIPLensViewController)pipLensViewController
{
  return self->_pipLensViewController;
}

- (void)setPipLensViewController:(id)a3
{
}

- (NSLayoutConstraint)lensDragXConstraint
{
  return self->_lensDragXConstraint;
}

- (void)setLensDragXConstraint:(id)a3
{
}

- (NSLayoutConstraint)lensDragYConstraint
{
  return self->_lensDragYConstraint;
}

- (void)setLensDragYConstraint:(id)a3
{
}

- (NSLayoutConstraint)lensWidthConstraint
{
  return self->_lensWidthConstraint;
}

- (void)setLensWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)lensHeightConstraint
{
  return self->_lensHeightConstraint;
}

- (void)setLensHeightConstraint:(id)a3
{
}

- (unint64_t)pipLensEdgeMask
{
  return self->_pipLensEdgeMask;
}

- (void)setPipLensEdgeMask:(unint64_t)a3
{
  self->_pipLensEdgeMask = a3;
}

- (ZWZoomDockedLensViewController)dockedLensViewController
{
  return self->_dockedLensViewController;
}

- (void)setDockedLensViewController:(id)a3
{
}

- (ZWZoomFullscreenLensViewController)fullscreenLensViewController
{
  return self->_fullscreenLensViewController;
}

- (void)setFullscreenLensViewController:(id)a3
{
}

- (ZWZoomSlugViewController)slugViewController
{
  return self->_slugViewController;
}

- (void)setSlugViewController:(id)a3
{
}

- (NSLayoutConstraint)slugRingDragXConstraint
{
  return self->_slugRingDragXConstraint;
}

- (void)setSlugRingDragXConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingDragYConstraint
{
  return self->_slugRingDragYConstraint;
}

- (void)setSlugRingDragYConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingLeadingConstraint
{
  return self->_slugRingLeadingConstraint;
}

- (void)setSlugRingLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingTrailingConstraint
{
  return self->_slugRingTrailingConstraint;
}

- (void)setSlugRingTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingTopConstraint
{
  return self->_slugRingTopConstraint;
}

- (void)setSlugRingTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingBottomConstraint
{
  return self->_slugRingBottomConstraint;
}

- (void)setSlugRingBottomConstraint:(id)a3
{
}

- (unint64_t)slugEdgeMask
{
  return self->_slugEdgeMask;
}

- (void)setSlugEdgeMask:(unint64_t)a3
{
  self->_slugEdgeMask = a3;
}

- (BOOL)pipWasOnBeforeSpeakFingerStarted
{
  return self->_pipWasOnBeforeSpeakFingerStarted;
}

- (void)setPipWasOnBeforeSpeakFingerStarted:(BOOL)a3
{
  self->_pipWasOnBeforeSpeakFingerStarted = a3;
}

- (CGPoint)lastOrbLocation
{
  double x = self->_lastOrbLocation.x;
  double y = self->_lastOrbLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastOrbLocation:(CGPoint)a3
{
  self->_lastOrbLocation = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (ZWMenuViewController)menuViewController
{
  return self->_menuViewController;
}

- (void)setMenuViewController:(id)a3
{
}

- (AXDispatchTimer)idleTouchTimer
{
  return self->_idleTouchTimer;
}

- (void)setIdleTouchTimer:(id)a3
{
}

- (ZWEventProcessor)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (OS_dispatch_queue)cachedValuesSerialQueue
{
  return self->_cachedValuesSerialQueue;
}

- (void)setCachedValuesSerialQueue:(id)a3
{
}

- (AXDispatchTimer)keyRepeatTimer
{
  return self->_keyRepeatTimer;
}

- (void)setKeyRepeatTimer:(id)a3
{
}

- (int64_t)lastKeyboardCommand
{
  return self->_lastKeyboardCommand;
}

- (void)setLastKeyboardCommand:(int64_t)a3
{
  self->_lastKeyboardCommand = a3;
}

- (BOOL)shouldSuppressKeyCommandHUD
{
  return self->_shouldSuppressKeyCommandHUD;
}

- (void)setShouldSuppressKeyCommandHUD:(BOOL)a3
{
  self->_shouldSuppressKeyCommandHUD = a3;
}

- (BSInvalidatable)pointerEventStream
{
  return self->_pointerEventStream;
}

- (void)setPointerEventStream:(id)a3
{
}

- (unsigned)windowContextId
{
  return self->_windowContextId;
}

- (void)setWindowContextId:(unsigned int)a3
{
  self->_windowContextId = a3;
}

- (ZWFakeLaserViewController)fakeLaserVC
{
  return self->_fakeLaserVC;
}

- (void)setFakeLaserVC:(id)a3
{
}

- (UIView)lastHoveredView
{
  return self->_lastHoveredView;
}

- (void)setLastHoveredView:(id)a3
{
}

- (PSPointerClientController)pointerClientController
{
  return self->_pointerClientController;
}

- (void)setPointerClientController:(id)a3
{
}

- (BSInvalidatable)hidePointerAssertion
{
  return self->_hidePointerAssertion;
}

- (void)setHidePointerAssertion:(id)a3
{
}

- (BSInvalidatable)redirectPointerAssertion
{
  return self->_redirectPointerAssertion;
}

- (void)setRedirectPointerAssertion:(id)a3
{
}

- (CGPoint)redirectPointerLocation
{
  double x = self->_redirectPointerLocation.x;
  double y = self->_redirectPointerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRedirectPointerLocation:(CGPoint)a3
{
  self->_redirectPointerLocation = a3;
}

- (CGPoint)lastPointerLocation
{
  double x = self->_lastPointerLocation.x;
  double y = self->_lastPointerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPointerLocation:(CGPoint)a3
{
  self->_lastPointerLocation = a3;
}

- (BOOL)isMainDisplay
{
  return self->_isMainDisplay;
}

- (void)setIsMainDisplay:(BOOL)a3
{
  self->_isMainDispladouble y = a3;
}

- (void)setScreen:(id)a3
{
}

- (BSInvalidatable)hitTestCategoryAssertion
{
  return self->_hitTestCategoryAssertion;
}

- (void)setHitTestCategoryAssertion:(id)a3
{
}

- (UIView)debugFocusView
{
  return self->_debugFocusView;
}

- (void)setDebugFocusView:(id)a3
{
}

- (NSMutableSet)deactivatedAppIDs
{
  return self->_deactivatedAppIDs;
}

- (void)setDeactivatedAppIDs:(id)a3
{
}

- (id)lensTransitionUnitTestCallback
{
  return self->_lensTransitionUnitTestCallback;
}

- (void)setLensTransitionUnitTestCallback:(id)a3
{
}

- (id)zoomMenuVisibilityChangedUnitTestCallback
{
  return self->_zoomMenuVisibilityChangedUnitTestCallback;
}

- (void)setZoomMenuVisibilityChangedUnitTestCallback:(id)a3
{
}

- (id)fullscreenZoomDidAutopanUnitTestCallback
{
  return self->_fullscreenZoomDidAutopanUnitTestCallback;
}

- (void)setFullscreenZoomDidAutopanUnitTestCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fullscreenZoomDidAutopanUnitTestCallback, 0);
  objc_storeStrong(&self->_zoomMenuVisibilityChangedUnitTestCallback, 0);
  objc_storeStrong(&self->_lensTransitionUnitTestCallback, 0);
  objc_storeStrong((id *)&self->_deactivatedAppIDs, 0);
  objc_storeStrong((id *)&self->_debugFocusView, 0);
  objc_storeStrong((id *)&self->_hitTestCategoryAssertion, 0);
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_redirectPointerAssertion, 0);
  objc_storeStrong((id *)&self->_hidePointerAssertion, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_lastHoveredView, 0);
  objc_storeStrong((id *)&self->_fakeLaserVC, 0);
  objc_storeStrong((id *)&self->_pointerEventStream, 0);
  objc_storeStrong((id *)&self->_keyRepeatTimer, 0);
  objc_storeStrong((id *)&self->_cachedValuesSerialQueue, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_idleTouchTimer, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_slugRingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_slugRingTopConstraint, 0);
  objc_storeStrong((id *)&self->_slugRingTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_slugRingLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_slugRingDragYConstraint, 0);
  objc_storeStrong((id *)&self->_slugRingDragXConstraint, 0);
  objc_storeStrong((id *)&self->_slugViewController, 0);
  objc_storeStrong((id *)&self->_fullscreenLensViewController, 0);
  objc_storeStrong((id *)&self->_dockedLensViewController, 0);
  objc_storeStrong((id *)&self->_lensHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lensWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lensDragYConstraint, 0);
  objc_storeStrong((id *)&self->_lensDragXConstraint, 0);
  objc_storeStrong((id *)&self->_pipLensViewController, 0);
  objc_storeStrong((id *)&self->_lensAutopanner, 0);
  objc_storeStrong((id *)&self->_activeLensViewController, 0);
  objc_storeStrong((id *)&self->_disableHomeGestureAssertion, 0);
  objc_storeStrong((id *)&self->_disableControlCenterAssertionFullscreenLens, 0);
  objc_storeStrong((id *)&self->_disableNotificationCenterAssertionFullscreenLens, 0);
  objc_storeStrong((id *)&self->_disableControlCenterAssertionPIPLens, 0);
  objc_storeStrong((id *)&self->_disableNotificationCenterAssertionPIPLens, 0);
  objc_storeStrong((id *)&self->_kbContext, 0);
  objc_storeStrong((id *)&self->_smartZoom, 0);
  objc_storeStrong((id *)&self->_zoomAlertManager, 0);
  objc_storeStrong((id *)&self->_minimapView, 0);
  objc_storeStrong((id *)&self->_scrollTrapView, 0);
  objc_storeStrong((id *)&self->_touchTrapView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_axuiService);
  objc_storeStrong((id *)&self->_unitTestDelegate, 0);
  objc_storeStrong((id *)&self->_movementTimer, 0);

  objc_storeStrong(&self->_voiceOverStatusChangedNotificationObserverToken, 0);
}

@end