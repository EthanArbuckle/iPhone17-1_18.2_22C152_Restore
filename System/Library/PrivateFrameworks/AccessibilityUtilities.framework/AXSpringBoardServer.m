@interface AXSpringBoardServer
+ (BOOL)isAvailable;
+ (id)server;
- (AXAccessQueue)accessQueue;
- (AXSpringBoardServer)init;
- (BOOL)_isSystemAppFrontmostExcludingSiri:(BOOL)a3;
- (BOOL)_shouldDispatchLocally;
- (BOOL)_shouldValidateEntitlements;
- (BOOL)areSystemGesturesDisabledByAccessibility;
- (BOOL)areSystemGesturesDisabledNatively;
- (BOOL)bluetoothPowerEnabled;
- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3;
- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3;
- (BOOL)canSetDockIconActivationMode;
- (BOOL)connectedDevicesRequireAssistiveTouch;
- (BOOL)currentDevicesHaveAssistiveTouchCustomActions;
- (BOOL)dismissBuddyIfNecessary;
- (BOOL)dismissSiri;
- (BOOL)hasActiveCall;
- (BOOL)hasActiveEndpointCall;
- (BOOL)hasActiveOrPendingCall;
- (BOOL)hasActiveOrPendingCallOrFaceTime;
- (BOOL)isAppSwitcherVisible;
- (BOOL)isAppleWatchRemoteScreenActive;
- (BOOL)isBannerVisible;
- (BOOL)isContinuitySessionActive;
- (BOOL)isControlCenterVisible;
- (BOOL)isDarkModeActive;
- (BOOL)isDockVisible;
- (BOOL)isGuidedAccessActive;
- (BOOL)isInspectorMinimized;
- (BOOL)isLockScreenVisible;
- (BOOL)isMagnifierVisible;
- (BOOL)isMakingEmergencyCall;
- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3;
- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3 includingNonDismissableElements:(BOOL)a4;
- (BOOL)isNotificationCenterVisible;
- (BOOL)isNotificationVisible;
- (BOOL)isNowPlayingUIVisible;
- (BOOL)isOrientationLocked;
- (BOOL)isPIPWindowVisible;
- (BOOL)isPasscodeLockVisible;
- (BOOL)isPointInsideAccessibilityInspector:(id)a3;
- (BOOL)isPurpleBuddyAppFrontmost;
- (BOOL)isReceivingAirPlay;
- (BOOL)isRemoteAlertVisible;
- (BOOL)isRingerMuted;
- (BOOL)isScreenLockedWithPasscode:(BOOL *)a3;
- (BOOL)isScreenSaverVisible;
- (BOOL)isScreenshotWindowVisible;
- (BOOL)isSettingsAppFrontmost;
- (BOOL)isShelfSwitcherVisible;
- (BOOL)isShowingAXAlert;
- (BOOL)isShowingHomescreen;
- (BOOL)isShowingLongLookNotification;
- (BOOL)isShowingNonSystemApp;
- (BOOL)isShowingRemoteView:(int64_t)a3;
- (BOOL)isSideSwitchUsedForOrientation;
- (BOOL)isSiriTalkingOrListening;
- (BOOL)isSiriVisible;
- (BOOL)isSoftwareUpdateUIVisible;
- (BOOL)isSpeakThisTemporarilyDisabled;
- (BOOL)isSpotlightVisible;
- (BOOL)isStageManagerSwitcherVisible;
- (BOOL)isStatusBarNativeFocusable;
- (BOOL)isStatusBarNativeFocusableIncludingNonDismissableElements:(BOOL)a3;
- (BOOL)isSyncingRestoringResettingOrUpdating;
- (BOOL)isSystemAppFrontmost;
- (BOOL)isSystemAppFrontmostExludingSiri;
- (BOOL)isSystemAppShowingAnAlert;
- (BOOL)isSystemSleeping;
- (BOOL)isTypeToSiriVisible;
- (BOOL)isVoiceControlRunning;
- (BOOL)loadGAXBundleForUnmanagedASAM;
- (BOOL)performMedusaGesture:(unint64_t)a3;
- (BOOL)shouldFocusNonExclusiveSystemUI;
- (BOOL)showControlCenter:(BOOL)a3;
- (BOOL)showNotificationCenter:(BOOL)a3;
- (BOOL)toggleDarkMode;
- (BOOL)toggleIncomingCall;
- (BOOL)voiceOverEnabled;
- (BOOL)zoomEnabled;
- (NSMutableArray)actionHandlers;
- (NSMutableDictionary)mediaPlayingHandlers;
- (NSMutableDictionary)reachabilityHandlers;
- (double)reachabilityOffset;
- (double)volumeLevel;
- (id)_axSpringBoardServerInstance;
- (id)_axSpringBoardServerInstanceDelegate;
- (id)_axSpringBoardServerInstanceIfExists;
- (id)_handleMediaPlayingResult:(id)a3;
- (id)_handleReachabilityResult:(id)a3;
- (id)_handleReplyResult:(id)a3;
- (id)_payloadForRemoteViewType:(int64_t)a3 data:(id)a4;
- (id)_serviceName;
- (id)allowedMedusaGestures;
- (id)appNameFromPid:(int)a3;
- (id)applicationWithIdentifier:(id)a3;
- (id)currentAlertHandler;
- (id)displayIdentifierForSceneIdentifier:(id)a3;
- (id)focusedAppPID;
- (id)focusedAppProcess;
- (id)focusedApps;
- (id)focusedOccludedAppScenes;
- (id)installedApps;
- (id)internalApps;
- (id)jindoAppBundleIndentifiers;
- (id)medusaApps;
- (id)runningAppPIDs;
- (id)runningAppProcesses;
- (id)splashImageForAppWithBundleIdentifier:(id)a3;
- (id)visibleTripleClickItems;
- (int)_actionResultKey;
- (int)nativeFocusedApplication;
- (int)pid;
- (int)purpleBuddyPID;
- (int)topEventPidOverride;
- (int64_t)activeApplicationOrientation;
- (int64_t)activeInterfaceOrientation;
- (void)_didConnectToClient;
- (void)_didConnectToServer;
- (void)_isSystemAppFrontmostExcludingSiri:(BOOL)a3 completion:(id)a4;
- (void)_sendRemoteViewIPCMessage:(int)a3 withRemoteViewType:(int64_t)a4 withData:(id)a5;
- (void)_wasDisconnectedFromClient;
- (void)_willClearServer;
- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4;
- (void)activateSOSMode;
- (void)activeInterfaceOrientation:(id)a3;
- (void)armApplePay;
- (void)cancelReachabilityDetection;
- (void)cancelSiriDismissalForAssistiveTouch;
- (void)cleanupAlertHandler;
- (void)copyStringToPasteboard:(id)a3;
- (void)didPotentiallyDismissNonExclusiveSystemUI;
- (void)dismissAppSwitcher;
- (void)dismissShelfSwitcher;
- (void)freezeClarityUILoadingScreenWithCompletion:(id)a3;
- (void)hideAlert;
- (void)hideNotificationCenter;
- (void)hideRemoteView:(int64_t)a3;
- (void)isMagnifierVisibleWithCompletion:(id)a3;
- (void)isMediaPlayingForApp:(id)a3 completionHandler:(id)a4;
- (void)isSystemAppFrontmost:(id)a3;
- (void)isSystemSleeping:(id)a3;
- (void)launchApplication:(id)a3;
- (void)launchFloatingApplication:(id)a3;
- (void)launchMagnifierApp;
- (void)launchOnboardingViewService:(id)a3;
- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4;
- (void)launchVoiceOverImageExplorerViewServiceForResult:(id)a3 withData:(id)a4;
- (void)launchVoiceOverQuickSettingsViewService:(id)a3;
- (void)openAppSwitcher;
- (void)openAssistiveTouchCustomGestureCreation;
- (void)openCommandAndControlCommands;
- (void)openCommandAndControlSettings;
- (void)openCommandAndControlVocabulary;
- (void)openSCATCustomGestureCreation;
- (void)openTypeToSiri;
- (void)openVoiceControl;
- (void)pauseMedia;
- (void)pauseMediaForApp:(id)a3;
- (void)pid:(id)a3;
- (void)presentNearbyDeviceControlPicker;
- (void)purpleBuddyPID:(id)a3;
- (void)reactivateInCallService;
- (void)rebootDevice;
- (void)registerReachabilityHandler:(id)a3 withIdentifierCallback:(id)a4;
- (void)registerSpringBoardActionHandler:(id)a3 withIdentifierCallback:(id)a4;
- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4;
- (void)removeActionHandler:(id)a3;
- (void)removeReachabilityHandler:(id)a3;
- (void)requestDismissJindo;
- (void)resetDimTimer;
- (void)resumeMedia;
- (void)resumeMediaForApp:(id)a3;
- (void)revealSpotlight;
- (void)screenLockStatus:(id)a3 passcodeStatusRequired:(BOOL)a4;
- (void)setAccessQueue:(id)a3;
- (void)setActionHandlers:(id)a3;
- (void)setBluetoothPowerEnabled:(BOOL)a3;
- (void)setCancelGestureActivation:(unint64_t)a3 cancelEnabled:(BOOL)a4;
- (void)setCaptionPanelContextId:(unsigned int)a3;
- (void)setCurrentAlertHandler:(id)a3;
- (void)setDockIconActivationMode:(unint64_t)a3;
- (void)setHearingAidControlVisible:(BOOL)a3;
- (void)setMediaPlayingHandlers:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientationLocked:(BOOL)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setReachabilityEnabled:(BOOL)a3;
- (void)setReachabilityHandlers:(id)a3;
- (void)setShouldFocusNonExclusiveSystemUI:(BOOL)a3;
- (void)setShowSpeechPlaybackControls:(BOOL)a3;
- (void)setVoiceOverEnabled:(BOOL)a3;
- (void)setZoomEnabled:(BOOL)a3;
- (void)showAlert:(int)a3 withHandler:(id)a4;
- (void)showAlert:(int)a3 withHandler:(id)a4 withData:(id)a5;
- (void)showNotificationCenter;
- (void)showRemoteView:(int64_t)a3 withData:(id)a4;
- (void)simulateEdgePressHaptics;
- (void)startHearingAidServer;
- (void)systemAppInfoWithQuery:(unint64_t)a3 completion:(id)a4;
- (void)takeScreenshot;
- (void)toggleAppLibrary;
- (void)toggleBackgroundSounds;
- (void)toggleConversationBoost;
- (void)toggleDetectionMode;
- (void)toggleDock;
- (void)toggleLiveTranscription;
- (void)toggleNotificationCenter;
- (void)toggleQuickNote;
- (void)toggleReachability;
- (void)toggleSpotlight;
- (void)toggleTorch;
- (void)unlockDevice;
- (void)wakeUpDeviceIfNecessary;
@end

