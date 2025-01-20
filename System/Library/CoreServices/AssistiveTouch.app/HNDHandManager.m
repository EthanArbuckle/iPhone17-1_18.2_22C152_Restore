@interface HNDHandManager
+ (CGPoint)_pointByAvoidingDisplayCornerRadius:(double)a3 forPoint:(CGPoint)a4;
+ (double)_displayCornerRadius;
+ (id)_actionForHotCorner:(unint64_t)a3;
+ (id)sharedManager;
- (AXDispatchTimer)dwellBubbleModeTimer;
- (AXDragManager)dragManager;
- (AXElement)continuousScrollPickedElement;
- (AXElement)currentBubbleModeFocusedElement;
- (AXElement)eyeTrackingAutotHideLastBubbleModeElementShowed;
- (AXElement)lastBubbleModeDwellElement;
- (AXElement)lastBubbleModeFocusedElement;
- (AXElementFetcher)elementFetcher;
- (AXElementGroup)currentlySelectedKeyboardRow;
- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer;
- (BOOL)_elementFetchingRequired;
- (BOOL)_fadedFingersShouldShowOutlines;
- (BOOL)_isChildElement:(id)a3 desendantOfElement:(id)a4;
- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4;
- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4 activationFactor:(double)a5;
- (BOOL)_isPoint:(CGPoint)a3 withinTolerance:(double)a4 ofStartPoint:(CGPoint)a5;
- (BOOL)_isWaitingForFirstSystemPointerMovement;
- (BOOL)_isWithinLastDwellBounds:(CGPoint)a3;
- (BOOL)_iterateRemoteViewsAndPerformContinuousScrollWithSpeed:(double)a3 direction:(unint64_t)a4;
- (BOOL)_performAXScrollActionAtPoint:(CGPoint)a3 onDisplay:(id)a4 action:(int)a5;
- (BOOL)_requiresLargeSystemPointer;
- (BOOL)_scrollAncestorIsSelfForScrollView:(id)a3 scrollAction:(int)a4 resultScrollAncestor:(id *)a5;
- (BOOL)_shouldAutoFadeFingersOnDisplay:(id)a3;
- (BOOL)_shouldEnableMultiTouchToolBackground;
- (BOOL)_shouldHandleRealEventWithMultiTouchTool;
- (BOOL)_shouldLockIntoHotCornerAtNormalizedPoint:(CGPoint)a3 onDisplay:(id)a4;
- (BOOL)_shouldLockIntoNubbitAtPoint:(CGPoint)a3;
- (BOOL)_shouldRepeatGesture;
- (BOOL)_shouldUseTwoStageTyping;
- (BOOL)_startDwellTimerForBubbleMode;
- (BOOL)_startDwellTimerForPointer;
- (BOOL)alwaysShowMenu;
- (BOOL)assistiveTouchMouseDwellControlEnabled;
- (BOOL)bubbleModeAllowed;
- (BOOL)bubbleModeBlockedOnElementRefresh;
- (BOOL)bubbleModeCurrentlyFocusedOnNubbit;
- (BOOL)canShowASTMousePointer;
- (BOOL)currentlySnappedInBubbleMode;
- (BOOL)dwellControlAutorevertEnabled;
- (BOOL)dwellControlEnabled;
- (BOOL)dwellControlPaused;
- (BOOL)eyeTrackingAutoHideAllowed;
- (BOOL)eyeTrackingAutoHideEnabled;
- (BOOL)eyeTrackingAutoHideFinished;
- (BOOL)hidePointerForEyeTrackingAutoHide;
- (BOOL)hitTestsViewAtSystemPointerPoint;
- (BOOL)inBubbleMode;
- (BOOL)inContinuousScrollMode;
- (BOOL)inCustomGesture;
- (BOOL)inDragMode;
- (BOOL)inPinchMode;
- (BOOL)inRockerMode;
- (BOOL)isActivelyScrollingContinuously;
- (BOOL)isCapturingRealEvents;
- (BOOL)isCurrentlySelectingKeyboardKey;
- (BOOL)isDwellActionPendingButtonUp;
- (BOOL)isFingersPressedDown;
- (BOOL)isOnDeviceEyeTrackingEnabled;
- (BOOL)isPendingFingerLiftForPrimaryButtonPressUp;
- (BOOL)isPerformingDragPress;
- (BOOL)isPerformingGesture;
- (BOOL)isSimpleElementForBubbleMode:(id)a3;
- (BOOL)isSystemSleeping:(id)a3;
- (BOOL)isVoiceControlRunning;
- (BOOL)lastBubbleModeDwellWasOnNubbit;
- (BOOL)lastMoveWasMouse;
- (BOOL)mouseBehavesLikeFinger;
- (BOOL)nubbitMoving;
- (BOOL)nubbitVisible;
- (BOOL)openMenuWithSwaggle;
- (BOOL)scrollingBlockedOnElementRefresh;
- (BOOL)shouldHandleSystemPointerButtonEvent:(id)a3;
- (BOOL)shouldHideSystemPointerForFingersView;
- (BOOL)shouldIgnoreHIDDeviceMovementWhileMouseActive;
- (BOOL)shouldIgnorePointerEventWhileEyeTrackerConfigures:(id)a3;
- (BOOL)shouldIgnorePointerEventWhileEyeTrackerIsInactive;
- (BOOL)shouldIgnorePointerEventWhileEyeTrackerPressedButtonDownWithDwell;
- (BOOL)shouldUseBubbleMode;
- (BOOL)shouldUseEyeTrackingAutoHide;
- (BOOL)showFingerOutlines;
- (BOOL)showInnerCircle;
- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5;
- (BOOL)supportsActivateForBubbleModeElement:(id)a3;
- (BOOL)useSystemFilters;
- (BOOL)usingSpecialTool;
- (BOOL)voiceControl;
- (CGPoint)_fingerControllerPointForScreenPoint:(CGPoint)a3 onDisplay:(id)a4;
- (CGPoint)_pointForLockedCorner:(unint64_t)a3 onDisplay:(id)a4;
- (CGPoint)currentPointForPointer;
- (CGPoint)eyeTrackingAutotHideLastPointCursorShowed;
- (CGPoint)preferredMenuDisplayPointOnDisplay:(id)a3;
- (CGPoint)rotateEventFromOrientation:(CGPoint)a3;
- (CGPoint)rotateNormalizedPointToOrientation:(CGPoint)result;
- (CGPoint)startPointForDrag;
- (CGPoint)systemPointerLocation;
- (CGRect)_paddedHitboxForNubbitOnDisplay:(id)a3 activationFactor:(double)a4;
- (CGRect)clipRect:(CGRect)a3 toRotatedScreenBoundsOnDisplay:(id)a4;
- (CGSize)_hotCornerActivationSizeOnDisplay:(id)a3;
- (HNDContinuousScroller)activeContinuousScroller;
- (HNDDeviceManager)deviceManager;
- (HNDDisplayManager)currentDisplayManager;
- (HNDDisplayManager)mainDisplayManager;
- (HNDEventManager)eventManager;
- (HNDHandManager)init;
- (HNDRockerButton)bubbleModeFocusedRockerItem;
- (HNDRockerButton)lastBubbleModeDwellRockerItem;
- (HNDSystemPointerController)systemPointerController;
- (NSArray)customGestures;
- (NSArray)horizontalContinuousScrollers;
- (NSArray)verticalContinuousScrollers;
- (NSDate)previousPrimaryButtonPressDownDate;
- (NSMutableArray)displayManagers;
- (NSMutableDictionary)bubbleModeFrameToElementMapping;
- (NSNumber)currentContinuousScrollDirection;
- (NSPointerArray)eventHandlers;
- (OS_dispatch_queue)continuousScrollerGenerationQueue;
- (UIViewPropertyAnimator)eyeTrackingAutoHideCursorAnimator;
- (double)_defaultNubbitHitboxActivationFactor;
- (double)_fingerRadiusOnDisplay:(id)a3;
- (double)_scrollDeltaForGesture:(BOOL)a3 screenSize:(CGSize)a4;
- (double)continuousScrollCurrentSpeedFactor;
- (double)distanceBetweenRect:(CGRect)a3 andPoint:(CGPoint)a4;
- (double)eyeTrackingAutoHideTimeout;
- (double)fingerInnerCircleInnerRadius;
- (double)fingerInnerRadius;
- (double)fingerWidth;
- (double)innerCircleStrokeWidth;
- (double)pressedAlpha;
- (double)pressedScale;
- (double)screenFrame:;
- (double)strokeOutlineWidth;
- (double)strokeWidth;
- (double)touchSpeed;
- (double)touchSpeedMultiplier;
- (double)unpressedAlpha;
- (double)unpressedScale;
- (double)volumeLevel;
- (id)_avPlayerForSound:(id)a3;
- (id)_groupWithDictionary:(id)a3 currentPid:(int)a4;
- (id)_groupWithItems:(id)a3 groupTraits:(unint64_t)a4 scanningBehaviorTraits:(unint64_t)a5 label:(id)a6 identifier:(id)a7 currentPid:(int)a8;
- (id)_scrollFallbackGestureAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7;
- (id)_scrollViewForScrollAction:(int)a3 elementsToScroll:(id *)a4;
- (id)_shiftGestureIfNeeded:(id)a3 onDisplay:(id)a4 toMidpoint:(CGPoint)a5;
- (id)additionalAXNotificationsToObserve;
- (id)availableElements;
- (id)circularProgressFillColor;
- (id)currentFingerAppearance;
- (id)currentHardwareIdentifierForPointer;
- (id)deselectedFillColor;
- (id)deselectedStrokeColor;
- (id)displayManagerForDisplayId:(unsigned int)a3;
- (id)displayManagerForHardwareIdentifier:(id)a3;
- (id)fingerController;
- (id)keyboardRowContainingKeyboardKey:(id)a3;
- (id)mainWindow;
- (id)nearestElementFrameForPortraitPoint:(CGPoint)a3 distance:(double *)a4;
- (id)nearestRockerButtonForDisplayManger:(id)a3 orientedPoint:(CGPoint)a4 distance:(double *)a5;
- (id)pressedCircularProgressFillColor;
- (id)selectedFillColor;
- (id)selectedStrokeColor;
- (id)strokeOutlineColor;
- (id)viewAtSystemPointerPoint;
- (int)deviceOrientation;
- (os_unfair_lock_s)continuousScrollLock;
- (unint64_t)_cornerForNormalizedPoint:(CGPoint)a3 normalizedPadding:(CGSize)a4;
- (unint64_t)_defaultDwellMode;
- (unint64_t)_hotCornerForNormalizedPoint:(CGPoint)a3 onDisplay:(id)a4;
- (unint64_t)_roundedCornersForCursorAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (unint64_t)continuousScrollMode;
- (unint64_t)lastTimeElementFetcherRefreshed;
- (unint64_t)lastTimeEyeTrackerConfigured;
- (unint64_t)lastTimeHitTestedForBubbleMode;
- (unint64_t)lastTimeMouseMoved;
- (void)_attemptToShowVisualsAfterPerformingScreenshot;
- (void)_bootstrapRegister;
- (void)_dwellControlToggled;
- (void)_dwellTimerFired;
- (void)_fadeFingersAfterDelayIfNeeded;
- (void)_fadeFingersAfterDelayIfNeededOnDisplay:(id)a3;
- (void)_handleAction:(id)a3 type:(int)a4 state:(int)a5;
- (void)_handleBrokenHomeButtonMode;
- (void)_handleMultiTouchToolEvent:(id)a3;
- (void)_handlePinchFingerDownWithFinger:(id)a3 onDisplay:(id)a4;
- (void)_handleRealContinuousScrollToolUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealCustomGestureDown:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealCustomGestureMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealCustomGestureUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealDragToolMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealDragToolUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealMultiFingerDown:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealMultiFingerMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealMultiFingerUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealPinchToolDown:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealPinchToolMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealPinchToolUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleScreenshotDidFireCallbackTimeout;
- (void)_handleUsageConfirmation;
- (void)_hideCursorsForEyeTrackingAutoHide;
- (void)_highlightFingers;
- (void)_initializeDwell;
- (void)_liftFingersUpForPotentialTapViaPrimaryButton;
- (void)_lockIntoHotCornerForOrientedNormalizedPoint:(CGPoint)a3 onDisplay:(id)a4 cancelDwell:(BOOL)a5;
- (void)_menuOpenTracker:(CGPoint)a3;
- (void)_modifyPinchToolMoveToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_moveFingersForRealEventToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_moveFingersToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_moveSystemPointerIfActiveToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_performActionForHotCorner:(unint64_t)a3 onDisplay:(id)a4;
- (void)_performCustomGestureOnDisplay:(id)a3;
- (void)_performDwellActionOnDisplay:(id)a3;
- (void)_presentMigrationPopupIfNeeded;
- (void)_reallyLiftFingersUpForPotentialTapViaPrimaryButton;
- (void)_registerForSettingsNotifications;
- (void)_resetDwellDueToFingersReset;
- (void)_resetDwellModeToDefault;
- (void)_resetMenuOpenTracker;
- (void)_setApplicationAccessibilityEnabledIfNeeded;
- (void)_showCursorsForAutoHideWithDuration:(id)a3;
- (void)_showFingersIfNeededForMouseOnDisplay:(id)a3;
- (void)_startDwellTimer;
- (void)_startOrientationUpdateTimer;
- (void)_systemPointerSettingsDidChange;
- (void)_updateEyeTrackingAutoHideIfNecessary;
- (void)_updateFadedFingerOpacity;
- (void)_updateForElementFetchRequired;
- (void)_updateZoomWithDisplayPoint:(CGPoint)a3 onDisplay:(unsigned int)a4;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)activateCurrentBubbleModeFocusedElement;
- (void)addEventHandler:(id)a3;
- (void)beginContinuousScrollingInDirection:(unint64_t)a3 onDisplay:(id)a4;
- (void)beginDragAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)beginDragMenuAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)bubbleModeFailedToSnapOnDisplay:(id)a3;
- (void)cancelCurrentGesture;
- (void)cancelDwellTimer;
- (void)cancelDwellTimerForBubbleMode;
- (void)cancelDwellTimerForPointer;
- (void)cancelDwellTimerWithoutStateResetForBubbleMode;
- (void)cleanupPointerStreamIfNecessary;
- (void)dealloc;
- (void)didCompleteHIDDeviceConfiguration;
- (void)didFailToFloatApp;
- (void)didFailToPinApp;
- (void)disableElementFetcherIfNecessary;
- (void)enableBubbleMode:(BOOL)a3;
- (void)enableElementFetcherAndNotificationsIfNecessary;
- (void)enableEyeTrackingAutoHide:(BOOL)a3;
- (void)endContinuousScrollingOnDisplay:(id)a3 withCompletion:(BOOL)a4;
- (void)endDragModeAtPoint:(CGPoint)a3 onDisplay:(id)a4 completed:(BOOL)a5;
- (void)enumerateDisplayManagersWithBlock:(id)a3;
- (void)eyeTrackerIsActivelyTracking:(BOOL)a3;
- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5;
- (void)generateContinuousScrollersOnQueue:(id)a3 withCompletion:(id)a4;
- (void)generateContinuousScrollersWithCompletion:(id)a3;
- (void)generateMappingForElementFrames;
- (void)handleButtonEvent:(id)a3;
- (void)handleCustomHomeButtonAction:(int)a3;
- (void)handleLaserPrimaryButtonPress:(int)a3;
- (void)handleMultiTouchStandard:(int64_t)a3 onDisplay:(id)a4 withExistingFingerMidPoint:(CGPoint)a5;
- (void)handlePrimaryButtonPress:(int)a3;
- (void)handleRealEvent:(id)a3;
- (void)handleSecondaryButtonPress:(int)a3;
- (void)hideUIForEyeTracker;
- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4;
- (void)mediaControlsChanged:(BOOL)a3;
- (void)mediaPlaybackChanged;
- (void)menuExitedOnDisplay:(id)a3;
- (void)mouseEventRecordedWithDelta:(CGPoint)a3;
- (void)moveFingerByDelta:(CGPoint)a3;
- (void)moveFingerToPoint:(CGPoint)a3;
- (void)moveFingerToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5;
- (void)notifyUserEventOccurred;
- (void)orientationChanged;
- (void)orientationChanged:(int64_t)a3;
- (void)pauseBubbleModeForSpecialUsageTool;
- (void)pauseEyeTrackingAutoHideForSpecialUsageTool;
- (void)performButtonAction:(id)a3 type:(int)a4 state:(int)a5;
- (void)performFingerDownAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)performFingerMoveToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)performFingerUpAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)performPreparedGestureOnDisplay:(id)a3;
- (void)pointerController:(id)a3 didReceivePointerEvent:(id)a4;
- (void)prepareForContinuousScrollOnDisplay:(id)a3;
- (void)prepareForEyeTrackerConnected:(BOOL)a3;
- (void)prepareForHIDDeviceConfiguration;
- (void)prepareGesture:(id)a3 onDisplay:(id)a4;
- (void)prepareScrollAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7;
- (void)processOrientedPointForContinuousScrolling:(CGPoint)a3 onDisplay:(id)a4;
- (void)processPortraitUpPointForBubbleMode:(CGPoint)a3 onDisplay:(id)a4;
- (void)refreshElementFetcherWithScrollingBlocked:(BOOL)a3;
- (void)refreshOrientation;
- (void)reloadFingerAppearance;
- (void)removeEventHandler:(id)a3;
- (void)removeFingersToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)resetFingersIfActiveOnDisplay:(id)a3;
- (void)resetFingersIfNeeded;
- (void)resetFingersIfNeededOnDisplay:(id)a3;
- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4 active:(BOOL)a5;
- (void)resetNubbitLocation;
- (void)resetPinchFingersOnDisplay:(id)a3;
- (void)restartEverything;
- (void)resumeBubbleModeForSpecialUsageToolIfNecessary;
- (void)resumeEyeTrackingAutoHideForSpecialUsageToolIfNecessary;
- (void)ringerSwitchChanged;
- (void)rotateEventToOrientation:(id)a3;
- (void)rotationLockChanged;
- (void)sceneDidConnect:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)screenshotDidFire;
- (void)screenshotWillFire;
- (void)setActiveContinuousScroller:(id)a3;
- (void)setAlwaysShowMenu:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3;
- (void)setBubbleModeBlockedOnElementRefresh:(BOOL)a3;
- (void)setBubbleModeCurrentlyFocusedOnNubbit:(BOOL)a3;
- (void)setBubbleModeFocusedRockerItem:(id)a3;
- (void)setBubbleModeFrameToElementMapping:(id)a3;
- (void)setCaptureEvents:(BOOL)a3;
- (void)setContinuousScrollCurrentSpeedFactor:(double)a3;
- (void)setContinuousScrollLock:(os_unfair_lock_s)a3;
- (void)setContinuousScrollMode:(unint64_t)a3;
- (void)setContinuousScrollPickedElement:(id)a3;
- (void)setContinuousScrollerGenerationQueue:(id)a3;
- (void)setCurrentBubbleModeFocusedElement:(id)a3;
- (void)setCurrentContinuousScrollDirection:(id)a3;
- (void)setCurrentlySelectedKeyboardRow:(id)a3;
- (void)setCurrentlySelectingKeyboardKey:(BOOL)a3;
- (void)setCustomGestures:(id)a3;
- (void)setDisplayManagers:(id)a3;
- (void)setDragManager:(id)a3;
- (void)setDwellBubbleModeTimer:(id)a3;
- (void)setDwellControlAutorevertEnabled:(BOOL)a3;
- (void)setDwellControlPaused:(BOOL)a3;
- (void)setDwellMode:(unint64_t)a3;
- (void)setElementFetcher:(id)a3;
- (void)setEventHandlers:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setEyeTrackingAutoHideCursorAnimator:(id)a3;
- (void)setEyeTrackingAutoHideEnabled:(BOOL)a3;
- (void)setEyeTrackingAutoHideFinished:(BOOL)a3;
- (void)setEyeTrackingAutoHideTimeout:(double)a3;
- (void)setEyeTrackingAutotHideLastBubbleModeElementShowed:(id)a3;
- (void)setEyeTrackingAutotHideLastPointCursorShowed:(CGPoint)a3;
- (void)setHidePointerForEyeTrackingAutoHide:(BOOL)a3;
- (void)setHorizontalContinuousScrollers:(id)a3;
- (void)setInBubbleMode:(BOOL)a3;
- (void)setIsActivelyScrollingContinuously:(BOOL)a3;
- (void)setIsDwellActionPendingButtonUp:(BOOL)a3;
- (void)setIsOnDeviceEyeTrackingEnabled:(BOOL)a3;
- (void)setIsPendingFingerLiftForPrimaryButtonPressUp:(BOOL)a3;
- (void)setLastBubbleModeDwellElement:(id)a3;
- (void)setLastBubbleModeDwellRockerItem:(id)a3;
- (void)setLastBubbleModeDwellWasOnNubbit:(BOOL)a3;
- (void)setLastBubbleModeFocusedElement:(id)a3;
- (void)setLastMoveWasMouse:(BOOL)a3;
- (void)setLastTimeElementFetcherRefreshed:(unint64_t)a3;
- (void)setLastTimeEyeTrackerConfigured:(unint64_t)a3;
- (void)setLastTimeHitTestedForBubbleMode:(unint64_t)a3;
- (void)setLastTimeMouseMoved:(unint64_t)a3;
- (void)setMouseBehavesLikeFinger:(BOOL)a3;
- (void)setNubbitMoving:(BOOL)a3;
- (void)setOpenMenuWithSwaggle:(BOOL)a3;
- (void)setPreviousPrimaryButtonPressDownDate:(id)a3;
- (void)setScrollingBlockedOnElementRefresh:(BOOL)a3;
- (void)setTouchSpeed:(double)a3;
- (void)setUpdateElementVisualsCoalescer:(id)a3;
- (void)setVerticalContinuousScrollers:(id)a3;
- (void)setVoiceControl:(BOOL)a3;
- (void)setupNonSceneUI:(BOOL)a3;
- (void)setupWindow:(id)a3 ignoredWindow:(id)a4;
- (void)showMenu:(BOOL)a3 onDisplay:(id)a4;
- (void)showUIForEyeTracker;
- (void)specialToolUsageEnded:(BOOL)a3;
- (void)startDragModeOnDisplay:(id)a3;
- (void)startPinchModeWithPoint:(CGPoint)a3 onDisplay:(id)a4 mode:(unint64_t)a5;
- (void)substantialTransitionOccurred;
- (void)systemServerConnected;
- (void)systemServerDied;
- (void)updateAllSettings;
- (void)updateAssistiveTouchEyeTrackingAutoHideEnabled;
- (void)updateAssistiveTouchEyeTrackingAutoHideOpacity;
- (void)updateAssistiveTouchEyeTrackingAutoHideTimeout;
- (void)updateMenuVisibility;
- (void)updatePointerAppearance;
- (void)updateSoftwareKeyboardState;
- (void)volumeChanged;
@end

@implementation HNDHandManager

+ (id)sharedManager
{
  if (qword_1001F0980 != -1) {
    dispatch_once(&qword_1001F0980, &stru_1001AB218);
  }
  v2 = (void *)qword_1001F0978;

  return v2;
}

- (HNDHandManager)init
{
  v60.receiver = self;
  v60.super_class = (Class)HNDHandManager;
  v2 = [(HNDHandManager *)&v60 init];
  HeadTrackerAvailabilityDetail.rawValue.getter();
  v3 = objc_alloc_init(HNDEventManager);
  v4 = (void *)*((void *)v2 + 49);
  *((void *)v2 + 49) = v3;

  v5 = objc_alloc_init(HNDDeviceManager);
  v6 = (void *)*((void *)v2 + 50);
  *((void *)v2 + 50) = v5;

  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = (void *)*((void *)v2 + 51);
  *((void *)v2 + 51) = v7;

  [*((id *)v2 + 49) setDelegate:v2];
  [*((id *)v2 + 50) setHandManager:v2];
  uint64_t v9 = objc_opt_new();
  v10 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v9;

  [*((id *)v2 + 11) setDelegate:v2];
  v11 = objc_alloc_init(HNDMousePointerAppearance);
  v12 = (void *)*((void *)v2 + 12);
  *((void *)v2 + 12) = v11;

  v13 = objc_alloc_init(HNDDwellPointerAppearance);
  v14 = (void *)*((void *)v2 + 13);
  *((void *)v2 + 13) = v13;

  v15 = objc_alloc_init(HNDSystemPointerController);
  v16 = (void *)*((void *)v2 + 55);
  *((void *)v2 + 55) = v15;

  [*((id *)v2 + 55) addPointerStreamObserver:v2];
  uint64_t v17 = objc_opt_new();
  v18 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v17;

  uint64_t v19 = objc_opt_new();
  v20 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v19;

  v21 = objc_alloc_init(HNDBubblePointerAppearance);
  v22 = (void *)*((void *)v2 + 17);
  *((void *)v2 + 17) = v21;

  id v23 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  v24 = (void *)*((void *)v2 + 16);
  *((void *)v2 + 16) = v23;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)sub_100022F84, kAXSPointerIncreasedContrastPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v26 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v26, v2, (CFNotificationCallback)sub_100022F84, kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v27 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v27, v2, (CFNotificationCallback)sub_100022F84, kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [v2 _bootstrapRegister];
  id v28 = objc_alloc((Class)AXDragManager);
  id v29 = [v28 initWithMachServiceName:AXDragServiceNameSwitchControl];
  [v2 setDragManager:v29];

  *(_OWORD *)(v2 + 232) = HNDPointNull;
  id v30 = +[AXSiriShortcutsManager sharedManager];
  *((_DWORD *)v2 + 2) = [v2 deviceOrientation];
  objc_initWeak(&location, v2);
  v54 = _NSConcreteStackBlock;
  uint64_t v55 = 3221225472;
  v56 = sub_100022F8C;
  v57 = &unk_1001AAA90;
  v58 = v2;
  AXPerformBlockOnMainThreadAfterDelay();
  [v58 _registerForSettingsNotifications];
  v31 = +[AXPISystemActionHelper sharedInstance];
  [v31 warm];

  BKSHIDServicesCancelTouchesOnMainDisplay();
  [v58 _handleUsageConfirmation];
  v32 = +[AXSettings sharedInstance];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100022F94;
  v52[3] = &unk_1001AAA90;
  v33 = v58;
  v53 = v33;
  id v34 = objc_loadWeakRetained(&location);
  [v32 registerUpdateBlock:v52 forRetrieveSelector:"assistiveTouchIdleOpacity" withListener:v34];

  id v35 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  id v36 = v33[22];
  v33[22] = v35;

  [v33 _initializeDwell];
  [v33 _presentMigrationPopupIfNeeded];
  v37 = +[AXSettings sharedInstance];
  *((unsigned char *)v33 + 366) = [v37 assistiveTouchMouseBehavesLikeFinger];

  v38 = +[AXSettings sharedInstance];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100022F9C;
  v50[3] = &unk_1001AAA68;
  objc_copyWeak(&v51, &location);
  [v38 registerUpdateBlock:v50 forRetrieveSelector:"assistiveTouchMouseBehavesLikeFinger" withListener:v33];

  objc_destroyWeak(&v51);
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    v39 = +[AXSettings sharedInstance];
    *((unsigned char *)v33 + 377) = [v39 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

    v40 = +[AXSettings sharedInstance];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10002302C;
    v48[3] = &unk_1001AAA68;
    objc_copyWeak(&v49, &location);
    [v40 registerUpdateBlock:v48 forRetrieveSelector:"assistiveTouchMouseOnDeviceEyeTrackingEnabled" withListener:v33];

    objc_destroyWeak(&v49);
  }
  [v33 _setApplicationAccessibilityEnabledIfNeeded];
  id v41 = objc_alloc((Class)AXElementFetcher);
  id v42 = [v41 initWithDelegate:v33 fetchEvents:AXFetchEventAllEvents enableEventManagement:0 enableGrouping:0 shouldIncludeNonScannerElements:0 beginEnabled:0];
  objc_storeStrong(v33 + 66, v42);
  [v33[66] setElementGroupingHeuristics:sub_100041150() ^ 1];
  [v33[66] registerFetchObserver:v33 targetQueue:&_dispatch_main_q];

  +[AXUIElement applyElementAttributeCacheScheme:3];
  id v43 = v33[52];
  v33[52] = &__NSArray0__struct;

  id v44 = v33[53];
  v33[53] = &__NSArray0__struct;

  id v45 = +[SCATAssistiveTouchServerInstance serverInstance];
  v46 = v33;

  objc_destroyWeak(&location);
  return v46;
}

- (void)_updateForElementFetchRequired
{
  if ([(HNDHandManager *)self _elementFetchingRequired])
  {
    [(HNDHandManager *)self enableElementFetcherAndNotificationsIfNecessary];
  }
  else
  {
    [(HNDHandManager *)self disableElementFetcherIfNecessary];
  }
}

- (BOOL)_elementFetchingRequired
{
  return _AXSAssistiveTouchEnabled() != 0;
}

- (void)dealloc
{
  [(HNDHandManager *)self cleanupPointerStreamIfNecessary];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v4 = [(HNDHandManager *)self elementFetcher];
  [v4 disableEventManagement];

  v5 = [(HNDHandManager *)self elementFetcher];
  [v5 unregisterFetchObserver:self];

  v6 = +[HNDAccessibilityManager sharedManager];
  [v6 removeObserver:self];

  id v7 = +[HNDAccessibilityManager sharedManager];
  v8 = [(HNDHandManager *)self additionalAXNotificationsToObserve];
  [v7 stopObservingAXNotifications:v8];

  [(HNDHandManager *)self setContinuousScrollerGenerationQueue:0];
  v9.receiver = self;
  v9.super_class = (Class)HNDHandManager;
  [(HNDHandManager *)&v9 dealloc];
}

- (void)_bootstrapRegister
{
  mach_port_t special_port = 0;
  if (!task_get_special_port(mach_task_self_, 4, &special_port))
  {
    int v2 = bootstrap_check_in2();
    if (v2)
    {
      int v3 = v2;
      v4 = ASTLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100113D00(v3, v4);
      }
    }
  }
}

- (void)setAlwaysShowMenu:(BOOL)a3
{
  if (self->_alwaysShowMenu != a3)
  {
    self->_alwaysShowMenu = a3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002332C;
    v4[3] = &unk_1001AB238;
    BOOL v5 = a3;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
    [(HNDHandManager *)self refreshOrientation];
  }
}

- (void)_handleBrokenHomeButtonMode
{
  int v3 = _AXSAssistiveTouchRepairIncarnationModeEnabled();
  self->_inBrokenHomeButtonMode = v3 != 0;
  if (v3)
  {
    v4 = +[HNDDefaults sharedDefaults];
    BOOL v5 = [v4 preferenceForKey:@"DidShowBrokenHomeButtonAlert"];
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      id v7 = +[AXSubsystemBrokenHomeButton sharedInstance];
      unsigned __int8 v8 = [v7 ignoreLogging];

      if ((v8 & 1) == 0)
      {
        objc_super v9 = +[AXSubsystemBrokenHomeButton identifier];
        v10 = AXLoggerForFacility();

        os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v10, v11))
        {
          v12 = AXColorizeFormatLog();
          v13 = _AXStringForArgs();
          if (os_log_type_enabled(v10, v11))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v13;
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "%{public}@", buf, 0xCu);
          }
        }
      }
      v14 = +[HNDDefaults sharedDefaults];
      [v14 setPreference:&__kCFBooleanTrue forKey:@"DidShowBrokenHomeButtonAlert"];

      v15 = +[AXSpringBoardServer server];
      [v15 showAlert:8 withHandler:&stru_1001AB278];
    }
    v16 = +[AXSubsystemBrokenHomeButton sharedInstance];
    unsigned __int8 v17 = [v16 ignoreLogging];

    if ((v17 & 1) == 0)
    {
      v18 = +[AXSubsystemBrokenHomeButton identifier];
      uint64_t v19 = AXLoggerForFacility();

      os_log_type_t v20 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = AXColorizeFormatLog();
        v22 = _AXStringForArgs();
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138543362;
          id v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "%{public}@", buf, 0xCu);
        }
      }
    }
    uint64_t v26 = AXAssistiveTouchIconLocationMidMiddle;
    uint64_t v27 = AXAssistiveTouchIconTypeHome;
    id v23 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v24 = +[AXSettings sharedInstance];
    [v24 setAssistiveTouchMainScreenCustomization:v23];

    v25 = [(HNDHandManager *)self mainDisplayManager];
    [v25 placeNubbitAtBottomCenter];
  }
}

- (void)_handleUsageConfirmation
{
  if (_AXSAssistiveTouchScannerEnabled())
  {
    int v2 = +[AXSettings sharedInstance];
    unsigned __int8 v3 = [v2 assistiveTouchSwitchUsageConfirmed];

    if ((v3 & 1) == 0)
    {
      id v4 = +[AXSpringBoardServer server];
      [v4 showAlert:4 withHandler:&stru_1001AB298];
    }
  }
}

