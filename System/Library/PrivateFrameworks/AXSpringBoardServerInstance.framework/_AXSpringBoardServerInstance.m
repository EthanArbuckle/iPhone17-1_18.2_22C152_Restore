@interface _AXSpringBoardServerInstance
+ (id)springBoardServerInstance;
+ (id)springBoardServerInstanceIfExists;
+ (unsigned)_axCaptionPanelContextId;
- (AXServerInstanceActionHandlerHelper)actionHandlerHelper;
- (AXSpringBoardServerInstanceDelegate)delegate;
- (BOOL)_hasReachabilityHandlerForClientPort:(unsigned int)a3;
- (BOOL)_inSetupMode;
- (BOOL)disableControlCenterAssertionHeld;
- (BOOL)disableNotificationCenterAssertionHeld;
- (BOOL)hasActiveCall;
- (BOOL)hasActiveEndpointCall;
- (BOOL)hasActiveOrPendingCall;
- (BOOL)hasActiveOrPendingCallOrFaceTime;
- (BOOL)onlySystemGesturesDisabledHolderIsGuidedAccess;
- (BOOL)shouldAllowActiveWatchToAutoAnswer;
- (BOOL)shouldBlockGestureActivation:(unint64_t)a3;
- (BOOL)shouldCancelSiriTouchActivationBlock;
- (BOOL)shouldSendReachabilityToggled;
- (NSMutableDictionary)watchActiveWristState;
- (_AXAssertionServer)assertionServer;
- (_AXSpringBoardServerInstance)init;
- (id)_actionHandling:(id)a3;
- (id)_activateSOSMode:(id)a3;
- (id)_allowedMedusaGestures:(id)a3;
- (id)_appNameFromPid:(id)a3;
- (id)_areSystemGesturesDisabledByAccessibility:(id)a3;
- (id)_areSystemGesturesDisabledNatively:(id)a3;
- (id)_armApplePay:(id)a3;
- (id)_assertionClientForPort:(unsigned int)a3;
- (id)_canSetDockIconActivationMode:(id)a3;
- (id)_cancelGestureActivation:(id)a3;
- (id)_cancelSiriDismissalForAssistiveTouch:(id)a3;
- (id)_connectedDevicesHaveAssistiveTouchCustomActions:(id)a3;
- (id)_connectedDevicesRequireAssistiveTouch:(id)a3;
- (id)_copyStringToPasteboard:(id)a3;
- (id)_diminishJindo:(id)a3;
- (id)_dismissAppSwitcher:(id)a3;
- (id)_dismissShelfSwitcher:(id)a3;
- (id)_dismissSiri:(id)a3;
- (id)_getActiveInterfaceOrientation:(id)a3;
- (id)_getApplicationOrientation:(id)a3;
- (id)_getPid:(id)a3;
- (id)_getSplashImageForApp:(id)a3;
- (id)_handleAcquireAssertion:(id)a3;
- (id)_handleBluetoothPowerEnabled:(id)a3;
- (id)_handleCancelReachabilityTimer:(id)a3;
- (id)_handleDisplayIdentifierForSceneIdentifier:(id)a3;
- (id)_handleFreezeClarityUILoadingScreen:(id)a3;
- (id)_handleGetFocusedAppPID:(id)a3;
- (id)_handleGetFocusedApps:(id)a3;
- (id)_handleGetFocusedOccludedAppScenes:(id)a3;
- (id)_handleGetPurpleBuddyPID:(id)a3;
- (id)_handleGetRunningAppPIDs:(id)a3;
- (id)_handleInstalledApps:(id)a3;
- (id)_handleInternalApps:(id)a3;
- (id)_handleIsInspectorMinimized:(id)a3;
- (id)_handleIsMagnifierVisible:(id)a3;
- (id)_handleIsPurpleBuddyAppFrontmost:(id)a3;
- (id)_handleIsSettingsAppFrontmost:(id)a3;
- (id)_handleIsSystemAppFrontmost:(id)a3;
- (id)_handleIsSystemAppShowingAnAlert:(id)a3;
- (id)_handleLaunchMagnifierApp:(id)a3;
- (id)_handleLaunchOnboardingViewService:(id)a3;
- (id)_handleLaunchVoiceOverImageExplorerViewService:(id)a3;
- (id)_handleLaunchVoiceOverQuickSettingsViewService:(id)a3;
- (id)_handleLoadGAXBundleForUnmanagedASAM:(id)a3;
- (id)_handleNativeFocusedApplication:(id)a3;
- (id)_handlePresentNearbyDeviceControlPicker:(id)a3;
- (id)_handleReactivateInCallService:(id)a3;
- (id)_handleRelinquishAssertion:(id)a3;
- (id)_handleRevealSpotlight:(id)a3;
- (id)_handleSetBluetoothPowerEnabled:(id)a3;
- (id)_handleSetVoiceOverEnabled:(id)a3;
- (id)_handleSetZoomEnabled:(id)a3;
- (id)_handleSpringBoardInfoQuery:(id)a3;
- (id)_handleToggleIncomingCall:(id)a3;
- (id)_handleToggleSpotlight:(id)a3;
- (id)_handleVoiceOverEnabled:(id)a3;
- (id)_handleZoomEnabled:(id)a3;
- (id)_hasActiveCall:(id)a3;
- (id)_hasActiveEndpointCall:(id)a3;
- (id)_hasActiveOrPendingCall:(id)a3;
- (id)_hasActiveOrPendingCallOrFaceTime:(id)a3;
- (id)_hideAlert:(id)a3;
- (id)_hideRemoteView:(id)a3;
- (id)_initServer;
- (id)_isAppSwitcherVisible:(id)a3;
- (id)_isContinuitySessionActive:(id)a3;
- (id)_isControlCenterVisible:(id)a3;
- (id)_isDarkModeActive:(id)a3;
- (id)_isDockVisible:(id)a3;
- (id)_isGuidedAccessActive:(id)a3;
- (id)_isLockScreenVisible:(id)a3;
- (id)_isLongLookNotificationVisible:(id)a3;
- (id)_isMakingEmergencyCall:(id)a3;
- (id)_isMediaPlaying:(id)a3;
- (id)_isNotificationCenterVisible:(id)a3;
- (id)_isOrientationLocked:(id)a3;
- (id)_isPIPWindowVisible:(id)a3;
- (id)_isPasscodeLockVisible:(id)a3;
- (id)_isPointInAXInspector:(id)a3;
- (id)_isRingerMuted:(id)a3;
- (id)_isShelfSwitcherVisible:(id)a3;
- (id)_isShowingHomescreen:(id)a3;
- (id)_isShowingNonSystemApp:(id)a3;
- (id)_isShowingRemoteView:(id)a3;
- (id)_isSideSwitchUsedForOrientation:(id)a3;
- (id)_isSiriVisible:(id)a3;
- (id)_isSpeakThisTemporarilyDisabled:(id)a3;
- (id)_isSpotlightVisible:(id)a3;
- (id)_isSyncingRestoringResettingOrUpdating:(id)a3;
- (id)_isSystemSleeping:(id)a3;
- (id)_isTypeToSiriVisible:(id)a3;
- (id)_isVoiceControlRunning:(id)a3;
- (id)_jindoAppIdentifiers:(id)a3;
- (id)_medusaApps:(id)a3;
- (id)_openAppSwitcher:(id)a3;
- (id)_openCommandAndControlCommands:(id)a3;
- (id)_openCommandAndControlSettings:(id)a3;
- (id)_openCommandAndControlVocabulary:(id)a3;
- (id)_openCustomGestureCreationForAST:(id)a3;
- (id)_openCustomGestureCreationForSCAT:(id)a3;
- (id)_openTypeToSiri:(id)a3;
- (id)_openVoiceControl:(id)a3;
- (id)_pauseMedia:(id)a3;
- (id)_performMedusaGesture:(id)a3;
- (id)_reachabilityActive:(id)a3;
- (id)_reachabilityEnabled:(id)a3;
- (id)_reachabilityHandling:(id)a3;
- (id)_reachabilityOffset:(id)a3;
- (id)_rebootDevice:(id)a3;
- (id)_resetDimTimer:(id)a3;
- (id)_resumeMedia:(id)a3;
- (id)_setCaptionPanelContextId:(id)a3;
- (id)_setDockIconActivationMode:(id)a3;
- (id)_setOrientation:(id)a3;
- (id)_setOrientationLocked:(id)a3;
- (id)_setSpeechPlaybackControls:(id)a3;
- (id)_showAlert:(id)a3;
- (id)_showControlCenter:(id)a3;
- (id)_showNotificationCenter:(id)a3;
- (id)_showRemoteView:(id)a3;
- (id)_simulateEdgePressHaptics:(id)a3;
- (id)_startHearingAidServer:(id)a3;
- (id)_takeScreenshot:(id)a3;
- (id)_toggleAppLibrary:(id)a3;
- (id)_toggleBackgroundSounds:(id)a3;
- (id)_toggleConversationBoost:(id)a3;
- (id)_toggleDarkMode:(id)a3;
- (id)_toggleDetectionMode:(id)a3;
- (id)_toggleDock:(id)a3;
- (id)_toggleHearingControl:(id)a3;
- (id)_toggleLiveTranscription:(id)a3;
- (id)_toggleNotificationCenter:(id)a3;
- (id)_toggleQuickNote:(id)a3;
- (id)_toggleTorch:(id)a3;
- (id)_topEventPidOverride:(id)a3;
- (id)_unlockDevice:(id)a3;
- (id)_visibleTripleClickItems:(id)a3;
- (id)_volumeLevel:(id)a3;
- (id)_wakeUpDeviceIfNecessary:(id)a3;
- (void)_accessibilityRetrieveAVSystemControlData:(id)a3 withCompletionBlock:(id)a4;
- (void)_biomeDonationLargeTextDidChange:(id)a3;
- (void)_handleLiveTranscriptionStatusChange;
- (void)_initializeAutoAnswerWatchObserver;
- (void)_initializeBiomeStreamDonations;
- (void)_initializeHandlers;
- (void)_initializeHearing;
- (void)_initializeLiveTranscriptionObserver;
- (void)_performBlockAsynchronously:(id)a3 afterDelay:(double)a4;
- (void)_performValidation;
- (void)_proximityDidChange:(id)a3;
- (void)_rampUpCallVolume;
- (void)_rampUpCallVolumeFromVolume:(float)a3 toVolume:(float)a4 totalDuration:(float)a5 progress:(float)a6;
- (void)_registerServerAndNotifyClients;
- (void)_relinquishAllAssertionsForClientWithPort:(unsigned int)a3;
- (void)_removeReachabilityHandler:(unsigned int)a3;
- (void)_requestOnWristState;
- (void)_setAVCallRoute:(id)a3 rampUp:(BOOL)a4;
- (void)_setCallRoute:(int)a3 ifCurrentlyRoutedTo:(id)a4 rampUp:(BOOL)a5;
- (void)_setCallRoute:(int)a3 ifCurrentlyRoutedTo:(id)a4 withRoutes:(id)a5 rampUp:(BOOL)a6;
- (void)_setDashboardSystemGesturesDisabled:(BOOL)a3;
- (void)_setSecurePayAccessibilityFeaturesDisabled:(BOOL)a3;
- (void)_setSystemGesturesEnabled:(BOOL)a3;
- (void)_setupAssertionServerIfNeeded;
- (void)_springBoardFinishedLaunching:(id)a3;
- (void)_updateProcess:(id)a3;
- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4 clientPort:(unsigned int)a5;
- (void)bluetoothPairingDidChange:(id)a3;
- (void)dealloc;
- (void)didReceiveIncomingData:(id)a3;
- (void)reachabilityToggledWithPayload:(id)a3 synchronizationPort:(unsigned int)a4 completion:(id)a5;
- (void)registerHandlerForMessageKey:(int)a3 target:(id)a4 selector:(SEL)a5 entitlements:(id)a6;
- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4 clientPort:(unsigned int)a5;
- (void)setAssertionServer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableControlCenterAssertionHeld:(BOOL)a3;
- (void)setDisableNotificationCenterAssertionHeld:(BOOL)a3;
- (void)setWatchActiveWristState:(id)a3;
- (void)springBoardActionOccurred:(int64_t)a3;
- (void)springBoardActionOccurred:(int64_t)a3 withPayload:(id)a4;
- (void)userChangedRouteNotification:(id)a3;
@end

