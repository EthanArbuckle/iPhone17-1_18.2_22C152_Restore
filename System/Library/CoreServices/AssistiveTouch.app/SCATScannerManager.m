@interface SCATScannerManager
+ (id)sharedManager;
+ (void)updateElementCacheScheme;
- (AXDispatchTimer)beginScanningTimer;
- (AXOutputManager)outputManager;
- (AXSSInterDeviceCommunicator)interDeviceCommunicator;
- (AXSwitchRecipe)currentRecipe;
- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer;
- (BOOL)_isPostScanningMenu:(id)a3;
- (BOOL)_isScannerControlledByDriver:(id)a3;
- (BOOL)_shouldIgnoreAllScannerControlMessages;
- (BOOL)_userHasDisabledUSBRM;
- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4;
- (BOOL)activateElement:(id)a3;
- (BOOL)areSoundEffectsEnabled;
- (BOOL)canAdvertise;
- (BOOL)canReturnControlToForwarderDevice:(id)a3;
- (BOOL)canSearchForControllableDevicesWithMenu:(id)a3;
- (BOOL)candidateBarManager:(id)a3 hasValidTypingCandidates:(id)a4;
- (BOOL)cursorManagerShouldHideMenuCursor:(id)a3;
- (BOOL)didPauseForReasonsToDisableScanning;
- (BOOL)didSetFocusContextForResume;
- (BOOL)forceDisableScreenLock;
- (BOOL)isActive;
- (BOOL)isAutoscanEnabled;
- (BOOL)isControllingOtherDevice;
- (BOOL)isDragActive;
- (BOOL)isExternalDisplayConnected;
- (BOOL)isGroupingEnabled;
- (BOOL)isHandlingInterDeviceCommunication;
- (BOOL)isInactive;
- (BOOL)isLandscape;
- (BOOL)isLoaded;
- (BOOL)isPaused;
- (BOOL)isSpeechEnabled;
- (BOOL)isSwitchWithSource:(id)a3;
- (BOOL)isSystemSleeping;
- (BOOL)isUIContextHidden;
- (BOOL)isUsingPointMode;
- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4;
- (BOOL)shouldAddItemSpecificMenuOptionsToMenu:(id)a3;
- (BOOL)shouldBypassShowingMenuForElement:(id)a3;
- (BOOL)shouldShowAppWideScrollActionsInMenu:(id)a3;
- (BOOL)shouldUseCameraPointPicker;
- (BOOL)waitingForSecureIntent;
- (CGPoint)_startingPointForGesturesForPointPicker:(id)a3;
- (CGRect)menu:(id)a3 rectToClearForFingersWithGestureSheet:(BOOL)a4;
- (HNDAccessibilityManager)testAxManager;
- (HNDScannerAutoscroller)autoscroller;
- (NSArray)recentSpeechOutputStrings;
- (NSMutableSet)reasonsToDisableScanning;
- (NSMutableSet)scannerObservers;
- (NSPointerArray)_pointerPointPickersToNotify;
- (NSSet)cachedCameraPointPickerSwitches;
- (NSString)description;
- (OS_dispatch_queue)managedConfigurationQueue;
- (SCATActionHandler)activateActionHandler;
- (SCATActionHandler)selectActionHandler;
- (SCATActionHandler)selectAndResumeAutoscanningActionHandler;
- (SCATActionItem)currentAction;
- (SCATAlternateKeysManager)alternateKeysManager;
- (SCATAutomaticDriver)autoScanningDriver;
- (SCATCandidateBarManager)candidateBarManager;
- (SCATCursorManager)cursorManager;
- (SCATDriver)activeScannerDriver;
- (SCATDwellDriver)dwellScanningDriver;
- (SCATElement)cachedPickerElement;
- (SCATElement)currentElement;
- (SCATElementManager)activeElementManager;
- (SCATElementNavigationController)elementNavController;
- (SCATFocusContext)currentFocusContext;
- (SCATFocusContext)focusContextForResume;
- (SCATGestureProvider)gestureProvider;
- (SCATInputController)inputController;
- (SCATManualDriver)manualScanningDriver;
- (SCATMenu)menu;
- (SCATPointPicker)pointPicker;
- (SCATScannerManager)init;
- (SCATScannerManagerDelegate)delegate;
- (SCATScrollViewPickerManager)scrollViewPickerManager;
- (id)_driverForScannerState;
- (id)_elementManagerForScannerState;
- (id)_focusContextAtPoint:(CGPoint)a3;
- (id)_primaryElementManagerForScannerState;
- (id)_typingCandidates;
- (id)axManager;
- (id)contentViewForGestureProvider:(id)a3;
- (id)exitActionElementForFingersInMenu:(id)a3;
- (id)focusContextForActionHandler:(id)a3;
- (id)gesturesSheetForMenu:(id)a3;
- (id)scatBackCursorUIContext;
- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatFrontCursorUIContext;
- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatUIContext;
- (id)scatUIContextForDisplayID:(unsigned int)a3;
- (id)userInterfaceClientForInputController:(id)a3;
- (int)_validatedSelectBehaviorForCurrentSelectBehavior:(int)a3 replacementElement:(id)a4;
- (int64_t)_dwellSwitchAssignedAction;
- (int64_t)itemMenuState;
- (int64_t)scanningMode;
- (unint64_t)immediateSelectActionCount;
- (unint64_t)minimumPointPickerNumberOfCyclesForDriver:(id)a3;
- (unsigned)currentDisplayID;
- (unsigned)lockedToDisplayID;
- (void)_applyLaunchRecipeUUID;
- (void)_beginOrContinueScanningWithFocusContext:(id)a3 shouldBegin:(BOOL)a4 foundNewElements:(BOOL)a5;
- (void)_deactivateAudioSession;
- (void)_disableUserInterfaceClientForPotentialReceiver;
- (void)_driver:(id)a3 outputAudioForContext:(id)a4;
- (void)_exitRecipeOnTimeout;
- (void)_handleActiveHoldAndDragAction;
- (void)_handleAppSwitcherAction;
- (void)_handleAppleWatchRemoteScreen;
- (void)_handleCameraButton;
- (void)_handleCameraButtonDoubleLightPress;
- (void)_handleCameraButtonLightPress;
- (void)_handleControlCenterAction;
- (void)_handleDictationAction;
- (void)_handleEscapeAction;
- (void)_handleForceTouchAction;
- (void)_handleHomeAction;
- (void)_handleNotificationCenterAction;
- (void)_handleSiriAction;
- (void)_handleTripleClickAction;
- (void)_handleVisualIntelligence;
- (void)_handleVolumeDownAction;
- (void)_handleVolumeUpAction;
- (void)_notifyObserversScannerDidBecomeActive;
- (void)_notifyObserversScannerDidBecomeInactive;
- (void)_notifyObserversScannerDidFocusOnContext:(id)a3 oldContext:(id)a4;
- (void)_notifyObserversScannerDidPause;
- (void)_notifyObserversScannerWillFocusOnContext:(id)a3;
- (void)_notifyObserversScannerWillUnfocusFromContext:(id)a3;
- (void)_overrideScanningModeAtStartupIfNecessary;
- (void)_resetRecipeTimeoutIfApplicable;
- (void)_scanningModePreferenceDidChange;
- (void)_setCurrentRecipe:(id)a3 shouldShowAlert:(BOOL)a4;
- (void)_setUSBRMPreferenceDisabled;
- (void)_showSimpleBannerWithText:(id)a3;
- (void)_updateActiveElementManager;
- (void)_updateActiveElementManager:(id)a3;
- (void)_updateAudioSessionState;
- (void)_updateCameraPointPickerSwitchesCache;
- (void)_updateElementVisuals;
- (void)_updateMenuAfterElementFetchFoundNewElements:(BOOL)a3;
- (void)_updateScanningStyle;
- (void)_waitForApplication:(id)a3;
- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4;
- (void)accessibilityManager:(id)a3 didFetchElementsForEvent:(int64_t)a4 foundNewElements:(BOOL)a5;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)accessibilityManager:(id)a3 nativeFocusElementDidChange:(id)a4;
- (void)accessibilityManager:(id)a3 screenWillChange:(__CFData *)a4;
- (void)accessibilityManager:(id)a3 updateElementVisuals:(id)a4;
- (void)accessibilityManagerShouldPauseScanning:(id)a3;
- (void)accessibilityManagerShouldResumeScanning:(id)a3;
- (void)actionHandlerDidCancelPendingAction:(id)a3;
- (void)actionHandlerDidFireAction:(id)a3;
- (void)actionHandlerForUI:(id)a3 willPerformDelayedActionOnContext:(id)a4 withCount:(unint64_t)a5;
- (void)actionHandlerForUIDidCancelPendingAction:(id)a3;
- (void)actionHandlerForUIWillFireAction:(id)a3;
- (void)addObserver:(id)a3;
- (void)addPointerPointPickerForMovementNotifications:(id)a3;
- (void)addReasonToDisableScanning:(id)a3;
- (void)alternateKeysManager:(id)a3 didSelectAlternateKey:(id)a4;
- (void)beginScanningWithFocusContext:(id)a3;
- (void)cancelDrag;
- (void)clearRecentSpeech;
- (void)continueScanningWithFocusContext:(id)a3 foundNewElements:(BOOL)a4;
- (void)dealloc;
- (void)didBecomeIdle;
- (void)didBeginLongPressForInputController:(id)a3;
- (void)didChooseCreateCustomGestureFromGestureProvider:(id)a3;
- (void)didConnectAsForwarderToDeviceWithName:(id)a3;
- (void)didConnectAsReceiverWithSettings:(id)a3;
- (void)didDisconnectAsForwarderFromDeviceWithName:(id)a3;
- (void)didDisconnectAsReceiver;
- (void)didEndLongPressForInputController:(id)a3;
- (void)didPressScreenChangingButtonInMenu:(id)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 indicateDwellScanningWillAbort:(BOOL)a4;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)driverDidBecomeActive:(id)a3 didChange:(BOOL)a4;
- (void)driverDidBecomeInactive:(id)a3;
- (void)driverDidPause:(id)a3;
- (void)endScanning;
- (void)gestureProvider:(id)a3 shouldResetScanningFromElement:(id)a4;
- (void)handleAlertDidAppear:(id)a3;
- (void)handleAnnouncement:(id)a3;
- (void)handleScreenChange:(id)a3;
- (void)handleStopSpeaking:(id)a3;
- (void)handleUSBMFiDeviceConnected;
- (void)hideUIContext:(BOOL)a3;
- (void)highlightAsPotentialReceiverForDeviceWithName:(id)a3;
- (void)inputController:(id)a3 didReceiveAction:(id)a4;
- (void)inputController:(id)a3 didReceivePoint:(CGPoint)a4;
- (void)inputController:(id)a3 didReceiveRecipeActionForMappingAtIndex:(unint64_t)a4 isLongPressAction:(BOOL)a5;
- (void)inputController:(id)a3 didReceiveRecipeHoldAtPoint:(CGPoint)a4 isDown:(BOOL)a5;
- (void)inputControllerPointPickerInterrupted:(id)a3;
- (void)loadScanner;
- (void)menu:(id)a3 activateRecipe:(id)a4;
- (void)menu:(id)a3 playSoundEffect:(int)a4;
- (void)menu:(id)a3 setItemMenuState:(int64_t)a4;
- (void)menu:(id)a3 showAlternateKeysForKey:(id)a4;
- (void)menu:(id)a3 showScrollViewPickerForScrollViews:(id)a4 elementsToScroll:(id)a5 scrollAction:(int)a6;
- (void)menu:(id)a3 showSysdiagnoseDisplayString:(id)a4;
- (void)menu:(id)a3 showTypingCandidates:(id)a4;
- (void)menu:(id)a3 speakAnnouncement:(id)a4 completionBlock:(id)a5;
- (void)menuDidDisappear:(id)a3;
- (void)menuDidFinishTransition:(id)a3;
- (void)menuWillBeginTransition:(id)a3;
- (void)moveDragSessionToFixedSpaceScreenPoint:(CGPoint)a3;
- (void)overrideMotionTrackerLookAtPoint:(CGPoint)a3;
- (void)pauseScanning;
- (void)pauseScanningWithScreenLockDisabled:(BOOL)a3;
- (void)performDrop;
- (void)performSysdiagnoseForInputController:(id)a3;
- (void)pointPicker:(id)a3 didFinishDwellingOnPoint:(CGPoint)a4;
- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4;
- (void)pointPicker:(id)a3 didSweepIntoFocusContext:(id)a4 isRefiningPoint:(BOOL)a5;
- (void)pointPicker:(id)a3 didSweepOutOfFocusContext:(id)a4 isRefiningPoint:(BOOL)a5;
- (void)presentPostScanningMenuForElementNavigationController:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removePointerPointPickerForMovementNotifications:(id)a3;
- (void)removeReasonToDisableScanning:(id)a3;
- (void)resumeScanning;
- (void)returnControlToForwarderDevice:(id)a3;
- (void)searchForControllableDevicesWithMenu:(id)a3;
- (void)selectElement:(id)a3;
- (void)selectElementAtPoint:(CGPoint)a3;
- (void)setActivateActionHandler:(id)a3;
- (void)setActiveElementManager:(id)a3;
- (void)setActiveElementManager:(id)a3 completion:(id)a4;
- (void)setActiveScannerDriver:(id)a3;
- (void)setAlternateKeysManager:(id)a3;
- (void)setAutoScanningDriver:(id)a3;
- (void)setAutoscroller:(id)a3;
- (void)setBeginScanningTimer:(id)a3;
- (void)setCachedCameraPointPickerSwitches:(id)a3;
- (void)setCachedPickerElement:(id)a3;
- (void)setCandidateBarManager:(id)a3;
- (void)setCurrentAction:(id)a3;
- (void)setCurrentRecipe:(id)a3;
- (void)setCursorManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPauseForReasonsToDisableScanning:(BOOL)a3;
- (void)setDidSetFocusContextForResume:(BOOL)a3;
- (void)setDwellScanningDriver:(id)a3;
- (void)setElementNavController:(id)a3;
- (void)setFocusContextForResume:(id)a3;
- (void)setForceDisableScreenLock:(BOOL)a3;
- (void)setGestureProvider:(id)a3;
- (void)setInputController:(id)a3;
- (void)setInterDeviceCommunicator:(id)a3;
- (void)setItemMenuState:(int64_t)a3;
- (void)setLockedToDisplayID:(unsigned int)a3;
- (void)setManagedConfigurationQueue:(id)a3;
- (void)setManualScanningDriver:(id)a3;
- (void)setMenu:(id)a3;
- (void)setOutputManager:(id)a3;
- (void)setPointPicker:(id)a3;
- (void)setReasonsToDisableScanning:(id)a3;
- (void)setRecentSpeechOutputStrings:(id)a3;
- (void)setScannerObservers:(id)a3;
- (void)setScrollViewPickerManager:(id)a3;
- (void)setSelectActionHandler:(id)a3;
- (void)setSelectAndResumeAutoscanningActionHandler:(id)a3;
- (void)setTestAxManager:(id)a3;
- (void)setUpdateElementVisualsCoalescer:(id)a3;
- (void)set_pointerPointPickersToNotify:(id)a3;
- (void)shouldEndScanningGestureProvider:(id)a3;
- (void)shouldStartScanningGestureProvider:(id)a3;
- (void)showUIContext:(BOOL)a3;
- (void)switchCurrentDisplayContext;
- (void)unloadScanner;
- (void)useFocusContextOnResume:(id)a3;
- (void)waitForDragStartFromPid:(int)a3 completion:(id)a4;
@end

@implementation SCATScannerManager

+ (id)sharedManager
{
  if (qword_1001F0C38 != -1) {
    dispatch_once(&qword_1001F0C38, &stru_1001AE718);
  }
  v2 = (void *)qword_1001F0C30;

  return v2;
}

+ (void)updateElementCacheScheme
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 switchControlTapBehavior];

  if (v3 == (id)2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }

  +[AXUIElement applyElementAttributeCacheScheme:v4];
}

- (SCATScannerManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)SCATScannerManager;
  v2 = [(SCATScannerManager *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    [(SCATScannerManager *)v2 _performAccessibilityValidations];
    uint64_t v4 = (AXSSInterDeviceCommunicator *)objc_alloc_init((Class)AXSSInterDeviceCommunicator);
    interDeviceCommunicator = v3->_interDeviceCommunicator;
    v3->_interDeviceCommunicator = v4;

    [(AXSSInterDeviceCommunicator *)v3->_interDeviceCommunicator setConnectionListener:v3];
    v6 = +[AXPISystemActionHelper sharedInstance];
    [v6 warm];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.SC.MC", 0);
    managedConfigurationQueue = v3->_managedConfigurationQueue;
    v3->_managedConfigurationQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSPointerArray pointerArrayWithOptions:5];
    pointerPointPickersToNotify = v3->__pointerPointPickersToNotify;
    v3->__pointerPointPickersToNotify = (NSPointerArray *)v9;

    id v11 = +[HNDSecureIntentManager sharedInstance];
    uint64_t v12 = objc_opt_new();
    scannerObservers = v3->_scannerObservers;
    v3->_scannerObservers = (NSMutableSet *)v12;
  }
  return v3;
}