- (void)_registerForSettingsNotifications
{
  objc_initWeak(&location, self);
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = +[AXSettings sharedInstance];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100023F80;
  v49[3] = &unk_1001AAA40;
  objc_copyWeak(&v51, &location);
  id v5 = v3;
  id v50 = v5;
  [v4 registerUpdateBlock:v49 forRetrieveSelector:"assistiveTouchOpenMenuSwaggleEnabled" withListener:self];

  objc_destroyWeak(&v51);
  unsigned __int8 v6 = +[AXSettings sharedInstance];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100023FDC;
  v46[3] = &unk_1001AAA40;
  objc_copyWeak(&v48, &location);
  id v7 = v5;
  id v47 = v7;
  [v6 registerUpdateBlock:v46 forRetrieveSelector:"assistiveTouchSpeed" withListener:self];

  objc_destroyWeak(&v48);
  unsigned __int8 v8 = +[AXSettings sharedInstance];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100024040;
  v43[3] = &unk_1001AAA40;
  objc_copyWeak(&v45, &location);
  id v9 = v7;
  id v44 = v9;
  [v8 registerUpdateBlock:v43 forRetrieveSelector:"assistiveTouchCustomGestures" withListener:self];

  objc_destroyWeak(&v45);
  v10 = +[AXSettings sharedInstance];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000240A4;
  v41[3] = &unk_1001AAA68;
  objc_copyWeak(&v42, &location);
  [v10 registerUpdateBlock:v41 forRetrieveSelector:"assistiveTouchAlwaysShowMenuEnabled" withListener:self];

  objc_destroyWeak(&v42);
  os_log_type_t v11 = +[AXSettings sharedInstance];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000240E4;
  v39[3] = &unk_1001AAA68;
  objc_copyWeak(&v40, &location);
  [v11 registerUpdateBlock:v39 forRetrieveSelector:"assistiveTouchMousePointerColor" withListener:self];

  objc_destroyWeak(&v40);
  v12 = +[AXSettings sharedInstance];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100024124;
  v37[3] = &unk_1001AAA68;
  objc_copyWeak(&v38, &location);
  [v12 registerUpdateBlock:v37 forRetrieveSelector:"assistiveTouchMousePointerSizeMultiplier" withListener:self];

  objc_destroyWeak(&v38);
  v13 = +[AXSettings sharedInstance];
  -[HNDHandManager setAssistiveTouchMouseDwellControlEnabled:](self, "setAssistiveTouchMouseDwellControlEnabled:", [v13 assistiveTouchMouseDwellControlEnabled]);

  v14 = +[AXSettings sharedInstance];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100024164;
  v35[3] = &unk_1001AAA68;
  objc_copyWeak(&v36, &location);
  [v14 registerUpdateBlock:v35 forRetrieveSelector:"assistiveTouchMouseDwellControlEnabled" withListener:self];

  objc_destroyWeak(&v36);
  v15 = +[AXSettings sharedInstance];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000241A4;
  v33[3] = &unk_1001AAA68;
  objc_copyWeak(&v34, &location);
  [v15 registerUpdateBlock:v33 forRetrieveSelector:"assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled" withListener:self];

  objc_destroyWeak(&v34);
  v16 = +[AXSettings sharedInstance];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000241E4;
  v30[3] = &unk_1001AAA40;
  objc_copyWeak(&v32, &location);
  id v17 = v9;
  id v31 = v17;
  [v16 registerUpdateBlock:v30 forRetrieveSelector:"assistiveTouchBubbleModeEnabled" withListener:self];

  objc_destroyWeak(&v32);
  [(HNDHandManager *)self updateAssistiveTouchEyeTrackingAutoHideEnabled];
  v18 = +[AXSettings sharedInstance];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100024240;
  v28[3] = &unk_1001AAA68;
  objc_copyWeak(&v29, &location);
  [v18 registerUpdateBlock:v28 forRetrieveSelector:"assistiveTouchEyeTrackingAutoHideEnabled" withListener:self];

  objc_destroyWeak(&v29);
  [(HNDHandManager *)self updateAssistiveTouchEyeTrackingAutoHideTimeout];
  uint64_t v19 = +[AXSettings sharedInstance];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100024280;
  v26[3] = &unk_1001AAA68;
  objc_copyWeak(&v27, &location);
  [v19 registerUpdateBlock:v26 forRetrieveSelector:"assistiveTouchEyeTrackingAutoHideTimeout" withListener:self];

  objc_destroyWeak(&v27);
  os_log_type_t v20 = +[AXSettings sharedInstance];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000242C0;
  v24[3] = &unk_1001AAA68;
  objc_copyWeak(&v25, &location);
  [v20 registerUpdateBlock:v24 forRetrieveSelector:"assistiveTouchEyeTrackingAutoHideOpacity" withListener:self];

  objc_destroyWeak(&v25);
  v21 = +[AXSettings sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100024300;
  v22[3] = &unk_1001AAA68;
  objc_copyWeak(&v23, &location);
  [v21 registerUpdateBlock:v22 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:self];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)updateAssistiveTouchEyeTrackingAutoHideEnabled
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  -[HNDHandManager enableEyeTrackingAutoHide:](self, "enableEyeTrackingAutoHide:", [v3 assistiveTouchEyeTrackingAutoHideEnabled]);

  [(HNDHandManager *)self updateAssistiveTouchEyeTrackingAutoHideOpacity];
}

- (void)updateAssistiveTouchEyeTrackingAutoHideTimeout
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchEyeTrackingAutoHideTimeout];
  [(HNDHandManager *)self setEyeTrackingAutoHideTimeout:"setEyeTrackingAutoHideTimeout:"];
}

- (void)updateAssistiveTouchEyeTrackingAutoHideOpacity
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100024464;
  v2[3] = &unk_1001AAC50;
  v2[4] = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v2];
}

- (int)deviceOrientation
{
  if (AXInPreboardScenario()) {
    return 1;
  }
  id v3 = +[AXSystemAppServer server];
  int v2 = [v3 activeInterfaceOrientation];

  return v2;
}

- (void)refreshOrientation
{
  self->_int orientation = [(HNDHandManager *)self deviceOrientation];
  id v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int orientation = self->_orientation;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = orientation;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AST Windows: handManager orientation: %d", (uint8_t *)&buf, 8u);
  }

  id v5 = [(HNDHandManager *)self mainDisplayManager];
  [v5 setOrientation:self->_orientation withCompletion:0];

  unsigned __int8 v6 = [(HNDHandManager *)self mainDisplayManager];
  BOOL v7 = [v6 orientation] == 0;

  if (v7)
  {
    ++qword_1001F0988;
    unsigned __int8 v8 = ASTLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100113D78();
    }

    objc_initWeak(&buf, self);
    objc_copyWeak(&v9, &buf);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v9);
    objc_destroyWeak(&buf);
  }
  else
  {
    qword_1001F0988 = 0;
  }
}

- (void)setupNonSceneUI:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[HNDApplication usesScenes]) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    v15 = objc_alloc_init(HNDDisplayManager);
    [(NSMutableArray *)self->_displayManagers addObject:v15];
    [(HNDDisplayManager *)v15 setAlwaysShowMenu:[(HNDHandManager *)self alwaysShowMenu]];
    [(HNDDisplayManager *)v15 setHandManager:self];
    [(HNDDisplayManager *)v15 setIsMainDisplay:1];
    [(HNDDisplayManager *)v15 setOrientation:self->_orientation withCompletion:0];
    unsigned __int8 v6 = [(HNDDisplayManager *)v15 fingerController];
    [v6 setAppearanceDelegate:self];

    [(HNDDisplayManager *)v15 updateAutoHideMousePointer];
    [(HNDDisplayManager *)v15 initializeDisplay];
    BOOL v7 = [(HNDDisplayManager *)v15 window];
    unsigned int v8 = [v7 _contextId];

    if (v8)
    {
      systemPointerController = self->_systemPointerController;
      v10 = [(HNDDisplayManager *)v15 window];
      os_log_type_t v11 = [v10 screen];
      v12 = [v11 displayIdentity];
      id v13 = [v12 displayID];
      v14 = [(HNDDisplayManager *)v15 window];
      -[HNDSystemPointerController requestGlobalMouseEventsForDisplay:displayID:targetContextID:](systemPointerController, "requestGlobalMouseEventsForDisplay:displayID:targetContextID:", 0, v13, [v14 _contextId]);
    }
    [(HNDHandManager *)self restartEverything];
  }
}

- (void)systemServerConnected
{
}

- (void)restartEverything
{
  BOOL v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AST Windows: Server connected callback", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024A14;
  v4[3] = &unk_1001AAC50;
  void v4[4] = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  [(HNDHandManager *)self _handleBrokenHomeButtonMode];
}

- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  id v9 = [(HNDHandManager *)self mainDisplayManager];
  objc_msgSend(v9, "keyboardVisible:withFrame:", v8, x, y, width, height);
}

- (void)pointerController:(id)a3 didReceivePointerEvent:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformBlockOnMainThread();
}

- (void)cleanupPointerStreamIfNecessary
{
  if (sub_100041014())
  {
    systemPointerController = self->_systemPointerController;
    [(HNDSystemPointerController *)systemPointerController removePointerStreamObserver:self];
  }
}

- (BOOL)shouldHideSystemPointerForFingersView
{
  if ([(HNDHandManager *)self inBubbleMode]) {
    unsigned int v3 = [(HNDHandManager *)self currentlySnappedInBubbleMode];
  }
  else {
    unsigned int v3 = 0;
  }
  if ([(HNDHandManager *)self shouldUseEyeTrackingAutoHide]) {
    unsigned int v4 = [(HNDHandManager *)self eyeTrackingAutoHideEnabled];
  }
  else {
    unsigned int v4 = 0;
  }
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  unsigned __int8 v15 = 0;
  if ([(HNDHandManager *)self usingSpecialTool]
    || [(HNDHandManager *)self inCustomGesture]
    || [(HNDHandManager *)self dwellControlEnabled]
    || (([(HNDHandManager *)self canShowASTMousePointer] | v3) & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    BOOL v8 = [(HNDHandManager *)self deviceManager];
    if ([v8 hidDeviceIsConfiguring])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      id v9 = [(HNDHandManager *)self deviceManager];
      if (([v9 hidDeviceSentReservedStatus] | v4))
      {
        unsigned __int8 v5 = 1;
      }
      else
      {
        v10 = [(HNDHandManager *)self mainDisplayManager];
        unsigned __int8 v5 = [v10 isShowingCalibrationUI];
      }
    }
  }
  unsigned __int8 v15 = v5;
  if (*((unsigned char *)v13 + 24))
  {
    BOOL v6 = 1;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000252F0;
    v11[3] = &unk_1001AB2E0;
    v11[4] = &v12;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v11];
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);
  return v6;
}

- (BOOL)shouldHandleSystemPointerButtonEvent:(id)a3
{
  id v4 = a3;
  if (!_AXSAssistiveTouchEnabled()
    || [v4 type] != 1 && objc_msgSend(v4, "type") != 2)
  {
    LOBYTE(v11) = 0;
    goto LABEL_16;
  }
  unsigned __int8 v5 = [v4 actionOverride];
  if (![v5 length])
  {

    goto LABEL_10;
  }
  BOOL v6 = [v4 actionOverride];
  unsigned __int8 v7 = [v6 isEqualToString:@"__NONE__"];

  if (v7) {
    goto LABEL_10;
  }
  BOOL v8 = [v4 actionOverride];
  [v4 buttonNumber];
  id v9 = AXAssistiveTouchDefaultLaserIconTypeForMouseButton();
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
LABEL_10:
    if ([(HNDHandManager *)self mouseBehavesLikeFinger]
      && ([v4 buttonNumber],
          AXAssistiveTouchDefaultLaserIconTypeForMouseButton(),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 isEqualToString:AXAssistiveTouchIconTypeMousePrimaryClick],
          v12,
          v13))
    {
      uint64_t v14 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
      unsigned __int8 v15 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v14];

      unsigned int v11 = [v15 isMainDisplay];
    }
    else
    {
      unsigned int v11 = 0;
    }
    goto LABEL_14;
  }
  unsigned int v11 = 1;
LABEL_14:
  if ([(HNDHandManager *)self inBubbleMode]) {
    v11 |= [(HNDHandManager *)self currentlySnappedInBubbleMode];
  }
LABEL_16:

  return v11;
}

- (BOOL)hitTestsViewAtSystemPointerPoint
{
  int v2 = [(HNDHandManager *)self viewAtSystemPointerPoint];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)viewAtSystemPointerPoint
{
  BOOL v3 = [(HNDSystemPointerController *)self->_systemPointerController currentSystemPointerHardwareIdentifier];
  id v4 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v3];
  [(HNDSystemPointerController *)self->_systemPointerController currentAbsoluteSystemPointerPoint];
  unsigned __int8 v5 = objc_msgSend(v4, "viewAtDisplayPoint:");

  return v5;
}

- (void)_systemPointerSettingsDidChange
{
  if ([(HNDHandManager *)self shouldUseBubbleMode]
    || [(HNDHandManager *)self shouldUseEyeTrackingAutoHide])
  {
    if ([(HNDHandManager *)self shouldHideSystemPointerForFingersView])
    {
      BOOL v3 = [(HNDHandManager *)self systemPointerController];
      [v3 hideSystemPointer:0];

      id v4 = [(HNDHandManager *)self systemPointerController];
      [v4 hideSystemPointer:1];
    }
  }
  objc_initWeak(&location, self);
  [(AXDispatchTimer *)self->_systemPointerSettingsChangedDebouncer cancel];
  systemPointerSettingsChangedDebouncer = self->_systemPointerSettingsChangedDebouncer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000256F8;
  v6[3] = &unk_1001AAA68;
  objc_copyWeak(&v7, &location);
  [(AXDispatchTimer *)systemPointerSettingsChangedDebouncer afterDelay:v6 processBlock:0.1];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_moveSystemPointerIfActiveToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (sub_100041014())
  {
    uint64_t v7 = [(HNDHandManager *)self systemPointerController];
    if (v7)
    {
      BOOL v8 = (void *)v7;
      id v9 = [(HNDHandManager *)self deviceManager];
      unsigned int v10 = [v9 mainDeviceIsPointer];

      if (v10)
      {
        unsigned int v11 = [(HNDHandManager *)self systemPointerController];
        [v11 currentSystemPointerPoint];
        double v13 = v12;
        double v15 = v14;

        +[HNDVirtualHIDMouse handleMovementWithDelta:](HNDVirtualHIDMouse, "handleMovementWithDelta:", x - v13, y - v15);
      }
    }
  }
}

- (CGPoint)systemPointerLocation
{
  if ([(HNDHandManager *)self mouseBehavesLikeFinger])
  {
    BOOL v3 = [(HNDHandManager *)self currentDisplayManager];
    id v4 = [v3 fingerController];
    unsigned __int8 v5 = [v4 fingerModels];
    BOOL v6 = [v5 firstObject];
    [v6 location];
    CGFloat x = v7;
    CGFloat y = v9;
  }
  else
  {
    unsigned int v11 = [(HNDHandManager *)self systemPointerController];

    if (!v11)
    {
      CGFloat x = CGPointZero.x;
      CGFloat y = CGPointZero.y;
      goto LABEL_7;
    }
    BOOL v3 = [(HNDHandManager *)self systemPointerController];
    [v3 currentSystemPointerPoint];
    CGFloat x = v12;
    CGFloat y = v13;
  }

LABEL_7:
  double v14 = x;
  double v15 = y;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (void)_moveFingersToPoint:(CGPoint)a3 onDisplay:(id)a4
{
}

- (void)_moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  double v14 = (void (**)(id, uint64_t))a7;
  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100025A14;
    v15[3] = &unk_1001AB308;
    v15[4] = self;
    double v17 = x;
    double v18 = y;
    id v16 = v13;
    BOOL v19 = v9;
    +[UIView animateWithDuration:v15 animations:v14 completion:0.15];
  }
  else
  {
    -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v13, v9, x, y);
    if (v14) {
      v14[2](v14, 1);
    }
  }
}

- (void)moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  unsigned int v10 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v9];
  unsigned int v11 = [v10 fingerController];

  if ([v11 numberOfFingers])
  {
    if (self->_hotCornerLocked) {
      unint64_t v12 = -[HNDHandManager _roundedCornersForCursorAtPoint:onDisplay:](self, "_roundedCornersForCursorAtPoint:onDisplay:", v9, x, y);
    }
    else {
      unint64_t v12 = -1;
    }
    id v13 = +[AXPIFingerUtilities fingerShapeForCorner:v12];
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3010000000;
    v35[3] = &unk_10015DFB5;
    CGPoint v36 = CGPointZero;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3010000000;
    v33[3] = &unk_10015DFB5;
    CGPoint v34 = v36;
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    double v14 = +[NSMutableArray array];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100025CC4;
    v20[3] = &unk_1001AB330;
    id v23 = v35;
    v24 = v33;
    double v26 = x;
    double v27 = y;
    BOOL v28 = a5;
    id v15 = v11;
    id v21 = v15;
    id v25 = &v29;
    id v16 = v14;
    id v22 = v16;
    [v15 enumerateFingersUsingBlock:v20];
    if (*((unsigned char *)v30 + 24))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100025DFC;
      v17[3] = &unk_1001AB358;
      id v18 = v16;
      id v19 = v13;
      [v15 enumerateFingersUsingBlock:v17];
    }
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
}

- (void)startDragModeOnDisplay:(id)a3
{
  id v4 = a3;
  if (![(HNDHandManager *)self inDragMode])
  {
    [(HNDHandManager *)self showMenu:0 onDisplay:v4];
    unsigned __int8 v5 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];
    BOOL v6 = [v5 fingerController];
    if (![v6 numberOfFingers])
    {
      [(HNDHandManager *)self currentPointForPointer];
      double v8 = v7;
      double v10 = v9;
      unsigned int v11 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:");
      id v13 = v11;
      unint64_t v12 = +[NSArray arrayWithObjects:&v13 count:1];
      objc_msgSend(v6, "showFingerModels:animated:startPointForAnimation:", v12, 1, v8, v10);
    }
    [v5 setMultiTouchToolBackgroundEnabled:1];
    [(HNDHandManager *)self setDwellMode:1];
    self->_inDragMode = 1;
    [(HNDHandManager *)self pauseBubbleModeForSpecialUsageTool];
    [(HNDHandManager *)self pauseEyeTrackingAutoHideForSpecialUsageTool];
    [(HNDHandManager *)self _systemPointerSettingsDidChange];
  }
}

- (void)beginDragMenuAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  self->_isDragNubbitMode = 1;
  -[HNDHandManager beginDragAtPoint:onDisplay:](self, "beginDragAtPoint:onDisplay:", a4, a3.x, a3.y);
}

- (void)beginDragAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(HNDHandManager *)self inDragMode] && !self->_isPerformingDragPressEvent)
  {
    if (-[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v7, x, y)
      && !self->_isDragNubbitMode)
    {
      -[HNDHandManager endDragModeAtPoint:onDisplay:completed:](self, "endDragModeAtPoint:onDisplay:completed:", v7, 0, x, y);
      [(HNDHandManager *)self showMenu:1 onDisplay:v7];
    }
    else
    {
      [(HNDHandManager *)self pauseBubbleModeForSpecialUsageTool];
      [(HNDHandManager *)self pauseEyeTrackingAutoHideForSpecialUsageTool];
      self->_isPerformingDragPressEvent = 1;
      self->_dragStartPoint.double x = x;
      self->_dragStartPoint.double y = y;
      double v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
      objc_msgSend(v8, "updateWithPrimaryFingerPoint:", x, y);
      -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v7, 0, x, y);
      double v9 = [v8 fingerController];
      [v9 pressFingersDownAnimated:1];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000261F4;
      v13[3] = &unk_1001AB380;
      v13[4] = self;
      id v14 = v8;
      id v10 = v8;
      unint64_t v12 = objc_retainBlock(v13);
      unsigned int v11 = v12;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

- (void)endDragModeAtPoint:(CGPoint)a3 onDisplay:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if ([(HNDHandManager *)self inDragMode] && !self->_isPerformingDragPressEvent)
  {
    [(HNDHandManager *)self displayManagerForHardwareIdentifier:v9];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100026674;
    v34[3] = &unk_1001AB3D0;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = v10;
    CGPoint v36 = self;
    double v38 = x;
    double v39 = y;
    BOOL v40 = v5;
    id v11 = v9;
    id v37 = v11;
    unint64_t v12 = objc_retainBlock(v34);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100026778;
    v32[3] = &unk_1001AB380;
    v32[4] = self;
    id v13 = v10;
    id v33 = v13;
    id v14 = objc_retainBlock(v32);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100026790;
    v30[3] = &unk_1001AAC78;
    void v30[4] = self;
    id v15 = v13;
    id v31 = v15;
    id v16 = objc_retainBlock(v30);
    if (v5)
    {
      self->_isPerformingDragPressEvent = 1;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000267AC;
      v25[3] = &unk_1001AB3F8;
      double v28 = x + 0.001;
      double v29 = y + 0.001;
      double v27 = v14;
      v25[4] = self;
      id v26 = v11;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000267FC;
      v17[3] = &unk_1001AB448;
      id v21 = v16;
      double v23 = x;
      double v24 = y;
      id v18 = v15;
      id v19 = self;
      id v20 = v26;
      id v22 = v12;
      +[UIView animateWithDuration:v25 animations:v17 completion:0.15];
    }
    else
    {
      if (self->_dragStartPoint.x != -1.0 || self->_dragStartPoint.y != -1.0)
      {
        ((void (*)(void *))v14[2])(v14);
        ((void (*)(void *))v16[2])(v16);
        -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v11, 0, self->_dragStartPoint.x, self->_dragStartPoint.y);
        objc_msgSend(v15, "updateWithPrimaryFingerPoint:", self->_dragStartPoint.x, self->_dragStartPoint.y);
      }
      ((void (*)(void *))v12[2])(v12);
    }
  }
}

- (void)_handleRealDragToolUp:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  id v10 = [v8 fingerController];

  objc_msgSend(v10, "hndConvertPointToFingerContainerView:", x, y);
  if (self->_dragStartPoint.x == -1.0 && self->_dragStartPoint.y == -1.0) {
    -[HNDHandManager beginDragAtPoint:onDisplay:](self, "beginDragAtPoint:onDisplay:", v7);
  }
  else {
    -[HNDHandManager endDragModeAtPoint:onDisplay:completed:](self, "endDragModeAtPoint:onDisplay:completed:", v7, 1);
  }
}

- (void)_handleRealDragToolMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = v7;
  if (!*(_WORD *)&self->_isDragNubbitMode)
  {
    id v9 = v7;
    id v7 = -[HNDHandManager _moveFingersForRealEventToPoint:onDisplay:](self, "_moveFingersForRealEventToPoint:onDisplay:", v7, x, y);
    id v8 = v9;
  }

  _objc_release_x1(v7, v8);
}

- (void)_handleRealContinuousScrollToolUp:(CGPoint)a3 onDisplay:(id)a4
{
  id v5 = a4;
  if ([(HNDHandManager *)self inContinuousScrollMode]) {
    [(HNDHandManager *)self endContinuousScrollingOnDisplay:v5 withCompletion:0];
  }
  else {
    [(HNDHandManager *)self beginContinuousScrollingInDirection:(id)[(HNDHandManager *)self continuousScrollMode] == (id)1 onDisplay:v5];
  }
}

- (BOOL)isSystemSleeping:(id)a3
{
  BOOL v3 = +[AXSystemAppServer server];
  unsigned __int8 v4 = [v3 isSystemSleeping];

  return v4;
}

- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5
{
  if ([(HNDHandManager *)self needsGenerateScrollers]) {
    [(HNDHandManager *)self generateContinuousScrollersWithCompletion:0];
  }
  if ([(HNDHandManager *)self inBubbleMode])
  {
    [(HNDHandManager *)self generateMappingForElementFrames];
  }
}

- (id)additionalAXNotificationsToObserve
{
  if (qword_1001F0998 != -1) {
    dispatch_once(&qword_1001F0998, &stru_1001AB468);
  }
  int v2 = (void *)qword_1001F0990;

  return v2;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  if ((unint64_t)a4 <= 0x10 && ((1 << a4) & 0x1F2EE) != 0)
  {
    [(HNDHandManager *)self setBubbleModeBlockedOnElementRefresh:a4 != 3];
    id v7 = +[HNDHandManager sharedManager];
    BOOL v6 = [v7 updateElementVisualsCoalescer];
    [v6 notifyUpdateElementVisualsEventDidOccur];
  }
}

- (BOOL)_scrollAncestorIsSelfForScrollView:(id)a3 scrollAction:(int)a4 resultScrollAncestor:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", [v7 scrollAncestorForScrollAction:v6]);
  id v9 = v8;
  if (a5) {
    *a5 = v8;
  }
  unsigned __int8 v10 = [v7 isEqual:v9];

  return v10;
}

- (void)generateContinuousScrollersWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HNDHandManager *)self continuousScrollerGenerationQueue];

  if (v5)
  {
    uint64_t v6 = [(HNDHandManager *)self continuousScrollerGenerationQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100026DA8;
    v7[3] = &unk_1001AB1F8;
    id v8 = v4;
    [(HNDHandManager *)self generateContinuousScrollersOnQueue:v6 withCompletion:v7];
  }
}

- (void)generateContinuousScrollersOnQueue:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = a3;
  id v7 = a4;
  if (![(HNDHandManager *)self isActivelyScrollingContinuously])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100026E7C;
    v8[3] = &unk_1001AB4B8;
    v8[4] = self;
    id v9 = v7;
    dispatch_async(v6, v8);
  }
}

- (BOOL)shouldUseEyeTrackingAutoHide
{
  int v2 = [(HNDHandManager *)self deviceManager];
  unsigned int v3 = [v2 mainDeviceIsMotionTracker];

  if (!v3) {
    return 0;
  }
  id v4 = +[AXSettings sharedInstance];
  unsigned __int8 v5 = [v4 assistiveTouchEyeTrackingAutoHideEnabled];

  return v5;
}

- (void)enableBubbleMode:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(HNDHandManager *)self inBubbleMode];
  BOOL v6 = !v3;
  unsigned int v7 = !v3 & v5;
  [(HNDHandManager *)self setInBubbleMode:v3];
  id v8 = AXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = [(HNDHandManager *)self inBubbleMode];
    CFStringRef v10 = @"NO";
    if (v9) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)id buf = 138412290;
    CFStringRef v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bubbleModeSettingToggled: %@", buf, 0xCu);
  }

  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002784C;
    v11[3] = &unk_1001AAC50;
    v11[4] = self;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v11];
    [(HNDHandManager *)self resetFingersIfNeeded];
    [(HNDHandManager *)self _systemPointerSettingsDidChange];
  }
  if (((v6 | v5) & 1) == 0)
  {
    [(HNDHandManager *)self _setApplicationAccessibilityEnabledIfNeeded];
    [(HNDHandManager *)self refreshElementFetcherWithScrollingBlocked:1];
  }
}

- (BOOL)shouldUseBubbleMode
{
  BOOL v2 = [(HNDHandManager *)self bubbleModeAllowed];
  if (v2)
  {
    BOOL v3 = +[AXSettings sharedInstance];
    unsigned __int8 v4 = [v3 assistiveTouchBubbleModeEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)bubbleModeAllowed
{
  BOOL v2 = [(HNDHandManager *)self deviceManager];
  unsigned __int8 v3 = [v2 mainDeviceIsMotionTracker];

  return v3;
}

- (id)_groupWithDictionary:(id)a3 currentPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"GroupElements"];
  id v8 = [v6 objectForKeyedSubscript:@"GroupTraits"];
  uint64_t v9 = (int)[v8 intValue];
  CFStringRef v10 = [v6 objectForKeyedSubscript:@"GroupScanBehaviorTraits"];
  uint64_t v11 = (int)[v10 intValue];
  unint64_t v12 = [v6 objectForKeyedSubscript:@"GroupLabel"];
  CFStringRef v13 = [v6 objectForKeyedSubscript:@"GroupIdentifier"];

  id v14 = [(HNDHandManager *)self _groupWithItems:v7 groupTraits:v9 scanningBehaviorTraits:v11 label:v12 identifier:v13 currentPid:v4];

  return v14;
}

- (id)_groupWithItems:(id)a3 groupTraits:(unint64_t)a4 scanningBehaviorTraits:(unint64_t)a5 label:(id)a6 identifier:(id)a7 currentPid:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  unint64_t v31 = a5;
  id v11 = a3;
  id v32 = a6;
  unint64_t v12 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v11;
  id v34 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v34) {
    goto LABEL_20;
  }
  uint64_t v14 = *(void *)v36;
  id v33 = v13;
  do
  {
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v13);
      }
      id v16 = *(const void **)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [(HNDHandManager *)self _groupWithDictionary:v16 currentPid:v8];
        if (v18) {
          goto LABEL_17;
        }
      }
      else
      {
        CFTypeID v19 = CFGetTypeID(v16);
        if ((v19 == AXUIElementGetTypeID()) | isKindOfClass & 1)
        {
          if (isKindOfClass) {
            +[AXElement elementWithUIElement:v16];
          }
          else {
          id v20 = +[AXElement elementWithAXUIElement:v16];
          }
          id v21 = objc_msgSend(v20, "uiElement", v31);
          id v22 = [v21 pid];

          if (v22 == v8)
          {
            id v18 = v20;
          }
          else
          {
            double v23 = [v20 uiElement];
            [v23 objectWithAXAttribute:94500 parameter:&off_1001BB8B0];
            id v25 = v24 = v12;

            id v18 = [(HNDHandManager *)self _groupWithItems:v25 groupTraits:0 scanningBehaviorTraits:0 label:0 identifier:0 currentPid:v22];

            unint64_t v12 = v24;
            id v13 = v33;
          }

          if (v18)
          {
LABEL_17:
            objc_msgSend(v12, "addObject:", v18, v31);

            continue;
          }
        }
      }
    }
    id v34 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v34);
LABEL_20:

  if ([v12 count])
  {
    id v26 = v12;
    double v27 = v12;
    double v28 = v32;
    double v29 = +[AXElementGroup groupWithElements:v26 label:v32];
    [v29 setUserDefinedScanningBehaviorTraits:v31];
  }
  else
  {
    double v29 = 0;
    double v27 = v12;
    double v28 = v32;
  }

  return v29;
}