@implementation AXSpringBoardServer

- (NSMutableArray)actionHandlers
{
  return self->_actionHandlers;
}

- (void)didPotentiallyDismissNonExclusiveSystemUI
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D308000, v0, v1, "Attempted to call -didPotentiallyDismissNonExclusiveSystemUI outside of SpringBoard", v2, v3, v4, v5, v6);
}

- (BOOL)_shouldDispatchLocally
{
  if (_shouldDispatchLocally_onceToken != -1) {
    dispatch_once(&_shouldDispatchLocally_onceToken, &__block_literal_global_902);
  }
  return _shouldDispatchLocally_result;
}

- (BOOL)shouldFocusNonExclusiveSystemUI
{
  return self->_shouldFocusNonExclusiveSystemUI;
}

+ (BOOL)isAvailable
{
  if (AXProcessIsSpringBoard() & 1) == 0 && (AXInPreboardScenario() || (AXInCheckerBoardScenario()) {
    || _AXSMossdeepEnabled()
  }
    || _AXSIsNonUIBuild())
  {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4F59088] sharedSystemShellSwitcher];
  char v3 = [v2 isClarityBoardEnabled];

  return v3 ^ 1;
}

+ (id)server
{
  char v3 = [MEMORY[0x1E4F59088] sharedSystemShellSwitcher];
  int v4 = [v3 isClarityBoardEnabled];

  if (v4 && server_onceToken_0 != -1) {
    dispatch_once(&server_onceToken_0, &__block_literal_global_5);
  }
  if ([a1 isAvailable])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__AXSpringBoardServer_server__block_invoke_419;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (server_onceToken_418 != -1) {
      dispatch_once(&server_onceToken_418, block);
    }
    id v5 = (id)server_Server_0;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __29__AXSpringBoardServer_server__block_invoke()
{
  v0 = CLFLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __29__AXSpringBoardServer_server__block_invoke_cold_1();
  }
}

uint64_t __29__AXSpringBoardServer_server__block_invoke_419(uint64_t a1)
{
  server_Server_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (AXSpringBoardServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXSpringBoardServer;
  uint64_t v2 = [(AXServer *)&v7 init];
  char v3 = v2;
  if (v2)
  {
    [(AXServer *)v2 setShouldRegisterClientCallbackSourceOnMainRunloop:1];
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F482E0]) initWithParentClass:objc_opt_class() description:@"SpringBoardServerAccessQueue" appendUUIDToLabel:0];
    [(AXSpringBoardServer *)v3 setAccessQueue:v4];
    id v5 = objc_opt_new();
    [(AXSpringBoardServer *)v3 setActionHandlers:v5];
  }
  return v3;
}

- (id)_serviceName
{
  return @"com.apple.accessibility.AXSpringBoardServer";
}

- (id)_handleReplyResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  uint8_t v6 = [v5 objectForKey:@"result"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 integerValue];
    *(void *)buf = 0;
    v16 = buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    id v20 = 0;
    v8 = [(AXSpringBoardServer *)self accessQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__AXSpringBoardServer__handleReplyResult___block_invoke;
    v14[3] = &unk_1E5586520;
    v14[4] = self;
    v14[5] = buf;
    [v8 performSynchronousWritingBlock:v14];

    uint64_t v9 = *((void *)v16 + 5);
    if (v9)
    {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
    }
    else
    {
      v11 = AXLogSpringboardServer();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "No handler exists to handle alert reply", v13, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v10 = AXLogSpringboardServer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v10, OS_LOG_TYPE_DEFAULT, "alert reply result was not a number", buf, 2u);
    }
  }
  return 0;
}

uint64_t __42__AXSpringBoardServer__handleReplyResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentAlertHandler];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint8_t v6 = *(void **)(a1 + 32);

  return [v6 setCurrentAlertHandler:0];
}

- (id)_handleMediaPlayingResult:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  uint64_t v4 = [v17 payload];
  id v5 = AXLogSpringboardServer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Received is playing result: %@", buf, 0xCu);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(AXSpringBoardServer *)self mediaPlayingHandlers];
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v11 = [(AXSpringBoardServer *)self mediaPlayingHandlers];
        v12 = [v11 objectForKeyedSubscript:v10];

        buf[0] = 0;
        objc_opt_class();
        v13 = [v4 objectForKeyedSubscript:@"result"];
        v14 = __UIAccessibilityCastAsClass();

        if (buf[0]) {
          abort();
        }
        v12[2](v12, [v14 BOOLValue]);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  v15 = [(AXSpringBoardServer *)self mediaPlayingHandlers];
  [v15 removeAllObjects];

  return 0;
}

- (id)_handleReachabilityResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 payload];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AXSpringBoardServer *)self reachabilityHandlers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        v11 = [(AXSpringBoardServer *)self reachabilityHandlers];
        v12 = [v11 objectForKeyedSubscript:v10];

        ((void (**)(void, void *))v12)[2](v12, v4);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return 0;
}

- (BOOL)_shouldValidateEntitlements
{
  return 0;
}

- (void)_didConnectToServer
{
  v5.receiver = self;
  v5.super_class = (Class)AXSpringBoardServer;
  [(AXServer *)&v5 _didConnectToServer];
  uint64_t v3 = [(AXServer *)self server];
  [v3 setHandlerWithTarget:self selector:sel__handleReplyResult_ forKey:5000];
  [v3 setHandlerWithTarget:self selector:sel__handleReachabilityResult_ forKey:5003];
  [v3 setHandlerWithTarget:self selector:sel__handleMediaPlayingResult_ forKey:5004];
  if ([(AXSpringBoardServer *)self _shouldValidateEntitlements])
  {
    LOBYTE(v4) = 1;
    _AXLogWithFacility();
    objc_msgSend(v3, "addPossibleRequiredEntitlement:forMessageWithKey:", @"com.apple.accessibility.SpringBoard", 5000, v4, @"Validating SB reply messages");
    [v3 addPossibleRequiredEntitlement:@"com.apple.accessibility.SpringBoard" forMessageWithKey:5002];
    [v3 addPossibleRequiredEntitlement:@"com.apple.accessibility.SpringBoard" forMessageWithKey:5003];
    [v3 addPossibleRequiredEntitlement:@"com.apple.accessibility.SpringBoard" forMessageWithKey:5004];
  }
}

- (void)_willClearServer
{
  v4.receiver = self;
  v4.super_class = (Class)AXSpringBoardServer;
  [(AXServer *)&v4 _willClearServer];
  uint64_t v3 = [(AXServer *)self server];
  [v3 removeAllHandlersForTarget:self];
}

- (void)_wasDisconnectedFromClient
{
  v7.receiver = self;
  v7.super_class = (Class)AXSpringBoardServer;
  [(AXServer *)&v7 _wasDisconnectedFromClient];
  LOBYTE(v5) = 1;
  _AXLogWithFacility();
  SpringBoardPid = -1;
  uint64_t v3 = [(AXSpringBoardServer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AXSpringBoardServer__wasDisconnectedFromClient__block_invoke;
  v6[3] = &unk_1E5585F48;
  v6[4] = self;
  [v3 performSynchronousWritingBlock:v6];

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"AXSystemAppServerDiedNotification" object:0];
}

uint64_t __49__AXSpringBoardServer__wasDisconnectedFromClient__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAlertHandler:0];
}

- (void)_didConnectToClient
{
  v2.receiver = self;
  v2.super_class = (Class)AXSpringBoardServer;
  [(AXServer *)&v2 _didConnectToClient];
  SpringBoardPid = -1;
}

- (void)takeScreenshot
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4009 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)openAssistiveTouchCustomGestureCreation
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4021 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)openSCATCustomGestureCreation
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4022 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)openCommandAndControlSettings
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4097 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)openCommandAndControlCommands
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4087 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)openCommandAndControlVocabulary
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4088 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)setCaptionPanelContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  uint64_t v10 = @"contextId";
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(AXIPCMessage *)v5 initWithKey:4096 payload:v7];

  uint64_t v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)setHearingAidControlVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  uint64_t v10 = @"visible";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(AXIPCMessage *)v5 initWithKey:4023 payload:v7];

  uint64_t v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)startHearingAidServer
{
  [(AXServer *)self _connectIfNecessary];
  objc_super v4 = [[AXIPCMessage alloc] initWithKey:4035 payload:0];
  BOOL v3 = [(AXServer *)self client];
  [v3 sendSimpleMessage:v4];
}

