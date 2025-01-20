@interface HNDDisplayManager
+ (double)fadeDuration;
- (ASTUIGazePointDelegate)gazePointManager;
- (AXAssertion)disableControlCenterAssertion;
- (AXAssertion)disableNotificationCenterAssertion;
- (AXAssertion)disableSystemGesturesAssertion;
- (AXDispatchTimer)presentHUDViewTimer;
- (AXPIFingerController)fingerController;
- (AXUIClient)userInterfaceClient;
- (BOOL)_nubbitIsOverKeyboard:(CGRect)a3;
- (BOOL)_position:(CGPoint)a3 isOverKeyboard:(CGRect)a4;
- (BOOL)_shouldPreventCalibrationForError:(int64_t)a3;
- (BOOL)_shouldRunAutoHideFingersTimer;
- (BOOL)_shouldSetFingerContentViewToActive:(BOOL)a3;
- (BOOL)_shouldShowLargeContentViewer;
- (BOOL)alwaysShowMenu;
- (BOOL)assistiveTouchMousePointerTimeoutEnabled;
- (BOOL)bubbleCursorIsActive;
- (BOOL)didForceDimissCalibration;
- (BOOL)fingerContentViewIsActive;
- (BOOL)handleRealEvent:(id)a3;
- (BOOL)hoverMovedToNormalizedPoint:(CGPoint)a3 shouldUpdateCurrentPoint:(BOOL)a4;
- (BOOL)inBubbleMode;
- (BOOL)inNubbitMode;
- (BOOL)initialDownMenuCanTransitionToPressDown;
- (BOOL)initialMenuDownHasFinished;
- (BOOL)isCurrentOrientationLandscape;
- (BOOL)isMainDisplay;
- (BOOL)isMenuVisible;
- (BOOL)isShowingCalibrationUI;
- (BOOL)isShowingVirtualTrackpad;
- (BOOL)isViewZoomed;
- (BOOL)multiTouchToolBackgroundEnabled;
- (BOOL)needsRecalibration;
- (BOOL)needsToShowZoomWindow;
- (BOOL)playedHapticForCurrentEvent;
- (BOOL)shouldDelayBeforePresentingHUDView;
- (BOOL)shouldHideCursorsEyeTrackingAutoHide;
- (BOOL)showingHoverOverMenu;
- (BOOL)userInteractionEnabledOnRockerDismissView;
- (BOOL)visualsHidden;
- (CGAffineTransform)_transformForOrientation;
- (CGPoint)_layoutPointForPoint:(CGPoint)a3 screenBounds:(CGRect)a4;
- (CGPoint)_menuPointForFingerLayout;
- (CGPoint)_nubbitPointForEdgePosition;
- (CGPoint)_nubbitPositionForKeyboardFrame:(CGRect)a3;
- (CGPoint)_rotatedNormalizedInitialPoint;
- (CGPoint)_testingRockerPosition;
- (CGPoint)_validateNubbitPosition:(CGPoint)a3 forKeyboard:(BOOL)a4;
- (CGPoint)closestNubbitPositionForPoint:(CGPoint)a3 offsetByMidpoint:(BOOL)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromOrientation:(int)a4;
- (CGPoint)convertPointToIntefaceOrientation:(CGPoint)a3;
- (CGPoint)convertPointToPortraitUpOrientation:(CGPoint)a3;
- (CGPoint)convertToNormalizedInterfaceOrientation:(CGPoint)a3;
- (CGPoint)normalizedPointForDifference:(CGPoint)a3;
- (CGPoint)nubbitPositionForFlick:(CGPoint)a3;
- (CGPoint)point;
- (CGPoint)screenPoint;
- (CGPoint)zoomConvertToReplicatedViewFromTargetPoint:(CGPoint)a3;
- (CGRect)convertFrameToInterfaceOrientation:(CGRect)a3;
- (CGRect)foreheadRect;
- (CGRect)orientedContinuousScrollViewFrameForScrollViewFrame:(CGRect)a3;
- (CGRect)portraitUpScreenBounds;
- (CGRect)rockerFrame;
- (CGRect)screenBounds;
- (CGRect)screenBoundsForRockerButton:(id)a3;
- (HNDBubbleCursorController)bubbleCursorController;
- (HNDDisplayManager)init;
- (HNDDisplayManager)initWithWindow:(id)a3 ignoredWindow:(id)a4;
- (HNDHandManager)handManager;
- (HNDTrackpadEventManager)trackpadManager;
- (HNDTrackpadViewController)trackpadVC;
- (HNDView)bubbleModeContentView;
- (HNDZoomViewController)zoomViewController;
- (NSMutableSet)userInterfaceClientEnablers;
- (NSString)hardwareIdentifier;
- (NSString)reachabilityHandlerIdentifier;
- (UIAccessibilityHUDView)hudView;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)bubbleCursor;
- (UIView)fingerContainerView;
- (UIView)scannerBackCursorView;
- (UIView)scannerContentView;
- (UIView)scannerFrontCursorView;
- (UIView)zoomReplicatedView;
- (double)_currentRockerTranslateY;
- (double)_iconScaleForForce:(double)a3;
- (double)_idleTime;
- (double)_rotationDegreesForOrientation:(int)a3;
- (double)_xNubbitPadding:(double)a3 x:(double)a4;
- (double)_yNubbitPadding:(double)a3 y:(double)a4;
- (double)assistiveTouchMouseDwellControlActivationTimeout;
- (double)assistiveTouchMousePointerTimeout;
- (double)lastMenuInteractionTime;
- (double)reachabilityOffset;
- (id)_itemForButton:(id)a3;
- (id)dwellBubbleModeCompletionBlock;
- (id)ignoredWindow;
- (id)rocker;
- (id)viewAtDisplayPoint:(CGPoint)a3;
- (id)viewAtDisplayPoint:(CGPoint)a3 downPoint:(CGPoint *)a4 window:(id)a5;
- (id)window;
- (int)_angleForDegrees:(double)a3;
- (int)orientation;
- (unsigned)displayID;
- (void)_cleanupUserInterfaceClient;
- (void)_deviceCountChanged:(id)a3;
- (void)_didHandleRealUpEvent;
- (void)_endHandlingReachabilityIfNeeded;
- (void)_forceDismissCalibrationForReason:(unsigned int)a3;
- (void)_handleNubbitMove:(CGPoint)a3 event:(id)a4;
- (void)_handleReachability:(id)a3;
- (void)_hideLargeContentViewerIfNeeded;
- (void)_idleTimerFired;
- (void)_layoutHUDView:(id)a3 withinBounds:(CGRect)a4;
- (void)_longIdleTimerFired;
- (void)_moveNubbitForKeyboard:(CGRect)a3;
- (void)_moveNubbitToPosition:(CGPoint)a3;
- (void)_moveNubbitToPosition:(CGPoint)a3 forKeyboard:(BOOL)a4;
- (void)_onDeviceEyeTrackingSettingsChanged:(BOOL)a3;
- (void)_presentLargeContentViewerForHUDItem:(id)a3 inContentView:(id)a4;
- (void)_removeAllSystemGestureDisablingAssertions;
- (void)_repositionNubbitAfterLift:(CGPoint)a3;
- (void)_resetCurrentPointToInitialPoint;
- (void)_resetForceDismissalReason;
- (void)_resetReachabilityOffset;
- (void)_setupUserInterfaceClient;
- (void)_startHandlingReachabilityIfNeeded;
- (void)_startIdleTimer;
- (void)_updateAutoHideMousePointer;
- (void)_updateLargeContentViewerIfNeededForView:(id)a3;
- (void)_updateNubbitEdgePosition:(CGPoint)a3;
- (void)_updateNubbitPosition;
- (void)_updatePreferences;
- (void)_updateRockerReachability;
- (void)_updateSpeakScreenStatus;
- (void)_updateViewsForOrientation;
- (void)activateAssistiveTouchAction:(id)a3 fromButtonPress:(BOOL)a4;
- (void)activateDisplayItems;
- (void)addUserInterfaceClientEnabler:(id)a3;
- (void)animateBubbleCursorDwellWithDuration:(double)a3 inRocker:(BOOL)a4 completion:(id)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cancelDwellOnBubbleCursor;
- (void)cleanup;
- (void)dealloc;
- (void)deviceCountChanged:(int64_t)a3;
- (void)didDismissCalibrationUI;
- (void)didFailToFloatApp;
- (void)didFailToPinApp;
- (void)didForceDismissForEmergencyTap;
- (void)didShowCalibrationUI;
- (void)didZoomInto:(id)a3;
- (void)didZoomOut;
- (void)dismissCalibrationUI;
- (void)drawBubbleCursorFrame:(CGRect)a3 withPath:(id)a4;
- (void)hideBubbleCursor;
- (void)hideBubbleCursorForEyeTrackingAutoHide;
- (void)hideBubbleNotification;
- (void)hideFingerContentViewForEyeTrackingAutoHide;
- (void)initializeDisplay;
- (void)initializeDisplayWithCompletion:(id)a3;
- (void)initializeScreenBounds;
- (void)initializeWindowsIfNecessary;
- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4;
- (void)moveNubbitToPoint:(CGPoint)a3;
- (void)moveTrackpadViewToFront:(BOOL)a3;
- (void)overrideBubbleCursorOpacity:(double)a3;
- (void)overrideFingerContentViewOpacity:(double)a3;
- (void)performPress:(int)a3 type:(int)a4;
- (void)placeNubbitAtBottomCenter;
- (void)removeUserInterfaceClientEnabler:(id)a3;
- (void)resetNubbitLocation;
- (void)restartWithCompletion:(id)a3;
- (void)setAlwaysShowMenu:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3;
- (void)setAssistiveTouchMousePointerTimeout:(double)a3;
- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3;
- (void)setBubbleCursor:(id)a3;
- (void)setBubbleCursorController:(id)a3;
- (void)setBubbleCursorIsActive:(BOOL)a3;
- (void)setBubbleModeContentView:(id)a3;
- (void)setDisableControlCenterAssertion:(id)a3;
- (void)setDisableNotificationCenterAssertion:(id)a3;
- (void)setDisableSystemGesturesAssertion:(id)a3;
- (void)setDwellBubbleModeCompletionBlock:(id)a3;
- (void)setFingerContainerView:(id)a3;
- (void)setFingerContentViewIsActive:(BOOL)a3;
- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4;
- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5;
- (void)setFingerController:(id)a3;
- (void)setHandManager:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setHudView:(id)a3;
- (void)setIsMainDisplay:(BOOL)a3;
- (void)setLastMenuInteractionTime:(double)a3;
- (void)setMultiTouchToolBackgroundEnabled:(BOOL)a3;
- (void)setNeedsRecalibration:(BOOL)a3;
- (void)setNeedsToShowZoomWindow:(BOOL)a3;
- (void)setNubbitMoving:(BOOL)a3;
- (void)setOrientation:(int)a3 withCompletion:(id)a4;
- (void)setPlayedHapticForCurrentEvent:(BOOL)a3;
- (void)setPresentHUDViewTimer:(id)a3;
- (void)setReachabilityHandlerIdentifier:(id)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setShouldDelayBeforePresentingHUDView:(BOOL)a3;
- (void)setShowingHoverOverMenu:(BOOL)a3;
- (void)setTrackpadManager:(id)a3;
- (void)setTrackpadVC:(id)a3;
- (void)setUserInterfaceClient:(id)a3;
- (void)setUserInterfaceClientEnablers:(id)a3;
- (void)setVisualsHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5;
- (void)setZoomReplicatedView:(id)a3;
- (void)setZoomViewController:(id)a3;
- (void)showBubbleCursor;
- (void)showBubbleNotificationIndefinitelyWithError:(id)a3;
- (void)showBubbleNotificationWithError:(id)a3 duration:(double)a4;
- (void)showCalibrationUI;
- (void)showCircleMenu:(BOOL)a3;
- (void)showMenu:(BOOL)a3;
- (void)showSimpleAlertWithText:(id)a3;
- (void)showSimpleBannerWithTitle:(id)a3 text:(id)a4;
- (void)showZoomWindow;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)toggleShowTrackpad:(BOOL)a3;
- (void)updateMenuStyle;
- (void)updateNubbitForegroundImageForAction:(id)a3;
- (void)updateOpacityForEyeTrackingAutoHide:(double)a3;
- (void)updateRingerSwitch;
- (void)updateRockersForSubstantialTransition;
- (void)updateRotationLockSwitch;
- (void)updateWithPrimaryFingerPoint:(CGPoint)a3;
- (void)viewOrbActionTriggered:(id)a3;
- (void)viewPressedDown:(id)a3;
- (void)viewPressedUp:(id)a3;
- (void)volumeChanged;
- (void)willShowCalibrationUI;
@end

@implementation HNDDisplayManager

+ (double)fadeDuration
{
  return 0.25;
}

- (HNDDisplayManager)init
{
  return [(HNDDisplayManager *)self initWithWindow:0 ignoredWindow:0];
}

- (HNDDisplayManager)initWithWindow:(id)a3 ignoredWindow:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v77.receiver = self;
  v77.super_class = (Class)HNDDisplayManager;
  v9 = [(HNDDisplayManager *)&v77 init];
  objc_storeStrong((id *)&v9->_window, a3);
  objc_storeStrong((id *)&v9->_ignoredWindow, a4);
  v10 = (AXDispatchTimer *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  idleTimer = v9->_idleTimer;
  v9->_idleTimer = v10;

  v12 = (AXDispatchTimer *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  longIdleTimer = v9->_longIdleTimer;
  v9->_longIdleTimer = v12;

  v9->_orientation = 0;
  v14 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  positionSetTimer = v9->_positionSetTimer;
  v9->_positionSetTimer = v14;

  v16 = +[HNDDefaults sharedDefaults];
  v17 = [v16 preferenceForKey:@"NubbitPositionPercentage"];
  [v17 doubleValue];
  v9->_nubbitPositionPercentage = v18;

  v19 = +[HNDDefaults sharedDefaults];
  v20 = [v19 preferenceForKey:@"NubbitPositionEdge"];
  v9->_nubbitPositionEdge = [v20 intValue];

  v21 = +[AXSettings sharedInstance];
  v22 = [v21 assistiveTouchOrbAction];
  v9->_orbActionExists = v22 != 0;

  objc_initWeak(&location, v9);
  v23 = +[AXSettings sharedInstance];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100015348;
  v74[3] = &unk_1001AAA68;
  objc_copyWeak(&v75, &location);
  [v23 registerUpdateBlock:v74 forRetrieveSelector:"assistiveTouchOrbAction" withListener:v9];

  objc_destroyWeak(&v75);
  v24 = +[AXSettings sharedInstance];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000153D8;
  v72[3] = &unk_1001AAA68;
  objc_copyWeak(&v73, &location);
  [v24 registerUpdateBlock:v72 forRetrieveSelector:"assistiveTouchSingleTapAction" withListener:v9];

  objc_destroyWeak(&v73);
  v25 = +[AXSettings sharedInstance];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100015418;
  v70[3] = &unk_1001AAA68;
  objc_copyWeak(&v71, &location);
  [v25 registerUpdateBlock:v70 forRetrieveSelector:"assistiveTouchDoubleTapAction" withListener:v9];

  objc_destroyWeak(&v71);
  v26 = +[AXSettings sharedInstance];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_100015458;
  v68[3] = &unk_1001AAA68;
  objc_copyWeak(&v69, &location);
  [v26 registerUpdateBlock:v68 forRetrieveSelector:"assistiveTouchLongPressAction" withListener:v9];

  objc_destroyWeak(&v69);
  v27 = +[AXSettings sharedInstance];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100015498;
  v66[3] = &unk_1001AAA68;
  objc_copyWeak(&v67, &location);
  [v27 registerUpdateBlock:v66 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:v9];

  objc_destroyWeak(&v67);
  if (AXDeviceSupportsVirtualTrackpad())
  {
    v28 = +[AXSettings sharedInstance];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000154D8;
    v64[3] = &unk_1001AAA68;
    objc_copyWeak(&v65, &location);
    [v28 registerUpdateBlock:v64 forRetrieveSelector:"assistiveTouchVirtualTrackpadEnabled" withListener:v9];

    objc_destroyWeak(&v65);
  }
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    v9->_needsToShowZoomWindow = 0;
    v29 = [[HNDEyeTrackingCoordinator alloc] initWithDisplayManager:v9];
    eyeTrackingCoordinator = v9->_eyeTrackingCoordinator;
    v9->_eyeTrackingCoordinator = v29;

    v31 = +[AXSettings sharedInstance];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000155AC;
    v62[3] = &unk_1001AAA68;
    objc_copyWeak(&v63, &location);
    [v31 registerUpdateBlock:v62 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingEnabled" withListener:v9];

    objc_destroyWeak(&v63);
  }
  v32 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  longPressTimer = v9->_longPressTimer;
  v9->_longPressTimer = v32;

  v34 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  doubleTapTimer = v9->_doubleTapTimer;
  v9->_doubleTapTimer = v34;

  [(HNDDisplayManager *)v9 _updateSpeakScreenStatus];
  v36 = +[AXSettings sharedInstance];
  -[HNDDisplayManager setAssistiveTouchMousePointerTimeoutEnabled:](v9, "setAssistiveTouchMousePointerTimeoutEnabled:", [v36 assistiveTouchMousePointerTimeoutEnabled]);

  v37 = +[AXSettings sharedInstance];
  [v37 assistiveTouchMousePointerTimeout];
  [(HNDDisplayManager *)v9 setAssistiveTouchMousePointerTimeout:"setAssistiveTouchMousePointerTimeout:"];

  v38 = +[AXSettings sharedInstance];
  [v38 assistiveTouchMouseDwellControlActivationTimeout];
  [(HNDDisplayManager *)v9 setAssistiveTouchMouseDwellControlActivationTimeout:"setAssistiveTouchMouseDwellControlActivationTimeout:"];

  v39 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  autoHideFingersTimer = v9->_autoHideFingersTimer;
  v9->_autoHideFingersTimer = v39;

  v41 = +[AXSettings sharedInstance];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100015618;
  v60[3] = &unk_1001AAA68;
  objc_copyWeak(&v61, &location);
  [v41 registerUpdateBlock:v60 forRetrieveSelector:"assistiveTouchMousePointerTimeout" withListener:v9];

  objc_destroyWeak(&v61);
  v42 = +[AXSettings sharedInstance];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000156B0;
  v58[3] = &unk_1001AAA68;
  objc_copyWeak(&v59, &location);
  [v42 registerUpdateBlock:v58 forRetrieveSelector:"assistiveTouchMousePointerTimeoutEnabled" withListener:v9];

  objc_destroyWeak(&v59);
  v43 = +[AXSettings sharedInstance];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100015740;
  v56[3] = &unk_1001AAA68;
  objc_copyWeak(&v57, &location);
  [v43 registerUpdateBlock:v56 forRetrieveSelector:"assistiveTouchMouseDwellControlActivationTimeout" withListener:v9];

  objc_destroyWeak(&v57);
  v44 = (SBSSystemApertureLayoutMonitor *)objc_alloc_init((Class)SBSSystemApertureLayoutMonitor);
  layoutMonitor = v9->_layoutMonitor;
  v9->_layoutMonitor = v44;

  [(SBSSystemApertureLayoutMonitor *)v9->_layoutMonitor addObserver:v9];
  v9->_foreheadRect.size = 0u;
  v9->_foreheadRect.origin = 0u;
  id v46 = objc_alloc((Class)AXPIFingerController);
  v47 = [v7 screen];
  v48 = [v47 displayConfiguration];
  v49 = [v48 hardwareIdentifier];
  v50 = (AXPIFingerController *)[v46 initWithDisplayUUID:v49];
  fingerController = v9->_fingerController;
  v9->_fingerController = v50;

  uint64_t v52 = [(AXPIFingerController *)v9->_fingerController fingerContainerView];
  fingerContainerView = v9->_fingerContainerView;
  v9->_fingerContainerView = (UIView *)v52;

  if (AXDeviceSupportsVirtualTrackpad())
  {
    v55 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  objc_destroyWeak(&location);

  return v9;
}

- (void)_updateAutoHideMousePointer
{
  [(AXDispatchTimer *)self->_autoHideFingersTimer cancel];
  if ([(HNDDisplayManager *)self _shouldRunAutoHideFingersTimer])
  {
    [(HNDDisplayManager *)self assistiveTouchMousePointerTimeout];
    double v4 = v3;
    v5 = [(HNDDisplayManager *)self handManager];
    unsigned int v6 = [v5 dwellControlEnabled];

    if (v6)
    {
      [(HNDDisplayManager *)self assistiveTouchMouseDwellControlActivationTimeout];
      double v4 = v4 + v7;
    }
    objc_initWeak(&location, self);
    autoHideFingersTimer = self->_autoHideFingersTimer;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015990;
    v9[3] = &unk_1001AAA68;
    objc_copyWeak(&v10, &location);
    [(AXDispatchTimer *)autoHideFingersTimer afterDelay:v9 processBlock:v4];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(HNDDisplayManager *)self setFingerContentViewIsActive:1];
  }
}

- (void)overrideFingerContentViewOpacity:(double)a3
{
}

- (void)hideFingerContentViewForEyeTrackingAutoHide
{
}

- (void)hideBubbleCursorForEyeTrackingAutoHide
{
  id v2 = [(HNDDisplayManager *)self bubbleModeContentView];
  [v2 setIsActive:0 withDuration:0 options:0.1];
}

- (void)updateOpacityForEyeTrackingAutoHide:(double)a3
{
  -[HNDView setInactiveAlpha:](self->_fingerContentView, "setInactiveAlpha:");
  id v5 = [(HNDDisplayManager *)self bubbleModeContentView];
  [v5 setInactiveAlpha:a3];
}

- (void)_updatePreferences
{
  id v3 = +[AXSettings sharedInstance];
  -[HNDDisplayManager setAssistiveTouchMousePointerTimeoutEnabled:](self, "setAssistiveTouchMousePointerTimeoutEnabled:", [v3 assistiveTouchMousePointerTimeoutEnabled]);
}

- (BOOL)_shouldRunAutoHideFingersTimer
{
  if (![(HNDDisplayManager *)self assistiveTouchMousePointerTimeoutEnabled]
    || !_AXSAssistiveTouchEnabled()
    || UIAccessibilityIsSwitchControlRunning())
  {
    return 0;
  }
  double v4 = [(HNDDisplayManager *)self handManager];
  id v5 = [v4 deviceManager];
  unsigned __int8 v6 = [v5 mainDeviceIsPointer];

  return v6;
}

- (void)_updateSpeakScreenStatus
{
  if (_AXSSpeakThisEnabled()) {
    return;
  }
  id v2 = +[AXSettings sharedInstance];
  id v3 = [v2 assistiveTouchOrbAction];
  uint64_t v4 = AXAssistiveTouchIconTypeSpeakScreen;
  if (([v3 isEqualToString:AXAssistiveTouchIconTypeSpeakScreen] & 1) == 0)
  {
    id v5 = +[AXSettings sharedInstance];
    unsigned __int8 v6 = [v5 assistiveTouchSingleTapAction];
    if (([v6 isEqualToString:v4] & 1) == 0)
    {
      double v7 = +[AXSettings sharedInstance];
      id v8 = [v7 assistiveTouchDoubleTapAction];
      if (([v8 isEqualToString:v4] & 1) == 0)
      {
        v9 = +[AXSettings sharedInstance];
        id v10 = [v9 assistiveTouchLongPressAction];
        if (([v10 isEqualToString:v4] & 1) == 0)
        {
          v15 = +[AXSettings sharedInstance];
          [v15 assistiveTouchMainScreenCustomization];
          v12 = v16 = v9;
          v13 = [v12 allValues];
          unsigned __int8 v14 = [v13 containsObject:v4];

          if ((v14 & 1) == 0) {
            return;
          }
          goto LABEL_10;
        }
      }
    }
  }
LABEL_10:
  v11 = ASTLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Turning on Speak Screen because speak screen action is set to a customized override", buf, 2u);
  }

  _AXSSetSpeakThisEnabled();
}