- (void)processPortraitUpPointForBubbleMode:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(HNDHandManager *)self inBubbleMode]
    && [(HNDHandManager *)self shouldUseBubbleMode])
  {
    if ((byte_1001F09A0 & 1) == 0)
    {
      [(HNDHandManager *)self refreshElementFetcherWithScrollingBlocked:1];
      byte_1001F09A0 = 1;
    }
    if (!self->_primaryButtonDown
      || ![(HNDHandManager *)self currentlySnappedInBubbleMode])
    {
      uint64_t v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
      uint64_t v9 = [v8 rocker];
      unsigned int v10 = [v9 isFullMenuVisible];

      unsigned __int8 v11 = [(HNDHandManager *)self currentlySnappedInBubbleMode];
      CGFloat v12 = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      id v15 = [(HNDHandManager *)self elementFetcher];
      double v138 = v12;
      double v136 = height;
      double v137 = width;
      double v143 = x;
      double v145 = y;
      if ([v15 willFetchElements])
      {
        unsigned int v16 = [(HNDHandManager *)self bubbleModeBlockedOnElementRefresh];

        if (!v16)
        {
LABEL_16:
          v150[0] = 1.79769313e308;
          CFTypeID v19 = -[HNDHandManager nearestElementFrameForPortraitPoint:distance:](self, "nearestElementFrameForPortraitPoint:distance:", v150, x, y);
          [v19 CGRectValue];
          double v23 = v28;
          double v25 = v29;
          double v147 = v31;
          double v148 = v30;
          id v32 = [(HNDHandManager *)self bubbleModeFrameToElementMapping];
          id v21 = [v32 objectForKeyedSubscript:v19];

          unsigned int v20 = [(HNDHandManager *)self isSimpleElementForBubbleMode:v21];
          id v33 = [(HNDHandManager *)self currentlySelectedKeyboardRow];

          if (v10)
          {
            unsigned int v20 = 0;
          }
          else
          {
            double v34 = 200.0;
            if (!v33) {
              double v34 = 70.0;
            }
            if (v150[0] > v34 || v19 == 0 || v21 == 0) {
              unsigned int v20 = 0;
            }
          }
          goto LABEL_32;
        }
      }
      else
      {
        double v17 = [(HNDHandManager *)self elementFetcher];
        if (([v17 isFetchingElements] & 1) == 0)
        {

          goto LABEL_16;
        }
        unsigned __int8 v18 = [(HNDHandManager *)self bubbleModeBlockedOnElementRefresh];

        if ((v18 & 1) == 0) {
          goto LABEL_16;
        }
      }
      mach_absolute_time();
      [(HNDHandManager *)self lastTimeHitTestedForBubbleMode];
      if ((double)(unint64_t)AXMachTimeToNanoseconds() / 1000000000.0 <= 0.1)
      {
        id v21 = [(HNDHandManager *)self lastBubbleModeFocusedElement];

        if (v21)
        {
          id v21 = [(HNDHandManager *)self lastBubbleModeFocusedElement];
          [v21 visibleFrame];
          double v23 = v37;
          double v25 = v38;
          double v147 = v40;
          double v148 = v39;
          unsigned int v20 = 1;
        }
        else
        {
          unsigned int v20 = 0;
          double v147 = height;
          double v148 = width;
          double v25 = v12;
          double v23 = CGRectZero.origin.x;
        }
LABEL_33:
        double v139 = v25;
        double v141 = v23;
        objc_msgSend(v8, "orientedBubbleModeElementFrameForElementFrame:", v23, v25, v148, v147);
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        [v8 screenBounds];
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        v151.origin.double x = v42;
        v151.origin.double y = v44;
        v151.size.CGFloat width = v46;
        v151.size.CGFloat height = v48;
        if (CGRectIsEmpty(v151))
        {
          int v57 = 0;
          double v59 = v143;
          double v58 = v145;
        }
        else
        {
          v152.origin.double x = v50;
          v152.origin.double y = v52;
          v152.size.CGFloat width = v54;
          v152.size.CGFloat height = v56;
          double v59 = v143;
          double v58 = v145;
          if (!CGRectIsEmpty(v152))
          {
            uint64_t v135 = 0x3FEE666666666666;
            double v61 = v139;
            double v60 = v141;
            int v57 = AXMIsContainedBy();
LABEL_39:
            v62 = [(HNDHandManager *)self availableElements];
            BOOL v63 = [v62 count] != (id)1;

            objc_msgSend(v8, "convertPointToIntefaceOrientation:", v59, v58);
            double v66 = v64;
            double v67 = v65;
            BOOL v68 = (v10 & 1) == 0
               && -[HNDHandManager _isInNubbitHitbox:onDisplay:activationFactor:](self, "_isInNubbitHitbox:onDisplay:activationFactor:", v7, v64, v65, 0.65);
            objc_msgSend(v8, "convertToNormalizedInterfaceOrientation:", v66, v67);
            double v70 = v69;
            double v72 = v71;
            if (-[HNDHandManager _shouldLockIntoHotCornerAtNormalizedPoint:onDisplay:](self, "_shouldLockIntoHotCornerAtNormalizedPoint:onDisplay:", v7))
            {
              [(HNDHandManager *)self bubbleModeFailedToSnapOnDisplay:v7];
              -[HNDHandManager _lockIntoHotCornerForOrientedNormalizedPoint:onDisplay:cancelDwell:](self, "_lockIntoHotCornerForOrientedNormalizedPoint:onDisplay:cancelDwell:", v7, 0, v70, v72);
LABEL_91:

              goto LABEL_92;
            }
            int v74 = (v63 | ~v57) & v20;
            v150[0] = 1.79769313e308;
            if (v10
              && ([v8 rocker],
                  v75 = objc_claimAutoreleasedReturnValue(),
                  [v75 currentlyVisibleRockerItems],
                  v76 = objc_claimAutoreleasedReturnValue(),
                  id v77 = [v76 count],
                  v76,
                  v75,
                  v77))
            {
              uint64_t v78 = -[HNDHandManager nearestRockerButtonForDisplayManger:orientedPoint:distance:](self, "nearestRockerButtonForDisplayManger:orientedPoint:distance:", v8, v150, v66, v67);
              v79 = (void *)v78;
              double v73 = v150[0];
              BOOL v81 = v150[0] <= 80.0 && v78 != 0;
            }
            else
            {
              v79 = 0;
              BOOL v81 = 0;
            }
            if (!(v74 | v68) && !v81)
            {
              -[HNDHandManager bubbleModeFailedToSnapOnDisplay:](self, "bubbleModeFailedToSnapOnDisplay:", v7, v73);
LABEL_90:

              goto LABEL_91;
            }
            BOOL v140 = v81;
            unsigned __int8 v142 = v11;
            unsigned __int8 v82 = [(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit];
            uint64_t v83 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
            unsigned __int8 v84 = 0;
            int v144 = v74;
            if (v83 && v79)
            {
              v85 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
              unsigned __int8 v84 = [v85 isEqual:v79];

              int v74 = v144;
            }
            v146 = v79;
            BOOL v86 = v82 & v68;

            v87 = [(HNDHandManager *)self lastBubbleModeFocusedElement];
            LOBYTE(v83) = 0;
            if (v87 && v21)
            {
              v88 = [(HNDHandManager *)self lastBubbleModeFocusedElement];
              LODWORD(v83) = [v88 isEqual:v21] & !v68;

              int v74 = v144;
            }

            char v89 = v86 | v83 | v84;
            v79 = v146;
            if (v89) {
              goto LABEL_90;
            }
            [(HNDHandManager *)self setBubbleModeCurrentlyFocusedOnNubbit:v68];
            if (v140) {
              v90 = v146;
            }
            else {
              v90 = 0;
            }
            [(HNDHandManager *)self setBubbleModeFocusedRockerItem:v90];
            if (v74) {
              id v91 = v21;
            }
            else {
              id v91 = 0;
            }
            [(HNDHandManager *)self setCurrentBubbleModeFocusedElement:v91];
            [(HNDHandManager *)self setLastBubbleModeFocusedElement:v91];
            self->_hoverNubbitLocked = 0;
            if (v140)
            {
              [v8 screenBoundsForRockerButton:v146];
              CGFloat v93 = v92;
              CGFloat v95 = v94;
              CGFloat v97 = v96;
              CGFloat v99 = v98;
              unsigned __int8 v100 = v142;
            }
            else
            {
              unsigned __int8 v100 = v142;
              if (!v68)
              {
                CGFloat v95 = v138;
                CGFloat v93 = CGRectZero.origin.x;
                CGFloat v99 = v136;
                CGFloat v97 = v137;
                int v105 = v144;
                if (v144)
                {
                  objc_msgSend(v8, "orientedBubbleModeElementFrameForElementFrame:", v60, v61, v148, v147);
                  CGFloat v93 = v122;
                  CGFloat v95 = v123;
                  CGFloat v97 = v124;
                  CGFloat v99 = v125;
                }
LABEL_75:
                double v106 = sub_10004119C();
                v153.origin.double x = v93;
                v153.origin.double y = v95;
                v153.size.CGFloat width = v97;
                v153.size.CGFloat height = v99;
                CGRect v154 = CGRectInset(v153, -9.0, -9.0);
                double v107 = (40.0 - v154.size.height) * 0.5;
                if (v154.size.height >= 40.0) {
                  double v107 = 0.0;
                }
                double v108 = v154.origin.y - v107;
                if (v154.size.height < 40.0) {
                  v154.size.CGFloat height = 40.0;
                }
                -[HNDHandManager clipRect:toRotatedScreenBoundsOnDisplay:](self, "clipRect:toRotatedScreenBoundsOnDisplay:", v7, v154.origin.x, v108, v154.size.width, v154.size.height, 40.0, v107);
                double v110 = v109;
                double v149 = v111;
                v155.origin.double x = 0.0;
                v155.origin.double y = 0.0;
                double v112 = v155.size.width;
                double v113 = v155.size.height;
                CGRect v156 = CGRectInset(v155, 1.0, 1.0);
                CGRect v157 = CGRectIntegral(v156);
                double v114 = v157.origin.x;
                double v115 = v157.origin.y;
                double v116 = v157.size.width;
                double v117 = v157.size.height;
                if (CGRectIsEmpty(v157)
                  || (v158.origin.double x = v114,
                      v158.origin.double y = v115,
                      v158.size.CGFloat width = v116,
                      v158.size.CGFloat height = v117,
                      CGRectIsInfinite(v158))
                  || !CGFloatIsValid()
                  || !CGFloatIsValid()
                  || v116 <= 0.0
                  || v117 <= 0.0
                  || (+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v114, v115, v116, v117, (v106 + 1.0) * 8.0), (uint64_t v118 = objc_claimAutoreleasedReturnValue()) == 0))
                {
                  [(HNDHandManager *)self bubbleModeFailedToSnapOnDisplay:v7];
LABEL_89:
                  v79 = v146;
                  goto LABEL_90;
                }
                v119 = (void *)v118;
                [(HNDHandManager *)self cancelDwellTimerForPointer];
                if (v140)
                {
                  [(HNDHandManager *)self setBubbleModeFocusedRockerItem:v146];
                  v120 = [v8 rocker];
                  [v120 hoveredToRockerButton:v146];

                  double v121 = v110;
                }
                else
                {
                  double v121 = v110;
                  if (!v68)
                  {
                    double v126 = v149;
                    if (v105)
                    {
                      [(HNDHandManager *)self setCurrentBubbleModeFocusedElement:v21];
                      [(HNDHandManager *)self setLastBubbleModeFocusedElement:v21];
                    }
                    goto LABEL_98;
                  }
                  [(HNDHandManager *)self setBubbleModeCurrentlyFocusedOnNubbit:1];
                  self->_hoverNubbitLocked = 1;
                }
                double v126 = v149;
LABEL_98:
                v127 = [(HNDHandManager *)self systemPointerController];
                objc_msgSend(v127, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));

                v128 = [(HNDHandManager *)self currentDisplayManager];
                unsigned int v129 = [v128 fingerContentViewIsActive];

                if (v129)
                {
                  if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled]) {
                    [v8 overrideFingerContentViewOpacity:0.0];
                  }
                  v130 = [(HNDHandManager *)self currentDisplayManager];
                  [v130 setFingerContentViewIsActive:0 withDuration:0.0];
                }
                v131 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
                v132 = [v131 fingerController];
                v133 = [v132 fingerContainerView];
                [v133 setAlpha:0.0];

                if ((v100 & 1) == 0) {
                  [(HNDHandManager *)self reloadFingerAppearance];
                }
                if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled])
                {
                  v134 = +[AXSettings sharedInstance];
                  [v134 assistiveTouchEyeTrackingAutoHideOpacity];
                  objc_msgSend(v8, "overrideBubbleCursorOpacity:");
                }
                objc_msgSend(v8, "drawBubbleCursorFrame:withPath:", v119, v121, v126, v112, v113);

                goto LABEL_89;
              }
              [v8 rockerFrame];
              CGFloat v93 = v101;
              CGFloat v95 = v102;
              CGFloat v97 = v103;
              CGFloat v99 = v104;
            }
            int v105 = v144;
            goto LABEL_75;
          }
          int v57 = 0;
        }
        double v61 = v139;
        double v60 = v141;
        goto LABEL_39;
      }
      [(HNDHandManager *)self setLastTimeHitTestedForBubbleMode:mach_absolute_time()];
      CFTypeID v19 = +[AXElement elementAtCoordinate:withVisualPadding:](AXElement, "elementAtCoordinate:withVisualPadding:", 0, x, y);
      unsigned int v20 = [(HNDHandManager *)self isSimpleElementForBubbleMode:v19];
      if (v20)
      {
        id v21 = v19;
        [v21 visibleFrame];
        double v23 = v22;
        double v25 = v24;
        double v147 = v27;
        double v148 = v26;
      }
      else
      {
        id v21 = 0;
        double v147 = height;
        double v148 = width;
        double v25 = v12;
        double v23 = CGRectZero.origin.x;
      }
LABEL_32:

      goto LABEL_33;
    }
  }
LABEL_92:
}

- (void)bubbleModeFailedToSnapOnDisplay:(id)a3
{
  id v14 = a3;
  unsigned int v4 = [(HNDHandManager *)self currentlySnappedInBubbleMode];
  [(HNDHandManager *)self cancelDwellTimerForBubbleMode];
  unsigned int v5 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v14];
  if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled]) {
    [v5 overrideBubbleCursorOpacity:0.0];
  }
  [v5 hideBubbleCursor];
  [(HNDHandManager *)self setCurrentBubbleModeFocusedElement:0];
  [(HNDHandManager *)self setLastBubbleModeFocusedElement:0];
  [(HNDHandManager *)self setBubbleModeFocusedRockerItem:0];
  [(HNDHandManager *)self setBubbleModeCurrentlyFocusedOnNubbit:0];
  id v6 = [(HNDHandManager *)self currentDisplayManager];
  unsigned __int8 v7 = [v6 fingerContentViewIsActive];

  if ((v7 & 1) == 0)
  {
    if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled])
    {
      uint64_t v8 = +[AXSettings sharedInstance];
      [v8 assistiveTouchEyeTrackingAutoHideOpacity];
      objc_msgSend(v5, "overrideFingerContentViewOpacity:");
    }
    uint64_t v9 = [(HNDHandManager *)self currentDisplayManager];
    [v9 setFingerContentViewIsActive:1];
  }
  unsigned int v10 = [(HNDHandManager *)self systemPointerController];
  objc_msgSend(v10, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));

  unsigned __int8 v11 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v14];
  CGFloat v12 = [v11 fingerController];
  id v13 = [v12 fingerContainerView];
  [v13 setAlpha:1.0];

  if (v4) {
    [(HNDHandManager *)self reloadFingerAppearance];
  }
}

- (id)keyboardRowContainingKeyboardKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 elementParent];
  id v6 = [v5 uiElement];
  unsigned __int8 v7 = [v6 objectWithAXAttribute:12017];

  uint64_t v8 = -[HNDHandManager _groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:](self, "_groupWithItems:groupTraits:scanningBehaviorTraits:label:identifier:currentPid:", v7, 0, 0, @"Keyboard Row", @"Keyboard Row", [v5 pid]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000289BC;
  v14[3] = &unk_1001AB4E0;
  id v15 = v4;
  id v9 = v4;
  unsigned int v10 = [v8 firstChildPassingTest:v14];
  if ([v10 isGroup]) {
    unsigned __int8 v11 = v10;
  }
  else {
    unsigned __int8 v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)availableElements
{
  unsigned __int8 v3 = [(HNDHandManager *)self currentlySelectedKeyboardRow];
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 descendantsPassingTest:&stru_1001AB520];
  }
  else
  {
    id v6 = [(HNDHandManager *)self elementFetcher];
    unsigned int v5 = [v6 availableElements];
  }

  return v5;
}

- (BOOL)_shouldUseTwoStageTyping
{
  return 0;
}

- (void)generateMappingForElementFrames
{
  unsigned __int8 v3 = +[NSMutableDictionary dictionary];
  [(HNDHandManager *)self setBubbleModeFrameToElementMapping:v3];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [(HNDHandManager *)self availableElements];
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v9 visibleFrame];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        if ([(HNDHandManager *)self isOnDeviceEyeTrackingEnabled])
        {
          if ([(HNDHandManager *)self _shouldUseTwoStageTyping])
          {
            if ([v9 isKeyboardKey])
            {
              unsigned __int8 v18 = [(HNDHandManager *)self currentlySelectedKeyboardRow];

              if (!v18)
              {
                CFTypeID v19 = [(HNDHandManager *)self keyboardRowContainingKeyboardKey:v9];
                [v19 frame];
                double v11 = v20;
                double v13 = v21;
                double v15 = v22;
                double v17 = v23;
              }
            }
          }
        }
        v31.origin.double x = v11;
        v31.origin.double y = v13;
        v31.size.CGFloat width = v15;
        v31.size.CGFloat height = v17;
        if (!CGRectIsEmpty(v31))
        {
          v32.origin.double x = v11;
          v32.origin.double y = v13;
          v32.size.CGFloat width = v15;
          v32.size.CGFloat height = v17;
          if (!CGRectIsInfinite(v32)
            && CGFloatIsValid()
            && CGFloatIsValid()
            && v15 > 0.0
            && v17 > 0.0)
          {
            double v24 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v11, v13, v15, v17);
            double v25 = [(HNDHandManager *)self bubbleModeFrameToElementMapping];
            [v25 setObject:v9 forKey:v24];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
}

- (id)nearestElementFrameForPortraitPoint:(CGPoint)a3 distance:(double *)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(HNDHandManager *)self bubbleModeFrameToElementMapping];
  uint64_t v7 = [v6 allKeys];

  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    double v10 = 0;
    uint64_t v11 = *(void *)v20;
    double v12 = 1.79769313e308;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      double v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      [v14 CGRectValue];
      -[HNDHandManager distanceBetweenRect:andPoint:](self, "distanceBetweenRect:andPoint:");
      double v16 = v15;
      if (v15 < v12)
      {
        id v17 = v14;

        double v10 = v17;
        double v12 = v16;
      }
      if (v16 < 0.01) {
        break;
      }
      if (v9 == (id)++v13)
      {
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v10 = 0;
    double v12 = 1.79769313e308;
  }

  *a4 = v12;

  return v10;
}

- (id)nearestRockerButtonForDisplayManger:(id)a3 orientedPoint:(CGPoint)a4 distance:(double *)a5
{
  id v7 = a3;
  id v8 = [v7 rocker];
  id v9 = [v8 currentlyVisibleRockerItems];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v23;
    double v15 = 1.79769313e308;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v10);
      }
      id v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
      objc_msgSend(v7, "screenBoundsForRockerButton:", v17, (void)v22);
      -[HNDHandManager distanceBetweenRect:andPoint:](self, "distanceBetweenRect:andPoint:");
      double v19 = v18;
      if (v18 < v15)
      {
        id v20 = v17;

        uint64_t v13 = v20;
        double v15 = v19;
      }
      if (v19 < 0.01) {
        break;
      }
      if (v12 == (id)++v16)
      {
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
    double v15 = 1.79769313e308;
  }

  *a5 = v15;

  return v13;
}

- (double)distanceBetweenRect:(CGRect)a3 andPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  double v10 = CGRectGetMinX(a3) - a4.x;
  v15.origin.double x = v9;
  v15.origin.double y = v8;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = fmax(fmax(v10, 0.0), x - CGRectGetMaxX(v15));
  v16.origin.double x = v9;
  v16.origin.double y = v8;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v12 = CGRectGetMinY(v16) - y;
  v17.origin.double x = v9;
  v17.origin.double y = v8;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v13 = fmax(fmax(v12, 0.0), y - CGRectGetMaxY(v17));
  return sqrt(v13 * v13 + v11 * v11);
}

- (void)activateCurrentBubbleModeFocusedElement
{
  if ([(HNDHandManager *)self inBubbleMode]
    && [(HNDHandManager *)self currentlySnappedInBubbleMode])
  {
    unsigned __int8 v3 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
    id v4 = +[HNDHandManager sharedManager];
    id v5 = [v4 displayManagerForHardwareIdentifier:v3];

    id v6 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
    uint64_t v7 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
    if (v7)
    {
      CGFloat v8 = (void *)v7;
      CGFloat v9 = [v5 rocker];
      unsigned int v10 = [v9 isFullMenuVisible];

      if (v10)
      {
        double v11 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
        [v11 performPress:1];

        double v12 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
        [v12 performPress:0];

LABEL_25:
        return;
      }
    }
    if ([(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit])
    {
      [(HNDHandManager *)self showMenu:1 onDisplay:v3];
      goto LABEL_25;
    }
    if (!v6) {
      goto LABEL_25;
    }
    if ([(HNDHandManager *)self isOnDeviceEyeTrackingEnabled]
      && [(HNDHandManager *)self _shouldUseTwoStageTyping]
      && [v6 isKeyboardKey])
    {
      double v13 = [(HNDHandManager *)self currentlySelectedKeyboardRow];

      if (v13)
      {
        [(HNDHandManager *)self setCurrentlySelectedKeyboardRow:0];
      }
      else
      {
        uint64_t v14 = [(HNDHandManager *)self keyboardRowContainingKeyboardKey:v6];
        [(HNDHandManager *)self setCurrentlySelectedKeyboardRow:v14];
      }
      CGRect v15 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000293F8;
      block[3] = &unk_1001AAA90;
      block[4] = self;
      dispatch_async(v15, block);
    }
    CGRect v16 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
    if ([(HNDHandManager *)self supportsActivateForBubbleModeElement:v16])
    {
      CGRect v17 = [(HNDHandManager *)self currentlySelectedKeyboardRow];

      if (v17)
      {
LABEL_20:
        if ([(HNDHandManager *)self dwellControlEnabled]
          && ([v5 isMenuVisible] & 1) == 0
          && ![(HNDHandManager *)self inDragMode]
          && ![(HNDHandManager *)self inContinuousScrollMode])
        {
          [(HNDHandManager *)self _resetDwellModeToDefault];
        }
        goto LABEL_25;
      }
      CGRect v16 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
      [v16 performAction:2010];
    }

    goto LABEL_20;
  }
}

- (BOOL)supportsActivateForBubbleModeElement:(id)a3
{
  id v3 = a3;
  if ([v3 supportsAction:2010])
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = (unint64_t)[v3 traits];
    uint64_t v6 = kAXAdjustableTrait;
    unint64_t v7 = kAXAdjustableTrait & v5;
    if ((kAXIsEditingTrait & ~v5) != 0)
    {
      char v11 = 1;
    }
    else if ((kAXWebContentTrait & ~v5) != 0)
    {
      char v11 = 0;
    }
    else
    {
      CGFloat v8 = [v3 application];
      CGFloat v9 = [v8 uiElement];
      unsigned __int8 v10 = [v9 BOOLWithAXAttribute:3005];

      char v11 = v10 ^ 1;
    }
    if (v7 == v6) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = v11;
    }
  }

  return v4;
}

- (BOOL)isSimpleElementForBubbleMode:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 traits];
  uint64_t v5 = kAXAdjustableTrait;
  unint64_t v6 = kAXAdjustableTrait & v4;
  unsigned int v7 = [v3 isAccessibleElement];
  if (v7) {
    LOBYTE(v7) = [v3 respondsToUserInteraction];
  }
  if (v6 == v5)
  {
    BOOL v8 = 0;
  }
  else if ((kAXIsEditingTrait & v4) == kAXIsEditingTrait)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v7;
  }

  return v8;
}

- (BOOL)currentlySnappedInBubbleMode
{
  if (![(HNDHandManager *)self inBubbleMode]) {
    return 0;
  }
  id v3 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
  if (v3 || [(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (CGRect)clipRect:(CGRect)a3 toRotatedScreenBoundsOnDisplay:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  [v8 screenBounds];
  v24.origin.CGFloat x = v9;
  v24.origin.CGFloat y = v10;
  v24.size.CGFloat width = v11;
  v24.size.CGFloat height = v12;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectIntersection(v21, v24);
  CGFloat v13 = v22.origin.x;
  CGFloat v14 = v22.origin.y;
  CGFloat v15 = v22.size.width;
  CGFloat v16 = v22.size.height;
  if (CGRectIsNull(v22))
  {
    CGFloat v13 = CGRectZero.origin.x;
    CGFloat v14 = CGRectZero.origin.y;
    CGFloat v15 = CGRectZero.size.width;
    CGFloat v16 = CGRectZero.size.height;
  }

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)eyeTrackingAutoHideAllowed
{
  BOOL v2 = [(HNDHandManager *)self deviceManager];
  unsigned __int8 v3 = [v2 mainDeviceIsMotionTracker];

  return v3;
}

- (BOOL)inContinuousScrollMode
{
  unint64_t v3 = [(HNDHandManager *)self continuousScrollMode];
  if (v3 != 1) {
    LOBYTE(v3) = (id)[(HNDHandManager *)self continuousScrollMode] == (id)2;
  }
  return v3;
}

- (void)refreshElementFetcherWithScrollingBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = mach_absolute_time();
  [(HNDHandManager *)self lastTimeElementFetcherRefreshed];
  if ((double)(unint64_t)AXMachTimeToNanoseconds() / 1000000000.0 > 0.1)
  {
    unint64_t v6 = [(HNDHandManager *)self elementFetcher];
    [v6 refresh];

    [(HNDHandManager *)self setLastTimeElementFetcherRefreshed:v5];
    if (v3)
    {
      os_unfair_lock_lock(&self->_continuousScrollLock);
      [(HNDHandManager *)self setScrollingBlockedOnElementRefresh:1];
      os_unfair_lock_unlock(&self->_continuousScrollLock);
    }
  }
}

- (void)prepareForEyeTrackerConnected:(BOOL)a3
{
  if (a3)
  {
    [(HNDHandManager *)self enableElementFetcherAndNotificationsIfNecessary];
    BOOL v4 = +[AXSettings sharedInstance];
    -[HNDHandManager enableBubbleMode:](self, "enableBubbleMode:", [v4 assistiveTouchBubbleModeEnabled]);

    uint64_t v5 = +[AXSettings sharedInstance];
    -[HNDHandManager enableEyeTrackingAutoHide:](self, "enableEyeTrackingAutoHide:", [v5 assistiveTouchEyeTrackingAutoHideEnabled]);
  }
  else
  {
    [(HNDHandManager *)self disableElementFetcherIfNecessary];
    [(HNDHandManager *)self enableBubbleMode:0];
    [(HNDHandManager *)self enableEyeTrackingAutoHide:0];
  }

  [(HNDHandManager *)self updateAssistiveTouchEyeTrackingAutoHideOpacity];
}

- (void)eyeTrackerIsActivelyTracking:(BOOL)a3
{
  if (!a3)
  {
    if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled])
    {
      uint64_t v5 = [(HNDHandManager *)self eyeTrackingAutoHideCursorAnimator];

      if (v5)
      {
        unint64_t v6 = [(HNDHandManager *)self eyeTrackingAutoHideCursorAnimator];
        [v6 stopAnimation:1];

        [(HNDHandManager *)self setEyeTrackingAutoHideCursorAnimator:0];
      }
    }
    [(HNDHandManager *)self cancelDwellTimer];
  }
}

- (void)enableElementFetcherAndNotificationsIfNecessary
{
  uint64_t v3 = [(HNDHandManager *)self continuousScrollerGenerationQueue];

  if (!v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AssistiveTouch.HNDHandManager.contScrollerGenerationQueue", 0);
    [(HNDHandManager *)self setContinuousScrollerGenerationQueue:v4];
  }
  [(HNDHandManager *)self setContinuousScrollLock:0];
  uint64_t v5 = [(HNDHandManager *)self elementFetcher];
  if ([v5 isEnabled]) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = [(HNDHandManager *)self _elementFetchingRequired];
  }

  unsigned int v7 = +[HNDDeviceManager sharedManager];
  unsigned int v8 = [v7 mainDeviceIsMotionTracker];

  int v9 = v6 & v8;
  if (v9 == 1)
  {
    CGFloat v10 = +[HNDAccessibilityManager sharedManager];
    [v10 addObserver:self];

    CGFloat v11 = +[HNDAccessibilityManager sharedManager];
    CGFloat v12 = [(HNDHandManager *)self additionalAXNotificationsToObserve];
    [v11 observeAXNotifications:v12];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100029A78;
  v13[3] = &unk_1001AB0E8;
  char v14 = v9;
  v13[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)disableElementFetcherIfNecessary
{
  uint64_t v3 = [(HNDHandManager *)self continuousScrollerGenerationQueue];

  if (v3) {
    [(HNDHandManager *)self setContinuousScrollerGenerationQueue:0];
  }
  dispatch_queue_t v4 = +[HNDDeviceManager sharedManager];
  unsigned __int8 v5 = [v4 mainDeviceIsMotionTracker];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(HNDHandManager *)self elementFetcher];
    if (v6)
    {
      unsigned int v7 = (void *)v6;
      unsigned int v8 = [(HNDHandManager *)self elementFetcher];
      if (![v8 isEnabled])
      {
LABEL_8:

        goto LABEL_9;
      }
      unsigned int v9 = [(HNDHandManager *)self _elementFetchingRequired];

      if (v9)
      {
        unsigned int v7 = +[HNDAccessibilityManager sharedManager];
        unsigned int v8 = [(HNDHandManager *)self additionalAXNotificationsToObserve];
        [v7 stopObservingAXNotifications:v8];
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029D20;
  v10[3] = &unk_1001AB0E8;
  unsigned __int8 v11 = v5;
  v10[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)prepareForContinuousScrollOnDisplay:(id)a3
{
  id v4 = a3;
  [(HNDHandManager *)self showMenu:0 onDisplay:v4];
  unsigned __int8 v5 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];

  uint64_t v6 = [v5 fingerController];
  id v7 = [v6 numberOfFingers];

  if (!v7)
  {
    [(HNDHandManager *)self currentPointForPointer];
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = [v5 fingerController];
    CGFloat v13 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", v9, v11);
    CGFloat v15 = v13;
    char v14 = +[NSArray arrayWithObjects:&v15 count:1];
    objc_msgSend(v12, "showFingerModels:animated:startPointForAnimation:", v14, 1, v9, v11);
  }
  [v5 setMultiTouchToolBackgroundEnabled:1];
  [(HNDHandManager *)self pauseBubbleModeForSpecialUsageTool];
  [(HNDHandManager *)self pauseEyeTrackingAutoHideForSpecialUsageTool];
  [(HNDHandManager *)self _systemPointerSettingsDidChange];
  [(HNDHandManager *)self setIsActivelyScrollingContinuously:0];
  os_unfair_lock_lock(&self->_continuousScrollLock);
  [(HNDHandManager *)self setScrollingBlockedOnElementRefresh:0];
  os_unfair_lock_unlock(&self->_continuousScrollLock);
  [(HNDHandManager *)self enableElementFetcherAndNotificationsIfNecessary];
}

- (void)beginContinuousScrollingInDirection:(unint64_t)a3 onDisplay:(id)a4
{
  id v6 = a4;
  if (![(HNDHandManager *)self inContinuousScrollMode])
  {
    if (a3 != 1)
    {
      if (a3)
      {
        [(HNDHandManager *)self setContinuousScrollMode:0];
        goto LABEL_7;
      }
      a3 = 2;
    }
    [(HNDHandManager *)self setContinuousScrollMode:a3];
    [(HNDHandManager *)self prepareForContinuousScrollOnDisplay:v6];
    [(HNDHandManager *)self setDwellMode:0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002A020;
    v7[3] = &unk_1001AB548;
    void v7[4] = self;
    id v8 = v6;
    [(HNDHandManager *)self generateContinuousScrollersWithCompletion:v7];
  }
LABEL_7:
}

- (void)processOrientedPointForContinuousScrolling:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  os_unfair_lock_lock(&self->_continuousScrollLock);
  if ((id)[(HNDHandManager *)self continuousScrollMode] == (id)1) {
    [(HNDHandManager *)self horizontalContinuousScrollers];
  }
  else {
  double v9 = [(HNDHandManager *)self verticalContinuousScrollers];
  }
  id v10 = [v9 copy];

  v62 = self;
  unsigned __int8 v11 = [(HNDHandManager *)self scrollingBlockedOnElementRefresh];
  os_unfair_lock_unlock(&self->_continuousScrollLock);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v68;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v68 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if (objc_msgSend(v17, "orientedPointLiesInContinuousScrollerActivationRegion:", x, y)) {
          [v8 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v14);
  }

  id v18 = [v8 count];
  if (v18) {
    unsigned __int8 v19 = v11;
  }
  else {
    unsigned __int8 v19 = 0;
  }
  if ((v19 & 1) == 0)
  {
    if (v18)
    {
      id v60 = v7;
      [(HNDHandManager *)v62 setIsActivelyScrollingContinuously:1];
      double v20 = [v8 firstObject];
      [v8 removeObject:v20];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      double v61 = v8;
      id v21 = v8;
      id v22 = [v21 countByEnumeratingWithState:&v63 objects:v77 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v64;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v64 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
            long long v27 = [v26 scrollView];
            long long v28 = [v20 scrollView];
            unsigned int v29 = [(HNDHandManager *)v62 _isChildElement:v27 desendantOfElement:v28];

            if (v29)
            {
              id v30 = v26;

              double v20 = v30;
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v63 objects:v77 count:16];
        }
        while (v23);
      }

      CGRect v31 = AXLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        CGRect v32 = [v20 targetElement];
        id v33 = [v32 label];
        double v34 = [v20 targetElement];
        [v34 frame];
        long long v35 = NSStringFromCGRect(v79);
        long long v36 = [v20 scrollDirectionToActivationFrame];
        *(_DWORD *)id buf = 138412802;
        double v72 = v33;
        __int16 v73 = 2112;
        int v74 = v35;
        __int16 v75 = 2112;
        v76 = v36;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Attempting to scroll targetElement with label: %@, element frames: %@, activation frames: %@", buf, 0x20u);
      }
      double v37 = objc_msgSend(v20, "directionForOrientedPoint:", x, y);
      uint64_t v38 = (int)[v37 intValue];
      double v39 = objc_msgSend(v20, "scrollingSpeedFactorForOrientedPoint:", x, y);
      [v39 floatValue];
      double v41 = v40;

      [(HNDHandManager *)v62 continuousScrollCurrentSpeedFactor];
      double v43 = v42;
      CGFloat v44 = [(HNDHandManager *)v62 currentContinuousScrollDirection];
      id v7 = v60;
      if (v44)
      {
        double v45 = [(HNDHandManager *)v62 currentContinuousScrollDirection];
        BOOL v46 = [v45 intValue] != v38;
      }
      else
      {
        BOOL v46 = 1;
      }

      double v51 = [(HNDHandManager *)v62 activeContinuousScroller];
      unsigned int v52 = [v20 isEqual:v51];

      int v53 = v52 ^ 1 | v46;
      if ((v53 & 1) != 0 || vabdd_f64(v43, v41) < 0.1)
      {
        id v8 = v61;
        if (!v53)
        {
LABEL_44:

          goto LABEL_45;
        }
        double v55 = [(HNDHandManager *)v62 continuousScrollPickedElement];
        unsigned int v56 = [v55 isAutoscrolling];

        if (v56)
        {
          int v57 = [(HNDHandManager *)v62 continuousScrollPickedElement];
          [v57 pauseAutoscrolling];
        }
        [(HNDHandManager *)v62 setContinuousScrollCurrentSpeedFactor:v41];
        double v58 = +[NSNumber numberWithUnsignedLong:v38];
        [(HNDHandManager *)v62 setCurrentContinuousScrollDirection:v58];

        double v59 = [v20 targetElement];
        [(HNDHandManager *)v62 setContinuousScrollPickedElement:v59];

        [(HNDHandManager *)v62 setActiveContinuousScroller:v20];
        [(HNDHandManager *)v62 _iterateRemoteViewsAndPerformContinuousScrollWithSpeed:v38 direction:v41 * 1000.0];
      }
      else
      {
        [(HNDHandManager *)v62 setContinuousScrollCurrentSpeedFactor:v41];
        CGFloat v54 = [(HNDHandManager *)v62 continuousScrollPickedElement];
        [v54 setAutoscrollSpeed:v41 * 1000.0];
      }
      id v8 = v61;
      goto LABEL_44;
    }
    unsigned int v47 = [(HNDHandManager *)v62 isActivelyScrollingContinuously];
    [(HNDHandManager *)v62 setCurrentContinuousScrollDirection:0];
    [(HNDHandManager *)v62 setIsActivelyScrollingContinuously:0];
    if (v47)
    {
      CGFloat v48 = [(HNDHandManager *)v62 continuousScrollPickedElement];
      unsigned int v49 = [v48 isAutoscrolling];

      if (v49)
      {
        CGFloat v50 = [(HNDHandManager *)v62 continuousScrollPickedElement];
        [v50 pauseAutoscrolling];
      }
      [(HNDHandManager *)v62 generateContinuousScrollersWithCompletion:0];
    }
  }
LABEL_45:
}