- (int)topEventPidOverride
{
  [(AXServer *)self _connectIfNecessary];
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4006 payload:0];
  objc_super v4 = [(AXServer *)self client];
  uint64_t v5 = [v4 sendMessage:v3 withError:0];

  uint64_t v6 = [v5 payload];
  objc_super v7 = [v6 objectForKey:@"pid"];
  int v8 = [v7 intValue];

  return v8;
}

- (BOOL)isOrientationLocked
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4018 payload:0];
  LOBYTE(self) = [(AXServer *)self sendSimpleMessageWithResult:v3];

  return (char)self;
}

- (void)setOrientation:(int64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v7 = @"orientation";
  objc_super v4 = [NSNumber numberWithLong:a3];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  uint64_t v6 = [[AXIPCMessage alloc] initWithKey:4107 payload:v5];
  [(AXServer *)self sendSimpleMessage:v6];
}

- (void)setOrientationLocked:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v7 = @"locked";
  objc_super v4 = [NSNumber numberWithBool:a3];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  uint64_t v6 = [[AXIPCMessage alloc] initWithKey:4059 payload:v5];
  [(AXServer *)self sendSimpleMessage:v6];
}

- (void)resetDimTimer
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4026 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (BOOL)isSideSwitchUsedForOrientation
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4019 payload:0];
  LOBYTE(self) = [(AXServer *)self sendSimpleMessageWithResult:v3];

  return (char)self;
}

- (BOOL)isRingerMuted
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4020 payload:0];
  LOBYTE(self) = [(AXServer *)self sendSimpleMessageWithResult:v3];

  return (char)self;
}

- (double)reachabilityOffset
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4055 payload:0];
  objc_super v4 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)volumeLevel
{
  [(AXServer *)self _connectIfNecessary];
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4017 payload:0];
  objc_super v4 = [(AXServer *)self client];
  double v5 = [v4 sendMessage:v3 withError:0];

  double v6 = [v5 payload];
  objc_super v7 = [v6 objectForKey:@"result"];
  [v7 floatValue];
  double v9 = v8;

  return v9;
}

- (void)cleanupAlertHandler
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  BOOL v3 = [(AXSpringBoardServer *)self accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AXSpringBoardServer_cleanupAlertHandler__block_invoke;
  v5[3] = &unk_1E5586520;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performSynchronousWritingBlock:v5];

  uint64_t v4 = v7[5];
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 0x7FFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __42__AXSpringBoardServer_cleanupAlertHandler__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) currentAlertHandler];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 setCurrentAlertHandler:0];
}

- (void)hideAlert
{
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:4003 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];

  AXPerformBlockOnMainThreadAfterDelay();
}

void __32__AXSpringBoardServer_hideAlert__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objc_super v2 = [*(id *)(a1 + 32) accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AXSpringBoardServer_hideAlert__block_invoke_2;
  v5[3] = &unk_1E5586520;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = &v6;
  [v2 performSynchronousReadingBlock:v5];

  if (*((unsigned char *)v7 + 24))
  {
    uint64_t v3 = AXLogSpringboardServer();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "didn't get a call back from asking to hide the alert", v4, 2u);
    }

    [*(id *)(a1 + 32) cleanupAlertHandler];
  }
  _Block_object_dispose(&v6, 8);
}

void __32__AXSpringBoardServer_hideAlert__block_invoke_2(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) currentAlertHandler];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)isShowingAXAlert
{
  objc_super v2 = self;
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(AXSpringBoardServer *)self accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AXSpringBoardServer_isShowingAXAlert__block_invoke;
  v5[3] = &unk_1E5586520;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performSynchronousReadingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__AXSpringBoardServer_isShowingAXAlert__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) currentAlertHandler];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)showAlert:(int)a3 withHandler:(id)a4
{
}

- (void)showAlert:(int)a3 withHandler:(id)a4 withData:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if ([(AXSpringBoardServer *)self isShowingAXAlert])
  {
    uint64_t v10 = AXLogSpringboardServer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v10, OS_LOG_TYPE_DEFAULT, "Another alert is showing already!", buf, 2u);
    }
  }
  else
  {
    if ([(AXServer *)self _connectIfNecessary])
    {
      [(AXServer *)self _connectServerIfNecessary];
      id v11 = [(AXSpringBoardServer *)self accessQueue];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      long long v20 = __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke_2;
      long long v21 = &unk_1E5586570;
      long long v22 = self;
      id v23 = v8;
      [v11 performSynchronousWritingBlock:&v18];

      v12 = (void *)MEMORY[0x1E4F1CA60];
      v13 = objc_msgSend(NSNumber, "numberWithInt:", v6, v18, v19, v20, v21, v22);
      long long v14 = [v12 dictionaryWithObject:v13 forKey:@"alertType"];

      if (v9) {
        [v14 setObject:v9 forKey:@"data"];
      }
      long long v15 = [[AXIPCMessage alloc] initWithKey:4002 payload:v14];
      long long v16 = [(AXServer *)self client];
      [v16 sendSimpleMessage:v15];

      long long v17 = v23;
    }
    else
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke;
      v27 = &unk_1E5586548;
      v28 = self;
      int v31 = v6;
      id v30 = v8;
      id v29 = v9;
      AXPerformBlockOnMainThreadAfterDelay();

      long long v17 = v30;
    }
  }
}

uint64_t __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAlert:*(unsigned int *)(a1 + 56) withHandler:*(void *)(a1 + 48) withData:*(void *)(a1 + 40)];
}

uint64_t __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAlertHandler:*(void *)(a1 + 40)];
}

- (void)showRemoteView:(int64_t)a3 withData:(id)a4
{
}

- (void)hideRemoteView:(int64_t)a3
{
}

- (BOOL)isShowingRemoteView:(int64_t)a3
{
  double v5 = [AXIPCMessage alloc];
  uint64_t v6 = [(AXSpringBoardServer *)self _payloadForRemoteViewType:a3 data:0];
  objc_super v7 = [(AXIPCMessage *)v5 initWithKey:4095 payload:v6];
  LOBYTE(self) = [(AXServer *)self sendSimpleMessageWithResult:v7];

  return (char)self;
}

- (id)_payloadForRemoteViewType:(int64_t)a3 data:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  objc_super v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v6 dictionaryWithObject:v7 forKey:@"remoteViewType"];

  if (v5) {
    [v8 setObject:v5 forKey:@"data"];
  }

  return v8;
}

- (void)_sendRemoteViewIPCMessage:(int)a3 withRemoteViewType:(int64_t)a4 withData:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  if ([(AXServer *)self _connectIfNecessary])
  {
    [(AXServer *)self _connectServerIfNecessary];
    id v9 = [AXIPCMessage alloc];
    uint64_t v10 = [(AXSpringBoardServer *)self _payloadForRemoteViewType:a4 data:v8];
    id v11 = [(AXIPCMessage *)v9 initWithKey:v6 payload:v10];

    v12 = [(AXServer *)self client];
    [v12 sendSimpleMessage:v11];
  }
  else
  {
    id v13 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __77__AXSpringBoardServer__sendRemoteViewIPCMessage_withRemoteViewType_withData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRemoteViewIPCMessage:*(unsigned int *)(a1 + 56) withRemoteViewType:*(void *)(a1 + 48) withData:*(void *)(a1 + 40)];
}

- (void)setShowSpeechPlaybackControls:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v8 = @"show";
  uint64_t v4 = [NSNumber numberWithBool:a3];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  uint64_t v6 = [[AXIPCMessage alloc] initWithKey:4040 payload:v5];
  objc_super v7 = [(AXServer *)self client];
  [v7 sendSimpleMessage:v6];
}

- (int)_actionResultKey
{
  return 5002;
}

- (void)removeActionHandler:(id)a3
{
}

- (void)registerSpringBoardActionHandler:(id)a3 withIdentifierCallback:(id)a4
{
}

- (void)setCancelGestureActivation:(unint64_t)a3 cancelEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(AXServer *)self _connectIfNecessary])
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = [NSNumber numberWithUnsignedInteger:a3];
    id v9 = [NSNumber numberWithBool:v4];
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"type", v9, @"cancelEnabled", 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = [[AXIPCMessage alloc] initWithKey:4008 payload:v12];
    id v11 = [(AXServer *)self client];
    [v11 sendSimpleMessage:v10];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __64__AXSpringBoardServer_setCancelGestureActivation_cancelEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCancelGestureActivation:*(void *)(a1 + 40) cancelEnabled:*(unsigned __int8 *)(a1 + 48)];
}

- (void)cancelReachabilityDetection
{
  [(AXServer *)self _connectIfNecessary];
  BOOL v4 = [[AXIPCMessage alloc] initWithKey:4058 payload:&unk_1EDC63330];
  uint64_t v3 = [(AXServer *)self client];
  [v3 sendSimpleMessage:v4];
}

