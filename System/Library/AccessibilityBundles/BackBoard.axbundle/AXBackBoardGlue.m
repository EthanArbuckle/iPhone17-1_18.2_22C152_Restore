@interface AXBackBoardGlue
+ (BOOL)isDisplayBacklightOff;
+ (CGPoint)displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (CGPoint)displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (id)hidClientConnectionManager;
+ (int)accessibilityUIServerPid;
+ (int)assistiveTouchPid;
+ (int)inputUIPid;
+ (int)liveCaptionsPid;
+ (int)siriViewServicePid;
+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7;
+ (void)_repeatAggregateStatistics;
+ (void)initialize;
+ (void)kickoffAggregateStatistics;
+ (void)processExternalHIDEvent:(__IOHIDEvent *)a3;
+ (void)sendUserEventOccurred;
+ (void)setLockScreenDimTimerEnabled:(BOOL)a3;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (int)accessibilityAssistiveTouchPid;
- (int)accessibilityFullKeyboardAccessDaemonPid;
- (int)accessibilityLiveCaptionsPid;
- (int)accessibilityUIServerPid;
- (int)hearingAidServerPid;
- (unsigned)contextIdForDisplayPoint:(CGPoint)a3;
- (unsigned)contextIdHosterForContextId:(unsigned int)a3;
- (void)postEvent:(id)a3 systemEvent:(BOOL)a4 afterNamedTap:(id)a5 namedTaps:(id)a6;
- (void)registerEventListener:(BOOL)a3;
- (void)setAccessibilityUIServerPid:(int)a3;
- (void)setAssistiveTouchPid:(int)a3;
- (void)setCapsLockLightOn:(BOOL)a3;
- (void)setDisableSystemGestureRecognitionInEvents:(BOOL)a3;
- (void)setFullKeyboardAccessDaemonPID:(int)a3;
- (void)setHearingAidServerPid:(int)a3;
- (void)setIsSpeakScreenHighlightVisible:(BOOL)a3;
- (void)setLiveCaptionsPid:(int)a3;
- (void)setLockScreenDimTimerEnabled:(BOOL)a3;
- (void)setSiriViewServicePid:(int)a3;
- (void)userEventOccurred;
- (void)zoomListenerRegistered;
@end

@implementation AXBackBoardGlue

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AXBackBoardGlue_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