- (BOOL)_iterateRemoteViewsAndPerformContinuousScrollWithSpeed:(double)a3 direction:(unint64_t)a4
{
  id v7 = [(HNDHandManager *)self continuousScrollPickedElement];
  [v7 setAutoscrollSpeed:a3];
  [v7 setAutoscrollTarget:v7];
  if ([v7 autoscrollInDirection:a4])
  {
    BOOL v8 = 1;
  }
  else
  {
    while (1)
    {
      double v9 = [v7 uiElement];
      unsigned int v10 = [v9 BOOLWithAXAttribute:2093];

      if (!v10) {
        break;
      }
      unsigned __int8 v11 = [v7 uiElement];
      id v12 = [v11 objectWithAXAttribute:2310];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v14 = v12;
      if (isKindOfClass) {
        id v14 = objc_msgSend(v12, "axElement", v12);
      }
      uint64_t v15 = +[AXElement elementWithAXUIElement:v14];
      unsigned int v16 = [v15 isEqual:v7];
      if (!v15 || v16)
      {

        break;
      }

      [v15 setAutoscrollSpeed:a3];
      [v15 setAutoscrollTarget:v15];
      id v7 = v15;
      if ([v15 autoscrollInDirection:a4])
      {
        BOOL v8 = 1;
        id v7 = v15;
        goto LABEL_14;
      }
    }
    double v17 = AXLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v19 = [v7 label];
      int v20 = 134218498;
      double v21 = a3;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2112;
      long long v25 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to autoscroll with speed: %f, direction: %lu, pickedElement label: %@", (uint8_t *)&v20, 0x20u);
    }
    BOOL v8 = 0;
  }
LABEL_14:
  [(HNDHandManager *)self setContinuousScrollPickedElement:v7];

  return v8;
}

- (id)_scrollViewForScrollAction:(int)a3 elementsToScroll:(id *)a4
{
  id v7 = +[NSMutableOrderedSet orderedSet];
  BOOL v8 = +[NSMutableArray array];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10002AB90;
  v34[3] = &unk_1001AB570;
  int v37 = a3;
  id v9 = v7;
  id v35 = v9;
  id v10 = v8;
  id v36 = v10;
  unsigned __int8 v11 = objc_retainBlock(v34);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = [(HNDHandManager *)self elementFetcher];
  id v13 = [v12 availableElements];

  id v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        ((void (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v30 + 1) + 8 * i));
      }
      id v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  id v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v9;
  id v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        __int16 v24 = +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", *(void *)(*((void *)&v26 + 1) + 8 * (void)j), (void)v26);
        [v18 addObject:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  if (a4) {
    *a4 = v10;
  }

  return v18;
}

- (BOOL)_isChildElement:(id)a3 desendantOfElement:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    do
    {
      unsigned __int8 v8 = [v7 isEqual:a4];
      if (v8) {
        break;
      }
      uint64_t v9 = [v7 elementParent];

      id v7 = (void *)v9;
    }
    while (v9);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)endContinuousScrollingOnDisplay:(id)a3 withCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if ([(HNDHandManager *)self inContinuousScrollMode])
  {
    if ([(AXElement *)self->_continuousScrollPickedElement isAutoscrolling]) {
      [(AXElement *)self->_continuousScrollPickedElement pauseAutoscrolling];
    }
    unint64_t continuousScrollMode = self->_continuousScrollMode;
    self->_unint64_t continuousScrollMode = 0;
    [(HNDHandManager *)self _systemPointerSettingsDidChange];
    id v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v13];
    [v7 setMultiTouchToolBackgroundEnabled:0];
    [(HNDHandManager *)self currentPointForPointer];
    objc_msgSend(v7, "updateWithPrimaryFingerPoint:");
    continuousScrollPickedElement = self->_continuousScrollPickedElement;
    self->_continuousScrollPickedElement = 0;

    activeContinuousScroller = self->_activeContinuousScroller;
    self->_activeContinuousScroller = 0;

    os_unfair_lock_lock(&self->_continuousScrollLock);
    horizontalContinuousScrollers = self->_horizontalContinuousScrollers;
    self->_horizontalContinuousScrollers = (NSArray *)&__NSArray0__struct;

    verticalContinuousScrollers = self->_verticalContinuousScrollers;
    self->_verticalContinuousScrollers = (NSArray *)&__NSArray0__struct;

    self->_scrollingBlockedOnElementRefresh = 0;
    os_unfair_lock_unlock(&self->_continuousScrollLock);
    currentContinuousScrollDirection = self->_currentContinuousScrollDirection;
    self->_currentContinuousScrollDirection = 0;

    self->_isActivelyScrollingContinuousldouble y = 0;
    [(HNDHandManager *)self setDwellMode:1];
    [(HNDHandManager *)self _resetDwellDueToFingersReset];
    if ([(HNDHandManager *)self _shouldRepeatGesture] && v4)
    {
      [(HNDHandManager *)self beginContinuousScrollingInDirection:continuousScrollMode == 1 onDisplay:v13];
    }
    else
    {
      [(HNDHandManager *)self resumeBubbleModeForSpecialUsageToolIfNecessary];
      [(HNDHandManager *)self resumeEyeTrackingAutoHideForSpecialUsageToolIfNecessary];
    }
  }
}

- (void)_handlePinchFingerDownWithFinger:(id)a3 onDisplay:(id)a4
{
  id v6 = (AXPIFingerModel *)a3;
  id v9 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  [v9 performPress:2 type:1];
  id v7 = [v9 fingerController];
  [v7 pressFingersDownAnimated:1];

  self->_pinchState = 1;
  realSelectedPinchFinger = self->_realSelectedPinchFinger;
  self->_realSelectedPinchFinger = v6;
}

- (void)_handleRealPinchToolDown:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unsigned __int8 v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  id v10 = [v8 fingerController];

  objc_msgSend(v10, "hndConvertPointToFingerContainerView:", x, y);
  id v9 = objc_msgSend(v10, "fingerModelAtPoint:");
  if (v9)
  {
    [(HNDHandManager *)self _handlePinchFingerDownWithFinger:v9 onDisplay:v7];
  }
  else
  {
    -[HNDHandManager _handleRealPinchToolMove:onDisplay:](self, "_handleRealPinchToolMove:onDisplay:", v7, x, y);

    [v10 enumerateFingersUsingBlock:&stru_1001AB5B0];
  }
}

- (void)resetPinchFingersOnDisplay:(id)a3
{
  BOOL v4 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a3];
  id v5 = [v4 fingerController];
  id v6 = [v5 fingerModels];
  id v7 = [v6 count];

  if (v7 != (id)2) {
    _AXAssert();
  }
  if (!self->_resettingPinch)
  {
    if ([(HNDHandManager *)self canShowASTMousePointer]) {
      [(HNDHandManager *)self setCaptureEvents:0];
    }
    self->_resettingPinch = 1;
    id v8 = v4;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (id)mainWindow
{
  BOOL v2 = [(HNDHandManager *)self mainDisplayManager];
  uint64_t v3 = [v2 window];

  return v3;
}

- (void)_handleRealPinchToolUp:(CGPoint)a3 onDisplay:(id)a4
{
  id v8 = a4;
  id v5 = -[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:");
  id v6 = [v5 fingerController];

  if (self->_pinchState)
  {
    [(HNDHandManager *)self resetPinchFingersOnDisplay:v8];
    realSelectedPinchFinger = self->_realSelectedPinchFinger;
    self->_realSelectedPinchFinger = 0;
  }
  else
  {
    [v6 enumerateFingersUsingBlock:&stru_1001AB5D0];
  }
  [v6 liftFingersUpAnimated:1];
  self->_pinchState = 0;
}

- (void)_handleRealPinchToolMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  id v9 = [v8 fingerController];

  if (self->_pinchState)
  {
    objc_msgSend(v9, "hndConvertPointToFingerContainerView:", x, y);
    -[HNDHandManager _modifyPinchToolMoveToPoint:onDisplay:](self, "_modifyPinchToolMoveToPoint:onDisplay:", v7);
  }
  else
  {
    objc_msgSend(v9, "hndCentroidForPinchChainMidPoint:", x, y);
    -[HNDHandManager _moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:](self, "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:", v7, 0, 1, 0);
  }
}

- (void)_handleRealMultiFingerMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  id v9 = [v8 fingerController];

  objc_msgSend(v9, "hndStandardCentroidForMultifingers:", x, y);
  -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v7, 0);
}

- (void)_handleRealMultiFingerDown:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v14 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  self->_inMultiFingerGesture = 1;
  id v8 = [v14 fingerController];
  objc_msgSend(v8, "hndStandardCentroidForMultifingers:", x, y);
  double v10 = v9;
  double v12 = v11;

  -[HNDHandManager _moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:](self, "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:", v7, 0, 1, 0, v10, v12);
  [v14 performPress:2 type:1];
  id v13 = [v14 fingerController];
  [v13 pressFingersDownAnimated:1];
}

- (void)_handleRealMultiFingerUp:(CGPoint)a3 onDisplay:(id)a4
{
  self->_inMultiFingerGesture = 0;
  -[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", a4, a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v5 fingerController];
  [v4 liftFingersUpAnimated:1];
}

- (void)_moveFingersForRealEventToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v13];
  id v8 = [v7 fingerController];
  objc_msgSend(v8, "hndAbsoluteCentroidForMultifingers:", x, y);
  double v10 = v9;
  double v12 = v11;

  -[HNDHandManager _moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:](self, "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:", v13, 0, 1, 0, v10, v12);
}

- (void)_handleRealCustomGestureDown:(CGPoint)a3 onDisplay:(id)a4
{
  self->_inCustomGestureMovement = 1;
}

- (void)_handleRealCustomGestureMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v13];
  id v8 = [v7 fingerController];
  objc_msgSend(v8, "hndAbsoluteCentroidForMultifingers:", x, y);
  double v10 = v9;
  double v12 = v11;

  -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v13, 1, v10, v12);
}

- (void)_handleRealCustomGestureUp:(CGPoint)a3 onDisplay:(id)a4
{
  id v7 = a4;
  id v5 = (id)[(HNDHandManager *)self isPerformingGesture];
  id v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (self->_inCustomGestureMovement) {
      id v5 = [(HNDHandManager *)self _performCustomGestureOnDisplay:v7];
    }
    self->_inCustomGestureMovement = 0;
    id v6 = v7;
  }

  _objc_release_x1(v5, v6);
}

- (BOOL)_shouldEnableMultiTouchToolBackground
{
  BOOL v2 = [(HNDHandManager *)self deviceManager];
  if ([v2 deviceCount]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = _AXSAssistiveTouchScannerEnabled() == 0;
  }

  return v3;
}

- (void)_handleMultiTouchToolEvent:(id)a3
{
  id v4 = a3;
  id v19 = [(HNDHandManager *)self currentDisplayManager];
  if (([v19 fingerContentViewIsActive] & 1) == 0) {
    [v19 setFingerContentViewIsActive:1];
  }
  id v5 = [v4 handInfo];
  id v6 = [v5 paths];
  id v7 = [v6 firstPath];
  [v7 pathLocation];
  double v9 = v8;
  double v11 = v10;

  double v12 = [v4 handInfo];

  unsigned int v13 = [v12 eventType];
  switch(v13)
  {
    case 1u:
      if (!self->_resettingPinch)
      {
        if ([(HNDHandManager *)self inPinchMode])
        {
          id v15 = [v19 hardwareIdentifier];
          -[HNDHandManager _handleRealPinchToolDown:onDisplay:](self, "_handleRealPinchToolDown:onDisplay:", v15, v9, v11);
        }
        else if ([(HNDHandManager *)self inCustomGesture])
        {
          id v15 = [v19 hardwareIdentifier];
          -[HNDHandManager _handleRealCustomGestureDown:onDisplay:](self, "_handleRealCustomGestureDown:onDisplay:", v15, v9, v11);
        }
        else if ([(HNDHandManager *)self inDragMode])
        {
          id v15 = [v19 hardwareIdentifier];
          -[HNDHandManager _handleRealDragToolMove:onDisplay:](self, "_handleRealDragToolMove:onDisplay:", v15, v9, v11);
        }
        else
        {
          unsigned int v18 = [(HNDHandManager *)self inContinuousScrollMode];
          id v15 = [v19 hardwareIdentifier];
          if (v18) {
            -[HNDHandManager _handleRealContinuousScrollToolMove:onDisplay:](self, "_handleRealContinuousScrollToolMove:onDisplay:", v15, v9, v11);
          }
          else {
            -[HNDHandManager _handleRealMultiFingerDown:onDisplay:](self, "_handleRealMultiFingerDown:onDisplay:", v15, v9, v11);
          }
        }

        self->_isFingerDown = 1;
      }
      goto LABEL_36;
    case 2u:
      if ([(HNDHandManager *)self inPinchMode])
      {
        uint64_t v16 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealPinchToolMove:onDisplay:](self, "_handleRealPinchToolMove:onDisplay:", v16, v9, v11);
      }
      else if ([(HNDHandManager *)self inCustomGesture])
      {
        uint64_t v16 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealCustomGestureMove:onDisplay:](self, "_handleRealCustomGestureMove:onDisplay:", v16, v9, v11);
      }
      else if ([(HNDHandManager *)self inDragMode])
      {
        uint64_t v16 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealDragToolMove:onDisplay:](self, "_handleRealDragToolMove:onDisplay:", v16, v9, v11);
      }
      else if ([(HNDHandManager *)self inContinuousScrollMode])
      {
        uint64_t v16 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealContinuousScrollToolMove:onDisplay:](self, "_handleRealContinuousScrollToolMove:onDisplay:", v16, v9, v11);
      }
      else
      {
        if ([(HNDHandManager *)self inCustomGesture]) {
          goto LABEL_36;
        }
        uint64_t v16 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealMultiFingerMove:onDisplay:](self, "_handleRealMultiFingerMove:onDisplay:", v16, v9, v11);
      }

LABEL_36:

      return;
    case 6u:
    case 8u:
    case 9u:
      if ([(HNDHandManager *)self inPinchMode])
      {
        id v14 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealPinchToolUp:onDisplay:](self, "_handleRealPinchToolUp:onDisplay:", v14, v9, v11);
      }
      else if ([(HNDHandManager *)self inCustomGesture])
      {
        id v14 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealCustomGestureUp:onDisplay:](self, "_handleRealCustomGestureUp:onDisplay:", v14, v9, v11);
      }
      else if ([(HNDHandManager *)self inDragMode])
      {
        id v14 = [v19 hardwareIdentifier];
        -[HNDHandManager _handleRealDragToolUp:onDisplay:](self, "_handleRealDragToolUp:onDisplay:", v14, v9, v11);
      }
      else
      {
        unsigned int v17 = [(HNDHandManager *)self inContinuousScrollMode];
        id v14 = [v19 hardwareIdentifier];
        if (v17) {
          -[HNDHandManager _handleRealContinuousScrollToolUp:onDisplay:](self, "_handleRealContinuousScrollToolUp:onDisplay:", v14, v9, v11);
        }
        else {
          -[HNDHandManager _handleRealMultiFingerUp:onDisplay:](self, "_handleRealMultiFingerUp:onDisplay:", v14, v9, v11);
        }
      }

      self->_isFingerDown = 0;
      goto LABEL_36;
    default:
      goto LABEL_36;
  }
}

- (BOOL)_shouldHandleRealEventWithMultiTouchTool
{
  if ([(HNDHandManager *)self inCustomGesture]
    || [(HNDHandManager *)self inPinchMode]
    || [(HNDHandManager *)self inDragMode])
  {
    return 1;
  }
  id v5 = [(HNDHandManager *)self currentDisplayManager];
  id v6 = [v5 fingerController];
  BOOL v3 = (unint64_t)[v6 numberOfFingers] > 1;

  return v3;
}

- (void)pauseBubbleModeForSpecialUsageTool
{
  if ([(HNDHandManager *)self inBubbleMode])
  {
    [(HNDHandManager *)self enableBubbleMode:0];
  }
}

- (void)resumeBubbleModeForSpecialUsageToolIfNecessary
{
  if ([(HNDHandManager *)self shouldUseBubbleMode])
  {
    BOOL v3 = [(HNDHandManager *)self shouldUseBubbleMode];
    [(HNDHandManager *)self enableBubbleMode:v3];
  }
}

- (void)pauseEyeTrackingAutoHideForSpecialUsageTool
{
  if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled])
  {
    [(HNDHandManager *)self enableEyeTrackingAutoHide:0];
  }
}

- (void)resumeEyeTrackingAutoHideForSpecialUsageToolIfNecessary
{
  if ([(HNDHandManager *)self shouldUseEyeTrackingAutoHide])
  {
    BOOL v3 = [(HNDHandManager *)self shouldUseEyeTrackingAutoHide];
    [(HNDHandManager *)self enableEyeTrackingAutoHide:v3];
  }
}

- (void)specialToolUsageEnded:(BOOL)a3
{
  BOOL v3 = a3;
  currentCustomGesture = self->_currentCustomGesture;
  self->_currentCustomGesture = 0;

  self->_preparedScrollAction = 0;
  [(HNDHandManager *)self resumeBubbleModeForSpecialUsageToolIfNecessary];
  [(HNDHandManager *)self resumeEyeTrackingAutoHideForSpecialUsageToolIfNecessary];
  if ([(HNDHandManager *)self inDragMode])
  {
    id v6 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
    -[HNDHandManager endDragModeAtPoint:onDisplay:completed:](self, "endDragModeAtPoint:onDisplay:completed:", v6, 0, self->_dragStartPoint.x, self->_dragStartPoint.y);
  }
  if ([(HNDHandManager *)self inContinuousScrollMode])
  {
    id v7 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
    [(HNDHandManager *)self endContinuousScrollingOnDisplay:v7 withCompletion:0];
  }
  if ([(HNDHandManager *)self inPinchMode])
  {
    [(HNDHandManager *)self currentPointForPointer];
    double v9 = v8;
    double v11 = v10;
    double v12 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
    -[HNDHandManager _moveSystemPointerIfActiveToPoint:onDisplay:](self, "_moveSystemPointerIfActiveToPoint:onDisplay:", v12, v9, v11);
  }
  self->_pinchState = 0;
  self->_isPerformingDragPressEvent = 0;
  self->_inCustomGestureMovement = 0;
  self->_inMultiFingerGesture = 0;
  unsigned int v13 = AXLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Special tool usage ended", buf, 2u);
  }

  [(HNDHandManager *)self _systemPointerSettingsDidChange];
  if (v3 && (currentCustomGesture || [(HNDHandManager *)self dwellControlPaused]))
  {
    unsigned int v14 = [(HNDHandManager *)self dwellControlPaused];
    id v15 = (void *)AXAssistiveTouchIconTypeDwellPause;
    if (!v14) {
      id v15 = 0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002C118;
    v17[3] = &unk_1001AAC50;
    id v18 = v15;
    id v16 = v18;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v17];
  }
}

- (BOOL)usingSpecialTool
{
  if ([(HNDHandManager *)self inPinchMode]
    || self->_inMultiFingerGesture
    || self->_inCustomGestureMovement
    || [(HNDHandManager *)self inDragMode])
  {
    return 1;
  }

  return [(HNDHandManager *)self inContinuousScrollMode];
}

- (void)handleRealEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3200) {
    int v5 = sub_100041014();
  }
  else {
    int v5 = 0;
  }
  id v6 = +[SCATScannerManager sharedManager];
  unsigned __int8 v7 = [v6 isControllingOtherDevice];

  if ((v7 & 1) == 0 && (v5 & 1) == 0) {
    [(HNDHandManager *)self notifyUserEventOccurred];
  }
  double v8 = [(HNDHandManager *)self eventHandlers];
  if ([v4 type] == 3001
    && ([v4 isDisplayIntegrated] & 1) == 0)
  {
    double v9 = [v4 handInfo];
    double v10 = [v9 paths];
    if ([v10 count] != (id)1)
    {

      if (!v5) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    double v11 = [v4 handInfo];
    double v12 = [v11 paths];
    unsigned int v13 = [v12 objectAtIndexedSubscript:0];
    unsigned int v14 = [v13 transducerType];

    if (!v14) {
      goto LABEL_31;
    }
  }
  if (!v5) {
    goto LABEL_15;
  }
LABEL_12:
  id v15 = [(HNDHandManager *)self systemPointerController];
  unsigned __int8 v16 = [v15 handleEventRepresentationForMovement:v4];

  if (v16) {
    goto LABEL_31;
  }
LABEL_15:
  if (([v4 isSystemDrag] & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v8;
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v31;
      while (2)
      {
        id v21 = 0;
        do
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          if (objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v21), "handledEvent:", v4, (void)v30))
          {

            goto LABEL_31;
          }
          id v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    uint64_t v22 = [v4 handInfo];
    unsigned int v23 = [v22 eventType];

    unsigned int v24 = [(HNDHandManager *)self usingSpecialTool];
    if (v23 == 2) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = 0;
    }
    long long v26 = [(HNDHandManager *)self currentDisplayManager];
    if ([v26 handleRealEvent:v4])
    {

      if (!v25) {
        goto LABEL_31;
      }
    }
    else
    {
      unsigned int v27 = [(HNDHandManager *)self _shouldHandleRealEventWithMultiTouchTool];

      if (((v27 | v25) & 1) == 0) {
        goto LABEL_31;
      }
    }
    long long v28 = [(HNDHandManager *)self currentDisplayManager];
    unsigned __int8 v29 = [v28 isShowingVirtualTrackpad];

    if ((v29 & 1) == 0) {
      [(HNDHandManager *)self _handleMultiTouchToolEvent:v4];
    }
  }
LABEL_31:
}

- (void)ringerSwitchChanged
{
}

- (void)rotationLockChanged
{
}

- (void)substantialTransitionOccurred
{
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB650];
  if (!self->_isFingerDown)
  {
    self->_shouldSkipElementFetchForAXScroll = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002C538;
    v4[3] = &unk_1001AB678;
    void v4[4] = self;
    void v4[5] = a2;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  }
}

- (void)systemServerDied
{
}

- (BOOL)inRockerMode
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C8B0;
  v4[3] = &unk_1001AB2E0;
  void v4[4] = &v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)inPinchMode
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C9B8;
  v4[3] = &unk_1001AB2E0;
  void v4[4] = &v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)inDragMode
{
  return self->_inDragMode;
}

- (void)orientationChanged
{
  BOOL v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CAD4;
  block[3] = &unk_1001AAA90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)orientationChanged:(int64_t)a3
{
  uint64_t v5 = ASTLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int orientation = self->_orientation;
    v8[0] = 67109376;
    v8[1] = orientation;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Orientation changed via SpringBoard action handler: old %d new %ld", (uint8_t *)v8, 0x12u);
  }

  if ((unint64_t)(a3 - 1) < 4) {
    int v7 = a3;
  }
  else {
    int v7 = 0;
  }
  self->_int orientation = v7;
  [(HNDHandManager *)self _startOrientationUpdateTimer];
}

- (void)_startOrientationUpdateTimer
{
  orientationUpdateTimer = self->_orientationUpdateTimer;
  if (!orientationUpdateTimer)
  {
    id v4 = (AXDispatchTimer *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    uint64_t v5 = self->_orientationUpdateTimer;
    self->_orientationUpdateTimer = v4;

    orientationUpdateTimer = self->_orientationUpdateTimer;
  }
  [(AXDispatchTimer *)orientationUpdateTimer cancel];
  if (_AXSAssistiveTouchScannerEnabled())
  {
    double v6 = 0.05;
  }
  else
  {
    int v7 = [(HNDHandManager *)self mainDisplayManager];
    if ([v7 isMenuVisible]) {
      double v6 = 0.05;
    }
    else {
      double v6 = 0.28;
    }
  }
  char v8 = self->_orientationUpdateTimer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002CDE0;
  v9[3] = &unk_1001AAA90;
  v9[4] = self;
  [(AXDispatchTimer *)v8 afterDelay:v9 processBlock:v6];
}

- (void)resetNubbitLocation
{
}

- (void)mediaControlsChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002CEC0;
  v3[3] = &unk_1001AB6B8;
  BOOL v4 = a3;
  v3[4] = a2;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v3];
}

- (void)_attemptToShowVisualsAfterPerformingScreenshot
{
  BOOL v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t visualsHiddenForScreenshotCount = self->_visualsHiddenForScreenshotCount;
    *(_DWORD *)id buf = 134217984;
    unint64_t v10 = visualsHiddenForScreenshotCount;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempt to show visuals after performing screenshot. Hidden count: %lu", buf, 0xCu);
  }

  unint64_t v6 = self->_visualsHiddenForScreenshotCount;
  if (v6)
  {
    unint64_t v7 = v6 - 1;
    self->_unint64_t visualsHiddenForScreenshotCount = v7;
    if (!v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      _DWORD v8[2] = sub_10002D054;
      v8[3] = &unk_1001AB6D8;
      v8[4] = a2;
      [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v8];
    }
  }
}

- (void)_handleScreenshotDidFireCallbackTimeout
{
  if (self->_visualsHiddenForScreenshotCount)
  {
    BOOL v3 = ASTLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = 0x400C000000000000;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Took longer than %f seconds to show visuals again after taking screenshot. Showing them now.", (uint8_t *)&v4, 0xCu);
    }

    [(HNDHandManager *)self _attemptToShowVisualsAfterPerformingScreenshot];
  }
}

- (void)screenshotWillFire
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D340;
  v5[3] = &unk_1001AB700;
  v5[4] = &v6;
  v5[5] = a2;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v5];
  if (*((unsigned char *)v7 + 24))
  {
    ++self->_visualsHiddenForScreenshotCount;
    BOOL v3 = ASTLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unint64_t visualsHiddenForScreenshotCount = self->_visualsHiddenForScreenshotCount;
      *(_DWORD *)id buf = 134217984;
      unint64_t v11 = visualsHiddenForScreenshotCount;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Did hide visuals for screenshot. Count: %lu", buf, 0xCu);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_handleScreenshotDidFireCallbackTimeout" object:0];
    [(HNDHandManager *)self performSelector:"_handleScreenshotDidFireCallbackTimeout" withObject:0 afterDelay:3.5];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)screenshotDidFire
{
  char v2 = ASTLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Screenshot did fire.", buf, 2u);
  }

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)mediaPlaybackChanged
{
  int v4 = +[AXSystemAppServer server];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D5B8;
  v5[3] = &unk_1001AB750;
  v5[4] = self;
  v5[5] = a2;
  [v4 isMediaPlayingForApp:0 completionHandler:v5];
}

- (void)_modifyPinchToolMoveToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v66 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  uint64_t v8 = [v66 fingerController];
  char v9 = [v8 fingerModels];
  id v10 = [v9 count];

  if (v10 != (id)2) {
    _AXAssert();
  }
  unint64_t v11 = [v8 fingerModels];
  double v12 = [v11 objectAtIndexedSubscript:0];

  unsigned int v13 = [v8 fingerModels];
  unsigned int v14 = [v13 objectAtIndexedSubscript:1];

  [(AXPIFingerModel *)v12 location];
  double v16 = v15;
  double v18 = v17;
  [v14 location];
  double v20 = v19;
  double v22 = v21;
  unint64_t pinchMode = self->_pinchMode;
  if (pinchMode)
  {
    if (pinchMode == 1)
    {
      realSelectedPinchFinger = self->_realSelectedPinchFinger;
      if (!realSelectedPinchFinger) {
        realSelectedPinchFinger = v12;
      }
      double v42 = realSelectedPinchFinger;
      [(AXPIFingerModel *)v42 location];
      double v44 = y - v43;

      double v45 = -v44;
      if (v42 == v12) {
        double v45 = v44;
      }
      double v16 = v16 - v45;
      double v18 = v18 + v45;
      double v20 = v20 + v45;
      double v22 = v22 - v45;
    }
    else if (pinchMode == 2)
    {
      unsigned int v24 = self->_realSelectedPinchFinger;
      if (!v24) {
        unsigned int v24 = v12;
      }
      unsigned int v25 = v24;
      [(AXPIFingerModel *)v25 location];
      double v27 = x - v26;
      [(AXPIFingerModel *)v25 location];
      double v29 = y - v28;

      double v30 = -v27;
      double v31 = -v29;
      if (v25 == v12)
      {
        double v31 = v29;
        double v30 = v27;
      }
      double v16 = v16 + v30;
      double v18 = v18 + v31;
      double v20 = v20 - v30;
      double v22 = v22 - v31;
    }
    goto LABEL_33;
  }
  [v8 midpointForFingers];
  double v33 = v32;
  double v35 = v34;
  if (sub_100041014())
  {
    id v36 = [(HNDHandManager *)self deviceManager];
    unsigned int v37 = [v36 mainDeviceIsPointer];

    if (v37)
    {
      double v38 = self->_pinchRotatePreviousPoint.x;
      double v39 = self->_pinchRotatePreviousPoint.y;
      if (v38 == -1.0 && v39 == -1.0)
      {
        CGFloat v40 = CGPointZero.y;
      }
      else
      {
        double v46 = y - v39;
        double v64 = v46;
        if (x - v38 != 0.0 && v46 != 0.0) {
          goto LABEL_26;
        }
        objc_msgSend(v66, "screenBounds", *(void *)&v46);
        CGFloat v40 = -2.0;
        if (y > 2.0)
        {
          CGFloat v40 = 2.0;
          if (y < v47 + -2.0) {
            goto LABEL_26;
          }
        }
      }
      double v64 = v40;
LABEL_26:
      self->_pinchRotatePreviousPoint.double x = x;
      self->_pinchRotatePreviousPoint.double y = y;
      objc_msgSend(v66, "screenPoint", *(void *)&v64);
      double y = v65 + v48;
    }
  }
  double v49 = atan(y - v18) / -40.0;
  CGFloat v50 = self->_realSelectedPinchFinger;
  if (v50 != v12 && v50 != 0) {
    double v49 = -v49;
  }
  double v52 = v16 - v33;
  double v53 = v18 - v35;
  __double2 v54 = __sincos_stret(v49);
  double v16 = v33 + v54.__cosval * (v16 - v33) - v54.__sinval * v53;
  double v18 = v35 + v53 * v54.__cosval + v54.__sinval * v52;
  double v55 = v20 - v33;
  double v20 = v33 + v54.__cosval * (v20 - v33) - v54.__sinval * (v22 - v35);
  double v22 = v35 + (v22 - v35) * v54.__cosval + v54.__sinval * v55;
LABEL_33:
  AX_CGPointGetDistanceToPoint();
  double v57 = v56;
  [(HNDHandManager *)self _fingerRadiusOnDisplay:v7];
  double v59 = v58;

  if (v57 + v59 * -2.0 > 0.0)
  {
    [v8 beginUpdates];
    id v60 = [v8 fingerContainerView];
    [v60 bounds];
    v68.double x = v16;
    v68.double y = v18;
    BOOL v61 = CGRectContainsPoint(v70, v68);

    if (v61) {
      -[AXPIFingerModel setLocation:](v12, "setLocation:", v16, v18);
    }
    v62 = [v8 fingerContainerView];
    [v62 bounds];
    v69.double x = v20;
    v69.double y = v22;
    BOOL v63 = CGRectContainsPoint(v71, v69);

    if (v63) {
      objc_msgSend(v14, "setLocation:", v20, v22);
    }
    [v8 endUpdates];
    [(AXPIFingerModel *)v12 location];
    objc_msgSend(v66, "updateWithPrimaryFingerPoint:");
  }
}