- (void)registerReachabilityHandler:(id)a3 withIdentifierCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AXServer *)self _connectIfNecessary])
  {
    [(AXServer *)self _connectServerIfNecessary];
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = [v8 UUIDString];

    uint64_t v10 = [(AXSpringBoardServer *)self reachabilityHandlers];

    if (!v10)
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(AXSpringBoardServer *)self setReachabilityHandlers:v11];
    }
    id v12 = [[AXIPCMessage alloc] initWithKey:4056 payload:&unk_1EDC63358];
    id v13 = [(AXServer *)self client];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke_2;
    v17[3] = &unk_1E5586610;
    v17[4] = self;
    id v18 = v9;
    id v19 = v6;
    id v20 = v7;
    id v14 = v7;
    id v15 = v6;
    id v16 = v9;
    [v13 sendAsyncMessage:v12 withReplyHandler:v17];
  }
  else
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke;
    uint64_t v24 = &unk_1E55865E8;
    uint64_t v25 = self;
    id v26 = v6;
    id v27 = v7;
    id v16 = v7;
    id v12 = (AXIPCMessage *)v6;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerReachabilityHandler:*(void *)(a1 + 40) withIdentifierCallback:*(void *)(a1 + 48)];
}

void __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  BOOL v4 = [v3 objectForKey:@"result"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v8 = (id)[*(id *)(a1 + 48) copy];
    id v6 = _Block_copy(v8);
    id v7 = [*(id *)(a1 + 32) reachabilityHandlers];
    [v7 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerReachabilityHandler:*(void *)(a1 + 40) withIdentifierCallback:*(void *)(a1 + 48)];
}

- (BOOL)toggleIncomingCall
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [AXIPCMessage alloc];
  BOOL v4 = [(AXIPCMessage *)v3 initWithKey:4061 payload:MEMORY[0x1E4F1CC08]];
  int v5 = [(AXServer *)self client];
  id v6 = [v5 sendMessage:v4 withError:0];

  id v7 = [v6 payload];
  id v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (void)toggleReachability
{
  [(AXSpringBoardServer *)self reachabilityOffset];

  [(AXSpringBoardServer *)self setReachabilityActive:v3 == 0.0];
}

- (void)setReachabilityActive:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  int v5 = [AXIPCMessage alloc];
  id v10 = @"active";
  id v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(AXIPCMessage *)v5 initWithKey:4060 payload:v7];

  char v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)setReachabilityEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v11 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    int v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v11 serverInstance:v5 setReachabilityEnabled:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v6 = [AXIPCMessage alloc];
    id v12 = @"enabled";
    id v7 = [NSNumber numberWithBool:v3];
    v13[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v9 = [(AXIPCMessage *)v6 initWithKey:4083 payload:v8];

    id v10 = [(AXServer *)self client];
    [v10 sendSimpleMessage:v9];
  }
}

- (void)removeReachabilityHandler:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    [(AXServer *)self _connectIfNecessary];
    BOOL v4 = [(AXSpringBoardServer *)self reachabilityHandlers];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [(AXSpringBoardServer *)self reachabilityHandlers];
      [v6 removeObjectForKey:v11];

      id v7 = [(AXSpringBoardServer *)self reachabilityHandlers];
      uint64_t v8 = [v7 count];

      if (!v8)
      {
        char v9 = [[AXIPCMessage alloc] initWithKey:4056 payload:&unk_1EDC63380];
        id v10 = [(AXServer *)self client];
        [v10 sendSimpleMessage:v9];
      }
    }
  }
  else
  {
    _AXAssert();
  }
}

- (BOOL)isInspectorMinimized
{
  BOOL v3 = [(AXServer *)self _connectIfNecessary];
  if (v3)
  {
    BOOL v4 = [[AXIPCMessage alloc] initWithKey:4052 payload:0];
    BOOL v5 = [(AXServer *)self sendSimpleMessageWithResult:v4];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isPointInsideAccessibilityInspector:(id)a3
{
  return 0;
}

- (int)pid
{
  if (![(AXServer *)self _connectIfNecessary]) {
    return -1;
  }
  int result = SpringBoardPid;
  if (SpringBoardPid == -1)
  {
    BOOL v4 = [[AXIPCMessage alloc] initWithKey:4001 payload:0];
    BOOL v5 = [(AXServer *)self client];
    id v6 = [v5 sendMessage:v4 withError:0];

    if (v6)
    {
      id v7 = [v6 payload];
      uint64_t v8 = [v7 objectForKey:@"pid"];
      SpringBoardPid = [v8 intValue];

      if (!SpringBoardPid) {
        SpringBoardPid = -1;
      }
    }

    return SpringBoardPid;
  }
  return result;
}

- (void)pid:(id)a3
{
  id v4 = a3;
  if ([(AXServer *)self _connectIfNecessary])
  {
    int v5 = SpringBoardPid;
    if (SpringBoardPid == -1)
    {
      id v6 = [[AXIPCMessage alloc] initWithKey:4001 payload:0];
      id v7 = [(AXServer *)self client];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __27__AXSpringBoardServer_pid___block_invoke_3;
      v8[3] = &unk_1E5586688;
      id v9 = v4;
      [v7 sendAsyncMessage:v6 replyOnQueue:MEMORY[0x1E4F14428] replyHandler:v8];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __27__AXSpringBoardServer_pid___block_invoke_2;
      block[3] = &unk_1E5586660;
      id v11 = (AXIPCMessage *)v4;
      int v12 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v6 = v11;
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __27__AXSpringBoardServer_pid___block_invoke;
    v13[3] = &unk_1E5586638;
    id v14 = (AXIPCMessage *)v4;
    dispatch_async(MEMORY[0x1E4F14428], v13);
    id v6 = v14;
  }
}

uint64_t __27__AXSpringBoardServer_pid___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __27__AXSpringBoardServer_pid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __27__AXSpringBoardServer_pid___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = [a2 payload];
    id v4 = [v3 objectForKey:@"pid"];
    int v5 = [v4 intValue];

    if (v5) {
      int v6 = v5;
    }
    else {
      int v6 = -1;
    }
  }
  else
  {
    int v6 = -1;
  }
  SpringBoardPid = v6;
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

- (int64_t)activeApplicationOrientation
{
  [(AXServer *)self _connectIfNecessary];
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4000 payload:0];
  id v4 = [(AXServer *)self client];
  int v5 = [v4 sendMessage:v3 withError:0];

  int v6 = [v5 payload];
  id v7 = [v6 objectForKey:@"orientation"];
  int64_t v8 = (int)[v7 intValue];

  return v8;
}

- (int64_t)activeInterfaceOrientation
{
  [(AXServer *)self _connectIfNecessary];
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4030 payload:0];
  id v4 = [(AXServer *)self client];
  int v5 = [v4 sendMessage:v3 withError:0];

  int v6 = [v5 payload];
  id v7 = [v6 objectForKey:@"orientation"];
  int64_t v8 = [v7 integerValue];

  return v8;
}

- (void)activeInterfaceOrientation:(id)a3
{
  id v4 = a3;
  int v5 = [[AXIPCMessage alloc] initWithKey:4030 payload:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AXSpringBoardServer_activeInterfaceOrientation___block_invoke;
  v7[3] = &unk_1E5586688;
  id v8 = v4;
  id v6 = v4;
  [(AXServer *)self sendAsynchronousMessage:v5 replyOnQueue:MEMORY[0x1E4F14428] handler:v7];
}

void __50__AXSpringBoardServer_activeInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 payload];
  BOOL v3 = [v4 objectForKey:@"orientation"];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 integerValue]);
}

- (void)copyStringToPasteboard:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    [(AXServer *)self _connectIfNecessary];
    int v5 = [AXIPCMessage alloc];
    id v9 = @"string";
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [(AXIPCMessage *)v5 initWithKey:4036 payload:v6];

    id v8 = [(AXServer *)self sendMessage:v7];
  }
}

- (BOOL)isScreenSaverVisible
{
  return 0;
}

- (BOOL)isNowPlayingUIVisible
{
  return 0;
}

- (BOOL)isSoftwareUpdateUIVisible
{
  return 0;
}

- (void)activateSOSMode
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4074 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (id)splashImageForAppWithBundleIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    [(AXServer *)self _connectIfNecessary];
    int v5 = [AXIPCMessage alloc];
    id v13 = @"bundleIdentifier";
    v14[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

    id v7 = [(AXIPCMessage *)v5 initWithKey:4089 payload:v6];
    id v8 = [(AXServer *)self client];
    id v9 = [v8 sendMessage:v7 withError:0];

    id v10 = [v9 payload];
    id v11 = [v10 objectForKey:@"splashData"];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)connectedDevicesRequireAssistiveTouch
{
  [(AXServer *)self _connectIfNecessary];
  BOOL v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:4101 payload:MEMORY[0x1E4F1CC08]];
  int v5 = [(AXServer *)self client];
  id v6 = [v5 sendMessage:v4 withError:0];

  id v7 = [v6 payload];
  id v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)currentDevicesHaveAssistiveTouchCustomActions
{
  BOOL v3 = +[AXSettings sharedInstance];
  int v4 = [v3 laserEnabled];

  if (!v4) {
    return 0;
  }
  [(AXServer *)self _connectIfNecessary];
  int v5 = [AXIPCMessage alloc];
  id v6 = [(AXIPCMessage *)v5 initWithKey:4109 payload:MEMORY[0x1E4F1CC08]];
  id v7 = [(AXServer *)self client];
  id v8 = [v7 sendMessage:v6 withError:0];

  char v9 = [v8 payload];
  id v10 = [v9 objectForKeyedSubscript:@"result"];
  char v11 = [v10 BOOLValue];

  return v11;
}

- (void)cancelSiriDismissalForAssistiveTouch
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4103 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (void)toggleTorch
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4106 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (BOOL)isScreenLockedWithPasscode:(BOOL *)a3
{
  BOOL isUILocked = _isUILocked();
  if (a3) {
    *a3 = _isDeviceLockedWithPasscode();
  }
  return isUILocked;
}