- (void)dealloc
{
  [(SCATScannerManager *)self unloadScanner];
  [(AXSSInterDeviceCommunicator *)self->_interDeviceCommunicator setConnectionListener:0];
  v3.receiver = self;
  v3.super_class = (Class)SCATScannerManager;
  [(SCATScannerManager *)&v3 dealloc];
}

- (void)waitForDragStartFromPid:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v7 = +[HNDHandManager sharedManager];
  v6 = [v7 dragManager];
  [v6 waitForDragStartFromPid:v4 completionHandler:v5];
}

- (BOOL)isDragActive
{
  v2 = +[HNDHandManager sharedManager];
  objc_super v3 = [v2 dragManager];
  unsigned __int8 v4 = [v3 isDragActive];

  return v4;
}

- (void)cancelDrag
{
  id v3 = +[HNDHandManager sharedManager];
  v2 = [v3 dragManager];
  [v2 cancelDrag];
}

- (void)moveDragSessionToFixedSpaceScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = +[HNDHandManager sharedManager];
  id v5 = [v6 dragManager];
  objc_msgSend(v5, "moveToPoint:", x, y);
}

- (void)performDrop
{
  id v3 = +[HNDHandManager sharedManager];
  v2 = [v3 dragManager];
  [v2 drop];
}

- (BOOL)waitingForSecureIntent
{
  v2 = +[HNDSecureIntentManager sharedInstance];
  unsigned __int8 v3 = [v2 waitingForSecureIntent];

  return v3;
}

- (BOOL)_userHasDisabledUSBRM
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 userBoolValueForSetting:MCFeatureUSBRestrictedModeAllowed] == 2;

  return v3;
}

- (void)_setUSBRMPreferenceDisabled
{
  v2 = +[MCProfileConnection sharedConnection];
  [v2 setBoolValue:0 forSetting:MCFeatureUSBRestrictedModeAllowed];

  uint64_t v3 = _AXSGetUSBRMDisablers() | 2;

  __AXSSetUSBRMDisablers(v3);
}

- (void)handleUSBMFiDeviceConnected
{
  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 switchControlUserDidReadUSBRestrictedModeAlert];

  LODWORD(v3) = [(SCATScannerManager *)self _userHasDisabledUSBRM];
  id v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 switchControlShouldDisallowUSBRestrictedMode];

  if ((v4 | v3) != 1 || v6 != 0)
  {
    v8 = +[AXSettings sharedInstance];
    [v8 setSwitchControlShouldDisallowUSBRestrictedMode:0];

    int v14 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    int v25 = -5;
    int v21 = 7;
    objc_super v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_1000E1A54;
    v18 = &unk_1001AE910;
    v19 = &v22;
    v20 = &v14;
    int v9 = ACMKernelControl(18);
    if (!v9) {
      int v9 = *((_DWORD *)v23 + 6);
    }
    _Block_object_dispose(&v22, 8);
    if ((v14 & 0x10) != 0) {
      unsigned int v10 = 16;
    }
    else {
      unsigned int v10 = 14;
    }
    if (v9) {
      uint64_t v11 = 14;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = +[AXSpringBoardServer server];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D6FEC;
    v13[3] = &unk_1001AB8E0;
    v13[4] = self;
    [v12 showAlert:v11 withHandler:v13];
  }
}

- (void)loadScanner
{
  if (self->_isLoaded) {
    return;
  }
  _UIAccessibilityBlockPostingOfNotification();
  _UIAccessibilityBlockPostingOfNotification();
  uint64_t v3 = +[HNDAccessibilityManager sharedManager];
  [v3 addObserver:self];

  unsigned int v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 mainDisplayManager];
  [v5 addUserInterfaceClientEnabler:@"Scanner"];

  unsigned int v6 = +[HNDAccessibilityManager sharedManager];
  id v7 = +[HNDHandManager sharedManager];
  v8 = [v7 displayManagers];
  [v6 displaysDidChange:v8];

  int v9 = objc_alloc_init(AXOutputManager);
  [(SCATScannerManager *)self setOutputManager:v9];
  unsigned int v10 = +[AXSettings sharedInstance];
  -[AXOutputManager setSpeechEnabled:](v9, "setSpeechEnabled:", [v10 assistiveTouchScannerSpeechEnabled]);

  uint64_t v11 = +[AXSettings sharedInstance];
  -[AXOutputManager setSoundEffectsEnabled:](v9, "setSoundEffectsEnabled:", [v11 assistiveTouchScannerSoundEnabled]);

  [(SCATScannerManager *)self _updateAudioSessionState];
  uint64_t v12 = [[SCATCursorManager alloc] initWithDisplaySource:self];
  [(SCATScannerManager *)self setCursorManager:v12];
  [(SCATCursorManager *)v12 setDelegate:self];
  id v65 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  -[SCATScannerManager setBeginScanningTimer:](self, "setBeginScanningTimer:");
  v13 = [SCATInputController alloc];
  int v14 = [(SCATScannerManager *)self interDeviceCommunicator];
  objc_super v15 = [(SCATInputController *)v13 initWithInterDeviceCommunicator:v14];

  uint64_t v16 = +[AXAccessQueue mainAccessQueue];
  [(SCATInputController *)v15 setDelegate:self queue:v16];

  v64 = v15;
  [(SCATScannerManager *)self setInputController:v15];
  v17 = [[SCATMenu alloc] initWithDelegate:self];
  [(SCATScannerManager *)self setMenu:v17];
  v63 = v17;
  [(SCATMenu *)v17 registerMenuObserver:self];
  v18 = +[AXSettings sharedInstance];
  [v18 switchControlAutoTapTimeout];
  double v20 = v19;

  int v21 = [[SCATActionHandler alloc] initWithAction:103 timeoutDuration:v20];
  [(SCATActionHandler *)v21 setUiDelegate:self];
  v62 = v21;
  [(SCATScannerManager *)self setSelectActionHandler:v21];
  uint64_t v22 = [[SCATActionHandler alloc] initWithAction:109 timeoutDuration:v20];
  [(SCATActionHandler *)v22 setUiDelegate:self];
  [(SCATScannerManager *)self setSelectAndResumeAutoscanningActionHandler:v22];
  v23 = [[SCATActionHandler alloc] initWithAction:100 timeoutDuration:0.0];
  [(SCATActionHandler *)v23 setUiDelegate:self];
  v61 = v23;
  [(SCATScannerManager *)self setActivateActionHandler:v23];
  v60 = objc_alloc_init(HNDScannerAutoscroller);
  -[SCATScannerManager setAutoscroller:](self, "setAutoscroller:");
  uint64_t v24 = [SCATGestureProvider alloc];
  int v25 = [(SCATScannerManager *)self menu];
  v26 = [(SCATGestureProvider *)v24 initWithMenu:v25];

  [(SCATGestureProvider *)v26 setDelegate:self];
  v59 = v26;
  [(SCATScannerManager *)self setGestureProvider:v26];
  objc_initWeak(location, self);
  id v27 = objc_alloc_init((Class)AXUpdateElementVisualsCoalescer);
  [(SCATScannerManager *)self setUpdateElementVisualsCoalescer:v27];
  [v27 setThreshold:0.2];
  [v27 setProgressInterval:0.01];
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_1000D7C94;
  v86[3] = &unk_1001AAA68;
  objc_copyWeak(&v87, location);
  [v27 setUpdateVisualsSequenceDidBeginHandler:v86];
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1000D7CF8;
  v84[3] = &unk_1001AAA68;
  objc_copyWeak(&v85, location);
  [v27 setUpdateVisualsSequenceInProgressHandler:v84];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_1000D7D38;
  v82[3] = &unk_1001AAA68;
  objc_copyWeak(&v83, location);
  [v27 setUpdateVisualsSequenceDidFinishHandler:v82];
  [(SCATScannerManager *)self _overrideScanningModeAtStartupIfNecessary];
  v28 = objc_alloc_init(SCATElementNavigationController);
  [(SCATElementNavigationController *)v28 setDelegate:self];
  [(SCATScannerManager *)self setElementNavController:v28];
  if (![(SCATScannerManager *)self shouldUseCameraPointPicker]) {
    goto LABEL_8;
  }
  v29 = +[AXSettings sharedInstance];
  if ([v29 assistiveTouchScanningMode] != (id)3)
  {

LABEL_8:
    int v32 = 0;
    uint64_t v33 = 1;
    goto LABEL_9;
  }
  v30 = +[AXSpringBoardServer server];
  unsigned int v31 = [v30 isContinuitySessionActive];
  int v32 = v31 ^ 1;

  if (v31) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
LABEL_9:
  v34 = +[AXSettings sharedInstance];
  [v34 setAssistiveTouchPreferredPointPicker:v33];
  v57 = v12;

  v35 = [(SCATScannerManager *)self menu];
  v36 = +[SCATPointPicker pointPickerWithMode:v33 menu:v35];

  if (v32)
  {
    v37 = [(SCATScannerManager *)self inputController];
    [v37 setMotionTrackingEnabled:1];
  }
  objc_msgSend(v36, "setDelegate:", self, v57);
  [(SCATScannerManager *)self setPointPicker:v36];
  v38 = objc_alloc_init(SCATAlternateKeysManager);
  [(SCATAlternateKeysManager *)v38 setDelegate:self];
  [(SCATScannerManager *)self setAlternateKeysManager:v38];
  v39 = objc_alloc_init(SCATCandidateBarManager);
  [(SCATCandidateBarManager *)v39 setDelegate:self];
  [(SCATScannerManager *)self setCandidateBarManager:v39];
  v40 = [(SCATScannerManager *)self _elementManagerForScannerState];
  [(SCATScannerManager *)self setActiveElementManager:v40];

  v41 = [[SCATAutomaticDriver alloc] initWithDelegate:self];
  [(SCATScannerManager *)self setAutoScanningDriver:v41];

  v42 = [(SCATDriver *)[SCATManualDriver alloc] initWithDelegate:self];
  [(SCATScannerManager *)self setManualScanningDriver:v42];

  v43 = [(SCATDriver *)[SCATDwellDriver alloc] initWithDelegate:self];
  [(SCATScannerManager *)self setDwellScanningDriver:v43];

  v44 = [(SCATScannerManager *)self _driverForScannerState];
  [(SCATScannerManager *)self setActiveScannerDriver:v44];

  [(SCATScannerManager *)self _updateCameraPointPickerSwitchesCache];
  v45 = +[AXSettings sharedInstance];
  [v45 registerUpdateBlock:&stru_1001AE738 forRetrieveSelector:"switchControlUseCameraForPointMode" withListener:self];

  v46 = +[AXSettings sharedInstance];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_1000D7EE8;
  v80[3] = &unk_1001AAA68;
  objc_copyWeak(&v81, location);
  [v46 registerUpdateBlock:v80 forRetrieveSelector:"assistiveTouchCameraPointPickerSwitches" withListener:self];

  objc_destroyWeak(&v81);
  v47 = +[AXSettings sharedInstance];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000D7F28;
  v78[3] = &unk_1001AAA68;
  objc_copyWeak(&v79, location);
  [v47 registerUpdateBlock:v78 forRetrieveSelector:"switchControlAutoTapTimeout" withListener:self];

  objc_destroyWeak(&v79);
  v48 = +[AXSettings sharedInstance];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000D7FB0;
  v76[3] = &unk_1001AAA68;
  objc_copyWeak(&v77, location);
  [v48 registerUpdateBlock:v76 forRetrieveSelector:"assistiveTouchGroupElementsEnabled" withListener:self];

  objc_destroyWeak(&v77);
  v49 = +[AXSettings sharedInstance];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000D807C;
  v74[3] = &unk_1001AAA68;
  objc_copyWeak(&v75, location);
  [v49 registerUpdateBlock:v74 forRetrieveSelector:"switchControlScanningStyle" withListener:self];

  objc_destroyWeak(&v75);
  v50 = +[AXSettings sharedInstance];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000D80EC;
  v72[3] = &unk_1001AAA68;
  objc_copyWeak(&v73, location);
  [v50 registerUpdateBlock:v72 forRetrieveSelector:"assistiveTouchScanningMode" withListener:self];

  objc_destroyWeak(&v73);
  v51 = +[AXSettings sharedInstance];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000D812C;
  v69[3] = &unk_1001AB1D0;
  v52 = v9;
  v70 = v52;
  objc_copyWeak(&v71, location);
  [v51 registerUpdateBlock:v69 forRetrieveSelector:"assistiveTouchScannerSpeechEnabled" withListener:self];

  objc_destroyWeak(&v71);
  v53 = +[AXSettings sharedInstance];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000D81BC;
  v66[3] = &unk_1001AB1D0;
  v54 = v52;
  v67 = v54;
  objc_copyWeak(&v68, location);
  [v53 registerUpdateBlock:v66 forRetrieveSelector:"assistiveTouchScannerSoundEnabled" withListener:self];

  objc_destroyWeak(&v68);
  v55 = +[AXSettings sharedInstance];
  [v55 registerUpdateBlock:&stru_1001AE758 forRetrieveSelector:"switchControlTapBehavior" withListener:self];

  v56 = +[HNDEventManager sharedManager];
  [v56 manipulateDimTimer:1];

  [(SCATScannerManager *)self _applyLaunchRecipeUUID];
  [(SCATScannerManager *)self hideUIContext:0];
  self->_isLoaded = 1;

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);

  objc_destroyWeak(location);
}