- (void)addEventHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ([v4 conformsToProtocol:&OBJC_PROTOCOL___AXEventHandler] & 1) != 0)
  {
    [(HNDHandManager *)self eventHandlers];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          if (*(void **)(*((void *)&v16 + 1) + 8 * i) == v5)
          {

            _AXLogWithFacility();
            goto LABEL_23;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    if (!v6)
    {
      id v6 = +[NSPointerArray weakObjectsPointerArray];
      [(HNDHandManager *)self setEventHandlers:v6];
    }
    if ([v6 count] && (id v11 = objc_msgSend(v6, "count")) != 0)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      while (1)
      {
        unsigned int v14 = [v6 pointerAtIndex:v13];
        id v15 = [v14 priority];
        if (v15 > [v5 priority]) {
          break;
        }

        if (v12 == (id)++v13) {
          goto LABEL_18;
        }
      }
      [v6 insertPointer:v5 atIndex:v13];
    }
    else
    {
LABEL_18:
      [v6 addPointer:v5];
    }
    if ([v6 count]) {
      [(HNDHandManager *)self setCaptureEvents:1];
    }
LABEL_23:
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)removeEventHandler:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = [(HNDHandManager *)self eventHandlers];
    id v5 = [v4 count];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      while (1)
      {
        id v8 = [v4 pointerAtIndex:v7];
        if (v8 == v9) {
          break;
        }

        if (v6 == (id)++v7) {
          goto LABEL_9;
        }
      }
      [v4 removePointerAtIndex:v7];
    }
LABEL_9:
    if (![v4 count]) {
      [(HNDHandManager *)self setCaptureEvents:0];
    }
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)updateAllSettings
{
  id v5 = +[AXSettings sharedInstance];
  [v5 assistiveTouchSpeed];
  -[HNDHandManager setTouchSpeed:](self, "setTouchSpeed:");
  -[HNDHandManager setOpenMenuWithSwaggle:](self, "setOpenMenuWithSwaggle:", [v5 assistiveTouchOpenMenuSwaggleEnabled]);
  BOOL v3 = [v5 assistiveTouchCustomGestures];
  [(HNDHandManager *)self setCustomGestures:v3];

  [(HNDHandManager *)self updateMenuVisibility];
  [(HNDHandManager *)self updatePointerAppearance];
  id v4 = [(HNDHandManager *)self deviceManager];
  [v4 setDetectDevices:1];
}

- (void)updateMenuVisibility
{
  if (_AXSAssistiveTouchHardwareEnabled())
  {
    char v3 = 0;
  }
  else
  {
    id v4 = [(HNDHandManager *)self deviceManager];
    unsigned __int8 v5 = [v4 mainDeviceIsPointer];

    char v3 = v5 ^ 1;
  }
  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 assistiveTouchInternalOnlyHiddenNubbitModeEnabled];
  if ((v7 & 1) == 0 && (v3 & 1) == 0)
  {
    id v8 = +[AXSettings sharedInstance];
    unsigned int v7 = [v8 assistiveTouchAlwaysShowMenuEnabled] ^ 1;
  }
  id v9 = [(HNDHandManager *)self deviceManager];
  if ([v9 hidDeviceIsConfiguring])
  {
  }
  else
  {
    id v10 = [(HNDHandManager *)self deviceManager];
    unsigned int v11 = [v10 hidDeviceSentReservedStatus];

    if (!v11) {
      goto LABEL_13;
    }
  }
  id v12 = ASTLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Forcing menu to be hidden because HID device is configuring", (uint8_t *)v17, 2u);
  }

  unsigned int v7 = 1;
LABEL_13:
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    uint64_t v13 = [(HNDHandManager *)self mainDisplayManager];
    unsigned int v14 = [v13 isShowingCalibrationUI];

    if (v14)
    {
      id v15 = ASTLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Forcing menu to be hidden because On-Device Eye Tracking is calibrating", (uint8_t *)v17, 2u);
      }

      unsigned int v7 = 1;
    }
  }
  long long v16 = ASTLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17[0] = 67109120;
    v17[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Updating menu visibility: %d", (uint8_t *)v17, 8u);
  }

  [(HNDHandManager *)self setAlwaysShowMenu:v7 ^ 1];
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB770];
}

- (void)updateSoftwareKeyboardState
{
  char v3 = [(HNDHandManager *)self deviceManager];
  if (([v3 mainDeviceIsPointer] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v4 = [(HNDHandManager *)self deviceManager];
  unsigned __int8 v5 = [v4 deviceDetector];
  id v6 = [v5 attachedKeyboards];

  if (!v6)
  {
LABEL_6:
    [(AXUISoftwareKeyboardManager *)self->_softwareKeyboardManager removeReasonToEnableSoftwareKeyboard:@"AST HandManager"];
    goto LABEL_7;
  }
  unsigned int v7 = +[AXSettings sharedInstance];
  unsigned int v8 = [v7 assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled];

  softwareKeyboardManager = self->_softwareKeyboardManager;
  if (v8)
  {
    [(AXUISoftwareKeyboardManager *)softwareKeyboardManager addReasonToEnableSoftwareKeyboard:@"AST HandManager"];
LABEL_7:
    id v10 = self->_softwareKeyboardManager;
    [(AXUISoftwareKeyboardManager *)v10 removeReasonToDisableSoftwareKeyboard:@"AST HandManager"];
    return;
  }
  [(AXUISoftwareKeyboardManager *)softwareKeyboardManager removeReasonToEnableSoftwareKeyboard:@"AST HandManager"];
  unsigned int v11 = self->_softwareKeyboardManager;

  [(AXUISoftwareKeyboardManager *)v11 addReasonToDisableSoftwareKeyboard:@"AST HandManager"];
}

- (BOOL)nubbitVisible
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E3A0;
  v4[3] = &unk_1001AB2E0;
  void v4[4] = &v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)updatePointerAppearance
{
  [(HNDMousePointerAppearance *)self->_mousePointerAppearance sizeMultiplier];
  double v4 = v3;
  uint64_t v5 = +[AXSettings sharedInstance];
  [v5 assistiveTouchMousePointerSizeMultiplier];
  double v7 = vabdd_f64(v4, v6);

  if (v7 >= 2.22044605e-16)
  {
    char v8 = +[AXSettings sharedInstance];
    [v8 assistiveTouchMousePointerSizeMultiplier];
    -[HNDMousePointerAppearance setSizeMultiplier:](self->_mousePointerAppearance, "setSizeMultiplier:");
  }
  int64_t v9 = [(HNDMousePointerAppearance *)self->_mousePointerAppearance cursorColor];
  id v10 = +[AXSettings sharedInstance];
  id v11 = [v10 assistiveTouchMousePointerColor];

  if ((id)v9 == v11)
  {
    if (v7 < 2.22044605e-16) {
      return;
    }
  }
  else
  {
    id v12 = +[AXSettings sharedInstance];
    -[HNDMousePointerAppearance setCursorColor:](self->_mousePointerAppearance, "setCursorColor:", [v12 assistiveTouchMousePointerColor]);
  }

  [(HNDHandManager *)self reloadFingerAppearance];
}

- (double)touchSpeedMultiplier
{
  double touchSpeed = self->_touchSpeed;
  if (touchSpeed > 0.5) {
    return (touchSpeed + -0.5) * 5.0 + 1.0;
  }
  double result = 1.0;
  if (touchSpeed < 0.5) {
    return fmax(touchSpeed + touchSpeed, 0.1);
  }
  return result;
}

- (void)cancelCurrentGesture
{
}

- (BOOL)isPerformingGesture
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E6A0;
  v4[3] = &unk_1001AB2E0;
  void v4[4] = &v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)performPreparedGestureOnDisplay:(id)a3
{
  if (self->_currentCustomGesture) {
    [(HNDHandManager *)self _performCustomGestureOnDisplay:a3];
  }
}

- (id)_shiftGestureIfNeeded:(id)a3 onDisplay:(id)a4 toMidpoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if ([v9 shouldPerformAtOriginalLocation])
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v10];
    uint64_t v13 = [v12 fingerController];
    [v13 midpointOfStartingFingersForGesture:v9];
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v9, "gestureShiftedByOffset:", x - v15, y - v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v18 = v11;

  return v18;
}

- (void)_performCustomGestureOnDisplay:(id)a3
{
  id v4 = a3;
  if (![(HNDHandManager *)self inCustomGesture]) {
    _AXAssert();
  }
  if (self->_currentCustomGesture || (_AXAssert(), self->_currentCustomGesture))
  {
    [(HNDHandManager *)self pauseBubbleModeForSpecialUsageTool];
    [(HNDHandManager *)self pauseEyeTrackingAutoHideForSpecialUsageTool];
    uint64_t v5 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];
    [(HNDHandManager *)self currentPointForPointer];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    id v10 = -[HNDHandManager _shiftGestureIfNeeded:onDisplay:toMidpoint:](self, "_shiftGestureIfNeeded:onDisplay:toMidpoint:", self->_currentCustomGesture, v4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002EAB4;
    v20[3] = &unk_1001AB7B8;
    id v11 = v5;
    id v21 = v11;
    id v12 = v10;
    uint64_t v25 = v7;
    uint64_t v26 = v9;
    id v22 = v12;
    unsigned int v23 = self;
    id v13 = v4;
    id v24 = v13;
    double v14 = objc_retainBlock(v20);
    if ((self->_preparedScrollAction - 2006) <= 0x19
      && ((1 << (LOBYTE(self->_preparedScrollAction) + 42)) & 0x300000F) != 0
      && [v12 numberOfEvents]
      && ([v12 fingerIdentifiersAtEventIndex:0],
          double v15 = objc_claimAutoreleasedReturnValue(),
          id v16 = [v15 count],
          v15,
          v16)
      && ([v12 pointForFingerIdentifier:&off_1001BBB50 atEventIndex:0],
          -[HNDHandManager _performAXScrollActionAtPoint:onDisplay:action:](self, "_performAXScrollActionAtPoint:onDisplay:action:", v13, self->_preparedScrollAction)))
    {
      ((void (*)(void *))v14[2])(v14);
    }
    else
    {
      double v17 = [v11 fingerController];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10002EB54;
      v18[3] = &unk_1001AB1F8;
      long long v19 = v14;
      [v17 performGesture:v12 completion:v18];
    }
  }
}

- (BOOL)_shouldRepeatGesture
{
  double v3 = [(HNDHandManager *)self deviceManager];
  unsigned int v4 = [v3 mainDeviceIsPointer];

  if (v4)
  {
    BOOL v5 = [(HNDHandManager *)self dwellControlEnabled];
    if (v5)
    {
      if ([(HNDHandManager *)self dwellControlAutorevertEnabled]) {
        LOBYTE(v5) = 0;
      }
      else {
        LOBYTE(v5) = ![(HNDHandManager *)self dwellControlPaused];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isCapturingRealEvents
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002EC98;
  v4[3] = &unk_1001AB2E0;
  void v4[4] = &v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)prepareGesture:(id)a3 onDisplay:(id)a4
{
  uint64_t v25 = (AXNamedReplayableGesture *)a3;
  id v7 = a4;
  [(HNDHandManager *)self showMenu:0 onDisplay:v7];
  char v8 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  [v8 setMultiTouchToolBackgroundEnabled:1];
  [v8 setFingerContentViewIsActive:1];
  if (self->_currentCustomGesture != v25)
  {
    objc_storeStrong((id *)&self->_currentCustomGesture, a3);
    uint64_t v9 = v25;
    [(HNDHandManager *)self currentPointForPointer];
    double v11 = v10;
    double v13 = v12;
    if ([(HNDHandManager *)self shouldHideSystemPointerForFingersView]
      || ![(HNDHandManager *)self _isWaitingForFirstSystemPointerMovement])
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      if (v11 != CGPointZero.x || v13 != y)
      {
        uint64_t v17 = -[HNDHandManager _shiftGestureIfNeeded:onDisplay:toMidpoint:](self, "_shiftGestureIfNeeded:onDisplay:toMidpoint:", v9, v7, v11, v13);

        double x = v11;
        double y = v13;
        uint64_t v9 = (AXNamedReplayableGesture *)v17;
      }
    }
    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }
    long long v18 = [v8 fingerController];
    objc_msgSend(v18, "showStartingFingersForGesture:animated:startPointForAnimation:", v9, 1, x, y);

    long long v19 = [v8 fingerController];
    double v20 = [v19 fingerModels];
    id v21 = [v20 count];

    if (v21)
    {
      id v22 = [v8 fingerController];
      unsigned int v23 = [v22 fingerModels];
      id v24 = [v23 objectAtIndexedSubscript:0];
      [v24 location];
      objc_msgSend(v8, "updateWithPrimaryFingerPoint:");
    }
    [(HNDHandManager *)self pauseBubbleModeForSpecialUsageTool];
    [(HNDHandManager *)self pauseEyeTrackingAutoHideForSpecialUsageTool];
    [(HNDHandManager *)self _systemPointerSettingsDidChange];
  }
  [(HNDHandManager *)self setDwellMode:1];
}

- (void)_resetMenuOpenTracker
{
  xmmword_1001F09A8 = (__int128)CGPointZero;
  qword_1001EDBE0 = 0xC1E6CEAF20000000;
  qword_1001F09B8 = 0;
}

- (void)setCaptureEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HNDHandManager *)self eventManager];
  unsigned int v6 = [v5 isCapturingEvents];
  char v7 = v6;
  if (v3)
  {

    if (v7) {
      goto LABEL_9;
    }
LABEL_6:
    if (![(HNDHandManager *)self dwellControlEnabled])
    {
      uint64_t v5 = [(HNDHandManager *)self eventManager];
      [v5 setCaptureEvents:v3];
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_8:

    goto LABEL_9;
  }
  char v8 = [(HNDHandManager *)self eventHandlers];
  id v9 = [v8 count];

  if (!v9) {
    goto LABEL_6;
  }
LABEL_9:
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB7D8];
  if (sub_100041014()
    && _AXSAssistiveTouchEnabled()
    && !UIAccessibilityIsSwitchControlRunning()
    && ![(HNDHandManager *)self canShowASTMousePointer])
  {
    double v10 = [(HNDHandManager *)self systemPointerController];
    objc_msgSend(v10, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002F110;
    v11[3] = &unk_1001AB800;
    BOOL v12 = v3;
    v11[4] = self;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v11];
  }
}

- (void)setNubbitMoving:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HNDHandManager *)self eventManager];
  [v4 setNubbitMoving:v3];
}

- (BOOL)nubbitMoving
{
  char v2 = [(HNDHandManager *)self eventManager];
  unsigned __int8 v3 = [v2 nubbitMoving];

  return v3;
}

- (void)_menuOpenTracker:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(HNDHandManager *)self openMenuWithSwaggle]) {
    return;
  }
  double v6 = *(double *)&qword_1001EDBE0;
  if (*(double *)&qword_1001EDBE0 != -3061152000.0)
  {
    double v6 = CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001EDBE0;
    if (v6 > 5.0) {
      goto LABEL_9;
    }
  }
  char v7 = [(HNDHandManager *)self currentDisplayManager];
  [v7 screenBounds];
  double v11 = sub_100040D54(1, x, y, v8, v9, v10);
  double v13 = v12;

  if (*(double *)&xmmword_1001F09A8 == CGPointZero.x && *((double *)&xmmword_1001F09A8 + 1) == CGPointZero.y)
  {
    *(double *)&xmmword_1001F09A8 = v11;
    *((double *)&xmmword_1001F09A8 + 1) = v13;
    return;
  }
  if (vabdd_f64(*((double *)&xmmword_1001F09A8 + 1), v13) > 2.0)
  {
LABEL_9:
    [(HNDHandManager *)self _resetMenuOpenTracker];
    return;
  }
  double v15 = *(double *)&xmmword_1001F09A8 - v11;
  uint64_t v16 = qword_1001F09B8;
  if (!qword_1001F09B8 && fabs(v15) > 2.0)
  {
LABEL_16:
    qword_1001EDBE0 = CFAbsoluteTimeGetCurrent();
    uint64_t v16 = qword_1001F09B8;
LABEL_22:
    qword_1001F09B8 = ++v16;
    xmmword_1001F09A8 = (__int128)CGPointZero;
    byte_1001F09C0 = v15 < 0.0;
    goto LABEL_23;
  }
  if (byte_1001F09C0) {
    BOOL v17 = v15 <= 2.0;
  }
  else {
    BOOL v17 = v15 >= -2.0;
  }
  if (!v17)
  {
    if (qword_1001F09B8) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
LABEL_23:
  if (v16 == 3)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002F504;
    v18[3] = &unk_1001AAC50;
    void v18[4] = self;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v18];
    [(HNDHandManager *)self _resetMenuOpenTracker];
    qword_1001F09B8 = 0;
  }
}

+ (double)_displayCornerRadius
{
  char v2 = +[UIScreen mainScreen];
  unsigned __int8 v3 = [v2 traitCollection];
  [v3 displayCornerRadius];
  double v5 = v4;

  if (v5 == _UITraitCollectionDisplayCornerRadiusUnspecified)
  {
    double v6 = ASTLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Had unspecified display corner radius.", v8, 2u);
    }

    return 0.0;
  }
  return v5;
}

+ (CGPoint)_pointByAvoidingDisplayCornerRadius:(double)a3 forPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (a3 <= 0.0)
  {
    char v7 = ASTLogMouse();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100113EC4();
    }
  }
  double v8 = (void *)qword_1001F09C8;
  if (qword_1001F09C8) {
    BOOL v9 = *(double *)&qword_1001F09D0 == a3;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    uint64_t v10 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", -[HNDHandManager screenFrame:]_0());
    double v11 = (void *)qword_1001F09C8;
    qword_1001F09C8 = v10;

    qword_1001F09D0 = *(void *)&a3;
    double v8 = (void *)qword_1001F09C8;
  }
  if ((objc_msgSend(v8, "containsPoint:", x, y) & 1) == 0)
  {
    -[HNDHandManager screenFrame:]_0();
    AX_CGRectGetCenter();
    double v13 = v12;
    double v15 = v14;
    double v16 = -[HNDHandManager screenFrame:]_0();
    if (x <= v13) {
      double v20 = CGRectGetMinX(*(CGRect *)&v16) + a3;
    }
    else {
      double v20 = CGRectGetMaxX(*(CGRect *)&v16) - a3;
    }
    double v39 = v20;
    double v21 = -[HNDHandManager screenFrame:]_0();
    if (y <= v15) {
      double v25 = CGRectGetMinY(*(CGRect *)&v21) + a3;
    }
    else {
      double v25 = CGRectGetMaxY(*(CGRect *)&v21) - a3;
    }
    double v26 = atan2(y - v25, x - v39);
    double v27 = +[UIScreen mainScreen];
    [v27 scale];
    double v29 = v28;

    if (v29 <= 0.0)
    {
      double v30 = ASTLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100113E90();
      }
    }
    double v37 = x;
    double v38 = y;
    double v31 = sqrt((x - v39) * (x - v39) + (y - v25) * (y - v25));
    if (v29 >= 2.22044605e-16) {
      double v32 = 1.0 / v29;
    }
    else {
      double v32 = 1.0;
    }
    __sincos_stret(v26);
    while (1)
    {
      double v31 = v31 - v32;
      if (v31 <= 0.0) {
        break;
      }
      UIPointRoundToScale();
      double x = v33;
      double y = v34;
      if (objc_msgSend((id)qword_1001F09C8, "containsPoint:")) {
        goto LABEL_29;
      }
    }
    double x = v37;
    double y = v38;
  }
LABEL_29:
  double v35 = x;
  double v36 = y;
  result.double y = v36;
  result.double x = v35;
  return result;
}

- (void)setupWindow:(id)a3 ignoredWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FABC;
  block[3] = &unk_1001AAA90;
  block[4] = self;
  if (qword_1001F09D8 != -1) {
    dispatch_once(&qword_1001F09D8, block);
  }
  systemPointerController = self->_systemPointerController;
  BOOL v9 = [v6 screen];
  uint64_t v10 = [v9 displayConfiguration];
  double v11 = [v10 hardwareIdentifier];
  double v12 = [v6 screen];
  double v13 = [v12 displayIdentity];
  -[HNDSystemPointerController requestGlobalMouseEventsForDisplay:displayID:targetContextID:](systemPointerController, "requestGlobalMouseEventsForDisplay:displayID:targetContextID:", v11, [v13 displayID], objc_msgSend(v6, "_contextId"));

  double v14 = [[HNDDisplayManager alloc] initWithWindow:v6 ignoredWindow:v7];
  [(NSMutableArray *)self->_displayManagers addObject:v14];
  [(HNDDisplayManager *)v14 setAlwaysShowMenu:[(HNDHandManager *)self alwaysShowMenu]];
  [(HNDDisplayManager *)v14 setHandManager:self];
  double v15 = [v6 screen];
  double v16 = [v15 displayConfiguration];
  BOOL v17 = [v16 hardwareIdentifier];
  [(HNDDisplayManager *)v14 setHardwareIdentifier:v17];

  long long v18 = [v6 screen];
  long long v19 = +[UIScreen mainScreen];

  if (v18 == v19)
  {
    [(HNDDisplayManager *)v14 setIsMainDisplay:1];
    uint64_t orientation = self->_orientation;
  }
  else
  {
    uint64_t orientation = 1;
  }
  [(HNDDisplayManager *)v14 setOrientation:orientation withCompletion:0];
  double v21 = [(HNDDisplayManager *)v14 fingerController];
  [v21 setAppearanceDelegate:self];

  [(HNDDisplayManager *)v14 updateAutoHideMousePointer];
  [(HNDHandManager *)self restartEverything];
}

- (void)sceneDidConnect:(id)a3
{
  if (+[HNDAccessibilityManager accessibilityEnabled])
  {
    id v5 = +[HNDAccessibilityManager sharedManager];
    unsigned __int8 v3 = +[HNDHandManager sharedManager];
    double v4 = [v3 displayManagers];
    [v5 displaysDidChange:v4];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = sub_10002FD0C;
  double v16 = sub_10002FD1C;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10002FD24;
  v8[3] = &unk_1001AB828;
  id v4 = a3;
  uint64_t v10 = self;
  double v11 = &v12;
  id v9 = v4;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v8];
  [(NSMutableArray *)self->_displayManagers removeObject:v13[5]];
  if (+[HNDAccessibilityManager accessibilityEnabled])
  {
    id v5 = +[HNDAccessibilityManager sharedManager];
    id v6 = +[HNDHandManager sharedManager];
    id v7 = [v6 displayManagers];
    [v5 displaysDidChange:v7];
  }
  _Block_object_dispose(&v12, 8);
}

- (void)moveFingerByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    id v18 = [(HNDHandManager *)self currentDisplayManager];
    objc_msgSend(v18, "normalizedPointForDifference:", x, y);
    double v8 = v7;
    double v10 = v9;
    [v18 screenBounds];
    double v14 = sub_100040D54(0, v8, v10, v11, v12, v13);
    double v16 = v15;
    id v17 = [v18 hardwareIdentifier];
    -[HNDHandManager moveFingerToPoint:onDisplay:](self, "moveFingerToPoint:onDisplay:", v17, v14, v16);
  }
}

- (void)moveFingerToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
  -[HNDHandManager moveFingerToPoint:onDisplay:](self, "moveFingerToPoint:onDisplay:", v6, x, y);
}

- (void)moveFingerToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(HNDHandManager *)self inPinchMode]) {
    BOOL primaryButtonDown = self->_primaryButtonDown;
  }
  else {
    BOOL primaryButtonDown = 0;
  }
  [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100030600;
  v61[3] = &unk_1001AB850;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v62 = v9;
  BOOL v63 = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v61];
  [(id)objc_opt_class() _displayCornerRadius];
  if (v10 > 0.0)
  {
    double v11 = v10;
    double v12 = [(HNDHandManager *)self currentDisplayManager];
    unsigned int v13 = [v12 isMainDisplay];

    if (v13)
    {
      objc_msgSend((id)objc_opt_class(), "_pointByAvoidingDisplayCornerRadius:forPoint:", v11, x, y);
      double x = v14;
      double y = v15;
    }
  }
  [v9 screenBounds];
  double v19 = sub_100040D48(x, y, v16, v17, v18);
  double v21 = v20;
  objc_msgSend(v9, "convertToNormalizedInterfaceOrientation:", x, y);
  double v23 = v22;
  double v25 = v24;
  objc_msgSend(v9, "convertPointToPortraitUpOrientation:", x, y);
  -[HNDHandManager processPortraitUpPointForBubbleMode:onDisplay:](self, "processPortraitUpPointForBubbleMode:onDisplay:", v7);
  [v9 screenPoint];
  if (vabdd_f64(x, v26) >= 0.001)
  {
    BOOL v28 = 0;
  }
  else
  {
    [v9 screenPoint];
    BOOL v28 = vabdd_f64(y, v27) < 0.001;
  }
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000306AC;
  v58[3] = &unk_1001AB048;
  BOOL v59 = !v28;
  v58[4] = self;
  BOOL v60 = primaryButtonDown;
  double v29 = objc_retainBlock(v58);
  if ([(HNDHandManager *)self isPerformingGesture])
  {
    ((void (*)(void *))v29[2])(v29);
    goto LABEL_57;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [v9 point];
  BOOL v33 = v32 == -1.0 && v31 == -1.0;
  unsigned int v34 = objc_msgSend(v9, "hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:", !primaryButtonDown, v19, v21);
  if (v34 && CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001EDBE8 > 4.0)
  {
    double v35 = [(HNDHandManager *)self eventManager];
    [v35 wakeDeviceFromSleepIfNecessary];

    qword_1001EDBE8 = *(void *)&Current;
  }
  if (!self->_primaryButtonDown) {
    -[HNDHandManager _menuOpenTracker:](self, "_menuOpenTracker:", v19, v21);
  }
  if (primaryButtonDown)
  {
    -[HNDHandManager _modifyPinchToolMoveToPoint:onDisplay:](self, "_modifyPinchToolMoveToPoint:onDisplay:", v7, x, y);
    goto LABEL_43;
  }
  if ([(HNDHandManager *)self inDragMode] && self->_isDragNubbitMode)
  {
    -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v7, 1, x, y);
    if (sub_100041014()) {
      double v36 = 0.15;
    }
    else {
      double v36 = 0.0;
    }
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000306E0;
    v54[3] = &unk_1001AAFF8;
    id v55 = v9;
    double v56 = x;
    double v57 = y;
    +[UIView animateWithDuration:v54 animations:v36];
    double v37 = v55;
    goto LABEL_28;
  }
  if ([(HNDHandManager *)self inContinuousScrollMode])
  {
    -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v7, 1, x, y);
    -[HNDHandManager processOrientedPointForContinuousScrolling:onDisplay:](self, "processOrientedPointForContinuousScrolling:onDisplay:", v7, x, y);
    goto LABEL_43;
  }
  if ([(HNDHandManager *)self currentlySnappedInBubbleMode]) {
    goto LABEL_43;
  }
  unsigned int v38 = -[HNDHandManager _shouldLockIntoHotCornerAtNormalizedPoint:onDisplay:](self, "_shouldLockIntoHotCornerAtNormalizedPoint:onDisplay:", v7, v23, v25);
  if (-[HNDHandManager _shouldLockIntoNubbitAtPoint:](self, "_shouldLockIntoNubbitAtPoint:", x, y))
  {
    if (self->_hoverNubbitLocked) {
      goto LABEL_43;
    }
    self->_hoverNubbitLocked = 1;
    [v9 rockerFrame];
    AX_CGRectGetCenter();
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000306F0;
    v50[3] = &unk_1001AB878;
    void v50[4] = self;
    uint64_t v52 = v39;
    uint64_t v53 = v40;
    id v51 = v7;
    +[UIView animateWithDuration:v50 animations:0.15];
    double v37 = v51;
    goto LABEL_28;
  }
  if (self->_hoverNubbitLocked)
  {
    self->_hoverNubbitLocked = 0;
    double v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    double v44 = sub_100030704;
    double v45 = &unk_1001AB878;
    double v46 = self;
    double v48 = x;
    double v49 = y;
    id v47 = v7;
    +[UIView animateWithDuration:&v42 animations:0.15];
    double v37 = v47;
LABEL_28:

    goto LABEL_43;
  }
  if (v38)
  {
    if (!self->_hotCornerLocked) {
      -[HNDHandManager _lockIntoHotCornerForOrientedNormalizedPoint:onDisplay:cancelDwell:](self, "_lockIntoHotCornerForOrientedNormalizedPoint:onDisplay:cancelDwell:", v7, 1, v23, v25);
    }
  }
  else
  {
    if (self->_hotCornerLocked)
    {
      self->_hotCornerLocked = 0;
      [(HNDHandManager *)self cancelDwellTimer];
    }
    -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v7, 1, x, y);
  }
LABEL_43:
  -[HNDHandManager _updateZoomWithDisplayPoint:onDisplay:](self, "_updateZoomWithDisplayPoint:onDisplay:", objc_msgSend(v9, "displayID", v42, v43, v44, v45, v46), x, y);
  if ([(HNDHandManager *)self dwellControlEnabled]
    && -[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v7, x, y))
  {
    double v41 = [v9 rocker];
    [v41 highlightNubbit];

    [(HNDHandManager *)self _highlightFingers];
  }
  else
  {
    [(HNDHandManager *)self _fadeFingersAfterDelayIfNeeded];
  }
  if (!self->_primaryButtonDown)
  {
    if (Current - *(double *)&qword_1001EDBF0 > 1.0) {
      [(HNDHandManager *)self _resetMenuOpenTracker];
    }
    qword_1001EDBF0 = *(void *)&Current;
    if (v34) {
      goto LABEL_49;
    }
LABEL_53:
    if (!primaryButtonDown || v33) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  if (!v34) {
    goto LABEL_53;
  }
LABEL_49:
  [(HNDHandManager *)self _updateEyeTrackingAutoHideIfNecessary];
LABEL_54:
  ((void (*)(void *))v29[2])(v29);
LABEL_55:
  if ((primaryButtonDown | v34) == 1) {
    [(HNDHandManager *)self notifyUserEventOccurred];
  }
LABEL_57:
}

- (void)_lockIntoHotCornerForOrientedNormalizedPoint:(CGPoint)a3 onDisplay:(id)a4 cancelDwell:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  self->_hotCornerLocked = 1;
  if (v5) {
    [(HNDHandManager *)self cancelDwellTimer];
  }
  [(HNDHandManager *)self _highlightFingers];
  -[HNDHandManager _pointForLockedCorner:onDisplay:](self, "_pointForLockedCorner:onDisplay:", -[HNDHandManager _hotCornerForNormalizedPoint:onDisplay:](self, "_hotCornerForNormalizedPoint:onDisplay:", v9, x, y), v9);
  -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:](self, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:", v9, 1);
}

- (BOOL)_shouldLockIntoNubbitAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
  if (-[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v6, x, y))
  {
    id v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v6];
    if ([v7 isMenuVisible])
    {
      unsigned __int8 v8 = 0;
    }
    else
    {
      id v9 = [(HNDHandManager *)self deviceManager];
      unsigned __int8 v8 = [v9 mainDeviceIsMotionTracker];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (CGRect)_paddedHitboxForNubbitOnDisplay:(id)a3 activationFactor:(double)a4
{
  id v4 = -[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", a3, a4);
  BOOL v5 = [v4 rocker];
  [v5 alpha];
  double v7 = fabs(v6);

  if (v7 >= 1.0)
  {
    [v4 rockerFrame];
    CGRect v17 = CGRectInset(v16, v16.size.width * -0.18, v16.size.height * -0.18);
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  [(HNDHandManager *)self _defaultNubbitHitboxActivationFactor];
  -[HNDHandManager _paddedHitboxForNubbitOnDisplay:activationFactor:](self, "_paddedHitboxForNubbitOnDisplay:activationFactor:", v7);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v24.origin.CGFloat x = v9;
  v24.origin.CGFloat y = v11;
  v24.size.CGFloat width = v13;
  v24.size.CGFloat height = v15;
  if (CGRectIsNull(v24)) {
    return 0;
  }
  CGFloat v17 = v9;
  CGFloat v18 = v11;
  CGFloat v19 = v13;
  CGFloat v20 = v15;
  CGFloat v21 = x;
  CGFloat v22 = y;

  return CGRectContainsPoint(*(CGRect *)&v17, *(CGPoint *)&v21);
}

- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4 activationFactor:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HNDHandManager *)self _paddedHitboxForNubbitOnDisplay:a4 activationFactor:a5];
  CGFloat v7 = v19.origin.x;
  CGFloat v8 = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (CGRectIsNull(v19)) {
    return 0;
  }
  CGFloat v12 = v7;
  CGFloat v13 = v8;
  CGFloat v14 = width;
  CGFloat v15 = height;
  CGFloat v16 = x;
  CGFloat v17 = y;

  return CGRectContainsPoint(*(CGRect *)&v12, *(CGPoint *)&v16);
}

- (double)_defaultNubbitHitboxActivationFactor
{
  return 0.35;
}

- (void)_updateZoomWithDisplayPoint:(CGPoint)a3 onDisplay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  if (_AXSZoomTouchEnabled())
  {
    CGFloat v7 = +[ZoomServices sharedInstance];
    [v7 zoomLevelOnDisplay:v4];
    double v9 = fabs(v8 + -1.0);

    if (v9 >= 2.22044605e-16 && (sub_100041014() & 1) == 0)
    {
      double v10 = +[AXSettings sharedInstance];
      id v11 = [v10 assistiveTouchMouseZoomPanningStyle];

      id v12 = +[ZoomServices sharedInstance];
      objc_msgSend(v12, "autoPanZoomUsingLocation:withPanningStyle:onDisplay:", v11, v4, x, y);
    }
  }
}