- (void)screenLockStatus:(id)a3 passcodeStatusRequired:(BOOL)a4
{
  id v4 = a3;
  _isUILocked();
  _isDeviceLockedWithPasscode();
  id v6 = v4;
  id v5 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __63__AXSpringBoardServer_screenLockStatus_passcodeStatusRequired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (BOOL)isSystemSleeping
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isSystemSleepingWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4016 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (void)isSystemSleeping:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    char v5 = [[AXIPCMessage alloc] initWithKey:4016 payload:0];
    [(AXServer *)self sendAsynchronousMessage:v5 replyOnQueue:MEMORY[0x1E4F14428] BOOLResultHandler:v4];
  }
}

- (BOOL)isSyncingRestoringResettingOrUpdating
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isSyncingRestoringResettingOrUpdatingWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4039 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)areSystemGesturesDisabledNatively
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 areSystemGesturesDisabledNativelyWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4043 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)areSystemGesturesDisabledByAccessibility
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 areSystemGesturesDisabledByAccessibilityWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4044 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (id)installedApps
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v3 installedAppsWithServerInstance:v4];
  }
  else
  {
    char v5 = [[AXIPCMessage alloc] initWithKey:4046 payload:0];
    BOOL v3 = [(AXServer *)self sendMessage:v5];

    id v4 = [v3 payload];
    [v4 objectForKey:@"result"];
  id v6 = };

  return v6;
}

- (id)internalApps
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v3 internalAppsWithServerInstance:v4];
  }
  else
  {
    char v5 = [[AXIPCMessage alloc] initWithKey:4093 payload:0];
    BOOL v3 = [(AXServer *)self sendMessage:v5];

    id v4 = [v3 payload];
    [v4 objectForKey:@"result"];
  id v6 = };

  return v6;
}

- (void)wakeUpDeviceIfNecessary
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 wakeUpDeviceIfNecessaryWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4068 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)unlockDevice
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 unlockDeviceWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4048 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)rebootDevice
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 rebootDeviceWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4075 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)isMediaPlayingForApp:(id)a3 completionHandler:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v9 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v8 isMediaPlayingWithServerInstance:v9 forBundleId:v6 completion:v7];
  }
  else
  {
    id v10 = [(AXSpringBoardServer *)self mediaPlayingHandlers];

    if (!v10)
    {
      char v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(AXSpringBoardServer *)self setMediaPlayingHandlers:v11];
    }
    [(AXServer *)self _connectIfNecessary];
    [(AXServer *)self _connectServerIfNecessary];
    int v12 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v12 UUIDString];

    id v13 = [(AXSpringBoardServer *)self mediaPlayingHandlers];
    id v14 = _Block_copy(v7);

    [v13 setObject:v14 forKey:v8];
    id v15 = &stru_1EDC3DEF8;
    if (v6) {
      id v15 = v6;
    }
    v21[0] = @"bundleId";
    v21[1] = @"uuidString";
    v22[0] = v15;
    v22[1] = v8;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    long long v17 = AXLogSpringboardServer();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_18D308000, v17, OS_LOG_TYPE_INFO, "Asking for media playing status: %@", (uint8_t *)&v19, 0xCu);
    }

    id v18 = [[AXIPCMessage alloc] initWithKey:4025 payload:v16];
    [(AXServer *)self sendSimpleMessage:v18];
  }
}

- (void)pauseMedia
{
}

- (void)pauseMediaForApp:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v5 serverInstance:v6 pauseMedia:1 forBundleId:v4];
  }
  else
  {
    if (v4)
    {
      id v8 = @"bundleId";
      v9[0] = v4;
      char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    }
    else
    {
      char v5 = 0;
    }
    id v7 = [[AXIPCMessage alloc] initWithKey:4053 payload:v5];
    [(AXServer *)self sendSimpleMessage:v7];
  }
}

- (void)resumeMedia
{
}

- (void)resumeMediaForApp:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v5 serverInstance:v6 pauseMedia:0 forBundleId:v4];
  }
  else
  {
    if (v4)
    {
      id v8 = @"bundleId";
      v9[0] = v4;
      char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    }
    else
    {
      char v5 = 0;
    }
    id v7 = [[AXIPCMessage alloc] initWithKey:4054 payload:v5];
    [(AXServer *)self sendSimpleMessage:v7];
  }
}

- (BOOL)hasActiveCall
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 hasActiveCallWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4027 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)hasActiveEndpointCall
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 hasActiveEndpointCallWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4081 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)hasActiveOrPendingCall
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 hasActiveOrPendingCallWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4051 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)hasActiveOrPendingCallOrFaceTime
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 hasActiveOrPendingCallOrFaceTimeWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4057 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isMakingEmergencyCall
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v3 isMakingEmergencyCallWithServerInstance:v4];

    BOOL v5 = 0;
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4005 payload:0];
    BOOL v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isNotificationCenterVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isNotificationCenterVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4033 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isScreenshotWindowVisible
{
  BOOL v3 = [(AXSpringBoardServer *)self _shouldDispatchLocally];
  if (v3)
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v6 = [v4 isScreenshotWindowVisibleWithServerInstance:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isNotificationVisible
{
  BOOL v3 = [(AXSpringBoardServer *)self _shouldDispatchLocally];
  if (v3)
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v6 = [v4 isNotificationVisibleWithServerInstance:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isShowingLongLookNotification
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isLongLookNotificationVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4111 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isBannerVisible
{
  BOOL v3 = [(AXSpringBoardServer *)self _shouldDispatchLocally];
  if (v3)
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v6 = [v4 isBannerVisibleWithServerInstance:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isRemoteAlertVisible
{
  BOOL v3 = [(AXSpringBoardServer *)self _shouldDispatchLocally];
  if (v3)
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v6 = [v4 isRemoteTransientOverlayVisibleWithServerInstance:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)toggleNotificationCenter
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleNotificationCenterWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4034 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)showNotificationCenter
{
  if (![(AXSpringBoardServer *)self isNotificationCenterVisible])
  {
    [(AXSpringBoardServer *)self toggleNotificationCenter];
  }
}

- (void)hideNotificationCenter
{
  if ([(AXSpringBoardServer *)self isNotificationCenterVisible])
  {
    [(AXSpringBoardServer *)self toggleNotificationCenter];
  }
}

- (BOOL)isControlCenterVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isControlCenterVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4031 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)showNotificationCenter:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v7 = [v5 serverInstance:v6 showNotificationCenter:v3];
  }
  else
  {
    id v8 = [AXIPCMessage alloc];
    id v13 = @"show";
    char v9 = [NSNumber numberWithBool:v3];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    char v11 = [(AXIPCMessage *)v8 initWithKey:4050 payload:v10];
    char v7 = [(AXServer *)self sendSimpleMessageWithResult:v11];
  }
  return v7;
}

- (BOOL)showControlCenter:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v7 = [(AXIPCMessage *)v5 serverInstance:v6 showControlCenter:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v8 = [AXIPCMessage alloc];
    int v12 = @"show";
    char v9 = [NSNumber numberWithBool:v3];
    v13[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v5 = [(AXIPCMessage *)v8 initWithKey:4032 payload:v10];

    char v7 = [(AXServer *)self sendSimpleMessageWithResult:v5];
  }

  return v7;
}

- (void)armApplePay
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 armApplePayWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4078 payload:0];
    -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:");
  }
}

- (void)toggleDock
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v5 toggleDockWithServerInstance:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    char v5 = [[AXIPCMessage alloc] initWithKey:4077 payload:0];
    id v4 = -[AXServer sendMessage:](self, "sendMessage:");
  }
}

- (BOOL)isStageManagerSwitcherVisible
{
  BOOL v3 = [(AXSpringBoardServer *)self _shouldDispatchLocally];
  if (v3)
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v6 = [v4 isStageManagerSwitcherVisibleWithServerInstance:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isDockVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isDockVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4076 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isStatusBarNativeFocusable
{
  return [(AXSpringBoardServer *)self isStatusBarNativeFocusableIncludingNonDismissableElements:1];
}

- (BOOL)isStatusBarNativeFocusableIncludingNonDismissableElements:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v7 = [v5 isStatusBarNativeFocusableWithServerInstance:v6 includingNonDismissableElements:v3];

    return v7;
  }
  else
  {
    char v9 = FKALogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXSpringBoardServer isStatusBarNativeFocusableIncludingNonDismissableElements:]();
    }

    return 0;
  }
}

- (BOOL)isShowingNonSystemApp
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isShowingNonSystemAppWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4090 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isShowingHomescreen
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isShowingHomescreenWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4079 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isContinuitySessionActive
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isContinuitySessionActiveWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4131 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (void)launchApplication:(id)a3
{
  id v5 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    [v4 launchApplication:v5];
  }
}

- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    [v6 launchPinnedApplication:v7 onLeadingSide:v4];
  }
}

- (void)launchFloatingApplication:(id)a3
{
  id v5 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    [v4 launchFloatingApplication:v5];
  }
}

- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v6 = [v5 canLaunchAsPinnedApplicationForIconView:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v6 = [v5 canLaunchAsFloatingApplicationForIconView:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isAppSwitcherVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isAppSwitcherVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4011 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isShelfSwitcherVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isShelfSwitcherVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4007 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (void)openAppSwitcher
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AXSpringBoardServer *)self _shouldDispatchLocally];
  id v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = [NSNumber numberWithBool:v3];
    int v8 = 138412290;
    char v9 = v5;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "Requesting SB openAppSwitcher. dispatchLocal=%@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    char v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v6 openAppSwitcherWithServerInstance:v7];
  }
  else
  {
    char v6 = [[AXIPCMessage alloc] initWithKey:4010 payload:0];
    [(AXServer *)self sendSimpleMessage:v6];
  }
}