void __29__AXBackBoardGlue_initialize__block_invoke(uint64_t a1)
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = dispatch_queue_create("BBAXLoadingQueue", v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AXBackBoardGlue_initialize__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_2(uint64_t a1)
{
  v2 = AXLogBackboardServer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "Loading AXBackBoardGlue", buf, 2u);
  }

  v3 = objc_alloc_init(AXBackBoardGlue);
  v4 = (void *)SharedInstance;
  SharedInstance = (uint64_t)v3;

  _AXSSetWriteableClient();
  uint64_t v5 = SharedInstance;
  v6 = +[AXBackBoardServerInstance backBoardServerInstance];
  [v6 setDelegate:v5];

  BKAccessibilityClass = (uint64_t)NSClassFromString(&cfstr_Bkaccessibilit.isa);
  v7 = [MEMORY[0x263F228B0] sharedManager];
  [v7 setInstallationGSCallback:&__block_literal_global_7];

  v8 = [MEMORY[0x263F228B0] sharedManager];
  [v8 setInstallationHIDCallback:&__block_literal_global_284_1];

  v9 = [MEMORY[0x263F228B0] sharedManager];
  [v9 setInstallationEventRepPost:&__block_literal_global_287_0];

  v10 = +[AXBLocalizationCaptionController controller];
  [v10 initializeMonitor];

  if (AXIsLookingGlassAvailable()) {
    +[AXBLookingGlassManager initializeMonitor];
  }
  +[AXBSpeakThisManager initializeMonitor];
  +[AXBHomeClickController initializeMonitor];
  +[AXBZoomTouchManager initializeZoomMonitor];
  +[AXBHoverTextManager initializeMonitor];
  +[AXBMotionCuesManager initializeMonitor];
  if (AXDeviceSupportsHapticMusic())
  {
    +[AXBHapticMusicManager initializeMonitor];
  }
  else
  {
    v11 = AXLogHapticMusic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v11, OS_LOG_TYPE_INFO, "Device doesn't support Haptic Music", buf, 2u);
    }
  }
  if (AXDeviceSupportsLiveSpeech()) {
    +[AXBLiveSpeechManager initializeMonitor];
  }
  if (AXDeviceSupportsLiveCaptions()) {
    +[AXBLiveCaptionsManager initializeMonitor];
  }
  +[AXBGuidedAccessManager initializeMonitor];
  if (AXDeviceSupportsAssistiveTouch())
  {
    +[AXBAssistiveTouchManager initializeMonitor];
  }
  else if (_AXSAssistiveTouchEnabled())
  {
    _AXSAssistiveTouchSetEnabled();
  }
  +[AXBTouchAccommodationsController initializeMonitor];
  +[AXBHardwareManager initializeMonitor];
  id v12 = +[AXBBlueLightManager sharedManager];
  v13 = +[AXBOpaqueTouchSettingsManager sharedInstance];
  [v13 start];

  int IsPhone = AXDeviceIsPhone();
  v15 = AXLogBackTap();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (IsPhone)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v15, OS_LOG_TYPE_DEFAULT, "Device is phone; initializing back tap monitor",
        buf,
        2u);
    }

    +[AXBBackTapMonitor initializeMonitor];
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v15, OS_LOG_TYPE_DEFAULT, "Device is not phone; not initializing back tap monitor",
        buf,
        2u);
    }
  }
  +[AXBSoundDetectionManager initializeManager];
  +[AXBAVSDetectionManager initializeManager];
  if (AXIsInternalInstall()) {
    +[AXBInternalBundleLoaderManager initializeMonitor];
  }
  if (_AXSTwiceRemoteScreenEnabled())
  {
    v17 = AXLogTwiceRemoteScreen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __29__AXBackBoardGlue_initialize__block_invoke_2_cold_1(v17);
    }

    _AXSTwiceRemoteScreenSetEnabled();
  }
  +[AXBTwiceRemoteScreenManager initializeMonitor];
  dispatch_time_t v18 = dispatch_time(0, 900000000000);
  v19 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AXBackBoardGlue_initialize__block_invoke_310;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v18, v19, block);

  +[AXBDisplayFilterManager initializeMonitor];
  +[AXBAccessibilityManager initializeAccessibilityMonitor];
  v20 = [MEMORY[0x263F21400] sharedInstance];
  [v20 performValidations:&__block_literal_global_317 withPreValidationHandler:&__block_literal_global_330 postValidationHandler:&__block_literal_global_340_0 safeCategoryInstallationHandler:&__block_literal_global_344];

  return AXBeginListeningToUserDefaultsChanges();
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_277()
{
  return AXPerformSafeBlock();
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_2_279(uint64_t a1)
{
  Class v2 = NSClassFromString(&cfstr_Bkaccessibilit.isa);
  uint64_t v3 = *(void *)(a1 + 32);

  return [(objc_class *)v2 _accessibilitySetEventTapCallback:v3];
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_3()
{
  return AXPerformSafeBlock();
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_4(uint64_t a1)
{
  Class v2 = NSClassFromString(&cfstr_Bkaccessibilit.isa);
  uint64_t v3 = *(void *)(a1 + 32);

  return [(objc_class *)v2 _accessibilitySetHIDEventTapCallback:v3];
}

void __29__AXBackBoardGlue_initialize__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AXBEventManager sharedManager];
  [v3 dispatchEventRepresentationToClient:v2];
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_310(uint64_t a1)
{
  return [*(id *)(a1 + 32) kickoffAggregateStatistics];
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_2_314(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CMDeviceOrientationManager"];
  [v2 validateClass:@"BKUserEventTimer"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKUserEventTimer", @"sharedInstance", "@", 0);

  return 1;
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_3_328(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX Backboard"];
  [v2 setOverrideProcessName:@"Backboard"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __29__AXBackBoardGlue_initialize__block_invoke_5_341(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BKAccelerometerInterfaceAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUserEventTimerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUIProgressWindowAccessibility" canInteractWithTargetClass:1];
}

+ (void)_repeatAggregateStatistics
{
  dispatch_time_t v3 = dispatch_time(0, 86400000000000);
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AXBackBoardGlue__repeatAggregateStatistics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_after(v3, v4, block);
}

void __45__AXBackBoardGlue__repeatAggregateStatistics__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F21130] updateStatistics];
  [*(id *)(a1 + 32) _repeatAggregateStatistics];
  id v2 = [MEMORY[0x263F213A0] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    v4 = [MEMORY[0x263F213A0] identifier];
    uint64_t v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = AXColorizeFormatLog();
      v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_241F5C000, v5, v6, "%{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

+ (void)kickoffAggregateStatistics
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F213A0] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x263F213A0] identifier];
    os_log_type_t v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      int v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_241F5C000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [MEMORY[0x263F21130] updateStatistics];
  [a1 _repeatAggregateStatistics];
}

+ (id)hidClientConnectionManager
{
  return (id)[(id)BKAccessibilityClass safeValueForKey:@"_eventRoutingClientConnectionManager"];
}

+ (void)sendUserEventOccurred
{
  if (sendUserEventOccurred_onceToken != -1) {
    dispatch_once(&sendUserEventOccurred_onceToken, &__block_literal_global_366);
  }
  id v2 = [(id)sendUserEventOccurred_BKUserEventTimerClass safeValueForKey:@"sharedInstance"];
  char v3 = [v2 safeValueForKey:@"_currentMode"];
  int v4 = [v3 intValue];

  if (v4 == 1)
  {
    id v8 = v2;
    AXPerformSafeBlock();
    id v5 = (id)[v8 safeValueForKey:@"notifyOnNextUserEvent"];
  }
  os_log_type_t v7 = v2;
  id v6 = v2;
  AXPerformSafeBlock();
}

Class __40__AXBackBoardGlue_sendUserEventOccurred__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Bkusereventtim.isa);
  sendUserEventOccurred_BKUserEventTimerClass = (uint64_t)result;
  return result;
}