@implementation _AXSpringBoardServerInstance

- (void)springBoardActionOccurred:(int64_t)a3 withPayload:(id)a4
{
  id v6 = a4;
  v7 = [(_AXSpringBoardServerInstance *)self actionHandlerHelper];
  [v7 notifyActionOccurredWithType:a3 payload:v6];

  if (a3 == 2 && UIAccessibilityIsVoiceOverRunning())
  {
    v8 = [(_AXSpringBoardServerInstance *)self delegate];
    char v9 = [v8 isRingerMutedWithServerInstance:self];

    if ((v9 & 1) == 0)
    {
      AXPerformBlockOnMainThread();
    }
  }
}

- (void)springBoardActionOccurred:(int64_t)a3
{
}

- (AXServerInstanceActionHandlerHelper)actionHandlerHelper
{
  return self->_actionHandlerHelper;
}

+ (id)springBoardServerInstance
{
  if (springBoardServerInstance_onceToken != -1) {
    dispatch_once(&springBoardServerInstance_onceToken, &__block_literal_global_367);
  }
  v2 = (void *)ServerInstance;
  return v2;
}

- (void)_updateProcess:(id)a3
{
  id v9 = a3;
  v3 = [v9 identity];
  v4 = [v3 safeValueForKey:@"hostIdentity"];
  v5 = [v4 safeStringForKey:@"embeddedApplicationIdentifier"];
  char v6 = [v5 isEqualToString:*MEMORY[0x263F21310]];

  if ((v6 & 1) == 0)
  {
    v7 = [v9 currentState];
    int v8 = [v7 taskState];

    if (v8 == 3 || (RBSTaskStateIsRunning() & 1) == 0)
    {
      [v9 pid];
      AXPidSuspend();
    }
    else
    {
      [v9 pid];
      AXPidUnsuspend();
    }
  }
}

- (BOOL)shouldBlockGestureActivation:(unint64_t)a3
{
  if (a3 != 4)
  {
    if (a3 == 2)
    {
      if (!AXCancelControlCenter
        && ![(_AXSpringBoardServerInstance *)self disableControlCenterAssertionHeld])
      {
        return 0;
      }
    }
    else if (a3 != 1 {
           || !AXCancelShowNotificationGesture
    }
           && ![(_AXSpringBoardServerInstance *)self disableNotificationCenterAssertionHeld])
    {
      return 0;
    }
    return 1;
  }
  return AXCancelShowHUD != 0;
}

- (BOOL)shouldSendReachabilityToggled
{
  return [(NSMutableArray *)self->_reachabilityHandlers count] != 0;
}

- (void)reachabilityToggledWithPayload:(id)a3 synchronizationPort:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v18 = (void (**)(void))a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = self->_reachabilityHandlers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:5003 payload:v8];
        id v19 = 0;
        char v16 = [v14 sendSimpleMessage:v15 synchronizationPort:v6 error:&v19];
        id v17 = v19;
        if ((v16 & 1) == 0) {
          _AXLogWithFacility();
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if (v18) {
    v18[2](v18);
  }
}

- (BOOL)_hasReachabilityHandlerForClientPort:(unsigned int)a3
{
  reachabilityHandlers = self->_reachabilityHandlers;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69___AXSpringBoardServerInstance__hasReachabilityHandlerForClientPort___block_invoke;
  v5[3] = &__block_descriptor_36_e28_B32__0__AXIPCClient_8Q16_B24l;
  unsigned int v6 = a3;
  return [(NSMutableArray *)reachabilityHandlers indexOfObjectPassingTest:v5] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_removeReachabilityHandler:(unsigned int)a3
{
  reachabilityHandlers = self->_reachabilityHandlers;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59___AXSpringBoardServerInstance__removeReachabilityHandler___block_invoke;
  v6[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  unsigned int v7 = a3;
  v5 = [(NSMutableArray *)reachabilityHandlers indexesOfObjectsPassingTest:v6];
  if (v5) {
    [(NSMutableArray *)self->_reachabilityHandlers removeObjectsAtIndexes:v5];
  }
}

- (BOOL)shouldCancelSiriTouchActivationBlock
{
  return AXCancelSiriTouchBlock;
}

- (BOOL)hasActiveCall
{
  v2 = self;
  v3 = [(_AXSpringBoardServerInstance *)self delegate];
  LOBYTE(v2) = [v3 hasActiveCallWithServerInstance:v2];

  return (char)v2;
}

- (BOOL)hasActiveEndpointCall
{
  v2 = self;
  v3 = [(_AXSpringBoardServerInstance *)self delegate];
  LOBYTE(v2) = [v3 hasActiveEndpointCallWithServerInstance:v2];

  return (char)v2;
}

- (BOOL)hasActiveOrPendingCall
{
  v2 = self;
  v3 = [(_AXSpringBoardServerInstance *)self delegate];
  LOBYTE(v2) = [v3 hasActiveOrPendingCallWithServerInstance:v2];

  return (char)v2;
}

- (BOOL)hasActiveOrPendingCallOrFaceTime
{
  v2 = self;
  v3 = [(_AXSpringBoardServerInstance *)self delegate];
  LOBYTE(v2) = [v3 hasActiveOrPendingCallOrFaceTimeWithServerInstance:v2];

  return (char)v2;
}

- (void)userChangedRouteNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F22708];
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 1u);
}

- (void)_proximityDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFStringRef v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x263F79708]];
  unsigned int v6 = [v5 BOOLValue];

  if (UIAccessibilityIsVoiceOverRunning()
    && [(_AXSpringBoardServerInstance *)self hasActiveCall]
    && _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity())
  {
    HAInitializeLogging();
    unsigned int v7 = objc_msgSend(NSString, "stringWithFormat:", @"Proximity Changed (%d) triggering an audio route change", v6);
    id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[_AXSpringBoardServerInstance _proximityDidChange:]", 289, v7];
    id v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      uint64_t v11 = v9;
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = [v10 UTF8String];
      _os_log_impl(&dword_226EBC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (v6)
    {
      uint64_t v12 = @"Speaker";
      v13 = self;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v12 = @"Receiver";
      v13 = self;
      uint64_t v14 = 2;
      uint64_t v15 = 1;
    }
    [(_AXSpringBoardServerInstance *)v13 _setCallRoute:v14 ifCurrentlyRoutedTo:v12 rampUp:v15];
  }
}

- (void)_accessibilityRetrieveAVSystemControlData:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  avSystemRetrievalQueue = self->_avSystemRetrievalQueue;
  if (!avSystemRetrievalQueue)
  {
    id v9 = (OS_dispatch_queue *)dispatch_queue_create("accessibility.avsystem.retrieval", 0);
    id v10 = self->_avSystemRetrievalQueue;
    self->_avSystemRetrievalQueue = v9;

    avSystemRetrievalQueue = self->_avSystemRetrievalQueue;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94___AXSpringBoardServerInstance__accessibilityRetrieveAVSystemControlData_withCompletionBlock___block_invoke;
  v13[3] = &unk_2647F0EC0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(avSystemRetrievalQueue, v13);
}

- (void)_setCallRoute:(int)a3 ifCurrentlyRoutedTo:(id)a4 rampUp:(BOOL)a5
{
  id v8 = a4;
  if ([(_AXSpringBoardServerInstance *)self hasActiveOrPendingCallOrFaceTime])
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__2;
    v15[4] = __Block_byref_object_dispose__2;
    id v16 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73___AXSpringBoardServerInstance__setCallRoute_ifCurrentlyRoutedTo_rampUp___block_invoke;
    v14[3] = &unk_2647F0860;
    v14[4] = v15;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73___AXSpringBoardServerInstance__setCallRoute_ifCurrentlyRoutedTo_rampUp___block_invoke_320;
    v9[3] = &unk_2647F0EE8;
    v9[4] = self;
    int v12 = a3;
    id v10 = v8;
    id v11 = v15;
    BOOL v13 = a5;
    [(_AXSpringBoardServerInstance *)self _accessibilityRetrieveAVSystemControlData:v14 withCompletionBlock:v9];

    _Block_object_dispose(v15, 8);
  }
}

- (void)_setCallRoute:(int)a3 ifCurrentlyRoutedTo:(id)a4 withRoutes:(id)a5 rampUp:(BOOL)a6
{
  BOOL v36 = a6;
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v39 = a4;
  id v38 = a5;
  id v7 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v8 = [v7 displayedCall];
  if (v8)
  {

LABEL_4:
    id v10 = [MEMORY[0x263F7E188] sharedAudioSystemController];
    id v11 = [v8 audioCategory];
    int v12 = [v8 audioMode];
    v37 = [v10 pickableRoutesForCategory:v11 andMode:v12];

    goto LABEL_5;
  }
  id v9 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v8 = [v9 currentVideoCall];

  if (v8) {
    goto LABEL_4;
  }
  v37 = 0;
LABEL_5:
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  id v76 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__2;
  v69 = __Block_byref_object_dispose__2;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__2;
  v63 = __Block_byref_object_dispose__2;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__2;
  v57 = __Block_byref_object_dispose__2;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__2;
  v51 = __Block_byref_object_dispose__2;
  id v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__2;
  v45[4] = __Block_byref_object_dispose__2;
  id v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__2;
  v43[4] = __Block_byref_object_dispose__2;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__2;
  v41[4] = __Block_byref_object_dispose__2;
  id v42 = 0;
  BOOL v13 = [v37 arrayByAddingObjectsFromArray:v38];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __84___AXSpringBoardServerInstance__setCallRoute_ifCurrentlyRoutedTo_withRoutes_rampUp___block_invoke;
  v40[3] = &unk_2647F0F10;
  v40[4] = &v71;
  v40[5] = &v59;
  v40[6] = &v65;
  v40[7] = v45;
  v40[8] = &v53;
  v40[9] = v43;
  v40[10] = v41;
  v40[11] = &v47;
  [v13 enumerateObjectsUsingBlock:v40];

  id v14 = (void *)v72[5];
  if (!v14)
  {
    id v15 = [MEMORY[0x263F544E0] sharedAVSystemController];
    uint64_t v16 = [v15 attributeForKey:*MEMORY[0x263F543F8]];
    uint64_t v17 = (void *)v72[5];
    v72[5] = v16;

    id v14 = (void *)v72[5];
  }
  uint64_t v18 = [v14 valueForKey:*MEMORY[0x263F542E8]];
  id v19 = v18;
  if (!v39 || [v18 isEqualToString:v39])
  {
    long long v20 = [MEMORY[0x263F47550] sharedInstance];
    long long v21 = [v20 pairedHearingAids];
    if (v21)
    {
      long long v22 = [MEMORY[0x263F47550] sharedInstance];
      int v23 = [v22 isiCloudPaired];

      if (!v23)
      {
        HAInitializeLogging();
        v24 = [NSString stringWithFormat:@"Hearing aids paired. Skipping call route"];
        uint64_t v25 = [NSString stringWithFormat:@"%s:%d %@", "-[_AXSpringBoardServerInstance _setCallRoute:ifCurrentlyRoutedTo:withRoutes:rampUp:]", 429, v24];
        v26 = (id)*MEMORY[0x263F47290];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = [v25 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v78 = v27;
          _os_log_impl(&dword_226EBC000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }

        id v28 = 0;
        goto LABEL_27;
      }
    }
    else
    {
    }
    if (a3 == 2)
    {
      v32 = v66;
    }
    else if (a3 == 1)
    {
      id v28 = (id)v54[5];
      if (v28)
      {
LABEL_27:
        v33 = AXLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v78 = (uint64_t)v28;
          _os_log_impl(&dword_226EBC000, v33, OS_LOG_TYPE_DEFAULT, "Setting new telephony route for accessibility: %@", buf, 0xCu);
        }

        if (v28) {
          objc_storeStrong((id *)&AXPreviousCallRoute, (id)v72[5]);
        }
        [(_AXSpringBoardServerInstance *)self _setAVCallRoute:v28 rampUp:v36];
        goto LABEL_32;
      }
      v32 = v60;
    }
    else
    {
      id v28 = 0;
      if (a3 || !v39) {
        goto LABEL_27;
      }
      v32 = v48;
    }
    id v28 = (id)v32[5];
    goto LABEL_27;
  }
  HAInitializeLogging();
  id v28 = [NSString stringWithFormat:@"Not switching call route to %@ as it did not match expected route (%@)", v39, v19];
  v29 = [NSString stringWithFormat:@"%s:%d %@", "-[_AXSpringBoardServerInstance _setCallRoute:ifCurrentlyRoutedTo:withRoutes:rampUp:]", 443, v28];
  v30 = (id)*MEMORY[0x263F47290];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [v29 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v78 = v31;
    _os_log_impl(&dword_226EBC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

LABEL_32:
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
}

- (void)_setAVCallRoute:(id)a3 rampUp:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    HAInitializeLogging();
    id v7 = [NSString stringWithFormat:@"Changing route to %@", v6];
    id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[_AXSpringBoardServerInstance _setAVCallRoute:rampUp:]", 451, v7];
    id v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      id v11 = v9;
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = [v10 UTF8String];
      _os_log_impl(&dword_226EBC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    int v12 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v12 setAttribute:v6 forKey:*MEMORY[0x263F543F8] error:0];

    if (v4)
    {
      [(_AXSpringBoardServerInstance *)self _rampUpCallVolume];
    }
    else
    {
      callAudioRampTimer = self->_callAudioRampTimer;
      if (callAudioRampTimer) {
        [(NSTimer *)callAudioRampTimer invalidate];
      }
    }
  }
}