- (void)dismissAppSwitcher
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 dismissAppSwitcherWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4047 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)dismissShelfSwitcher
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 dismissShelfSwitcherWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4004 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)simulateEdgePressHaptics
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 simulateEdgePressHaptics:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4067 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)toggleAppLibrary
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleAppLibraryWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4112 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)toggleQuickNote
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleQuickNoteWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4113 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)toggleSpotlight
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleSpotlightWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4065 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)revealSpotlight
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 revealSpotlightWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4066 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)isDarkModeActive
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isDarkModeActiveWithServiceInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4099 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)toggleDarkMode
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 toggleDarkModeWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4100 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isGuidedAccessActive
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isGuidedAccessActiveWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4038 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isSpotlightVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isSpotlightVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4098 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isPIPWindowVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isPIPWindowVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4102 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)dismissSiri
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 dismissSiriWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4049 payload:0];
    [(AXServer *)self sendSimpleMessage:v3];
    char v5 = 1;
  }

  return v5;
}

- (BOOL)isSiriVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isSiriVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4037 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isSiriTalkingOrListening
{
  return 0;
}

- (BOOL)isReceivingAirPlay
{
  return 0;
}

- (BOOL)isPasscodeLockVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isPasscodeLockVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4082 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isLockScreenVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isLockScreenVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4104 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (void)openVoiceControl
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 openVoiceControlWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4029 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)isTypeToSiriVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isTypeToSiriVisibleWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4133 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (void)openTypeToSiri
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 openTypeToSiriWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4132 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)isVoiceControlRunning
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isVoiceControlRunningWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4013 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)isSpeakThisTemporarilyDisabled
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isSpeakThisTemporarilyDisabledWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4042 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (id)allowedMedusaGestures
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 allowedMedusaGesturesWithServerInstance:v4];

LABEL_5:
    goto LABEL_7;
  }
  if (AXDeviceSupportsSideApp())
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4063 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];
    goto LABEL_5;
  }
  char v5 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v5;
}

- (void)toggleBackgroundSounds
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleBackgroundSoundsWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4110 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)performMedusaGesture:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v7 = [v5 serverInstance:v6 performMedusaGesture:a3];
  }
  else
  {
    int v8 = [AXIPCMessage alloc];
    id v13 = @"gesture";
    char v9 = [NSNumber numberWithUnsignedInteger:a3];
    v14[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    char v11 = [(AXIPCMessage *)v8 initWithKey:4064 payload:v10];
    char v7 = [(AXServer *)self sendSimpleMessageWithResult:v11];
  }
  return v7;
}

- (id)medusaApps
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 medusaAppsWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4080 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];
  }

  return v5;
}

- (void)setDockIconActivationMode:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v10 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v10 serverInstance:v5 setDockIconActivationMode:a3];
  }
  else
  {
    char v6 = [AXIPCMessage alloc];
    char v11 = @"mode";
    char v7 = [NSNumber numberWithUnsignedInteger:a3];
    v12[0] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    char v9 = [(AXIPCMessage *)v6 initWithKey:4091 payload:v8];
    [(AXServer *)self sendSimpleMessage:v9];
  }
}

- (BOOL)canSetDockIconActivationMode
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 canSetDockIconActivationModeForServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4092 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (void)systemAppInfoWithQuery:(unint64_t)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    int v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v9 = [v7 serverInstance:v8 springBoardSystemInfoQuery:a3];

    v18[1] = MEMORY[0x1E4F143A8];
    v18[2] = 3221225472;
    v18[3] = __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke;
    v18[4] = &unk_1E55866D8;
    id v10 = &v20;
    id v19 = v9;
    id v20 = v6;
    id v11 = v6;
    int v12 = v9;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  else
  {
    id v13 = [AXIPCMessage alloc];
    uint64_t v21 = @"query";
    id v14 = [NSNumber numberWithUnsignedInteger:a3];
    v22[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    int v12 = [(AXIPCMessage *)v13 initWithKey:4045 payload:v15];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke_2;
    v17[3] = &unk_1E5586700;
    id v10 = (id *)v18;
    v18[0] = v6;
    id v16 = v6;
    [(AXServer *)self sendAsynchronousMessage:v12 replyOnQueue:MEMORY[0x1E4F14428] objectResultHandler:v17];
  }
}

uint64_t __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isSystemAppShowingAnAlert
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [v3 isSystemAppShowingAnAlertWithServerInstance:v4];
  }
  else
  {
    id v6 = [[AXIPCMessage alloc] initWithKey:4501 payload:0];
    BOOL v3 = [(AXServer *)self sendMessage:v6];

    id v4 = [v3 payload];
    char v7 = [v4 objectForKey:@"result"];
    char v5 = [v7 BOOLValue];
  }
  return v5;
}

- (void)setBluetoothPowerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  char v5 = [AXIPCMessage alloc];
  id v10 = @"result";
  id v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  int v8 = [(AXIPCMessage *)v5 initWithKey:4128 payload:v7];
  id v9 = [(AXServer *)self sendMessage:v8];
}

- (BOOL)bluetoothPowerEnabled
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4129 payload:0];
  id v4 = [(AXServer *)self sendMessage:v3];

  char v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"result"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setVoiceOverEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  char v5 = [AXIPCMessage alloc];
  id v10 = @"result";
  id v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  int v8 = [(AXIPCMessage *)v5 initWithKey:4126 payload:v7];
  id v9 = [(AXServer *)self sendMessage:v8];
}

- (BOOL)voiceOverEnabled
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4127 payload:0];
  id v4 = [(AXServer *)self sendMessage:v3];

  char v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"result"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  char v5 = [AXIPCMessage alloc];
  id v10 = @"result";
  id v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  int v8 = [(AXIPCMessage *)v5 initWithKey:4124 payload:v7];
  id v9 = [(AXServer *)self sendMessage:v8];
}

- (BOOL)zoomEnabled
{
  BOOL v3 = [[AXIPCMessage alloc] initWithKey:4125 payload:0];
  id v4 = [(AXServer *)self sendMessage:v3];

  char v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"result"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)focusedAppPID
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v3 focusedAppPIDWithServerInstance:v4];
  }
  else
  {
    char v5 = [[AXIPCMessage alloc] initWithKey:4503 payload:0];
    BOOL v3 = [(AXServer *)self sendMessage:v5];

    id v4 = [v3 payload];
    [v4 objectForKey:@"result"];
  id v6 = };

  return v6;
}

- (int)purpleBuddyPID
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    int v5 = [v3 purpleBuddyPIDWithServerInstance:v4];
  }
  else
  {
    id v6 = [[AXIPCMessage alloc] initWithKey:4507 payload:0];
    BOOL v3 = [(AXServer *)self sendMessage:v6];

    id v4 = [v3 payload];
    char v7 = [v4 objectForKey:@"result"];
    int v5 = [v7 integerValue];
  }
  return v5;
}

- (void)purpleBuddyPID:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__AXSpringBoardServer_purpleBuddyPID___block_invoke;
    block[3] = &unk_1E5586570;
    void block[4] = self;
    id v12 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = v12;
  }
  else
  {
    char v7 = [[AXIPCMessage alloc] initWithKey:4507 payload:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __38__AXSpringBoardServer_purpleBuddyPID___block_invoke_2;
    v9[3] = &unk_1E5586688;
    id v10 = v4;
    id v8 = v4;
    [(AXServer *)self sendAsynchronousMessage:v7 replyOnQueue:MEMORY[0x1E4F14428] handler:v9];

    id v6 = v10;
  }
}

uint64_t __38__AXSpringBoardServer_purpleBuddyPID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _axSpringBoardServerInstanceDelegate];
  BOOL v3 = [*(id *)(a1 + 32) _axSpringBoardServerInstance];
  [v2 purpleBuddyPIDWithServerInstance:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __38__AXSpringBoardServer_purpleBuddyPID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 payload];
  BOOL v3 = [v4 objectForKey:@"result"];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 integerValue]);
}

- (id)runningAppPIDs
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v3 runningAppPIDsWithServerInstance:v4];
  }
  else
  {
    id v5 = [[AXIPCMessage alloc] initWithKey:4504 payload:0];
    BOOL v3 = [(AXServer *)self sendMessage:v5];

    id v4 = [v3 payload];
    [v4 objectForKey:@"result"];
  id v6 = };

  return v6;
}

- (BOOL)isSystemAppFrontmost
{
  return [(AXSpringBoardServer *)self _isSystemAppFrontmostExcludingSiri:0];
}

- (void)isSystemAppFrontmost:(id)a3
{
}

- (BOOL)isSystemAppFrontmostExludingSiri
{
  return [(AXSpringBoardServer *)self _isSystemAppFrontmostExcludingSiri:1];
}

- (void)_isSystemAppFrontmostExcludingSiri:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v7 isSystemAppFrontmostExcludingSiri:v4 withServerInstance:v8];

    id v13 = v6;
    AXPerformBlockAsynchronouslyOnMainThread();
    id v9 = v13;
  }
  else
  {
    id v10 = [AXIPCMessage alloc];
    id v14 = @"excludeSiri";
    id v9 = [NSNumber numberWithBool:v4];
    v15[0] = v9;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = [(AXIPCMessage *)v10 initWithKey:4500 payload:v11];
    [(AXServer *)self sendAsynchronousMessage:v12 replyOnQueue:MEMORY[0x1E4F14428] BOOLResultHandler:v6];
  }
}