uint64_t __40__AXBackBoardGlue_sendUserEventOccurred__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetTimer:*(unsigned int *)(a1 + 40) mode:8.0];
}

uint64_t __40__AXBackBoardGlue_sendUserEventOccurred__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) userEventOccurredOnDisplay:0];
}

+ (CGPoint)displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  if (!a4)
  {
    int v4 = [MEMORY[0x263F15920] server];
    id v5 = [v4 displays];
    id v6 = [v5 firstObject];
    [v6 displayId];
  }
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x3010000000;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  v14 = "";
  AXPerformSafeBlock();
  double v7 = v12[4];
  double v8 = v12[5];
  _Block_object_dispose(&v11, 8);
  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __67__AXBackBoardGlue_displayConvertFromCAScreen_withDisplayIntegerId___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    uint64_t result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertFromCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else {
    uint64_t result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertFromCAScreen:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  return result;
}

+ (CGPoint)displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  if (!a4)
  {
    uint64_t v4 = [MEMORY[0x263F15920] server];
    uint64_t v5 = [v4 displays];
    id v6 = [v5 firstObject];
    [v6 displayId];
  }
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x3010000000;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  v14 = "";
  AXPerformSafeBlock();
  double v7 = v12[4];
  double v8 = v12[5];
  _Block_object_dispose(&v11, 8);
  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __65__AXBackBoardGlue_displayConvertToCAScreen_withDisplayIntegerId___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    uint64_t result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertToCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else {
    uint64_t result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertToCAScreen:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
  return result;
}

+ (void)processExternalHIDEvent:(__IOHIDEvent *)a3
{
}

+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  id v9 = a4;
  id v13 = a5;
  id v14 = a7;
  id v10 = v14;
  id v11 = v13;
  id v12 = v9;
  AXPerformSafeBlock();
}

uint64_t __132__AXBackBoardGlue__applyExtendedHitTestInformationForCAScreenCoordinates_displayUUID_toPathAttributes_secureName_excludeContextIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)BKAccessibilityClass, "_applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 72), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setAssistiveTouchPid:(int)a3
{
  AssistiveTouchPID = a3;
  id v3 = +[AXBAccessibilityManager sharedManager];
  [v3 resetAssistiveTouchHitPort];
}

- (int)accessibilityAssistiveTouchPid
{
  return AssistiveTouchPID;
}

- (void)setLiveCaptionsPid:(int)a3
{
  LiveCaptionsPID = a3;
}

- (int)accessibilityLiveCaptionsPid
{
  return LiveCaptionsPID;
}

- (void)setFullKeyboardAccessDaemonPID:(int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = FKALogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_INFO, "FKA pid: %d", (uint8_t *)v5, 8u);
  }

  FullKeyboardAccessDaemonPID = a3;
}

- (int)accessibilityFullKeyboardAccessDaemonPid
{
  return FullKeyboardAccessDaemonPID;
}

- (void)setAccessibilityUIServerPid:(int)a3
{
  AccessibilityUIServerPID = a3;
  id v3 = +[AXBAccessibilityManager sharedManager];
  [v3 resetAccessibilityUIHitPort];

  +[AXBSpeakThisManager didUpdateAccessibilityUIServerPID];
}