- (void)initializeWindowsIfNecessary
{
  id v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = +[NSThread callStackSymbols];
    int v22 = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "setting up windows from didFinishLaunching %@.", (uint8_t *)&v22, 0xCu);
  }
  int v5 = _AXSInUnitTestMode();
  ignoredWindow = self->_ignoredWindow;
  if (v5)
  {
    if (!ignoredWindow)
    {
      double v7 = (UIWindow *)objc_opt_new();
      id v8 = self->_ignoredWindow;
      self->_ignoredWindow = v7;

      [(UIWindow *)self->_ignoredWindow setWindowLevel:10000011.0];
      [(UIWindow *)self->_ignoredWindow setHidden:0];
      v9 = objc_opt_new();
      [(UIWindow *)self->_ignoredWindow setRootViewController:v9];
    }
    window = self->_window;
    p_window = (id *)&self->_window;
    if (!window)
    {
      uint64_t v12 = objc_opt_new();
      v13 = *p_window;
      id *p_window = (id)v12;
LABEL_12:

      [*p_window makeKeyAndVisible];
      [*p_window setWindowLevel:10000010.0];
      v21 = objc_opt_new();
      [*p_window setRootViewController:v21];
    }
  }
  else
  {
    if (!ignoredWindow)
    {
      unsigned __int8 v14 = +[AXUIDisplayManager sharedDisplayManager];
      v15 = [v14 _windowWithUserInteractionEnabled:0 windowLevel:1 createIfNeeded:@"HNDIgnoredWindow" purposeIdentifier:10000011.0];
      v16 = self->_ignoredWindow;
      self->_ignoredWindow = v15;

      [(UIWindow *)self->_ignoredWindow setHidden:0];
      v17 = objc_opt_new();
      [(UIWindow *)self->_ignoredWindow setRootViewController:v17];
    }
    double v18 = self->_window;
    p_window = (id *)&self->_window;
    if (!v18)
    {
      v13 = +[AXUIDisplayManager sharedDisplayManager];
      uint64_t v19 = [v13 _windowWithUserInteractionEnabled:1 windowLevel:1 createIfNeeded:@"HNDWindow" purposeIdentifier:10000010.0];
      id v20 = *p_window;
      id *p_window = (id)v19;

      goto LABEL_12;
    }
  }
}

- (void)initializeScreenBounds
{
  [(HNDDisplayManager *)self screenBounds];
  v7.origin.x = v2;
  v7.origin.y = v3;
  v7.size.width = v4;
  v7.size.height = v5;
  v6.origin.x = CGRectZero.origin.x;
  v6.origin.y = CGRectZero.origin.y;
  v6.size.width = CGRectZero.size.width;
  v6.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v6, v7)) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)initializeDisplay
{
}

- (void)initializeDisplayWithCompletion:(id)a3
{
  CGFloat v5 = (void (**)(void))a3;
  [(HNDDisplayManager *)self initializeScreenBounds];
  int v6 = _AXSAssistiveTouchScannerEnabled();
  int v7 = _AXSAssistiveTouchEnabled();
  if (v6 | v7)
  {
    int v8 = v7;
    v9 = [(UIView *)self->_contentView superview];

    if (v9)
    {
      v50 = +[NSThread callStackSymbols];
      _AXAssert();
    }
    id v10 = [(UIView *)self->_contentView superview];

    if (!v10)
    {
      [(HNDDisplayManager *)self initializeWindowsIfNecessary];
      id v11 = objc_alloc((Class)UIView);
      [(UIWindow *)self->_window bounds];
      uint64_t v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
      contentView = self->_contentView;
      self->_contentView = v12;

      [(UIView *)self->_contentView setAccessibilityIgnoresInvertColors:1];
      [(UIView *)self->_contentView setAutoresizingMask:18];
      [(UIWindow *)self->_window addSubview:self->_contentView];
      unsigned __int8 v14 = [HNDView alloc];
      [(UIWindow *)self->_window bounds];
      v15 = -[HNDView initWithFrame:](v14, "initWithFrame:");
      fingerContentView = self->_fingerContentView;
      self->_fingerContentView = v15;

      [(HNDView *)self->_fingerContentView setInactiveAlpha:0.0];
      [(HNDView *)self->_fingerContentView setUserInteractionEnabled:0];
      [(HNDView *)self->_fingerContentView setAutoresizingMask:18];
      [(UIView *)self->_fingerContainerView setAutoresizingMask:18];
      fingerContainerView = self->_fingerContainerView;
      [(UIWindow *)self->_window bounds];
      -[UIView setFrame:](fingerContainerView, "setFrame:");
      [(HNDView *)self->_fingerContentView addSubview:self->_fingerContainerView];
      [(UIWindow *)self->_ignoredWindow addSubview:self->_fingerContentView];
      if (v6
        || (+[AXSettings sharedInstance],
            double v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = [v18 assistiveTouchInternalOnlyHiddenNubbitModeEnabled],
            v18,
            v19))
      {
        id v20 = objc_alloc((Class)UIView);
        [(UIWindow *)self->_window bounds];
        v21 = (UIView *)objc_msgSend(v20, "initWithFrame:");
        scannerFrontCursorView = self->_scannerFrontCursorView;
        self->_scannerFrontCursorView = v21;

        [(UIView *)self->_scannerFrontCursorView setAutoresizingMask:18];
        [(UIWindow *)self->_ignoredWindow addSubview:self->_scannerFrontCursorView];
        id v23 = objc_alloc((Class)UIView);
        [(UIWindow *)self->_window bounds];
        v24 = (UIView *)objc_msgSend(v23, "initWithFrame:");
        scannerContentView = self->_scannerContentView;
        self->_scannerContentView = v24;

        [(UIView *)self->_scannerContentView setAutoresizingMask:18];
        [(UIWindow *)self->_ignoredWindow addSubview:self->_scannerContentView];
        id v26 = objc_alloc((Class)UIView);
        [(UIWindow *)self->_window bounds];
        v27 = (UIView *)objc_msgSend(v26, "initWithFrame:");
        scannerBackCursorView = self->_scannerBackCursorView;
        self->_scannerBackCursorView = v27;

        [(UIView *)self->_scannerBackCursorView setAutoresizingMask:18];
        [(UIWindow *)self->_ignoredWindow addSubview:self->_scannerBackCursorView];
        AXPerformBlockOnMainThreadAfterDelay();
      }
      else
      {
        if (self->_rocker)
        {
          v31 = ASTLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            sub_100113BA8();
          }

          [(HNDRocker *)self->_rocker removeFromSuperview];
        }
        v32 = -[HNDRocker initWithFrame:]([HNDRocker alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        rocker = self->_rocker;
        self->_rocker = v32;

        [(HNDRocker *)self->_rocker setDisplayManager:self];
        v34 = [(HNDDisplayManager *)self hardwareIdentifier];
        [(HNDRocker *)self->_rocker setHardwareIdentifier:v34];

        [(HNDRocker *)self->_rocker setAutoresizingMask:45];
        v35 = [HNDView alloc];
        [(UIWindow *)self->_window bounds];
        v36 = -[HNDView initWithFrame:](v35, "initWithFrame:");
        bubbleModeContentView = self->_bubbleModeContentView;
        self->_bubbleModeContentView = v36;

        [(HNDView *)self->_bubbleModeContentView setInactiveAlpha:0.0];
        [(HNDView *)self->_bubbleModeContentView setUserInteractionEnabled:0];
        [(HNDView *)self->_bubbleModeContentView setAutoresizingMask:18];
        [(UIWindow *)self->_ignoredWindow addSubview:self->_bubbleModeContentView];
        if (self->_pendingForegroundImageAction)
        {
          -[HNDRocker updateForegroundImageForAction:](self->_rocker, "updateForegroundImageForAction:");
          pendingForegroundImageAction = self->_pendingForegroundImageAction;
          self->_pendingForegroundImageAction = 0;
        }
        [(UIView *)self->_contentView addSubview:self->_rocker];
        [(HNDView *)self->_rocker setControlDelegate:self];
        v39 = [HNDView alloc];
        [(UIWindow *)self->_window bounds];
        v40 = -[HNDView initWithFrame:](v39, "initWithFrame:");
        rockerDismiss = self->_rockerDismiss;
        self->_rockerDismiss = v40;

        [(HNDView *)self->_rockerDismiss setAutoresizingMask:18];
        [(HNDView *)self->_rockerDismiss setAlpha:0.0];
        v42 = self->_rocker;
        v43 = +[UIColor clearColor];
        [(HNDRocker *)v42 setBackgroundColor:v43];

        [(HNDView *)self->_rockerDismiss setUserInteractionEnabled:0];
        [(UIView *)self->_contentView insertSubview:self->_rockerDismiss atIndex:0];
        [(HNDView *)self->_rockerDismiss setAccessibilityIdentifier:@"RockerDismiss"];
        [(HNDView *)self->_rockerDismiss setControlDelegate:self];
        [(HNDDisplayManager *)self _resetCurrentPointToInitialPoint];
        if (self->_nubbitPositionPercentage == 0.0) {
          self->_nubbitPositionPercentage = 0.75;
        }
        if (!self->_nubbitPositionEdge) {
          self->_nubbitPositionEdge = 4;
        }
        +[UIView setAnimationsEnabled:0];
        [(HNDDisplayManager *)self _updateNubbitPosition];
        +[UIView setAnimationsEnabled:1];
        __asm { FMOV            V0.2D, #-1.0 }
        self->_preKeyboardMovePosition = _Q0;
        [(HNDDisplayManager *)self _startHandlingReachabilityIfNeeded];
        v49 = NSStringFromSelector(a2);
        [(HNDDisplayManager *)self setVisualsHidden:0 forReason:v49 animated:1];
      }
      [(HNDDisplayManager *)self _updateViewsForOrientation];
      if (v8) {
        [(HNDDisplayManager *)self updateMenuStyle];
      }
      v29 = [(HNDDisplayManager *)self userInterfaceClientEnablers];
      id v30 = [v29 count];

      if (v30) {
        [(HNDDisplayManager *)self _setupUserInterfaceClient];
      }
    }
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)showZoomWindow
{
  BOOL needsToShowZoomWindow = self->_needsToShowZoomWindow;
  CGFloat v4 = [(HNDDisplayManager *)self zoomViewController];
  CGFloat v5 = v4;
  if (needsToShowZoomWindow)
  {

    if (!v5)
    {
      int v6 = [[HNDZoomViewController alloc] initWithDelegate:self];
      [(HNDDisplayManager *)self setZoomViewController:v6];

      ignoredWindow = self->_ignoredWindow;
      int v8 = [(HNDDisplayManager *)self zoomViewController];
      v9 = [v8 view];
      [(UIWindow *)ignoredWindow addSubview:v9];

      id v10 = [(HNDDisplayManager *)self zoomViewController];
      id v11 = [v10 view];
      id v12 = objc_msgSend(v11, "ax_pinConstraintsInAllDimensionsToView:", self->_ignoredWindow);
    }
    [(HNDDisplayManager *)self screenBounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(HNDDisplayManager *)self zoomViewController];
    int v22 = [v21 view];
    objc_msgSend(v22, "setBounds:", v14, v16, v18, v20);

    id v33 = [(HNDDisplayManager *)self zoomViewController];
    id v23 = [(HNDDisplayManager *)self handManager];
    [v23 systemPointerLocation];
    objc_msgSend(v33, "zoomInAt:screenBounds:");
  }
  else
  {
    v24 = [(HNDDisplayManager *)self handManager];
    [v24 systemPointerLocation];
    double v26 = v25;
    double v28 = v27;
    [(HNDDisplayManager *)self screenBounds];
    objc_msgSend(v5, "zoomOutAt:screenBounds:", v26, v28, v29, v30, v31, v32);

    [(HNDDisplayManager *)self setNeedsToShowZoomWindow:0];
  }
}

- (CGPoint)zoomConvertToReplicatedViewFromTargetPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(HNDDisplayManager *)self zoomReplicatedView];

  if (v6)
  {
    int v7 = [(HNDDisplayManager *)self zoomReplicatedView];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;

    -[HNDDisplayManager convertToNormalizedInterfaceOrientation:](self, "convertToNormalizedInterfaceOrientation:", x, y);
    double v13 = v9 * v12;
    double v15 = v11 * v14;
    double v16 = [(HNDDisplayManager *)self zoomReplicatedView];
    double v17 = [(HNDDisplayManager *)self ignoredWindow];
    objc_msgSend(v16, "convertPoint:toView:", v17, v13, v15);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
  }
  else
  {
    CGFloat v19 = CGPointZero.x;
    CGFloat v21 = CGPointZero.y;
  }
  double v22 = v19;
  double v23 = v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (BOOL)needsRecalibration
{
  return self->_needsRecalibration;
}

- (void)setNeedsRecalibration:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HNDDisplayManager *)self didForceDimissCalibration]
    || self->_needsRecalibration != v3)
  {
    self->_needsRecalibration = v3;
    if (v3)
    {
      [(HNDDisplayManager *)self showCalibrationUI];
    }
  }
}

- (void)showCalibrationUI
{
  BOOL v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints];

  if ((v4 & 1) == 0)
  {
    CGFloat v5 = [(HNDDisplayManager *)self handManager];
    int v6 = [v5 deviceManager];
    unsigned __int8 v7 = -[HNDDisplayManager _shouldPreventCalibrationForError:](self, "_shouldPreventCalibrationForError:", [v6 currentEyeTrackingErrorCode]);

    if ((v7 & 1) == 0)
    {
      if (AXDeviceSupportsOnDeviceEyeTracking())
      {
        double v8 = +[AXSettings sharedInstance];
        unsigned int v9 = [v8 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

        if (v9)
        {
          double v10 = +[ASTUIGazeEnrollmentManager sharedManager];
          unsigned __int8 v11 = [v10 enrollmentComplete];

          if (self->_needsRecalibration
            || (v11 & 1) == 0
            && !self->_showingCalibrationUI
            && ![(HNDDisplayManager *)self didForceDimissCalibration])
          {
            [(HNDEyeTrackingCoordinator *)self->_eyeTrackingCoordinator showCalibrationUI];
            if (self->_needsRecalibration && self->_forceCalibrationDismissReason == 1)
            {
              [(HNDDisplayManager *)self _resetForceDismissalReason];
            }
          }
        }
      }
    }
  }
}

- (void)dismissCalibrationUI
{
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    id v5 = +[AXSettings sharedInstance];
    if ([v5 assistiveTouchMouseOnDeviceEyeTrackingEnabled])
    {
      BOOL showingCalibrationUI = self->_showingCalibrationUI;

      if (showingCalibrationUI)
      {
        eyeTrackingCoordinator = self->_eyeTrackingCoordinator;
        [(HNDEyeTrackingCoordinator *)eyeTrackingCoordinator dismissCalibrationUI];
      }
    }
    else
    {
    }
  }
}

- (void)_forceDismissCalibrationForReason:(unsigned int)a3
{
  self->_forceCalibrationDismissReason = a3;
  [(HNDDisplayManager *)self setNeedsRecalibration:0];
  if (a3 == 2)
  {
    id v5 = +[AXSettings sharedInstance];
    unsigned __int8 v6 = [v5 assistiveTouchEnabledByOnDeviceEyeTracking];

    unsigned __int8 v7 = [(HNDDisplayManager *)self handManager];
    double v8 = [v7 deviceManager];
    [v8 setDetectDevices:0];

    objc_initWeak(&location, self);
    unsigned int v9 = +[AXSpringBoardServer server];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100016D50;
    v10[3] = &unk_1001AAF38;
    objc_copyWeak(&v11, &location);
    unsigned __int8 v12 = v6;
    v10[4] = self;
    [v9 showAlert:26 withHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(HNDDisplayManager *)self dismissCalibrationUI];
  }
}

- (void)_removeAllSystemGestureDisablingAssertions
{
  [(HNDDisplayManager *)self setDisableControlCenterAssertion:0];
  [(HNDDisplayManager *)self setDisableNotificationCenterAssertion:0];

  [(HNDDisplayManager *)self setDisableSystemGesturesAssertion:0];
}

- (BOOL)didForceDimissCalibration
{
  return self->_forceCalibrationDismissReason != 0;
}

- (void)_resetForceDismissalReason
{
  self->_forceCalibrationDismissReason = 0;
}

- (void)_onDeviceEyeTrackingSettingsChanged:(BOOL)a3
{
  if (a3)
  {
    if ([(HNDDisplayManager *)self isShowingCalibrationUI])
    {
      [(HNDDisplayManager *)self dismissCalibrationUI];
    }
    else
    {
      [(HNDDisplayManager *)self showCalibrationUI];
    }
  }
  else
  {
    unsigned __int8 v4 = +[ASTUIGazeEnrollmentManager sharedManager];
    [v4 resetGazeEnrollment];

    [(HNDDisplayManager *)self _resetForceDismissalReason];
    [(HNDDisplayManager *)self setNeedsRecalibration:1];
  }
}

- (BOOL)_shouldPreventCalibrationForError:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)toggleShowTrackpad:(BOOL)a3
{
  BOOL v3 = a3;
  trackpadVC = self->_trackpadVC;
  if (a3)
  {
    if (!trackpadVC)
    {
      unsigned __int8 v6 = [[HNDTrackpadViewController alloc] initWithOrientation:self->_orientation];
      [(HNDDisplayManager *)self setTrackpadVC:v6];

      unsigned __int8 v7 = [(HNDTrackpadViewController *)self->_trackpadVC eventManager];
      [(HNDDisplayManager *)self setTrackpadManager:v7];

      [(HNDTrackpadEventManager *)self->_trackpadManager setFullScreen];
    }
    double v8 = [(UIView *)self->_contentView subviews];
    unsigned int v9 = [(HNDTrackpadViewController *)self->_trackpadVC view];
    unsigned __int8 v10 = [v8 containsObject:v9];

    if ((v10 & 1) == 0)
    {
      self->_showingVirtualTrackpad = 1;
      contentView = self->_contentView;
      unsigned __int8 v12 = [(HNDTrackpadViewController *)self->_trackpadVC view];
      [(UIView *)contentView insertSubview:v12 belowSubview:self->_rocker];

      [(HNDTrackpadViewController *)self->_trackpadVC highlightTrackpad];
      [(HNDDisplayManager *)self setFingerContentViewIsActive:1];
    }
  }
  else if (trackpadVC)
  {
    double v13 = [(UIView *)self->_contentView subviews];
    double v14 = [(HNDTrackpadViewController *)self->_trackpadVC view];
    unsigned int v15 = [v13 containsObject:v14];

    if (v15)
    {
      self->_showingVirtualTrackpad = 0;
      [(HNDTrackpadViewController *)self->_trackpadVC unload];
      double v16 = [(HNDTrackpadViewController *)self->_trackpadVC view];
      [v16 removeFromSuperview];

      [(HNDDisplayManager *)self setFingerContentViewIsActive:0];
      double v17 = self->_trackpadVC;
      self->_trackpadVC = 0;

      downView = self->_downView;
      self->_downView = 0;
    }
  }
  CGFloat v19 = +[AXSettings sharedInstance];
  [v19 setAssistiveTouchVirtualTrackpadEnabled:v3];

  id v20 = [(HNDDisplayManager *)self handManager];
  [v20 reloadFingerAppearance];
}