uint64_t __69__AXSpringBoardServer__isSystemAppFrontmostExcludingSiri_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isSystemAppFrontmostExcludingSiri:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v7 = [v5 isSystemAppFrontmostExcludingSiri:v3 withServerInstance:v6];
  }
  else
  {
    id v8 = [AXIPCMessage alloc];
    id v13 = @"excludeSiri";
    id v9 = [NSNumber numberWithBool:v3];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = [(AXIPCMessage *)v8 initWithKey:4500 payload:v10];
    char v7 = [(AXServer *)self sendSimpleMessageWithResult:v11];
  }
  return v7;
}

- (BOOL)isPurpleBuddyAppFrontmost
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isPurpleBuddyAppFrontmostWithServerInstance:v4];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:4506 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (BOOL)dismissBuddyIfNecessary
{
  if (AXDeviceHasHomeButton()) {
    return 0;
  }
  int v3 = AXIsBuddyCompleted();
  char v4 = v3;
  int v5 = dismissBuddyIfNecessary_hasSeenNonBuddyFrontMostApp;
  if (dismissBuddyIfNecessary_hasSeenNonBuddyFrontMostApp) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    BOOL v7 = [(AXSpringBoardServer *)self isPurpleBuddyAppFrontmost];
    int v5 = !v7;
    dismissBuddyIfNecessary_hasSeenNonBuddyFrontMostApp = !v7;
  }
  char v8 = v5 ? v4 : 0;
  if (v8) {
    return 0;
  }
  [(AXSpringBoardServer *)self purpleBuddyPID];
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  id v11 = [MEMORY[0x1E4F488F8] elementWithAXUIElement:AppElementWithPid];
  if (AppElementWithPid) {
    CFRelease(AppElementWithPid);
  }
  id v12 = [v11 uiElement];
  char v13 = [v12 performAXAction:4019];

  return v13;
}

- (BOOL)isSettingsAppFrontmost
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [(AXIPCMessage *)v3 isSettingsAppFrontmostWithServerInstance:v4];
  }
  else
  {
    int v3 = [[AXIPCMessage alloc] initWithKey:4505 payload:0];
    char v5 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }

  return v5;
}

- (id)focusedApps
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    char v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    uint64_t v5 = [v3 focusedAppsWithServerInstance:v4];
LABEL_5:
    id v10 = (void *)v5;

    goto LABEL_7;
  }
  BOOL v6 = [[AXIPCMessage alloc] initWithKey:4509 payload:0];
  int v3 = [(AXServer *)self sendSimpleMessageWithObjectResult:v6];

  if (v3)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28DC0];
    char v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    char v4 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v5 = [v7 unarchivedObjectOfClasses:v4 fromData:v3 error:0];
    goto LABEL_5;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)displayIdentifierForSceneIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    BOOL v7 = [v5 displayIdentifierForSceneIdentifier:v4 serverInstance:v6];
  }
  else
  {
    char v8 = [AXIPCMessage alloc];
    long long v17 = @"sceneIdentifier";
    v18[0] = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v10 = [(AXIPCMessage *)v8 initWithKey:4120 payload:v9];
    id v11 = [(AXServer *)self sendSimpleMessageWithObjectResult:v10];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x1E4F28DC0];
      char v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      id v16 = 0;
      BOOL v7 = [v12 unarchivedObjectOfClasses:v13 fromData:v11 error:&v16];
      id v14 = v16;

      if (v14) {
        _AXLogWithFacility();
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)focusedOccludedAppScenes
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    uint64_t v5 = [v3 focusedOccludedAppScenesWithServerInstance:v4];
  }
  else
  {
    BOOL v6 = [[AXIPCMessage alloc] initWithKey:4510 payload:0];
    BOOL v7 = [(AXServer *)self sendSimpleMessageWithObjectResult:v6];

    if (v7)
    {
      char v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      id v14 = 0;
      uint64_t v5 = [v8 unarchivedObjectOfClasses:v11 fromData:v7 error:&v14];
      id v12 = v14;

      if (v12) {
        _AXLogWithFacility();
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v8 acquireAssertionWithType:v6 identifier:v7 clientPort:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSpringBoardServer;
    [(AXServer *)&v9 acquireAssertionWithType:v6 identifier:v7];
  }
}

- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v8 relinquishAssertionWithType:v6 identifier:v7 clientPort:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSpringBoardServer;
    [(AXServer *)&v9 relinquishAssertionWithType:v6 identifier:v7];
  }
}

- (BOOL)loadGAXBundleForUnmanagedASAM
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v3 forceLoadGAXBundleWithServerInstance:v4];

    return 1;
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v6 = [[AXIPCMessage alloc] initWithKey:4069 payload:0];
    id v7 = [(AXServer *)self client];
    uint64_t v10 = 0;
    [v7 sendSimpleMessage:v6 withError:&v10];
    uint64_t v8 = v10;

    BOOL v5 = v8 == 0;
  }
  return v5;
}

- (void)reactivateInCallService
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 reactivateInCallServiceWithServerInstance:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v4 = [[AXIPCMessage alloc] initWithKey:4084 payload:0];
    int v3 = [(AXServer *)self client];
    [v3 sendSimpleMessage:v4];
  }
}

- (void)launchMagnifierApp
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 launchMagnifierAppWithServerInstance:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v4 = [[AXIPCMessage alloc] initWithKey:4070 payload:0];
    int v3 = [(AXServer *)self client];
    [v3 sendSimpleMessage:v4];
  }
}

- (void)isMagnifierVisibleWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v7 = [v5 isMagnifierVisibleWithServerInstance:v6];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke;
    id v15 = &unk_1E5586728;
    id v16 = v4;
    char v17 = v7;
    uint64_t v8 = (AXIPCMessage *)v4;
    AXPerformBlockOnMainThread();
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v8 = [[AXIPCMessage alloc] initWithKey:4071 payload:0];
    objc_super v9 = [(AXServer *)self client];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke_2;
    v10[3] = &unk_1E5586688;
    id v11 = v4;
    id v4 = v4;
    [v9 sendAsyncMessage:v8 withReplyHandler:v10];
  }
}

uint64_t __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (v6)
  {
    _AXLogWithFacility();
LABEL_3:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  if (!v10) {
    goto LABEL_3;
  }
  uint64_t v8 = [v10 payload];
  objc_super v9 = [v8 objectForKeyedSubscript:@"result"];
  uint64_t v7 = [v9 BOOLValue];

LABEL_6:
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, v5);
}

- (void)launchOnboardingViewService:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = @"type";
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    uint64_t v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v6 launchOnboardingViewServiceWithServerInstance:v7 data:v5];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v6 = [[AXIPCMessage alloc] initWithKey:4122 payload:v5];
    uint64_t v7 = [(AXServer *)self client];
    [v7 sendSimpleMessage:v6];
  }
}

- (void)launchVoiceOverQuickSettingsViewService:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    objc_super v9 = @"data";
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
    {
      uint64_t v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
      uint64_t v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
      [(AXIPCMessage *)v7 launchVoiceOverQuickSettingsViewServiceWithServerInstance:v8 data:v6];
    }
    else
    {
      [(AXServer *)self _connectIfNecessary];
      uint64_t v7 = [[AXIPCMessage alloc] initWithKey:4094 payload:v6];
      uint64_t v8 = [(AXServer *)self client];
      [v8 sendSimpleMessage:v7];
    }
  }
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:(id)a3 withData:(id)a4
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v16 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v16];
    uint64_t v8 = v16;
    id v15 = 0;
    objc_super v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
    id v10 = v15;
    id v11 = v10;
    if (v8 || !v7)
    {
      uint64_t v12 = AXLogSpringboardServer();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[AXSpringBoardServer launchVoiceOverImageExplorerViewServiceForResult:withData:]((uint64_t)v8, v12);
      }
    }
    else if (v10 || !v9)
    {
      uint64_t v12 = AXLogSpringboardServer();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[AXSpringBoardServer launchVoiceOverImageExplorerViewServiceForResult:withData:]((uint64_t)v11, v12);
      }
    }
    else
    {
      v17[0] = @"VoiceOverImageExplorerVisionResultData";
      v17[1] = @"VoiceOverImageExplorerElementInfo";
      v18[0] = v7;
      v18[1] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
      {
        uint64_t v13 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
        id v14 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
        [(AXIPCMessage *)v13 launchVoiceOverImageExplorerViewServiceWithServerInstance:v14 forData:v12];
      }
      else
      {
        [(AXServer *)self _connectIfNecessary];
        uint64_t v13 = [[AXIPCMessage alloc] initWithKey:4105 payload:v12];
        id v14 = [(AXServer *)self client];
        [v14 sendSimpleMessage:v13];
      }
    }
  }
  else
  {
    uint64_t v8 = AXLogSpringboardServer();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AXSpringBoardServer launchVoiceOverImageExplorerViewServiceForResult:withData:]();
    }
  }
}

- (id)visibleTripleClickItems
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    int v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    uint64_t v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    uint64_t v5 = [(AXIPCMessage *)v3 visibleTripleClickItemsWithServerInstance:v4];
  }
  else
  {
    int v3 = [[AXIPCMessage alloc] initWithKey:4108 payload:0];
    uint64_t v5 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];
  }

  return v5;
}

- (BOOL)isAppleWatchRemoteScreenActive
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = _AXSTwiceRemoteScreenEnabled();
  if (v2)
  {
    int v3 = AXLogTwiceRemoteScreen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[AXSpringBoardServer isAppleWatchRemoteScreenActive]";
      _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2 != 0;
}

- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3
{
  return [(AXSpringBoardServer *)self isNonExclusiveSystemUIFocusableIncludingPIPWindow:a3 includingNonDismissableElements:1];
}

- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3 includingNonDismissableElements:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(AXSpringBoardServer *)self isNotificationVisible]
    || [(AXSpringBoardServer *)self isDockVisible]
    || [(AXSpringBoardServer *)self isScreenshotWindowVisible]
    || [(AXSpringBoardServer *)self isSiriVisible]
    || v5 && [(AXSpringBoardServer *)self isPIPWindowVisible]
    || [(AXSpringBoardServer *)self isBannerVisible]
    || [(AXSpringBoardServer *)self isStageManagerSwitcherVisible])
  {
    return 1;
  }
  if (AXDoesRequestingClientDeserveAutomation()) {
    return 0;
  }

  return [(AXSpringBoardServer *)self isStatusBarNativeFocusableIncludingNonDismissableElements:v4];
}

- (void)setShouldFocusNonExclusiveSystemUI:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v5 = FKALogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[AXSpringBoardServer setShouldFocusNonExclusiveSystemUI:]();
    }
  }
  if (self->_shouldFocusNonExclusiveSystemUI != v3)
  {
    self->_shouldFocusNonExclusiveSystemUI = v3;
    id v6 = FKALogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_INFO, "Should focus non exclusive system UI: %i", (uint8_t *)v9, 8u);
    }

    uint64_t v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    uint64_t v8 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v7 updateFrontMostApplicationWithServerInstance:v8];
  }
}

- (void)freezeClarityUILoadingScreenWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [v5 freezeClarityUILoadingScreenWithServerInstance:v6];

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke;
    id v14 = &unk_1E5586638;
    id v15 = v4;
    uint64_t v7 = (AXIPCMessage *)v4;
    AXPerformBlockOnMainThread();
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v7 = [[AXIPCMessage alloc] initWithKey:4116 payload:0];
    uint64_t v8 = [(AXServer *)self client];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5586688;
    id v10 = v4;
    id v4 = v4;
    [v8 sendAsyncMessage:v7 withReplyHandler:v9];
  }
}

uint64_t __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = CLFLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentNearbyDeviceControlPicker
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    BOOL v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 presentNearbyDeviceControlPickerWithServerInstance:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v4 = [[AXIPCMessage alloc] initWithKey:4117 payload:0];
    BOOL v3 = [(AXServer *)self client];
    [v3 sendAsyncMessage:v4 withReplyHandler:&__block_literal_global_575];
  }
}

void __55__AXSpringBoardServer_presentNearbyDeviceControlPicker__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = AXLogSpringboardServer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__AXSpringBoardServer_presentNearbyDeviceControlPicker__block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)requestDismissJindo
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 diminishJindoWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4118 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (id)jindoAppBundleIndentifiers
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    BOOL v5 = [(AXIPCMessage *)v3 jindoAppBundleIndentifiersWithServerInstance:v4];
  }
  else
  {
    id v3 = [[AXIPCMessage alloc] initWithKey:4121 payload:0];
    BOOL v5 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];
  }

  return v5;
}

- (void)toggleDetectionMode
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleDetectionModeWithServerInstance:v3];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    id v4 = [[AXIPCMessage alloc] initWithKey:4119 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)isMagnifierVisible
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [v3 isMagnifierVisibleWithServerInstance:v4];

    return v5;
  }
  else
  {
    _AXAssert();
    return 0;
  }
}

- (id)applicationWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    uint64_t v7 = [v5 serverInstance:v6 appWithIdentifier:v4];
  }
  else
  {
    _AXAssert();
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)focusedAppProcess
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [v3 focusedAppProcessWithServerInstance:v4];
  }
  else
  {
    _AXAssert();
    char v5 = 0;
  }

  return v5;
}

- (id)runningAppProcesses
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    char v5 = [v3 runningAppProcessesWithServerInstance:v4];
  }
  else
  {
    _AXAssert();
    char v5 = 0;
  }

  return v5;
}

- (id)appNameFromPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    char v5 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    uint64_t v7 = [v5 appNameFromPid:v3 withServerInstance:v6];
  }
  else
  {
    uint64_t v8 = [AXIPCMessage alloc];
    uint64_t v13 = @"pid";
    objc_super v9 = [NSNumber numberWithInt:v3];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v11 = [(AXIPCMessage *)v8 initWithKey:4114 payload:v10];
    uint64_t v7 = [(AXServer *)self sendSimpleMessageWithObjectResult:v11];
  }

  return v7;
}

- (void)toggleLiveTranscription
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    uint64_t v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleLiveTranscriptionWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4115 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (void)toggleConversationBoost
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    id v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    uint64_t v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstance];
    [(AXIPCMessage *)v4 toggleConversationBoostWithServerInstance:v3];
  }
  else
  {
    id v4 = [[AXIPCMessage alloc] initWithKey:4130 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (int)nativeFocusedApplication
{
  if ([(AXSpringBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
    int v4 = [v3 nativeFocusedApplication];
  }
  else
  {
    objc_opt_class();
    char v5 = [[AXIPCMessage alloc] initWithKey:4123 payload:0];
    id v6 = [(AXServer *)self sendSimpleMessageWithObjectResult:v5];
    uint64_t v3 = __UIAccessibilityCastAsClass();

    int v4 = [v3 intValue];
  }
  int v7 = v4;

  return v7;
}

- (AXAccessQueue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (id)currentAlertHandler
{
  return self->_currentAlertHandler;
}

- (void)setCurrentAlertHandler:(id)a3
{
}

- (void)setActionHandlers:(id)a3
{
}

- (NSMutableDictionary)reachabilityHandlers
{
  return self->_reachabilityHandlers;
}

- (void)setReachabilityHandlers:(id)a3
{
}

- (NSMutableDictionary)mediaPlayingHandlers
{
  return self->_mediaPlayingHandlers;
}

- (void)setMediaPlayingHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlayingHandlers, 0);
  objc_storeStrong((id *)&self->_reachabilityHandlers, 0);
  objc_storeStrong((id *)&self->_actionHandlers, 0);
  objc_storeStrong(&self->_currentAlertHandler, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_axSpringBoardServerInstance
{
  uint64_t v3 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
  if (!_axSpringBoardServerInstance_AXSBServerInstance)
  {
    uint64_t v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceIfExists];
    char v5 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
    _axSpringBoardServerInstance_AXSBServerInstance = v4;

    uint64_t v3 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
    if (!_axSpringBoardServerInstance_AXSBServerInstance)
    {
      id v6 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceDelegate];
      uint64_t v7 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceIfExists];
      uint64_t v8 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
      _axSpringBoardServerInstance_AXSBServerInstance = v7;

      uint64_t v3 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
    }
  }

  return v3;
}

- (id)_axSpringBoardServerInstanceIfExists
{
  Class v2 = NSClassFromString(&cfstr_Axspringboards_6.isa);

  return (id)[(objc_class *)v2 safeValueForKey:@"springBoardServerInstanceIfExists"];
}

- (id)_axSpringBoardServerInstanceDelegate
{
  uint64_t v3 = (void *)_axSpringBoardServerInstanceDelegate_delegate;
  if (!_axSpringBoardServerInstanceDelegate_delegate)
  {
    [NSClassFromString(&cfstr_Axspringboards_7.isa) initialize];
    uint64_t v4 = [(AXSpringBoardServer *)self _axSpringBoardServerInstanceIfExists];
    uint64_t v5 = [v4 safeValueForKey:@"delegate"];
    id v6 = (void *)_axSpringBoardServerInstanceDelegate_delegate;
    _axSpringBoardServerInstanceDelegate_delegate = v5;

    uint64_t v3 = (void *)_axSpringBoardServerInstanceDelegate_delegate;
  }

  return v3;
}

uint64_t __74__AXSpringBoardServer_AXSpringBoardServer_Private___shouldDispatchLocally__block_invoke()
{
  uint64_t result = AXProcessIsSpringBoard();
  _shouldDispatchLocally_uint64_t result = result;
  return result;
}

void __29__AXSpringBoardServer_server__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D308000, v0, v1, "Incorrect attempt to use AXSpringBoardServer while ClarityBoard was running.", v2, v3, v4, v5, v6);
}

- (void)isStatusBarNativeFocusableIncludingNonDismissableElements:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18D308000, v0, OS_LOG_TYPE_ERROR, "Unexpectedly attempted to check focusability of status bar outside of SpringBoard.", v1, 2u);
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:withData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D308000, v0, v1, "Image Explorer : visionResult is nil", v2, v3, v4, v5, v6);
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:(uint64_t)a1 withData:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18D308000, a2, OS_LOG_TYPE_FAULT, "Failed to archive AXMVisionResult. error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:(uint64_t)a1 withData:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18D308000, a2, OS_LOG_TYPE_FAULT, "Failed to archive AXSBImageExplorerData. error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setShouldFocusNonExclusiveSystemUI:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D308000, v0, v1, "Attempted to call -setShouldFocusNonExclusiveSystemUI: outside of SpringBoard", v2, v3, v4, v5, v6);
}

void __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18D308000, v0, OS_LOG_TYPE_ERROR, "Unable to freeze ClarityUI loading screen.", v1, 2u);
}

void __55__AXSpringBoardServer_presentNearbyDeviceControlPicker__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "failed to present nearby device control picker with error: %@", (uint8_t *)&v2, 0xCu);
}

@end