- (void)_rampUpCallVolume
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  callAudioRampTimer = self->_callAudioRampTimer;
  if (callAudioRampTimer) {
    [(NSTimer *)callAudioRampTimer invalidate];
  }
  float v15 = 0.0;
  BOOL v4 = [MEMORY[0x263F544E0] sharedAVSystemController];
  int v5 = [v4 getVolume:&v15 forCategory:@"PhoneCall"];

  if (v5)
  {
    HAInitializeLogging();
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Ramping up call volume from 0.2 to %f", v15);
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[_AXSpringBoardServerInstance _rampUpCallVolume]", 477, v6];
    id v8 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      id v10 = v8;
      uint64_t v11 = [v9 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = v11;
      _os_log_impl(&dword_226EBC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    *(float *)&double v12 = v15;
    LODWORD(v13) = 1045220557;
    LODWORD(v14) = 1.5;
    [(_AXSpringBoardServerInstance *)self _rampUpCallVolumeFromVolume:v13 toVolume:v12 totalDuration:v14 progress:0.0];
  }
}

- (void)_rampUpCallVolumeFromVolume:(float)a3 toVolume:(float)a4 totalDuration:(float)a5 progress:(float)a6
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92___AXSpringBoardServerInstance__rampUpCallVolumeFromVolume_toVolume_totalDuration_progress___block_invoke;
  block[3] = &unk_2647F0F38;
  objc_copyWeak(&v19, &location);
  float v20 = a4;
  float v21 = a3;
  float v22 = a6;
  float v23 = a5;
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, block);
  double v12 = (void *)MEMORY[0x263EFFA20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __92___AXSpringBoardServerInstance__rampUpCallVolumeFromVolume_toVolume_totalDuration_progress___block_invoke_364;
  v16[3] = &unk_2647F0F60;
  id v13 = v11;
  id v17 = v13;
  double v14 = [v12 scheduledTimerWithTimeInterval:0 repeats:v16 block:0.1];
  callAudioRampTimer = self->_callAudioRampTimer;
  self->_callAudioRampTimer = v14;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

+ (id)springBoardServerInstanceIfExists
{
  return (id)ServerInstance;
}

- (_AXSpringBoardServerInstance)init
{
  return 0;
}

- (void)dealloc
{
  [(AXIPCServer *)self->_server removeAllHandlersForTarget:self];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263F796C0], 0);
  BOOL v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F7E2F8], 0);
  int v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, (CFNotificationName)*MEMORY[0x263F8B2F0], 0);
  hidManager = self->_hidManager;
  Current = CFRunLoopGetCurrent();
  IOHIDManagerUnscheduleFromRunLoop(hidManager, Current, (CFStringRef)*MEMORY[0x263EFFE88]);
  CFRelease(self->_hidManager);
  self->_hidManager = 0;
  v9.receiver = self;
  v9.super_class = (Class)_AXSpringBoardServerInstance;
  [(_AXSpringBoardServerInstance *)&v9 dealloc];
}

- (id)_initServer
{
  v30.receiver = self;
  v30.super_class = (Class)_AXSpringBoardServerInstance;
  v2 = [(_AXSpringBoardServerInstance *)&v30 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F22930]) initWithRegistrationMessageKey:4012 actionResultMessageKey:5002];
    actionHandlerHelper = v2->_actionHandlerHelper;
    v2->_actionHandlerHelper = (AXServerInstanceActionHandlerHelper *)v3;

    int v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    reachabilityHandlers = v2->_reachabilityHandlers;
    v2->_reachabilityHandlers = v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    assertionClients = v2->_assertionClients;
    v2->_assertionClients = (NSMapTable *)v7;

    id v9 = objc_alloc(MEMORY[0x263F228C8]);
    uint64_t v10 = [v9 initWithServiceName:*MEMORY[0x263F22700] perPidService:0];
    server = v2->_server;
    v2->_server = (AXIPCServer *)v10;

    [(_AXSpringBoardServerInstance *)v2 _performValidation];
    double v12 = [MEMORY[0x263F82438] sharedApplication];
    int v13 = [v12 safeBoolForKey:@"_hasFinishedLaunching"];

    if (v13)
    {
      [(_AXSpringBoardServerInstance *)v2 _registerServerAndNotifyClients];
    }
    else
    {
      LOBYTE(v29) = 1;
      _AXLogWithFacility();
      double v14 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v29, @"SpringBoard is not done booting. Waiting for notification to start AXSB server.");
      [v14 addObserver:v2 selector:sel__springBoardFinishedLaunching_ name:*MEMORY[0x263F83338] object:0];
    }
    [(_AXSpringBoardServerInstance *)v2 _initializeHearing];
    [(_AXSpringBoardServerInstance *)v2 _initializeBiomeStreamDonations];
    AXPerformBlockOnMainThreadAfterDelay();
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)callStateChanged, (CFStringRef)*MEMORY[0x263F796C0], 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v16 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v16, v2, (CFNotificationCallback)callStateChanged, (CFStringRef)*MEMORY[0x263F7E2F8], 0, (CFNotificationSuspensionBehavior)0);
    id v17 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v17, v2, (CFNotificationCallback)incomingCallStateChanged, (CFStringRef)*MEMORY[0x263F796C8], 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v18 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v18, v2, (CFNotificationCallback)incomingCallStateChanged, @"SBFaceTimeStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    id v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v2 selector:sel__proximityDidChange_ name:*MEMORY[0x263F796F0] object:0];

    float v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v2 selector:sel_userChangedRouteNotification_ name:@"MPAVRoutingControllerDidPickRouteNotification" object:0];

    float v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v2 selector:sel_bluetoothPairingDidChange_ name:*MEMORY[0x263F2B948] object:0];

    float v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 postNotificationName:AXSpringBoardServerInstanceDidInitializeNotification object:v2];

    float v23 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    v2->_hidManager = v23;
    IOHIDManagerRegisterDeviceMatchingCallback(v23, (IOHIDDeviceCallback)hidDeviceCallback, v2);
    IOHIDManagerRegisterInputValueCallback(v2->_hidManager, (IOHIDValueCallback)inputValueCallback, v2);
    v24 = [MEMORY[0x263EFF980] array];
    [v24 addObject:&unk_26DB20408];
    [v24 addObject:&unk_26DB20430];
    [v24 addObject:&unk_26DB20458];
    [v24 addObject:&unk_26DB20480];
    IOHIDManagerSetDeviceMatchingMultiple(v2->_hidManager, (CFArrayRef)v24);
    hidManager = v2->_hidManager;
    Current = CFRunLoopGetCurrent();
    IOHIDManagerScheduleWithRunLoop(hidManager, Current, (CFStringRef)*MEMORY[0x263EFFE88]);
    uint64_t v27 = v2;
  }
  return v2;
}

- (void)_springBoardFinishedLaunching:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 removeObserver:self name:*MEMORY[0x263F83338] object:0];

  [(_AXSpringBoardServerInstance *)self _registerServerAndNotifyClients];
  [(_AXSpringBoardServerInstance *)self _initializeAutoAnswerWatchObserver];
}

- (void)_registerServerAndNotifyClients
{
  server = self->_server;
  id v8 = 0;
  [(AXIPCServer *)server startServerWithError:&v8];
  id v4 = v8;
  [(AXIPCServer *)self->_server setQueueSize:100];
  [(_AXSpringBoardServerInstance *)self _initializeHandlers];
  [(AXIPCServer *)self->_server setClientInvalidationCallback:&__block_literal_global_432];
  if (v4) {
    NSLog(&cfstr_ErrorStartingA.isa, v4);
  }
  AXPerformBlockOnMainThreadAfterDelay();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63___AXSpringBoardServerInstance__registerServerAndNotifyClients__block_invoke_3;
  v7[3] = &unk_2647F0FD0;
  v7[4] = self;
  int v5 = [MEMORY[0x263F645C0] monitorWithConfiguration:v7];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v5;

  [(_AXSpringBoardServerInstance *)self _initializeLiveTranscriptionObserver];
}