- (int)accessibilityUIServerPid
{
  return AccessibilityUIServerPID;
}

- (void)setSiriViewServicePid:(int)a3
{
  SiriViewServicePID = a3;
}

- (int)hearingAidServerPid
{
  return HearingAidServerPID;
}

- (void)setHearingAidServerPid:(int)a3
{
  HearingAidServerPID = a3;
}

- (void)setLockScreenDimTimerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = objc_opt_class();

  [v4 setLockScreenDimTimerEnabled:v3];
}

+ (void)setLockScreenDimTimerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [NSClassFromString(&cfstr_Bkusereventtim.isa) safeValueForKey:@"sharedInstance"];
  [v4 _axSetTimerDisabled:!v3];
}

+ (int)inputUIPid
{
  id v2 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:@"com.apple.InputUI"];
  BOOL v3 = [MEMORY[0x263F64570] handleForPredicate:v2 error:0];
  int v4 = [v3 pid];

  return v4;
}

+ (int)accessibilityUIServerPid
{
  return AccessibilityUIServerPID;
}

+ (int)assistiveTouchPid
{
  return AssistiveTouchPID;
}

+ (int)liveCaptionsPid
{
  return LiveCaptionsPID;
}

+ (int)siriViewServicePid
{
  return SiriViewServicePID;
}

+ (BOOL)isDisplayBacklightOff
{
  return [(id)BKAccessibilityClass _isDisplayBacklightOff];
}

- (void)registerEventListener:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXBEventManager sharedManager];
  [v4 registerEventListener:v3];
}

- (void)zoomListenerRegistered
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"ZoomListenerRegistered" object:0];
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = +[AXBAccessibilityManager sharedManager];
  objc_msgSend(v11, "accessibilityConvertHostedViewFrame:fromContextId:displayId:", v6, v5, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = +[AXBAccessibilityManager sharedManager];
  objc_msgSend(v11, "accessibilityConvertHostedViewFrame:toContextId:displayId:", v6, v5, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = +[AXBAccessibilityManager sharedManager];
  objc_msgSend(v9, "accessibilityConvertHostedViewPoint:fromContextId:displayId:", v6, v5, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = +[AXBAccessibilityManager sharedManager];
  objc_msgSend(v9, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v6, v5, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)postEvent:(id)a3 systemEvent:(BOOL)a4 afterNamedTap:(id)a5 namedTaps:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[AXBEventManager sharedManager];
  [v12 postEvent:v11 systemEvent:v7 afterNamedTap:v10 namedTaps:v9];
}

- (unsigned)contextIdForDisplayPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = +[AXBEventManager sharedManager];
  unsigned int v6 = objc_msgSend(v5, "contextIdForPosition:displayId:", 0, x, y);

  return v6;
}

- (unsigned)contextIdHosterForContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[AXBEventManager sharedManager];
  LODWORD(v3) = [v4 contextIdHosterForContextId:v3];

  return v3;
}

- (void)userEventOccurred
{
  id v2 = objc_opt_class();

  [v2 sendUserEventOccurred];
}

- (void)setDisableSystemGestureRecognitionInEvents:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXBEventManager sharedManager];
  [v4 setDisableSystemGestureRecognitionInEvents:v3];
}

- (void)setCapsLockLightOn:(BOOL)a3
{
}

uint64_t __38__AXBackBoardGlue_setCapsLockLightOn___block_invoke(uint64_t a1)
{
  return [(id)BKAccessibilityClass _setCapsLockLightOn:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIsSpeakScreenHighlightVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = [(AXBackBoardGlue *)self accessibilityUIServerPid];
  uint64_t v5 = AXLogSpeakScreen();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 67109120;
      BOOL v8 = v3;
      _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Setting highlight state to visible: %i.", (uint8_t *)&v7, 8u);
    }
  }
  else if (v6)
  {
    int v7 = 67109120;
    BOOL v8 = v3;
    _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set highlight state to visible %i, but AXUIServer PID wasn't registered. Clearing highlight state.", (uint8_t *)&v7, 8u);
  }

  _AXSSpeakThisSetHighlightVisible();
}

void __29__AXBackBoardGlue_initialize__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241F5C000, log, OS_LOG_TYPE_ERROR, "Watch Mirroring was not disabled properly. Disable it now.", v1, 2u);
}

@end