- (void)_showFingersIfNeededForMouseOnDisplay:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:");
  BOOL v5 = [v4 fingerController];

  if (-[HNDHandManager mouseBehavesLikeFinger](self, "mouseBehavesLikeFinger") && ![v5 numberOfFingers]) {
    [(HNDHandManager *)self resetFingersIfNeededOnDisplay:v6];
  }
}

- (void)_dwellTimerFired
{
  unsigned __int8 v3 = [(HNDHandManager *)self currentDisplayManager];
  if ([(HNDHandManager *)self inBubbleMode]
    && [(HNDHandManager *)self currentlySnappedInBubbleMode])
  {
    if (!AXDeviceSupportsOnDeviceEyeTracking()
      || (+[AXSettings sharedInstance],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          unsigned int v5 = [v4 assistiveTouchMouseOnDeviceEyeTrackingEnabled],
          v4,
          !v5))
    {
      [(HNDHandManager *)self activateCurrentBubbleModeFocusedElement];
      goto LABEL_23;
    }
    if (![(HNDHandManager *)self isCurrentlySelectingKeyboardKey])
    {
      id v6 = +[AXSettings sharedInstance];
      if ([v6 assistiveTouchEyeTrackingUseZoomForKeyboardKeys])
      {
        CGFloat v7 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
        unsigned int v8 = [v7 isKeyboardKey];

        if (v8)
        {
          [v3 setNeedsToShowZoomWindow:1];
          [(HNDHandManager *)self setCurrentlySelectingKeyboardKey:1];
        }
      }
      else
      {
      }
    }
    unsigned int v23 = [v3 needsToShowZoomWindow];
    [v3 showZoomWindow];
    if (([v3 needsToShowZoomWindow] & 1) == 0)
    {
      [(HNDHandManager *)self activateCurrentBubbleModeFocusedElement];
      [(HNDHandManager *)self setCurrentlySelectingKeyboardKey:0];
    }
    goto LABEL_21;
  }
  double v9 = [v3 fingerController];
  id v10 = [v9 numberOfFingers];

  if (!v10) {
    goto LABEL_23;
  }
  [(HNDHandManager *)self setCurrentlySelectedKeyboardRow:0];
  if (!self->_hotCornerLocked)
  {
    CGFloat v21 = +[AXSettings sharedInstance];
    unsigned int v22 = [v21 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

    if (!v22)
    {
      double v25 = [v3 hardwareIdentifier];
      [(HNDHandManager *)self _performDwellActionOnDisplay:v25];

      goto LABEL_23;
    }
    unsigned int v23 = [v3 needsToShowZoomWindow];
    [v3 showZoomWindow];
    if (([v3 needsToShowZoomWindow] & 1) == 0)
    {
      CGRect v24 = [v3 hardwareIdentifier];
      [(HNDHandManager *)self _performDwellActionOnDisplay:v24];
    }
LABEL_21:
    if (v23) {
      [v3 setNeedsToShowZoomWindow:0];
    }
    goto LABEL_23;
  }
  id v11 = [v3 fingerController];
  id v12 = [v11 fingerModels];
  CGFloat v13 = [v12 objectAtIndexedSubscript:0];
  [v13 location];
  objc_msgSend(v3, "convertToNormalizedInterfaceOrientation:");
  double v15 = v14;
  double v17 = v16;

  CGFloat v18 = [v3 hardwareIdentifier];
  unint64_t v19 = -[HNDHandManager _hotCornerForNormalizedPoint:onDisplay:](self, "_hotCornerForNormalizedPoint:onDisplay:", v18, v15, v17);

  if (v19)
  {
    self->_hotCornerLocked = 0;
    CGFloat v20 = [v3 hardwareIdentifier];
    [(HNDHandManager *)self _performActionForHotCorner:v19 onDisplay:v20];
  }
LABEL_23:
  if ([(HNDHandManager *)self eyeTrackingAutoHideEnabled])
  {
    [(HNDHandManager *)self setEyeTrackingAutoHideFinished:0];
    if (![(HNDHandManager *)self hidePointerForEyeTrackingAutoHide]
      && ([v3 isMenuVisible] & 1) == 0)
    {
      [(HNDHandManager *)self setHidePointerForEyeTrackingAutoHide:1];
      [(HNDHandManager *)self _hideCursorsForEyeTrackingAutoHide];
    }
  }
  if ([(HNDHandManager *)self inBubbleMode]) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)_performDwellActionOnDisplay:(id)a3
{
  id v5 = AXAssistiveTouchIconTypeDwellClick;
  id v6 = a3;
  [(HNDHandManager *)self currentPointForPointer];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v6];
  unsigned __int8 v12 = -[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v6, v8, v10);

  if ((v12 & 1) != 0 || self->_hoverNubbitLocked || [v11 isMenuVisible])
  {
    if ([v11 isMenuVisible])
    {
      CGFloat v13 = (id *)&AXAssistiveTouchIconTypeMousePrimaryClick;
    }
    else if (self->_isDragNubbitMode)
    {
      CGFloat v13 = (id *)&AXAssistiveTouchIconTypeMoveMenu;
    }
    else
    {
      CGFloat v13 = (id *)&AXAssistiveTouchIconTypeOpenMenu;
    }
    id v14 = *v13;

    id v5 = v14;
  }
  [(HNDHandManager *)self _handleAction:v5 type:4 state:2];
  -[HNDHandManager moveFingerByDelta:](self, "moveFingerByDelta:", 0.25, 0.25);
  [(HNDHandManager *)self setIsDwellActionPendingButtonUp:1];
  id v15 = v5;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_initializeDwell
{
  self->_lastDwellStartPoint = (CGPoint)HNDPointNull;
  self->_dwellMode = 1;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB898];

  [(HNDHandManager *)self _resetDwellModeToDefault];
}

- (void)_resetDwellDueToFingersReset
{
  [(HNDHandManager *)self setDwellMode:[(HNDHandManager *)self _defaultDwellMode]];
  unsigned int v3 = [(HNDHandManager *)self dwellControlPaused];
  uint64_t v4 = (id *)&AXAssistiveTouchIconTypeDwellPause;
  if (!v3) {
    uint64_t v4 = (id *)&AXAssistiveTouchIconTypeDwellClick;
  }
  id v5 = *v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000312AC;
  v7[3] = &unk_1001AAC50;
  id v8 = v5;
  id v6 = v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v7];
}

- (void)_resetDwellModeToDefault
{
  [(HNDHandManager *)self setDwellMode:[(HNDHandManager *)self _defaultDwellMode]];
  if ([(HNDHandManager *)self dwellControlAutorevertEnabled])
  {
    unsigned int v3 = +[AXSettings sharedInstance];
    uint64_t v4 = [v3 assistiveTouchMouseDwellControlAutorevertAction];

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000313D0;
    v6[3] = &unk_1001AAC50;
    id v7 = v4;
    id v5 = v4;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v6];
  }
  else if ([(HNDHandManager *)self dwellControlPaused])
  {
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB8B8];
  }
}

- (unint64_t)_defaultDwellMode
{
  if (![(HNDHandManager *)self dwellControlAutorevertEnabled]) {
    return [(HNDHandManager *)self dwellControlPaused] ^ 1;
  }
  unsigned int v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 assistiveTouchMouseDwellControlAutorevertAction];

  if ([v4 isEqualToString:AXAssistiveTouchIconTypeDwellClick])
  {

    return 1;
  }
  unsigned __int8 v6 = [v4 isEqualToString:AXAssistiveTouchIconTypeDwellPause];

  if (v6) {
    return 0;
  }
  else {
    return [(HNDHandManager *)self dwellControlPaused] ^ 1;
  }
}

- (void)_performActionForHotCorner:(unint64_t)a3 onDisplay:(id)a4
{
  id v8 = a4;
  unsigned __int8 v6 = +[HNDHandManager _actionForHotCorner:a3];
  if (v6)
  {
    id v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v8];
    [v7 activateAssistiveTouchAction:v6 fromButtonPress:0];
  }
}

+ (id)_actionForHotCorner:(unint64_t)a3
{
  uint64_t v4 = +[AXSettings sharedInstance];
  id v5 = [v4 assistiveTouchMouseDwellControlCornerCustomization];

  unint64_t v6 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v6) & 1) != 0)
  {
    id v7 = [v5 objectForKey:*(void *)*(&off_1001ABC48 + v6)];
  }
  else
  {
    id v7 = @"__NONE__";
  }
  if ([(__CFString *)v7 isEqualToString:@"__NONE__"]) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }

  return v8;
}

- (unint64_t)_cornerForNormalizedPoint:(CGPoint)a3 normalizedPadding:(CGSize)a4
{
  if (a3.x < a4.width && a3.y < a4.height) {
    return 1;
  }
  if (a3.x > 1.0 - a4.width && a3.y < a4.height) {
    return 2;
  }
  double v6 = 1.0 - a4.height;
  if (a3.x < a4.width && a3.y > v6) {
    return 4;
  }
  if (a3.y <= v6 || a3.x <= 1.0 - a4.width) {
    return 0;
  }
  else {
    return 8;
  }
}

- (CGSize)_hotCornerActivationSizeOnDisplay:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDHandManager *)self deviceManager];
  unsigned int v6 = [v5 mainDeviceIsMotionTracker];

  if (v6) {
    double v7 = dbl_100197680[!self->_hotCornerLocked];
  }
  else {
    double v7 = 0.01;
  }
  [(id)objc_opt_class() _displayCornerRadius];
  if (v8 <= 0.0)
  {
    double v15 = v7;
  }
  else
  {
    double v9 = v8 - sqrt(v8 * v8 * 0.5);
    double v10 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];
    objc_msgSend(v10, "convertToNormalizedInterfaceOrientation:", v9, v9);
    double v12 = v11;
    double v14 = v13;

    double v15 = v7 + v14;
    double v7 = v7 + v12;
  }

  double v16 = v7;
  double v17 = v15;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (unint64_t)_hotCornerForNormalizedPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(HNDHandManager *)self _fingerRadiusOnDisplay:v7];
  double v9 = v8;
  double v10 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  objc_msgSend(v10, "convertToNormalizedInterfaceOrientation:", v9, v9);
  double v12 = v11;
  double v14 = v13;

  [(HNDHandManager *)self _hotCornerActivationSizeOnDisplay:v7];
  double v16 = v15;
  double v18 = v17;

  return -[HNDHandManager _cornerForNormalizedPoint:normalizedPadding:](self, "_cornerForNormalizedPoint:normalizedPadding:", x, y, v12 + v16, v14 + v18);
}

- (unint64_t)_roundedCornersForCursorAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_hotCornerLocked
    && ([(HNDHandManager *)self displayManagerForHardwareIdentifier:v7],
        double v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "convertToNormalizedInterfaceOrientation:", x, y),
        unint64_t v9 = -[HNDHandManager _hotCornerForNormalizedPoint:onDisplay:](self, "_hotCornerForNormalizedPoint:onDisplay:", v7), v8, v10 = v9 - 1, v9 - 1 <= 7)&& ((0x8Bu >> v10) & 1) != 0)
  {
    unint64_t v11 = qword_1001976A0[v10];
  }
  else
  {
    unint64_t v11 = -1;
  }

  return v11;
}

- (BOOL)_shouldLockIntoHotCornerAtNormalizedPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(HNDHandManager *)self dwellControlEnabled])
  {
    [(HNDHandManager *)self _hotCornerActivationSizeOnDisplay:v7];
    unint64_t v10 = +[HNDHandManager _actionForHotCorner:](HNDHandManager, "_actionForHotCorner:", -[HNDHandManager _cornerForNormalizedPoint:normalizedPadding:](self, "_cornerForNormalizedPoint:normalizedPadding:", x, y, v8, v9));
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (CGPoint)_pointForLockedCorner:(unint64_t)a3 onDisplay:(id)a4
{
  id v6 = a4;
  id v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v6];
  [(HNDHandManager *)self _fingerRadiusOnDisplay:v6];
  double y = v8;

  [v7 screenBounds];
  double MaxX = CGRectGetMaxX(v18);
  [v7 screenBounds];
  CGFloat MaxY = CGRectGetMaxY(v19);
  double v12 = MaxX - y;
  double v13 = MaxY - y;
  CGFloat x = y;
  switch(a3)
  {
    case 1uLL:
      break;
    case 2uLL:
      CGFloat x = v12;
      break;
    case 4uLL:
      CGFloat x = y;
      goto LABEL_6;
    case 8uLL:
      CGFloat x = v12;
LABEL_6:
      double y = v13;
      break;
    default:
      _AXAssert();
      CGFloat x = CGPointZero.x;
      double y = CGPointZero.y;
      break;
  }

  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.CGFloat x = v15;
  return result;
}

- (BOOL)inCustomGesture
{
  return self->_currentCustomGesture != 0;
}

- (id)_avPlayerForSound:(id)a3
{
  id v4 = a3;
  avPlayers = self->_avPlayers;
  if (!avPlayers)
  {
    id v6 = (NSMutableDictionary *)[objc_allocWithZone((Class)NSMutableDictionary) init];
    id v7 = self->_avPlayers;
    self->_avPlayers = v6;

    avPlayers = self->_avPlayers;
  }
  id v8 = [(NSMutableDictionary *)avPlayers objectForKey:v4];
  if (!v8)
  {
    double v9 = +[NSBundle mainBundle];
    unint64_t v10 = [v4 stringByDeletingPathExtension];
    BOOL v11 = [v4 pathExtension];
    double v12 = [v9 URLForResource:v10 withExtension:v11];

    id v8 = [objc_allocWithZone((Class)AVAudioPlayer) initWithContentsOfURL:v12 error:0];
    [(NSMutableDictionary *)self->_avPlayers setObject:v8 forKey:v4];
  }

  return v8;
}

- (BOOL)_isPoint:(CGPoint)a3 withinTolerance:(double)a4 ofStartPoint:(CGPoint)a5
{
  BOOL v6 = vabdd_f64(a3.x, a5.x) < a4;
  double v5 = vabdd_f64(a3.y, a5.y);
  return v6 && v5 < a4;
}

- (BOOL)_isWithinLastDwellBounds:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = +[AXSettings sharedInstance];
  [v6 assistiveTouchMouseDwellControlMovementToleranceRadius];
  LOBYTE(self) = -[HNDHandManager _isPoint:withinTolerance:ofStartPoint:](self, "_isPoint:withinTolerance:ofStartPoint:", x, y, v7, self->_lastDwellStartPoint.x, self->_lastDwellStartPoint.y);

  return (char)self;
}

- (void)enableEyeTrackingAutoHide:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(HNDHandManager *)self eyeTrackingAutoHideEnabled];
  BOOL v6 = !v3;
  unsigned int v7 = !v3 & v5;
  [(HNDHandManager *)self setEyeTrackingAutoHideEnabled:v3];
  id v8 = AXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = [(HNDHandManager *)self eyeTrackingAutoHideEnabled];
    CFStringRef v10 = @"NO";
    if (v9) {
      CFStringRef v10 = @"YES";
    }
    int v11 = 138412290;
    CFStringRef v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "enableEyeTrackingAutoHide: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    [(HNDHandManager *)self setHidePointerForEyeTrackingAutoHide:0];
    [(HNDHandManager *)self setEyeTrackingAutoHideFinished:1];
    if ([(HNDHandManager *)self dwellControlEnabled])
    {
      -[HNDHandManager setEyeTrackingAutotHideLastPointCursorShowed:](self, "setEyeTrackingAutotHideLastPointCursorShowed:", -1.0, -1.0);
      [(HNDHandManager *)self setEyeTrackingAutotHideLastBubbleModeElementShowed:0];
    }
  }
  [(HNDHandManager *)self resetFingersIfNeeded];
  if (((v6 | v5) & 1) == 0) {
    [(HNDHandManager *)self _highlightFingers];
  }
  [(HNDHandManager *)self _systemPointerSettingsDidChange];
}

- (void)_updateEyeTrackingAutoHideIfNecessary
{
  if (![(HNDHandManager *)self shouldUseEyeTrackingAutoHide]
    || ![(HNDHandManager *)self eyeTrackingAutoHideEnabled])
  {
    return;
  }
  dwellTimer = self->_dwellTimer;
  unsigned int v4 = dwellTimer ? [(AXDispatchTimer *)dwellTimer isCancelled] ^ 1 : 0;
  unsigned int v5 = [(HNDHandManager *)self dwellBubbleModeTimer];
  if (v5)
  {
    BOOL v6 = [(HNDHandManager *)self dwellBubbleModeTimer];
    unsigned int v7 = [v6 isCancelled] ^ 1;
  }
  else
  {
    unsigned int v7 = 0;
  }

  int v8 = v4 | v7;
  unsigned int v9 = [(HNDHandManager *)self eyeTrackingAutoHideCursorAnimator];
  if (v9)
  {
    CFStringRef v10 = [(HNDHandManager *)self eyeTrackingAutoHideCursorAnimator];
    BOOL v11 = [v10 state] == (id)1;
  }
  else
  {
    BOOL v11 = 0;
  }

  if ([(HNDHandManager *)self eyeTrackingAutoHideFinished] & v8) {
    return;
  }
  if ([(HNDHandManager *)self inBubbleMode])
  {
    unsigned int v12 = [(HNDHandManager *)self currentlySnappedInBubbleMode];
    if ([(HNDHandManager *)self inBubbleMode])
    {
      unsigned __int8 v13 = [(HNDHandManager *)self currentlySnappedInBubbleMode];
      if (v12) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    if (v12)
    {
LABEL_22:
      double v14 = [(HNDHandManager *)self eyeTrackingAutotHideLastBubbleModeElementShowed];
      if (v14)
      {
        double v15 = [(HNDHandManager *)self eyeTrackingAutotHideLastBubbleModeElementShowed];
        double v16 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
        unsigned int v17 = [v15 isEqual:v16] ^ 1;
      }
      else
      {
        unsigned int v17 = 1;
      }

      unsigned int v38 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
      if (v38) {
        unsigned int v19 = 1;
      }
      else {
        unsigned int v19 = [(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit];
      }

      if (v17)
      {
        uint64_t v39 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
        [(HNDHandManager *)self setEyeTrackingAutotHideLastBubbleModeElementShowed:v39];
      }
      -[HNDHandManager setEyeTrackingAutotHideLastPointCursorShowed:](self, "setEyeTrackingAutotHideLastPointCursorShowed:", -1.0, -1.0);
      goto LABEL_46;
    }
  }
  else if ([(HNDHandManager *)self inBubbleMode])
  {
    unsigned __int8 v13 = [(HNDHandManager *)self currentlySnappedInBubbleMode];
LABEL_19:
    if ((v13 & 1) == 0) {
      [(HNDHandManager *)self setEyeTrackingAutotHideLastBubbleModeElementShowed:0];
    }
  }
  CGRect v18 = [(HNDHandManager *)self currentDisplayManager];
  unsigned int v19 = [v18 isMenuVisible];
  CGFloat v20 = [v18 fingerController];
  if (![v20 numberOfFingers]) {
    goto LABEL_36;
  }
  CGFloat v21 = [v20 fingerModels];
  unsigned int v22 = [v21 objectAtIndexedSubscript:0];
  [v22 location];
  double v24 = v23;
  double v26 = v25;

  double v27 = [v18 hardwareIdentifier];
  unsigned int v28 = -[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v27, v24, v26)
      ? 1
      : [v18 isMenuVisible];
  unsigned int v19 = (v28 | v19) != 0;

  if ([(HNDHandManager *)self dwellControlEnabled])
  {
    double v29 = +[AXSettings sharedInstance];
    [v29 assistiveTouchMouseDwellControlMovementToleranceRadius];
    double v31 = v30;
  }
  else
  {
    double v31 = kAXSAssistiveTouchEyeTrackingAutoHideMovementToleranceRadiusDefault;
  }
  [(HNDHandManager *)self eyeTrackingAutotHideLastPointCursorShowed];
  unsigned int v34 = -[HNDHandManager _isPoint:withinTolerance:ofStartPoint:](self, "_isPoint:withinTolerance:ofStartPoint:", v24, v26, v31, v32, v33);
  [(HNDHandManager *)self eyeTrackingAutotHideLastPointCursorShowed];
  BOOL v37 = v36 == -1.0 && v35 == -1.0;
  if (v37 || !v34)
  {
    -[HNDHandManager setEyeTrackingAutotHideLastPointCursorShowed:](self, "setEyeTrackingAutotHideLastPointCursorShowed:", v24, v26);
    unsigned int v17 = 1;
  }
  else
  {
LABEL_36:
    unsigned int v17 = 0;
  }

LABEL_46:
  if (![(HNDHandManager *)self hidePointerForEyeTrackingAutoHide]
    && v17
    && ((![(HNDHandManager *)self dwellControlEnabled] | v8 | v11 | v19) & 1) == 0)
  {
    [(HNDHandManager *)self setHidePointerForEyeTrackingAutoHide:1];
    [(HNDHandManager *)self _hideCursorsForEyeTrackingAutoHide];
  }
  if ((v19 | v17) == 1)
  {
    uint64_t v40 = [(HNDHandManager *)self eyeTrackingAutoHideCursorAnimator];

    if (v40)
    {
      double v41 = [(HNDHandManager *)self eyeTrackingAutoHideCursorAnimator];
      [v41 stopAnimation:1];

      [(HNDHandManager *)self setEyeTrackingAutoHideCursorAnimator:0];
      [(HNDHandManager *)self _hideCursorsForEyeTrackingAutoHide];
    }
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000322B8;
    v46[3] = &unk_1001AB8E0;
    void v46[4] = self;
    double v42 = objc_retainBlock(v46);
    if (v19)
    {
      [(HNDHandManager *)self _showCursorsForAutoHideWithDuration:0];
      ((void (*)(void *, void))v42[2])(v42, 0);
    }
    else if (v17)
    {
      [(HNDHandManager *)self eyeTrackingAutoHideTimeout];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000323E8;
      v45[3] = &unk_1001AB908;
      v45[4] = self;
      v45[5] = 0x3FD999999999999ALL;
      double v44 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0x10000 delay:v45 options:v42 animations:0.4 completion:v43];
      [(HNDHandManager *)self setEyeTrackingAutoHideCursorAnimator:v44];
    }
  }
}

- (void)_hideCursorsForEyeTrackingAutoHide
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000324B8;
  v2[3] = &unk_1001AAC50;
  v2[4] = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v2];
}

- (void)_showCursorsForAutoHideWithDuration:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000325AC;
  v4[3] = &unk_1001AB850;
  unsigned int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(HNDHandManager *)v5 enumerateDisplayManagersWithBlock:v4];
}

- (void)_startDwellTimer
{
  if (![(HNDHandManager *)self eyeTrackingAutoHideEnabled]
    || [(HNDHandManager *)self eyeTrackingAutoHideFinished])
  {
    if ([(HNDHandManager *)self inBubbleMode]
      && [(HNDHandManager *)self currentlySnappedInBubbleMode])
    {
      id v3 = [(HNDHandManager *)self dwellBubbleModeTimer];
      if (v3)
      {
        unsigned int v4 = [(HNDHandManager *)self dwellBubbleModeTimer];
        unsigned int v5 = [v4 isCancelled] ^ 1;
      }
      else
      {
        unsigned int v5 = 0;
      }

      unsigned int v7 = [(HNDHandManager *)self _startDwellTimerForBubbleMode];
    }
    else
    {
      dwellTimer = self->_dwellTimer;
      if (dwellTimer) {
        unsigned int v5 = [(AXDispatchTimer *)dwellTimer isCancelled] ^ 1;
      }
      else {
        unsigned int v5 = 0;
      }
      unsigned int v7 = [(HNDHandManager *)self _startDwellTimerForPointer];
    }
    unsigned int v8 = v7;
    if ([(HNDHandManager *)self eyeTrackingAutoHideFinished] && v5 && v8)
    {
      [(HNDHandManager *)self setEyeTrackingAutoHideFinished:0];
      [(HNDHandManager *)self cancelDwellTimer];
    }
  }
}

- (BOOL)_startDwellTimerForPointer
{
  id v3 = [(HNDHandManager *)self currentDisplayManager];
  unsigned int v4 = [v3 fingerController];
  if (![v4 numberOfFingers]) {
    goto LABEL_19;
  }
  unsigned int v5 = [v4 fingerModels];
  id v6 = [v5 objectAtIndexedSubscript:0];
  [v6 location];
  double v8 = v7;
  double v10 = v9;

  BOOL v11 = self->_lastDwellStartPoint.x == -1.0 && self->_lastDwellStartPoint.y == -1.0;
  if ((v11 || !-[HNDHandManager _isWithinLastDwellBounds:](self, "_isWithinLastDwellBounds:", v8, v10))
    && ([(HNDHandManager *)self cancelDwellTimer],
        [(HNDHandManager *)self dwellControlEnabled])
    && (([v3 hardwareIdentifier],
         unsigned int v12 = objc_claimAutoreleasedReturnValue(),
         !-[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v12, v8, v10))
      ? (unsigned __int8 v13 = [v3 isMenuVisible])
      : (unsigned __int8 v13 = 1),
        (v12, ![(HNDHandManager *)self dwellControlPaused])
     || (v13 & 1) != 0
     || self->_hotCornerLocked))
  {
    if (([v3 fingerContentViewIsActive] & 1) == 0)
    {
      double v14 = ASTLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100113EF8();
      }
    }
    self->_lastDwellStartPoint.double x = v8;
    self->_lastDwellStartPoint.double y = v10;
    double v15 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    dwellTimer = self->_dwellTimer;
    self->_dwellTimer = v15;

    objc_initWeak(&location, self);
    unsigned int v17 = self->_dwellTimer;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100032994;
    v20[3] = &unk_1001AB1D0;
    id v21 = v4;
    objc_copyWeak(&v22, &location);
    [(AXDispatchTimer *)v17 afterDelay:v20 processBlock:0 cancelBlock:0.25];
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
    BOOL v18 = 1;
  }
  else
  {
LABEL_19:
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_startDwellTimerForBubbleMode
{
  id v3 = [(HNDHandManager *)self currentDisplayManager];
  unsigned int v4 = [(HNDHandManager *)self lastBubbleModeDwellElement];
  if (v4)
  {
    unsigned int v5 = [(HNDHandManager *)self lastBubbleModeDwellElement];
    id v6 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
    unsigned int v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned int v7 = 0;
  }

  double v8 = [(HNDHandManager *)self lastBubbleModeDwellRockerItem];
  if (v8)
  {
    double v9 = [(HNDHandManager *)self lastBubbleModeDwellRockerItem];
    double v10 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
    unsigned int v11 = [v9 isEqual:v10];
  }
  else
  {
    unsigned int v11 = 0;
  }

  unsigned int v12 = [(HNDHandManager *)self lastBubbleModeDwellWasOnNubbit];
  if (v12) {
    LOBYTE(v12) = [(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit];
  }
  BOOL v13 = 0;
  if (((v7 | v11) & 1) == 0 && (v12 & 1) == 0)
  {
    [(HNDHandManager *)self cancelDwellTimer];
    if ([(HNDHandManager *)self dwellControlEnabled]
      && (([(HNDHandManager *)self bubbleModeFocusedRockerItem],
           (double v14 = objc_claimAutoreleasedReturnValue()) == 0)
        ? (unsigned __int8 v15 = [(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit])
        : (unsigned __int8 v15 = 1),
          (v14, ![(HNDHandManager *)self dwellControlPaused])
       || (v15 & 1) != 0
       || self->_hotCornerLocked))
    {
      double v16 = [(HNDHandManager *)self currentBubbleModeFocusedElement];
      [(HNDHandManager *)self setLastBubbleModeDwellElement:v16];

      unsigned int v17 = [(HNDHandManager *)self bubbleModeFocusedRockerItem];
      [(HNDHandManager *)self setLastBubbleModeDwellRockerItem:v17];

      [(HNDHandManager *)self setLastBubbleModeDwellWasOnNubbit:[(HNDHandManager *)self bubbleModeCurrentlyFocusedOnNubbit]];
      id v18 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
      [(HNDHandManager *)self setDwellBubbleModeTimer:v18];

      objc_initWeak(&location, self);
      unsigned int v19 = [(HNDHandManager *)self dwellBubbleModeTimer];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100032DB4;
      v21[3] = &unk_1001AB958;
      id v22 = v3;
      unsigned __int8 v24 = v15;
      objc_copyWeak(&v23, &location);
      [v19 afterDelay:v21 processBlock:0 cancelBlock:0.25];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (void)cancelDwellTimer
{
  if ([(HNDHandManager *)self inBubbleMode]
    && [(HNDHandManager *)self currentlySnappedInBubbleMode])
  {
    [(HNDHandManager *)self cancelDwellTimerForBubbleMode];
  }
  else
  {
    [(HNDHandManager *)self cancelDwellTimerForPointer];
  }
  if (sub_100041014())
  {
    id v3 = [(HNDHandManager *)self systemPointerController];
    objc_msgSend(v3, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));
  }
}

- (void)cancelDwellTimerForPointer
{
  self->_lastDwellStartPoint = (CGPoint)HNDPointNull;
  [(AXDispatchTimer *)self->_dwellTimer cancel];

  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB978];
}

- (void)cancelDwellTimerForBubbleMode
{
  [(HNDHandManager *)self setLastBubbleModeDwellElement:0];
  [(HNDHandManager *)self setLastBubbleModeDwellRockerItem:0];
  [(HNDHandManager *)self setLastBubbleModeDwellWasOnNubbit:0];

  [(HNDHandManager *)self cancelDwellTimerWithoutStateResetForBubbleMode];
}

- (void)cancelDwellTimerWithoutStateResetForBubbleMode
{
  id v3 = [(HNDHandManager *)self dwellBubbleModeTimer];
  [v3 cancel];

  id v4 = [(HNDHandManager *)self currentDisplayManager];
  [v4 cancelDwellOnBubbleCursor];
}

- (void)prepareForHIDDeviceConfiguration
{
  id v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Preparing for HID device configuration", v4, 2u);
  }

  [(HNDHandManager *)self setLastTimeEyeTrackerConfigured:mach_absolute_time()];
  [(HNDHandManager *)self hideUIForEyeTracker];
}

- (BOOL)shouldIgnorePointerEventWhileEyeTrackerConfigures:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HNDHandManager *)self mainDisplayManager];
  unsigned __int8 v6 = [v5 isShowingCalibrationUI];

  if (v6) {
    goto LABEL_2;
  }
  double v8 = [(HNDHandManager *)self deviceManager];
  unsigned int v9 = [v8 hidDeviceIsConfiguring];

  if (!v9) {
    goto LABEL_7;
  }
  mach_absolute_time();
  [(HNDHandManager *)self lastTimeEyeTrackerConfigured];
  if ((double)(unint64_t)AXMachTimeToNanoseconds() / 1000000000.0 < 0.5
    || ([v4 deltaX], v10 == 0.0) && (objc_msgSend(v4, "deltaY"), v11 == 0.0))
  {
LABEL_2:
    BOOL v7 = 1;
  }
  else
  {
LABEL_7:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldIgnorePointerEventWhileEyeTrackerIsInactive
{
  id v3 = [(HNDHandManager *)self deviceManager];
  if ([v3 mainDeviceIsMotionTracker])
  {
    id v4 = [(HNDHandManager *)self deviceManager];
    unsigned __int8 v5 = [v4 isTrackingInputActive];

    if ((v5 & 1) == 0)
    {
      unsigned __int8 v6 = [(HNDHandManager *)self systemPointerController];
      BOOL v7 = [v6 currentSystemPointerPointAttributes];
      [v7 unacceleratedRelativePosition];
      double v9 = v8;
      double v11 = v10;

      if (CGPointZero.x == v9 && CGPointZero.y == v11) {
        return 1;
      }
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)shouldIgnorePointerEventWhileEyeTrackerPressedButtonDownWithDwell
{
  id v3 = [(HNDHandManager *)self deviceManager];
  if (([v3 mainDeviceIsMotionTracker] & 1) == 0)
  {

    return 0;
  }
  id v4 = [(HNDHandManager *)self deviceManager];
  unsigned int v5 = [v4 isTrackingInputActive];

  if (!v5) {
    return 0;
  }
  if ([(HNDHandManager *)self isDwellActionPendingButtonUp]) {
    return 1;
  }

  return [(HNDHandManager *)self isPendingFingerLiftForPrimaryButtonPressUp];
}

- (void)didCompleteHIDDeviceConfiguration
{
  id v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HID device configuration complete", v4, 2u);
  }

  [(HNDHandManager *)self showUIForEyeTracker];
}

- (void)hideUIForEyeTracker
{
  id v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Preparing to hide UI for eye tracker", v9, 2u);
  }

  unsigned int v5 = [(HNDHandManager *)self currentDisplayManager];
  [(HNDHandManager *)self setCaptureEvents:0];
  [(HNDHandManager *)self cancelDwellTimer];
  [(HNDHandManager *)self specialToolUsageEnded:1];
  unsigned __int8 v6 = [v5 hardwareIdentifier];
  -[HNDHandManager resetFingersToPoint:onDisplay:active:](self, "resetFingersToPoint:onDisplay:active:", v6, 0, -1.0, -1.0);

  BOOL v7 = NSStringFromSelector(a2);
  [v5 setVisualsHidden:1 forReason:v7 animated:1];

  if ([(HNDHandManager *)self inBubbleMode])
  {
    [v5 hideBubbleCursor];
    [(HNDHandManager *)self setCurrentBubbleModeFocusedElement:0];
    [(HNDHandManager *)self setLastBubbleModeFocusedElement:0];
    [(HNDHandManager *)self setBubbleModeFocusedRockerItem:0];
    [(HNDHandManager *)self setBubbleModeCurrentlyFocusedOnNubbit:0];
  }
  double v8 = [(HNDHandManager *)self systemPointerController];
  objc_msgSend(v8, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));
}

- (void)showUIForEyeTracker
{
  id v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Preparing to show UI for eye tracker", v8, 2u);
  }

  unsigned int v5 = [(HNDHandManager *)self currentDisplayManager];
  if ([v5 visualsHidden])
  {
    unsigned __int8 v6 = NSStringFromSelector(a2);
    [v5 setVisualsHidden:0 forReason:v6 animated:1];
  }
  if ([(HNDHandManager *)self inBubbleMode]) {
    [v5 showBubbleCursor];
  }
  [(HNDHandManager *)self resetFingersIfNeeded];
  BOOL v7 = [(HNDHandManager *)self systemPointerController];
  objc_msgSend(v7, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));
}