- (void)_initializeHandlers
{
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__getApplicationOrientation_ forKey:4000 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__getPid_ forKey:4001 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__showAlert_ forKey:4002 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__hideAlert_ forKey:4003 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__showRemoteView_, 4085, @"com.apple.accessibility.voiceover", @"com.apple.commandandcontrol", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__hideRemoteView_, 4086, @"com.apple.accessibility.voiceover", @"com.apple.commandandcontrol", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isShowingRemoteView_, 4095, @"com.apple.accessibility.voiceover", @"com.apple.commandandcontrol", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isMakingEmergencyCall_ forKey:4005 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__hasActiveCall_ forKey:4027 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__hasActiveEndpointCall_ forKey:4081 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__hasActiveOrPendingCall_ forKey:4051 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__hasActiveOrPendingCallOrFaceTime_ forKey:4057 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__topEventPidOverride_ forKey:4006 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__takeScreenshot_, 4009, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openAppSwitcher_, 4010, @"com.apple.accessibility.voiceover", @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__dismissAppSwitcher_, 4047, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__dismissShelfSwitcher_, 4004, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__simulateEdgePressHaptics_, 4067, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleAppLibrary_, 4112, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleQuickNote_, 4113, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__wakeUpDeviceIfNecessary_, 4068, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.fullkeyboardaccess", @"com.apple.axremoted.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__unlockDevice_, 4048, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__rebootDevice_, 4075, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__dismissSiri_, 4049, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleNotificationCenter_, 4034, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isNotificationCenterVisible_, 4033, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isLongLookNotificationVisible_, 4111, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openVoiceControl_, 4029, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openTypeToSiri_, 4132, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__getActiveInterfaceOrientation_ forKey:4030 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__actionHandling_, 4012, @"com.apple.accessibility.automation.client", @"com.apple.accessibility.BackBoard", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.accessibility.voiceover", @"com.apple.private.security.storage.Spotlight", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isVoiceControlRunning_, 4013, @"com.apple.accessibility.api", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isSystemSleeping_ forKey:4016 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__volumeLevel_ forKey:4017 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isOrientationLocked_ forKey:4018 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__setOrientation_ forKey:4107 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__setOrientationLocked_ forKey:4059 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isSideSwitchUsedForOrientation_ forKey:4019 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isRingerMuted_ forKey:4020 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openCustomGestureCreationForAST_, 4021, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openCustomGestureCreationForSCAT_, 4022, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openCommandAndControlSettings_, 4097, @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openCommandAndControlCommands_, 4087, @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__openCommandAndControlVocabulary_, 4088, @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__cancelGestureActivation_, 4008, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleHearingControl_, 4023, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__setCaptionPanelContextId_, 4096, @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isPointInAXInspector_, 4024, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isMediaPlaying_, 4025, @"com.apple.accessibility.voiceover", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.axctl", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__pauseMedia_, 4053, @"com.apple.accessibility.voiceover", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__resumeMedia_, 4054, @"com.apple.accessibility.voiceover", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__resetDimTimer_ forKey:4026 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__startHearingAidServer_, 4035, @"com.apple.CoreRoutine.preferences", @"com.apple.hearingaids", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__showControlCenter_, 4032, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleDock_, 4077, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__armApplePay_, 4078, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__showNotificationCenter_, 4050, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isControlCenterVisible_, 4031, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__copyStringToPasteboard_, 4036, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isSiriVisible_, 4037, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isAppSwitcherVisible_, 4011, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isTypeToSiriVisible_, 4133, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isShelfSwitcherVisible_, 4007, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isShowingHomescreen_, 4079, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isContinuitySessionActive_, 4131, @"com.apple.fullkeyboardaccess", @"com.apple.CoreRoutine.preferences", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.hearingaids", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isDockVisible_, 4076, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isPasscodeLockVisible_, 4082, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isLockScreenVisible_, 4104, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isShowingNonSystemApp_, 4090, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isSyncingRestoringResettingOrUpdating_, 4039, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__areSystemGesturesDisabledNatively_, 4043, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__areSystemGesturesDisabledByAccessibility_, 4044, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleSpringBoardInfoQuery_, 4045, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleInstalledApps_, 4046, @"com.apple.accessibility.BackBoard", @"com.apple.CoreRoutine.preferences", @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleInternalApps_, 4093, @"com.apple.accessibility.BackBoard", @"com.apple.CoreRoutine.preferences", @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleIsInspectorMinimized_, 4052, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleCancelReachabilityTimer_, 4058, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__handleToggleSpotlight_ forKey:4065 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__handleRevealSpotlight_ forKey:4066 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isSpotlightVisible_ forKey:4098 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__isPIPWindowVisible_ forKey:4102 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isGuidedAccessActive_, 4038, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isDarkModeActive_, 4099, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleDarkMode_, 4100, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__handleLoadGAXBundleForUnmanagedASAM_ forKey:4069];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleReactivateInCallService_, 4084, @"com.apple.hearingaids", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleLaunchMagnifierApp_, 4070, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.AXSettingsShortcuts", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleIsMagnifierVisible_, 4071, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.AXSettingsShortcuts", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleLaunchOnboardingViewService_, 4122, @"com.apple.accessibility.AXSettingsShortcuts", @"com.apple.accessibility.axctl", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleLaunchVoiceOverQuickSettingsViewService_, 4094, @"com.apple.accessibility.voiceover", @"com.apple.accessibility.axctl", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleLaunchVoiceOverImageExplorerViewService_, 4105, @"com.apple.accessibility.voiceover", @"com.apple.accessibility.axctl", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__visibleTripleClickItems_, 4108, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self selector:sel__setSpeechPlaybackControls_ forKey:4040 possibleRequiredEntitlements:0];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__isSpeakThisTemporarilyDisabled_, 4042, @"com.apple.accessibility.voiceover", @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleAcquireAssertion_, 1000, @"com.apple.assistivetouch.daemon", @"com.apple.CoreRoutine.preferences", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.AXSBServer.assertions", @"com.apple.accessibility.feature.securepay", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleRelinquishAssertion_, 1001, @"com.apple.assistivetouch.daemon", @"com.apple.CoreRoutine.preferences", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.AXSBServer.assertions", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__activateSOSMode_, 4074, @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__getSplashImageForApp_, 4089, @"com.apple.AXUIViewService", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleDisplayIdentifierForSceneIdentifier_, 4120, @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__connectedDevicesRequireAssistiveTouch_, 4101, @"com.apple.CoreRoutine.preferences", 0 selector forKey possibleRequiredEntitlements];
  uint64_t v3 = [MEMORY[0x263F22938] sharedInstance];
  int v4 = [v3 laserEnabled];

  if (v4) {
    [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__connectedDevicesHaveAssistiveTouchCustomActions_, 4109, @"com.apple.CoreRoutine.preferences", 0 selector forKey possibleRequiredEntitlements];
  }
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__cancelSiriDismissalForAssistiveTouch_, 4103, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleTorch_, 4106, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleIsSystemAppShowingAnAlert_, 4501, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleGetFocusedAppPID_, 4503, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.accessibility.AXSpringBoardServerAccess", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleGetPurpleBuddyPID_, 4507, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.voiceover", @"com.apple.fullkeyboardaccess", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleGetRunningAppPIDs_, 4504, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleGetFocusedApps_, 4509, @"com.apple.hearingaids", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleGetFocusedOccludedAppScenes_, 4510, @"com.apple.assistivetouch.daemon", @"com.apple.commandandcontrol", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleIsSystemAppFrontmost_, 4500, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleIsPurpleBuddyAppFrontmost_, 4506, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleIsSettingsAppFrontmost_, 4505, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.BackBoard", @"com.apple.voiceservices.tts.customvoice", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__appNameFromPid_, 4114, @"com.apple.livetranscriptionui", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleLiveTranscription_, 4115, @"com.apple.accessibility.BackBoard", @"com.apple.CoreRoutine.preferences", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleNativeFocusedApplication_, 4123, @"com.apple.accessibility.BackBoard", @"com.apple.CoreRoutine.preferences", @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleSetZoomEnabled_, 4124, @"com.apple.accessibility.settings-modifier-client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleZoomEnabled_, 4125, @"com.apple.accessibility.settings-modifier-client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleSetBluetoothPowerEnabled_, 4128, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleBluetoothPowerEnabled_, 4129, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleSetVoiceOverEnabled_, 4126, @"com.apple.accessibility.settings-modifier-client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleVoiceOverEnabled_, 4127, @"com.apple.accessibility.settings-modifier-client", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleFreezeClarityUILoadingScreen_, 4116, @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handlePresentNearbyDeviceControlPicker_, 4117, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.voiceover", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.CoreRoutine.preferences", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__diminishJindo_, 4118, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__jindoAppIdentifiers_, 4121, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleDetectionMode_, 4119, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleConversationBoost_, 4130, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__reachabilityOffset_, 4055, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__reachabilityHandling_, 4056, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__reachabilityActive_, 4060, @"com.apple.accessibility.physicalinteraction.client", @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__handleToggleIncomingCall_, 4061, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__reachabilityEnabled_, 4083, @"com.apple.accessibility.BackBoard", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__allowedMedusaGestures_, 4063, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.fullkeyboardaccess", @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__performMedusaGesture_, 4064, @"com.apple.assistivetouch.daemon", @"com.apple.accessibility.voiceover", @"com.apple.fullkeyboardaccess", @"com.apple.commandandcontrol", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__medusaApps_, 4080, @"com.apple.accessibility.voiceover", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__setDockIconActivationMode_, 4091, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__canSetDockIconActivationMode_, 4092, @"com.apple.assistivetouch.daemon", 0 selector forKey possibleRequiredEntitlements];
  [(AXIPCServer *)self->_server setHandlerWithTarget:self, sel__toggleBackgroundSounds_, 4110, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.physicalinteraction.client", 0 selector forKey possibleRequiredEntitlements];
}

- (void)_biomeDonationLargeTextDidChange:(id)a3
{
  uint64_t v3 = (void *)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  int v4 = v3;
  if (v3 && ([v3 isEqualToString:*MEMORY[0x263F83468]] & 1) == 0)
  {
    int v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_INFO, "Donating text size changed to TipKit", v9, 2u);
    }

    id v6 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
    uint64_t v7 = [v6 source];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F2A780]) initWithIdentifier:@"com.apple.accessibility.textsize.changed" bundleID:@"com.apple.accessibility" context:0];
    [v7 sendEvent:v8];
  }
}

- (void)_initializeBiomeStreamDonations
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__biomeDonationLargeTextDidChange_ name:*MEMORY[0x263F83428] object:0];

  [(_AXSpringBoardServerInstance *)self _biomeDonationLargeTextDidChange:0];
}

- (void)_initializeHearing
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___AXSpringBoardServerInstance__initializeHearing__block_invoke;
  aBlock[3] = &unk_2647F0648;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  int v5 = dispatch_get_global_queue(0, 0);
  dispatch_after(v4, v5, v3);

  id v6 = [MEMORY[0x263F47550] sharedInstance];
  [v6 registerUpdateBlock:v3 forRetrieveSelector:sel_pairedHearingAids withListener:self];

  uint64_t v7 = [MEMORY[0x263F5D458] sharedInstance];
  [v7 registerUpdateBlock:v3 forRetrieveSelector:sel_personalMediaConfiguration withListener:self];

  id v8 = [MEMORY[0x263F47548] sharedInstance];
  [v8 registerUpdateBlock:v3 forRetrieveSelector:sel_comfortSoundsEnabled withListener:self];
}

- (void)bluetoothPairingDidChange:(id)a3
{
}

- (void)_performBlockAsynchronously:(id)a3 afterDelay:(double)a4
{
  if (a3)
  {
    int64_t v4 = (uint64_t)(a4 * 1000000000.0);
    id v5 = a3;
    dispatch_time_t v6 = dispatch_time(0, v4);
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    dispatch_after(v6, v7, v5);
  }
}

- (void)_initializeAutoAnswerWatchObserver
{
  if (AXDeviceIsPhone())
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(_AXSpringBoardServerInstance *)self setWatchActiveWristState:v3];

    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66___AXSpringBoardServerInstance__initializeAutoAnswerWatchObserver__block_invoke;
    v4[3] = &unk_2647F0648;
    v4[4] = self;
    [(_AXSpringBoardServerInstance *)self _performBlockAsynchronously:v4 afterDelay:3.0];
  }
}

- (void)_requestOnWristState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F213B0] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    int64_t v4 = [MEMORY[0x263F213B0] identifier];
    id v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = AXColorizeFormatLog();
      id v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v11 = 138543362;
        double v12 = v8;
        _os_log_impl(&dword_226EBC000, v5, v6, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  id v9 = [MEMORY[0x263F214B0] sharedInstance];
  id v10 = (id)[v9 publishMessage:&unk_26DB204A8 priority:1 requestingResponse:1];
}

- (void)didReceiveIncomingData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F213B0] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F213B0] identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = AXColorizeFormatLog();
      id v18 = v4;
      int v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        float v20 = v11;
        _os_log_impl(&dword_226EBC000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  double v12 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F214A0], v18);
  uint64_t v13 = [v12 objectForKeyedSubscript:@"onWristState"];
  uint64_t v14 = [v13 BOOLValue];

  float v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F21488]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 length])
  {
    uint64_t v16 = [NSNumber numberWithBool:v14];
    id v17 = [(_AXSpringBoardServerInstance *)self watchActiveWristState];
    [v17 setObject:v16 forKeyedSubscript:v15];
  }
}

- (void)registerHandlerForMessageKey:(int)a3 target:(id)a4 selector:(SEL)a5 entitlements:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = (_AXSpringBoardServerInstance *)a4;
  id v11 = a6;
  if (!v10) {
    id v10 = self;
  }
  [(AXIPCServer *)self->_server setHandlerWithTarget:v10 selector:a5 forKey:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[AXIPCServer addPossibleRequiredEntitlement:forMessageWithKey:](self->_server, "addPossibleRequiredEntitlement:forMessageWithKey:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), v8, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)_assertionClientForPort:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_assertionClients;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        os_log_type_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "serviceMachPort", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4 clientPort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(_AXSpringBoardServerInstance *)self _setupAssertionServerIfNeeded];
  id v10 = [(_AXSpringBoardServerInstance *)self assertionServer];
  [v10 addHeldAssertionOfType:v8 byClient:v9];

  if (v5)
  {
    id v11 = [(_AXSpringBoardServerInstance *)self _assertionClientForPort:v5];
    if (!v11)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F228B8]) initWithPort:v5];
      [v11 setClientIdentifier:v9];
      LODWORD(v12) = 1.0;
      [v11 setTimeout:v12];
      [v11 connectWithError:0];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __79___AXSpringBoardServerInstance_acquireAssertionWithType_identifier_clientPort___block_invoke;
      v19[3] = &unk_2647F0A90;
      v19[4] = self;
      int v20 = v5;
      [v11 setPortDeathHandler:v19];
      assertionClients = self->_assertionClients;
      long long v14 = [MEMORY[0x263EFF980] array];
      [(NSMapTable *)assertionClients setObject:v14 forKey:v11];
    }
    long long v15 = objc_opt_new();
    [v15 setIdentifier:v9];
    [v15 setType:v8];
    uint64_t v16 = [(NSMapTable *)self->_assertionClients objectForKey:v11];
    if (!v16)
    {
      uint64_t v17 = AXLogAssertions();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[_AXSpringBoardServerInstance acquireAssertionWithType:identifier:clientPort:]();
      }
    }
    [v16 addObject:v15];
  }
  long long v18 = AXLogAssertions();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_226EBC000, v18, OS_LOG_TYPE_INFO, "SB acquired assertion: %@, %@", buf, 0x16u);
  }
}

- (void)_relinquishAllAssertionsForClientWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = -[_AXSpringBoardServerInstance _assertionClientForPort:](self, "_assertionClientForPort:");
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_assertionClients objectForKey:v5];
    uint64_t v7 = (void *)[v6 copy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "type", (void)v16);
          long long v15 = [v13 identifier];
          [(_AXSpringBoardServerInstance *)self relinquishAssertionWithType:v14 identifier:v15 clientPort:v3];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4 clientPort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(_AXSpringBoardServerInstance *)self assertionServer];
  [v10 removeHeldAssertionOfType:v8 byClient:v9];

  if (v5)
  {
    uint64_t v11 = [(_AXSpringBoardServerInstance *)self _assertionClientForPort:v5];
    if (v11)
    {
      double v12 = [(NSMapTable *)self->_assertionClients objectForKey:v11];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      long long v17 = __82___AXSpringBoardServerInstance_relinquishAssertionWithType_identifier_clientPort___block_invoke;
      long long v18 = &unk_2647F1020;
      id v19 = v8;
      id v20 = v9;
      long long v13 = [v12 indexesOfObjectsPassingTest:&v15];
      objc_msgSend(v12, "removeObjectsAtIndexes:", v13, v15, v16, v17, v18);
      if (![v12 count]) {
        [(NSMapTable *)self->_assertionClients removeObjectForKey:v11];
      }
    }
  }
  long long v14 = AXLogAssertions();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_226EBC000, v14, OS_LOG_TYPE_INFO, "SB relinquished assertion: %@, %@", buf, 0x16u);
  }
}

- (BOOL)_inSetupMode
{
  v2 = +[AXSpringBoardServerHelper sharedServerHelper];
  char v3 = [v2 isBuddyRunning];

  return v3;
}

- (void)_performValidation
{
  id v2 = [MEMORY[0x263F21400] sharedInstance];
  [v2 performValidations:&__block_literal_global_842 withPreValidationHandler:&__block_literal_global_1074 postValidationHandler:0];
}

- (void)_setSystemGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = AXLogAssertions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v3;
    _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_INFO, "System gestures enabled: %d", (uint8_t *)&buf, 8u);
  }

  AXPerformSafeBlock();
  LOBYTE(buf) = 0;
  uint64_t v6 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"_interactiveScreenshotGestureManager"];
  uint64_t v7 = __UIAccessibilitySafeClass();

  if ((_BYTE)buf) {
    abort();
  }
  id v8 = [(_AXSpringBoardServerInstance *)self _accessibilityValueForKey:@"AXScreenshotAssertion"];
  id v9 = v8;
  if (v3 || v8)
  {
    if (v3 && v8)
    {
      [v8 invalidate];
      [(_AXSpringBoardServerInstance *)self _accessibilityRemoveValueForKey:v9];
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__2;
    uint64_t v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    id v11 = v7;
    AXPerformSafeBlock();
    id v9 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    [(_AXSpringBoardServerInstance *)self _accessibilitySetRetainedValue:v9 forKey:@"AXScreenshotAssertion"];
    uint64_t v10 = AXLogAssertions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_226EBC000, v10, OS_LOG_TYPE_INFO, "Acquired screenshot assertion: %@", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (BOOL)onlySystemGesturesDisabledHolderIsGuidedAccess
{
  id v2 = [(_AXSpringBoardServerInstance *)self assertionServer];
  BOOL v3 = [v2 clientsHoldingAssertionOfType:*MEMORY[0x263F223D0]];
  char v4 = [v3 isEqualToArray:&unk_26DB20370];

  return v4;
}

- (void)_setupAssertionServerIfNeeded
{
  BOOL v3 = [(_AXSpringBoardServerInstance *)self assertionServer];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F229F0]);
    [(_AXSpringBoardServerInstance *)self setAssertionServer:v4];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61___AXSpringBoardServerInstance__setupAssertionServerIfNeeded__block_invoke;
    v7[3] = &unk_2647F1048;
    objc_copyWeak(&v8, &location);
    [v4 setAssertionWasAcquiredHandler:v7];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61___AXSpringBoardServerInstance__setupAssertionServerIfNeeded__block_invoke_2;
    v5[3] = &unk_2647F1048;
    objc_copyWeak(&v6, &location);
    [v4 setAssertionWasReleasedHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_setSecurePayAccessibilityFeaturesDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = AXLogAssertions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_DEFAULT, "Processing secure pay ax features: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(_AXSpringBoardServerInstance *)self delegate];
  [v7 setSecurePayAccessibilityFeaturesDisabled:v3 withServerInstance:self];
}

- (void)_setDashboardSystemGesturesDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = @"disabling dashboard system gestures";
  if (a3) {
    uint64_t v5 = @"reenabling dashboard system gestures";
  }
  LOBYTE(v6) = 1;
  uint64_t v7 = v5;
  _AXLogWithFacility();
  id v8 = [(_AXSpringBoardServerInstance *)self delegate];
  [v8 setDashBoardSystemGesturesEnabled:!v3 withServerInstance:self];
}

- (BOOL)shouldAllowActiveWatchToAutoAnswer
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  if (AXDeviceIsPhone())
  {
    BOOL v3 = [MEMORY[0x263F57730] sharedInstance];
    id v4 = [v3 getActivePairedDevice];

    if (v4)
    {
      uint64_t v5 = [v4 valueForProperty:*MEMORY[0x263F575B0]];
      int v6 = [v5 BOOLValue];

      if (!v6)
      {
        uint64_t v17 = [MEMORY[0x263F57730] sharedInstance];
        uint64_t v18 = [v17 deviceIDForNRDevice:v4];
        uint64_t v10 = [(id)v18 UUIDString];

        id v19 = [MEMORY[0x263F213B0] sharedInstance];
        LOBYTE(v18) = [v19 ignoreLogging];

        if ((v18 & 1) == 0)
        {
          id v20 = [MEMORY[0x263F213B0] identifier];
          uint64_t v21 = AXLoggerForFacility();

          os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v21, v22))
          {
            __int16 v23 = AXColorizeFormatLog();
            id v70 = v10;
            id v24 = _AXStringForArgs();
            if (os_log_type_enabled(v21, v22))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v79 = v24;
              _os_log_impl(&dword_226EBC000, v21, v22, "%{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v25 = objc_msgSend(MEMORY[0x263F214B0], "sharedInstance", v70);
        v26 = [v25 connectedDevices];

        if (![v26 count])
        {
          uint64_t v27 = [MEMORY[0x263F213B0] sharedInstance];
          char v28 = [v27 ignoreLogging];

          if ((v28 & 1) == 0)
          {
            uint64_t v29 = [MEMORY[0x263F213B0] identifier];
            objc_super v30 = AXLoggerForFacility();

            os_log_type_t v31 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v30, v31))
            {
              v32 = AXColorizeFormatLog();
              v33 = _AXStringForArgs();
              if (os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)long long buf = 138543362;
                uint64_t v79 = v33;
                _os_log_impl(&dword_226EBC000, v30, v31, "%{public}@", buf, 0xCu);
              }
            }
          }
        }
        v34 = [MEMORY[0x263F213B0] sharedInstance];
        char v35 = [v34 ignoreLogging];

        if ((v35 & 1) == 0)
        {
          BOOL v36 = [MEMORY[0x263F213B0] identifier];
          v37 = AXLoggerForFacility();

          os_log_type_t v38 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v37, v38))
          {
            id v39 = AXColorizeFormatLog();
            uint64_t v71 = v26;
            v40 = _AXStringForArgs();
            if (os_log_type_enabled(v37, v38))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v79 = v40;
              _os_log_impl(&dword_226EBC000, v37, v38, "%{public}@", buf, 0xCu);
            }
          }
        }
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v12 = v26;
        uint64_t v41 = [v12 countByEnumeratingWithState:&v73 objects:v77 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v74;
          uint64_t v44 = *MEMORY[0x263F21488];
LABEL_32:
          uint64_t v45 = 0;
          while (1)
          {
            if (*(void *)v74 != v43) {
              objc_enumerationMutation(v12);
            }
            id v46 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * v45), "objectForKeyedSubscript:", v44, v71);
            char v47 = [v46 isEqualToString:v10];

            if (v47) {
              break;
            }
            if (v42 == ++v45)
            {
              uint64_t v42 = [v12 countByEnumeratingWithState:&v73 objects:v77 count:16];
              if (v42) {
                goto LABEL_32;
              }
              goto LABEL_38;
            }
          }

          uint64_t v13 = (id)*MEMORY[0x263F8B0F8];
          v50 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:v13 pairedDevice:v4];
          if ([v50 BOOLForKey:*MEMORY[0x263F22A58]])
          {
            v51 = [(_AXSpringBoardServerInstance *)self watchActiveWristState];
            id v52 = [v51 objectForKeyedSubscript:v10];

            if (!v52)
            {
              v72[0] = MEMORY[0x263EF8330];
              v72[1] = 3221225472;
              v72[2] = __66___AXSpringBoardServerInstance_shouldAllowActiveWatchToAutoAnswer__block_invoke;
              v72[3] = &unk_2647F0648;
              v72[4] = self;
              [(_AXSpringBoardServerInstance *)self _performBlockAsynchronously:v72 afterDelay:3.0];
              uint64_t v53 = [MEMORY[0x263F213B0] sharedInstance];
              char v54 = [v53 ignoreLogging];

              if ((v54 & 1) == 0)
              {
                uint64_t v55 = [MEMORY[0x263F213B0] identifier];
                v56 = AXLoggerForFacility();

                os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v56, v57))
                {
                  id v58 = AXColorizeFormatLog();
                  uint64_t v59 = _AXStringForArgs();
                  if (os_log_type_enabled(v56, v57))
                  {
                    *(_DWORD *)long long buf = 138543362;
                    uint64_t v79 = v59;
                    _os_log_impl(&dword_226EBC000, v56, v57, "%{public}@", buf, 0xCu);
                  }
                }
              }
            }
            char v14 = [v52 BOOLValue];
            goto LABEL_65;
          }
          uint64_t v61 = [MEMORY[0x263F213B0] sharedInstance];
          char v62 = [v61 ignoreLogging];

          if (v62)
          {
            char v14 = 0;
            goto LABEL_66;
          }
          uint64_t v65 = [MEMORY[0x263F213B0] identifier];
          id v52 = AXLoggerForFacility();

          os_log_type_t v66 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v52, v66))
          {
            uint64_t v67 = AXColorizeFormatLog();
            v68 = _AXStringForArgs();
            if (os_log_type_enabled(v52, v66))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v79 = v68;
              _os_log_impl(&dword_226EBC000, v52, v66, "%{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
LABEL_38:

          v48 = [MEMORY[0x263F213B0] sharedInstance];
          char v49 = [v48 ignoreLogging];

          if (v49)
          {
            char v14 = 0;
LABEL_68:

            goto LABEL_69;
          }
          v63 = [MEMORY[0x263F213B0] identifier];
          uint64_t v13 = AXLoggerForFacility();

          os_log_type_t v64 = AXOSLogLevelFromAXLogLevel();
          if (!os_log_type_enabled(v13, v64)) {
            goto LABEL_59;
          }
          v50 = AXColorizeFormatLog();
          id v52 = _AXStringForArgs();
          if (os_log_type_enabled(v13, v64))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v79 = v52;
            _os_log_impl(&dword_226EBC000, v13, v64, "%{public}@", buf, 0xCu);
          }
        }
        char v14 = 0;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      uint64_t v7 = [MEMORY[0x263F213B0] sharedInstance];
      char v8 = [v7 ignoreLogging];

      if ((v8 & 1) == 0)
      {
        id v9 = [MEMORY[0x263F213B0] identifier];
        uint64_t v10 = AXLoggerForFacility();

        os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v10, v11))
        {
          AXColorizeFormatLog();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = _AXStringForArgs();
          if (os_log_type_enabled(v10, v11))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v79 = v13;
LABEL_52:
            _os_log_impl(&dword_226EBC000, v10, v11, "%{public}@", buf, 0xCu);
            goto LABEL_59;
          }
          goto LABEL_59;
        }
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x263F213B0] sharedInstance];
      char v16 = [v15 ignoreLogging];

      if ((v16 & 1) == 0)
      {
        v60 = [MEMORY[0x263F213B0] identifier];
        uint64_t v10 = AXLoggerForFacility();

        os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v10, v11))
        {
          AXColorizeFormatLog();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = _AXStringForArgs();
          if (os_log_type_enabled(v10, v11))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v79 = v13;
            goto LABEL_52;
          }