- (BOOL)isShowingCalibrationUI
{
  return self->_showingCalibrationUI;
}

- (BOOL)isViewZoomed
{
  return self->_isViewZoomed;
}

- (BOOL)isShowingVirtualTrackpad
{
  return self->_showingVirtualTrackpad;
}

- (void)moveTrackpadViewToFront:(BOOL)a3
{
  BOOL v3 = a3;
  contentView = self->_contentView;
  id v5 = [(HNDTrackpadViewController *)self->_trackpadVC view];
  if (v3) {
    [(UIView *)contentView bringSubviewToFront:v5];
  }
  else {
    [(UIView *)contentView sendSubviewToBack:v5];
  }
}

- (void)placeNubbitAtBottomCenter
{
  +[HNDRocker nubbitSize];
  double v4 = v3 * 0.5;
  [(HNDDisplayManager *)self screenBounds];
  self->_nubbitPositionPercentage = 0.5 - v4 / v5;
  self->_nubbitPositionEdge = 2;
  +[UIView setAnimationsEnabled:0];
  [(HNDDisplayManager *)self _updateNubbitPosition];

  +[UIView setAnimationsEnabled:1];
}

- (void)cleanup
{
  [(UIView *)self->_contentView removeFromSuperview];
  contentView = self->_contentView;
  self->_contentView = 0;

  [(HNDView *)self->_fingerContentView removeFromSuperview];
  fingerContentView = self->_fingerContentView;
  self->_fingerContentView = 0;

  [(UIView *)self->_scannerContentView removeFromSuperview];
  scannerContentView = self->_scannerContentView;
  self->_scannerContentView = 0;

  [(UIView *)self->_scannerBackCursorView removeFromSuperview];
  scannerBackCursorView = self->_scannerBackCursorView;
  self->_scannerBackCursorView = 0;

  [(UIView *)self->_scannerFrontCursorView removeFromSuperview];
  scannerFrontCursorView = self->_scannerFrontCursorView;
  self->_scannerFrontCursorView = 0;

  [(HNDView *)self->_bubbleModeContentView removeFromSuperview];
  bubbleModeContentView = self->_bubbleModeContentView;
  self->_bubbleModeContentView = 0;

  unsigned int v9 = [(HNDTrackpadViewController *)self->_trackpadVC view];
  [v9 removeFromSuperview];

  trackpadVC = self->_trackpadVC;
  self->_trackpadVC = 0;

  id v11 = [(HNDZoomViewController *)self->_zoomViewController view];
  [v11 removeFromSuperview];

  zoomViewController = self->_zoomViewController;
  self->_zoomViewController = 0;

  [(HNDRocker *)self->_rocker removeFromSuperview];
  rocker = self->_rocker;
  self->_rocker = 0;

  rockerDismiss = self->_rockerDismiss;
  self->_rockerDismiss = 0;

  downView = self->_downView;
  self->_downView = 0;

  [(HNDDisplayManager *)self _endHandlingReachabilityIfNeeded];
  [(HNDDisplayManager *)self _cleanupUserInterfaceClient];

  [(HNDDisplayManager *)self _removeAllSystemGestureDisablingAssertions];
}

- (void)dealloc
{
  [(HNDDisplayManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)HNDDisplayManager;
  [(HNDDisplayManager *)&v3 dealloc];
}

- (void)_updateRockerReachability
{
  memset(&v6, 0, sizeof(v6));
  [(HNDDisplayManager *)self _transformForOrientation];
  [(HNDDisplayManager *)self _currentRockerTranslateY];
  CGAffineTransformTranslate(&v6, &v5, 0.0, v3);
  CGAffineTransform v4 = v6;
  [(UIView *)self->_contentView setTransform:&v4];
}

- (double)_currentRockerTranslateY
{
  [(HNDDisplayManager *)self reachabilityOffset];
  double v4 = v3;
  [(HNDRocker *)self->_rocker frame];
  double MaxY = CGRectGetMaxY(v12);
  int IsPad = AXDeviceIsPad();
  double v7 = -8.0;
  if (IsPad) {
    double v7 = -6.0;
  }
  double v8 = v4 + MaxY - v7;
  [(UIView *)self->_contentView bounds];
  double result = 0.0;
  if (v8 > v10)
  {
    [(UIView *)self->_contentView bounds];
    return v11 - v8;
  }
  return result;
}

- (CGPoint)_rotatedNormalizedInitialPoint
{
  signed int v2 = [(HNDDisplayManager *)self orientation] - 2;
  if (v2 > 2)
  {
    double v4 = 0.75;
    double v3 = 0.5;
  }
  else
  {
    double v3 = dbl_1001975B8[v2];
    double v4 = dbl_1001975D0[v2];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)_resetCurrentPointToInitialPoint
{
  double v3 = -1.0;
  double v4 = -1.0;
  if (sub_100041014())
  {
    CGAffineTransform v5 = [(HNDDisplayManager *)self handManager];
    CGAffineTransform v6 = [v5 systemPointerController];

    double v3 = -1.0;
    double v4 = -1.0;
    if (v6)
    {
      double v7 = [v5 systemPointerController];
      [v7 currentSystemPointerPoint];
      double v9 = v8;
      double v11 = v10;

      double v3 = -1.0;
      double v4 = -1.0;
      if (([v5 shouldHideSystemPointerForFingersView] & 1) == 0)
      {
        BOOL v12 = v9 == -1.0 && v11 == -1.0;
        double v3 = -1.0;
        double v4 = -1.0;
        if (!v12)
        {
          -[HNDDisplayManager convertToNormalizedInterfaceOrientation:](self, "convertToNormalizedInterfaceOrientation:", v9, v11);
          double v4 = v13;
          double v3 = v14;
        }
      }
    }
  }
  if (v4 == -1.0 && v3 == -1.0)
  {
    [(HNDDisplayManager *)self _rotatedNormalizedInitialPoint];
    double v4 = v16;
    double v3 = v17;
  }
  self->_currentPoint.double x = v4;
  self->_currentPoint.double y = v3;
}

- (void)_resetReachabilityOffset
{
  [(HNDDisplayManager *)self setReachabilityOffset:0.0];
  [(HNDDisplayManager *)self _transformForOrientation];
  contentView = self->_contentView;
  v4[0] = v4[3];
  v4[1] = v4[4];
  v4[2] = v4[5];
  [(UIView *)contentView setTransform:v4];
}

- (void)_handleReachability:(id)a3
{
  id v4 = a3;
  CGAffineTransform v5 = +[AXUIReachabilityHelper sharedHelper];
  [v5 reachabilityOffsetForPayload:v4];
  -[HNDDisplayManager setReachabilityOffset:](self, "setReachabilityOffset:");
  memset(&v18, 0, sizeof(v18));
  contentView = self->_contentView;
  if (contentView) {
    [(UIView *)contentView transform];
  }
  [(HNDDisplayManager *)self reachabilityOffset];
  if (v7 == 0.0)
  {
    [(HNDDisplayManager *)self _transformForOrientation];
    CGAffineTransform v18 = v17;
  }
  else
  {
    [(HNDDisplayManager *)self _currentRockerTranslateY];
    double v9 = v8;
    id v10 = [v4 mutableCopy];
    double v11 = +[NSNumber numberWithDouble:v9];
    [v10 setObject:v11 forKeyedSubscript:@"offset"];

    id v12 = [v10 copy];
    CGAffineTransform v16 = v18;
    CGAffineTransformTranslate(&v17, &v16, 0.0, v9);
    CGAffineTransform v18 = v17;

    id v4 = v12;
  }
  double v13 = +[AXUIReachabilityHelper sharedHelper];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  CGAffineTransform v15 = v18;
  v14[2] = sub_10001798C;
  v14[3] = &unk_1001AAF60;
  v14[4] = self;
  [v13 animateForReachability:v14 payload:v4 completion:0];
}

- (void)_startHandlingReachabilityIfNeeded
{
  double v3 = [(HNDDisplayManager *)self reachabilityHandlerIdentifier];
  if (v3)
  {
  }
  else if (+[AXSpringBoardServer isAvailable])
  {
    id v4 = +[AXSpringBoardServer server];
    [v4 reachabilityOffset];
    -[HNDDisplayManager setReachabilityOffset:](self, "setReachabilityOffset:");

    CGAffineTransform v5 = +[AXSpringBoardServer server];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100017B04;
    v7[3] = &unk_1001AAF88;
    v7[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100017BE0;
    v6[3] = &unk_1001AAFB0;
    v6[4] = self;
    [v5 registerReachabilityHandler:v7 withIdentifierCallback:v6];
  }
}

- (void)_endHandlingReachabilityIfNeeded
{
  double v3 = [(HNDDisplayManager *)self reachabilityHandlerIdentifier];

  if (v3)
  {
    id v4 = +[AXSpringBoardServer server];
    CGAffineTransform v5 = [(HNDDisplayManager *)self reachabilityHandlerIdentifier];
    [v4 removeReachabilityHandler:v5];

    [(HNDDisplayManager *)self setReachabilityHandlerIdentifier:0];
  }
}

- (BOOL)multiTouchToolBackgroundEnabled
{
  return self->_multiTouchBackgound != 0;
}

- (void)setMultiTouchToolBackgroundEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HNDDisplayManager *)self multiTouchToolBackgroundEnabled] != a3)
  {
    if (!v3) {
      goto LABEL_8;
    }
    if (UIAccessibilityIsSwitchControlRunning()) {
      _AXAssert();
    }
    if (self->_contentView)
    {
      CGAffineTransform v5 = -[HNDView initWithFrame:]([HNDView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      multiTouchBackgound = self->_multiTouchBackgound;
      self->_multiTouchBackgound = v5;

      [(UIView *)self->_contentView bounds];
      -[HNDView setFrame:](self->_multiTouchBackgound, "setFrame:");
      [(UIView *)self->_contentView bounds];
      AX_CGRectGetCenter();
      -[HNDView setCenter:](self->_multiTouchBackgound, "setCenter:");
      [(HNDView *)self->_multiTouchBackgound setAccessibilityIdentifier:@"MT Back"];
      [(HNDView *)self->_multiTouchBackgound setAlpha:0.0];
      double v7 = self->_multiTouchBackgound;
      double v8 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.01];
      [(HNDView *)v7 setBackgroundColor:v8];

      [(HNDView *)self->_multiTouchBackgound setUserInteractionEnabled:1];
      [(HNDView *)self->_multiTouchBackgound setIsAccessibilityElement:1];
      double v9 = sub_100040EC8(@"GesturePerformArea");
      [(HNDView *)self->_multiTouchBackgound setAccessibilityLabel:v9];

      [(HNDView *)self->_multiTouchBackgound setAccessibilityTraits:UIAccessibilityTraitAllowsDirectInteraction];
      [(UIView *)self->_contentView insertSubview:self->_multiTouchBackgound atIndex:0];
      id v10 = ASTLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        CGAffineTransform v15 = "-[HNDDisplayManager setMultiTouchToolBackgroundEnabled:]";
        double v11 = "%s: enabled _multiTouchBackgound!";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
LABEL_8:
      [(HNDView *)self->_multiTouchBackgound removeFromSuperview];
      id v12 = self->_multiTouchBackgound;
      self->_multiTouchBackgound = 0;

      id v10 = ASTLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        CGAffineTransform v15 = "-[HNDDisplayManager setMultiTouchToolBackgroundEnabled:]";
        double v11 = "%s: removed _multiTouchBackgound!";
        goto LABEL_10;
      }
    }

    double v13 = [(HNDDisplayManager *)self handManager];
    [v13 setCaptureEvents:v3];

    self->_trackpadCaptureEvents = v3;
  }
}

- (CGPoint)closestNubbitPositionForPoint:(CGPoint)a3 offsetByMidpoint:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(HNDDisplayManager *)self screenBounds];
  double v8 = v7;
  double v10 = v9;
  double v11 = v7;
  +[HNDRocker nubbitSize];
  double v13 = v12;
  +[HNDRocker nubbitSize];
  if (y - v14 * 0.5 >= 30.0)
  {
    if (y + v14 * 0.5 > v10 + -30.0)
    {
      if (x - v13 * 0.5 < 30.0)
      {
        double v11 = 0.0;
LABEL_10:
        double v16 = v10;
        goto LABEL_24;
      }
      if (x + v13 * 0.5 > v8 + -30.0) {
        goto LABEL_10;
      }
    }
LABEL_11:
    if (y >= 80.0
      || x <= 50.0
      || (+[HNDRocker nubbitSize], double v16 = 0.0, x >= v8 - v17))
    {
      BOOL v18 = y <= v10 + -80.0 || x <= 50.0;
      if (v18 || (+[HNDRocker nubbitSize], double v11 = x, v16 = v10, x >= v8 - v19))
      {
        if (x >= v8 * 0.5) {
          double v11 = v8;
        }
        else {
          double v11 = 0.0;
        }
        double v16 = y;
      }
    }
    else
    {
      double v11 = x;
    }
    goto LABEL_24;
  }
  double v15 = v13 * 0.5;
  double v16 = 0.0;
  if (x - v15 < 30.0)
  {
    double v11 = 0.0;
    goto LABEL_24;
  }
  if (x + v15 <= v8 + -30.0) {
    goto LABEL_11;
  }
LABEL_24:
  if (v4)
  {
    +[HNDRocker nubbitSize];
    double v11 = v11 - v20 * 0.5;
    double v16 = v16 - v21 * 0.5;
  }

  double v22 = sub_1000407A8((double)(int)(v11 + 0.5), (double)(int)(v16 + 0.5));
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (int)_angleForDegrees:(double)a3
{
  if (a3 > 45.0 && a3 < 115.0) {
    return 1;
  }
  if (a3 < -70.0 && a3 > -110.0 || a3 >= 250.0 && a3 <= 290.0) {
    return 2;
  }
  if (a3 < -25.0 && a3 >= -70.0 || a3 >= 290.0 && a3 <= 335.0) {
    return 7;
  }
  if (a3 > 200.0 && a3 <= 245.0) {
    return 8;
  }
  if (a3 > 160.0 && a3 < 200.0) {
    return 4;
  }
  if (a3 >= 115.0 && a3 < 160.0) {
    return 5;
  }
  if (a3 >= 25.0 && a3 < 65.0) {
    return 6;
  }
  if (a3 >= 25.0 && a3 <= 315.0) {
    return 0;
  }
  else {
    return 3;
  }
}

- (CGPoint)nubbitPositionForFlick:(CGPoint)a3
{
  SCRCMathGetAverage();
  double v5 = v4;
  [(HNDDisplayManager *)self screenBounds];
  double v7 = v6;
  double v9 = v8;
  +[HNDRocker nubbitSize];
  double v11 = v10;
  double v13 = v12;
  [(HNDDisplayManager *)self _nubbitPointForEdgePosition];
  double v15 = v14;
  double v17 = v16;
  unsigned int v18 = [(HNDDisplayManager *)self _angleForDegrees:v5] - 1;
  double v19 = v7 - v11;
  double v20 = v9 - v13;
  switch(v18)
  {
    case 0u:
      if (v17 > 0.0) {
        double v17 = v17 + v9 / -3.0;
      }
      break;
    case 1u:
      if (v17 < v20) {
        double v17 = v9 / 3.0 + v17;
      }
      break;
    case 2u:
      if (v15 > 0.0) {
        goto LABEL_22;
      }
      break;
    case 3u:
      if (v15 < v19) {
        goto LABEL_29;
      }
      break;
    case 4u:
      if (v15 < v19 && v17 > 0.0)
      {
        double v17 = v17 + v9 / -3.0;
        goto LABEL_29;
      }
      break;
    case 5u:
      if (v15 > 0.0 && v17 > 0.0)
      {
        double v17 = v17 + v9 / -3.0;
        goto LABEL_22;
      }
      break;
    case 6u:
      if (v15 > 0.0 && v17 < v20)
      {
        double v17 = v9 / 3.0 + v17;
LABEL_22:
        double v15 = 0.0;
      }
      break;
    case 7u:
      if (v15 < v19 && v17 < v20)
      {
        double v17 = v9 / 3.0 + v17;
LABEL_29:
        double v15 = v7 - v11;
      }
      break;
    default:
      break;
  }

  -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:](self, "closestNubbitPositionForPoint:offsetByMidpoint:", 0, v15, v17);
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (double)_yNubbitPadding:(double)a3 y:(double)a4
{
  if ((sub_100042004() & 1) == 0)
  {
    double v7 = 2.0;
    if (!sub_100041FA8()) {
      return v7;
    }
  }
  [(HNDDisplayManager *)self screenBounds];
  double v9 = v8;
  double v11 = v10;
  int v12 = sub_100042004();
  double v13 = 2.0;
  if (sub_100042004())
  {
    if (v12) {
      double v14 = 10.0;
    }
    else {
      double v14 = 0.0;
    }
    [(HNDDisplayManager *)self safeAreaInsets];
    double v13 = v15 - v14;
  }
  if (AXDeviceHasJindo())
  {
    double v7 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 9.0;
  }
  else
  {
    int v16 = sub_100041FA8();
    double v7 = 2.0;
    if (sub_100041FA8())
    {
      if (v16) {
        double v17 = 10.0;
      }
      else {
        double v17 = 0.0;
      }
      [(HNDDisplayManager *)self safeAreaInsets];
      double v7 = v18 - v17;
    }
  }
  unsigned int v19 = [(HNDDisplayManager *)self orientation];
  if ((sub_100041FA8() & (v19 != 1)) != 0) {
    double v7 = 9.0;
  }
  if (v7 >= a4 && sub_100041FA8())
  {
    double x = self->_foreheadRect.origin.x;
    +[HNDRocker nubbitSize];
    if (x - v21 < a3
      && self->_foreheadRect.origin.x + self->_foreheadRect.size.width > a3
      && (AXDeviceHasJindo() & 1) != 0)
    {
      return v7;
    }
    +[HNDRocker nubbitSize];
    if (88.0 - v22 < a3 && v9 + -88.0 > a3) {
      return v7;
    }
    return 10.0;
  }
  +[HNDRocker nubbitSize];
  if (v24 + a4 < v11 - v13 || !sub_100042004()) {
    return 10.0;
  }
  double v25 = v9 * 0.5;
  +[HNDRocker nubbitSize];
  double v27 = v26 + a3;
  double v28 = AXDeviceIsPhone() ? 67.0 : 170.0;
  if (v27 <= v25 - v28) {
    return 10.0;
  }
  double v29 = AXDeviceIsPhone() ? 67.0 : 170.0;
  double v7 = v13;
  if (v25 + v29 <= a3) {
    return 10.0;
  }
  return v7;
}