- (void)unloadScanner
{
  if (self->_isLoaded)
  {
    uint64_t v3 = +[HNDAccessibilityManager sharedManager];
    [v3 removeObserver:self];

    [(SCATScannerManager *)self endScanning];
    _UIAccessibilityUnblockPostingOfAllNotifications();
    unsigned int v4 = [(SCATScannerManager *)self inputController];
    [v4 setDelegate:0 queue:0];

    [(SCATScannerManager *)self setInputController:0];
    id v5 = [(SCATScannerManager *)self menu];
    [v5 setDelegate:0];

    unsigned int v6 = [(SCATScannerManager *)self menu];
    [v6 unregisterMenuObserver:self];

    [(SCATScannerManager *)self setMenu:0];
    [(SCATScannerManager *)self setAutoscroller:0];
    id v7 = [(SCATScannerManager *)self gestureProvider];
    [v7 setDelegate:0];

    [(SCATScannerManager *)self setGestureProvider:0];
    [(SCATScannerManager *)self setUpdateElementVisualsCoalescer:0];
    [(SCATScannerManager *)self setAutoScanningDriver:0];
    [(SCATScannerManager *)self setManualScanningDriver:0];
    [(SCATScannerManager *)self setActiveScannerDriver:0];
    [(SCATScannerManager *)self setElementNavController:0];
    v8 = [(SCATScannerManager *)self pointPicker];
    [v8 setDelegate:0];

    [(SCATScannerManager *)self setPointPicker:0];
    int v9 = [(SCATScannerManager *)self alternateKeysManager];
    [v9 setDelegate:0];

    [(SCATScannerManager *)self setAlternateKeysManager:0];
    unsigned int v10 = [(SCATScannerManager *)self candidateBarManager];
    [v10 setDelegate:0];

    [(SCATScannerManager *)self setCandidateBarManager:0];
    [(SCATScannerManager *)self setScrollViewPickerManager:0];
    [(SCATScannerManager *)self setActiveElementManager:0];
    [(SCATScannerManager *)self setBeginScanningTimer:0];
    uint64_t v11 = [(SCATScannerManager *)self cursorManager];
    [v11 setDelegate:0];

    [(SCATScannerManager *)self setCursorManager:0];
    uint64_t v12 = [(SCATScannerManager *)self selectActionHandler];
    [v12 setDelegate:0];

    v13 = [(SCATScannerManager *)self selectActionHandler];
    [v13 setUiDelegate:0];

    [(SCATScannerManager *)self setSelectActionHandler:0];
    int v14 = [(SCATScannerManager *)self activateActionHandler];
    [v14 setDelegate:0];

    objc_super v15 = [(SCATScannerManager *)self activateActionHandler];
    [v15 setUiDelegate:0];

    [(SCATScannerManager *)self setActivateActionHandler:0];
    [(SCATScannerManager *)self setOutputManager:0];
    [(SCATScannerManager *)self setFocusContextForResume:0];
    [(SCATScannerManager *)self setReasonsToDisableScanning:0];
    [(SCATScannerManager *)self _setCurrentRecipe:0 shouldShowAlert:0];
    id v24 = +[NSNumber numberWithUnsignedLongLong:self];
    uint64_t v16 = +[AXSettings sharedInstance];
    [v16 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchGroupElementsEnabled" withListenerID:v24];

    v17 = +[AXSettings sharedInstance];
    [v17 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchPreferredPointPicker" withListenerID:v24];

    v18 = +[AXSettings sharedInstance];
    [v18 unregisterUpdateBlockForRetrieveSelector:"switchControlScanningStyle" withListenerID:v24];

    double v19 = +[AXSettings sharedInstance];
    [v19 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchStepInterval" withListenerID:v24];

    double v20 = +[AXSettings sharedInstance];
    [v20 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchScanningMode" withListenerID:v24];

    int v21 = +[HNDEventManager sharedManager];
    [v21 manipulateDimTimer:0];

    uint64_t v22 = +[HNDHandManager sharedManager];
    v23 = [v22 mainDisplayManager];
    [v23 removeUserInterfaceClientEnabler:@"Scanner"];

    self->_isLoaded = 0;
  }
}

- (NSString)description
{
  uint64_t v3 = +[NSNumber numberWithBool:[(SCATScannerManager *)self isActive]];
  unsigned int v4 = +[NSNumber numberWithBool:[(SCATScannerManager *)self isPaused]];
  id v5 = [(SCATScannerManager *)self activeScannerDriver];
  unsigned int v6 = [(SCATScannerManager *)self activeElementManager];
  id v7 = +[NSString stringWithFormat:@"SCATScannerManager<%p>. Active:%@ Paused:%@ ActiveDriver:%@. ActiveElementManager:%@.", self, v3, v4, v5, v6];

  return (NSString *)v7;
}

- (void)_overrideScanningModeAtStartupIfNecessary
{
  if (self->_isLoaded) {
    return;
  }
  v2 = +[AXSettings sharedInstance];
  if ([v2 switchControlUseCameraForPointMode]) {
    goto LABEL_5;
  }
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlFirstLaunchScanningMode];

  if (v4 == (id)3)
  {
    v2 = +[AXSettings sharedInstance];
    [v2 setSwitchControlUseCameraForPointMode:1];
LABEL_5:
  }
  id v7 = +[AXSettings sharedInstance];
  id v5 = [v7 switchControlFirstLaunchScanningMode];
  unsigned int v6 = +[AXSettings sharedInstance];
  [v6 setAssistiveTouchScanningMode:v5];
}

- (void)_scanningModePreferenceDidChange
{
  id v25 = +[AXSettings sharedInstance];
  id v3 = [v25 assistiveTouchScanningMode];
  id v4 = +[AXSettings sharedInstance];
  id v5 = [v4 switchControlFirstLaunchScanningMode];

  if (v5 != v3)
  {
    unsigned int v6 = +[AXSettings sharedInstance];
    [v6 setSwitchControlFirstLaunchScanningMode:v3];
  }
  id v7 = [(SCATScannerManager *)self activeElementManager];
  uint64_t v8 = [(SCATScannerManager *)self elementNavController];
  if (v7 == (void *)v8)
  {
  }
  else
  {
    int v9 = (void *)v8;
    unsigned int v10 = [(SCATScannerManager *)self activeElementManager];
    uint64_t v11 = [(SCATScannerManager *)self pointPicker];

    if (v10 != v11) {
      goto LABEL_23;
    }
  }
  if (v3 == (id)1)
  {
    [v25 setAssistiveTouchPreferredPointPicker:1];
    double v19 = [(SCATScannerManager *)self menu];
    v13 = +[SCATPointPicker mostSuitablePointPickerWithMenu:v19];
  }
  else
  {
    if (v3 == (id)3)
    {
      [v25 setAssistiveTouchPreferredPointPicker:2];
      uint64_t v12 = [(SCATScannerManager *)self menu];
      v13 = +[SCATPointPicker mostSuitablePointPickerWithMenu:v12];

      int v14 = [(SCATScannerManager *)self inputController];
      unsigned __int8 v15 = [v14 motionTrackingEnabled];

      if (v15) {
        goto LABEL_16;
      }
      uint64_t v16 = [(SCATScannerManager *)self inputController];
      v17 = v16;
      uint64_t v18 = 1;
      goto LABEL_15;
    }
    v13 = 0;
  }
  double v20 = [(SCATScannerManager *)self inputController];
  unsigned int v21 = [v20 motionTrackingEnabled];

  if (!v21) {
    goto LABEL_16;
  }
  uint64_t v16 = [(SCATScannerManager *)self inputController];
  v17 = v16;
  uint64_t v18 = 0;
LABEL_15:
  [v16 setMotionTrackingEnabled:v18];

LABEL_16:
  if (v13)
  {
    uint64_t v22 = [(SCATScannerManager *)self pointPicker];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();

    if (v23 != v24)
    {
      [v13 setDelegate:self];
      [(SCATScannerManager *)self setPointPicker:v13];
    }
  }
  [(SCATScannerManager *)self _updateCameraPointPickerSwitchesCache];
  if ([(SCATScannerManager *)self isActive]) {
    [(SCATScannerManager *)self beginScanningWithFocusContext:0];
  }
  else {
    [(SCATScannerManager *)self _updateActiveElementManager];
  }

LABEL_23:
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (BOOL)isHandlingInterDeviceCommunication
{
  v2 = [(SCATScannerManager *)self interDeviceCommunicator];
  char v3 = [v2 isIdle] ^ 1;

  return v3;
}

- (BOOL)isControllingOtherDevice
{
  v2 = [(SCATScannerManager *)self interDeviceCommunicator];
  unsigned __int8 v3 = [v2 isForwardingSwitchEvents];

  return v3;
}

- (void)setActiveScannerDriver:(id)a3
{
  id v4 = (SCATDriver *)a3;
  activeScannerDriver = self->_activeScannerDriver;
  unsigned int v10 = v4;
  if (activeScannerDriver != v4)
  {
    [(SCATDriver *)activeScannerDriver willFinishAsScannerDriver];
    [(SCATDriver *)v10 willBecomeScannerDriver];
    unsigned int v6 = self->_activeScannerDriver;
    id v7 = v10;
    uint64_t v8 = self->_activeScannerDriver;
    self->_activeScannerDriver = v7;
    int v9 = v6;

    [(SCATDriver *)v9 didFinishAsScannerDriver];
    [(SCATDriver *)v7 didBecomeScannerDriver];
  }
}

- (id)_driverForScannerState
{
  if ([(SCATScannerManager *)self isAutoscanEnabled])
  {
    unsigned __int8 v3 = [(SCATScannerManager *)self autoScanningDriver];
  }
  else
  {
    id v4 = +[AXSettings sharedInstance];
    id v5 = [v4 switchControlScanningStyle];

    if (v5 == (id)1) {
      [(SCATScannerManager *)self manualScanningDriver];
    }
    else {
    unsigned __int8 v3 = [(SCATScannerManager *)self dwellScanningDriver];
    }
  }

  return v3;
}

- (void)setActiveElementManager:(id)a3
{
}

- (void)setActiveElementManager:(id)a3 completion:(id)a4
{
  id v7 = (SCATElementManager *)a3;
  uint64_t v8 = (void (**)(void))a4;
  activeElementManager = self->_activeElementManager;
  if (activeElementManager == v7) {
    goto LABEL_4;
  }
  [(SCATElementManager *)activeElementManager scannerWillMakeManagerInactive:self activeElementManager:v7];
  [(SCATElementManager *)v7 scannerWillMakeManagerActive:self forDisplayID:[(SCATScannerManager *)self currentDisplayID]];
  objc_storeStrong((id *)&self->_activeElementManager, a3);
  if (![(SCATScannerManager *)self isSpeechEnabled]) {
    goto LABEL_4;
  }
  unsigned int v10 = [(SCATScannerManager *)self pointPicker];

  if (v10 != v7) {
    goto LABEL_4;
  }
  uint64_t v12 = [(SCATScannerManager *)self pointPicker];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v14 = @"ENTERED_GLIDING_CURSOR_MODE";
  }
  else
  {
    unsigned __int8 v15 = [(SCATScannerManager *)self pointPicker];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0) {
      goto LABEL_4;
    }
    int v14 = @"ENTERED_HEAD_TRACKING_MODE";
  }
  uint64_t v17 = sub_100040EC8(v14);
  if (!v17)
  {
LABEL_4:
    int v11 = 1;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v18 = (void *)v17;
  double v19 = [(SCATScannerManager *)self _driverForScannerState];
  double v20 = [(SCATScannerManager *)self outputManager];
  [v19 outputManager:v20 willSpeakFocusContext:0];

  unsigned int v21 = [(SCATScannerManager *)self outputManager];
  objc_initWeak(&location, v21);

  uint64_t v22 = [(SCATScannerManager *)self outputManager];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D8EFC;
  v23[3] = &unk_1001AE7A8;
  v23[4] = self;
  objc_copyWeak(&v25, &location);
  uint64_t v24 = v8;
  [v22 outputScannerAnnouncement:v18 completionBlock:v23];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  int v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_5:
  if (v11) {
    v8[2](v8);
  }
LABEL_7:
}

- (id)_elementManagerForScannerState
{
  unsigned __int8 v3 = [(SCATScannerManager *)self alternateKeysManager];
  unsigned int v4 = [v3 canBeActiveElementManager];

  if (v4)
  {
    id v5 = [(SCATScannerManager *)self alternateKeysManager];
  }
  else
  {
    unsigned int v6 = [(SCATScannerManager *)self candidateBarManager];
    unsigned int v7 = [v6 canBeActiveElementManager];

    if (v7)
    {
      id v5 = [(SCATScannerManager *)self candidateBarManager];
    }
    else
    {
      uint64_t v8 = [(SCATScannerManager *)self scrollViewPickerManager];
      unsigned int v9 = [v8 canBeActiveElementManager];

      if (v9)
      {
        id v5 = [(SCATScannerManager *)self scrollViewPickerManager];
      }
      else
      {
        unsigned int v10 = [(SCATScannerManager *)self gestureProvider];
        unsigned int v11 = [v10 canBeActiveElementManager];

        if (v11)
        {
          id v5 = [(SCATScannerManager *)self gestureProvider];
        }
        else
        {
          uint64_t v12 = [(SCATScannerManager *)self menu];
          unsigned int v13 = [v12 canBeActiveElementManager];

          if (v13) {
            [(SCATScannerManager *)self menu];
          }
          else {
          id v5 = [(SCATScannerManager *)self _primaryElementManagerForScannerState];
          }
        }
      }
    }
  }

  return v5;
}

- (id)_primaryElementManagerForScannerState
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchScannerPointPickerModeEnabled];

  int64_t v5 = [(SCATScannerManager *)self scanningMode];
  int64_t v6 = v5;
  if (v4) {
    BOOL v7 = (v5 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = [(SCATScannerManager *)self pointPicker];
    unsigned int v9 = +[AXSpringBoardServer server];
    if ([v9 isDockVisible]
      && [v9 isShowingNonSystemApp]
      && ![(SCATScannerManager *)self isExternalDisplayConnected]
      && v6 != 3)
    {
      uint64_t v10 = [(SCATScannerManager *)self elementNavController];

      uint64_t v8 = (void *)v10;
    }
  }
  else
  {
    if (v5 == 2)
    {
      _AXAssert();
LABEL_21:
      uint64_t v8 = 0;
      goto LABEL_26;
    }
    unsigned int v11 = [(SCATScannerManager *)self axManager];
    unsigned int v12 = [v11 hasZeroElements];

    if (!v12) {
      goto LABEL_24;
    }
    unsigned int v13 = [(SCATScannerManager *)self axManager];
    unsigned int v14 = [v13 frontmostAppMayBeLoading];

    unsigned __int8 v15 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v16 = [v15 ignoreLogging];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = +[AXSubsystemSCElementNav identifier];
      uint64_t v18 = AXLoggerForFacility();

      os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v18, v19))
      {
        double v20 = AXColorizeFormatLog();
        uint64_t v24 = v14;
        unsigned int v21 = _AXStringForArgs();
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v21;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (v14) {
      goto LABEL_21;
    }
    if (v4)
    {
      uint64_t v22 = [(SCATScannerManager *)self pointPicker];
    }
    else
    {
LABEL_24:
      uint64_t v22 = [(SCATScannerManager *)self elementNavController];
    }
    uint64_t v8 = (void *)v22;
  }
LABEL_26:

  return v8;
}

- (void)_updateActiveElementManager
{
}

- (void)_updateActiveElementManager:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self _elementManagerForScannerState];
  [(SCATScannerManager *)self setActiveElementManager:v5 completion:v4];
}

- (BOOL)_isScannerControlledByDriver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self activeScannerDriver];
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6;
}

- (void)_deactivateAudioSession
{
  unsigned __int8 v3 = [(SCATScannerManager *)self outputManager];
  [v3 setSoundAudioSessionActive:0];

  id v4 = [(SCATScannerManager *)self outputManager];
  [v4 setSpeechAudioSessionActive:0];
}

- (void)_updateAudioSessionState
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_deactivateAudioSession" object:0];
  if ([(SCATScannerManager *)self isActive])
  {
    if ([(SCATScannerManager *)self isSpeechEnabled])
    {
      unsigned __int8 v3 = [(SCATScannerManager *)self outputManager];
      [v3 setSpeechAudioSessionActive:1];
    }
    if ([(SCATScannerManager *)self areSoundEffectsEnabled])
    {
      id v5 = [(SCATScannerManager *)self outputManager];
      [v5 setSoundAudioSessionActive:1];
    }
  }
  else
  {
    id v4 = [(SCATScannerManager *)self outputManager];
    [v4 cancelSpeech];

    [(SCATScannerManager *)self performSelector:"_deactivateAudioSession" withObject:0 afterDelay:2.0];
  }
}

- (BOOL)isAutoscanEnabled
{
  unsigned __int8 v3 = [(SCATScannerManager *)self currentRecipe];
  if (v3)
  {
    id v4 = [(SCATScannerManager *)self currentRecipe];
    unsigned __int8 v5 = [v4 shouldContinueScanning];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  unsigned __int8 v6 = +[AXSettings sharedInstance];
  if (![v6 switchControlScanningStyle]) {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)isGroupingEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (int64_t)scanningMode
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 assistiveTouchScanningMode];

  return (int64_t)v3;
}

- (BOOL)areSoundEffectsEnabled
{
  v2 = [(SCATScannerManager *)self outputManager];
  unsigned __int8 v3 = [v2 areSoundEffectsEnabled];

  return v3;
}

- (BOOL)isSpeechEnabled
{
  v2 = [(SCATScannerManager *)self outputManager];
  unsigned __int8 v3 = [v2 isSpeechEnabled];

  return v3;
}

- (BOOL)isSwitchWithSource:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SCATScannerManager *)self inputController];
  unsigned __int8 v6 = [v5 isSwitchWithSource:v4];

  return v6;
}