LABEL_59:
          char v14 = 0;
LABEL_67:

          goto LABEL_68;
        }
LABEL_53:
        char v14 = 0;
LABEL_69:

        goto LABEL_70;
      }
    }
    char v14 = 0;
LABEL_70:

    return v14;
  }
  return 0;
}

- (id)_getApplicationOrientation:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  BOOL v3 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  uint64_t v4 = [v3 safeIntegerForKey:@"activeInterfaceOrientation"];

  if ((unint64_t)(v4 - 1) < 4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"orientation";
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v5];
  v12[0] = v7;
  char v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4000 payload:v8];

  return v9;
}

- (id)_getPid:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F228C0]);
  char v8 = @"pid";
  uint64_t v4 = [NSNumber numberWithInt:getpid()];
  v9[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (void *)[v3 initWithKey:4001 payload:v5];

  return v6;
}

- (id)_showAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"alertType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 integerValue];
    char v8 = [(_AXSpringBoardServerInstance *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __43___AXSpringBoardServerInstance__showAlert___block_invoke;
    v12[3] = &unk_2647F1070;
    id v13 = v4;
    id v9 = [v13 payload];
    uint64_t v10 = [v9 objectForKey:@"data"];
    [v8 serverInstance:self showAlertType:v7 withHandler:v12 withData:v10];
  }
  return 0;
}

- (id)_hideAlert:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 hideAlertWithServerInstance:self];

  return 0;
}

- (id)_showRemoteView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"remoteViewType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 integerValue];
    char v8 = [(_AXSpringBoardServerInstance *)self delegate];
    id v9 = [v4 payload];
    uint64_t v10 = [v9 objectForKey:@"data"];
    [v8 serverInstance:self showRemoteViewType:v7 withData:v10];
  }
  return 0;
}

- (id)_hideRemoteView:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"remoteViewType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = [(_AXSpringBoardServerInstance *)self delegate];
    [v7 serverInstance:self hideRemoteViewType:v6];
  }
  return 0;
}

- (id)_isShowingRemoteView:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"remoteViewType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = [(_AXSpringBoardServerInstance *)self delegate];
    uint64_t v8 = [v7 serverInstance:self isShowingRemoteViewType:v6];

    id v9 = objc_alloc(MEMORY[0x263F228C0]);
    char v14 = @"result";
    uint64_t v10 = [NSNumber numberWithBool:v8];
    v15[0] = v10;
    os_log_type_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = (void *)[v9 initWithKey:4027 payload:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_isMakingEmergencyCall:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  uint64_t v5 = NSNumber;
  uint64_t v6 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "isMakingEmergencyCallWithServerInstance:", self));
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v4 initWithKey:4005 payload:v8];

  return v9;
}

- (id)_hasActiveCall:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveCall](self, "hasActiveCall"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:4027 payload:v6];

  return v7;
}

- (id)_hasActiveEndpointCall:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveEndpointCall](self, "hasActiveEndpointCall"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:4081 payload:v6];

  return v7;
}

- (id)_hasActiveOrPendingCall:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveOrPendingCall](self, "hasActiveOrPendingCall"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:4051 payload:v6];

  return v7;
}

- (id)_hasActiveOrPendingCallOrFaceTime:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveOrPendingCallOrFaceTime](self, "hasActiveOrPendingCallOrFaceTime"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:4057 payload:v6];

  return v7;
}

- (id)_topEventPidOverride:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"_isSpringBoardShowingAnAlert"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = getpid();
  }
  else
  {
    uint64_t v6 = [NSClassFromString(&cfstr_Sbcoversheetpr.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v7 = [v6 safeValueForKey:@"lockScreenEnvironment.applicationHoster.hostedAppSceneHandle.application.processState"];
    uint64_t v5 = [v7 safeIntForKey:@"pid"];
  }
  id v8 = objc_alloc(MEMORY[0x263F228C0]);
  id v13 = @"pid";
  id v9 = [NSNumber numberWithInt:v5];
  v14[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  os_log_type_t v11 = (void *)[v8 initWithKey:4006 payload:v10];

  return v11;
}

- (id)_takeScreenshot:(id)a3
{
  return 0;
}

- (id)_openAppSwitcher:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openAppSwitcherWithServerInstance:self];

  return 0;
}

- (id)_dismissAppSwitcher:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 dismissAppSwitcherWithServerInstance:self];

  return 0;
}

- (id)_dismissShelfSwitcher:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 dismissShelfSwitcherWithServerInstance:self];

  return 0;
}

- (id)_simulateEdgePressHaptics:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 simulateEdgePressHaptics:self];

  return 0;
}

- (id)_toggleAppLibrary:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleAppLibraryWithServerInstance:self];

  return 0;
}

- (id)_toggleQuickNote:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleQuickNoteWithServerInstance:self];

  return 0;
}

- (id)_wakeUpDeviceIfNecessary:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 wakeUpDeviceIfNecessaryWithServerInstance:self];

  return 0;
}

- (id)_unlockDevice:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 unlockDeviceWithServerInstance:self];

  return 0;
}

- (id)_rebootDevice:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 rebootDeviceWithServerInstance:self];

  return 0;
}

- (id)_dismissSiri:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 dismissSiriWithServerInstance:self];

  return 0;
}

- (id)_toggleNotificationCenter:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleNotificationCenterWithServerInstance:self];

  return 0;
}

- (id)_isNotificationCenterVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isNotificationCenterVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  uint64_t v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4033 payload:v8];

  return v9;
}

- (id)_isLongLookNotificationVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isLongLookNotificationVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  uint64_t v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4111 payload:v8];

  return v9;
}

- (id)_openVoiceControl:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openVoiceControlWithServerInstance:self];

  return 0;
}

- (id)_openTypeToSiri:(id)a3
{
  int v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openTypeToSiriWithServerInstance:self];

  return 0;
}

- (id)_getActiveInterfaceOrientation:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  int v4 = [v3 safeValueForKey:@"_frontMostAppOrientation"];
  uint64_t v5 = [v4 integerValue];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"orientation";
  uint64_t v7 = [NSNumber numberWithInteger:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4000 payload:v8];

  return v9;
}

- (id)_actionHandling:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self actionHandlerHelper];
  id v6 = [v5 handleActionHandlerRegistrationMessage:v4];

  return v6;
}

- (id)_isVoiceControlRunning:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isVoiceControlRunningWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  uint64_t v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4013 payload:v8];

  return v9;
}

- (id)_isSystemSleeping:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSystemSleepingWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  uint64_t v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4016 payload:v8];

  return v9;
}

- (id)_volumeLevel:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 volumeLevelWithServerInstance:self];
  double v6 = v5;

  id v7 = objc_alloc(MEMORY[0x263F228C0]);
  id v12 = @"result";
  id v8 = [NSNumber numberWithDouble:v6];
  v13[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = (void *)[v7 initWithKey:4017 payload:v9];

  return v10;
}

- (id)_isOrientationLocked:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isOrientationLockedWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  id v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4016 payload:v8];

  return v9;
}

- (id)_setOrientation:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"orientation"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  [v7 serverInstance:self setOrientation:v6];

  return 0;
}

- (id)_setOrientationLocked:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"locked"];
  uint64_t v6 = [v5 BOOLValue];

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  [v7 serverInstance:self setOrientationLocked:v6];

  return 0;
}

- (id)_isSideSwitchUsedForOrientation:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4016 payload:&unk_26DB204D0];
  return v3;
}

- (id)_isRingerMuted:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isRingerMutedWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  id v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4020 payload:v8];

  return v9;
}

- (id)_reachabilityOffset:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 reachabilityOffsetWithServerInstance:self];
  double v6 = v5;

  id v7 = objc_alloc(MEMORY[0x263F228C0]);
  id v12 = @"result";
  id v8 = [NSNumber numberWithDouble:v6];
  v13[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = (void *)[v7 initWithKey:4055 payload:v9];

  return v10;
}

- (id)_handleToggleIncomingCall:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 handleToggleIncomingCallWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  os_log_type_t v11 = @"result";
  id v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4061 payload:v8];

  return v9;
}

- (id)_reachabilityActive:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"active"];
  uint64_t v6 = [v5 BOOLValue];

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  [v7 setReachabilityActive:v6];

  return 0;
}

- (id)_reachabilityEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 payload];

  id v7 = [v6 objectForKeyedSubscript:@"enabled"];
  objc_msgSend(v5, "serverInstance:setReachabilityEnabled:", self, objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_reachabilityHandling:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  uint64_t v6 = [v5 objectForKey:@"register"];
  int v7 = [v6 BOOLValue];

  uint64_t v8 = [v4 clientPort];
  if (v7)
  {
    if (![(_AXSpringBoardServerInstance *)self _hasReachabilityHandlerForClientPort:v8])
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F228B8]) initWithPort:v8];
      LODWORD(v10) = 1.0;
      [v9 setTimeout:v10];
      [v9 connectWithError:0];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      void v13[2] = __54___AXSpringBoardServerInstance__reachabilityHandling___block_invoke;
      v13[3] = &unk_2647F0A90;
      void v13[4] = self;
      int v14 = v8;
      [v9 setPortDeathHandler:v13];
      [(NSMutableArray *)self->_reachabilityHandlers addObject:v9];
    }
  }
  else
  {
    [(_AXSpringBoardServerInstance *)self _removeReachabilityHandler:v8];
  }
  os_log_type_t v11 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4056 payload:&unk_26DB204F8];
  return v11;
}

- (id)_openCustomGestureCreationForAST:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openCustomGestureCreationForASTWithServerInstance:self];

  return 0;
}

- (id)_openCustomGestureCreationForSCAT:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openCustomGestureCreationForSCATWithServerInstance:self];

  return 0;
}

- (id)_openCommandAndControlSettings:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openCommandAndControlSettingsWithServerInstance:self];

  return 0;
}

- (id)_openCommandAndControlCommands:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openCommandAndControlCommandsWithServerInstance:self];

  return 0;
}

- (id)_openCommandAndControlVocabulary:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 openCommandAndControlVocabularyWithServerInstance:self];

  return 0;
}

- (id)_diminishJindo:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 diminishJindoWithServerInstance:self];

  return 0;
}

- (id)_jindoAppIdentifiers:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 jindoAppBundleIndentifiersWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  double v10 = @"result";
  v11[0] = v5;
  int v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithKey:4121 payload:v7];

  return v8;
}

- (id)_toggleDetectionMode:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleDetectionModeWithServerInstance:self];

  return 0;
}

- (id)_toggleConversationBoost:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleConversationBoostWithServerInstance:self];

  return 0;
}

- (id)_cancelGestureActivation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKey:@"type"];
  uint64_t v6 = (int)[v5 intValue];

  int v7 = [v3 payload];
  uint64_t v8 = [v7 objectForKey:@"cancelEnabled"];
  char v9 = [v8 BOOLValue];

  uint64_t v10 = v6 - 1;
  if (unint64_t)(v6 - 1) <= 7 && ((0x8Bu >> v10))
  {
    os_log_type_t v11 = (mach_port_name_t *)off_2647F11B8[v10];
    *off_2647F1178[v10] = v9;
    mach_port_name_t v12 = *v11;
    [v3 clientPort];
    AXIncrefSendRight();
    *os_log_type_t v11 = [v3 clientPort];
    if (v12)
    {
      if (mach_port_deallocate(*MEMORY[0x263EF8960], v12)) {
        _AXAssert();
      }
    }
  }

  return 0;
}