- (double)_xNubbitPadding:(double)a3 x:(double)a4
{
  if ((sub_100042004() & 1) == 0)
  {
    double v7 = 2.0;
    if (!sub_100041FA8()) {
      return v7;
    }
  }
  +[HNDRocker nubbitSize];
  double v9 = v8;
  double v11 = v10;
  [(HNDDisplayManager *)self _yNubbitPadding:a4 y:a3];
  double v13 = v12;
  [(HNDDisplayManager *)self screenBounds];
  double v15 = v14;
  double v17 = v16;
  double v18 = v14 - v9;
  if (sub_100041FA8()) {
    double v19 = 10.0;
  }
  else {
    double v19 = 0.0;
  }
  unsigned int v20 = [(HNDDisplayManager *)self orientation];
  if (v13 >= a3 && (sub_100042004() & 1) != 0 || v17 - v11 - v13 <= a3 && sub_100041FA8())
  {
    double v7 = 10.0;
    if (a4 > 9.0)
    {
      double v7 = 9.0;
      if (v18 + -9.0 <= a4) {
        return v18 + -10.0;
      }
    }
    return v7;
  }
  double v7 = 9.0;
  if (v20 != 4)
  {
    if (v20 != 3) {
      return v7;
    }
    int HasJindo = AXDeviceHasJindo();
    [(HNDDisplayManager *)self safeAreaInsets];
    double v23 = v22;
    if (HasJindo)
    {
      if (v22 == 0.0)
      {
        double v24 = v19 + self->_foreheadRect.origin.x + self->_foreheadRect.size.width + 9.0;
LABEL_27:
        if (sub_100041FA8())
        {
          double v34 = v24 - v19;
          if (v34 > a4)
          {
            +[HNDRocker nubbitSize];
            if (v17 + -88.0 > a3 && 88.0 - v35 < a3) {
              return v34;
            }
            else {
              return 9.0;
            }
          }
        }
        return v7;
      }
      [(HNDDisplayManager *)self safeAreaInsets];
    }
    else
    {
      [(HNDDisplayManager *)self safeAreaInsets];
      if (v23 == 0.0)
      {
        double v24 = v30;
        goto LABEL_27;
      }
    }
    double v24 = v31;
    goto LABEL_27;
  }
  double v42 = v19;
  int v25 = AXDeviceHasJindo();
  [(HNDDisplayManager *)self safeAreaInsets];
  double v27 = v26;
  if (!v25)
  {
    [(HNDDisplayManager *)self safeAreaInsets];
    if (v27 == 0.0)
    {
      double v29 = v32;
LABEL_37:
      double v28 = v42;
      goto LABEL_38;
    }
LABEL_36:
    double v29 = v33;
    goto LABEL_37;
  }
  if (v26 != 0.0)
  {
    [(HNDDisplayManager *)self safeAreaInsets];
    goto LABEL_36;
  }
  double v28 = v42;
  double v29 = v42 + v15 - self->_foreheadRect.origin.x + 18.0;
LABEL_38:
  if (sub_100041FA8())
  {
    double v37 = v29 - v28;
    +[HNDRocker nubbitSize];
    if (v38 + a4 > v15 - v37)
    {
      +[HNDRocker nubbitSize];
      if (v17 + -88.0 > a3 && 88.0 - v39 < a3) {
        return v18 - v37;
      }
      else {
        return 9.0;
      }
    }
  }
  return v7;
}

- (CGPoint)_validateNubbitPosition:(CGPoint)a3 forKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker nubbitSize];
  double v9 = v8;
  double v11 = v10;
  if (AXDeviceIsPad()) {
    double v12 = -3.0;
  }
  else {
    double v12 = -4.0;
  }
  [(HNDDisplayManager *)self screenBounds];
  double v14 = v13 - (v11 + 0.0);
  double v16 = v15 - (v9 + 0.0);
  [(HNDDisplayManager *)self _yNubbitPadding:x y:y];
  double v18 = v14 - v17;
  if (y < v14 - v17) {
    double v18 = y;
  }
  if (v17 >= v18) {
    double v19 = v17;
  }
  else {
    double v19 = v18;
  }
  [(HNDDisplayManager *)self _xNubbitPadding:v19 x:x];
  double v21 = v16 - v20;
  if (x < v16 - v20) {
    double v21 = x;
  }
  if (v20 < v21) {
    double v20 = v21;
  }
  if (v20 == 0.0) {
    double v22 = v12;
  }
  else {
    double v22 = v20;
  }
  if (v19 == 0.0) {
    double v23 = v12;
  }
  else {
    double v23 = v19;
  }
  if (v4)
  {
    double v20 = v22;
    double v24 = v23;
  }
  else
  {
    double v24 = v19;
  }
  result.double y = v24;
  result.double x = v20;
  return result;
}

- (void)_moveNubbitToPosition:(CGPoint)a3
{
}

- (CGPoint)_nubbitPointForEdgePosition
{
  +[HNDRocker nubbitSize];
  double v4 = v3;
  double v6 = v5;
  [(HNDDisplayManager *)self screenBounds];
  int nubbitPositionEdge = self->_nubbitPositionEdge;
  switch(nubbitPositionEdge)
  {
    case 1:
      double v11 = v7 * self->_nubbitPositionPercentage;
      double v10 = 0.0;
      break;
    case 2:
      double v11 = v7 * self->_nubbitPositionPercentage;
      double v10 = v8 - v6;
      break;
    case 3:
      double v10 = v8 * self->_nubbitPositionPercentage;
      double v11 = 0.0;
      break;
    default:
      double v11 = v7 - v4;
      double v10 = v8 * self->_nubbitPositionPercentage;
      break;
  }

  -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:](self, "closestNubbitPositionForPoint:offsetByMidpoint:", 0, v11, v10);
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)_updateNubbitPosition
{
  [(HNDDisplayManager *)self _nubbitPointForEdgePosition];

  -[HNDDisplayManager _moveNubbitToPosition:forKeyboard:](self, "_moveNubbitToPosition:forKeyboard:", 0);
}

- (void)_updateNubbitEdgePosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker nubbitSize];
  double v7 = v6;
  double v9 = v8;
  [(HNDDisplayManager *)self screenBounds];
  double v11 = v10;
  double v13 = v12;
  [(HNDDisplayManager *)self _xNubbitPadding:y x:x];
  double v15 = v14;
  [(HNDDisplayManager *)self _yNubbitPadding:x y:y];
  if (x <= v15)
  {
    int v23 = 3;
    double v22 = y / v13;
  }
  else
  {
    double v17 = v11 - v7 - v15;
    double v18 = 0.0;
    if (y < v13 - v9 - v16)
    {
      int v19 = 0;
    }
    else
    {
      double v18 = x / v11;
      int v19 = 2;
    }
    BOOL v20 = y > v16;
    if (y <= v16) {
      double v21 = x / v11;
    }
    else {
      double v21 = v18;
    }
    if (!v20) {
      int v19 = 1;
    }
    if (x >= v17) {
      double v22 = y / v13;
    }
    else {
      double v22 = v21;
    }
    if (x >= v17) {
      int v23 = 4;
    }
    else {
      int v23 = v19;
    }
  }
  self->_int nubbitPositionEdge = v23;
  self->_nubbitPositionPercentage = fmin(fmax(v22, 0.0), 1.0);
  [(AXDispatchTimer *)self->_positionSetTimer cancel];
  positionSetTimer = self->_positionSetTimer;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100018C18;
  v25[3] = &unk_1001AAFD0;
  *(double *)&v25[4] = v22;
  int v26 = v23;
  [(AXDispatchTimer *)positionSetTimer afterDelay:v25 processBlock:1.0];
}

- (void)_moveNubbitToPosition:(CGPoint)a3 forKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (![(HNDRocker *)self->_rocker style])
  {
    [(HNDDisplayManager *)self screenBounds];
    v17.origin.double x = CGRectZero.origin.x;
    v17.origin.double y = CGRectZero.origin.y;
    v17.size.width = CGRectZero.size.width;
    v17.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v16, v17))
    {
      if (!v4) {
        -[HNDDisplayManager _updateNubbitEdgePosition:](self, "_updateNubbitEdgePosition:", x, y);
      }
      -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", v4, x, y);
      __asm { FMOV            V2.2D, #-1.0 }
      self->_preKeyboardMovePosition = _Q2;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100018DE4;
      v15[3] = &unk_1001AAFF8;
      v15[4] = self;
      v15[5] = v13;
      v15[6] = v14;
      +[UIView animateWithDuration:v15 animations:0.22];
    }
  }
}

- (void)_repositionNubbitAfterLift:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  fifoIndedouble x = self->_nubbitDistanceTracking.fifoIndex;
  int v7 = fifoIndex - 1;
  if (fifoIndex < 1) {
    int v7 = 7;
  }
  BOOL v8 = __OFSUB__(fifoIndex, 2);
  int v9 = fifoIndex - 2;
  if (v9 < 0 != v8) {
    int v9 = 7;
  }
  float v10 = self->_nubbitDistanceTracking.fifo[v7];
  float v11 = self->_nubbitDistanceTracking.fifo[v9];
  SCRCMathGetAverage();
  if (v12 <= 22.5 || v10 <= 8.0 || v11 <= 8.0) {
    -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:](self, "closestNubbitPositionForPoint:offsetByMidpoint:", 1, x, y);
  }
  else {
    -[HNDDisplayManager nubbitPositionForFlick:](self, "nubbitPositionForFlick:", x, y);
  }

  -[HNDDisplayManager _moveNubbitToPosition:](self, "_moveNubbitToPosition:");
}

- (BOOL)_position:(CGPoint)a3 isOverKeyboard:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  -[UIWindow convertPoint:fromView:](self->_window, "convertPoint:fromView:", self->_contentView, a3.x, a3.y);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;

  return CGRectContainsPoint(*(CGRect *)&v12, *(CGPoint *)&v9);
}

- (BOOL)_nubbitIsOverKeyboard:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  window = self->_window;
  [(HNDRocker *)self->_rocker frame];
  -[UIWindow convertRect:fromView:](window, "convertRect:fromView:", self->_contentView);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;

  return CGRectIntersectsRect(*(CGRect *)&v17, *(CGRect *)&v10);
}

- (CGPoint)_nubbitPositionForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HNDDisplayManager *)self _nubbitPointForEdgePosition];
  double v9 = v8;
  -[UIWindow convertRect:toView:](self->_window, "convertRect:toView:", self->_contentView, x, y, width, height);
  double v11 = v10;
  +[HNDRocker nubbitSize];
  double v13 = v11 - v12;
  if (sub_100042004()
    && AXDeviceIsPhone()
    && [(HNDDisplayManager *)self orientation] == 1)
  {
    self->_int nubbitPositionEdge = 2;
    [(HNDDisplayManager *)self _nubbitPointForEdgePosition];
    double v15 = v14;
    double v13 = v16;
    double v17 = width - v14;
    [(HNDDisplayManager *)self screenBounds];
    double v19 = v18;
    int IsPhone = AXDeviceIsPhone();
    double v21 = 340.0;
    if (IsPhone) {
      double v21 = 134.0;
    }
    double v22 = (v19 - v21) * 0.5;
    if (v15 >= v17)
    {
      double v9 = width - v22;
    }
    else
    {
      +[HNDRocker nubbitSize];
      double v9 = v22 - v23;
    }
  }

  -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", 1, v9, v13);
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (void)_moveNubbitForKeyboard:(CGRect)a3
{
  -[HNDDisplayManager _nubbitPositionForKeyboardFrame:](self, "_nubbitPositionForKeyboardFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[HNDDisplayManager _moveNubbitToPosition:forKeyboard:](self, "_moveNubbitToPosition:forKeyboard:", 1);
}

- (UIEdgeInsets)safeAreaInsets
{
  signed int v2 = [(HNDDisplayManager *)self window];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a3)
  {
    v27.origin.double x = CGRectZero.origin.x;
    v27.origin.double y = CGRectZero.origin.y;
    v27.size.double width = CGRectZero.size.width;
    v27.size.double height = CGRectZero.size.height;
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    int v9 = !CGRectEqualToRect(v27, v29);
  }
  else
  {
    int v9 = 0;
  }
  int keyboardVisible = self->_keyboardVisible;
  double v11 = ASTLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    double v12 = NSStringFromCGRect(v28);
    double v13 = NSStringFromCGRect(self->_keyboardFrame);
    int v23 = 67109634;
    *(_DWORD *)double v24 = v9;
    *(_WORD *)&v24[4] = 2114;
    *(void *)&v24[6] = v12;
    __int16 v25 = 2114;
    int v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "KB visible: %d with frame: %{public}@ (exisitng frame: %{public}@", (uint8_t *)&v23, 0x1Cu);
  }
  if (keyboardVisible == v9
    && (v30.origin.double x = x,
        v30.origin.double y = y,
        v30.size.double width = width,
        v30.size.double height = height,
        CGRectEqualToRect(self->_keyboardFrame, v30)))
  {
    double v14 = ASTLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No change in KB visibility, not moving nubbit.", (uint8_t *)&v23, 2u);
    }
  }
  else
  {
    self->_int keyboardVisible = v9;
    self->_keyboardFrame.origin.double x = x;
    self->_keyboardFrame.origin.double y = y;
    self->_keyboardFrame.size.double width = width;
    self->_keyboardFrame.size.double height = height;
    if (![(HNDRocker *)self->_rocker style])
    {
      if (v9)
      {
        if (-[HNDDisplayManager _nubbitIsOverKeyboard:](self, "_nubbitIsOverKeyboard:", x, y, width, height))
        {
          if (keyboardVisible != v9
            || (double v15 = self->_preKeyboardMovePosition.x, v16 = self->_preKeyboardMovePosition.y, v15 == -1.0)
            && v16 == -1.0)
          {
            [(HNDDisplayManager *)self _nubbitPointForEdgePosition];
            double v15 = v17;
            double v16 = v18;
          }
          -[HNDDisplayManager _moveNubbitForKeyboard:](self, "_moveNubbitForKeyboard:", x, y, width, height);
          self->_preKeyboardMovePosition.double x = v15;
          self->_preKeyboardMovePosition.double y = v16;
          double v19 = ASTLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            CGFloat v20 = NSStringFromPoint(self->_preKeyboardMovePosition);
            int v23 = 138412290;
            *(void *)double v24 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Storing Pre nubbit position: %@", (uint8_t *)&v23, 0xCu);
          }
        }
      }
      else
      {
        double v21 = ASTLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          double v22 = NSStringFromPoint(self->_preKeyboardMovePosition);
          int v23 = 138412290;
          *(void *)double v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Pre nubbit position: %@", (uint8_t *)&v23, 0xCu);
        }
        if (self->_preKeyboardMovePosition.x != -1.0 || self->_preKeyboardMovePosition.y != -1.0) {
          -[HNDDisplayManager _moveNubbitToPosition:](self, "_moveNubbitToPosition:");
        }
      }
    }
  }
}

- (void)moveNubbitToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker nubbitSize];
  double v7 = x - v6 * 0.5;
  double v9 = y - v8 * 0.5;
  [(HNDRocker *)self->_rocker frame];
  rocker = self->_rocker;

  -[HNDRocker setFrame:](rocker, "setFrame:", v7, v9);
}

- (void)setNubbitMoving:(BOOL)a3
{
  if (self->_nubbitMoving != a3)
  {
    BOOL v3 = a3;
    double v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Set nubbit moving from override", v7, 2u);
    }

    double v6 = [(HNDDisplayManager *)self handManager];
    [v6 setNubbitMoving:v3];

    self->_nubbitMoving = v3;
  }
}

- (void)_handleNubbitMove:(CGPoint)a3 event:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  +[HNDRocker nubbitSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = x - v8 * 0.5;
  double v13 = y - v10 * 0.5;
  double v14 = self->_movePoint.x;
  double v15 = self->_movePoint.y;
  double v16 = v14 - v12;
  double v17 = v15 - v13;
  if (!self->_nubbitMoving)
  {
    double v18 = vabdd_f64(v15, v13);
    if (vabdd_f64(v14, v12) <= 1.0 && v18 <= 1.0) {
      goto LABEL_20;
    }
  }
  double v66 = v13;
  double v69 = v12;
  [(HNDRocker *)self->_rocker frame];
  CGFloat v21 = v20;
  CGFloat v65 = v22;
  double v67 = v17;
  double v68 = v14 - v12;
  CGFloat v24 = v23 - v16;
  double v26 = v25 - v17;
  [(HNDDisplayManager *)self screenBounds];
  CGRect v74 = CGRectInset(v73, v9 / -3.0, v11 / -3.0);
  CGFloat v27 = v74.origin.x;
  CGFloat v28 = v74.origin.y;
  CGFloat width = v74.size.width;
  CGFloat height = v74.size.height;
  -[HNDDisplayManager convertFrameToInterfaceOrientation:](self, "convertFrameToInterfaceOrientation:", self->_foreheadRect.origin.x, self->_foreheadRect.origin.y, self->_foreheadRect.size.width, self->_foreheadRect.size.height);
  CGFloat v61 = v31;
  CGFloat v62 = v30;
  CGFloat v59 = v33;
  CGFloat v60 = v32;
  CGFloat r2 = v24;
  v75.origin.double x = v24;
  double v34 = v26;
  v75.origin.double y = v26;
  v75.size.CGFloat width = v21;
  v75.size.CGFloat height = v65;
  double MaxX = CGRectGetMaxX(v75);
  CGFloat v63 = v27;
  v76.origin.double x = v27;
  v76.origin.double y = v28;
  v76.size.CGFloat width = width;
  CGFloat v36 = height;
  v76.size.CGFloat height = height;
  if (MaxX > CGRectGetMaxX(v76)) {
    goto LABEL_9;
  }
  v77.origin.double x = r2;
  v77.origin.double y = v26;
  v77.size.CGFloat width = v21;
  v77.size.CGFloat height = v65;
  double MaxY = CGRectGetMaxY(v77);
  v78.origin.double x = v63;
  v78.origin.double y = v28;
  v78.size.CGFloat width = width;
  v78.size.CGFloat height = height;
  if (MaxY > CGRectGetMaxY(v78)) {
    goto LABEL_9;
  }
  v79.origin.double x = r2;
  v79.origin.double y = v26;
  v79.size.CGFloat width = v21;
  v79.size.CGFloat height = v65;
  double MinX = CGRectGetMinX(v79);
  v80.origin.double x = v63;
  v80.origin.double y = v28;
  v80.size.CGFloat width = width;
  v80.size.CGFloat height = height;
  if (MinX >= CGRectGetMinX(v80))
  {
    v83.origin.double x = r2;
    v83.origin.double y = v26;
    CGFloat v40 = v21;
    v83.size.CGFloat width = v21;
    double v39 = v65;
    v83.size.CGFloat height = v65;
    double MinY = CGRectGetMinY(v83);
    v84.origin.double x = v63;
    v84.origin.double y = v28;
    v84.size.CGFloat width = width;
    v84.size.CGFloat height = v36;
    BOOL v41 = MinY >= CGRectGetMinX(v84);
  }
  else
  {
LABEL_9:
    double v39 = v65;
    CGFloat v40 = v21;
    BOOL v41 = 0;
  }
  double v16 = v68;
  double v12 = v69;
  double v17 = v67;
  if (AXDeviceHasJindo())
  {
    v81.origin.double y = v61;
    v81.origin.double x = v62;
    v81.size.CGFloat height = v59;
    v81.size.CGFloat width = v60;
    v85.origin.double x = r2;
    v85.origin.double y = v34;
    double v42 = v40;
    v85.size.CGFloat width = v40;
    v85.size.CGFloat height = v39;
    CGRect v82 = CGRectIntersection(v81, v85);
    if ((v41 & CGRectIsNull(v82) & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  double v42 = v40;
  if (v41) {
LABEL_14:
  }
    -[HNDRocker setFrame:](self->_rocker, "setFrame:", r2, v34, v42, v39);
LABEL_15:
  double v13 = v66;
  if (!self->_nubbitMoving)
  {
    v43 = ASTLogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Set nubbit moving; handle nubbit move",
        (uint8_t *)&buf,
        2u);
    }

    v44 = [(HNDDisplayManager *)self handManager];
    [v44 setNubbitMoving:1];

    self->_nubbitMoving = 1;
  }
  SCRCMathGetDistanceBetweenPoints();
  SCRCMathUpdateAverage();
  buf.a = 0.0;
  r2_8.a = 0.0;
  SCRCMathGetVectorAndDistanceForPoints();
  SCRCMathUpdateAngleAverage();
LABEL_20:
  v45 = [v7 handInfo];
  id v46 = [v45 paths];
  v47 = [v46 firstPath];
  [v47 orbValue];
  double v49 = v48;

  if (AXForceTouchAvailableAndEnabled())
  {
    if (self->_orbActionExists && !self->_playedHapticForCurrentEvent)
    {
      SCRCMathGetDistanceBetweenPoints();
      if (v50 < 15.0)
      {
        long long v51 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&buf.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&buf.c = v51;
        *(_OWORD *)&buf.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
        [(HNDDisplayManager *)self _iconScaleForForce:v49];
        if (v52 > 1.0)
        {
          CGAffineTransformMakeScale(&buf, v52, v52);
          [(AXDispatchTimer *)self->_longPressTimer cancel];
        }
        rocker = self->_rocker;
        CGAffineTransform r2_8 = buf;
        [(HNDRocker *)rocker setTransform:&r2_8];
      }
    }
  }
  v54 = +[AXSettings sharedInstance];
  v55 = [v54 assistiveTouchSingleTapAction];
  if (![v55 isEqualToString:AXAssistiveTouchIconTypePassThroughToApp])
  {

LABEL_35:
    [(HNDRocker *)self->_rocker highlightNubbit];
    goto LABEL_36;
  }

  if (v16 > 3.0 || v17 > 3.0) {
    goto LABEL_35;
  }
LABEL_36:
  self->_movePoint.double x = v12;
  self->_movePoint.double y = v13;
  id v57 = self->_rocker;
  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", self->_downView, v12, v13);
  -[HNDRocker handleRealMoveEvent:maxOrb:currentForce:](v57, "handleRealMoveEvent:maxOrb:currentForce:");
}

- (double)_iconScaleForForce:(double)a3
{
  double v3 = 1.0;
  if (a3 > 100.0)
  {
    double v4 = a3 / 1000.0 + 1.0;
    double v3 = 1.5;
    if (v4 <= 1.5) {
      return v4;
    }
  }
  return v3;
}

- (id)viewAtDisplayPoint:(CGPoint)a3 downPoint:(CGPoint *)a4 window:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  if (v8)
  {
    double v9 = +[NSMutableArray arrayWithObject:v8];
    if ([v9 count])
    {
      CGRect v29 = a4;
      double v10 = 0;
      do
      {
        double v11 = [v9 objectAtIndex:0];
        [v9 removeObjectAtIndex:0];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        double v12 = [v11 subviews];
        double v13 = [v12 reverseObjectEnumerator];
        double v14 = [v13 allObjects];

        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v31;
LABEL_6:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            double v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
            double v20 = [v8 layer];
            objc_msgSend(v20, "convertPoint:fromLayer:", 0, x, y);
            double v22 = v21;
            double v24 = v23;

            objc_msgSend(v8, "convertPoint:toView:", v19, v22, v24);
            if (objc_msgSend(v19, "pointInside:withEvent:", 0))
            {
              if ([v19 isUserInteractionEnabled]
                && ([v19 isHidden] & 1) == 0)
              {
                break;
              }
            }
            [v9 addObject:v19];
            if (v16 == (id)++v18)
            {
              id v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
              if (v16) {
                goto LABEL_6;
              }
              goto LABEL_14;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v29)
            {
              v29->double x = v22;
              v29->double y = v24;
            }
            id v25 = v19;

            double v26 = [v25 subviews];
            id v27 = [v26 count];

            if (!v27)
            {
              [v9 removeAllObjects];
              goto LABEL_22;
            }
          }
          else
          {
            id v25 = v10;
          }
          [v9 removeAllObjects];
          [v9 addObject:v19];
        }
        else
        {
LABEL_14:
          id v25 = v10;
        }
LABEL_22:

        double v10 = v25;
      }
      while ([v9 count]);
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)window
{
  return self->_window;
}