- (BOOL)isUsingPointMode
{
  v2 = self;
  unsigned __int8 v3 = [(SCATScannerManager *)self _primaryElementManagerForScannerState];
  id v4 = [(SCATScannerManager *)v2 pointPicker];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (unint64_t)immediateSelectActionCount
{
  return 2;
}

- (BOOL)isLandscape
{
  uint64_t v2 = [(SCATScannerManager *)self currentDisplayID];
  unsigned __int8 v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 displayManagerForDisplayId:v2];

  if ([v4 isMainDisplay])
  {
    unsigned __int8 v5 = +[HNDHandManager sharedManager];
    unsigned __int8 v6 = [v5 mainDisplayManager];
    unsigned int v7 = [v6 orientation];

    BOOL v8 = v7 - 3 < 2;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isSystemSleeping
{
  uint64_t v2 = +[AXSystemAppServer server];
  unsigned __int8 v3 = [v2 isSystemSleeping];

  return v3;
}

- (SCATFocusContext)currentFocusContext
{
  uint64_t v2 = [(SCATScannerManager *)self activeScannerDriver];
  unsigned __int8 v3 = [v2 focusContext];

  return (SCATFocusContext *)v3;
}

- (SCATElement)currentElement
{
  uint64_t v2 = [(SCATScannerManager *)self currentFocusContext];
  unsigned __int8 v3 = [v2 element];

  return (SCATElement *)v3;
}

- (unsigned)currentDisplayID
{
  if (![(SCATScannerManager *)self lockedToDisplayID]) {
    goto LABEL_6;
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  unsigned __int8 v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 displayManagers];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D9C10;
  v16[3] = &unk_1001AE7D0;
  v16[4] = self;
  v16[5] = &v17;
  [v4 enumerateObjectsUsingBlock:v16];

  int v5 = *((unsigned __int8 *)v18 + 24);
  if (*((unsigned char *)v18 + 24)) {
    LODWORD(v3) = self->_lockedToDisplayID;
  }
  else {
    [(SCATScannerManager *)self setLockedToDisplayID:0];
  }
  _Block_object_dispose(&v17, 8);
  if (!v5)
  {
LABEL_6:
    unsigned __int8 v6 = [(SCATScannerManager *)self activeElementManager];
    unsigned int v7 = [(SCATScannerManager *)self pointPicker];

    if (v6 == v7)
    {
      unsigned int v11 = [(SCATScannerManager *)self activeElementManager];
      unsigned int v12 = [v11 currentDisplayID];
    }
    else
    {
      BOOL v8 = [(SCATScannerManager *)self menu];
      unsigned int v9 = [v8 element];
      if (v9)
      {
        uint64_t v10 = [(SCATScannerManager *)self menu];
        unsigned int v11 = [v10 element];
      }
      else
      {
        unsigned int v11 = [(SCATScannerManager *)self currentElement];
      }

      if (![v11 scatDisplayId])
      {
        unsigned int v13 = +[HNDHandManager sharedManager];
        unsigned int v14 = [v13 mainDisplayManager];
        LODWORD(v3) = [v14 displayID];

        goto LABEL_15;
      }
      unsigned int v12 = [v11 scatDisplayId];
    }
    LODWORD(v3) = v12;
LABEL_15:
  }
  return v3;
}

- (BOOL)isExternalDisplayConnected
{
  uint64_t v2 = +[HNDHandManager sharedManager];
  unsigned __int8 v3 = [v2 displayManagers];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)switchCurrentDisplayContext
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unsigned int v12 = 0;
  unsigned int v12 = [(SCATScannerManager *)self lockedToDisplayID];
  int v3 = *((_DWORD *)v10 + 6);
  if (!v3)
  {
    int v3 = 1;
    *((_DWORD *)v10 + 6) = 1;
  }
  BOOL v4 = +[HNDHandManager sharedManager];
  int v5 = [v4 displayManagers];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D9E24;
  v8[3] = &unk_1001AE7F8;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  if (v3 != *((_DWORD *)v10 + 6))
  {
    -[SCATScannerManager setLockedToDisplayID:](self, "setLockedToDisplayID:");
    unsigned __int8 v6 = [(SCATScannerManager *)self activeElementManager];
    unsigned int v7 = [(SCATScannerManager *)self scatUIContextForDisplayID:*((unsigned int *)v10 + 6)];
    [v6 presentWithDisplayContext:v7 animated:1];
  }
  _Block_object_dispose(&v9, 8);
}

- (id)axManager
{
  if (_AXSInUnitTestMode()
    && ([(SCATScannerManager *)self testAxManager],
        int v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    BOOL v4 = [(SCATScannerManager *)self testAxManager];
  }
  else
  {
    BOOL v4 = +[HNDAccessibilityManager sharedManager];
  }

  return v4;
}

- (NSArray)recentSpeechOutputStrings
{
  uint64_t v2 = [(SCATScannerManager *)self outputManager];
  int v3 = [v2 recentSpeechOutputStrings];

  return (NSArray *)v3;
}

- (void)clearRecentSpeech
{
  id v2 = [(SCATScannerManager *)self outputManager];
  [v2 clearRecentSpeech];
}

- (BOOL)isActive
{
  id v2 = [(SCATScannerManager *)self activeScannerDriver];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (BOOL)isPaused
{
  id v2 = [(SCATScannerManager *)self activeScannerDriver];
  unsigned __int8 v3 = [v2 isPaused];

  return v3;
}

- (BOOL)isInactive
{
  id v2 = [(SCATScannerManager *)self activeScannerDriver];
  unsigned __int8 v3 = [v2 isInactive];

  return v3;
}

- (void)beginScanningWithFocusContext:(id)a3
{
}

- (void)continueScanningWithFocusContext:(id)a3 foundNewElements:(BOOL)a4
{
}

- (void)_beginOrContinueScanningWithFocusContext:(id)a3 shouldBegin:(BOOL)a4 foundNewElements:(BOOL)a5
{
  id v8 = a3;
  if (![(SCATScannerManager *)self _shouldIgnoreAllScannerControlMessages])
  {
    uint64_t v9 = [(SCATScannerManager *)self menu];
    unsigned int v10 = [v9 isVisible];

    if (v10)
    {
      uint64_t v11 = [(SCATScannerManager *)self menu];
      unsigned int v12 = [v11 element];
      [v8 setMenuElement:v12];
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DA180;
    v14[3] = &unk_1001AB130;
    BOOL v16 = a5;
    v14[4] = self;
    BOOL v17 = a4;
    id v15 = v8;
    unsigned int v13 = objc_retainBlock(v14);
    [(SCATScannerManager *)self _updateActiveElementManager:v13];
  }
}

- (void)resumeScanning
{
  if (![(SCATScannerManager *)self _shouldIgnoreAllScannerControlMessages])
  {
    if ([(SCATScannerManager *)self didSetFocusContextForResume])
    {
      id v6 = [(SCATScannerManager *)self focusContextForResume];
      [(SCATScannerManager *)self beginScanningWithFocusContext:v6];
    }
    else
    {
      [(SCATScannerManager *)self _updateActiveElementManager];
      unsigned __int8 v3 = [(SCATScannerManager *)self activeElementManager];

      if (!v3)
      {
        BOOL v4 = [(SCATScannerManager *)self beginScanningTimer];
        [v4 cancel];

        int v5 = [(SCATScannerManager *)self beginScanningTimer];
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_1000DA494;
        v7[3] = &unk_1001AAA90;
        v7[4] = self;
        [v5 afterDelay:v7 processBlock:1.0];

        return;
      }
      id v6 = [(SCATScannerManager *)self activeScannerDriver];
      [v6 resumeScanning];
    }
  }
}

- (void)endScanning
{
  if (![(SCATScannerManager *)self _shouldIgnoreAllScannerControlMessages])
  {
    unsigned __int8 v3 = [(SCATScannerManager *)self beginScanningTimer];
    [v3 cancel];

    id v4 = [(SCATScannerManager *)self activeScannerDriver];
    [v4 endScanning];
  }
}

- (void)pauseScanning
{
}

- (void)pauseScanningWithScreenLockDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SCATScannerManager *)self _shouldIgnoreAllScannerControlMessages])
  {
    [(SCATScannerManager *)self setForceDisableScreenLock:v3];
    int v5 = [(SCATScannerManager *)self beginScanningTimer];
    [v5 cancel];

    id v6 = [(SCATScannerManager *)self activeScannerDriver];
    [v6 pauseScanning];

    [(SCATScannerManager *)self setForceDisableScreenLock:0];
  }
}

- (void)addReasonToDisableScanning:(id)a3
{
  id v4 = a3;
  int v5 = [(SCATScannerManager *)self reasonsToDisableScanning];

  if (!v5)
  {
    id v6 = +[NSMutableSet set];
    [(SCATScannerManager *)self setReasonsToDisableScanning:v6];
  }
  unsigned int v7 = [(SCATScannerManager *)self reasonsToDisableScanning];
  unsigned __int8 v8 = [v7 containsObject:v4];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(SCATScannerManager *)self reasonsToDisableScanning];
    id v10 = [v9 count];

    if (!v10)
    {
      uint64_t v11 = [(SCATScannerManager *)self activeScannerDriver];
      id v12 = [v11 isActive];

      unsigned int v13 = +[AXSubsystemSCPauseResume sharedInstance];
      unsigned __int8 v14 = [v13 ignoreLogging];

      if (v12)
      {
        if ((v14 & 1) == 0)
        {
          id v15 = +[AXSubsystemSCPauseResume identifier];
          BOOL v16 = AXLoggerForFacility();

          os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = AXColorizeFormatLog();
            uint64_t v19 = _AXStringForArgs();
            if (os_log_type_enabled(v16, v17))
            {
              int v26 = 138543362;
              id v27 = v19;
              _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&v26, 0xCu);
            }
          }
        }
        [(SCATScannerManager *)self pauseScanning];
      }
      else if ((v14 & 1) == 0)
      {
        char v20 = +[AXSubsystemSCPauseResume identifier];
        unsigned int v21 = AXLoggerForFacility();

        os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = AXColorizeFormatLog();
          uint64_t v24 = _AXStringForArgs();
          if (os_log_type_enabled(v21, v22))
          {
            int v26 = 138543362;
            id v27 = v24;
            _os_log_impl((void *)&_mh_execute_header, v21, v22, "%{public}@", (uint8_t *)&v26, 0xCu);
          }
        }
      }
      [(SCATScannerManager *)self setDidPauseForReasonsToDisableScanning:v12];
    }
    id v25 = [(SCATScannerManager *)self reasonsToDisableScanning];
    [v25 addObject:v4];
  }
}

- (void)removeReasonToDisableScanning:(id)a3
{
  id v4 = a3;
  int v5 = [(SCATScannerManager *)self reasonsToDisableScanning];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    unsigned int v7 = [(SCATScannerManager *)self reasonsToDisableScanning];
    [v7 removeObject:v4];

    unsigned __int8 v8 = +[AXSubsystemSCPauseResume sharedInstance];
    unsigned __int8 v9 = [v8 ignoreLogging];

    if ((v9 & 1) == 0)
    {
      id v10 = +[AXSubsystemSCPauseResume identifier];
      uint64_t v11 = AXLoggerForFacility();

      os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v11, v12))
      {
        unsigned int v13 = AXColorizeFormatLog();
        unsigned __int8 v14 = [(SCATScannerManager *)self reasonsToDisableScanning];
        id v18 = [v14 count];
        uint64_t v19 = [(SCATScannerManager *)self didPauseForReasonsToDisableScanning];
        id v15 = _AXStringForArgs();

        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138543362;
          unsigned int v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", buf, 0xCu);
        }
      }
    }
    BOOL v16 = [(SCATScannerManager *)self reasonsToDisableScanning];
    if ([v16 count])
    {
    }
    else
    {
      unsigned int v17 = [(SCATScannerManager *)self didPauseForReasonsToDisableScanning];

      if (v17) {
        [(SCATScannerManager *)self beginScanningWithFocusContext:0];
      }
    }
  }
}

- (BOOL)_shouldIgnoreAllScannerControlMessages
{
  id v2 = [(SCATScannerManager *)self reasonsToDisableScanning];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)useFocusContextOnResume:(id)a3
{
  [(SCATScannerManager *)self setFocusContextForResume:a3];

  [(SCATScannerManager *)self setDidSetFocusContextForResume:1];
}

- (BOOL)activateElement:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    int v5 = [(SCATScannerManager *)self activeScannerDriver];
    unsigned int v6 = [(SCATScannerManager *)self elementNavController];
    [v5 handleDrillInOnGroup:v4 elementManager:v6];

    unsigned int v7 = [(SCATScannerManager *)self activeScannerDriver];
    unsigned __int8 v8 = [v7 focusContext];
    unsigned int v9 = 1;
    [v8 setShouldResumeFromMenuDismissal:1];
  }
  else
  {
    unsigned int v9 = [v4 scatPerformAction:2010];
  }
  id v10 = [(SCATScannerManager *)self outputManager];
  [v10 playSound:1001];

  [(SCATScannerManager *)self _updateActiveElementManager];
  uint64_t v11 = [(SCATScannerManager *)self activeElementManager];
  [v11 scannerManager:self didActivateElement:v4];

  if ([v4 scatBeginScanningFromSelfAfterActivation])
  {
    os_log_type_t v12 = [(SCATScannerManager *)self activeElementManager];
    unsigned int v13 = +[SCATFocusContext focusContextWithElement:v4 elementManager:v12 selectBehavior:0 options:0];
    [(SCATScannerManager *)self beginScanningWithFocusContext:v13];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 scatUpdateValue];
  }
  if ((AXDeviceHasJindo() & v9) == 1)
  {
    if ([v4 scatIsAXElement])
    {
      unsigned __int8 v14 = [v4 uiElement];
      unsigned __int8 v15 = [v14 BOOLWithAXAttribute:2229];

      if ((v15 & 1) == 0) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
  }

  return v9;
}

- (void)selectElement:(id)a3
{
  [a3 scatCenterPoint];

  -[SCATScannerManager selectElementAtPoint:](self, "selectElementAtPoint:");
}

- (void)selectElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SCATScannerManager *)self gestureProvider];
  int v5 = +[AXNamedReplayableGesture tapGestureAtPoint:](AXNamedReplayableGesture, "tapGestureAtPoint:", x, y);
  [v6 replayGesture:v5];
}

- (BOOL)shouldBypassShowingMenuForElement:(id)a3
{
  id v4 = a3;
  int v5 = +[AXSettings sharedInstance];
  id v6 = [v5 switchControlTapBehavior];

  BOOL v8 = v6 == (id)2
    && (unint64_t v7 = (unint64_t)[v4 scatTraits], (kAXAdjustableTrait & ~v7) != 0)
    && [(SCATScannerManager *)self itemMenuState] == 0;

  return v8;
}

- (void)_updateScanningStyle
{
  id v5 = [(SCATScannerManager *)self _driverForScannerState];
  id v3 = [(SCATScannerManager *)self activeScannerDriver];

  id v4 = v5;
  if (v3 != v5)
  {
    [(SCATScannerManager *)self setActiveScannerDriver:v5];
    [(SCATScannerManager *)self beginScanningWithFocusContext:0];
    id v4 = v5;
  }
}

- (void)_showSimpleBannerWithText:(id)a3
{
  id v3 = a3;
  id v6 = +[HNDHandManager sharedManager];
  id v4 = [v6 mainDisplayManager];
  id v5 = sub_100040EC8(@"SWITCH_CONTROL_TITLE");
  [v4 showSimpleBannerWithTitle:v5 text:v3];
}

- (void)addPointerPointPickerForMovementNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self _pointerPointPickersToNotify];
  [v5 addPointer:v4];
}

- (void)removePointerPointPickerForMovementNotifications:(id)a3
{
  id v6 = a3;
  id v4 = [(SCATScannerManager *)self _pointerPointPickersToNotify];
  if ([v4 count])
  {
    uint64_t v5 = 0;
    while ([v4 pointerAtIndex:v5] != v6)
    {
      if (++v5 >= (unint64_t)[v4 count]) {
        goto LABEL_7;
      }
    }
    [v4 removePointerAtIndex:v5];
  }
LABEL_7:
  [v4 compact];
}

- (void)overrideMotionTrackerLookAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(SCATScannerManager *)self inputController];
  objc_msgSend(v5, "overrideMotionTrackerLookAtPoint:", x, y);
}

- (void)_resetRecipeTimeoutIfApplicable
{
  id v3 = +[NSThread currentThread];
  id v4 = +[NSThread mainThread];

  if (v3 != v4) {
    _AXAssert();
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_exitRecipeOnTimeout" object:0];
  uint64_t v5 = [(SCATScannerManager *)self currentRecipe];
  if (v5)
  {
    id v6 = (void *)v5;
    unint64_t v7 = [(SCATScannerManager *)self currentRecipe];
    [v7 timeout];
    double v9 = v8;
    double v10 = AXSwitchRecipeTimeoutNone;

    if (v9 != v10)
    {
      id v11 = [(SCATScannerManager *)self currentRecipe];
      [v11 timeout];
      -[SCATScannerManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_exitRecipeOnTimeout", 0);
    }
  }
}

- (void)_exitRecipeOnTimeout
{
  id v3 = [(SCATScannerManager *)self currentRecipe];

  if (!v3) {
    _AXAssert();
  }
  [(SCATScannerManager *)self setCurrentRecipe:0];

  [(SCATScannerManager *)self beginScanningWithFocusContext:0];
}

- (void)_applyLaunchRecipeUUID
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlLaunchRecipeUUID];

  if (v4)
  {
    uint64_t v5 = +[AXSettings sharedInstance];
    id v6 = [v5 switchControlRecipes];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          os_log_type_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v13 = objc_msgSend(v12, "uuid", (void)v16);
          unsigned __int8 v14 = [v3 switchControlLaunchRecipeUUID];
          unsigned int v15 = [v13 isEqual:v14];

          if (v15)
          {
            [(SCATScannerManager *)self setCurrentRecipe:v12];
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_setCurrentRecipe:(id)a3 shouldShowAlert:(BOOL)a4
{
  unsigned int v21 = (AXSwitchRecipe *)a3;
  id v6 = +[NSThread currentThread];
  id v7 = +[NSThread mainThread];

  if (v6 != v7) {
    _AXAssert();
  }
  id v8 = v21;
  if (v21)
  {
    id v9 = +[AXSettings sharedInstance];
    unsigned __int8 v10 = [v9 validateAndUpdateRecipeIfNeeded:v21];

    if (v10)
    {
      id v8 = v21;
    }
    else
    {
      id v11 = sub_100040EC8(@"RECIPE_VALIDATION_FAILED_FORMAT");
      os_log_type_t v12 = [(AXSwitchRecipe *)v21 name];
      unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
      [(SCATScannerManager *)self _showSimpleBannerWithText:v13];

      id v8 = 0;
    }
  }
  p_currentRecipe = &self->_currentRecipe;
  if (self->_currentRecipe != v8)
  {
    os_log_type_t v22 = v8;
    objc_storeStrong((id *)p_currentRecipe, v8);
    unsigned int v15 = [(SCATScannerManager *)self inputController];
    [v15 setRecipe:v22];

    if (v22 && ![(AXSwitchRecipe *)v22 shouldContinueScanning])
    {
      [(SCATScannerManager *)self addReasonToDisableScanning:@"Recipe"];
      [(SCATScannerManager *)self _updateScanningStyle];
      if (a4) {
        goto LABEL_14;
      }
    }
    else
    {
      [(SCATScannerManager *)self removeReasonToDisableScanning:@"Recipe"];
      [(SCATScannerManager *)self _updateScanningStyle];
      if (a4)
      {
        if (!v22)
        {
          long long v16 = +[HNDHandManager sharedManager];
          long long v17 = [v16 mainDisplayManager];
          long long v18 = sub_100040EC8(@"RECIPE_DEACTIVATED");
          [v17 showSimpleAlertWithText:v18];
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        long long v16 = +[HNDHandManager sharedManager];
        long long v17 = [v16 mainDisplayManager];
        long long v18 = sub_100040EC8(@"RECIPE_ACTIVATED_FORMAT");
        long long v19 = [(AXSwitchRecipe *)v22 name];
        char v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
        [v17 showSimpleAlertWithText:v20];

        goto LABEL_15;
      }
    }
LABEL_16:
    p_currentRecipe = (AXSwitchRecipe **)[(SCATScannerManager *)self _resetRecipeTimeoutIfApplicable];
    id v8 = v22;
  }

  _objc_release_x1(p_currentRecipe, v8);
}

- (void)setCurrentRecipe:(id)a3
{
}

- (void)_handleAppSwitcherAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleAppSwitcher];
}

- (void)_handleHomeAction
{
  if ((sub_100040850() & 1) == 0)
  {
    id v2 = +[AXPISystemActionHelper sharedInstance];
    [v2 activateHomeButton];
  }
}

- (void)_handleNotificationCenterAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleNotificationCenter];
}