- (id)_toggleHearingControl:(id)a3
{
  id v3 = (void *)*MEMORY[0x263F83300];
  id v4 = a3;
  uint64_t v5 = [v3 safeValueForKey:@"windowSceneManager"];
  uint64_t v6 = [v5 safeValueForKey:@"embeddedDisplayWindowScene"];
  int v7 = [v6 safeValueForKey:@"switcherController"];

  [v7 safeBoolForKey:@"isMainSwitcherVisible"];
  uint64_t v8 = +[AXSBHearingAidDeviceController sharedController];
  [v8 isShowingHearingAidControl];

  char v9 = [v4 payload];

  uint64_t v10 = [v9 valueForKey:@"visible"];

  if (v10) {
    [v10 BOOLValue];
  }
  id v13 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKeyPath:@"sharedInstance._activeDisplaySwitcherController"];
  id v11 = v13;
  AXPerformBlockOnMainThreadAfterDelay();

  return 0;
}

+ (unsigned)_axCaptionPanelContextId
{
  return __axCaptionPanelContextId;
}

- (id)_setCaptionPanelContextId:(id)a3
{
  id v3 = [a3 payload];
  id v4 = [v3 valueForKey:@"contextId"];
  int v5 = [v4 integerValue];

  if (__axCaptionPanelContextId != v5)
  {
    __axCaptionPanelContextId = v5;
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:AXCaptionPanelContextDidChangeNotification object:0];
  }
  return 0;
}

- (id)_handleCancelReachabilityTimer:(id)a3
{
  return 0;
}

- (id)_handleToggleSpotlight:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleSpotlightWithServerInstance:self];

  return 0;
}

- (id)_handleRevealSpotlight:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 revealSpotlightWithServerInstance:self];

  return 0;
}

- (id)_isDarkModeActive:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isDarkModeActiveWithServiceInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  int v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4099 payload:v8];

  return v9;
}

- (id)_toggleDarkMode:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 toggleDarkModeWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  int v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4100 payload:v8];

  return v9;
}

- (id)_isGuidedAccessActive:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isGuidedAccessActiveWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  int v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4038 payload:v8];

  return v9;
}

- (id)_isSpotlightVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSpotlightVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  int v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4098 payload:v8];

  return v9;
}

- (id)_isPIPWindowVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isPIPWindowVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  int v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4102 payload:v8];

  return v9;
}

- (id)_handleLoadGAXBundleForUnmanagedASAM:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 forceLoadGAXBundleWithServerInstance:self];

  return 0;
}

- (id)_handleReactivateInCallService:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 reactivateInCallServiceWithServerInstance:self];

  return 0;
}

- (id)_handleLaunchMagnifierApp:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 launchMagnifierAppWithServerInstance:self];

  return 0;
}

- (id)_handleIsMagnifierVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isMagnifierVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  int v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4071 payload:v8];

  return v9;
}

- (id)_handleLaunchOnboardingViewService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  [v5 launchOnboardingViewServiceWithServerInstance:self data:v6];
  return 0;
}

- (id)_handleLaunchVoiceOverQuickSettingsViewService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  [v5 launchVoiceOverQuickSettingsViewServiceWithServerInstance:self data:v6];
  return 0;
}

- (id)_handleLaunchVoiceOverImageExplorerViewService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  [v5 launchVoiceOverImageExplorerViewServiceWithServerInstance:self forData:v6];
  return 0;
}

- (id)_visibleTripleClickItems:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 visibleTripleClickItemsWithServerInstance:self];

  if (v5)
  {
    char v9 = @"result";
    v10[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4108 payload:v6];

  return v7;
}

- (id)_handleIsInspectorMinimized:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (id *)MEMORY[0x263F83300];
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = [*v3 _accessibilityIsInspectorMinimized];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  id v6 = [NSNumber numberWithBool:v4];
  v11[0] = v6;
  int v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v5 initWithKey:4052 payload:v7];

  return v8;
}

- (id)_isPointInAXInspector:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (id *)MEMORY[0x263F83300];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v3 payload];
    id v6 = [v5 objectForKey:@"record"];

    uint64_t v7 = [*v4 _accessibilityIsPointInAXInspector:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = objc_alloc(MEMORY[0x263F228C0]);
  id v13 = @"result";
  char v9 = [NSNumber numberWithBool:v7];
  v14[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v11 = (void *)[v8 initWithKey:4024 payload:v10];

  return v11;
}

- (id)_isMediaPlaying:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 clientPort];
  uint64_t v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = __Block_byref_object_copy__2;
  v34[3] = __Block_byref_object_dispose__2;
  id v35 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F228B8]) initWithPort:v5];
  LODWORD(v7) = 1.0;
  [v6 setTimeout:v7];
  uint64_t v29 = 0;
  objc_super v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v8 = (id *)(v34[0] + 40);
  id obj = *(id *)(v34[0] + 40);
  char v9 = [v6 connectWithError:&obj];
  objc_storeStrong(v8, obj);
  char v32 = v9;
  if (!*((unsigned char *)v30 + 24))
  {
    uint64_t v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_AXSpringBoardServerInstance _isMediaPlaying:]((uint64_t)v34, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  uint64_t v17 = AXLogSpringboardServer();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v4 payload];
    *(_DWORD *)long long buf = 138412290;
    v37 = v18;
    _os_log_impl(&dword_226EBC000, v17, OS_LOG_TYPE_INFO, "Fetching is playing: %@", buf, 0xCu);
  }
  id v19 = [(_AXSpringBoardServerInstance *)self delegate];
  id v20 = [v4 payload];
  uint64_t v21 = [v20 objectForKey:@"bundleId"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __48___AXSpringBoardServerInstance__isMediaPlaying___block_invoke;
  v24[3] = &unk_2647F1098;
  v26 = &v29;
  id v22 = v6;
  id v25 = v22;
  uint64_t v27 = &v33;
  [v19 isMediaPlayingWithServerInstance:self forBundleId:v21 completion:v24];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return 0;
}

- (id)_pauseMedia:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  double v7 = [v6 objectForKey:@"bundleId"];
  [v5 serverInstance:self pauseMedia:1 forBundleId:v7];

  return 0;
}

- (id)_resumeMedia:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  double v7 = [v6 objectForKey:@"bundleId"];
  [v5 serverInstance:self pauseMedia:0 forBundleId:v7];

  return 0;
}

- (id)_resetDimTimer:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 resetDimTimerWithServerInstance:self];

  return 0;
}

- (id)_startHearingAidServer:(id)a3
{
  id v3 = +[AXSBHearingAidDeviceController sharedController];
  [v3 startServer];

  return 0;
}

- (id)_showControlCenter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  double v7 = [v6 objectForKey:@"show"];
  objc_msgSend(v5, "serverInstance:showControlCenter:", self, objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_toggleDock:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleDockWithServerInstance:self];

  return 0;
}

- (id)_armApplePay:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 armApplePayWithServerInstance:self];

  return 0;
}

- (id)_showNotificationCenter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_AXSpringBoardServerInstance *)self delegate];
  id v6 = [v4 payload];

  double v7 = [v6 objectForKey:@"show"];
  objc_msgSend(v5, "serverInstance:showNotificationCenter:", self, objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_isControlCenterVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isControlCenterVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4033 payload:v8];

  return v9;
}

- (id)_copyStringToPasteboard:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"string"];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = [(id)*MEMORY[0x263F1DD38] identifier];
    [v5 setObject:v4 forKey:v6];

    double v7 = [MEMORY[0x263F82A18] generalPasteboard];
    v10[0] = v5;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v7 setItems:v8];
  }
  return 0;
}

- (id)_isSiriVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSiriVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4037 payload:v8];

  return v9;
}

- (id)_isShowingHomescreen:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isShowingHomescreenWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4079 payload:v8];

  return v9;
}

- (id)_isContinuitySessionActive:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isContinuitySessionActiveWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4131 payload:v8];

  return v9;
}

- (id)_isAppSwitcherVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isAppSwitcherVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4011 payload:v8];

  return v9;
}

- (id)_isTypeToSiriVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isTypeToSiriVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4133 payload:v8];

  return v9;
}

- (id)_isShelfSwitcherVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isShelfSwitcherVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4007 payload:v8];

  return v9;
}

- (id)_isDockVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isDockVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4076 payload:v8];

  return v9;
}

- (id)_isShowingNonSystemApp:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isShowingNonSystemAppWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4090 payload:v8];

  return v9;
}

- (id)_isPasscodeLockVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isPasscodeLockVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4082 payload:v8];

  return v9;
}

- (id)_isLockScreenVisible:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isLockScreenVisibleWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4104 payload:v8];

  return v9;
}

- (id)_isSyncingRestoringResettingOrUpdating:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSyncingRestoringResettingOrUpdatingWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4039 payload:v8];

  return v9;
}

- (id)_areSystemGesturesDisabledNatively:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 areSystemGesturesDisabledNativelyWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4043 payload:v8];

  return v9;
}

- (id)_areSystemGesturesDisabledByAccessibility:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 areSystemGesturesDisabledByAccessibilityWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithKey:4044 payload:v8];

  return v9;
}

- (id)_handleSpringBoardInfoQuery:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"query"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  double v7 = [(_AXSpringBoardServerInstance *)self delegate];
  id v8 = [v7 serverInstance:self springBoardSystemInfoQuery:v6];

  id v9 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v13 = @"result";
  v14[0] = v8;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = (void *)[v9 initWithKey:4045 payload:v10];

  return v11;
}

- (id)_handleInstalledApps:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 installedAppsWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  v11[0] = v5;
  double v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)[v6 initWithKey:4046 payload:v7];

  return v8;
}

- (id)_handleInternalApps:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 internalAppsWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  v11[0] = v5;
  double v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)[v6 initWithKey:4093 payload:v7];

  return v8;
}

- (id)_setSpeechPlaybackControls:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 clientPort];
  id v6 = [v4 payload];
  double v7 = [v6 objectForKey:@"show"];
  uint64_t v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = (AXIPCClient *)[objc_alloc(MEMORY[0x263F228B8]) initWithPort:v5];
    currentSpeakerClient = self->_currentSpeakerClient;
    self->_currentSpeakerClient = v9;

    [(AXIPCClient *)self->_currentSpeakerClient connectWithError:0];
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = self->_currentSpeakerClient;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59___AXSpringBoardServerInstance__setSpeechPlaybackControls___block_invoke;
    v17[3] = &unk_2647F10C0;
    id v13 = WeakRetained;
    id v18 = v13;
    objc_copyWeak(&v20, &location);
    id v19 = self;
    [(AXIPCClient *)v12 setPortDeathHandler:v17];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = self->_currentSpeakerClient;
    self->_currentSpeakerClient = 0;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 serverInstance:self showSpeechPlaybackControls:v8];

  return 0;
}

- (id)_isSpeakThisTemporarilyDisabled:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSpeakThisTemporarilyDisabledWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4042 payload:v8];

  return v9;
}

- (id)_handleAcquireAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F226B0]];
  double v7 = [v4 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F226A8]];
  uint64_t v9 = [v4 clientPort];

  [(_AXSpringBoardServerInstance *)self acquireAssertionWithType:v6 identifier:v8 clientPort:v9];
  return 0;
}

- (id)_handleRelinquishAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F226B0]];
  double v7 = [v4 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F226A8]];
  uint64_t v9 = [v4 clientPort];

  [(_AXSpringBoardServerInstance *)self relinquishAssertionWithType:v6 identifier:v8 clientPort:v9];
  return 0;
}

- (id)_handleIsSystemAppShowingAnAlert:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSystemAppShowingAnAlertWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = (void *)[v6 initWithKey:4501 payload:v8];

  return v9;
}

- (id)_handleGetFocusedAppPID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 focusedAppPIDWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  v11[0] = v5;
  double v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithKey:4503 payload:v7];

  return v8;
}