- (unsigned)displayID
{
  signed int v2 = [(HNDDisplayManager *)self window];
  double v3 = [v2 screen];
  double v4 = [v3 displayIdentity];
  unsigned int v5 = [v4 displayID];

  return v5;
}

- (id)ignoredWindow
{
  return self->_ignoredWindow;
}

- (id)viewAtDisplayPoint:(CGPoint)a3
{
  return -[HNDDisplayManager viewAtDisplayPoint:downPoint:window:](self, "viewAtDisplayPoint:downPoint:window:", 0, self->_window, a3.x, a3.y);
}

- (void)resetNubbitLocation
{
  if (self->_nubbitMoving)
  {
    rocker = self->_rocker;
    long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v8[1] = v4;
    v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(HNDRocker *)rocker setTransform:v8];
    contentView = self->_contentView;
    [(HNDRocker *)self->_rocker bounds];
    AX_CGRectGetCenter();
    -[UIView convertPoint:fromView:](contentView, "convertPoint:fromView:", self->_rocker);
    -[HNDDisplayManager _repositionNubbitAfterLift:](self, "_repositionNubbitAfterLift:");
    [(HNDRocker *)self->_rocker fadeNubbit];
    [(HNDDisplayManager *)self reachabilityOffset];
    if (v6 > 0.0) {
      [(HNDDisplayManager *)self _updateRockerReachability];
    }
  }
  else
  {
    [(HNDDisplayManager *)self reachabilityOffset];
    if (v7 > 0.0)
    {
      [(HNDDisplayManager *)self _resetReachabilityOffset];
    }
  }
}

- (void)_didHandleRealUpEvent
{
  if (+[AXSpringBoardServer isAvailable])
  {
    id v2 = +[AXSpringBoardServer server];
    [v2 cancelSiriDismissalForAssistiveTouch];
  }
}

- (BOOL)handleRealEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 handInfo];
  double v6 = [v5 paths];
  double v7 = [v6 firstPath];
  [v7 pathLocation];
  double v9 = v8;
  double v11 = v10;

  double v12 = [(UIWindow *)self->_window layer];
  objc_msgSend(v12, "convertPoint:fromLayer:", 0, v9, v11);
  double v14 = v13;
  double v16 = v15;

  if (![(HNDDisplayManager *)self isShowingCalibrationUI])
  {
    double v19 = [(HNDDisplayManager *)self handManager];
    [v19 systemPointerLocation];
    double v21 = v20;
    double v23 = v22;

    unsigned int v24 = -[HNDTrackpadEventManager pointOnTrackpadView:](self->_trackpadManager, "pointOnTrackpadView:", v9, v11);
    unsigned int v25 = -[HNDTrackpadEventManager pointOnTrackpad:](self->_trackpadManager, "pointOnTrackpad:", v9, v11);
    if ([(HNDDisplayManager *)self isShowingVirtualTrackpad])
    {
      double v26 = +[UIApplication sharedApplication];
      objc_msgSend(v26, "_enqueueHIDEvent:", objc_msgSend(v4, "creatorHIDEvent"));
    }
    if (self->_lastHandType == 6 && [v5 eventType] == self->_lastHandType)
    {
      CGPoint v27 = CGPointZero;
      self->_nubbitStartDownPoint = CGPointZero;
      self->_downPoint = v27;
      downView = self->_downView;
      self->_downView = 0;

      [(HNDDisplayManager *)self _startIdleTimer];
      BOOL v18 = 1;
      goto LABEL_151;
    }
    [(HNDRocker *)self->_rocker isAnimatingNubbit];
    if ([(HNDRocker *)self->_rocker isAnimatingNubbit])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (id)[(HNDRocker *)self->_rocker state] == (id)1) {
        objc_storeStrong((id *)&self->_downView, self->_rocker);
      }
    }
    BOOL v29 = [v5 eventType] == 1 || objc_msgSend(v5, "eventType") == 2;
    p_downView = (id *)&self->_downView;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [*p_downView isModalDown])
    {
      long long v31 = (HNDRocker *)*p_downView;
    }
    else
    {
      long long v31 = (HNDRocker *)self->_downView;
      if (v31 != self->_rocker
        || !self->_nubbitMoving
        || (v34 = [v5 eventType], long long v31 = (HNDRocker *)*p_downView, v34 != 2))
      {
        if (!v31 || v29)
        {
          -[HNDDisplayManager viewAtDisplayPoint:downPoint:window:](self, "viewAtDisplayPoint:downPoint:window:", &self->_downPoint, self->_window, v9, v11);
          long long v33 = (HNDRocker *)objc_claimAutoreleasedReturnValue();
LABEL_27:
          double v35 = v33;
          multiTouchBackgound = self->_multiTouchBackgound;
          unsigned int v36 = [v5 eventType];
          SCRCMathGetDistanceBetweenPoints();
          BOOL v18 = 0;
          float v38 = v37;
          switch(v36)
          {
            case 1u:
              +[HNDRocker nubbitSize];
              double v55 = v14 - v54 * 0.5;
              double v57 = v16 - v56 * 0.5;
              v58 = +[AXSettings sharedInstance];
              uint64_t v59 = [v58 assistiveTouchLongPressAction];
              if (v59)
              {
                CGFloat v60 = (void *)v59;
                unsigned __int8 v61 = [(HNDRocker *)self->_rocker isFullMenuVisible];

                if ((v61 & 1) == 0)
                {
                  CGFloat v62 = ASTLogCommon();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    CGFloat v63 = +[AXSettings sharedInstance];
                    v64 = [v63 assistiveTouchLongPressAction];
                    *(_DWORD *)CGAffineTransform buf = 138412290;
                    *(void *)&buf[4] = v64;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "kicking off longpress action: %@", buf, 0xCu);
                  }
                  longPressTimer = self->_longPressTimer;
                  double v66 = +[AXSettings sharedInstance];
                  [v66 assistiveTouchLongPressActionDuration];
                  v135[0] = _NSConcreteStackBlock;
                  v135[1] = 3221225472;
                  v135[2] = sub_10001AFB8;
                  v135[3] = &unk_1001AAA90;
                  v135[4] = self;
                  -[AXDispatchTimer afterDelay:processBlock:](longPressTimer, "afterDelay:processBlock:", v135);
                }
              }
              else
              {
              }
              self->_movePoint.double x = v55;
              self->_movePoint.double y = v57;
              if ([(HNDRocker *)self->_rocker isFullMenuVisible])
              {
                -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", self->_downView, v55, v57);
                -[HNDRocker handleRealDownEvent:](v35, "handleRealDownEvent:");
                [(HNDDisplayManager *)self setShouldDelayBeforePresentingHUDView:1];
                [(HNDDisplayManager *)self _updateLargeContentViewerIfNeededForView:v35];
                SCRCMathClearAverage();
                SCRCMathClearAverage();
              }
              else
              {
                if (!self->_nubbitMoving)
                {
                  CGRect v78 = +[AXSettings sharedInstance];
                  CGRect v79 = [v78 assistiveTouchSingleTapAction];
                  unsigned __int8 v80 = [v79 isEqualToString:AXAssistiveTouchIconTypePassThroughToApp];

                  if ((v80 & 1) == 0) {
                    [(HNDRocker *)self->_rocker highlightNubbit];
                  }
                  rocker = self->_rocker;
                  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", rocker, self->_movePoint.x, self->_movePoint.y);
                  -[HNDRocker handleRealDownEvent:](rocker, "handleRealDownEvent:");
                }
                if (v35 == self->_rocker)
                {
                  self->_nubbitStartDownPoint.double x = v55;
                  self->_nubbitStartDownPoint.double y = v57;
                  self->_nubbitTouchDownTime = CFAbsoluteTimeGetCurrent();
                  if (![(HNDRocker *)self->_rocker style])
                  {
                    CGRect v82 = ASTLogCommon();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)CGAffineTransform buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Set nubbit moving; touch event down",
                        buf,
                        2u);
                    }

                    CGRect v83 = [(HNDDisplayManager *)self handManager];
                    [v83 setNubbitMoving:1];

                    self->_BOOL nubbitMoving = 1;
                  }
                }
              }
              if ([(HNDDisplayManager *)self isShowingVirtualTrackpad])
              {
                self->_touchLastPoint.double x = v9;
                self->_touchLastPoint.double y = v11;
                if (v24) {
                  BOOL trackpadCaptureEvents = self->_trackpadCaptureEvents;
                }
                else {
                  BOOL trackpadCaptureEvents = 0;
                }
                self->_clickTrackpad = trackpadCaptureEvents;
                [(HNDRocker *)self->_rocker frame];
                v139.double x = v21;
                v139.double y = v23;
                self->_trackpadTouchRocker = CGRectContainsPoint(v140, v139);
                if (v25) {
                  [(HNDTrackpadViewController *)self->_trackpadVC highlightTrackpad];
                }
                v92 = +[AXSettings sharedInstance];
                [v92 assistiveTouchVirtualTrackpadHoldDuration];
                double v94 = v93;

                v95 = self->_longPressTimer;
                v133[0] = _NSConcreteStackBlock;
                v133[1] = 3221225472;
                v133[2] = sub_10001B0A4;
                v133[3] = &unk_1001AB020;
                char v134 = v24;
                v133[4] = self;
                *(double *)&v133[5] = v21;
                *(double *)&v133[6] = v23;
                [(AXDispatchTimer *)v95 afterDelay:v133 processBlock:v94];
              }
              v96 = [v4 handInfo];
              v97 = [v96 paths];
              v98 = [v97 firstPath];
              [v98 pathPressure];
              self->_double maxOrbDuringTouch = v99;

              [(AXDispatchTimer *)self->_idleTimer cancel];
              [(AXDispatchTimer *)self->_longIdleTimer cancel];
              int v100 = 0;
              goto LABEL_130;
            case 2u:
              double v131 = v23;
              -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v35, v14, v16);
              double v68 = v67;
              double v70 = v69;
              id v71 = (HNDRocker *)self->_downView;
              if (v71 != self->_rocker) {
                goto LABEL_70;
              }
              if ([(HNDView *)self->_downView style])
              {
                id v71 = (HNDRocker *)*p_downView;
LABEL_70:
                if (v71 == v35)
                {
                  double maxOrbDuringTouch = self->_maxOrbDuringTouch;
                  v86 = [v4 handInfo];
                  v87 = [v86 paths];
                  v88 = [v87 firstPath];
                  [v88 pathPressure];
                  -[HNDRocker handleRealMoveEvent:maxOrb:currentForce:](v35, "handleRealMoveEvent:maxOrb:currentForce:", v68, v70, maxOrbDuringTouch, v89);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && [*p_downView isModalDown])
                  {
                    v130 = self->_downView;
                    double v72 = self->_maxOrbDuringTouch;
                    CGRect v73 = [v4 handInfo];
                    CGRect v74 = [v73 paths];
                    CGRect v75 = [v74 firstPath];
                    [v75 pathPressure];
                    -[HNDView handleRealMoveEvent:maxOrb:currentForce:](v130, "handleRealMoveEvent:maxOrb:currentForce:", v68, v70, v72, v76);
                  }
                  else
                  {
                    [(HNDView *)self->_downView handleFingerDriftedAway];
                    CGRect v77 = self->_downView;
                    self->_downView = 0;

                    -[HNDRocker handleRealDownEvent:](v35, "handleRealDownEvent:", v68, v70);
                    [(HNDDisplayManager *)self _updateLargeContentViewerIfNeededForView:v35];
                  }
                }
                double v90 = v131;
                goto LABEL_93;
              }
              double v90 = v131;
              if ([(HNDTrackpadEventManager *)self->_trackpadManager trackpadBorderIsMoving]) {
                goto LABEL_93;
              }
              if (self->_trackpadMoveNubbit)
              {
                self->_trackpadTouchRocker = 0;
                v110 = self;
                double v111 = v21;
                double v112 = v131;
              }
              else
              {
                if (v24)
                {
                  -[HNDDisplayManager viewAtDisplayPoint:](self, "viewAtDisplayPoint:", v14, v16);
                  v128 = (HNDRocker *)objc_claimAutoreleasedReturnValue();
                  v129 = self->_rocker;

                  if (v128 != v129)
                  {
LABEL_93:
                    if (v25) {
                      [(HNDTrackpadViewController *)self->_trackpadVC highlightTrackpad];
                    }
                    if (v24)
                    {
                      unsigned int v91 = [v5 currentFingerCount];
                      if (self->_trackpadCaptureEvents && v91 == 1)
                      {
                        -[HNDTrackpadEventManager moveSystemPointer:startPoint:](self->_trackpadManager, "moveSystemPointer:startPoint:", v9, v11, self->_touchLastPoint.x, self->_touchLastPoint.y);
                        self->_touchLastPoint.double x = v9;
                        self->_touchLastPoint.double y = v11;
                      }
                      else if (v91 == 2)
                      {
                        v101 = [v5 paths];
                        v102 = [v101 secondPath];
                        [v102 pathLocation];
                        double v104 = v103;
                        double v106 = v105;

                        unint64_t trackpadAction = self->_trackpadAction;
                        switch(trackpadAction)
                        {
                          case 2uLL:
                            -[HNDTrackpadEventManager performTrackpadScroll:](self->_trackpadManager, "performTrackpadScroll:", v9, v11);
                            break;
                          case 1uLL:
                            -[HNDTrackpadEventManager performPinch:secondPoint:](self->_trackpadManager, "performPinch:secondPoint:", v9, v11, v104, v106);
                            break;
                          case 0uLL:
                            if ([(HNDTrackpadEventManager *)self->_trackpadManager trackpadInScrollMode])
                            {
                              self->_unint64_t trackpadAction = 2;
                              -[HNDTrackpadEventManager startScroll:](self->_trackpadManager, "startScroll:", v9, v11);
                            }
                            else if ([(HNDTrackpadEventManager *)self->_trackpadManager trackpadInPinchMode])
                            {
                              self->_unint64_t trackpadAction = 1;
                              -[HNDTrackpadEventManager startPinch:pointTwo:systemPoint:](self->_trackpadManager, "startPinch:pointTwo:systemPoint:", v9, v11, v104, v106, v21, v90);
                            }
                            break;
                        }
                      }
                    }
                    if (v38 > 10.0
                      && [(AXDispatchTimer *)self->_longPressTimer isPending]
                      && ([(AXDispatchTimer *)self->_longPressTimer isCancelled] & 1) == 0)
                    {
                      [(AXDispatchTimer *)self->_longPressTimer cancel];
                      v113 = ASTLogCommon();
                      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)CGAffineTransform buf = 134217984;
                        *(double *)&buf[4] = v38;
                        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "Moved to far, canceling long press timer: %f", buf, 0xCu);
                      }
                    }
                    if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001F0968 > 3.0)
                    {
                      v114 = +[AXSpringBoardServer server];
                      [v114 resetDimTimer];

                      qword_1001F0968 = CFAbsoluteTimeGetCurrent();
                    }
                    double v115 = self->_maxOrbDuringTouch;
                    v116 = [v4 handInfo];
                    v117 = [v116 paths];
                    v118 = [v117 firstPath];
                    [v118 pathPressure];
                    float v120 = v119;

                    int v100 = 0;
                    double v121 = v120;
                    if (v115 >= v120) {
                      double v121 = v115;
                    }
                    self->_double maxOrbDuringTouch = v121;
                    goto LABEL_130;
                  }
                }
                v110 = self;
                double v111 = v14;
                double v112 = v16;
              }
              -[HNDDisplayManager _handleNubbitMove:event:](v110, "_handleNubbitMove:event:", v4, v111, v112);
              goto LABEL_93;
            case 6u:
            case 8u:
            case 9u:
            case 0xAu:
              double v39 = self->_rocker;
              long long v40 = *(_OWORD *)&CGAffineTransformIdentity.c;
              *(_OWORD *)CGAffineTransform buf = *(_OWORD *)&CGAffineTransformIdentity.a;
              long long v137 = v40;
              long long v138 = *(_OWORD *)&CGAffineTransformIdentity.tx;
              [(HNDRocker *)v39 setTransform:buf];
              [(AXDispatchTimer *)self->_longPressTimer cancel];
              [(HNDRocker *)self->_rocker fadeNubbit];
              [(HNDTrackpadViewController *)self->_trackpadVC fadeTrackpad];
              unint64_t v41 = self->_trackpadAction;
              if (v41 == 2)
              {
                [(HNDTrackpadEventManager *)self->_trackpadManager endScroll];
              }
              else if (v41 == 1)
              {
                [(HNDTrackpadEventManager *)self->_trackpadManager endPinch];
              }
              if (self->_trackpadCaptureEvents)
              {
                if (self->_clickTrackpad
                  && self->_lastHandType == 1
                  && !-[HNDTrackpadEventManager pointOnTrackpad:](self->_trackpadManager, "pointOnTrackpad:", v21, v23))
                {
                  [(HNDTrackpadEventManager *)self->_trackpadManager handlePrimaryButtonPress:1];
                  [(HNDTrackpadEventManager *)self->_trackpadManager handlePrimaryButtonPress:0];
                }
                else
                {
                  [(HNDTrackpadEventManager *)self->_trackpadManager handlePrimaryButtonPress:0];
                  [(HNDTrackpadEventManager *)self->_trackpadManager setTrackpadHitTest:1];
                }
              }
              if (self->_trackpadTouchRocker && self->_lastHandType - 1 <= 1)
              {
                double v42 = self->_downView;
                -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v42, v21, v23);
                -[HNDView handleRealUpEvent:maxOrb:](v42, "handleRealUpEvent:maxOrb:");
              }
              BOOL nubbitMoving = self->_nubbitMoving;
              v44 = ASTLogCommon();
              BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
              if (!nubbitMoving)
              {
                if (v45)
                {
                  BOOL longPressActionActivated = self->_longPressActionActivated;
                  *(_DWORD *)CGAffineTransform buf = 67109120;
                  *(_DWORD *)&buf[4] = longPressActionActivated;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Up event, long press activation state: %d", buf, 8u);
                }

                if (!self->_longPressActionActivated)
                {
                  [(HNDRocker *)self->_rocker modalizeMenu:0 modalButton:0];
                  if (v36 <= 0xA && ((1 << v36) & 0x640) != 0)
                  {
                    v53 = self->_downView;
                    -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v53, v14, v16);
                    -[HNDView handleRealUpEvent:maxOrb:](v53, "handleRealUpEvent:maxOrb:");
                  }
                  else
                  {
                    v108 = self->_downView;
                    -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v108, v14, v16);
                    -[HNDView handleRealCancelEvent:](v108, "handleRealCancelEvent:");
                  }
                }
LABEL_111:
                self->_BOOL longPressActionActivated = 0;
                CGPoint v109 = CGPointZero;
                self->_downPoint = CGPointZero;
                self->_nubbitStartDownPoint = v109;
                [(HNDDisplayManager *)self _startIdleTimer];
                self->_double maxOrbDuringTouch = 0.0;
                self->_playedHapticForCurrentEvent = 0;
                [(HNDRocker *)self->_rocker resetOrbAction];
                *(_WORD *)&self->_trackpadTouchRocker = 0;
                self->_unint64_t trackpadAction = 0;
                if (![(HNDRocker *)self->_rocker style]) {
                  [(HNDRocker *)self->_rocker showNubbitPressedState:0];
                }
                [(HNDDisplayManager *)self _hideLargeContentViewerIfNeeded];
                [(HNDDisplayManager *)self _didHandleRealUpEvent];
                int v100 = 1;