- (void)_handleControlCenterAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleControlCenter];
}

- (void)_handleSiriAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 activateSiri];
}

- (void)_handleVolumeDownAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 decreaseVolume];
}

- (void)_handleForceTouchAction
{
  double y = CGPointZero.y;
  id v4 = [(SCATScannerManager *)self menu];
  unsigned int v5 = [v4 isVisible];

  if (v5)
  {
    id v6 = [(SCATScannerManager *)self gestureProvider];
    [v6 startingScreenPointForGestures];
    double x = v7;
    double v10 = v9;

    id v11 = [(SCATScannerManager *)self menu];
    [v11 hideWithCompletion:0];
  }
  else
  {
    os_log_type_t v12 = [(SCATScannerManager *)self activeScannerDriver];
    unsigned int v13 = [v12 focusContext];
    id v11 = [v13 element];

    if (v11)
    {
      [v11 scatScreenPointForOperations];
      double x = v14;
      double v10 = v15;
    }
    else
    {
      double v10 = y;
      double x = CGPointZero.x;
    }
  }

  if (x != CGPointZero.x || v10 != y)
  {
    id v18 = [(SCATScannerManager *)self gestureProvider];
    long long v17 = +[AXNamedReplayableGesture forceTouchGestureAtPoint:](AXNamedReplayableGesture, "forceTouchGestureAtPoint:", x, v10);
    [v18 replayGesture:v17];
  }
}

- (void)_handleDictationAction
{
  id v3 = [(SCATScannerManager *)self menu];
  id v2 = [v3 keyboardApplication];
  [v2 scatPerformAction:2049];
}

- (void)_handleTripleClickAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 activateTripleClick];
}

- (void)_handleVolumeUpAction
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 increaseVolume];
}

- (void)_handleEscapeAction
{
  id v3 = [(SCATScannerManager *)self menu];
  unsigned int v4 = [v3 isVisible];

  if (v4)
  {
    id v8 = [(SCATScannerManager *)self menu];
    [v8 hideWithCompletion:0];
  }
  else
  {
    unsigned int v5 = +[HNDAccessibilityManager sharedManager];
    id v8 = [v5 elementsForMatchingBlock:&stru_1001AE838];

    id v6 = [v8 firstObject];
    double v7 = v6;
    if (v6) {
      [v6 performAction:2013];
    }
  }
}

- (void)_handleCameraButton
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 pressCameraButton];
}

- (void)_handleCameraButtonLightPress
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 lightPressCameraButton];
}

- (void)_handleCameraButtonDoubleLightPress
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 doubleLightPressCameraButton];
}

- (void)_handleVisualIntelligence
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 openVisualIntelligence];
}

- (void)_handleActiveHoldAndDragAction
{
  id v3 = [(SCATScannerManager *)self menu];
  unsigned int v4 = [v3 isVisible];

  if (v4)
  {
    unsigned int v5 = [(SCATScannerManager *)self menu];
    [v5 hideWithCompletion:0];

    id v9 = [(SCATScannerManager *)self gestureProvider];
    id v6 = [(SCATScannerManager *)self gestureProvider];
    [v6 startingScreenPointForGestures];
  }
  else
  {
    id v9 = [(SCATScannerManager *)self gestureProvider];
    id v6 = [(SCATScannerManager *)self pointPicker];
    [v6 pickedPointInDeviceCoordinates];
  }
  objc_msgSend(v9, "toggleActiveHoldAndDragGestureAtScreenPoint:withDisplayID:", -[SCATScannerManager currentDisplayID](self, "currentDisplayID"), v7, v8);
}

- (void)_handleAppleWatchRemoteScreen
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleWatchRemoteScreen];
}

- (BOOL)canAdvertise
{
  id v2 = +[AXSettings sharedInstance];
  id v3 = [v2 switchControlDeviceMenuItems];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = AXSSwitchControlMenuItemEnabledKey;
    uint64_t v9 = AXSSwitchControlMenuItemTypeKey;
    uint64_t v10 = AXSSwitchControlMenuItemDeviceInterDevice;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        os_log_type_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unsigned int v13 = [v12 objectForKeyedSubscript:v8];
        unsigned int v14 = [v13 BOOLValue];

        double v15 = [v12 objectForKeyedSubscript:v9];
        long long v16 = v15;
        if (v14) {
          v6 |= [v15 isEqualToString:v10];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (void)didConnectAsForwarderToDeviceWithName:(id)a3
{
  id v4 = a3;
  id v5 = sub_100040EC8(@"CONNECTED_TO_RECEIVER_FORMAT");
  int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4);

  [(SCATScannerManager *)self _showSimpleBannerWithText:v6];
  [(SCATScannerManager *)self addReasonToDisableScanning:@"ForwardingActions"];
  if ((CPSetPowerAssertionWithIdentifier() & 1) == 0)
  {
    uint64_t v7 = AXSSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100115AA8(v7);
    }
  }
}

- (void)didConnectAsReceiverWithSettings:(id)a3
{
  id v3 = a3;
  if (!_AXSAssistiveTouchScannerEnabled())
  {
    _AXSAssistiveTouchScannerSetEnabled();
    id v4 = +[AXSettings sharedInstance];
    [v4 setSwitchControlIsEnabledAsReceiver:1];
    if (([v4 assistiveTouchSwitchUsageConfirmed] & 1) == 0)
    {
      id v5 = AXSSLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Applying forwarder device settings %@", (uint8_t *)&v8, 0xCu);
      }

      sub_100042D14(v3);
      [v4 setAssistiveTouchSwitchUsageConfirmed:1];
    }
  }
  int v6 = +[HNDAccessibilityManager sharedManager];
  [v6 resetElementFetcher];

  uint64_t v7 = +[HNDEventManager sharedManager];
  [v7 wakeDeviceFromSleepIfNecessary];
}

- (void)didDisconnectAsForwarderFromDeviceWithName:(id)a3
{
  id v4 = a3;
  if (_AXSAssistiveTouchScannerEnabled())
  {
    id v5 = sub_100040EC8(@"DISCONNECTED_FROM_RECEIVER_FORMAT");
    int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4);
    [(SCATScannerManager *)self _showSimpleBannerWithText:v6];
  }
  [(SCATScannerManager *)self removeReasonToDisableScanning:@"ForwardingActions"];
  if ((CPSetPowerAssertionWithIdentifier() & 1) == 0)
  {
    uint64_t v7 = AXSSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100115AEC(v7);
    }
  }
}

- (void)didDisconnectAsReceiver
{
  id v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 switchControlIsEnabledAsReceiver];

  if (v3)
  {
    id v4 = +[AXSettings sharedInstance];
    [v4 setSwitchControlIsEnabledAsReceiver:0];

    _AXSAssistiveTouchScannerSetEnabled();
  }
}

- (void)didBecomeIdle
{
  id v2 = [(SCATScannerManager *)self delegate];
  [v2 stopIfAllowed];
}

- (void)_disableUserInterfaceClientForPotentialReceiver
{
  id v3 = +[HNDHandManager sharedManager];
  id v2 = [v3 mainDisplayManager];
  [v2 removeUserInterfaceClientEnabler:@"PotentialReceiver"];
}

- (void)highlightAsPotentialReceiverForDeviceWithName:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_disableUserInterfaceClientForPotentialReceiver" object:0];
  id v5 = +[HNDHandManager sharedManager];
  int v6 = [v5 mainDisplayManager];
  [v6 addUserInterfaceClientEnabler:@"PotentialReceiver"];

  uint64_t v7 = +[HNDEventManager sharedManager];
  [v7 wakeDeviceFromSleepIfNecessary];

  int v8 = sub_100040EC8(@"POTENTIAL_RECEIVER_MESSAGE_FORMAT");
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  [(SCATScannerManager *)self _showSimpleBannerWithText:v9];

  [(SCATScannerManager *)self performSelector:"_disableUserInterfaceClientForPotentialReceiver" withObject:0 afterDelay:15.0];
}

- (void)_driver:(id)a3 outputAudioForContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(SCATScannerManager *)self areSoundEffectsEnabled];
  if (v7 && v8 && ([v7 shouldSuppressAudioOutput] & 1) == 0)
  {
    unsigned int v9 = [v7 shouldPlayMenuSoundOnFocus];
    uint64_t v10 = [(SCATScannerManager *)self outputManager];
    id v11 = v10;
    if (v9) {
      uint64_t v12 = 1002;
    }
    else {
      uint64_t v12 = 1000;
    }
    [v10 playSound:v12];
  }
  if ([(SCATScannerManager *)self isSpeechEnabled]
    && ([v7 shouldSuppressAudioOutput] & 1) == 0)
  {
    unsigned int v13 = [v7 element];
    unsigned int v14 = [v13 scatSpeakableDescription];

    if ([v14 length])
    {
      double v15 = [(SCATScannerManager *)self outputManager];
      unsigned int v16 = [v15 scanningInterruptsSpeech];

      long long v17 = [(SCATScannerManager *)self outputManager];
      id v18 = v17;
      if (v16)
      {
        [v17 outputScannerFocusContext:v7 completion:0];
      }
      else
      {
        [v6 outputManager:v17 willSpeakFocusContext:v7];

        long long v19 = [(SCATScannerManager *)self outputManager];
        objc_initWeak(&location, v19);

        long long v20 = [(SCATScannerManager *)self outputManager];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000DC748;
        v21[3] = &unk_1001AE888;
        id v22 = v6;
        objc_copyWeak(&v24, &location);
        id v23 = v7;
        [v20 outputScannerFocusContext:v23 completion:v21];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isFirstInSequence]) {
    int v10 = 4;
  }
  else {
    int v10 = 0;
  }
  uint64_t v11 = v10 | [(SCATScannerManager *)self isGroupingEnabled] ^ 1;
  uint64_t v12 = [(SCATScannerManager *)self menu];
  unsigned int v13 = [v12 isVisible];

  if (v13)
  {
    unsigned int v14 = [(SCATScannerManager *)self menu];
    double v15 = [v14 element];
    [v8 setMenuElement:v15];
  }
  unsigned int v16 = [(SCATScannerManager *)self cursorManager];
  [v16 updateWithFocusContext:v8 animated:0 options:v11];

  if ([(SCATScannerManager *)self isActive]) {
    [(SCATScannerManager *)self _driver:v17 outputAudioForContext:v8];
  }
  [(SCATScannerManager *)self setFocusContextForResume:0];
  [(SCATScannerManager *)self setDidSetFocusContextForResume:0];
  [(SCATScannerManager *)self _notifyObserversScannerDidFocusOnContext:v8 oldContext:v9];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
}

- (void)driverDidPause:(id)a3
{
  if ([(SCATScannerManager *)self _isScannerControlledByDriver:a3])
  {
    [(SCATScannerManager *)self hideUIContext:1];
    [(SCATScannerManager *)self _updateAudioSessionState];
  }

  [(SCATScannerManager *)self _notifyObserversScannerDidPause];
}

- (void)driverDidBecomeInactive:(id)a3
{
  if ([(SCATScannerManager *)self _isScannerControlledByDriver:a3])
  {
    [(SCATScannerManager *)self hideUIContext:1];
    [(SCATScannerManager *)self _updateAudioSessionState];
  }

  [(SCATScannerManager *)self _notifyObserversScannerDidBecomeInactive];
}

- (void)driverDidBecomeActive:(id)a3 didChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (-[SCATScannerManager _isScannerControlledByDriver:](self, "_isScannerControlledByDriver:"))
  {
    [(SCATScannerManager *)self showUIContext:1];
    [(SCATScannerManager *)self _updateAudioSessionState];
    if (v4)
    {
      id v6 = [(SCATScannerManager *)self currentFocusContext];
      [(SCATScannerManager *)self _driver:v7 outputAudioForContext:v6];

      [(SCATScannerManager *)self _notifyObserversScannerDidBecomeActive];
    }
  }
}

- (void)driver:(id)a3 indicateDwellScanningWillAbort:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (-[SCATScannerManager _isScannerControlledByDriver:](self, "_isScannerControlledByDriver:"))
  {
    id v6 = [(SCATScannerManager *)self cursorManager];
    id v7 = [v9 focusContext];
    if (v4) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = 0;
    }
    [v6 updateWithFocusContext:v7 animated:0 options:v8];
  }
}

- (unint64_t)minimumPointPickerNumberOfCyclesForDriver:(id)a3
{
  return +[SCATXYAxisPointPicker minimumNumberOfCycles];
}

- (void)actionHandlerForUIDidCancelPendingAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self selectActionHandler];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = [(SCATScannerManager *)self cursorManager];
    [v7 cancelSelectTimeoutAnimationIfNeeded];

    id v8 = [(SCATScannerManager *)self autoScanningDriver];
    [v8 resumeAutoscanning:1];
  }
}

- (void)actionHandlerForUIWillFireAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self selectActionHandler];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = [(SCATScannerManager *)self cursorManager];
    [v7 cancelSelectTimeoutAnimationIfNeeded];

    id v8 = [(SCATScannerManager *)self autoScanningDriver];
    [v8 resumeAutoscanning:1];
  }
}

- (void)actionHandlerForUI:(id)a3 willPerformDelayedActionOnContext:(id)a4 withCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [(SCATScannerManager *)self selectActionHandler];
  unsigned int v9 = [v7 isEqual:v8];

  if (a5 == 1 && v9)
  {
    int v10 = [(SCATScannerManager *)self activeElementManager];
    [v10 hideIfNeeded:0];

    uint64_t v11 = [(SCATScannerManager *)self autoScanningDriver];
    [v11 pauseAutoscanning];

    id v13 = [(SCATScannerManager *)self cursorManager];
    uint64_t v12 = [(SCATScannerManager *)self selectActionHandler];
    [v12 timeoutDuration];
    objc_msgSend(v13, "beginSelectTimeoutAnimation:");
  }
}

- (BOOL)cursorManagerShouldHideMenuCursor:(id)a3
{
  id v3 = [(SCATScannerManager *)self menu];
  unsigned __int8 v4 = [v3 shouldHideMenuCursor];

  return v4;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 1:
      [(SCATScannerManager *)self handleScreenChange:v8];
      goto LABEL_14;
    case 2:
      [(SCATScannerManager *)self handleAlertDidAppear:v8];
      goto LABEL_14;
    case 4:
      unsigned int v9 = [(SCATScannerManager *)self activeElementManager];
      [v9 appTransitionDidOccur:self];
      goto LABEL_8;
    case 5:
      unsigned int v9 = [(SCATScannerManager *)self activeElementManager];
      [v9 firstResponderDidChange:self];
      goto LABEL_8;
    case 6:
      int v10 = [(SCATScannerManager *)self gestureProvider];
      [v10 orientationDidChange:self];

      uint64_t v11 = [(SCATScannerManager *)self activeElementManager];
      [v11 orientationDidChange:self];

      uint64_t v12 = [(SCATScannerManager *)self activeElementManager];
      id v13 = [(SCATScannerManager *)self menu];

      if (v12 == v13) {
        goto LABEL_14;
      }
      unsigned int v9 = [(SCATScannerManager *)self menu];
      [v9 orientationDidChange:self];
LABEL_8:

LABEL_14:

      return;
    case 7:
      unsigned int v14 = [(SCATScannerManager *)self outputManager];
      unsigned int v15 = [v14 areSoundEffectsEnabled];

      if (v15)
      {
        unsigned int v16 = [(SCATScannerManager *)self outputManager];
        [v16 playSound:1006];
      }
      [(SCATScannerManager *)self _setCurrentRecipe:0 shouldShowAlert:0];
      [(SCATScannerManager *)self endScanning];
      goto LABEL_14;
    case 10:
      [(SCATScannerManager *)self handleAnnouncement:v8];
      goto LABEL_14;
    case 11:
      [(SCATScannerManager *)self handleStopSpeaking:v8];
      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

- (void)accessibilityManager:(id)a3 screenWillChange:(__CFData *)a4
{
  id v5 = [(SCATScannerManager *)self activeElementManager];
  [v5 screenWillChange:self];
}

- (int)_validatedSelectBehaviorForCurrentSelectBehavior:(int)a3 replacementElement:(id)a4
{
  int v4 = a3;
  if ((a3 - 3) <= 1 && ![a4 isGroup]) {
    return 0;
  }
  return v4;
}

- (void)handleAnnouncement:(id)a3
{
  id v7 = a3;
  int v4 = [(SCATScannerManager *)self outputManager];
  unsigned int v5 = [v4 isSpeechEnabled];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v7 hasPrefix:@"AXAnnouncementType"] & 1) == 0
      && ([v7 isEqualToString:kAXAnnouncementCollaborationOccurredSound] & 1) == 0)
    {
      unsigned int v6 = [(SCATScannerManager *)self outputManager];
      [v6 outputScannerAnnouncement:v7 completionBlock:0];
    }
  }
}