- (BOOL)shouldIgnoreHIDDeviceMovementWhileMouseActive
{
  return (double)(unint64_t)AXMachTimeToNanoseconds() / 1000000000.0 < 0.5;
}

- (void)mouseEventRecordedWithDelta:(CGPoint)a3
{
  if (a3.x < 0.0 || a3.x > 0.0 || a3.y != 0.0)
  {
    [(HNDHandManager *)self setLastTimeMouseMoved:mach_absolute_time()];
    [(HNDHandManager *)self setLastMoveWasMouse:1];
  }
}

- (BOOL)_shouldAutoFadeFingersOnDisplay:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HNDHandManager *)self deviceManager];
  if ([v5 mainDeviceIsMotionTracker]
    && [(HNDHandManager *)self dwellControlEnabled]
    && [(HNDHandManager *)self dwellControlPaused])
  {
    unsigned __int8 v6 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];
    BOOL v7 = ([v6 isMenuVisible] & 1) == 0 && !self->_hotCornerLocked;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_fadedFingersShouldShowOutlines
{
  if ([(HNDDwellPointerAppearance *)self->_dwellPointerAppearance cursorColor] < 2) {
    return 0;
  }
  char v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchIdleOpacity];
  BOOL v4 = fabs(v3 + -0.15) >= 0.001;

  return v4;
}

- (void)_updateFadedFingerOpacity
{
  if (self->_fingersFaded) {
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB998];
  }
}

- (void)_fadeFingersAfterDelayIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100033990;
  v2[3] = &unk_1001AAC50;
  v2[4] = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v2];
}

- (void)_fadeFingersAfterDelayIfNeededOnDisplay:(id)a3
{
  id v4 = a3;
  if (!self->_fingersFaded
    && ([(AXDispatchTimer *)self->_fingerFadeTimer isPending] & 1) == 0)
  {
    if ([(HNDHandManager *)self _shouldAutoFadeFingersOnDisplay:v4])
    {
      unsigned int v5 = +[AXSettings sharedInstance];
      [v5 assistiveTouchIdleOpacity];
      double v7 = v6;

      if (v7 < 1.0)
      {
        fingerFadeTimer = self->_fingerFadeTimer;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100033AE8;
        v9[3] = &unk_1001AAC78;
        v9[4] = self;
        id v10 = v4;
        [(AXDispatchTimer *)fingerFadeTimer afterDelay:v9 processBlock:4.0];
      }
    }
  }
}

- (void)_highlightFingers
{
  [(AXDispatchTimer *)self->_fingerFadeTimer cancel];
  self->_fingersFaded = 0;
  if (![(HNDDwellPointerAppearance *)self->_dwellPointerAppearance shouldShowFingerOutlines]
    || ![(HNDDwellPointerAppearance *)self->_dwellPointerAppearance shouldShowInnerCircle])
  {
    [(HNDDwellPointerAppearance *)self->_dwellPointerAppearance setShouldShowFingerOutlines:1];
    [(HNDDwellPointerAppearance *)self->_dwellPointerAppearance setShouldShowInnerCircle:1];
    [(HNDHandManager *)self reloadFingerAppearance];
  }
  double v3 = [(HNDHandManager *)self currentDisplayManager];
  id v4 = [v3 fingerController];

  unsigned int v5 = [v4 fingerContainerView];
  [v5 alpha];
  double v7 = v6;

  if (v7 < 1.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_100033D94;
    v8[3] = &unk_1001AAA90;
    id v9 = v4;
    +[UIView animateWithDuration:v8 animations:0.15];
  }
}

- (void)_dwellControlToggled
{
  double v3 = +[AXSettings sharedInstance];
  -[HNDHandManager setAssistiveTouchMouseDwellControlEnabled:](self, "setAssistiveTouchMouseDwellControlEnabled:", [v3 assistiveTouchMouseDwellControlEnabled]);

  [(HNDHandManager *)self cancelDwellTimer];
  [(HNDHandManager *)self updateMenuVisibility];
  [(HNDHandManager *)self _presentMigrationPopupIfNeeded];
  [(HNDHandManager *)self resetFingersIfNeeded];
  if (![(HNDHandManager *)self dwellControlEnabled])
  {
    [(HNDHandManager *)self _highlightFingers];
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001AB9B8];
  }

  [(HNDHandManager *)self _systemPointerSettingsDidChange];
}

- (void)_presentMigrationPopupIfNeeded
{
  if ([(HNDHandManager *)self assistiveTouchMouseDwellControlEnabled])
  {
    char v2 = +[AXSettings sharedInstance];
    unsigned int v3 = [v2 assistiveTouchEnabled];

    if (v3)
    {
      id v4 = +[AXSettings sharedInstance];
      unsigned int v5 = [v4 assistiveTouchMainScreenCustomization];

      double v6 = +[AXSettings sharedInstance];
      double v7 = [v6 assistiveTouchMainScreenDefaultCustomization];

      unsigned int v8 = [v5 isEqualToDictionary:v7];
      id v9 = +[AXSettings sharedInstance];
      unsigned __int8 v10 = [v9 assistiveTouchMouseDwellControlMutatedMenu];

      if (!v8 || (v10 & 1) != 0)
      {
        double v16 = +[AXSettings sharedInstance];
        unsigned int v17 = [v16 assistiveTouchMouseDwellControlShowPrompt];

        if (!v17) {
          goto LABEL_27;
        }
        id v18 = +[AXSettings sharedInstance];
        [v18 setAssistiveTouchMouseDwellControlShowPrompt:0];

        unsigned int v19 = [v5 allValues];
        unsigned int v20 = [v19 containsObject:AXAssistiveTouchIconTypeDwell];

        id v21 = [v5 allValues];
        unsigned __int8 v22 = [v21 containsObject:AXAssistiveTouchIconTypeScroll];

        if (v20)
        {
          if (v22) {
            goto LABEL_27;
          }
        }
        BOOL v23 = (v20 & 1) == 0 && (unint64_t)[v5 count] < 8;
        unsigned int v24 = 19;
        unsigned int v25 = 20;
        if (v22)
        {
          BOOL v26 = 0;
          char v27 = v23;
        }
        else
        {
          id v28 = [v5 count];
          unint64_t v29 = 7;
          if (!v23) {
            unint64_t v29 = 8;
          }
          BOOL v30 = (unint64_t)v28 < v29;
          char v27 = v23 || (unint64_t)v28 < v29;
          BOOL v26 = v23 && v30;
          if (v30) {
            unsigned int v25 = 22;
          }
          else {
            unsigned int v25 = 20;
          }
          if (v30) {
            unsigned int v24 = 21;
          }
          else {
            unsigned int v24 = 19;
          }
        }
        char v31 = v27 & 1;
        if (v23) {
          uint64_t v32 = v25;
        }
        else {
          uint64_t v32 = v24;
        }
        double v33 = +[AXSpringBoardServer server];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000341D4;
        v34[3] = &unk_1001AB9E0;
        char v36 = v31;
        BOOL v37 = v26;
        BOOL v38 = v23;
        id v35 = v5;
        [v33 showAlert:v32 withHandler:v34];

        double v11 = v35;
      }
      else
      {
        v39[0] = AXAssistiveTouchIconTypeDwell;
        v39[1] = AXAssistiveTouchIconTypeScroll;
        double v11 = +[NSArray arrayWithObjects:v39 count:2];
        unsigned int v12 = AXAssistiveTouchInsertIconsIntoDictionary();
        BOOL v13 = +[AXSettings sharedInstance];
        [v13 setAssistiveTouchMainScreenCustomization:v12];

        double v14 = +[AXSettings sharedInstance];
        [v14 setAssistiveTouchMouseDwellControlMutatedMenu:1];

        unsigned __int8 v15 = +[AXSettings sharedInstance];
        [v15 setAssistiveTouchMouseDwellControlShowPrompt:0];
      }
LABEL_27:
    }
  }
}

- (void)_setApplicationAccessibilityEnabledIfNeeded
{
  if (!_AXSApplicationAccessibilityEnabled())
  {
    char v2 = +[AXSettings sharedInstance];
    unsigned int v3 = [v2 assistiveTouchMainScreenCustomization];

    id v4 = AXAssistiveTouchScrollIcons();
    uint64_t v5 = [v4 arrayByAddingObject:AXAssistiveTouchIconTypeScroll];

    double v6 = [v3 allValues];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100034444;
    v10[3] = &unk_1001ABA08;
    id v7 = (id)v5;
    id v11 = v7;
    LOBYTE(v5) = objc_msgSend(v6, "ax_containsObjectUsingBlock:", v10);

    if ((v5 & 1) != 0
      || (+[AXSettings sharedInstance],
          unsigned int v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 assistiveTouchBubbleModeEnabled],
          v8,
          v9))
    {
      _AXSSetAccessibilityEnabled();
      _AXSApplicationAccessibilitySetEnabled();
    }
  }
}

- (BOOL)dwellControlEnabled
{
  BOOL v3 = [(HNDHandManager *)self canShowASTMousePointer];
  if (v3)
  {
    LOBYTE(v3) = [(HNDHandManager *)self assistiveTouchMouseDwellControlEnabled];
  }
  return v3;
}

- (BOOL)dwellControlAutorevertEnabled
{
  char v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchMouseDwellControlAutorevertEnabled];

  return v3;
}

- (void)setDwellControlAutorevertEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchMouseDwellControlAutorevertEnabled:v3];
}

- (void)setDwellMode:(unint64_t)a3
{
  if (self->_dwellMode != a3)
  {
    self->_dwellMode = a3;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:&stru_1001ABA28];
  }
}

- (BOOL)dwellControlPaused
{
  return self->_dwellMode == 0;
}

- (void)setDwellControlPaused:(BOOL)a3
{
  if (a3)
  {
    [(HNDHandManager *)self specialToolUsageEnded:0];
    [(HNDHandManager *)self setDwellMode:0];
    [(HNDHandManager *)self _fadeFingersAfterDelayIfNeeded];
  }
  else
  {
    if (![(HNDHandManager *)self dwellControlEnabled])
    {
      id v4 = +[AXSettings sharedInstance];
      [v4 setAssistiveTouchMouseDwellControlEnabled:1];
    }
    [(HNDHandManager *)self setDwellMode:1];
    [(HNDHandManager *)self _highlightFingers];
  }
}

- (BOOL)_isWaitingForFirstSystemPointerMovement
{
  if (sub_100041014())
  {
    BOOL v3 = [(HNDHandManager *)self deviceManager];
    if (![v3 mainDeviceIsPointer])
    {
      BOOL v7 = 0;
LABEL_9:

      return v7;
    }
    id v4 = [(HNDHandManager *)self systemPointerController];

    if (v4)
    {
      BOOL v3 = [(HNDHandManager *)self systemPointerController];
      [v3 currentSystemPointerPoint];
      BOOL v7 = v6 == -1.0 && v5 == -1.0;
      goto LABEL_9;
    }
  }
  return 0;
}

- (CGPoint)currentPointForPointer
{
  double v3 = -1.0;
  double v4 = -1.0;
  if (sub_100041014())
  {
    if (![(HNDHandManager *)self shouldHideSystemPointerForFingersView])
    {
      uint64_t v5 = [(HNDHandManager *)self systemPointerController];
      if (v5)
      {
        double v6 = (void *)v5;
        unsigned __int8 v7 = [(HNDHandManager *)self _isWaitingForFirstSystemPointerMovement];

        if ((v7 & 1) == 0)
        {
          unsigned int v8 = [(HNDHandManager *)self systemPointerController];
          [v8 currentSystemPointerPoint];
          double v3 = v9;
          double v4 = v10;
        }
      }
    }
  }
  id v11 = [(HNDHandManager *)self currentDisplayManager];
  unsigned int v12 = v11;
  if (v3 == -1.0 && v4 == -1.0)
  {
    double v14 = [v11 fingerController];
    if ([v14 numberOfFingers])
    {
      unsigned __int8 v15 = [v12 fingerController];
      [v15 midpointForFingers];
      double v3 = v16;
      double v4 = v17;
    }
    else
    {
      double v4 = -1.0;
      double v3 = -1.0;
    }
  }
  if (v3 == -1.0 && v4 == -1.0)
  {
    [v12 screenPoint];
    double v3 = v19;
    double v4 = v20;
  }

  double v21 = v3;
  double v22 = v4;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (id)currentHardwareIdentifierForPointer
{
  char v2 = [(HNDHandManager *)self systemPointerController];
  double v3 = [v2 currentSystemPointerHardwareIdentifier];

  return v3;
}

- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5
{
  return 0;
}

- (void)handleButtonEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASTLogMouse();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100113F38((uint64_t)v4, v5);
  }

  [(HNDHandManager *)self cancelDwellTimer];
  unsigned int v6 = [v4 type];
  if (v6 == 2)
  {
    uint64_t v7 = 3;
  }
  else
  {
    if ([v4 type] != 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 2;
  }
  unsigned int v8 = [v4 actionOverride];
  if (![v8 length])
  {
    [v4 buttonNumber];
    double v9 = AXAssistiveTouchDefaultIconTypeForMouseButton();

    if (sub_100041014())
    {
      [v4 buttonNumber];
      unsigned int v8 = AXAssistiveTouchDefaultLaserIconTypeForMouseButton();
    }
    else
    {
      unsigned int v8 = v9;
    }
  }
  if ((uint64_t)[v4 buttonNumber] > 3) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = (uint64_t)[v4 buttonNumber];
  }
  if (v6 == 2)
  {
    [(HNDHandManager *)self _handleAction:v8 type:v10 state:v7];
    [(HNDHandManager *)self _fadeFingersAfterDelayIfNeeded];
  }
  else
  {
    [(HNDHandManager *)self _highlightFingers];
    [(HNDHandManager *)self _handleAction:v8 type:v10 state:v7];
  }

LABEL_18:
}

- (void)_handleAction:(id)a3 type:(int)a4 state:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v19 = a3;
  if ([v19 isEqualToString:AXAssistiveTouchIconTypeMousePrimaryClick])
  {
    if (![(HNDHandManager *)self dwellControlEnabled]
      || [(HNDHandManager *)self dwellControlAutorevertEnabled]
      || [(HNDHandManager *)self dwellControlPaused])
    {
      if (sub_100041014()
        && ![(HNDHandManager *)self shouldHideSystemPointerForFingersView])
      {
        [(HNDHandManager *)self handleLaserPrimaryButtonPress:v5];
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    double v14 = self->_currentCustomGesture;
    currentCustomGesture = self->_currentCustomGesture;
    self->_currentCustomGesture = 0;

    if (self->_inDragMode && self->_dragStartPoint.x == -1.0 && self->_dragStartPoint.y == -1.0)
    {
      self->_inDragMode = 0;
      [(HNDHandManager *)self handlePrimaryButtonPress:v5];
      self->_inDragMode = 1;
    }
    else
    {
      [(HNDHandManager *)self handlePrimaryButtonPress:v5];
    }
    id v18 = self->_currentCustomGesture;
    self->_currentCustomGesture = v14;
  }
  else
  {
    if ([v19 isEqualToString:AXAssistiveTouchIconTypeDwellClick])
    {
LABEL_9:
      [(HNDHandManager *)self handlePrimaryButtonPress:v5];
      goto LABEL_10;
    }
    if ([v19 isEqualToString:AXAssistiveTouchIconTypeHome])
    {
      [(HNDHandManager *)self handleCustomHomeButtonAction:v5];
      goto LABEL_10;
    }
    if (![v19 isEqualToString:AXAssistiveTouchIconTypeOpenMenu])
    {
      if ([v19 isEqualToString:AXAssistiveTouchIconTypeMouseSecondaryClick])
      {
        if (![(HNDHandManager *)self shouldHideSystemPointerForFingersView])
        {
          [(HNDHandManager *)self handleSecondaryButtonPress:v5];
          goto LABEL_10;
        }
        id v16 = (id)AXAssistiveTouchIconTypeLongPress;
        double v17 = self;
      }
      else
      {
        double v17 = self;
        id v16 = v19;
      }
      [(HNDHandManager *)v17 performButtonAction:v16 type:v6 state:v5];
      goto LABEL_10;
    }
    if ([(HNDHandManager *)self inContinuousScrollMode])
    {
      unsigned int v8 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
      [(HNDHandManager *)self endContinuousScrollingOnDisplay:v8 withCompletion:0];
    }
    if (v5 == 2)
    {
      double v9 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
      uint64_t v10 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v9];

      id v11 = [v10 rocker];
      uint64_t v12 = [v11 isFullMenuVisible] ^ 1;

      BOOL v13 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
      [(HNDHandManager *)self showMenu:v12 onDisplay:v13];
    }
  }
LABEL_10:
}

- (void)_reallyLiftFingersUpForPotentialTapViaPrimaryButton
{
  double v3 = [(HNDHandManager *)self currentDisplayManager];
  id v4 = [v3 fingerController];
  [v4 liftFingersUpAnimated:1];

  [(HNDHandManager *)self setIsPendingFingerLiftForPrimaryButtonPressUp:0];
}

- (void)_liftFingersUpForPotentialTapViaPrimaryButton
{
  if ([(HNDHandManager *)self isPendingFingerLiftForPrimaryButtonPressUp])
  {
    double v3 = ASTLogMouse();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_100113FB0();
    }
  }
  [(HNDHandManager *)self setIsPendingFingerLiftForPrimaryButtonPressUp:0];
  id v4 = +[NSDate date];
  uint64_t v5 = [(HNDHandManager *)self previousPrimaryButtonPressDownDate];

  if (v5)
  {
    uint64_t v6 = [(HNDHandManager *)self previousPrimaryButtonPressDownDate];
    [v4 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 < 0.1)
    {
      [(HNDHandManager *)self setIsPendingFingerLiftForPrimaryButtonPressUp:1];
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
  if (![(HNDHandManager *)self isPendingFingerLiftForPrimaryButtonPressUp]) {
    [(HNDHandManager *)self _reallyLiftFingersUpForPotentialTapViaPrimaryButton];
  }
}

- (void)handlePrimaryButtonPress:(int)a3
{
  if ([(HNDHandManager *)self isPendingFingerLiftForPrimaryButtonPressUp]) {
    [(HNDHandManager *)self _reallyLiftFingersUpForPotentialTapViaPrimaryButton];
  }
  id v34 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
  uint64_t v5 = [(HNDHandManager *)self currentDisplayManager];
  uint64_t v6 = [v5 fingerController];
  if (a3 == 3)
  {
    if (self->_hotCornerLocked)
    {
      uint64_t v10 = [v5 fingerController];
      id v11 = [v10 fingerModels];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];
      [v12 location];
      objc_msgSend(v5, "convertToNormalizedInterfaceOrientation:");
      double v14 = v13;
      double v16 = v15;

      unint64_t v17 = -[HNDHandManager _hotCornerForNormalizedPoint:onDisplay:](self, "_hotCornerForNormalizedPoint:onDisplay:", v34, v14, v16);
      if (v17) {
        [(HNDHandManager *)self _performActionForHotCorner:v17 onDisplay:v34];
      }
    }
    else if ([(HNDHandManager *)self inPinchMode])
    {
      if (self->_pinchState == 1)
      {
        self->_pinchState = 2;
        goto LABEL_18;
      }
      self->_pinchState = 0;
      if ([(HNDHandManager *)self dwellControlEnabled])
      {
        [v5 updateNubbitForegroundImageForAction:AXAssistiveTouchIconTypeDwellClick];
        unsigned int v24 = [v5 fingerController];
        [v24 liftFingersUpAnimated:0];

        unsigned int v25 = [v5 fingerController];
        [v25 midpointForFingers];
        double v27 = v26;
        double v29 = v28;

        -[HNDHandManager removeFingersToPoint:onDisplay:](self, "removeFingersToPoint:onDisplay:", v34, v27, v29);
        -[HNDHandManager resetFingersToPoint:onDisplay:active:](self, "resetFingersToPoint:onDisplay:active:", v34, 1, v27, v29);
      }
      else
      {
        [(HNDHandManager *)self resetPinchFingersOnDisplay:v34];
        BOOL v30 = [v5 fingerController];
        [v30 liftFingersUpAnimated:1];
      }
    }
    else if ([(HNDHandManager *)self inBubbleMode] {
           && [(HNDHandManager *)self currentlySnappedInBubbleMode])
    }
    {
      [(HNDHandManager *)self activateCurrentBubbleModeFocusedElement];
    }
    else if (![(HNDHandManager *)self inDragMode])
    {
      [(HNDHandManager *)self _liftFingersUpForPotentialTapViaPrimaryButton];
    }
    if ([(HNDHandManager *)self dwellControlEnabled]
      && ([v5 isMenuVisible] & 1) == 0
      && ![(HNDHandManager *)self inDragMode]
      && ![(HNDHandManager *)self inContinuousScrollMode])
    {
      [(HNDHandManager *)self _resetDwellModeToDefault];
    }
    [(HNDHandManager *)self _resetMenuOpenTracker];
    self->_BOOL primaryButtonDown = 0;
  }
  else if (a3 == 2)
  {
    double v7 = +[AXOutputManager sharedOutputManager];
    [v7 playMouseClickSound];

    if (!self->_hotCornerLocked)
    {
      if ([(HNDHandManager *)self inCustomGesture])
      {
        double v8 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
        [(HNDHandManager *)self _performCustomGestureOnDisplay:v8];

        goto LABEL_8;
      }
      if (![(HNDHandManager *)self inPinchMode])
      {
        if ([(HNDHandManager *)self inDragMode])
        {
          [(HNDHandManager *)self currentPointForPointer];
          if (self->_dragStartPoint.x == -1.0 && self->_dragStartPoint.y == -1.0) {
            -[HNDHandManager beginDragAtPoint:onDisplay:](self, "beginDragAtPoint:onDisplay:", v34);
          }
          else {
            -[HNDHandManager endDragModeAtPoint:onDisplay:completed:](self, "endDragModeAtPoint:onDisplay:completed:", v34, 1);
          }
        }
        else if ([(HNDHandManager *)self inContinuousScrollMode])
        {
          [(HNDHandManager *)self endContinuousScrollingOnDisplay:v34 withCompletion:0];
        }
        else if (![(HNDHandManager *)self currentlySnappedInBubbleMode])
        {
          [v6 pressFingersDownAnimated:1];
        }
        goto LABEL_8;
      }
      if (self->_pinchState != 2)
      {
        id v18 = [v6 fingerModels];
        id v19 = [v18 count];

        if (v19 != (id)2) {
          _AXAssert();
        }
        double v20 = [v6 fingerModels];
        id v21 = [v20 count];

        if (v21 != (id)2) {
          goto LABEL_8;
        }
        double v22 = [v6 fingerModels];
        BOOL v23 = [v22 objectAtIndexedSubscript:0];
        [v23 location];
        if (-[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v34))
        {
        }
        else
        {
          char v31 = [v6 fingerModels];
          uint64_t v32 = [v31 objectAtIndexedSubscript:1];
          [v32 location];
          unsigned int v33 = -[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v34);

          if (!v33)
          {
            [(HNDHandManager *)self setCaptureEvents:1];
            [v6 pressFingersDownAnimated:1];
            self->_pinchState = 1;
            goto LABEL_8;
          }
        }
        [(HNDHandManager *)self showMenu:1 onDisplay:v34];
LABEL_8:
        [(HNDHandManager *)self _resetMenuOpenTracker];
        self->_BOOL primaryButtonDown = 1;
        double v9 = +[NSDate date];
        [(HNDHandManager *)self setPreviousPrimaryButtonPressDownDate:v9];
      }
    }
  }
LABEL_18:
}

- (void)handleLaserPrimaryButtonPress:(int)a3
{
  +[HNDVirtualHIDMouse handleButtonNumber:1 isDown:a3 == 2];
}

- (void)handleSecondaryButtonPress:(int)a3
{
  +[HNDVirtualHIDMouse handleButtonNumber:2 isDown:a3 == 2];
}

- (void)handleMultiTouchStandard:(int64_t)a3 onDisplay:(id)a4 withExistingFingerMidPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  self->_inMultiFingerGesture = 1;
  [(HNDHandManager *)self showMenu:0 onDisplay:v9];
  uint64_t v10 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v9];
  id v11 = [v10 fingerController];
  uint64_t v12 = [v11 fingerContainerView];
  [v12 bounds];
  unint64_t v17 = +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", a3, x, y, v13, v14, v15, v16);

  double v18 = CGPointZero.y;
  if (x == CGPointZero.x && y == v18)
  {
    AX_CGPointGetMidpointOfAllPoints();
    double v23 = v22;
    double v25 = v24;
    double v26 = [v10 fingerController];
    double v27 = [v26 fingerContainerView];
    [v27 bounds];
    AX_CGRectGetCenter();
    double v29 = v28;
    double v31 = v30;

    double width = v29 - v23;
    double height = v31 - v25;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  uint64_t v32 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v33 = v17;
  id v34 = [v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      BOOL v37 = 0;
      do
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        CGPoint v38 = CGPointFromString((NSString *)*(void *)(*((void *)&v41 + 1) + 8 * (void)v37));
        uint64_t v39 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", width + v38.x, height + v38.y, (void)v41);
        [v32 addObject:v39];

        BOOL v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v35 = [v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v35);
  }

  uint64_t v40 = [v10 fingerController];
  objc_msgSend(v40, "showFingerModels:animated:startPointForAnimation:", v32, 1, CGPointZero.x, v18);

  [v10 setMultiTouchToolBackgroundEnabled:1];
}

- (void)prepareScrollAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  -[HNDHandManager _scrollFallbackGestureAtPoint:onDisplay:vertical:forward:max:](self, "_scrollFallbackGestureAtPoint:onDisplay:vertical:forward:max:", v13, v9, v8, v7, x, y);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  -[HNDHandManager prepareGesture:onDisplay:](self, "prepareGesture:onDisplay:");

  if (v9 && v7)
  {
    if (v8) {
      int v14 = 2031;
    }
    else {
      int v14 = 2030;
    }
  }
  else
  {
    if (v8) {
      int v14 = 2009;
    }
    else {
      int v14 = 2008;
    }
    if (v8) {
      int v15 = 2006;
    }
    else {
      int v15 = 2007;
    }
    if (v9) {
      int v14 = v15;
    }
  }
  self->_preparedScrollAction = v14;
}

- (BOOL)_performAXScrollActionAtPoint:(CGPoint)a3 onDisplay:(id)a4 action:(int)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  if (self->_shouldSkipElementFetchForAXScroll)
  {
    BOOL v10 = 0;
  }
  else
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000359BC;
    v35[3] = &unk_1001ABA48;
    int v36 = a5;
    id v11 = objc_retainBlock(v35);
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    double v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    double v24 = sub_100035AA8;
    double v25 = &unk_1001ABA70;
    double v28 = &v31;
    id v13 = v11;
    id v27 = v13;
    CGFloat v29 = x;
    CGFloat v30 = y;
    int v14 = v12;
    double v26 = v14;
    dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, &v22);
    if (qword_1001F09E8 != -1) {
      dispatch_once(&qword_1001F09E8, &stru_1001ABA90);
    }
    id v16 = +[AXSettings sharedInstance];
    if ([v16 assistiveTouchVirtualTrackpadEnabled])
    {
      unint64_t v17 = &_dispatch_main_q;
      id v18 = &_dispatch_main_q;
    }
    else
    {
      unint64_t v17 = (id)qword_1001F09E0;
    }

    dispatch_async(v17, v15);
    dispatch_time_t v19 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v14, v19))
    {
      dispatch_block_cancel(v15);
      self->_shouldSkipElementFetchForAXScroll = 1;
      double v20 = ASTLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100113FE4(a5, v20);
      }
    }
    BOOL v10 = *((unsigned char *)v32 + 24) != 0;

    _Block_object_dispose(&v31, 8);
  }

  return v10;
}

- (double)_scrollDeltaForGesture:(BOOL)a3 screenSize:(CGSize)a4
{
  if (a3) {
    a4.double width = a4.height;
  }
  return a4.width * 0.75;
}

- (id)_scrollFallbackGestureAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  [v13 screenBounds];
  double v15 = v14;
  -[HNDHandManager _scrollDeltaForGesture:screenSize:](self, "_scrollDeltaForGesture:screenSize:", v9, v14, v16);
  if (v8) {
    double v17 = -v17;
  }
  if (v9) {
    double v18 = 0.0;
  }
  else {
    double v18 = v17;
  }
  double v19 = x + v18;
  if (v9) {
    double v20 = v17;
  }
  else {
    double v20 = 0.0;
  }
  unsigned int v21 = [v13 orientation];
  if (((AXDeviceIsPhone() & 1) != 0 || AXDeviceIsPod()) && !v9)
  {
    double v22 = 0.0;
    if (v8) {
      double v22 = v15;
    }
    if (v21 == 2) {
      double v19 = v22;
    }
  }
  double v23 = y + v20;
  if (v9 && v7)
  {
    uint64_t v24 = +[AXNamedReplayableGesture flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:](AXNamedReplayableGesture, "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:", 1, x, y, v19, v23);
  }
  else
  {
    uint64_t v24 = +[AXNamedReplayableGesture scrollGestureFromPoint:toPoint:duration:](AXNamedReplayableGesture, "scrollGestureFromPoint:toPoint:duration:", x, y, v19, v23, 0.5);
  }
  double v25 = (void *)v24;

  return v25;
}

- (void)startPinchModeWithPoint:(CGPoint)a3 onDisplay:(id)a4 mode:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  [(HNDHandManager *)self pauseBubbleModeForSpecialUsageTool];
  [(HNDHandManager *)self pauseEyeTrackingAutoHideForSpecialUsageTool];
  self->_unint64_t pinchMode = a5;
  [(HNDHandManager *)self showMenu:0 onDisplay:v9];
  id v11 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v9];

  BOOL v10 = [v11 fingerController];
  objc_msgSend(v10, "showPinchFingersAnimated:midpoint:", 0, x, y);

  [(HNDHandManager *)self setDwellMode:1];
  self->_pinchRotatePreviousPoint = (CGPoint)HNDPointNull;
  [v11 setMultiTouchToolBackgroundEnabled:1];
}

- (void)notifyUserEventOccurred
{
  id v2 = [(HNDHandManager *)self eventManager];
  [v2 notifyUserEventOccurred];
}

- (void)menuExitedOnDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HNDHandManager *)self eventManager];
  [v5 manipulateDimTimer:0];

  uint64_t v6 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];

  [v6 showMenu:0];
  if ([(HNDHandManager *)self dwellControlEnabled]
    && [(HNDHandManager *)self dwellControlPaused])
  {
    [(HNDHandManager *)self cancelDwellTimer];
  }
}