LABEL_130:
                self->_lastHandType = [v5 eventType];
                if ((v100 & 1) == 0)
                {
                  v122 = self->_downView;
                  if (v122 != (HNDView *)v35)
                  {
                    [(HNDView *)v122 handleFingerDriftedAway];
                    objc_storeStrong((id *)&self->_downView, v35);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if ([*p_downView isBackButton])
                      {
                        uint64_t v123 = 0;
                        id v124 = 0;
                      }
                      else
                      {
                        id v124 = *p_downView;
                        uint64_t v123 = 1;
                      }
                      [(HNDRocker *)self->_rocker modalizeMenu:v123 modalButton:v124];
                      self->_lastMenuInteractionTime = CFAbsoluteTimeGetCurrent();
                      if (!v100) {
                        goto LABEL_144;
                      }
LABEL_142:
                      id v125 = *p_downView;
                      id *p_downView = 0;

                      if (v35 != (HNDRocker *)multiTouchBackgound)
                      {
                        BOOL v18 = 1;
LABEL_150:

                        goto LABEL_151;
                      }
LABEL_144:
                      if (v35) {
                        _ZF = v35 == (HNDRocker *)multiTouchBackgound;
                      }
                      else {
                        _ZF = 1;
                      }
                      BOOL v18 = !_ZF;
                      goto LABEL_150;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0
                      || ([*p_downView isModalDown] & 1) == 0)
                    {
                      [(HNDRocker *)self->_rocker modalizeMenu:0 modalButton:0];
                    }
                  }
                }
                if (!v100) {
                  goto LABEL_144;
                }
                goto LABEL_142;
              }
              if (v45)
              {
                *(_WORD *)CGAffineTransform buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Nubbit not moving", buf, 2u);
              }

              id v46 = [(HNDDisplayManager *)self handManager];
              [v46 setNubbitMoving:0];

              if (v38 >= 10.0
                || CFAbsoluteTimeGetCurrent() - self->_nubbitTouchDownTime >= 0.5 && self->_maxOrbDuringTouch <= 100.0)
              {
                [(HNDRocker *)self->_rocker resetOrbAction];
              }
              else
              {
                if (!self->_trackpadTouchRocker || self->_trackpadCaptureEvents)
                {
                  v47 = self->_downView;
                  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v47, v14, v16);
                  -[HNDView handleRealUpEvent:maxOrb:](v47, "handleRealUpEvent:maxOrb:");
                }
                if ([(HNDRocker *)self->_rocker style]) {
                  goto LABEL_53;
                }
              }
              [(HNDDisplayManager *)self resetNubbitLocation];
LABEL_53:
              self->_BOOL nubbitMoving = 0;
              if (v38 > 10.0)
              {
                __asm { FMOV            V0.2D, #-1.0 }
                self->_preKeyboardMovePosition = _Q0;
              }
              SCRCMathClearAverage();
              SCRCMathClearAverage();
              goto LABEL_111;
            default:
              goto LABEL_150;
          }
        }
      }
    }
    long long v33 = v31;
    goto LABEL_27;
  }
  uint64_t v17 = +[UIApplication sharedApplication];
  objc_msgSend(v17, "_enqueueHIDEvent:", objc_msgSend(v4, "creatorHIDEvent"));

  BOOL v18 = 0;
LABEL_151:

  return v18;
}

- (void)updateRockersForSubstantialTransition
{
}

- (CGPoint)convertPointToIntefaceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDDisplayManager *)self portraitUpScreenBounds];
  int orientation = self->_orientation;
  double v9 = v7 - y;
  double v10 = v6 - x;
  if (orientation == 2) {
    double v11 = v6 - x;
  }
  else {
    double v11 = x;
  }
  if (orientation == 2) {
    double v12 = v7 - y;
  }
  else {
    double v12 = y;
  }
  if (orientation == 3) {
    double v11 = y;
  }
  else {
    double v10 = v12;
  }
  if (orientation == 4) {
    double v10 = x;
  }
  else {
    double v9 = v11;
  }
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGRect)convertFrameToInterfaceOrientation:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HNDDisplayManager *)self portraitUpScreenBounds];
  int orientation = self->_orientation;
  double v10 = v8 - y - height;
  double v12 = v11 - x - width;
  if (orientation == 2) {
    double v13 = v8 - y - height;
  }
  else {
    double v13 = y;
  }
  if (orientation == 2) {
    double v14 = v12;
  }
  else {
    double v14 = x;
  }
  if (orientation == 3) {
    double v15 = width;
  }
  else {
    double v15 = height;
  }
  if (orientation == 3) {
    double v16 = height;
  }
  else {
    double v16 = width;
  }
  if (orientation == 3)
  {
    double v17 = y;
  }
  else
  {
    double v12 = v13;
    double v17 = v14;
  }
  if (orientation == 4) {
    double v18 = width;
  }
  else {
    double v18 = v15;
  }
  if (orientation == 4) {
    double v19 = height;
  }
  else {
    double v19 = v16;
  }
  if (orientation == 4) {
    double v12 = x;
  }
  else {
    double v10 = v17;
  }
  result.size.double height = v18;
  result.size.double width = v19;
  result.origin.double y = v12;
  result.origin.double x = v10;
  return result;
}

- (CGPoint)convertToNormalizedInterfaceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDDisplayManager *)self screenBounds];
  double v6 = x / v5;
  double v8 = y / v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOrientation:(int)a4
{
  double y = a3.y;
  double x = a3.x;
  [(HNDDisplayManager *)self portraitUpScreenBounds];
  double v8 = v7 - x;
  double v10 = v9 - y;
  double v11 = v7 - y;
  double v12 = v9 - x;
  if (a4 != 2)
  {
    double v12 = x;
    double v11 = y;
  }
  if (a4 == 3)
  {
    double v13 = x;
  }
  else
  {
    double v10 = v12;
    double v13 = v11;
  }
  if (a4 == 4) {
    double v10 = y;
  }
  else {
    double v8 = v13;
  }
  result.double y = v8;
  result.double x = v10;
  return result;
}

- (CGPoint)convertPointToPortraitUpOrientation:(CGPoint)a3
{
  -[HNDDisplayManager convertPoint:fromOrientation:](self, "convertPoint:fromOrientation:", self->_orientation, a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGRect)screenBoundsForRockerButton:(id)a3
{
  [(HNDRocker *)self->_rocker onScreenFrameForRockerButton:a3];
  rocker = self->_rocker;
  fingerContentView = self->_fingerContentView;

  -[HNDView convertRect:fromView:](fingerContentView, "convertRect:fromView:", rocker);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_longIdleTimerFired
{
  if ([(HNDDisplayManager *)self isMenuVisible])
  {
    [(HNDRocker *)self->_rocker onScreenLocation];
    double v4 = v3;
    double v6 = v5;
    [(HNDDisplayManager *)self showMenu:0];
  }
  else
  {
    double v4 = -1.0;
    double v6 = -1.0;
  }
  id v8 = [(HNDDisplayManager *)self handManager];
  double v7 = [(HNDDisplayManager *)self hardwareIdentifier];
  objc_msgSend(v8, "resetFingersToPoint:onDisplay:active:", v7, -[HNDView isActive](self->_fingerContentView, "isActive"), v4, v6);
}

- (void)updateNubbitForegroundImageForAction:(id)a3
{
  id v5 = a3;
  rocker = self->_rocker;
  id v7 = v5;
  if (rocker) {
    -[HNDRocker updateForegroundImageForAction:](rocker, "updateForegroundImageForAction:");
  }
  else {
    objc_storeStrong((id *)&self->_pendingForegroundImageAction, a3);
  }
}

- (void)activateDisplayItems
{
  if (![(HNDView *)self->_rocker isActive] && [(HNDDisplayManager *)self isMenuVisible])
  {
    rocker = self->_rocker;
    [(HNDView *)rocker setIsActive:1];
  }
}

- (BOOL)fingerContentViewIsActive
{
  return [(HNDView *)self->_fingerContentView isActive];
}

- (void)setFingerContentViewIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[HNDDisplayManager _shouldSetFingerContentViewToActive:](self, "_shouldSetFingerContentViewToActive:"))
  {
    fingerContentView = self->_fingerContentView;
    [(HNDView *)fingerContentView setIsActive:v3];
  }
}

- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  if (-[HNDDisplayManager _shouldSetFingerContentViewToActive:](self, "_shouldSetFingerContentViewToActive:"))
  {
    fingerContentView = self->_fingerContentView;
    [(HNDView *)fingerContentView setIsActive:v5 withDuration:a4];
  }
}

- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5
{
  BOOL v7 = a3;
  if (-[HNDDisplayManager _shouldSetFingerContentViewToActive:](self, "_shouldSetFingerContentViewToActive:"))
  {
    fingerContentView = self->_fingerContentView;
    [(HNDView *)fingerContentView setIsActive:v7 withDuration:a5 options:a4];
  }
}

- (BOOL)_shouldSetFingerContentViewToActive:(BOOL)a3
{
  BOOL v4 = a3;
  unsigned int v6 = [(HNDDisplayManager *)self inBubbleMode];
  if (!v6)
  {
    if (![(HNDDisplayManager *)self inBubbleMode])
    {
      LOBYTE(v7) = 0;
      return v7 | ![(HNDDisplayManager *)self inBubbleMode];
    }
    goto LABEL_6;
  }
  BOOL v3 = [(HNDDisplayManager *)self handManager];
  if (![v3 currentlySnappedInBubbleMode])
  {
    LOBYTE(v7) = 1;
    goto LABEL_9;
  }
  if ([(HNDDisplayManager *)self inBubbleMode])
  {
LABEL_6:
    id v8 = [(HNDDisplayManager *)self handManager];
    unsigned int v7 = [v8 currentlySnappedInBubbleMode] & !v4;

    if (!v6) {
      return v7 | ![(HNDDisplayManager *)self inBubbleMode];
    }
    goto LABEL_9;
  }
  LOBYTE(v7) = 0;
LABEL_9:

  return v7 | ![(HNDDisplayManager *)self inBubbleMode];
}

- (void)_idleTimerFired
{
  [(AXDispatchTimer *)self->_longIdleTimer cancel];
  longIdleTimer = self->_longIdleTimer;
  unsigned int v4 = [(HNDDisplayManager *)self isMenuVisible];
  double v5 = 7.0;
  if (v4) {
    double v5 = 30.0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B770;
  v6[3] = &unk_1001AAA90;
  v6[4] = self;
  [(AXDispatchTimer *)longIdleTimer afterDelay:v6 processBlock:v5];
}

- (void)_startIdleTimer
{
  [(HNDDisplayManager *)self activateDisplayItems];
  [(AXDispatchTimer *)self->_longIdleTimer cancel];
  [(AXDispatchTimer *)self->_idleTimer cancel];
  idleTimer = self->_idleTimer;
  [(HNDDisplayManager *)self _idleTime];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B81C;
  v4[3] = &unk_1001AAA90;
  v4[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](idleTimer, "afterDelay:processBlock:", v4);
  [(HNDDisplayManager *)self _updateAutoHideMousePointer];
}

- (double)_idleTime
{
  BOOL v3 = [(HNDDisplayManager *)self handManager];
  unsigned int v4 = [v3 dwellControlEnabled];

  double result = 3.0;
  if (v4)
  {
    [(HNDDisplayManager *)self assistiveTouchMouseDwellControlActivationTimeout];
    return v6 + 3.0;
  }
  return result;
}

- (CGPoint)normalizedPointForDifference:(CGPoint)a3
{
  CGFloat y = a3.y;
  __asm { FMOV            V1.2D, #1.0 }
  float64x2_t v9 = vminnmq_f64(vmaxnmq_f64(vaddq_f64(vdivq_f64((float64x2_t)a3, (float64x2_t)vdupq_n_s64(0x4072C00000000000uLL)), (float64x2_t)self->_currentPoint), (float64x2_t)0), _Q1);
  double v10 = v9.f64[1];
  result.double x = v9.f64[0];
  result.CGFloat y = v10;
  return result;
}

- (double)_rotationDegreesForOrientation:(int)a3
{
  double result = 0.0;
  if ((a3 - 2) <= 2) {
    return dbl_1001975E8[a3 - 2];
  }
  return result;
}

- (CGAffineTransform)_transformForOrientation
{
  [(HNDDisplayManager *)self _rotationDegreesForOrientation:self->_orientation];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  double v5 = v4 * 0.0174532925;

  return CGAffineTransformMakeRotation(retstr, v5);
}

- (void)_updateViewsForOrientation
{
  if (self->_orientation)
  {
    [(HNDDisplayManager *)self _resetCurrentPointToInitialPoint];
    id v4 = [(HNDDisplayManager *)self handManager];
    BOOL v3 = [(HNDDisplayManager *)self hardwareIdentifier];
    [v4 resetFingersIfNeededOnDisplay:v3];
  }
}

- (void)setOrientation:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (self->_orientation != v4)
  {
LABEL_7:
    if ([(HNDDisplayManager *)self isShowingCalibrationUI]) {
      [(HNDDisplayManager *)self _forceDismissCalibrationForReason:1];
    }
    int IsPhone = AXDeviceIsPhone();
    if (v4 != 1)
    {
      if (IsPhone)
      {
        float64x2_t v9 = +[AXSpringBoardServer server];
        unsigned int v10 = [v9 isSpotlightVisible];

        if (v10)
        {
          double v11 = +[AXSpringBoardServer server];
          [v11 toggleSpotlight];
        }
      }
    }
    [(HNDDisplayManager *)self _rotationDegreesForOrientation:v4];
    double v13 = v12;
    [(HNDDisplayManager *)self _rotationDegreesForOrientation:self->_orientation];
    double v15 = v14;
    [UIApp windowRotationDuration];
    double v17 = v15 - v13;
    if (v15 - v13 < 0.0) {
      double v17 = -(v15 - v13);
    }
    if (v17 == 180.0) {
      double v18 = v16 + v16;
    }
    else {
      double v18 = v16;
    }
    int v19 = _AXSAssistiveTouchScannerEnabled();
    unsigned int v20 = [(HNDDisplayManager *)self isShowingVirtualTrackpad];
    char v21 = v20;
    if (v20) {
      [(HNDTrackpadEventManager *)self->_trackpadManager setTrackpadCornerPlacement];
    }
    if (v19
      || [(HNDDisplayManager *)self alwaysShowMenu]
      || ([(HNDRocker *)self->_rocker alpha], v22 != 0.0))
    {
      self->_int orientation = v4;
      [(HNDRocker *)self->_rocker alpha];
      BOOL v24 = v23 == 0.0;
      [(HNDRocker *)self->_rocker alpha];
      if (v25 >= 0.01) {
        double v26 = v25;
      }
      else {
        double v26 = 1.0;
      }
      CGPoint v27 = [(HNDTrackpadViewController *)self->_trackpadVC view];
      [v27 alpha];
      uint64_t v29 = v28;

      double v30 = 0.0;
      if (!v19)
      {
        if ([(HNDRocker *)self->_rocker style]) {
          double v30 = 0.0;
        }
        else {
          double v30 = 0.2;
        }
      }
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10001BD24;
      v39[3] = &unk_1001AB048;
      BOOL v40 = v24;
      v39[4] = self;
      char v41 = v21;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10001BE34;
      v32[3] = &unk_1001AB0C0;
      v32[4] = self;
      BOOL v37 = v24;
      char v38 = v21;
      double v34 = v18;
      double v35 = v26;
      uint64_t v36 = v29;
      id v33 = v6;
      +[UIView animateWithDuration:v39 animations:v32 completion:v30];
    }
    else
    {
      [(HNDDisplayManager *)self _updateViewsForOrientation];
    }
    goto LABEL_35;
  }
  if (v4 && [(UIWindow *)self->_window isHidden])
  {
    unsigned int v7 = ASTLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AST Windows: got same non-ambiguous orientation, but windows are hidden, so continue", buf, 2u);
    }

    goto LABEL_7;
  }
  long long v31 = ASTLogCommon();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CGAffineTransform buf = 67109120;
    int v43 = v4;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "AST Windows: visible windows got same orientation, return. orientation: %d", buf, 8u);
  }

LABEL_35:
}

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)isCurrentOrientationLandscape
{
  return (self->_orientation - 3) < 2;
}

- (BOOL)initialMenuDownHasFinished
{
  return self->_menuOpenTime == -3061152000.0;
}

- (BOOL)initialDownMenuCanTransitionToPressDown
{
  return self->_menuOpenTime != -3061152000.0 && CFAbsoluteTimeGetCurrent() - self->_menuOpenTime > 0.15;
}

- (BOOL)hoverMovedToNormalizedPoint:(CGPoint)a3 shouldUpdateCurrentPoint:(BOOL)a4
{
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    if (a3.x == -1.0 && a3.y == -1.0)
    {
      id v8 = ASTLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_100113BDC();
      }
    }
    [(HNDDisplayManager *)self _rotatedNormalizedInitialPoint];
    double v10 = self->_currentPoint.x;
    double v11 = self->_currentPoint.y;
    BOOL v13 = v11 != v12 || v10 != v9;
    BOOL v14 = v10 != x;
    if (v11 != y) {
      BOOL v14 = 1;
    }
    BOOL v15 = v13 && v14;
    self->_currentPoint.double x = x;
    self->_currentPoint.double y = y;
  }
  else
  {
    BOOL v15 = 0;
  }
  if (![(HNDDisplayManager *)self inBubbleMode]
    && [(HNDDisplayManager *)self isMenuVisible])
  {
    fingerContentView = self->_fingerContentView;
    [(HNDDisplayManager *)self screenPoint];
    -[HNDView convertPoint:toView:](fingerContentView, "convertPoint:toView:", self->_rocker);
    -[HNDRocker hoveredTo:](self->_rocker, "hoveredTo:");
  }
  [(HNDDisplayManager *)self _startIdleTimer];
  unsigned __int8 v17 = [(HNDDisplayManager *)self shouldHideCursorsEyeTrackingAutoHide];
  if (![(HNDDisplayManager *)self inBubbleMode])
  {
    double v18 = [(HNDDisplayManager *)self handManager];
    char v19 = [v18 currentlySnappedInBubbleMode] | v17;

    if ((v19 & 1) == 0) {
      [(HNDDisplayManager *)self setFingerContentViewIsActive:1];
    }
  }
  return v15;
}

- (CGPoint)screenPoint
{
  [(HNDDisplayManager *)self screenBounds];
  double v5 = v4;
  double v7 = v6;
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;

  double v10 = sub_100040D54(0, x, y, v5, v7, v3);
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)point
{
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)screenBounds
{
  id v2 = [(UIWindow *)self->_window screen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)portraitUpScreenBounds
{
  id v2 = [(UIWindow *)self->_window screen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)rockerFrame
{
  [(HNDRocker *)self->_rocker frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)userInteractionEnabledOnRockerDismissView
{
  return [(HNDView *)self->_rockerDismiss isUserInteractionEnabled];
}

- (void)updateWithPrimaryFingerPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x == -1.0 && a3.y == -1.0)
  {
    double v7 = ASTLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100113C10();
    }
  }
  [(HNDDisplayManager *)self screenBounds];
  self->_currentPoint.double x = sub_100040D48(x, y, v8, v9, v10);
  self->_currentPoint.double y = v11;
}

- (void)showCircleMenu:(BOOL)a3
{
}

- (void)performPress:(int)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(HNDDisplayManager *)self activateDisplayItems];
  [(AXDispatchTimer *)self->_idleTimer cancel];
  if ([(HNDDisplayManager *)self isMenuVisible])
  {
    if (v5 == 2)
    {
      [(HNDRocker *)self->_rocker performPress:2 type:v4 source:2];
      goto LABEL_9;
    }
    if (![(HNDDisplayManager *)self initialMenuDownHasFinished])
    {
      if (![(HNDDisplayManager *)self initialDownMenuCanTransitionToPressDown])
      {
LABEL_8:
        self->_menuOpenTime = -3061152000.0;
        goto LABEL_9;
      }
      self->_menuDownWillFireAutomaticUp = 1;
    }
    [(HNDRocker *)self->_rocker performPress:v5 type:v4 source:2];
    goto LABEL_8;
  }
LABEL_9:
  self->_isPressedDown = v5 == 2;
}

- (CGPoint)_menuPointForFingerLayout
{
  double v3 = [(HNDDisplayManager *)self handManager];
  uint64_t v4 = [(HNDDisplayManager *)self hardwareIdentifier];
  [v3 preferredMenuDisplayPointOnDisplay:v4];
  double v6 = v5;
  double v8 = v7;

  [(HNDDisplayManager *)self screenBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (v6 == CGPointZero.x && v8 == CGPointZero.y)
  {
    +[HNDRocker nubbitSize];
    double v19 = v18 * 0.5;
    double v6 = v14 * 0.5;
    [(HNDRocker *)self->_rocker frame];
    double v8 = v19 + v20;
  }

  -[HNDDisplayManager _layoutPointForPoint:screenBounds:](self, "_layoutPointForPoint:screenBounds:", v6, v8, v10, v12, v14, v16);
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)_layoutPointForPoint:(CGPoint)a3 screenBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker initialRockerSize];
  double v9 = v8;
  double v11 = v10;
  +[AXAssistiveTouchLayoutView minimumOuterPadding];
  double v13 = v12;
  double v14 = v12 + v9 * 0.5;
  if (x - v9 * 0.5 >= v12) {
    double v14 = x;
  }
  if (v12 + x + v9 * 0.5 > width) {
    double v15 = width - (v9 * 0.5 + v12);
  }
  else {
    double v15 = v14;
  }
  +[HNDRocker nubbitSize];
  double v17 = v11 * 0.5;
  if (y + v11 * 0.5 + v16 <= height)
  {
    if (y - v17 - v16 < 0.0)
    {
      double v20 = height - v13 - v17;
      double v21 = v13 + v17 + v16;
      if (v21 >= v20) {
        double y = v20;
      }
      else {
        double y = v21;
      }
    }
  }
  else
  {
    double v18 = v13 + v17;
    double v19 = height - (v13 + v17 + v16);
    if (v19 >= v18) {
      double y = v19;
    }
    else {
      double y = v18;
    }
  }
  double v22 = v15;
  double v23 = y;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (BOOL)visualsHidden
{
  [(HNDRocker *)self->_rocker alpha];
  BOOL result = v3 <= 0.0 && ([(HNDView *)self->_fingerContentView alpha], v4 <= 0.0) || self->_visualsHidden;
  return result;
}