- (void)handleAlertDidAppear:(id)a3
{
  int v4 = [(SCATScannerManager *)self activeElementManager];
  [v4 alertDidAppear:self];

  unsigned int v5 = [(SCATScannerManager *)self outputManager];
  unsigned int v6 = [v5 areSoundEffectsEnabled];

  if (v6)
  {
    id v7 = [(SCATScannerManager *)self outputManager];
    [v7 playSound:1003];
  }
}

- (void)handleScreenChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SCATScannerManager *)self outputManager];
  unsigned int v6 = [v5 areSoundEffectsEnabled];

  if (v6)
  {
    id v7 = [(SCATScannerManager *)self outputManager];
    [v7 playSound:1005];
  }
  id v8 = [(SCATScannerManager *)self activeElementManager];
  [v8 screenDidChange:self data:v4];
}

- (void)handleStopSpeaking:(id)a3
{
  id v4 = [(SCATScannerManager *)self outputManager];
  unsigned int v5 = [v4 isSpeechEnabled];

  if (v5)
  {
    id v6 = [(SCATScannerManager *)self outputManager];
    [v6 cancelSpeech];
  }
}

- (void)_updateMenuAfterElementFetchFoundNewElements:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCATScannerManager *)self isActive]
    && ([(SCATScannerManager *)self activeElementManager],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [(SCATScannerManager *)self menu],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    id v7 = [(SCATScannerManager *)self currentElement];
  }
  else
  {
    id v7 = 0;
  }
  unsigned int v18 = 0;
  id v8 = [(SCATScannerManager *)self menu];
  unsigned int v9 = [v8 updateAfterFetchWithCurrentlyScannedElement:v7 options:&v18];

  if (v9)
  {
    int v10 = [(SCATScannerManager *)self currentFocusContext];
    uint64_t v11 = -[SCATScannerManager _validatedSelectBehaviorForCurrentSelectBehavior:replacementElement:](self, "_validatedSelectBehaviorForCurrentSelectBehavior:replacementElement:", [v10 selectBehavior], v9);

    uint64_t v12 = [(SCATScannerManager *)self menu];
    id v13 = +[SCATFocusContext focusContextWithElement:v9 elementManager:v12 selectBehavior:v11 options:v18];
    [(SCATScannerManager *)self continueScanningWithFocusContext:v13 foundNewElements:v3];
  }
  unsigned int v14 = [(SCATScannerManager *)self currentFocusContext];
  unsigned int v15 = [(SCATScannerManager *)self menu];
  unsigned int v16 = [v15 element];
  [v14 setMenuElement:v16];

  id v17 = [(SCATScannerManager *)self cursorManager];
  [v17 updateWithFocusContext:v14 animated:0 options:0];
}

- (void)accessibilityManager:(id)a3 didFetchElementsForEvent:(int64_t)a4 foundNewElements:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (!_AXSInUnitTestMode()
    || ([(SCATScannerManager *)self testAxManager],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v7))
  {
    unsigned int v9 = [(SCATScannerManager *)self activeElementManager];
    [(SCATScannerManager *)self _updateActiveElementManager];
    int v10 = [(SCATScannerManager *)self activeElementManager];

    if (v10)
    {
      uint64_t v11 = [(SCATScannerManager *)self activeElementManager];
      uint64_t v12 = [(SCATScannerManager *)self currentFocusContext];
      id v13 = [(SCATScannerManager *)self activeElementManager];
      [v11 didFetchElements:self foundNewElements:v5 currentFocusContext:v12 didChangeActiveElementManager:v9 != v13];
    }
    else
    {
      unsigned int v14 = [(SCATScannerManager *)self beginScanningTimer];
      [v14 cancel];

      uint64_t v11 = [(SCATScannerManager *)self beginScanningTimer];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000DD810;
      v24[3] = &unk_1001AAA90;
      v24[4] = self;
      [v11 afterDelay:v24 processBlock:1.0];
    }

    unsigned int v15 = [(SCATScannerManager *)self menu];
    unsigned int v16 = [v15 isVisible];

    if (v16)
    {
      id v17 = [(SCATScannerManager *)self menu];
      unsigned int v18 = [v17 element];

      if (([v18 scatUpdatesMenu] & 1) != 0
        || (unint64_t v19 = (unint64_t)[v18 scatTraits], (kAXCausesPageTurnTrait & ~v19) == 0)
        && ([(SCATScannerManager *)self axManager],
            long long v20 = objc_claimAutoreleasedReturnValue(),
            [v20 scannerElementMatchingElement:v18],
            long long v21 = objc_claimAutoreleasedReturnValue(),
            v21,
            v20,
            !v21))
      {
        [(SCATScannerManager *)self _updateMenuAfterElementFetchFoundNewElements:v5];
      }
    }
    if (AXInPreboardScenario())
    {
      id v22 = [(SCATScannerManager *)self axManager];
      unsigned int v23 = [v22 hasZeroElements];

      if (v23) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
  }
}

- (void)accessibilityManager:(id)a3 nativeFocusElementDidChange:(id)a4
{
  id v14 = a4;
  [a3 refreshElements];
  id v6 = [(SCATScannerManager *)self menu];
  unsigned int v7 = [v6 isWaitingToBePresented];

  if (v7)
  {
    id v8 = [(SCATScannerManager *)self menu];
    [v8 presentWithElement:v14];

    unsigned int v9 = [(SCATScannerManager *)self menu];
    [v9 setIsWaitingToBePresented:0];
  }
  int v10 = [(SCATScannerManager *)self activeElementManager];
  uint64_t v11 = [(SCATScannerManager *)self menu];

  if (v10 == v11)
  {
    uint64_t v12 = [(SCATScannerManager *)self menu];
    [v12 nativeFocusElementDidChange:v14];

    id v13 = [(SCATScannerManager *)self activeScannerDriver];
    [v13 tickleIdleTimer];
  }
}

- (void)accessibilityManager:(id)a3 updateElementVisuals:(id)a4
{
  id v4 = [(SCATScannerManager *)self updateElementVisualsCoalescer];
  [v4 notifyUpdateElementVisualsEventDidOccur];
}

- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4
{
  id v6 = a4;
  [a3 refreshElements];
  unsigned int v7 = [(SCATScannerManager *)self activeElementManager];
  id v8 = [(SCATScannerManager *)self menu];

  if (v7 == v8)
  {
    unsigned int v9 = [(SCATScannerManager *)self menu];
    [v9 hideWithCompletion:0];

    [(SCATScannerManager *)self endScanning];
    int v10 = dispatch_get_global_queue(9, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000DDACC;
    v11[3] = &unk_1001AAC78;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(v10, v11);
  }
}

- (void)_waitForApplication:(id)a3
{
  id v3 = a3;
  id v24 = +[NSDate date];
  id v4 = 0;
  while (1)
  {
    BOOL v5 = [v4 bundleId];
    id v6 = [v3 valueForKey:@"bundleID"];
    unsigned __int8 v7 = [v5 isEqualToString:v6];

    if (v7) {
      break;
    }
    id v8 = +[AXElement systemWideElement];
    unsigned int v9 = [v8 systemApplication];
    int v10 = [v9 currentApplications];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      id v25 = v4;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned int v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v17 = [v16 bundleId];
          unsigned int v18 = [v3 valueForKey:@"bundleID"];
          unsigned int v19 = [v17 isEqualToString:v18];

          if (v19)
          {
            id v4 = v16;

            goto LABEL_13;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      id v4 = v25;
    }
LABEL_13:

    [v24 timeIntervalSinceNow];
    double v21 = v20;

    if (v21 > 2.0) {
      goto LABEL_16;
    }
  }
  [v4 nativeFocusElement];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDD7C;
  block[3] = &unk_1001AAC78;
  block[4] = self;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v27;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_16:
}

- (void)_updateElementVisuals
{
  id v10 = [(SCATScannerManager *)self activeScannerDriver];
  id v3 = [v10 focusContext];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 elementManager];
    id v6 = [(SCATScannerManager *)self menu];
    if (v5 == v6) {
      [v4 menuElement];
    }
    else {
    unsigned __int8 v7 = [v4 element];
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      [v8 clearCachedFrame:1 cachedVisibleFrame:1];
      [v8 updateCache:2003];
      [v8 updateCache:2042];
    }
    unsigned int v9 = [(SCATScannerManager *)self cursorManager];
    [v9 updateWithFocusContext:v4 animated:0 options:0];
  }
}

- (void)accessibilityManagerShouldPauseScanning:(id)a3
{
}

- (void)accessibilityManagerShouldResumeScanning:(id)a3
{
}

- (void)didBeginLongPressForInputController:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 assistiveTouchLongPressPauseScanningEnabled];

  if (v5)
  {
    id v6 = [(SCATScannerManager *)self autoScanningDriver];
    [v6 pauseAutoscanning];
  }
}

- (void)didEndLongPressForInputController:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 assistiveTouchLongPressPauseScanningEnabled];

  if (v5)
  {
    id v7 = [(SCATScannerManager *)self autoScanningDriver];
    id v6 = [(SCATScannerManager *)self selectActionHandler];
    objc_msgSend(v7, "resumeAutoscanning:", objc_msgSend(v6, "isPending") ^ 1);
  }
}

- (void)inputController:(id)a3 didReceiveAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SCATScannerManager *)self setCurrentAction:v7];
  id v8 = +[HNDHandManager sharedManager];
  [v8 notifyUserEventOccurred];

  if (![(SCATScannerManager *)self isSystemSleeping])
  {
    id v10 = [(SCATScannerManager *)self selectActionHandler];
    id v11 = [v10 delegate];
    if ([v11 isEqual:self])
    {
      id v12 = [(SCATScannerManager *)self selectActionHandler];
      id v13 = [v12 actionCount];

      if (v13)
      {
        if ([v7 action] == (id)103)
        {
          uint64_t v14 = [(SCATScannerManager *)self selectActionHandler];
          unsigned int v15 = v14;
        }
        else
        {
          id v19 = [v7 action];
          uint64_t v14 = [(SCATScannerManager *)self selectActionHandler];
          unsigned int v15 = v14;
          if (v19 != (id)109)
          {
            [v14 cancelPendingAction];
            goto LABEL_22;
          }
        }
        [v14 notifyDidReceiveAction:self];
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
    }
    if (![(SCATScannerManager *)self isInactive])
    {
      if (![(SCATScannerManager *)self isPaused])
      {
        unsigned int v16 = [(SCATScannerManager *)self activeScannerDriver];
        if (objc_opt_respondsToSelector())
        {
          id v17 = [(SCATScannerManager *)self activeScannerDriver];
          unsigned __int8 v18 = [v17 handleInputAction:v7];

          if (v18) {
            goto LABEL_23;
          }
        }
        else
        {
        }
        double v20 = [v7 shortcutIdentifier];

        if (v20)
        {
          double v21 = +[AXSiriShortcutsManager sharedManager];
          id v22 = [v7 shortcutIdentifier];
          unsigned int v23 = [v21 shortcutForIdentifier:v22];

          id v24 = +[AXSiriShortcutsManager sharedManager];
          [v24 performShortcut:v23];

LABEL_20:
        }
        else
        {
          uint64_t v25 = (uint64_t)[v7 action];
          if (v25 <= 199)
          {
            switch(v25)
            {
              case 'd':
              case 'g':
              case 'm':
                [(SCATScannerManager *)self beginScanningWithFocusContext:0];
                goto LABEL_23;
              case 'e':
                id v27 = +[AXSettings sharedInstance];
                unsigned int v28 = [v27 switchControlHasEmptyTopLevelMenu];

                if (v28)
                {
                  id v51 = v6;
                  AXPerformBlockAsynchronouslyOnMainThread();

                  goto LABEL_23;
                }
                v40 = [(SCATScannerManager *)self menu];
                unsigned int v41 = [v40 isVisible];

                if (!v41)
                {
                  v42 = [(SCATScannerManager *)self activeScannerDriver];
                  unsigned int v15 = [v42 focusContext];

                  v43 = [v15 element];

                  v44 = [(SCATScannerManager *)self menu];
                  if (v43)
                  {
                    v45 = [v15 element];
                    [v44 presentWithElement:v45];
                  }
                  else
                  {
                    v45 = [(SCATScannerManager *)self pointPicker];
                    [v44 presentWithPointPicker:v45];
                  }

                  goto LABEL_22;
                }
                int v26 = [(SCATScannerManager *)self menu];
                [v26 hideWithCompletion:&stru_1001AE8A8];
LABEL_63:

                break;
              case 'f':
                long long v29 = [(SCATScannerManager *)self activeScannerDriver];
                unsigned int v23 = [v29 focusContext];

                long long v30 = [(SCATScannerManager *)self autoScanningDriver];
                [(SCATScannerManager *)self setActiveScannerDriver:v30];

                [(SCATScannerManager *)self beginScanningWithFocusContext:v23];
                goto LABEL_20;
              case 'h':
                LOBYTE(v46) = 1;
                _AXLogWithFacility();
                long long v31 = [(SCATScannerManager *)self activeScannerDriver];
                unsigned int v15 = [v31 focusContext];

                int v32 = [(SCATScannerManager *)self activeScannerDriver];
                uint64_t v33 = v32;
                v34 = v15;
                uint64_t v35 = 0;
                goto LABEL_52;
              case 'i':
                LOBYTE(v46) = 1;
                _AXLogWithFacility();
                v36 = [(SCATScannerManager *)self activeScannerDriver];
                unsigned int v15 = [v36 focusContext];

                int v32 = [(SCATScannerManager *)self activeScannerDriver];
                uint64_t v33 = v32;
                v34 = v15;
                uint64_t v35 = 1;
LABEL_52:
                v37 = [v32 nextFocusContextFromContext:v34 inDirection:v35 didWrap:0];

                v38 = [(SCATScannerManager *)self manualScanningDriver];
                [(SCATScannerManager *)self setActiveScannerDriver:v38];

                v39 = [(SCATScannerManager *)self activeScannerDriver];
                [v39 beginScanningWithFocusContext:v37];

                goto LABEL_22;
              case 'j':
                [(SCATScannerManager *)self endScanning];
                goto LABEL_23;
              case 'k':
                int v26 = [(SCATScannerManager *)self menu];
                [v26 presentSiriShortcutsMenu];
                goto LABEL_63;
              case 'l':
                [(SCATScannerManager *)self _handleAppleWatchRemoteScreen];
                goto LABEL_23;
              default:
LABEL_64:
                [v7 action];
                unsigned int v15 = SCATActionDescription();
                v49 = v15;
                v50 = self;
                CFStringRef v47 = @"Unable to handle unknown action: %@ (%@). manager:%@";
                id v48 = v7;
                LOBYTE(v46) = 1;
                _AXLogWithFacility();
                goto LABEL_22;
            }
          }
          else
          {
            switch(v25)
            {
              case 200:
                [(SCATScannerManager *)self _handleAppSwitcherAction];
                break;
              case 201:
                [(SCATScannerManager *)self _handleHomeAction];
                break;
              case 202:
                [(SCATScannerManager *)self _handleNotificationCenterAction];
                break;
              case 203:
                [(SCATScannerManager *)self _handleSiriAction];
                break;
              case 204:
                [(SCATScannerManager *)self _handleVolumeDownAction];
                break;
              case 205:
                [(SCATScannerManager *)self _handleVolumeUpAction];
                break;
              case 206:
                [(SCATScannerManager *)self _handleForceTouchAction];
                break;
              case 207:
                [(SCATScannerManager *)self _handleDictationAction];
                break;
              case 208:
                [(SCATScannerManager *)self _handleTripleClickAction];
                break;
              case 209:
                [(SCATScannerManager *)self _handleControlCenterAction];
                break;
              case 210:
                [(SCATScannerManager *)self _handleEscapeAction];
                break;
              case 211:
                [(SCATScannerManager *)self _handleCameraButton];
                break;
              case 212:
                [(SCATScannerManager *)self _handleCameraButtonLightPress];
                break;
              case 213:
                [(SCATScannerManager *)self _handleCameraButtonDoubleLightPress];
                break;
              default:
                switch(v25)
                {
                  case 300:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVSelectButton];
                    goto LABEL_63;
                  case 301:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVMenuButton];
                    goto LABEL_63;
                  case 302:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVHomeButton];
                    goto LABEL_63;
                  case 303:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVPlayPauseButton];
                    goto LABEL_63;
                  case 304:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVUpButton];
                    goto LABEL_63;
                  case 305:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVDownButton];
                    goto LABEL_63;
                  case 306:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVLeftButton];
                    goto LABEL_63;
                  case 307:
                    int v26 = +[AXElement systemWideElement];
                    [v26 systemPressTVRightButton];
                    goto LABEL_63;
                  default:
                    if (v25 != 400) {
                      goto LABEL_64;
                    }
                    [(SCATScannerManager *)self _handleActiveHoldAndDragAction];
                    break;
                }
                break;
            }
          }
        }
        goto LABEL_23;
      }
      [(SCATScannerManager *)self resumeScanning];