- (id)_handleGetPurpleBuddyPID:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 purpleBuddyPIDWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  double v7 = [NSNumber numberWithInt:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = (void *)[v6 initWithKey:4507 payload:v8];

  return v9;
}

- (id)_handleGetRunningAppPIDs:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 runningAppPIDsWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  v11[0] = v5;
  double v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithKey:4504 payload:v7];

  return v8;
}

- (id)_handleGetFocusedApps:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 focusedAppsWithServerInstance:self];

  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
    id v7 = v12;
    if (v7)
    {
      uint64_t v8 = AXLogIPC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_AXSpringBoardServerInstance _handleGetFocusedApps:]();
      }
    }
    if (v6)
    {
      id v13 = @"result";
      v14[0] = v6;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v9 = 0;
LABEL_10:
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4509 payload:v9];

  return v10;
}

- (id)_handleDisplayIdentifierForSceneIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"sceneIdentifier"];

  id v6 = [(_AXSpringBoardServerInstance *)self delegate];
  id v7 = [v6 displayIdentifierForSceneIdentifier:v5 serverInstance:self];

  if (v7)
  {
    id v14 = 0;
    uint64_t v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
    id v9 = v14;
    if (v9)
    {
      uint64_t v10 = AXLogIPC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_AXSpringBoardServerInstance _handleGetFocusedApps:]();
      }
    }
    if (v8)
    {
      id v15 = @"result";
      v16[0] = v8;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v11 = 0;
LABEL_10:
  id v12 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4120 payload:v11];

  return v12;
}

- (id)_handleGetFocusedOccludedAppScenes:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 focusedOccludedAppScenesWithServerInstance:self];

  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
    id v7 = v12;
    if (v7)
    {
      uint64_t v8 = AXLogIPC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_AXSpringBoardServerInstance _handleGetFocusedApps:]();
      }
    }
    if (v6)
    {
      id v13 = @"result";
      v14[0] = v6;
      id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v9 = 0;
LABEL_10:
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4510 payload:v9];

  return v10;
}

- (id)_handleIsSystemAppFrontmost:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"excludeSiri"];
  uint64_t v6 = [v5 BOOLValue];

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v8 = [v7 isSystemAppFrontmostExcludingSiri:v6 withServerInstance:self];

  id v9 = objc_alloc(MEMORY[0x263F228C0]);
  id v14 = @"result";
  uint64_t v10 = [NSNumber numberWithBool:v8];
  v15[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v12 = (void *)[v9 initWithKey:4500 payload:v11];

  return v12;
}

- (id)_handleIsPurpleBuddyAppFrontmost:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isPurpleBuddyAppFrontmostWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  id v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4506 payload:v8];

  return v9;
}

- (id)_handleIsSettingsAppFrontmost:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 isSettingsAppFrontmostWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v11 = @"result";
  id v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4505 payload:v8];

  return v9;
}

- (id)_appNameFromPid:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"pid"];

  id v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_AXSpringBoardServerInstance _appNameFromPid:]();
  }

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  objc_msgSend(v7, "appNameFromPid:withServerInstance:", objc_msgSend(v5, "intValue"), self);
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v9 = &stru_26DB17D90;
  if (v8) {
    id v9 = v8;
  }
  uint64_t v10 = v9;

  id v11 = objc_alloc(MEMORY[0x263F228C0]);
  id v15 = @"result";
  v16[0] = v10;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v13 = (void *)[v11 initWithKey:4114 payload:v12];
  return v13;
}

- (id)_toggleLiveTranscription:(id)a3
{
  id v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleLiveTranscriptionWithServerInstance:self];

  return 0;
}

- (id)_handleNativeFocusedApplication:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 nativeFocusedApplication];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  id v6 = [NSNumber numberWithInt:v4];
  v11[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v5 initWithKey:4123 payload:v7];

  return v8;
}

- (void)_initializeLiveTranscriptionObserver
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)liveTranscriptionStateChanged, (CFStringRef)*MEMORY[0x263F8B2F0], 0, (CFNotificationSuspensionBehavior)0);
  if ([(_AXSpringBoardServerInstance *)self _inSetupMode])
  {
    self->_inSetupTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__handleLiveTranscriptionStatusChange selector:0 userInfo:1 repeats:2.0];
    MEMORY[0x270F9A758]();
  }
  else
  {
    [(_AXSpringBoardServerInstance *)self _handleLiveTranscriptionStatusChange];
  }
}

- (void)_handleLiveTranscriptionStatusChange
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_226EBC000, a2, OS_LOG_TYPE_ERROR, "Live Transcription error, coudn't execute launch request: %@", v4, 0xCu);
}

- (id)_handleBluetoothPowerEnabled:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___AXSpringBoardServerInstance__handleBluetoothPowerEnabled___block_invoke;
  block[3] = &unk_2647F06D8;
  id v14 = &v15;
  id v6 = v4;
  id v13 = v6;
  dispatch_async(v5, block);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = objc_alloc(MEMORY[0x263F228C0]);
  id v19 = @"result";
  uint64_t v8 = [NSNumber numberWithBool:*((unsigned __int8 *)v16 + 24)];
  v20[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v10 = (void *)[v7 initWithKey:4129 payload:v9];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)_handleSetBluetoothPowerEnabled:(id)a3
{
  id v3 = [a3 payload];
  dispatch_semaphore_t v4 = [v3 objectForKeyedSubscript:@"result"];
  int v5 = [v4 BOOLValue];

  id v6 = (void *)[objc_alloc(MEMORY[0x263EFEF18]) init];
  id v7 = v6;
  if (v5) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 4;
  }
  [v6 setPowerState:v8 completion:&__block_literal_global_1242];

  return 0;
}

- (id)_handleSetVoiceOverEnabled:(id)a3
{
  id v3 = [a3 payload];
  dispatch_semaphore_t v4 = [v3 objectForKeyedSubscript:@"result"];
  [v4 BOOLValue];
  _AXSVoiceOverTouchSetEnabled();

  return 0;
}

- (id)_handleVoiceOverEnabled:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v8 = @"result";
  dispatch_semaphore_t v4 = [NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchEnabled()];
  v9[0] = v4;
  int v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (void *)[v3 initWithKey:4127 payload:v5];

  return v6;
}

- (id)_handleSetZoomEnabled:(id)a3
{
  id v3 = [a3 payload];
  dispatch_semaphore_t v4 = [v3 objectForKeyedSubscript:@"result"];
  [v4 BOOLValue];
  _AXSZoomTouchSetEnabled();

  return 0;
}

- (id)_handleZoomEnabled:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v8 = @"result";
  dispatch_semaphore_t v4 = [NSNumber numberWithUnsignedChar:_AXSZoomTouchEnabled()];
  v9[0] = v4;
  int v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (void *)[v3 initWithKey:4125 payload:v5];

  return v6;
}

- (id)_handleFreezeClarityUILoadingScreen:(id)a3
{
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 freezeClarityUILoadingScreenWithServerInstance:self];

  return 0;
}

- (id)_handlePresentNearbyDeviceControlPicker:(id)a3
{
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 presentNearbyDeviceControlPickerWithServerInstance:self];

  return 0;
}

- (id)_allowedMedusaGestures:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  int v5 = [v4 allowedMedusaGesturesWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  v11[0] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithKey:4063 payload:v7];

  return v8;
}

- (id)_toggleBackgroundSounds:(id)a3
{
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleBackgroundSoundsWithServerInstance:self];

  return 0;
}

- (id)_performMedusaGesture:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v4 = [a3 payload];
  int v5 = [v4 objectForKeyedSubscript:@"gesture"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v8 = [v7 serverInstance:self performMedusaGesture:v6];

  id v9 = objc_alloc(MEMORY[0x263F228C0]);
  id v14 = @"result";
  uint64_t v10 = [NSNumber numberWithBool:v8];
  v15[0] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v12 = (void *)[v9 initWithKey:4064 payload:v11];

  return v12;
}

- (id)_medusaApps:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  int v5 = [v4 medusaAppsWithServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  v11[0] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v6 initWithKey:4064 payload:v7];

  return v8;
}

- (id)_setDockIconActivationMode:(id)a3
{
  dispatch_semaphore_t v4 = [a3 payload];
  int v5 = [v4 objectForKeyedSubscript:@"mode"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [(_AXSpringBoardServerInstance *)self delegate];
  [v7 serverInstance:self setDockIconActivationMode:v6];

  return 0;
}

- (id)_canSetDockIconActivationMode:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v5 = [v4 canSetDockIconActivationModeForServerInstance:self];

  id v6 = objc_alloc(MEMORY[0x263F228C0]);
  id v11 = @"result";
  id v7 = [NSNumber numberWithBool:v5];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = (void *)[v6 initWithKey:4092 payload:v8];

  return v9;
}

- (id)_activateSOSMode:(id)a3
{
  dispatch_semaphore_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 activateSOSModeWithServerInstance:self];

  return 0;
}

- (id)_connectedDevicesRequireAssistiveTouch:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 connectedDevicesRequireAssistiveTouch];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  id v6 = [NSNumber numberWithBool:v4];
  v11[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v5 initWithKey:4101 payload:v7];

  return v8;
}

- (id)_connectedDevicesHaveAssistiveTouchCustomActions:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(_AXSpringBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 currentDevicesHaveAssistiveTouchCustomActions];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v10 = @"result";
  id v6 = [NSNumber numberWithBool:v4];
  v11[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v5 initWithKey:4109 payload:v7];

  return v8;
}

- (id)_cancelSiriDismissalForAssistiveTouch:(id)a3
{
  uint64_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 cancelSiriDismissalForAssistiveTouchWithServerInstance:self];

  return 0;
}

- (id)_toggleTorch:(id)a3
{
  uint64_t v4 = [(_AXSpringBoardServerInstance *)self delegate];
  [v4 toggleTorchWithServerInstance:self];

  return 0;
}

- (id)_getSplashImageForApp:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"bundleIdentifier"];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(_AXSpringBoardServerInstance *)self delegate];
    id v7 = [v6 serverInstance:self splashImageForAppWithBundleIdentifier:v5];

    if (v7)
    {
      uint64_t v8 = UIImagePNGRepresentation(v7);
      id v12 = @"splashData";
      v13[0] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:4089 payload:v9];

  return v10;
}

- (AXSpringBoardServerInstanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSpringBoardServerInstanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_AXAssertionServer)assertionServer
{
  return self->_assertionServer;
}

- (void)setAssertionServer:(id)a3
{
}

- (BOOL)disableNotificationCenterAssertionHeld
{
  return self->_disableNotificationCenterAssertionHeld;
}

- (void)setDisableNotificationCenterAssertionHeld:(BOOL)a3
{
  self->_disableNotificationCenterAssertionHeld = a3;
}

- (BOOL)disableControlCenterAssertionHeld
{
  return self->_disableControlCenterAssertionHeld;
}

- (void)setDisableControlCenterAssertionHeld:(BOOL)a3
{
  self->_disableControlCenterAssertionHeld = a3;
}

- (NSMutableDictionary)watchActiveWristState
{
  return self->_watchActiveWristState;
}

- (void)setWatchActiveWristState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchActiveWristState, 0);
  objc_storeStrong((id *)&self->_actionHandlerHelper, 0);
  objc_storeStrong((id *)&self->_assertionServer, 0);
  objc_storeStrong((id *)&self->_inSetupTimer, 0);
  objc_storeStrong((id *)&self->_callAudioRampTimer, 0);
  objc_storeStrong((id *)&self->_avSystemRetrievalQueue, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_currentSpeakerClient, 0);
  objc_storeStrong((id *)&self->_assertionClients, 0);
  objc_storeStrong((id *)&self->_reachabilityHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)acquireAssertionWithType:identifier:clientPort:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_226EBC000, v0, OS_LOG_TYPE_FAULT, "Should have a list of assertion pairs here, not nil!", v1, 2u);
}

- (void)_isMediaPlaying:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleGetFocusedApps:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226EBC000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
}

- (void)_appNameFromPid:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_226EBC000, v0, OS_LOG_TYPE_DEBUG, "pid: %@", v1, 0xCu);
}

@end