- (void)setVisualsHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  double v9 = ASTLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CGAffineTransform buf = 67109634;
    BOOL v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Set visuals hidden: %i. Reason: %@. Animated: %i", buf, 0x18u);
  }

  self->_visualsHidden = v6;
  double v10 = 0.0;
  if (v5) {
    +[HNDDisplayManager fadeDuration];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CB1C;
  v11[3] = &unk_1001AB0E8;
  v11[4] = self;
  BOOL v12 = v6;
  +[UIView animateWithDuration:v11 animations:v10];
  if (!v6) {
    [(HNDRocker *)self->_rocker fadeNubbit];
  }
}

- (void)showMenu:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HNDRocker *)self->_rocker isFullMenuVisible] != a3
    && ![(HNDRocker *)self->_rocker isAnimatingNubbit])
  {
    rocker = self->_rocker;
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v33[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v7 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v33[1] = v6;
    v33[2] = v7;
    [(HNDRocker *)rocker setTransform:v33];
    self->_BOOL nubbitMoving = 0;
    if (v3)
    {
      [(HNDRocker *)self->_rocker highlightNubbit];
      *(_WORD *)&self->_isPressedDown = 257;
      self->_menuOpenTime = CFAbsoluteTimeGetCurrent();
      [(HNDView *)self->_rockerDismiss setUserInteractionEnabled:1];
      +[HNDDisplayManager fadeDuration];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10001D02C;
      v32[3] = &unk_1001AAA90;
      v32[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v32);
      [(HNDDisplayManager *)self _menuPointForFingerLayout];
      double v9 = v8;
      double v11 = v10;
      BOOL v12 = [(HNDDisplayManager *)self handManager];
      [v12 specialToolUsageEnded:1];

      double v13 = [(HNDDisplayManager *)self handManager];
      BOOL v14 = [(HNDDisplayManager *)self hardwareIdentifier];
      [v13 resetFingersIfNeededOnDisplay:v14];

      LODWORD(v13) = [(HNDRocker *)self->_rocker style];
      [(HNDRocker *)self->_rocker setStyle:1];
      __int16 v15 = self->_rocker;
      if (v13)
      {
        -[HNDRocker setFullMenuVisible:atPoint:](v15, "setFullMenuVisible:atPoint:", 1, v9, v11);
        id v16 = [(HNDDisplayManager *)self handManager];
        __int16 v17 = [(HNDDisplayManager *)self hardwareIdentifier];
        [v16 resetFingersIfActiveOnDisplay:v17];
      }
      else
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10001D108;
        v30[3] = &unk_1001AAA90;
        v30[4] = self;
        -[HNDRocker transitionNubbitToMenu:concurrentAnimation:animationCompleted:](v15, "transitionNubbitToMenu:concurrentAnimation:animationCompleted:", v30, &stru_1001AB108, v9, v11);
      }
    }
    else
    {
      [(HNDView *)self->_rockerDismiss setUserInteractionEnabled:0];
      +[HNDDisplayManager fadeDuration];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10001D0A4;
      v31[3] = &unk_1001AAA90;
      v31[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v31);
      [(HNDDisplayManager *)self _menuPointForFingerLayout];
      BOOL v18 = [(HNDDisplayManager *)self handManager];
      double v19 = [v18 eventManager];
      [v19 manipulateDimTimer:0];

      [(HNDDisplayManager *)self _nubbitPointForEdgePosition];
      -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", 0);
      double v22 = v20;
      double v23 = v21;
      if (self->_keyboardVisible
        && -[HNDDisplayManager _position:isOverKeyboard:](self, "_position:isOverKeyboard:", v20, v21, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
      {
        -[HNDDisplayManager _nubbitPositionForKeyboardFrame:](self, "_nubbitPositionForKeyboardFrame:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        double v22 = v24;
        double v23 = v25;
      }
      unsigned int v26 = [(HNDDisplayManager *)self alwaysShowMenu];
      CGPoint v27 = self->_rocker;
      if (v26) {
        -[HNDRocker transitionMenuToNubbit:changeAlpha:animate:](v27, "transitionMenuToNubbit:changeAlpha:animate:", 1, 1, v22, v23);
      }
      else {
        -[HNDRocker setFullMenuVisible:atPoint:](v27, "setFullMenuVisible:atPoint:", 0, v22, v23);
      }
    }
    uint64_t v28 = [(HNDDisplayManager *)self handManager];
    uint64_t v29 = [v28 eventManager];
    [v29 setMenuVisible:v3];
  }
}

- (BOOL)isMenuVisible
{
  return [(HNDRocker *)self->_rocker isFullMenuVisible];
}

- (void)restartWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = ASTLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AST Windows: restart display manager", v6, 2u);
  }

  [(HNDDisplayManager *)self cleanup];
  [(HNDDisplayManager *)self initializeDisplayWithCompletion:v4];
}

- (void)updateMenuStyle
{
  +[UIView setAnimationsEnabled:0];
  [(HNDRocker *)self->_rocker setNubbitVisible:[(HNDDisplayManager *)self alwaysShowMenu]];
  if ([(HNDDisplayManager *)self alwaysShowMenu] && ![(HNDRocker *)self->_rocker style])
  {
    [(HNDDisplayManager *)self _nubbitPointForEdgePosition];
    -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", 0);
    -[HNDRocker transitionMenuToNubbit:changeAlpha:animate:](self->_rocker, "transitionMenuToNubbit:changeAlpha:animate:", 1, 1);
  }

  +[UIView setAnimationsEnabled:1];
}

- (void)_deviceCountChanged:(id)a3
{
  id v4 = [a3 integerValue];

  [(HNDDisplayManager *)self deviceCountChanged:v4];
}

- (void)deviceCountChanged:(int64_t)a3
{
  if (a3 < 1)
  {
    if (!a3 && [(HNDDisplayManager *)self isMenuVisible]) {
      [(HNDDisplayManager *)self showMenu:0];
    }
    goto LABEL_17;
  }
  if (self->_ignoredWindow)
  {
    id v4 = [(HNDDisplayManager *)self handManager];
    BOOL v5 = [v4 deviceManager];
    if ([v5 hidDeviceIsConfiguring])
    {
      unsigned int v6 = 1;
    }
    else
    {
      long long v7 = [(HNDDisplayManager *)self handManager];
      double v8 = [v7 deviceManager];
      unsigned int v6 = [v8 hidDeviceSentReservedStatus];
    }
    if (AXDeviceSupportsOnDeviceEyeTracking())
    {
      if (([(HNDDisplayManager *)self isShowingCalibrationUI] | v6)) {
        goto LABEL_17;
      }
    }
    else if (v6)
    {
LABEL_17:
      double v9 = [(HNDDisplayManager *)self handManager];
      double v10 = [(HNDDisplayManager *)self hardwareIdentifier];
      [v9 resetFingersIfNeededOnDisplay:v10];

      double v11 = [(HNDDisplayManager *)self handManager];
      [v11 updateMenuVisibility];

      BOOL v12 = [(HNDDisplayManager *)self handManager];
      [v12 updateSoftwareKeyboardState];

      double v13 = [(HNDDisplayManager *)self handManager];
      BOOL v14 = [(HNDDisplayManager *)self handManager];
      __int16 v15 = [v14 deviceManager];
      objc_msgSend(v13, "prepareForEyeTrackerConnected:", objc_msgSend(v15, "mainDeviceIsMotionTracker"));

      rocker = self->_rocker;
      [(HNDRocker *)rocker forceReloadScrollMenuItems];
      return;
    }
    -[HNDDisplayManager hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:](self, "hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:", 0, CGPointZero.x, CGPointZero.y);
    goto LABEL_17;
  }
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [(HNDDisplayManager *)self performSelector:"_deviceCountChanged:" withObject:v17 afterDelay:0.1];
}

- (void)updateRingerSwitch
{
}

- (void)updateRotationLockSwitch
{
}

- (BOOL)inNubbitMode
{
  return [(HNDRocker *)self->_rocker style] == 0;
}

- (void)volumeChanged
{
}

- (void)didFailToPinApp
{
}

- (void)didFailToFloatApp
{
}

- (void)viewPressedDown:(id)a3
{
  if (self->_rocker == a3 && ![a3 style])
  {
    id v4 = +[AXSettings sharedInstance];
    id v5 = [v4 assistiveTouchMainScreenCustomization];

    if ([(HNDRocker *)self->_rocker customizationMapAllowInstanceActivation:v5])
    {
      [(HNDRocker *)self->_rocker showNubbitPressedState:1];
    }
  }
}

- (void)viewOrbActionTriggered:(id)a3
{
  if (self->_rocker == a3 && ![a3 style])
  {
    id v4 = +[AXSettings sharedInstance];
    id v8 = [v4 assistiveTouchOrbAction];

    id v5 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:AXAssistiveTouchIconTypeOpenMenu])
      {
        window = self->_window;
        [(HNDRocker *)self->_rocker bounds];
        AX_CGRectGetCenter();
        -[UIWindow convertPoint:fromView:](window, "convertPoint:fromView:", self->_rocker);
        -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:](self, "closestNubbitPositionForPoint:offsetByMidpoint:", 1);
        -[HNDDisplayManager _updateNubbitEdgePosition:](self, "_updateNubbitEdgePosition:");
      }
      sub_100042060(1);
      self->_playedHapticForCurrentEvent = 1;
      sub_100040C44(@"assistiveTouchOrbAction");
      long long v7 = [(HNDDisplayManager *)self handManager];
      [v7 setNubbitMoving:0];

      [(HNDRocker *)self->_rocker activateMenuItemDown:v8 fromButtonPress:0];
      [(HNDRocker *)self->_rocker activateMenuItemUp:v8 fromButtonPress:0];
      id v5 = v8;
    }
  }
}

- (id)rocker
{
  return self->_rocker;
}

- (void)activateAssistiveTouchAction:(id)a3 fromButtonPress:(BOOL)a4
{
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  BOOL v18 = sub_10001D8EC;
  double v19 = &unk_1001AB158;
  double v20 = self;
  id v6 = a3;
  id v21 = v6;
  BOOL v22 = a4;
  long long v7 = objc_retainBlock(&v16);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handManager);
  if (![WeakRetained inBubbleMode]) {
    goto LABEL_6;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_handManager);
  if (([v9 currentlySnappedInBubbleMode] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  unsigned int v10 = [v6 isEqualToString:AXAssistiveTouchIconTypeTap];

  if (!v10)
  {
LABEL_7:
    ((void (*)(void ***))v7[2])(v7);
    goto LABEL_8;
  }
  double v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  double v13 = sub_10001DA24;
  BOOL v14 = &unk_1001AAA90;
  __int16 v15 = self;
  AXPerformBlockOnMainThread();
LABEL_8:
  -[HNDDisplayManager moveTrackpadViewToFront:](self, "moveTrackpadViewToFront:", 1, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  [(UIView *)self->_contentView bringSubviewToFront:self->_rocker];
}

- (void)viewPressedUp:(id)a3
{
  id v4 = (HNDRocker *)a3;
  p_super = &v4->super;
  if (self->_rocker == v4 && ![(HNDRocker *)v4 style])
  {
    id v8 = +[AXSettings sharedInstance];
    id v9 = [v8 assistiveTouchLongPressAction];

    unsigned int v10 = +[AXSettings sharedInstance];
    double v11 = [v10 assistiveTouchDoubleTapAction];

    uint64_t v12 = +[AXSettings sharedInstance];
    double v13 = [v12 assistiveTouchSingleTapAction];

    BOOL v14 = [(HNDDisplayManager *)self handManager];
    __int16 v15 = [(HNDDisplayManager *)self hardwareIdentifier];
    [v14 resetFingersIfActiveOnDisplay:v15];

    [(AXDispatchTimer *)self->_longPressTimer cancel];
    unsigned int v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_10001DDC0;
    uint64_t v29 = &unk_1001AB180;
    double v30 = self;
    id v16 = v11;
    id v31 = v16;
    id v17 = v9;
    id v32 = v17;
    id v18 = v13;
    id v33 = v18;
    double v19 = objc_retainBlock(&v26);
    if ([(AXDispatchTimer *)self->_doubleTapTimer isPending]
      && ([(AXDispatchTimer *)self->_doubleTapTimer isCancelled] & 1) == 0)
    {
      double v25 = ASTLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGAffineTransform buf = 138412290;
        id v35 = v16;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Performing double tap action: %@", buf, 0xCu);
      }

      [(HNDDisplayManager *)self activateAssistiveTouchAction:v16 fromButtonPress:0];
      [(AXDispatchTimer *)self->_doubleTapTimer cancel];
    }
    else if (v16)
    {
      double v20 = ASTLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = +[AXSettings sharedInstance];
        [v21 assistiveTouchDoubleTapActionTimeout];
        *(_DWORD *)CGAffineTransform buf = 134217984;
        id v35 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Waiting to see if double tap triggered: %f", buf, 0xCu);
      }
      doubleTapTimer = self->_doubleTapTimer;
      double v24 = +[AXSettings sharedInstance];
      [v24 assistiveTouchDoubleTapActionTimeout];
      -[AXDispatchTimer afterDelay:processBlock:](doubleTapTimer, "afterDelay:processBlock:", v19);
    }
    else
    {
      ((void (*)(void ***))v19[2])(v19);
    }
  }
  else if (self->_rockerDismiss == p_super && [(HNDRocker *)self->_rocker style] == 1)
  {
    id v6 = [(HNDDisplayManager *)self handManager];
    long long v7 = [(HNDDisplayManager *)self hardwareIdentifier];
    [v6 menuExitedOnDisplay:v7];
  }
}

- (void)showBubbleNotificationIndefinitelyWithError:(id)a3
{
}

- (void)showBubbleNotificationWithError:(id)a3 duration:(double)a4
{
  id v11 = a3;
  bannerViewPresenter = self->_bannerViewPresenter;
  if (bannerViewPresenter)
  {
    long long v7 = [(AXUIBannerPresenter *)bannerViewPresenter containingView];
    contentView = self->_contentView;

    if (v7 == contentView) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (self->_contentView)
  {
LABEL_3:
    id v9 = (AXUIBannerPresenter *)[objc_alloc((Class)AXUIBannerPresenter) initWithContainingView:self->_contentView];
    unsigned int v10 = self->_bannerViewPresenter;
    self->_bannerViewPresenter = v9;
  }
LABEL_4:
  [(AXUIBannerPresenter *)self->_bannerViewPresenter presentBannerViewWithText:v11 duration:a4];
}

- (void)hideBubbleNotification
{
}

- (BOOL)shouldHideCursorsEyeTrackingAutoHide
{
  BOOL v3 = [(HNDDisplayManager *)self handManager];
  if ([v3 eyeTrackingAutoHideEnabled])
  {
    id v4 = [(HNDDisplayManager *)self handManager];
    unsigned __int8 v5 = [v4 hidePointerForEyeTrackingAutoHide];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)drawBubbleCursorFrame:(CGRect)a3 withPath:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  unsigned int v10 = [(HNDDisplayManager *)self bubbleModeContentView];
  unsigned __int8 v11 = [v10 isActive];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(HNDDisplayManager *)self bubbleModeContentView];
    [v12 setIsActive:1];
  }
  double v13 = [(HNDDisplayManager *)self bubbleCursor];

  if (!v13)
  {
    id v14 = objc_alloc((Class)UIView);
    __int16 v15 = [(HNDDisplayManager *)self bubbleModeContentView];
    [v15 bounds];
    id v16 = objc_msgSend(v14, "initWithFrame:");
    [(HNDDisplayManager *)self setBubbleCursor:v16];

    id v17 = [(HNDDisplayManager *)self bubbleCursor];
    [v17 setAutoresizingMask:18];

    id v18 = [(HNDDisplayManager *)self bubbleModeContentView];
    double v19 = [(HNDDisplayManager *)self bubbleCursor];
    [v18 addSubview:v19];
  }
  double v20 = [(HNDDisplayManager *)self bubbleCursorController];

  if (!v20)
  {
    id v21 = objc_alloc_init(HNDBubbleCursorController);
    [(HNDDisplayManager *)self setBubbleCursorController:v21];

    BOOL v22 = [(HNDDisplayManager *)self bubbleCursor];
    double v23 = [v22 layer];
    double v24 = [(HNDDisplayManager *)self bubbleCursorController];
    double v25 = [v24 cursorContainerLayer];
    [v23 addSublayer:v25];
  }
  id v26 = [(HNDDisplayManager *)self bubbleCursorController];
  objc_msgSend(v26, "updateTheme:level:path:frame:isSimpleRect:animated:", 0, 1, v9, 1, 0, x, y, width, height);
}

- (void)hideBubbleCursor
{
  id v2 = [(HNDDisplayManager *)self bubbleModeContentView];
  [v2 setIsActive:0];
}

- (void)showBubbleCursor
{
  id v2 = [(HNDDisplayManager *)self bubbleModeContentView];
  [v2 setIsActive:1];
}

- (BOOL)bubbleCursorIsActive
{
  id v2 = [(HNDDisplayManager *)self bubbleModeContentView];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (BOOL)inBubbleMode
{
  id v2 = [(HNDDisplayManager *)self handManager];
  unsigned __int8 v3 = [v2 inBubbleMode];

  return v3;
}

- (void)overrideBubbleCursorOpacity:(double)a3
{
  id v4 = [(HNDDisplayManager *)self bubbleModeContentView];
  [v4 setInactiveAlpha:a3];
}

- (void)animateBubbleCursorDwellWithDuration:(double)a3 inRocker:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(HNDDisplayManager *)self dwellBubbleModeCompletionBlock];

  if (v9)
  {
    unsigned int v10 = [(HNDDisplayManager *)self dwellBubbleModeCompletionBlock];
    v10[2](v10, 0);

    [(HNDDisplayManager *)self setDwellBubbleModeCompletionBlock:0];
  }
  unsigned __int8 v11 = [(HNDDisplayManager *)self bubbleCursorController];
  uint64_t v12 = [v11 cursorBackgroundLayer];

  double v13 = [v12 animationKeys];
  unsigned int v14 = [v13 containsObject:@"ASTBubbleModeDwellStartAnimationID"];

  if (v14) {
    [(HNDDisplayManager *)self cancelDwellOnBubbleCursor];
  }
  __int16 v15 = +[CABasicAnimation animationWithKeyPath:@"fillColor"];
  [v15 setValue:@"ASTBubbleModeDwellStartAnimationID" forKey:@"ASTBubbleModeAnimationID"];
  int v16 = _AXSPointerStrokeColor();
  int v17 = _AXSPointerStrokeColor();
  int v18 = v17;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (v16 && v17 != 1 && (_AXSPointerStrokeColor(), _AXSPointerStrokeColorValues()))
  {
    double v19 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
  else
  {
    if (v18 == 1 || v5)
    {
      double v21 = 0.8;
      double v20 = 0.6;
    }
    else
    {
      double v20 = 0.7;
      double v21 = 0.5;
    }
    double v19 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v21, v20, 0, 0);
  }
  id v22 = v19;
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[v22 CGColor], 0.4);
  [v15 setToValue:CopyWithAlpha];
  [v15 setDuration:a3];
  [v15 setDelegate:self];
  [v15 setRemovedOnCompletion:0];
  [v12 addAnimation:v15 forKey:@"ASTBubbleModeDwellStartAnimationID"];
  if (CopyWithAlpha) {
    CFRelease(CopyWithAlpha);
  }
  -[HNDDisplayManager setDwellBubbleModeCompletionBlock:](self, "setDwellBubbleModeCompletionBlock:", v8, v24, v25);
}