LABEL_23:
      unsigned int v9 = +[HNDAccessibilityManager sharedManager];
      [v9 userDidPerformSwitchAction];
      goto LABEL_24;
    }
    unsigned int v15 = [(SCATScannerManager *)self _driverForScannerState];
    [(SCATScannerManager *)self setActiveScannerDriver:v15];
    [(SCATScannerManager *)self beginScanningWithFocusContext:0];
    goto LABEL_22;
  }
  unsigned int v9 = +[HNDEventManager sharedManager];
  [v9 wakeDeviceFromSleepIfNecessary];
LABEL_24:
}

- (void)inputController:(id)a3 didReceiveRecipeActionForMappingAtIndex:(unint64_t)a4 isLongPressAction:(BOOL)a5
{
  BOOL v5 = a5;
  id v26 = a3;
  [(SCATScannerManager *)self _resetRecipeTimeoutIfApplicable];
  id v8 = [v26 recipe];
  unsigned int v9 = [v8 mappings];
  id v10 = [v9 objectAtIndexedSubscript:a4];

  if (v5) {
    [v10 longPressAction];
  }
  else {
  id v11 = [v10 action];
  }
  if (!v11)
  {
    unint64_t v24 = a4;
    BOOL v25 = v5;
    _AXAssert();
  }
  if (objc_msgSend(v11, "isEqualToString:", AXSwitchRecipeMappingActionSelect, v24, v25))
  {
    id v12 = +[SCATActionItem fromAction:103];
    [(SCATScannerManager *)self inputController:v26 didReceiveAction:v12];
LABEL_16:

    goto LABEL_17;
  }
  if ([v11 isEqualToString:AXSwitchRecipeMappingActionExit])
  {
    [(SCATScannerManager *)self setCurrentRecipe:0];
    [(SCATScannerManager *)self beginScanningWithFocusContext:0];
    goto LABEL_17;
  }
  if ([v11 isEqualToString:AXSwitchRecipeMappingActionCenterTap])
  {
    id v13 = objc_alloc_init((Class)AXCenterTapReplayableGesture);
LABEL_15:
    id v12 = v13;
    unsigned int v16 = [(SCATScannerManager *)self gestureProvider];
    [v16 replayGesture:v12];

    goto LABEL_16;
  }
  unsigned __int8 v14 = [v11 isEqualToString:AXSwitchRecipeMappingActionRightToLeftSwipe];
  uint64_t v15 = AXSwitchRecipeMappingActionLeftToRightSwipe;
  if ((v14 & 1) != 0
    || [v11 isEqualToString:AXSwitchRecipeMappingActionLeftToRightSwipe])
  {
    id v13 = objc_msgSend(objc_alloc((Class)AXPageTurningReplayableGesture), "initForLeftToRightSwipe:", objc_msgSend(v11, "isEqualToString:", v15));
    goto LABEL_15;
  }
  if (![v11 isEqualToString:AXSwitchRecipeMappingGameControlButtonPress])
  {
    if (v5) {
      [v10 longPressGesture];
    }
    else {
    id v13 = [v10 gesture];
    }
    goto LABEL_15;
  }
  id v17 = [v10 gameControlButtonPress];
  unsigned __int8 v18 = +[AXElement systemWideElement];
  id v19 = [v18 systemApplication];
  double v20 = [v19 currentApplications];
  double v21 = [v20 firstObject];

  id v22 = [v21 uiElement];
  unsigned int v23 = [v17 dictionaryRepresentation];
  [v22 performAXAction:7000 withValue:v23];

LABEL_17:
}

- (void)inputController:(id)a3 didReceiveRecipeHoldAtPoint:(CGPoint)a4 isDown:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  [(SCATScannerManager *)self _resetRecipeTimeoutIfApplicable];
  id v9 = [(SCATScannerManager *)self gestureProvider];
  objc_msgSend(v9, "performHoldAtPoint:isDown:", v5, x, y);
}

- (id)userInterfaceClientForInputController:(id)a3
{
  id v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 mainDisplayManager];
  BOOL v5 = [v4 userInterfaceClient];

  return v5;
}

- (void)performSysdiagnoseForInputController:(id)a3
{
  id v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing sysdiagnose.", v4, 2u);
  }

  +[Libsysdiagnose sysdiagnoseWithMetadata:&off_1001BC2D8 onCompletion:&stru_1001AE8E8];
}

- (void)inputController:(id)a3 didReceivePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(SCATScannerManager *)self pointPicker];
  objc_msgSend(v7, "moveToPoint:", x, y);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(SCATScannerManager *)self _pointerPointPickersToNotify];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (v13) {
          objc_msgSend(v13, "moveToPoint:", x, y);
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)shouldUseCameraPointPicker
{
  id v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 switchControlUseCameraForPointMode];

  return v3;
}

- (void)inputControllerPointPickerInterrupted:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchScanningMode];

  if (v4 == (id)3)
  {
    id v5 = +[AXSettings sharedInstance];
    [v5 setAssistiveTouchScanningMode:0];
  }
}

- (void)menu:(id)a3 showAlternateKeysForKey:(id)a4
{
  id v5 = a4;
  id v6 = [(SCATScannerManager *)self alternateKeysManager];
  [v6 showAlternateKeysForKey:v5];
}

- (void)menu:(id)a3 showTypingCandidates:(id)a4
{
  id v5 = a4;
  id v6 = [(SCATScannerManager *)self candidateBarManager];
  [v6 setTypingCandidates:v5];
}

- (CGRect)menu:(id)a3 rectToClearForFingersWithGestureSheet:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SCATScannerManager *)self gestureProvider];
  [v5 rectToClearForFingersWithGestureSheet:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)gesturesSheetForMenu:(id)a3
{
  unsigned __int8 v3 = [(SCATScannerManager *)self gestureProvider];
  BOOL v4 = [v3 gesturesSheet];

  return v4;
}

- (void)didPressScreenChangingButtonInMenu:(id)a3
{
  id v4 = [(SCATScannerManager *)self activeElementManager];
  [v4 screenChangingButtonWasPressed:self];
}

- (id)exitActionElementForFingersInMenu:(id)a3
{
  unsigned __int8 v3 = [(SCATScannerManager *)self gestureProvider];
  id v4 = [v3 elementForFingers];

  return v4;
}

- (void)menu:(id)a3 activateRecipe:(id)a4
{
}

- (BOOL)_isPostScanningMenu:(id)a3
{
  unsigned __int8 v3 = [a3 screenPoint];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldAddItemSpecificMenuOptionsToMenu:(id)a3
{
  return [(SCATScannerManager *)self _isPostScanningMenu:a3];
}

- (void)menu:(id)a3 setItemMenuState:(int64_t)a4
{
}

- (BOOL)shouldShowAppWideScrollActionsInMenu:(id)a3
{
  return [(SCATScannerManager *)self _isPostScanningMenu:a3];
}

- (void)menu:(id)a3 showScrollViewPickerForScrollViews:(id)a4 elementsToScroll:(id)a5 scrollAction:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  double v11 = [(SCATScannerManager *)self scrollViewPickerManager];

  if (!v11)
  {
    double v12 = objc_alloc_init(SCATScrollViewPickerManager);
    [(SCATScannerManager *)self setScrollViewPickerManager:v12];
  }
  double v13 = [(SCATScannerManager *)self scrollViewPickerManager];
  [v13 setScrollViews:v10];

  double v14 = [(SCATScannerManager *)self scrollViewPickerManager];
  [v14 setElementsToScroll:v9];

  id v15 = [(SCATScannerManager *)self scrollViewPickerManager];
  [v15 setScrollAction:v6];
}

- (BOOL)canSearchForControllableDevicesWithMenu:(id)a3
{
  unsigned __int8 v3 = [(SCATScannerManager *)self interDeviceCommunicator];
  unsigned __int8 v4 = [v3 canSearch];

  return v4;
}

- (void)searchForControllableDevicesWithMenu:(id)a3
{
  id v3 = [(SCATScannerManager *)self interDeviceCommunicator];
  [v3 search];
}

- (BOOL)canReturnControlToForwarderDevice:(id)a3
{
  id v3 = [(SCATScannerManager *)self interDeviceCommunicator];
  unsigned __int8 v4 = [v3 isReceivingSwitchEvents];

  return v4;
}

- (void)returnControlToForwarderDevice:(id)a3
{
  id v3 = [(SCATScannerManager *)self interDeviceCommunicator];
  [v3 stop];
}

- (void)menu:(id)a3 showSysdiagnoseDisplayString:(id)a4
{
}

- (void)menu:(id)a3 speakAnnouncement:(id)a4 completionBlock:(id)a5
{
  id v9 = a4;
  double v7 = (void (**)(id, void))a5;
  if ([(SCATScannerManager *)self isSpeechEnabled])
  {
    double v8 = [(SCATScannerManager *)self outputManager];
    [v8 outputScannerAnnouncement:v9 completionBlock:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (void)menu:(id)a3 playSoundEffect:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(SCATScannerManager *)self areSoundEffectsEnabled])
  {
    id v6 = [(SCATScannerManager *)self outputManager];
    [v6 playSound:v4];
  }
}

- (void)menuDidDisappear:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [(SCATScannerManager *)self activeScannerDriver];
  id v5 = [v4 focusContext];

  [(SCATScannerManager *)self _updateActiveElementManager];
  id v6 = [(SCATScannerManager *)self activeElementManager];
  double v7 = [(SCATScannerManager *)self pointPicker];

  double v8 = +[AXSettings sharedInstance];
  id v9 = [v8 switchControlScanAfterTapLocation];

  if (v9 && [v5 shouldResumeFromMenuDismissal] && v6 != v7)
  {
    id v10 = [v5 element];
    double v11 = [(SCATScannerManager *)self activeElementManager];
    uint64_t v12 = +[SCATFocusContext focusContextWithElement:v10 elementManager:v11 selectBehavior:0 options:0];
  }
  else
  {
    id v10 = [(SCATScannerManager *)self activeElementManager];
    double v11 = [v15 element];
    uint64_t v12 = [v10 nextFocusContextAfterDismissingMenuForElement:v11];
  }
  double v13 = (void *)v12;

  [(SCATScannerManager *)self beginScanningWithFocusContext:v13];
  if ([(SCATScannerManager *)self itemMenuState])
  {
    double v14 = [v15 element];

    if (v14)
    {
      if ((id)[(SCATScannerManager *)self itemMenuState] == (id)1) {
        [(SCATScannerManager *)self setItemMenuState:0];
      }
    }
  }
}

- (void)menuWillBeginTransition:(id)a3
{
  id v3 = [(SCATScannerManager *)self cursorManager];
  [v3 hideCursor:1 animated:0];
}

- (void)menuDidFinishTransition:(id)a3
{
  [(SCATScannerManager *)self beginScanningWithFocusContext:0];
  id v4 = [(SCATScannerManager *)self cursorManager];
  [v4 hideCursor:0 animated:0];
}

- (void)shouldStartScanningGestureProvider:(id)a3
{
  if ([(SCATScannerManager *)self isActive])
  {
    [(SCATScannerManager *)self beginScanningWithFocusContext:0];
  }
}

- (void)shouldEndScanningGestureProvider:(id)a3
{
  if ([(SCATScannerManager *)self isActive])
  {
    [(SCATScannerManager *)self beginScanningWithFocusContext:0];
  }
}

- (id)contentViewForGestureProvider:(id)a3
{
  uint64_t v4 = [(SCATScannerManager *)self currentDisplayID];

  return [(SCATScannerManager *)self scatUIContextForDisplayID:v4];
}

- (void)gestureProvider:(id)a3 shouldResetScanningFromElement:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(SCATScannerManager *)self activeElementManager];

  if (v7 == v9)
  {
    if (v6)
    {
      double v8 = +[SCATFocusContext focusContextWithElement:v6 elementManager:v9 selectBehavior:0 options:0];
      [(SCATScannerManager *)self beginScanningWithFocusContext:v8];
    }
    else
    {
      [(SCATScannerManager *)self beginScanningWithFocusContext:0];
    }
  }
}

- (void)didChooseCreateCustomGestureFromGestureProvider:(id)a3
{
  uint64_t v4 = +[HNDEventManager sharedManager];
  [v4 openCreateCustomGestureForSCAT];

  id v5 = [(SCATScannerManager *)self menu];
  [v5 hideWithCompletion:0];

  id v6 = [(SCATScannerManager *)self activeElementManager];
  [v6 screenChangingButtonWasPressed:self];
}

- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4
{
  id v5 = a3;
  id v6 = [(SCATScannerManager *)self pointPicker];
  [v6 pickedPointInDeviceCoordinates];
  id v7 = -[SCATScannerManager _focusContextAtPoint:](self, "_focusContextAtPoint:");

  double v8 = [(SCATScannerManager *)self menu];
  unsigned int v9 = [v8 isVisible];

  if (v9)
  {
    id v10 = [(SCATScannerManager *)self menu];
    double v11 = [v10 element];
    [v7 setMenuElement:v11];
  }
  uint64_t v12 = [(SCATScannerManager *)self cursorManager];
  [v12 updateWithFocusContext:v7 animated:0 options:1];

  if (!v7)
  {
    double v13 = +[AXSettings sharedInstance];
    [v13 switchControlAutoTapTimeout];
    double v15 = v14;

    if (v15 != 0.0)
    {
      double v16 = +[HNDHandManager sharedManager];
      double v17 = [v16 fingerController];

      [(SCATScannerManager *)self _startingPointForGesturesForPointPicker:v5];
      unsigned __int8 v18 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:");
      unint64_t v24 = v18;
      id v19 = +[NSArray arrayWithObjects:&v24 count:1];
      objc_msgSend(v17, "showFingerModels:animated:startPointForAnimation:", v19, 0, CGPointZero.x, CGPointZero.y);

      double v20 = +[AXSettings sharedInstance];
      [v20 switchControlAutoTapTimeout];
      objc_msgSend(v17, "animateToTapWithDuration:");
    }
  }
  double v21 = [(SCATScannerManager *)self currentAction];
  id v22 = [v21 action];

  if (v22 == (id)100) {
    [(SCATScannerManager *)self activateActionHandler];
  }
  else {
  unsigned int v23 = [(SCATScannerManager *)self selectActionHandler];
  }
  [v23 notifyDidReceiveAction:self];
}

- (void)pointPicker:(id)a3 didSweepIntoFocusContext:(id)a4 isRefiningPoint:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(SCATScannerManager *)self cursorManager];
  [v7 updateWithFocusContext:v6 animated:1 options:3];

  if (v6 && [(SCATScannerManager *)self areSoundEffectsEnabled])
  {
    id v8 = [(SCATScannerManager *)self outputManager];
    [v8 playSound:1000];
  }
}

- (void)pointPicker:(id)a3 didSweepOutOfFocusContext:(id)a4 isRefiningPoint:(BOOL)a5
{
  id v5 = [(SCATScannerManager *)self cursorManager];
  [v5 updateWithFocusContext:0 animated:1 options:0];
}

- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4
{
  id v5 = [(SCATScannerManager *)self activeScannerDriver];
  LOBYTE(a4) = [v5 pauseScanningForPointPickerNumberOfCycles:a4];

  return a4;
}

- (void)pointPicker:(id)a3 didFinishDwellingOnPoint:(CGPoint)a4
{
  int64_t v5 = [(SCATScannerManager *)self _dwellSwitchAssignedAction];
  if (v5)
  {
    id v6 = +[SCATActionItem fromAction:v5];
    [(SCATScannerManager *)self inputController:0 didReceiveAction:v6];
  }
}

- (void)_updateCameraPointPickerSwitchesCache
{
  id v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 assistiveTouchCameraPointPickerSwitches];
  [(SCATScannerManager *)self setCachedCameraPointPickerSwitches:v4];

  int64_t v5 = [(SCATScannerManager *)self pointPicker];
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4)
  {
    BOOL v6 = [(SCATScannerManager *)self _dwellSwitchAssignedAction] != 0;
    id v7 = [(SCATScannerManager *)self pointPicker];
    [v7 setDwellSwitchAssigned:v6];
  }
}