- (BOOL)canShowASTMousePointer
{
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (!_AXSAssistiveTouchEnabled() || UIAccessibilityIsSwitchControlRunning()) {
    goto LABEL_18;
  }
  double v3 = [(HNDHandManager *)self deviceManager];
  unsigned __int8 v4 = [v3 mainDeviceIsPointer];
  *((unsigned char *)v17 + 24) = v4;

  if ([(HNDHandManager *)self isOnDeviceEyeTrackingEnabled])
  {
    uint64_t v5 = [(HNDHandManager *)self deviceManager];
    unsigned __int8 v6 = [v5 mainDeviceIsOnDeviceEyeTracker];
    *((unsigned char *)v17 + 24) = v6;
  }
  if (sub_100041014())
  {
    if (*((unsigned char *)v17 + 24))
    {
      if ([(HNDHandManager *)self assistiveTouchMouseDwellControlEnabled]) {
        unsigned __int8 v7 = 1;
      }
      else {
        unsigned __int8 v7 = [(HNDHandManager *)self mouseBehavesLikeFinger];
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
    *((unsigned char *)v17 + 24) = v7;
  }
  BOOL v8 = [(HNDHandManager *)self deviceManager];
  if ([v8 hidDeviceIsConfiguring])
  {
  }
  else
  {
    id v9 = [(HNDHandManager *)self deviceManager];
    unsigned int v10 = [v9 hidDeviceSentReservedStatus];

    if (!v10) {
      goto LABEL_16;
    }
  }
  *((unsigned char *)v17 + 24) = 0;
LABEL_16:
  id v11 = [(HNDHandManager *)self mainDisplayManager];
  unsigned int v12 = [v11 isShowingCalibrationUI];

  if (v12) {
    *((unsigned char *)v17 + 24) = 0;
  }
LABEL_18:
  if (*((unsigned char *)v17 + 24))
  {
    BOOL v13 = 1;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036088;
    v15[3] = &unk_1001AB2E0;
    v15[4] = &v16;
    [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v15];
    BOOL v13 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (BOOL)isFingersPressedDown
{
  uint64_t v5 = 0;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100036190;
  v4[3] = &unk_1001AB2E0;
  void v4[4] = &v5;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)resetFingersIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100036328;
  v2[3] = &unk_1001AAC50;
  v2[4] = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v2];
}

- (void)resetFingersIfNeededOnDisplay:(id)a3
{
  id v4 = a3;
  if (![(HNDHandManager *)self usingSpecialTool]
    && ![(HNDHandManager *)self inCustomGesture])
  {
    -[HNDHandManager resetFingersToPoint:onDisplay:](self, "resetFingersToPoint:onDisplay:", v4, -1.0, -1.0);
  }
}

- (void)resetFingersIfActiveOnDisplay:(id)a3
{
  id v8 = a3;
  id v4 = -[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:");
  if ([v4 fingerContentViewIsActive])
  {
  }
  else
  {
    uint64_t v5 = [(HNDHandManager *)self deviceManager];
    unsigned __int8 v6 = [v5 mainDeviceIsPointer];

    uint64_t v7 = v8;
    if (v6) {
      goto LABEL_5;
    }
  }
  -[HNDHandManager resetFingersToPoint:onDisplay:](self, "resetFingersToPoint:onDisplay:", v8, -1.0, -1.0);
  uint64_t v7 = v8;
LABEL_5:
}

- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4
{
}

- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  if (x != -1.0 || y != -1.0) {
    goto LABEL_12;
  }
  [(HNDHandManager *)self currentPointForPointer];
  double x = v11;
  double y = v12;
  BOOL v13 = [(HNDHandManager *)self systemPointerController];
  BOOL v14 = v13 != 0;

  unsigned int v15 = [(HNDHandManager *)self _isWaitingForFirstSystemPointerMovement];
  if (!_AXSAssistiveTouchEnabled()) {
    goto LABEL_12;
  }
  if (!UIAccessibilityIsSwitchControlRunning()
    && ((sub_100041014() ^ 1 | v14 & ~v15) & 1) == 0
    && [(HNDHandManager *)self shouldHideSystemPointerForFingersView])
  {
    if (qword_1001F09F0 != -1) {
      dispatch_once(&qword_1001F09F0, &stru_1001ABAB0);
    }
  }
  else
  {
LABEL_12:
    double v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    CGFloat v30 = sub_100036800;
    uint64_t v31 = &unk_1001ABAD8;
    id v16 = v9;
    id v32 = v16;
    uint64_t v33 = self;
    double v17 = objc_retainBlock(&v28);
    if (![(HNDHandManager *)self shouldHideSystemPointerForFingersView]|| ((unsigned int (*)(void ***, double, double))v17[2])(v17, x, y))
    {
      uint64_t v18 = [v16 fingerController];
      objc_msgSend(v18, "clearAllFingersAnimated:endPointForAnimation:", 1, x, y);

      self->_BOOL primaryButtonDown = 0;
    }
    if (((unsigned int (*)(void ***, double, double))v17[2])(v17, x, y))
    {
      char v19 = [(HNDHandManager *)self deviceManager];
      if ([v19 hidDeviceIsConfiguring])
      {
      }
      else
      {
        double v20 = [(HNDHandManager *)self deviceManager];
        unsigned __int8 v21 = [v20 hidDeviceSentReservedStatus];

        if ((v21 & 1) == 0)
        {
          double v22 = [(HNDHandManager *)self mainDisplayManager];
          unsigned __int8 v23 = [v22 isShowingCalibrationUI];

          if ((v23 & 1) == 0)
          {
            [v16 setFingerContentViewIsActive:v5];
            uint64_t v24 = [v16 fingerController];
            double v25 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", x, y);
            char v34 = v25;
            double v26 = +[NSArray arrayWithObjects:&v34 count:1];
            objc_msgSend(v24, "showFingerModels:animated:startPointForAnimation:", v26, 1, x, y);

            objc_msgSend(v16, "updateWithPrimaryFingerPoint:", x, y);
            if ([(HNDHandManager *)self dwellControlEnabled]) {
              [(HNDHandManager *)self _resetDwellDueToFingersReset];
            }
          }
        }
      }
    }
    [v16 setMultiTouchToolBackgroundEnabled:0];
    if (sub_100041014())
    {
      id v27 = [(HNDHandManager *)self systemPointerController];
      objc_msgSend(v27, "hideSystemPointer:", -[HNDHandManager shouldHideSystemPointerForFingersView](self, "shouldHideSystemPointerForFingersView"));
    }
  }
}

- (void)removeFingersToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  id v8 = [v7 fingerController];
  objc_msgSend(v8, "clearAllFingersAnimated:endPointForAnimation:", 1, x, y);

  self->_BOOL primaryButtonDown = 0;
}

- (void)reloadFingerAppearance
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000369AC;
  v2[3] = &unk_1001AAC50;
  v2[4] = self;
  [(HNDHandManager *)self enumerateDisplayManagersWithBlock:v2];
}

- (CGPoint)preferredMenuDisplayPointOnDisplay:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HNDHandManager *)self deviceManager];
  id v6 = [v5 deviceCount];

  if (v6)
  {
    uint64_t v7 = [(HNDHandManager *)self deviceManager];
    unsigned int v8 = [v7 mainDeviceIsMotionTracker];

    if (!v8)
    {
      if (sub_100041014())
      {
        uint64_t v11 = [(HNDHandManager *)self systemPointerController];
        if (v11)
        {
          double v12 = (void *)v11;
          BOOL v13 = [(HNDHandManager *)self deviceManager];
          if ([v13 mainDeviceIsPointer])
          {
            unsigned __int8 v14 = [(HNDHandManager *)self shouldHideSystemPointerForFingersView];

            if ((v14 & 1) == 0)
            {
              unsigned int v15 = [(HNDHandManager *)self systemPointerController];
              [v15 currentSystemPointerPoint];
              CGFloat x = v16;
              CGFloat y = v17;
LABEL_15:

              goto LABEL_16;
            }
          }
          else
          {
          }
        }
      }
      unsigned int v15 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v4];
      uint64_t v18 = [v15 fingerController];
      if ([v18 numberOfFingers])
      {
        unsigned __int8 v19 = [v15 fingerContentViewIsActive];

        if (v19)
        {
          double v20 = [v15 fingerController];
          [v20 hndMenuPointForFingerLayout];
          CGFloat x = v21;
          CGFloat y = v22;

          goto LABEL_15;
        }
      }
      else
      {
      }
      CGFloat x = CGPointZero.x;
      CGFloat y = CGPointZero.y;
      goto LABEL_15;
    }
  }
  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
LABEL_16:

  double v23 = x;
  double v24 = y;
  result.CGFloat y = v24;
  result.CGFloat x = v23;
  return result;
}

- (void)performButtonAction:(id)a3 type:(int)a4 state:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  unsigned int v8 = [(HNDHandManager *)self currentDisplayManager];
  id v9 = v8;
  if (self->_primaryButtonDown)
  {
    unsigned int v10 = [v8 fingerController];
    [v10 liftFingersUpAnimated:1];

    self->_BOOL primaryButtonDown = 0;
  }
  if (v5 == 2) {
    [v9 activateAssistiveTouchAction:v11 fromButtonPress:1];
  }
  else {
    [v9 performPress:v5 type:v6];
  }
}

- (void)handleCustomHomeButtonAction:(int)a3
{
  id v4 = +[AXPISystemActionHelper sharedInstance];
  id v5 = v4;
  if (a3 == 2) {
    [v4 pressHomeButtonDown];
  }
  else {
    [v4 liftHomeButtonUp];
  }
}

- (void)rotateEventToOrientation:(id)a3
{
  id v4 = a3;
  int orientation = self->_orientation;
  if (orientation == 4)
  {
    id v13 = v4;
    [v4 deltaY];
    double v8 = v9;
    [v13 deltaX];
    double v11 = -v10;
LABEL_7:
    [v13 setDeltaY:v11];
    goto LABEL_8;
  }
  if (orientation == 3)
  {
    id v13 = v4;
    [v4 deltaY];
    double v8 = -v12;
    [v13 deltaX];
    goto LABEL_7;
  }
  if (orientation != 2) {
    goto LABEL_9;
  }
  id v13 = v4;
  [v4 deltaY];
  [v13 setDeltaY:-v6];
  [v13 deltaX];
  double v8 = -v7;
LABEL_8:
  [v13 setDeltaX:v8];
  id v4 = v13;
LABEL_9:
}

- (double)volumeLevel
{
  char v2 = [(HNDHandManager *)self eventManager];
  [v2 volumeLevel];
  double v4 = v3;

  return v4;
}

- (BOOL)isVoiceControlRunning
{
  char v2 = [(HNDHandManager *)self eventManager];
  unsigned __int8 v3 = [v2 isVoiceControlRunning];

  return v3;
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

- (CGPoint)rotateNormalizedPointToOrientation:(CGPoint)result
{
  int orientation = self->_orientation;
  if (orientation == 4)
  {
    double y = result.y;
    result.double y = result.x;
  }
  else if (orientation == 3)
  {
    double y = result.y;
    result.double y = 1.0 - result.x;
  }
  else
  {
    double y = result.x;
    if (orientation == 2)
    {
      result.double y = 1.0 - result.y;
      double y = 1.0 - result.x;
    }
  }
  double v5 = y;
  result.CGFloat x = v5;
  return result;
}

- (CGPoint)rotateEventFromOrientation:(CGPoint)a3
{
  double x = a3.x;
  int orientation = self->_orientation;
  double v5 = -a3.y;
  if (orientation != 4)
  {
    double v6 = -x;
    if (orientation == 2)
    {
      double x = -x;
      double y = -a3.y;
    }
    else
    {
      double y = a3.y;
    }
    if (orientation == 3) {
      double v5 = a3.y;
    }
    else {
      double v5 = x;
    }
    if (orientation == 3) {
      double x = v6;
    }
    else {
      double x = y;
    }
  }
  double v8 = x;
  result.double y = v8;
  result.double x = v5;
  return result;
}

- (void)showMenu:(BOOL)a3 onDisplay:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  [v5 showMenu:v4];
}

- (id)fingerController
{
  if (!UIAccessibilityIsSwitchControlRunning()) {
    _AXAssert();
  }
  unsigned __int8 v3 = [(HNDHandManager *)self mainDisplayManager];
  BOOL v4 = [v3 fingerController];

  return v4;
}

- (CGPoint)_fingerControllerPointForScreenPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a4];
  double v7 = [v6 fingerController];

  double v8 = [v7 fingerContainerView];
  double v9 = [v7 fingerContainerView];
  double v10 = [v9 window];
  objc_msgSend(v10, "convertPoint:fromWindow:", 0, x, y);
  objc_msgSend(v8, "convertPoint:fromView:", 0);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)performFingerDownAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v13 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  double v8 = [v13 fingerController];
  -[HNDHandManager _fingerControllerPointForScreenPoint:onDisplay:](self, "_fingerControllerPointForScreenPoint:onDisplay:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "performDownAtPoint:", v10, v12);
}

- (void)performFingerMoveToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v13 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  double v8 = [v13 fingerController];
  -[HNDHandManager _fingerControllerPointForScreenPoint:onDisplay:](self, "_fingerControllerPointForScreenPoint:onDisplay:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "performMoveToPoint:", v10, v12);
}

- (void)performFingerUpAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v13 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v7];
  double v8 = [v13 fingerController];
  -[HNDHandManager _fingerControllerPointForScreenPoint:onDisplay:](self, "_fingerControllerPointForScreenPoint:onDisplay:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "performUpAtPoint:", v10, v12);
}

- (CGPoint)startPointForDrag
{
  double x = self->_dragStartPoint.x;
  double y = self->_dragStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isPerformingDragPress
{
  return self->_isPerformingDragPressEvent;
}

- (double)_fingerRadiusOnDisplay:(id)a3
{
  unsigned __int8 v3 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:a3];
  BOOL v4 = [v3 fingerController];

  if (sub_100041014())
  {
    id v5 = [v4 appearanceDelegate];
    [v5 fingerInnerRadius];
    double v7 = v6;
    double v8 = [v4 appearanceDelegate];
    [v8 strokeWidth];
    double v10 = v7 + v9 * 0.5;
  }
  else
  {
    double v11 = +[AXSettings sharedInstance];
    [v11 assistiveTouchMousePointerSizeMultiplier];
    double v13 = v12;

    double v14 = [v4 appearanceDelegate];
    [v14 fingerInnerRadius];
    double v16 = v15;
    double v17 = [v4 appearanceDelegate];
    [v17 strokeWidth];
    double v19 = v16 + v18 * 0.5;

    double v10 = v13 * v19;
  }

  return v10;
}

- (BOOL)_requiresLargeSystemPointer
{
  if (![(HNDHandManager *)self canShowASTMousePointer]
    || UIAccessibilityIsSwitchControlRunning()
    || [(HNDHandManager *)self usingSpecialTool]
    || [(HNDHandManager *)self inCustomGesture])
  {
    return 1;
  }
  id v5 = [(HNDHandManager *)self currentDisplayManager];
  double v6 = [v5 fingerController];
  if ((unint64_t)[v6 numberOfFingers] <= 1) {
    BOOL v3 = [(HNDHandManager *)self dwellControlEnabled];
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (id)currentFingerAppearance
{
  if (sub_100041014())
  {
    if ([(HNDHandManager *)self currentlySnappedInBubbleMode])
    {
      uint64_t v3 = 136;
      goto LABEL_12;
    }
    if ([(HNDHandManager *)self dwellControlEnabled]
      && ![(HNDHandManager *)self shouldHideSystemPointerForFingersView])
    {
      uint64_t v3 = 104;
      goto LABEL_12;
    }
    BOOL v4 = ![(HNDHandManager *)self _requiresLargeSystemPointer];
    uint64_t v3 = 112;
    uint64_t v5 = 120;
  }
  else
  {
    if ([(HNDHandManager *)self dwellControlEnabled])
    {
      uint64_t v3 = 96;
      goto LABEL_12;
    }
    BOOL v4 = ![(HNDHandManager *)self dwellControlEnabled];
    uint64_t v3 = 96;
    uint64_t v5 = 104;
  }
  if (!v4) {
    uint64_t v3 = v5;
  }
LABEL_12:
  double v6 = *(Class *)((char *)&self->super.isa + v3);

  return v6;
}

- (id)selectedFillColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 selectedFillColor];

  return v3;
}

- (id)deselectedFillColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 deselectedFillColor];

  return v3;
}

- (id)selectedStrokeColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 selectedStrokeColor];

  return v3;
}

- (id)deselectedStrokeColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 deselectedStrokeColor];

  return v3;
}

- (id)strokeOutlineColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 strokeOutlineColor];

  return v3;
}

- (id)circularProgressFillColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 circularProgressFillColor];

  return v3;
}

- (id)pressedCircularProgressFillColor
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  uint64_t v3 = [v2 pressedCircularProgressFillColor];

  return v3;
}

- (BOOL)useSystemFilters
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  unsigned __int8 v3 = [v2 useSystemFilters];

  return v3;
}

- (double)pressedAlpha
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 pressedAlpha];
  double v4 = v3;

  return v4;
}

- (double)unpressedAlpha
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 unpressedAlpha];
  double v4 = v3;

  return v4;
}

- (double)pressedScale
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 pressedScale];
  double v4 = v3;

  return v4;
}

- (double)unpressedScale
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 unpressedScale];
  double v4 = v3;

  return v4;
}

- (double)strokeWidth
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 strokeWidth];
  double v4 = v3;

  return v4;
}

- (double)strokeOutlineWidth
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 strokeOutlineWidth];
  double v4 = v3;

  return v4;
}

- (double)innerCircleStrokeWidth
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 innerCircleStrokeWidth];
  double v4 = v3;

  return v4;
}

- (double)fingerInnerRadius
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 fingerInnerRadius];
  double v4 = v3;

  return v4;
}

- (BOOL)showFingerOutlines
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  unsigned __int8 v3 = [v2 showFingerOutlines];

  return v3;
}

- (double)fingerInnerCircleInnerRadius
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 fingerInnerCircleInnerRadius];
  double v4 = v3;

  return v4;
}

- (BOOL)showInnerCircle
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  unsigned __int8 v3 = [v2 showInnerCircle];

  return v3;
}

- (double)fingerWidth
{
  char v2 = [(HNDHandManager *)self currentFingerAppearance];
  [v2 fingerWidth];
  double v4 = v3;

  return v4;
}

- (HNDDisplayManager)mainDisplayManager
{
  char v2 = [(HNDHandManager *)self displayManagers];
  double v3 = [v2 axFirstObjectsUsingBlock:&stru_1001ABBB8];

  return (HNDDisplayManager *)v3;
}

- (HNDDisplayManager)currentDisplayManager
{
  double v3 = [(HNDHandManager *)self currentHardwareIdentifierForPointer];
  double v4 = [(HNDHandManager *)self displayManagerForHardwareIdentifier:v3];

  return (HNDDisplayManager *)v4;
}

- (id)displayManagerForHardwareIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HNDHandManager *)self displayManagers];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100037C60;
  v12[3] = &unk_1001ABBE0;
  id v13 = v4;
  id v6 = v4;
  double v7 = [v5 axFirstObjectsUsingBlock:v12];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(HNDHandManager *)self mainDisplayManager];
  }
  double v10 = v9;

  return v10;
}

- (void)enumerateDisplayManagersWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HNDHandManager *)self displayManagers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037D50;
  v7[3] = &unk_1001ABC08;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (id)displayManagerForDisplayId:(unsigned int)a3
{
  id v4 = [(HNDHandManager *)self displayManagers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037E04;
  v7[3] = &unk_1001ABC28;
  unsigned int v8 = a3;
  uint64_t v5 = [v4 axFirstObjectsUsingBlock:v7];

  return v5;
}

- (double)touchSpeed
{
  return self->_touchSpeed;
}

- (void)setTouchSpeed:(double)a3
{
  self->_double touchSpeed = a3;
}

- (BOOL)openMenuWithSwaggle
{
  return self->_openMenuWithSwaggle;
}

- (void)setOpenMenuWithSwaggle:(BOOL)a3
{
  self->_openMenuWithSwaggle = a3;
}

- (NSArray)customGestures
{
  return self->_customGestures;
}

- (void)setCustomGestures:(id)a3
{
}

- (NSPointerArray)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setEventHandlers:(id)a3
{
}

- (HNDEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (HNDDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (NSMutableArray)displayManagers
{
  return self->_displayManagers;
}

- (void)setDisplayManagers:(id)a3
{
}

- (NSArray)horizontalContinuousScrollers
{
  return self->_horizontalContinuousScrollers;
}

- (void)setHorizontalContinuousScrollers:(id)a3
{
}

- (NSArray)verticalContinuousScrollers
{
  return self->_verticalContinuousScrollers;
}

- (void)setVerticalContinuousScrollers:(id)a3
{
}

- (BOOL)alwaysShowMenu
{
  return self->_alwaysShowMenu;
}

- (BOOL)voiceControl
{
  return self->_voiceControl;
}

- (void)setVoiceControl:(BOOL)a3
{
  self->_voiceControl = a3;
}

- (AXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (BOOL)inBubbleMode
{
  return self->_inBubbleMode;
}

- (void)setInBubbleMode:(BOOL)a3
{
  self->_inBubbleMode = a3;
}

- (BOOL)eyeTrackingAutoHideEnabled
{
  return self->_eyeTrackingAutoHideEnabled;
}

- (void)setEyeTrackingAutoHideEnabled:(BOOL)a3
{
  self->_eyeTrackingAutoHideEnabled = a3;
}

- (BOOL)hidePointerForEyeTrackingAutoHide
{
  return self->_hidePointerForEyeTrackingAutoHide;
}

- (void)setHidePointerForEyeTrackingAutoHide:(BOOL)a3
{
  self->_hidePointerForEyeTrackingAutoHide = a3;
}

- (BOOL)lastMoveWasMouse
{
  return self->_lastMoveWasMouse;
}

- (void)setLastMoveWasMouse:(BOOL)a3
{
  self->_lastMoveWasMouse = a3;
}

- (HNDSystemPointerController)systemPointerController
{
  return self->_systemPointerController;
}

- (BOOL)mouseBehavesLikeFinger
{
  return self->_mouseBehavesLikeFinger;
}

- (void)setMouseBehavesLikeFinger:(BOOL)a3
{
  self->_mouseBehavesLikeFinger = a3;
}

- (BOOL)assistiveTouchMouseDwellControlEnabled
{
  return self->_assistiveTouchMouseDwellControlEnabled;
}

- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3
{
  self->_assistiveTouchMouseDwellControlEnabled = a3;
}

- (NSDate)previousPrimaryButtonPressDownDate
{
  return self->_previousPrimaryButtonPressDownDate;
}

- (void)setPreviousPrimaryButtonPressDownDate:(id)a3
{
  self->_previousPrimaryButtonPressDownDate = (NSDate *)a3;
}

- (BOOL)isPendingFingerLiftForPrimaryButtonPressUp
{
  return self->_isPendingFingerLiftForPrimaryButtonPressUp;
}

- (void)setIsPendingFingerLiftForPrimaryButtonPressUp:(BOOL)a3
{
  self->_isPendingFingerLiftForPrimaryButtonPressUp = a3;
}

- (unint64_t)lastTimeMouseMoved
{
  return self->_lastTimeMouseMoved;
}

- (void)setLastTimeMouseMoved:(unint64_t)a3
{
  self->_lastTimeMouseMoved = a3;
}

- (unint64_t)lastTimeEyeTrackerConfigured
{
  return self->_lastTimeEyeTrackerConfigured;
}

- (void)setLastTimeEyeTrackerConfigured:(unint64_t)a3
{
  self->_lastTimeEyeTrackerConfigured = a3;
}

- (unint64_t)continuousScrollMode
{
  return self->_continuousScrollMode;
}

- (void)setContinuousScrollMode:(unint64_t)a3
{
  self->_unint64_t continuousScrollMode = a3;
}

- (NSNumber)currentContinuousScrollDirection
{
  return self->_currentContinuousScrollDirection;
}

- (void)setCurrentContinuousScrollDirection:(id)a3
{
}

- (unint64_t)lastTimeElementFetcherRefreshed
{
  return self->_lastTimeElementFetcherRefreshed;
}

- (void)setLastTimeElementFetcherRefreshed:(unint64_t)a3
{
  self->_lastTimeElementFetcherRefreshed = a3;
}

- (BOOL)isActivelyScrollingContinuously
{
  return self->_isActivelyScrollingContinuously;
}

- (void)setIsActivelyScrollingContinuously:(BOOL)a3
{
  self->_isActivelyScrollingContinuousldouble y = a3;
}

- (BOOL)scrollingBlockedOnElementRefresh
{
  return self->_scrollingBlockedOnElementRefresh;
}

- (void)setScrollingBlockedOnElementRefresh:(BOOL)a3
{
  self->_scrollingBlockedOnElementRefresh = a3;
}

- (OS_dispatch_queue)continuousScrollerGenerationQueue
{
  return self->_continuousScrollerGenerationQueue;
}

- (void)setContinuousScrollerGenerationQueue:(id)a3
{
}

- (os_unfair_lock_s)continuousScrollLock
{
  return self->_continuousScrollLock;
}

- (void)setContinuousScrollLock:(os_unfair_lock_s)a3
{
  self->_continuousScrollLock = a3;
}

- (AXElement)continuousScrollPickedElement
{
  return self->_continuousScrollPickedElement;
}

- (void)setContinuousScrollPickedElement:(id)a3
{
}

- (double)continuousScrollCurrentSpeedFactor
{
  return self->_continuousScrollCurrentSpeedFactor;
}

- (void)setContinuousScrollCurrentSpeedFactor:(double)a3
{
  self->_continuousScrollCurrentSpeedFactor = a3;
}

- (HNDContinuousScroller)activeContinuousScroller
{
  return self->_activeContinuousScroller;
}

- (void)setActiveContinuousScroller:(id)a3
{
}

- (AXElementFetcher)elementFetcher
{
  return self->_elementFetcher;
}

- (void)setElementFetcher:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer
{
  return self->_updateElementVisualsCoalescer;
}

- (void)setUpdateElementVisualsCoalescer:(id)a3
{
}

- (BOOL)isDwellActionPendingButtonUp
{
  return self->_isDwellActionPendingButtonUp;
}

- (void)setIsDwellActionPendingButtonUp:(BOOL)a3
{
  self->_isDwellActionPendingButtonUp = a3;
}

- (UIViewPropertyAnimator)eyeTrackingAutoHideCursorAnimator
{
  return self->_eyeTrackingAutoHideCursorAnimator;
}

- (void)setEyeTrackingAutoHideCursorAnimator:(id)a3
{
}

- (double)eyeTrackingAutoHideTimeout
{
  return self->_eyeTrackingAutoHideTimeout;
}

- (void)setEyeTrackingAutoHideTimeout:(double)a3
{
  self->_eyeTrackingAutoHideTimeout = a3;
}

- (CGPoint)eyeTrackingAutotHideLastPointCursorShowed
{
  double x = self->_eyeTrackingAutotHideLastPointCursorShowed.x;
  double y = self->_eyeTrackingAutotHideLastPointCursorShowed.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEyeTrackingAutotHideLastPointCursorShowed:(CGPoint)a3
{
  self->_eyeTrackingAutotHideLastPointCursorShowed = a3;
}

- (AXElement)eyeTrackingAutotHideLastBubbleModeElementShowed
{
  return self->_eyeTrackingAutotHideLastBubbleModeElementShowed;
}

- (void)setEyeTrackingAutotHideLastBubbleModeElementShowed:(id)a3
{
}

- (BOOL)eyeTrackingAutoHideFinished
{
  return self->_eyeTrackingAutoHideFinished;
}

- (void)setEyeTrackingAutoHideFinished:(BOOL)a3
{
  self->_eyeTrackingAutoHideFinished = a3;
}

- (NSMutableDictionary)bubbleModeFrameToElementMapping
{
  return self->_bubbleModeFrameToElementMapping;
}

- (void)setBubbleModeFrameToElementMapping:(id)a3
{
}

- (AXElement)currentBubbleModeFocusedElement
{
  return self->_currentBubbleModeFocusedElement;
}

- (void)setCurrentBubbleModeFocusedElement:(id)a3
{
}

- (BOOL)bubbleModeCurrentlyFocusedOnNubbit
{
  return self->_bubbleModeCurrentlyFocusedOnNubbit;
}

- (void)setBubbleModeCurrentlyFocusedOnNubbit:(BOOL)a3
{
  self->_bubbleModeCurrentlyFocusedOnNubbit = a3;
}

- (AXElement)lastBubbleModeDwellElement
{
  return self->_lastBubbleModeDwellElement;
}

- (void)setLastBubbleModeDwellElement:(id)a3
{
}

- (AXElement)lastBubbleModeFocusedElement
{
  return self->_lastBubbleModeFocusedElement;
}

- (void)setLastBubbleModeFocusedElement:(id)a3
{
}

- (AXDispatchTimer)dwellBubbleModeTimer
{
  return self->_dwellBubbleModeTimer;
}

- (void)setDwellBubbleModeTimer:(id)a3
{
}

- (HNDRockerButton)bubbleModeFocusedRockerItem
{
  return self->_bubbleModeFocusedRockerItem;
}

- (void)setBubbleModeFocusedRockerItem:(id)a3
{
}

- (HNDRockerButton)lastBubbleModeDwellRockerItem
{
  return self->_lastBubbleModeDwellRockerItem;
}

- (void)setLastBubbleModeDwellRockerItem:(id)a3
{
}

- (BOOL)lastBubbleModeDwellWasOnNubbit
{
  return self->_lastBubbleModeDwellWasOnNubbit;
}

- (void)setLastBubbleModeDwellWasOnNubbit:(BOOL)a3
{
  self->_lastBubbleModeDwellWasOnNubbit = a3;
}

- (unint64_t)lastTimeHitTestedForBubbleMode
{
  return self->_lastTimeHitTestedForBubbleMode;
}

- (void)setLastTimeHitTestedForBubbleMode:(unint64_t)a3
{
  self->_lastTimeHitTestedForBubbleMode = a3;
}

- (BOOL)bubbleModeBlockedOnElementRefresh
{
  return self->_bubbleModeBlockedOnElementRefresh;
}

- (void)setBubbleModeBlockedOnElementRefresh:(BOOL)a3
{
  self->_bubbleModeBlockedOnElementRefresh = a3;
}

- (AXElementGroup)currentlySelectedKeyboardRow
{
  return self->_currentlySelectedKeyboardRow;
}

- (void)setCurrentlySelectedKeyboardRow:(id)a3
{
}

- (BOOL)isCurrentlySelectingKeyboardKey
{
  return self->_currentlySelectingKeyboardKey;
}

- (void)setCurrentlySelectingKeyboardKey:(BOOL)a3
{
  self->_currentlySelectingKeyboardKedouble y = a3;
}

- (BOOL)isOnDeviceEyeTrackingEnabled
{
  return self->_isOnDeviceEyeTrackingEnabled;
}

- (void)setIsOnDeviceEyeTrackingEnabled:(BOOL)a3
{
  self->_isOnDeviceEyeTrackingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySelectedKeyboardRow, 0);
  objc_storeStrong((id *)&self->_lastBubbleModeDwellRockerItem, 0);
  objc_storeStrong((id *)&self->_bubbleModeFocusedRockerItem, 0);
  objc_storeStrong((id *)&self->_dwellBubbleModeTimer, 0);
  objc_storeStrong((id *)&self->_lastBubbleModeFocusedElement, 0);
  objc_storeStrong((id *)&self->_lastBubbleModeDwellElement, 0);
  objc_storeStrong((id *)&self->_currentBubbleModeFocusedElement, 0);
  objc_storeStrong((id *)&self->_bubbleModeFrameToElementMapping, 0);
  objc_storeStrong((id *)&self->_eyeTrackingAutotHideLastBubbleModeElementShowed, 0);
  objc_storeStrong((id *)&self->_eyeTrackingAutoHideCursorAnimator, 0);
  objc_storeStrong((id *)&self->_updateElementVisualsCoalescer, 0);
  objc_storeStrong((id *)&self->_elementFetcher, 0);
  objc_storeStrong((id *)&self->_activeContinuousScroller, 0);
  objc_storeStrong((id *)&self->_continuousScrollPickedElement, 0);
  objc_storeStrong((id *)&self->_continuousScrollerGenerationQueue, 0);
  objc_storeStrong((id *)&self->_currentContinuousScrollDirection, 0);
  objc_storeStrong((id *)&self->_systemPointerController, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_verticalContinuousScrollers, 0);
  objc_storeStrong((id *)&self->_horizontalContinuousScrollers, 0);
  objc_storeStrong((id *)&self->_displayManagers, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_suppressVisualsAssertion, 0);
  objc_storeStrong((id *)&self->_orientationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_avPlayers, 0);
  objc_storeStrong((id *)&self->_realSelectedPinchFinger, 0);
  objc_storeStrong((id *)&self->_fingerFadeTimer, 0);
  objc_storeStrong((id *)&self->_dwellTimer, 0);
  objc_storeStrong((id *)&self->_systemBubblePointerAppearance, 0);
  objc_storeStrong((id *)&self->_systemPointerSettingsChangedDebouncer, 0);
  objc_storeStrong((id *)&self->_systemPointerLargeAppearance, 0);
  objc_storeStrong((id *)&self->_systemPointerPreciseAppearance, 0);
  objc_storeStrong((id *)&self->_dwellPointerAppearance, 0);
  objc_storeStrong((id *)&self->_mousePointerAppearance, 0);
  objc_storeStrong((id *)&self->_softwareKeyboardManager, 0);
  objc_storeStrong((id *)&self->_currentCustomGesture, 0);

  objc_storeStrong((id *)&self->_customGestures, 0);
}

- (double)screenFrame:
{
  if ((AXDeviceIsPad() & 1) != 0 || AXDeviceIsPhone())
  {
    v0 = +[UIDevice currentDevice];
    id v1 = [v0 orientation];

    if (!v1) {
      return CGRectZero.origin.x;
    }
  }
  BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();
  double v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 currentDisplayManager];
  uint64_t v5 = v4;
  if (IsSwitchControlRunning) {
    [v4 portraitUpScreenBounds];
  }
  else {
    [v4 screenBounds];
  }
  double v7 = v6;

  return v7;
}

@end