- (void)cancelDwellOnBubbleCursor
{
  unsigned __int8 v3 = [(HNDDisplayManager *)self bubbleCursorController];
  id v6 = [v3 cursorBackgroundLayer];

  [v6 removeAnimationForKey:@"ASTBubbleModeDwellStartAnimationID"];
  id v4 = [(HNDDisplayManager *)self dwellBubbleModeCompletionBlock];

  if (v4)
  {
    BOOL v5 = [(HNDDisplayManager *)self dwellBubbleModeCompletionBlock];
    v5[2](v5, 0);

    [(HNDDisplayManager *)self setDwellBubbleModeCompletionBlock:0];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v5 = objc_msgSend(a3, "valueForKey:", @"ASTBubbleModeAnimationID", a4);
  unsigned int v6 = [v5 isEqualToString:@"ASTBubbleModeDwellStartAnimationID"];

  if (v6)
  {
    long long v7 = [(HNDDisplayManager *)self bubbleCursorController];
    id v8 = [v7 cursorBackgroundLayer];

    id v9 = +[CABasicAnimation animationWithKeyPath:@"strokeColor"];
    [v9 setValue:@"ASTBubbleModeDwellStopAnimationID" forKey:@"ASTBubbleModeAnimationID"];
    id v10 = [v8 restingStrokeColor];
    objc_msgSend(v9, "setToValue:", objc_msgSend(v10, "CGColor"));

    [v9 setDuration:0.3];
    [v9 setRemovedOnCompletion:1];
    [v8 addAnimation:v9 forKey:@"ASTBubbleModeDwellStopAnimationID"];
  }
  unsigned __int8 v11 = [(HNDDisplayManager *)self dwellBubbleModeCompletionBlock];

  if (v11)
  {
    uint64_t v12 = [(HNDDisplayManager *)self dwellBubbleModeCompletionBlock];
    v12[2](v12, 1);

    [(HNDDisplayManager *)self setDwellBubbleModeCompletionBlock:0];
  }
}

- (CGRect)orientedContinuousScrollViewFrameForScrollViewFrame:(CGRect)a3
{
  window = self->_window;
  -[HNDDisplayManager convertFrameToInterfaceOrientation:](self, "convertFrameToInterfaceOrientation:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  fingerContentView = self->_fingerContentView;

  -[UIWindow convertRect:toView:](window, "convertRect:toView:", fingerContentView);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)addUserInterfaceClientEnabler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HNDDisplayManager *)self userInterfaceClientEnablers];

  if (!v5)
  {
    double v6 = +[NSMutableSet set];
    [(HNDDisplayManager *)self setUserInterfaceClientEnablers:v6];
  }
  double v7 = [(HNDDisplayManager *)self userInterfaceClientEnablers];
  [v7 addObject:v4];

  [(HNDDisplayManager *)self _setupUserInterfaceClient];
}

- (void)removeUserInterfaceClientEnabler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HNDDisplayManager *)self userInterfaceClientEnablers];
  [v5 removeObject:v4];

  double v6 = [(HNDDisplayManager *)self userInterfaceClientEnablers];
  id v7 = [v6 count];

  if (!v7)
  {
    [(HNDDisplayManager *)self _cleanupUserInterfaceClient];
  }
}

- (void)_setupUserInterfaceClient
{
  unsigned __int8 v3 = [(HNDDisplayManager *)self userInterfaceClient];
  if (!v3)
  {
    if (AXInPreboardScenario()) {
      return;
    }
    id v5 = [objc_alloc((Class)AXUIClient) initWithIdentifier:@"AssistiveTouchUIClient" serviceBundleName:@"AssistiveTouch"];
    [(HNDDisplayManager *)self setUserInterfaceClient:v5];
    id v4 = [(HNDDisplayManager *)self userInterfaceClient];
    [v4 sendAsynchronousMessage:0 withIdentifier:2 targetAccessQueue:0 completion:0];

    unsigned __int8 v3 = v5;
  }
}

- (void)_cleanupUserInterfaceClient
{
  unsigned __int8 v3 = [(HNDDisplayManager *)self userInterfaceClient];

  if (v3)
  {
    id v4 = [(HNDDisplayManager *)self userInterfaceClient];
    [v4 sendAsynchronousMessage:0 withIdentifier:1 targetAccessQueue:0 completion:0];

    [(HNDDisplayManager *)self setUserInterfaceClient:0];
  }
}

- (void)showSimpleAlertWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDDisplayManager *)self userInterfaceClientEnablers];
  id v6 = [v5 count];

  if (!v6) {
    _AXAssert();
  }
  if ([v4 length])
  {
    id v7 = [(HNDDisplayManager *)self userInterfaceClient];
    CFStringRef v9 = @"simple alert text";
    id v10 = v4;
    double v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v7 sendAsynchronousMessage:v8 withIdentifier:7 targetAccessQueue:0 completion:0];
  }
}

- (void)showSimpleBannerWithTitle:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HNDDisplayManager *)self userInterfaceClientEnablers];
  id v9 = [v8 count];

  if (!v9) {
    _AXAssert();
  }
  if (![v6 length] || !objc_msgSend(v7, "length"))
  {
    id v12 = v6;
    id v13 = v7;
    _AXAssert();
  }
  if (objc_msgSend(v6, "length", v12, v13) && objc_msgSend(v7, "length"))
  {
    id v10 = [(HNDDisplayManager *)self userInterfaceClient];
    v14[0] = @"simple banner title";
    v14[1] = @"simple banner text";
    v15[0] = v6;
    v15[1] = v7;
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v10 sendAsynchronousMessage:v11 withIdentifier:8 targetAccessQueue:0 completion:0];
  }
}

- (UIView)scannerContentView
{
  return self->_scannerContentView;
}

- (UIView)scannerFrontCursorView
{
  return self->_scannerFrontCursorView;
}

- (UIView)scannerBackCursorView
{
  return self->_scannerBackCursorView;
}

- (void)_layoutHUDView:(id)a3 withinBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double v13 = CGRectGetWidth(v21) / v10;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double v14 = CGRectGetHeight(v22) / v12;
  if (v13 < v14) {
    double v14 = v13;
  }
  sCGFloat x = fmax(fmin(v14, 1.0), 0.5);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGRectGetMidX(v23);
  UIRoundToViewScale();
  double v16 = v10 * 0.5 + v15;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  CGRectGetMidY(v24);
  UIRoundToViewScale();
  objc_msgSend(v8, "setCenter:", v16, v12 * 0.5 + v17);
  objc_msgSend(v8, "setBounds:", CGRectZero.origin.x, CGRectZero.origin.y, v10, v12);
  CGAffineTransformMakeScale(&v20, sx, sx);
  CGAffineTransform v19 = v20;
  [v8 setTransform:&v19];
}

- (id)_itemForButton:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)UIAccessibilityHUDItem);
  id v5 = [v3 title];
  id v6 = [v3 deviceSpecificImage];

  id v7 = objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", v5, v6, 1, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v7;
}

- (BOOL)_shouldShowLargeContentViewer
{
  if (+[UILargeContentViewerInteraction isEnabled])
  {
    id v2 = +[AXAssistiveTouchLayoutView labelMaximumContentSizeCategory];
    BOOL v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_updateLargeContentViewerIfNeededForView:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDDisplayManager *)self presentHUDViewTimer];
  [v5 cancel];

  if ([(HNDDisplayManager *)self _shouldShowLargeContentViewer]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v6 = v4) != 0)
  {
    id v7 = v6;
    id v8 = self->_contentView;
    double v9 = [(HNDDisplayManager *)self _itemForButton:v7];
    double v10 = [(HNDDisplayManager *)self hudView];

    if (v10)
    {
      double v11 = [(HNDDisplayManager *)self hudView];
      double v12 = [v11 item];
      unsigned __int8 v13 = [v9 isEqual:v12];

      if ((v13 & 1) == 0)
      {
        double v14 = [(HNDDisplayManager *)self hudView];
        [v14 setItem:v9];

        double v15 = [(HNDDisplayManager *)self hudView];
        [(UIView *)v8 bounds];
        -[HNDDisplayManager _layoutHUDView:withinBounds:](self, "_layoutHUDView:withinBounds:", v15);
      }
    }
    else if ([(HNDDisplayManager *)self shouldDelayBeforePresentingHUDView])
    {
      double v16 = [(HNDDisplayManager *)self presentHUDViewTimer];

      if (!v16)
      {
        id v17 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
        [(HNDDisplayManager *)self setPresentHUDViewTimer:v17];
      }
      int v18 = [(HNDDisplayManager *)self presentHUDViewTimer];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001F320;
      v19[3] = &unk_1001AB1A8;
      v19[4] = self;
      id v20 = v9;
      CGRect v21 = v8;
      [v18 afterDelay:v19 processBlock:0.15];
    }
    else
    {
      [(HNDDisplayManager *)self _presentLargeContentViewerForHUDItem:v9 inContentView:v8];
    }
  }
  else
  {
    [(HNDDisplayManager *)self _hideLargeContentViewerIfNeeded];
  }
}

- (void)_presentLargeContentViewerForHUDItem:(id)a3 inContentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = ASTLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100113C78();
    }
  }
  double v9 = [(HNDDisplayManager *)self hudView];

  if (v9)
  {
    double v10 = ASTLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100113C44();
    }
  }
  [(HNDDisplayManager *)self _hideLargeContentViewerIfNeeded];
  id v11 = [objc_alloc((Class)UIAccessibilityHUDView) initWithHUDItem:v6];
  [v7 addSubview:v11];
  [v7 bounds];
  -[HNDDisplayManager _layoutHUDView:withinBounds:](self, "_layoutHUDView:withinBounds:", v11);
  [v11 showAnimated:1 completion:0];
  [(HNDDisplayManager *)self setHudView:v11];
}

- (void)_hideLargeContentViewerIfNeeded
{
  BOOL v3 = [(HNDDisplayManager *)self presentHUDViewTimer];
  [v3 cancel];

  id v4 = [(HNDDisplayManager *)self hudView];

  if (v4)
  {
    id v5 = [(HNDDisplayManager *)self hudView];
    [(HNDDisplayManager *)self setHudView:0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001F54C;
    v7[3] = &unk_1001AAA90;
    id v8 = v5;
    id v6 = v5;
    [v6 dismissAnimated:1 completion:v7];
  }
}

- (void)willShowCalibrationUI
{
  id v3 = [(HNDDisplayManager *)self handManager];
  id v2 = [v3 deviceManager];
  [v2 eyeTrackingRecalibrateFace];
}

- (void)didShowCalibrationUI
{
  self->_BOOL showingCalibrationUI = 1;
  id v3 = [(HNDDisplayManager *)self handManager];
  [v3 hideUIForEyeTracker];

  [(HNDDisplayManager *)self _blockAllSystemGestures];
}

- (void)didDismissCalibrationUI
{
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_10001F7E0;
  v15[3] = &unk_1001AB1D0;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  id v3 = objc_retainBlock(v15);
  [(HNDDisplayManager *)self screenBounds];
  double v5 = v4;
  double v7 = v6;
  [(UIView *)self->_contentView bounds];
  if (v5 == v9 && v7 == v8)
  {
    ((void (*)(void *))v3[2])(v3);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001F8AC;
    v13[3] = &unk_1001AAA68;
    objc_copyWeak(&v14, &location);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001F8EC;
    v11[3] = &unk_1001AB1F8;
    double v12 = v3;
    +[UIView animateWithDuration:v13 animations:v11 completion:0.25];

    objc_destroyWeak(&v14);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (ASTUIGazePointDelegate)gazePointManager
{
  id v2 = [(HNDDisplayManager *)self handManager];
  id v3 = [v2 deviceManager];

  return (ASTUIGazePointDelegate *)v3;
}

- (void)didForceDismissForEmergencyTap
{
}

- (void)didZoomInto:(id)a3
{
  self->_isViewZoomed = 1;
  [(HNDDisplayManager *)self setZoomReplicatedView:a3];
}

- (void)didZoomOut
{
  self->_isViewZoomed = 0;
  [(HNDDisplayManager *)self setZoomReplicatedView:0];
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v28 = a3;
  if ([v28 count] == (id)1)
  {
    double v4 = [v28 objectAtIndexedSubscript:0];
    [v4 CGRectValue];
    self->_foreheadRect.origin.CGFloat x = v5;
    self->_foreheadRect.origin.CGFloat y = v6;
    self->_foreheadRect.size.double width = v7;
    self->_foreheadRect.size.double height = v8;
LABEL_5:

    goto LABEL_6;
  }
  if ([v28 count] == (id)2)
  {
    double v4 = [v28 objectAtIndexedSubscript:0];
    [v4 CGRectValue];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    id v17 = [v28 objectAtIndexedSubscript:1];
    [v17 CGRectValue];
    v32.origin.CGFloat x = v18;
    v32.origin.CGFloat y = v19;
    v32.size.double width = v20;
    v32.size.double height = v21;
    v30.origin.CGFloat x = v10;
    v30.origin.CGFloat y = v12;
    v30.size.double width = v14;
    v30.size.double height = v16;
    self->_foreheadRect = CGRectUnion(v30, v32);

    goto LABEL_5;
  }
LABEL_6:
  [(HNDRocker *)self->_rocker frame];
  v33.origin.CGFloat x = v22;
  v33.origin.CGFloat y = v23;
  v33.size.double width = v24;
  v33.size.double height = v25;
  CGRect v31 = CGRectIntersection(self->_foreheadRect, v33);
  if (!CGRectIsNull(v31) && AXDeviceHasJindo())
  {
    [(HNDRocker *)self->_rocker frame];
    double v27 = v26;
    [(HNDRocker *)self->_rocker frame];
    [(HNDDisplayManager *)self _validateNubbitPosition:0 forKeyboard:v27];
    -[HNDDisplayManager _moveNubbitToPosition:](self, "_moveNubbitToPosition:");
  }
}

- (CGRect)foreheadRect
{
  double x = self->_foreheadRect.origin.x;
  double y = self->_foreheadRect.origin.y;
  double width = self->_foreheadRect.size.width;
  double height = self->_foreheadRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)_testingRockerPosition
{
  [(HNDRocker *)self->_rocker frame];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)showingHoverOverMenu
{
  return self->_showingHoverOverMenu;
}

- (void)setShowingHoverOverMenu:(BOOL)a3
{
  self->_showingHoverOverMenu = a3;
}

- (HNDHandManager)handManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handManager);

  return (HNDHandManager *)WeakRetained;
}

- (void)setHandManager:(id)a3
{
}

- (AXPIFingerController)fingerController
{
  return self->_fingerController;
}

- (void)setFingerController:(id)a3
{
}

- (BOOL)isMainDisplay
{
  return self->_isMainDisplay;
}

- (void)setIsMainDisplay:(BOOL)a3
{
  self->_isMainDispladouble y = a3;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (BOOL)needsToShowZoomWindow
{
  return self->_needsToShowZoomWindow;
}

- (void)setNeedsToShowZoomWindow:(BOOL)a3
{
  self->_BOOL needsToShowZoomWindow = a3;
}

- (BOOL)alwaysShowMenu
{
  return self->_alwaysShowMenu;
}

- (void)setAlwaysShowMenu:(BOOL)a3
{
  self->_alwaysShowMenu = a3;
}

- (void)setBubbleCursorIsActive:(BOOL)a3
{
  self->_bubbleCursorIsActive = a3;
}

- (BOOL)playedHapticForCurrentEvent
{
  return self->_playedHapticForCurrentEvent;
}

- (void)setPlayedHapticForCurrentEvent:(BOOL)a3
{
  self->_playedHapticForCurrentEvent = a3;
}

- (AXUIClient)userInterfaceClient
{
  return self->_userInterfaceClient;
}

- (void)setUserInterfaceClient:(id)a3
{
}

- (double)lastMenuInteractionTime
{
  return self->_lastMenuInteractionTime;
}

- (void)setLastMenuInteractionTime:(double)a3
{
  self->_lastMenuInteractionTime = a3;
}

- (UIView)fingerContainerView
{
  return self->_fingerContainerView;
}

- (void)setFingerContainerView:(id)a3
{
}

- (AXDispatchTimer)presentHUDViewTimer
{
  return self->_presentHUDViewTimer;
}

- (void)setPresentHUDViewTimer:(id)a3
{
}

- (UIAccessibilityHUDView)hudView
{
  return self->_hudView;
}

- (void)setHudView:(id)a3
{
}

- (BOOL)shouldDelayBeforePresentingHUDView
{
  return self->_shouldDelayBeforePresentingHUDView;
}

- (void)setShouldDelayBeforePresentingHUDView:(BOOL)a3
{
  self->_shouldDelayBeforePresentingHUDView = a3;
}

- (HNDTrackpadViewController)trackpadVC
{
  return self->_trackpadVC;
}

- (void)setTrackpadVC:(id)a3
{
}

- (HNDTrackpadEventManager)trackpadManager
{
  return self->_trackpadManager;
}

- (void)setTrackpadManager:(id)a3
{
}

- (HNDZoomViewController)zoomViewController
{
  return self->_zoomViewController;
}

- (void)setZoomViewController:(id)a3
{
}

- (UIView)zoomReplicatedView
{
  return self->_zoomReplicatedView;
}

- (void)setZoomReplicatedView:(id)a3
{
}

- (NSString)reachabilityHandlerIdentifier
{
  return self->_reachabilityHandlerIdentifier;
}

- (void)setReachabilityHandlerIdentifier:(id)a3
{
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (NSMutableSet)userInterfaceClientEnablers
{
  return self->_userInterfaceClientEnablers;
}

- (void)setUserInterfaceClientEnablers:(id)a3
{
}

- (BOOL)assistiveTouchMousePointerTimeoutEnabled
{
  return self->_assistiveTouchMousePointerTimeoutEnabled;
}

- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3
{
  self->_assistiveTouchMousePointerTimeoutEnabled = a3;
}

- (double)assistiveTouchMousePointerTimeout
{
  return self->_assistiveTouchMousePointerTimeout;
}

- (void)setAssistiveTouchMousePointerTimeout:(double)a3
{
  self->_assistiveTouchMousePointerTimeout = a3;
}

- (double)assistiveTouchMouseDwellControlActivationTimeout
{
  return self->_assistiveTouchMouseDwellControlActivationTimeout;
}

- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3
{
  self->_assistiveTouchMouseDwellControlActivationTimeout = a3;
}

- (HNDBubbleCursorController)bubbleCursorController
{
  return self->_bubbleCursorController;
}

- (void)setBubbleCursorController:(id)a3
{
}

- (UIView)bubbleCursor
{
  return self->_bubbleCursor;
}

- (void)setBubbleCursor:(id)a3
{
}

- (HNDView)bubbleModeContentView
{
  return self->_bubbleModeContentView;
}

- (void)setBubbleModeContentView:(id)a3
{
}

- (id)dwellBubbleModeCompletionBlock
{
  return self->_dwellBubbleModeCompletionBlock;
}

- (void)setDwellBubbleModeCompletionBlock:(id)a3
{
}

- (AXAssertion)disableNotificationCenterAssertion
{
  return self->_disableNotificationCenterAssertion;
}

- (void)setDisableNotificationCenterAssertion:(id)a3
{
}

- (AXAssertion)disableControlCenterAssertion
{
  return self->_disableControlCenterAssertion;
}

- (void)setDisableControlCenterAssertion:(id)a3
{
}

- (AXAssertion)disableSystemGesturesAssertion
{
  return self->_disableSystemGesturesAssertion;
}

- (void)setDisableSystemGesturesAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_disableControlCenterAssertion, 0);
  objc_storeStrong((id *)&self->_disableNotificationCenterAssertion, 0);
  objc_storeStrong(&self->_dwellBubbleModeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_bubbleModeContentView, 0);
  objc_storeStrong((id *)&self->_bubbleCursor, 0);
  objc_storeStrong((id *)&self->_bubbleCursorController, 0);
  objc_storeStrong((id *)&self->_userInterfaceClientEnablers, 0);
  objc_storeStrong((id *)&self->_reachabilityHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_zoomReplicatedView, 0);
  objc_storeStrong((id *)&self->_zoomViewController, 0);
  objc_storeStrong((id *)&self->_trackpadManager, 0);
  objc_storeStrong((id *)&self->_trackpadVC, 0);
  objc_storeStrong((id *)&self->_hudView, 0);
  objc_storeStrong((id *)&self->_presentHUDViewTimer, 0);
  objc_storeStrong((id *)&self->_fingerContainerView, 0);
  objc_storeStrong((id *)&self->_userInterfaceClient, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerController, 0);
  objc_destroyWeak((id *)&self->_handManager);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_pendingForegroundImageAction, 0);
  objc_storeStrong((id *)&self->_doubleTapTimer, 0);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
  objc_storeStrong((id *)&self->_lastReachabilityPayload, 0);
  objc_storeStrong((id *)&self->_positionSetTimer, 0);
  objc_storeStrong((id *)&self->_downView, 0);
  objc_storeStrong((id *)&self->_multiTouchBackgound, 0);
  objc_storeStrong((id *)&self->_rockerDismiss, 0);
  objc_storeStrong((id *)&self->_bannerViewPresenter, 0);
  objc_storeStrong((id *)&self->_scannerFrontCursorView, 0);
  objc_storeStrong((id *)&self->_scannerBackCursorView, 0);
  objc_storeStrong((id *)&self->_scannerContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_fingerContentView, 0);
  objc_storeStrong((id *)&self->_rocker, 0);
  objc_storeStrong((id *)&self->_eyeTrackingCoordinator, 0);
  objc_storeStrong((id *)&self->_ignoredWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_autoHideFingersTimer, 0);
  objc_storeStrong((id *)&self->_longIdleTimer, 0);

  objc_storeStrong((id *)&self->_idleTimer, 0);
}

@end