- (int64_t)_dwellSwitchAssignedAction
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(SCATScannerManager *)self cachedCameraPointPickerSwitches];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = SCATSwitchSourceMotionTracker;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v9 = [v8 source];
        if ([v9 isEqualToString:v6] && objc_msgSend(v8, "cameraSwitch") == (id)9)
        {
          id v10 = [v8 action];

          if (v10)
          {
            id v11 = [v8 action];
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  id v11 = 0;
LABEL_14:

  return (int64_t)v11;
}

- (id)_focusContextAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = +[HNDAccessibilityManager sharedManager];
  id v7 = objc_msgSend(v6, "elementAtPoint:displayID:", -[SCATScannerManager currentDisplayID](self, "currentDisplayID"), x, y);

  if (v7)
  {
    id v8 = [(SCATScannerManager *)self elementNavController];
    unsigned int v9 = +[SCATFocusContext focusContextWithElement:v7 elementManager:v8 selectBehavior:0 options:0];
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SCATScannerManager *)self selectActionHandler];
  unsigned int v8 = [v6 isEqual:v7];

  return !v8 || [(SCATScannerManager *)self immediateSelectActionCount] == a4;
}

- (void)actionHandlerDidFireAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCATScannerManager *)self pointPicker];
  [v5 pickedPointInDeviceCoordinates];
  id v6 = -[SCATScannerManager _focusContextAtPoint:](self, "_focusContextAtPoint:");

  id v7 = [v4 actionCount];
  unsigned int v8 = [(SCATScannerManager *)self activateActionHandler];
  unsigned __int8 v9 = [v4 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v19 = [(SCATScannerManager *)self selectActionHandler];
    unsigned int v20 = [v4 isEqual:v19];

    if (!v20) {
      goto LABEL_18;
    }
    if (v7 != (id)1 || [v4 shouldShowMenuOnFirstSelectAction])
    {
      double v21 = [(SCATScannerManager *)self menu];
      id v22 = [(SCATScannerManager *)self pointPicker];
      [v21 presentWithPointPicker:v22];

      goto LABEL_18;
    }
  }
  id v10 = [(SCATScannerManager *)self pointPicker];
  [v10 resetRefinedSelectedPoint];

  uint64_t v11 = [v6 element];
  if (!v11) {
    goto LABEL_15;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [(SCATScannerManager *)self pointPicker];
  if (v13)
  {
    long long v14 = (void *)v13;
    long long v15 = [v6 element];
    if (([v15 scatIsAXElement] & 1) == 0)
    {

      goto LABEL_15;
    }
    long long v16 = [v6 element];
    double v17 = [v16 uiElement];
    unsigned int v18 = [v17 BOOLWithAXAttribute:2150];

    if (!v18) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  unsigned int v23 = [v6 element];
  unsigned __int8 v24 = [(SCATScannerManager *)self activateElement:v23];

  if ((v24 & 1) == 0)
  {
LABEL_15:
    BOOL v25 = [(SCATScannerManager *)self gestureProvider];
    id v26 = [(SCATScannerManager *)self pointPicker];
    [(SCATScannerManager *)self _startingPointForGesturesForPointPicker:v26];
    id v27 = +[AXNamedReplayableGesture tapGestureAtPoint:](AXNamedReplayableGesture, "tapGestureAtPoint:");
    [v25 replayGesture:v27];
  }
  unsigned int v28 = [(SCATScannerManager *)self pointPicker];
  unsigned int v29 = [v28 shouldRescanAfterTap];

  if (v29)
  {
    long long v30 = [(SCATScannerManager *)self cursorManager];
    [v30 updateWithFocusContext:0 animated:0 options:0];

    AXPerformBlockOnMainThreadAfterDelay();
  }
LABEL_18:
}

- (void)actionHandlerDidCancelPendingAction:(id)a3
{
}

- (id)focusContextForActionHandler:(id)a3
{
  id v4 = [(SCATScannerManager *)self pointPicker];
  [v4 pickedPointInDeviceCoordinates];
  uint64_t v5 = -[SCATScannerManager _focusContextAtPoint:](self, "_focusContextAtPoint:");

  return v5;
}

- (void)alternateKeysManager:(id)a3 didSelectAlternateKey:(id)a4
{
  id v5 = a4;
  id v6 = [(SCATScannerManager *)self outputManager];
  [v6 playSound:1001];

  [(SCATScannerManager *)self _updateActiveElementManager];
  id v7 = [(SCATScannerManager *)self activeElementManager];
  [v7 scannerManager:self didActivateElement:v5];
}

- (id)_typingCandidates
{
  id v2 = +[HNDAccessibilityManager sharedManager];
  id v3 = [v2 firstResponder];
  id v4 = [v3 elementForAttribute:2017];
  id v5 = [v4 typingCandidates];

  return v5;
}

- (BOOL)candidateBarManager:(id)a3 hasValidTypingCandidates:(id)a4
{
  id v5 = a4;
  id v6 = [(SCATScannerManager *)self _typingCandidates];
  unsigned __int8 v7 = [v6 isEqualToArray:v5];

  return v7;
}

- (void)presentPostScanningMenuForElementNavigationController:(id)a3
{
  id v3 = [(SCATScannerManager *)self menu];
  [v3 presentWithRootLevelSheet:0 useCurrentElementAndPoint:0];
}

- (id)scatUIContext
{
  uint64_t v2 = [(SCATScannerManager *)self currentDisplayID];
  id v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 displayManagerForDisplayId:v2];
  id v5 = [v4 scannerContentView];

  return v5;
}

- (id)scatBackCursorUIContext
{
  uint64_t v2 = [(SCATScannerManager *)self currentDisplayID];
  id v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 displayManagerForDisplayId:v2];
  id v5 = [v4 scannerBackCursorView];

  return v5;
}

- (id)scatFrontCursorUIContext
{
  uint64_t v2 = [(SCATScannerManager *)self currentDisplayID];
  id v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 displayManagerForDisplayId:v2];
  id v5 = [v4 scannerFrontCursorView];

  return v5;
}

- (id)scatUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 displayManagerForDisplayId:v3];
  id v6 = [v5 scannerContentView];

  return v6;
}

- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 displayManagerForDisplayId:v3];
  id v6 = [v5 scannerFrontCursorView];

  return v6;
}

- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 displayManagerForDisplayId:v3];
  id v6 = [v5 scannerBackCursorView];

  return v6;
}

- (BOOL)isUIContextHidden
{
  uint64_t v3 = [(SCATScannerManager *)self currentDisplayID];
  id v4 = [(SCATScannerManager *)self scatUIContextForDisplayID:v3];
  if ([v4 isHidden])
  {
    id v5 = [(SCATScannerManager *)self scatBackCursorUIContextForDisplayID:v3];
    if ([v5 isHidden])
    {
      id v6 = [(SCATScannerManager *)self scatFrontCursorUIContextForDisplayID:v3];
      unsigned __int8 v7 = [v6 isHidden];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)hideUIContext:(BOOL)a3
{
  uint64_t v5 = [(SCATScannerManager *)self currentDisplayID];
  if (![(SCATScannerManager *)self isUIContextHidden])
  {
    if (!a3)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
    }
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:off_1001EF460 object:self];

    unsigned __int8 v7 = [(SCATScannerManager *)self scatUIContextForDisplayID:v5];
    [v7 setHidden:1];

    unsigned int v8 = [(SCATScannerManager *)self scatBackCursorUIContextForDisplayID:v5];
    [v8 setHidden:1];

    unsigned __int8 v9 = [(SCATScannerManager *)self scatFrontCursorUIContextForDisplayID:v5];
    [v9 setHidden:1];

    id v10 = [(SCATScannerManager *)self gestureProvider];
    [v10 setHidden:1];

    if (!a3) {
      +[CATransaction commit];
    }
    if (![(SCATScannerManager *)self forceDisableScreenLock])
    {
      id v11 = +[HNDEventManager sharedManager];
      [v11 manipulateDimTimer:0];
    }
  }
}

- (void)showUIContext:(BOOL)a3
{
  uint64_t v5 = [(SCATScannerManager *)self currentDisplayID];
  if ([(SCATScannerManager *)self isUIContextHidden])
  {
    if (!a3)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
    }
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:off_1001EF468 object:self];

    unsigned __int8 v7 = [(SCATScannerManager *)self scatUIContextForDisplayID:v5];
    [v7 setHidden:0];

    unsigned int v8 = [(SCATScannerManager *)self scatBackCursorUIContextForDisplayID:v5];
    [v8 setHidden:0];

    unsigned __int8 v9 = [(SCATScannerManager *)self scatFrontCursorUIContextForDisplayID:v5];
    [v9 setHidden:0];

    id v10 = [(SCATScannerManager *)self gestureProvider];
    [v10 setHidden:0];

    if (!a3) {
      +[CATransaction commit];
    }
    id v11 = +[HNDEventManager sharedManager];
    [v11 manipulateDimTimer:1];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self scannerObservers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATScannerManager *)self scannerObservers];
  [v5 removeObject:v4];
}

- (void)_notifyObserversScannerWillFocusOnContext:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SCATScannerManager *)self scannerObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 scannerManager:self willFocusOnContext:v4];
        }
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversScannerDidFocusOnContext:(id)a3 oldContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(SCATScannerManager *)self scannerObservers];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 scannerManager:self didFocusOnContext:v6 oldContext:v7];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_notifyObserversScannerWillUnfocusFromContext:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SCATScannerManager *)self scannerObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 scannerManager:self willUnfocusFromContext:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversScannerDidBecomeActive
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(SCATScannerManager *)self scannerObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scannerManagerDidBecomeActive:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversScannerDidBecomeInactive
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(SCATScannerManager *)self scannerObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scannerManagerDidBecomeInactive:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversScannerDidPause
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(SCATScannerManager *)self scannerObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scannerManagerDidPause:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CGPoint)_startingPointForGesturesForPointPicker:(id)a3
{
  [a3 pickedPoint];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (AXOutputManager)outputManager
{
  return self->_outputManager;
}

- (void)setOutputManager:(id)a3
{
}

- (SCATCursorManager)cursorManager
{
  return self->_cursorManager;
}

- (void)setCursorManager:(id)a3
{
}

- (AXDispatchTimer)beginScanningTimer
{
  return self->_beginScanningTimer;
}

- (void)setBeginScanningTimer:(id)a3
{
}

- (HNDScannerAutoscroller)autoscroller
{
  return self->_autoscroller;
}

- (void)setAutoscroller:(id)a3
{
}

- (SCATInputController)inputController
{
  return self->_inputController;
}

- (void)setInputController:(id)a3
{
}

- (SCATGestureProvider)gestureProvider
{
  return self->_gestureProvider;
}

- (void)setGestureProvider:(id)a3
{
}

- (SCATMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (SCATPointPicker)pointPicker
{
  return self->_pointPicker;
}

- (void)setPointPicker:(id)a3
{
}

- (SCATElementNavigationController)elementNavController
{
  return self->_elementNavController;
}

- (void)setElementNavController:(id)a3
{
}

- (SCATManualDriver)manualScanningDriver
{
  return self->_manualScanningDriver;
}

- (void)setManualScanningDriver:(id)a3
{
}

- (SCATAutomaticDriver)autoScanningDriver
{
  return self->_autoScanningDriver;
}

- (void)setAutoScanningDriver:(id)a3
{
}

- (SCATDriver)activeScannerDriver
{
  return self->_activeScannerDriver;
}

- (SCATElementManager)activeElementManager
{
  return self->_activeElementManager;
}

- (SCATScannerManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATScannerManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATActionHandler)selectActionHandler
{
  return self->_selectActionHandler;
}

- (void)setSelectActionHandler:(id)a3
{
}

- (SCATActionHandler)selectAndResumeAutoscanningActionHandler
{
  return self->_selectAndResumeAutoscanningActionHandler;
}

- (void)setSelectAndResumeAutoscanningActionHandler:(id)a3
{
}

- (HNDAccessibilityManager)testAxManager
{
  return self->_testAxManager;
}

- (void)setTestAxManager:(id)a3
{
}

- (void)setRecentSpeechOutputStrings:(id)a3
{
}

- (NSPointerArray)_pointerPointPickersToNotify
{
  return self->__pointerPointPickersToNotify;
}

- (void)set_pointerPointPickersToNotify:(id)a3
{
}

- (NSSet)cachedCameraPointPickerSwitches
{
  return self->_cachedCameraPointPickerSwitches;
}

- (void)setCachedCameraPointPickerSwitches:(id)a3
{
}

- (SCATAlternateKeysManager)alternateKeysManager
{
  return self->_alternateKeysManager;
}

- (void)setAlternateKeysManager:(id)a3
{
}

- (SCATScrollViewPickerManager)scrollViewPickerManager
{
  return self->_scrollViewPickerManager;
}

- (void)setScrollViewPickerManager:(id)a3
{
}

- (SCATCandidateBarManager)candidateBarManager
{
  return self->_candidateBarManager;
}

- (void)setCandidateBarManager:(id)a3
{
}

- (SCATDwellDriver)dwellScanningDriver
{
  return self->_dwellScanningDriver;
}

- (void)setDwellScanningDriver:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer
{
  return self->_updateElementVisualsCoalescer;
}

- (void)setUpdateElementVisualsCoalescer:(id)a3
{
}

- (SCATActionHandler)activateActionHandler
{
  return self->_activateActionHandler;
}

- (void)setActivateActionHandler:(id)a3
{
}

- (BOOL)forceDisableScreenLock
{
  return self->_forceDisableScreenLock;
}

- (void)setForceDisableScreenLock:(BOOL)a3
{
  self->_forceDisableScreenLock = a3;
}

- (SCATFocusContext)focusContextForResume
{
  return self->_focusContextForResume;
}

- (void)setFocusContextForResume:(id)a3
{
}

- (BOOL)didSetFocusContextForResume
{
  return self->_didSetFocusContextForResume;
}

- (void)setDidSetFocusContextForResume:(BOOL)a3
{
  self->_didSetFocusContextForResume = a3;
}

- (NSMutableSet)reasonsToDisableScanning
{
  return self->_reasonsToDisableScanning;
}

- (void)setReasonsToDisableScanning:(id)a3
{
}

- (BOOL)didPauseForReasonsToDisableScanning
{
  return self->_didPauseForReasonsToDisableScanning;
}

- (void)setDidPauseForReasonsToDisableScanning:(BOOL)a3
{
  self->_didPauseForReasonsToDisableScanning = a3;
}

- (AXSwitchRecipe)currentRecipe
{
  return self->_currentRecipe;
}

- (int64_t)itemMenuState
{
  return self->_itemMenuState;
}

- (void)setItemMenuState:(int64_t)a3
{
  self->_itemMenuState = a3;
}

- (SCATActionItem)currentAction
{
  return self->_currentAction;
}

- (void)setCurrentAction:(id)a3
{
}

- (AXSSInterDeviceCommunicator)interDeviceCommunicator
{
  return self->_interDeviceCommunicator;
}

- (void)setInterDeviceCommunicator:(id)a3
{
}

- (OS_dispatch_queue)managedConfigurationQueue
{
  return self->_managedConfigurationQueue;
}

- (void)setManagedConfigurationQueue:(id)a3
{
}

- (unsigned)lockedToDisplayID
{
  return self->_lockedToDisplayID;
}

- (void)setLockedToDisplayID:(unsigned int)a3
{
  self->_lockedToDisplayID = a3;
}

- (NSMutableSet)scannerObservers
{
  return self->_scannerObservers;
}

- (void)setScannerObservers:(id)a3
{
}

- (SCATElement)cachedPickerElement
{
  return self->_cachedPickerElement;
}

- (void)setCachedPickerElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPickerElement, 0);
  objc_storeStrong((id *)&self->_scannerObservers, 0);
  objc_storeStrong((id *)&self->_managedConfigurationQueue, 0);
  objc_storeStrong((id *)&self->_interDeviceCommunicator, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_currentRecipe, 0);
  objc_storeStrong((id *)&self->_reasonsToDisableScanning, 0);
  objc_storeStrong((id *)&self->_focusContextForResume, 0);
  objc_storeStrong((id *)&self->_activateActionHandler, 0);
  objc_storeStrong((id *)&self->_updateElementVisualsCoalescer, 0);
  objc_storeStrong((id *)&self->_dwellScanningDriver, 0);
  objc_storeStrong((id *)&self->_candidateBarManager, 0);
  objc_storeStrong((id *)&self->_scrollViewPickerManager, 0);
  objc_storeStrong((id *)&self->_alternateKeysManager, 0);
  objc_storeStrong((id *)&self->_cachedCameraPointPickerSwitches, 0);
  objc_storeStrong((id *)&self->__pointerPointPickersToNotify, 0);
  objc_storeStrong((id *)&self->_recentSpeechOutputStrings, 0);
  objc_storeStrong((id *)&self->_testAxManager, 0);
  objc_storeStrong((id *)&self->_selectAndResumeAutoscanningActionHandler, 0);
  objc_storeStrong((id *)&self->_selectActionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeElementManager, 0);
  objc_storeStrong((id *)&self->_activeScannerDriver, 0);
  objc_storeStrong((id *)&self->_autoScanningDriver, 0);
  objc_storeStrong((id *)&self->_manualScanningDriver, 0);
  objc_storeStrong((id *)&self->_elementNavController, 0);
  objc_storeStrong((id *)&self->_pointPicker, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_gestureProvider, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_storeStrong((id *)&self->_autoscroller, 0);
  objc_storeStrong((id *)&self->_beginScanningTimer, 0);
  objc_storeStrong((id *)&self->_cursorManager, 0);

  objc_storeStrong((id *)&self->_outputManager, 0);
}

@end