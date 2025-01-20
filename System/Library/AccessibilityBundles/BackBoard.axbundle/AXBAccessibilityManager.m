@interface AXBAccessibilityManager
+ (id)sharedManager;
+ (void)initializeAccessibilityMonitor;
+ (void)updateAccessibilitySettings;
- (AXBAccessibilityManager)init;
- (BOOL)_accessibilityDisplayRequiresRotateForPoints:(id)a3;
- (BOOL)_accessibilityEventTapCallback:(id)a3;
- (BOOL)_accessibilityIsInternalInstall;
- (BOOL)_assistiveTouchCapture:(id)a3;
- (BOOL)_axMenuCapture:(id)a3;
- (BOOL)_gaxCapture:(id)a3;
- (BOOL)_handleItemChooserVisible:(unsigned int)a3;
- (BOOL)_inspectorCapture:(id)a3;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)_screenReaderCapture:(id)a3;
- (BOOL)_showingBootUI;
- (BOOL)accelerometerDisabled;
- (CGPoint)_accessibilityConvertHostedViewPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)_accessibilityViewPointFromHostedViewContext:(CGPoint)a3 displayId:(unsigned int)a4;
- (CGPoint)accessibilityConvertHostedViewPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)accessibilityConvertHostedViewPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)accessibilityConvertHostedViewFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)accessibilityConvertHostedViewFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (double)_processPassiveEventQueue;
- (id)_accessibilityAssistiveTouchApplication;
- (id)_accessibilityCarPlayApp;
- (id)_accessibilityCarPlayApplicationPid;
- (id)_accessibilityHitTest:(CGPoint)a3;
- (id)_accessibilityInputUIApplication;
- (id)_accessibilityLiveCaptionsApplication;
- (id)_accessibilityNativeFocusedApplication;
- (id)_accessibilitySpringBoardApplication;
- (id)_accessibilitySystemApp;
- (id)_accessibilitySystemAppApplicationBundleId;
- (id)_accessibilitySystemAppApplicationPid;
- (id)_accessibilityUIServerApplication;
- (id)_axElementForUID:(id)a3;
- (id)_commonEventRepForTouchEventWithType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7;
- (id)_deliveryManager;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 element:(id)a4;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)allJobLabels;
- (id)windowServerDisplayForDisplayId:(unsigned int)a3;
- (int)_accessibilityApplicationForContextId:(unsigned int)a3;
- (int)_handlePidForSpecialCases:(unsigned int)a3;
- (void)_accessibilityRepostEvent:(id)a3;
- (void)_accessibilitySystemApp;
- (void)_accessibilitySystemAppApplicationPid;
- (void)_iosAccessibilitySetValue:(id)a3 forAttribute:(int64_t)a4;
- (void)_releasePendingEvents:(double)a3;
- (void)_sendEventRep:(id)a3;
- (void)_sendFingerEvent:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7;
- (void)_sendPressFingerEvent:(BOOL)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7 secureName:(unsigned int)a8;
- (void)_sendStylusEvent:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7 flags:(unsigned int)a8 contextId:(unsigned int)a9;
- (void)_setDeviceOrientationCapability:(BOOL)a3;
- (void)_startPassiveResendThread;
- (void)_undoContextShiftedPoints:(id)a3;
- (void)_updateVoiceOverIgnoresTrackpad;
- (void)_userEventOccurred;
- (void)initializeAccessibility;
- (void)observerClientDied;
- (void)resetAccessibilityUIHitPort;
- (void)resetAssistiveTouchHitPort;
- (void)setAccelerometerDisabled:(BOOL)a3;
- (void)simulatePressAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4 withDelay:(float)a5 withForce:(double)a6 withSecureName:(unsigned int)a7;
@end

@implementation AXBAccessibilityManager

- (BOOL)accelerometerDisabled
{
  return self->_accelerometerDisabled;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_SharedManager;

  return v2;
}

+ (void)updateAccessibilitySettings
{
  if (_AXSApplicationAccessibilityEnabled() || _AXSAccessibilityNeedsMiniServer())
  {
    id v2 = +[AXBAccessibilityManager sharedManager];
    [v2 initializeAccessibility];
  }
  else
  {
    id v2 = +[AXBAccessibilityManager sharedManager];
    [v2 disableAccessibility];
  }
}

+ (void)initializeAccessibilityMonitor
{
  [a1 updateAccessibilitySettings];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F8B120];
  v5 = [MEMORY[0x263F08A48] mainQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__AXBAccessibilityManager_initializeAccessibilityMonitor__block_invoke;
  v9[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v9[4] = a1;
  id v6 = (id)[v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v9];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v8 = (const void *)objc_opt_class();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)updateGizmoAccessibilitySettings, @"NanoAccessibilityDefaultsChanged", 0, (CFNotificationSuspensionBehavior)0);
}

uint64_t __57__AXBAccessibilityManager_initializeAccessibilityMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAccessibilitySettings];
}

uint64_t __40__AXBAccessibilityManager_sharedManager__block_invoke()
{
  sharedManager_SharedManager = objc_alloc_init(AXBAccessibilityManager);

  return MEMORY[0x270F9A758]();
}

- (AXBAccessibilityManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXBAccessibilityManager;
  id v2 = [(AXBAccessibilityManager *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_resetAssistiveTouchHitPort name:*MEMORY[0x263F8B130] object:0];

    uint64_t v4 = [MEMORY[0x263F22938] sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__AXBAccessibilityManager_init__block_invoke;
    v8[3] = &unk_26510B378;
    v5 = v2;
    v9 = v5;
    [v4 registerUpdateBlock:v8 forRetrieveSelector:sel_voiceOverIgnoreTrackpad withListener:v5];

    [(AXBAccessibilityManager *)v5 _updateVoiceOverIgnoresTrackpad];
    id v6 = v5;
  }

  return v2;
}

uint64_t __31__AXBAccessibilityManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVoiceOverIgnoresTrackpad];
}

- (void)_updateVoiceOverIgnoresTrackpad
{
  id v3 = [MEMORY[0x263F22938] sharedInstance];
  self->_voiceOverIgnoresTrackpad = [v3 voiceOverIgnoreTrackpad];
}

- (id)_axElementForUID:(id)a3
{
  return (id)MEMORY[0x270F09938](a3.var0, a3.var1);
}

- (void)initializeAccessibility
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke;
  block[3] = &unk_26510B378;
  block[4] = self;
  if (initializeAccessibility_onceToken != -1) {
    dispatch_once(&initializeAccessibility_onceToken, block);
  }
}

void __50__AXBAccessibilityManager_initializeAccessibility__block_invoke(uint64_t a1)
{
  _AXBValidateMethods();
  uint64_t v2 = [MEMORY[0x263F21688] sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(*(void *)(a1 + 32) + 8) setSystemWideServer:1];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_2;
  v20[3] = &unk_26510B3A0;
  objc_copyWeak(&v21, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setAttributeCallback:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_3;
  v18[3] = &unk_26510B3C8;
  objc_copyWeak(&v19, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setParameterizedAttributeCallback:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_4;
  v16[3] = &unk_26510B3F0;
  objc_copyWeak(&v17, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setSetAttributeCallback:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_5;
  v14[3] = &unk_26510B418;
  objc_copyWeak(&v15, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setPerformActionCallback:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_6;
  v12[3] = &unk_26510B440;
  objc_copyWeak(&v13, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setClientObserverCallback:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_7;
  v10[3] = &unk_26510B468;
  objc_copyWeak(&v11, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setApplicationElementCallback:v10];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_8;
  v8 = &unk_26510B490;
  objc_copyWeak(&v9, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setHitTestCallback:&v5];
  _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "start", v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = objc_msgSend(WeakRetained, "_axElementForUID:", a2, a3);

  id v10 = objc_loadWeakRetained(v7);
  id v11 = [v10 _iosAccessibilityAttributeValue:a4 element:v9];

  return v11;
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [WeakRetained _iosAccessibilityAttributeValue:a4 forParameter:v7];

  return v9;
}

void __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _iosAccessibilitySetValue:v7 forAttribute:a4];
}

uint64_t __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  v8 = (id *)(a1 + 32);
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained(v8);
  uint64_t v11 = [WeakRetained _iosAccessibilityPerformAction:a4 withValue:v9 fencePort:a6];

  return v11;
}

void __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained observerClientDied];
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  return WeakRetained;
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_8(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = objc_msgSend(WeakRetained, "_accessibilityHitTest:", a2, a3);

  return v6;
}

- (BOOL)_showingBootUI
{
  uint64_t v2 = [NSClassFromString(&cfstr_Bkbootuipresen.isa) safeValueForKey:@"sharedInstance"];
  char v3 = [v2 safeBoolForKey:@"isShowingBootUI"];

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3
{
  if ([(AXBAccessibilityManager *)self _showingBootUI])
  {
    char v3 = [NSClassFromString(&cfstr_Bkbootuipresen.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v4 = [v3 safeValueForKey:@"_overlay"];
    NSClassFromString(&cfstr_Bkdisplayrende.isa);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 safeValueForKey:@"_puiProgressWindow"];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)resetAccessibilityUIHitPort
{
  AccessibilityUITouchPort = 0;
}

- (void)resetAssistiveTouchHitPort
{
  AssistiveTouchPort = 0;
}

- (void)observerClientDied
{
  char v3 = [NSNumber numberWithFloat:0.0];
  [(AXBAccessibilityManager *)self _iosAccessibilitySetValue:v3 forAttribute:1003];

  [(AXBAccessibilityManager *)self setAccelerometerDisabled:0];
  if ((_SBAXCaptureMode & 1) != 0 && !_AXSVoiceOverTouchEnabled())
  {
    unsetCaptureMode(1);
    [(AXBAccessibilityManager *)self _setDeviceOrientationCapability:1];
  }
  if ((_SBAXCaptureMode & 2) != 0 && !_AXSAssistiveTouchEnabled()) {
    unsetCaptureMode(2);
  }
  if ((_SBAXCaptureMode & 8) != 0 && !_AXSGuidedAccessEnabled()) {
    unsetCaptureMode(8);
  }
  if ((_SBAXCaptureMode & 0x10) != 0)
  {
    unsetCaptureMode(16);
  }
}

- (void)_setDeviceOrientationCapability:(BOOL)a3
{
  _SBAXDeviceOrientationCapabilityEnabled = a3;
}

- (void)_accessibilityRepostEvent:(id)a3
{
  if (a3) {
    AXBSendEventRepresentationUntapped(a3);
  }
}

- (int)_accessibilityApplicationForContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [MEMORY[0x263F15920] serverIfRunning];
  uint64_t v6 = [v5 taskNamePortOfContextId:v3];

  if (!v6) {
    return 0;
  }
  +[AXBackBoardGlue hidClientConnectionManager];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  if (!v11[3]
    || (int v8 = [(id)IOHIDEventSystemConnectionGetAttribute() intValue],
        CFRelease((CFTypeRef)v11[3]),
        v8 <= 0))
  {
    int v8 = [(AXBAccessibilityManager *)self _handlePidForSpecialCases:v6];
  }

  _Block_object_dispose(&v10, 8);
  return v8;
}

uint64_t __65__AXBAccessibilityManager__accessibilityApplicationForContextId___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) copyClientForTaskPort:*(unsigned int *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_handlePidForSpecialCases:(unsigned int)a3
{
  if (!_AXSAssistiveTouchEnabled()) {
    goto LABEL_9;
  }
  int v5 = AssistiveTouchPort;
  if (!AssistiveTouchPort)
  {
    bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.assistivetouchd", (mach_port_t *)&AssistiveTouchPort);
    int v5 = AssistiveTouchPort;
  }
  if (v5 != a3
    || (int result = +[AXBackBoardGlue assistiveTouchPid]) == 0)
  {
    if (!+[AXBackBoardGlue accessibilityUIServerPid]) {
      goto LABEL_13;
    }
LABEL_9:
    int v7 = AccessibilityUITouchPort;
    if (!AccessibilityUITouchPort)
    {
      bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.accessibility.AccessibilityUIServer.gsEvents", (mach_port_t *)&AccessibilityUITouchPort);
      int v7 = AccessibilityUITouchPort;
    }
    if (v7 == a3)
    {
      return +[AXBackBoardGlue accessibilityUIServerPid];
    }
    else
    {
LABEL_13:
      if ([(AXBAccessibilityManager *)self _showingBootUI])
      {
        return 0;
      }
      else
      {
        int v8 = [(AXBAccessibilityManager *)self _accessibilitySystemAppApplicationPid];
        int v9 = [v8 intValue];

        return v9;
      }
    }
  }
  return result;
}

- (BOOL)_accessibilityIsInternalInstall
{
  if (_accessibilityIsInternalInstall_onceToken != -1) {
    dispatch_once(&_accessibilityIsInternalInstall_onceToken, &__block_literal_global_329);
  }
  return _accessibilityIsInternalInstall_IsInternal;
}

uint64_t __58__AXBAccessibilityManager__accessibilityIsInternalInstall__block_invoke()
{
  uint64_t result = AXIsInternalInstall();
  _accessibilityIsInternalInstall_IsInternal = result;
  return result;
}

- (id)allJobLabels
{
  uint64_t v2 = (_launch_data *)MEMORY[0x245644140]("GetJobs", a2);
  uint64_t v3 = launch_msg(v2);
  MEMORY[0x245644120](v2);
  if (v3)
  {
    if (launch_data_get_type(v3) == LAUNCH_DATA_DICTIONARY)
    {
      uint64_t v4 = [MEMORY[0x263EFF980] array];
      launch_data_dict_iterate(v3, (launch_data_dict_iterator_t)copyKeysToArray, v4);
    }
    else
    {
      uint64_t v4 = 0;
    }
    MEMORY[0x245644120](v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_accessibilitySystemApp
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSClassFromString(&cfstr_Bksystemshells.isa) safeValueForKey:@"sharedInstance"];
  uint64_t v3 = [v2 safeArrayForKey:@"systemApplications"];
  uint64_t v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_340);

  if ((unint64_t)[v4 count] < 2)
  {
    if ([v4 count]) {
      goto LABEL_9;
    }
    uint64_t v6 = AXLogSystemApp();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXBAccessibilityManager _accessibilitySystemApp](v6);
    }

    int v7 = (void *)MEMORY[0x263EFF8C0];
    int v5 = [NSClassFromString(&cfstr_Bksystemshells.isa) safeValueForKey:@"sharedInstance"];
    int v8 = [v5 safeValueForKey:@"primarySystemShell"];
    uint64_t v9 = objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 1, v8);

    uint64_t v4 = (void *)v9;
  }
  else
  {
    int v5 = AXLogSystemApp();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Found more than one non-CarPlay system app, returning first object: %@", buf, 0xCu);
    }
  }

LABEL_9:
  uint64_t v10 = [v4 firstObject];
  uint64_t v11 = AXLogSystemApp();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_241F5C000, v11, OS_LOG_TYPE_INFO, "Determined system app: %@", buf, 0xCu);
  }

  return v10;
}

uint64_t __50__AXBAccessibilityManager__accessibilitySystemApp__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 safeStringForKey:@"bundleIdentifier"];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F21310]] ^ 1;

  return v3;
}

- (id)_accessibilityCarPlayApp
{
  uint64_t v2 = [NSClassFromString(&cfstr_Bksystemshells.isa) safeValueForKey:@"sharedInstance"];
  uint64_t v3 = [v2 safeArrayForKey:@"systemApplications"];
  uint64_t v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_349);
  int v5 = [v4 firstObject];

  return v5;
}

uint64_t __51__AXBAccessibilityManager__accessibilityCarPlayApp__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 safeStringForKey:@"bundleIdentifier"];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F21310]];

  return v3;
}

- (id)_accessibilitySystemAppApplicationBundleId
{
  uint64_t v2 = [(AXBAccessibilityManager *)self _accessibilitySystemApp];
  uint64_t v3 = [v2 safeValueForKey:@"bundleIdentifier"];

  return v3;
}

- (id)_accessibilityCarPlayApplicationPid
{
  uint64_t v2 = [(AXBAccessibilityManager *)self _accessibilityCarPlayApp];
  uint64_t v3 = [v2 safeValueForKey:@"pid"];
  uint64_t v4 = [v3 unsignedIntValue];

  if ((int)v4 < 1)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [NSNumber numberWithInt:v4];
  }

  return v5;
}

- (id)_accessibilitySystemAppApplicationPid
{
  uint64_t v2 = [(AXBAccessibilityManager *)self _accessibilitySystemApp];
  uint64_t v3 = [v2 safeValueForKey:@"pid"];
  uint64_t v4 = [v3 unsignedIntValue];

  if ((int)v4 <= 0)
  {
    uint64_t v6 = AXLogSystemApp();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AXBAccessibilityManager *)(uint64_t)v2 _accessibilitySystemAppApplicationPid];
    }

    int v5 = 0;
  }
  else
  {
    int v5 = [NSNumber numberWithInt:v4];
  }

  return v5;
}

- (id)_accessibilityUIServerApplication
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = +[AXBackBoardGlue accessibilityUIServerPid];

  return (id)[v2 numberWithInt:v3];
}

- (id)_accessibilityAssistiveTouchApplication
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = +[AXBackBoardGlue assistiveTouchPid];

  return (id)[v2 numberWithInt:v3];
}

- (id)_accessibilityLiveCaptionsApplication
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = +[AXBackBoardGlue liveCaptionsPid];

  return (id)[v2 numberWithInt:v3];
}

- (id)_accessibilityInputUIApplication
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = +[AXBackBoardGlue inputUIPid];

  return (id)[v2 numberWithInt:v3];
}

- (id)_deliveryManager
{
  uint64_t v2 = [NSClassFromString(&cfstr_Bkhidsystemint.isa) safeValueForKey:@"sharedInstance"];
  uint64_t v3 = [v2 safeValueForKey:@"deliveryManager"];

  return v3;
}

- (id)_accessibilityNativeFocusedApplication
{
  if (_AXSAutomationEnabled() || AXRequestingClient() == 11)
  {
    uint64_t v3 = NSNumber;
    uint64_t v4 = [MEMORY[0x263F22968] server];
    int v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "nativeFocusedApplication"));
  }
  else
  {
    int v7 = [(AXBAccessibilityManager *)self _deliveryManager];
    if (_accessibilityNativeFocusedApplication_onceToken != -1) {
      dispatch_once(&_accessibilityNativeFocusedApplication_onceToken, &__block_literal_global_358);
    }
    int v8 = objc_opt_new();
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    id v12 = v7;
    id v13 = v8;
    AXPerformSafeBlock();
    id v9 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    uint64_t v10 = [v9 anyObject];

    uint64_t v11 = [v10 safeUnsignedIntForKey:@"pid"];
    int v5 = [NSNumber numberWithInt:v11];
  }

  return v5;
}

void __65__AXBAccessibilityManager__accessibilityNativeFocusedApplication__block_invoke()
{
  id v1 = [MEMORY[0x263F228A8] keyRepresentationWithType:10];
  v0 = [v1 keyInfo];
  [v0 setKeyCode:4];

  _accessibilityNativeFocusedApplication_DummyKeyboardEventRef = [v1 newHIDEventRef];
}

uint64_t __65__AXBAccessibilityManager__accessibilityNativeFocusedApplication__block_invoke_361(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) destinationsForEvent:_accessibilityNativeFocusedApplication_DummyKeyboardEventRef sender:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilitySpringBoardApplication
{
  if (_AXSClarityBoardEnabled()) {
    goto LABEL_2;
  }
  uint64_t v3 = +[AXBEventManager sharedManager];
  uint64_t v4 = [v3 systemAppPid];

  if ((int)v4 <= 0)
  {
    NSLog(&cfstr_AccessibilityS.isa);
LABEL_2:
    uint64_t v2 = 0;
    goto LABEL_5;
  }
  uint64_t v2 = [NSNumber numberWithInt:v4];
LABEL_5:

  return v2;
}

- (void)_iosAccessibilitySetValue:(id)a3 forAttribute:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1002:
      id v8 = v6;
      if ([v6 BOOLValue]) {
        setCaptureMode(32);
      }
      else {
        unsetCaptureMode(32);
      }
      break;
    case 1003:
      id v9 = v6;
      [v6 floatValue];
      id v6 = v9;
      *(double *)&_SBAXPassiveListenDelay = v7;
      goto LABEL_10;
    case 1004:
      id v8 = v6;
      -[AXBAccessibilityManager setAccelerometerDisabled:](self, "setAccelerometerDisabled:", [v6 BOOLValue]);
      break;
    default:
      goto LABEL_10;
  }
  id v6 = v8;
LABEL_10:
}

- (void)_sendEventRep:(id)a3
{
  id v3 = a3;
  if (_sendEventRep__registerOnce != -1) {
    dispatch_once(&_sendEventRep__registerOnce, &__block_literal_global_367);
  }
  uint64_t v4 = _sendEventRep__DifferentQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AXBAccessibilityManager__sendEventRep___block_invoke_2;
  block[3] = &unk_26510B378;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __41__AXBAccessibilityManager__sendEventRep___block_invoke()
{
  _sendEventRep__DifferentQueue = (uint64_t)dispatch_queue_create("ax-send-event-queue", 0);

  return MEMORY[0x270F9A758]();
}

void __41__AXBAccessibilityManager__sendEventRep___block_invoke_2(uint64_t a1)
{
}

- (id)_commonEventRepForTouchEventWithType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a4.y;
  double x = a4.x;
  uint64_t v12 = *(void *)&a3;
  if (!a7)
  {
    uint64_t v14 = +[AXBEventManager sharedManager];
    uint64_t v7 = objc_msgSend(v14, "contextIdForPosition:displayId:", 0, x, y);
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x263F228A8], "touchRepresentationWithHandType:location:", v12, x, y);
  uint64_t v16 = [v15 handInfo];
  id v17 = [v16 paths];
  v18 = [v17 firstPath];
  [v18 setPathWindowContextID:v7];

  objc_msgSend(v15, "setPid:", -[AXBAccessibilityManager _accessibilityApplicationForContextId:](self, "_accessibilityApplicationForContextId:", v7));
  -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v7, 0, x, y);
  double v20 = v19;
  double v22 = v21;
  v23 = [v15 handInfo];
  v24 = [v23 paths];
  v25 = [v24 firstPath];
  objc_msgSend(v25, "setPathLocation:", v20, v22);

  v26 = [v15 handInfo];
  v27 = [v26 paths];
  v28 = [v27 firstPath];
  [v28 setTransducerType:2];

  [v15 setContextId:v7];
  objc_msgSend(v15, "setAdditionalFlags:", objc_msgSend(v15, "additionalFlags") | a6);
  v30 = [v15 handInfo];
  v31 = [v30 paths];
  v32 = [v31 firstPath];
  float v29 = a5;
  *(float *)&double v33 = v29;
  [v32 setOrbValue:v33];

  return v15;
}

- (void)_sendFingerEvent:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7
{
  -[AXBAccessibilityManager _commonEventRepForTouchEventWithType:location:force:flags:contextId:](self, "_commonEventRepForTouchEventWithType:location:force:flags:contextId:", *(void *)&a3, *(void *)&a6, *(void *)&a7, a4.x, a4.y, a5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v11 handInfo];
  id v9 = [v8 paths];
  uint64_t v10 = [v9 firstPath];
  [v10 setTransducerType:3];

  [(AXBAccessibilityManager *)self _sendEventRep:v11];
}

- (void)_sendStylusEvent:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7 flags:(unsigned int)a8 contextId:(unsigned int)a9
{
  -[AXBAccessibilityManager _commonEventRepForTouchEventWithType:location:force:flags:contextId:](self, "_commonEventRepForTouchEventWithType:location:force:flags:contextId:", *(void *)&a3, *(void *)&a8, *(void *)&a9, a4.x, a4.y, a5);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v23 handInfo];
  id v13 = [v12 paths];
  uint64_t v14 = [v13 firstPath];
  [v14 setTransducerType:0];

  uint64_t v15 = [v23 handInfo];
  uint64_t v16 = [v15 paths];
  id v17 = [v16 firstPath];
  *(float *)&a6 = a6;
  LODWORD(v18) = LODWORD(a6);
  [v17 setAltitude:v18];

  double v19 = [v23 handInfo];
  double v20 = [v19 paths];
  double v21 = [v20 firstPath];
  *(float *)&a7 = a7;
  LODWORD(v22) = LODWORD(a7);
  [v21 setAzimuth:v22];

  [(AXBAccessibilityManager *)self _sendEventRep:v23];
}

- (CGRect)accessibilityConvertHostedViewFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    uint64_t v9 = *(void *)&a5;
    uint64_t v10 = *(void *)&a4;
    double MaxX = CGRectGetMaxX(a3);
    v22.origin.double x = x;
    v22.origin.double y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    double MaxY = CGRectGetMaxY(v22);
    double v13 = AXConvertFromContextHostedPoint(v10, v9, x, y);
    double v15 = v14;
    double v16 = AXConvertFromContextHostedPoint(v10, v9, MaxX, MaxY);
    if (v16 >= v13) {
      double x = v13;
    }
    else {
      double x = v16;
    }
    if (v16 < v13) {
      double v16 = v13;
    }
    if (v17 >= v15) {
      double y = v15;
    }
    else {
      double y = v17;
    }
    if (v17 < v15) {
      double v17 = v15;
    }
    double width = v16 - x;
    double height = v17 - y;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGPoint)_accessibilityConvertHostedViewPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  if (a4) {
    double v5 = AXConvertFromContextHostedPoint(*(uint64_t *)&a4, *(uint64_t *)&a5, a3.x, a3.y);
  }
  else {
    -[AXBAccessibilityManager _accessibilityViewPointFromHostedViewContext:displayId:](self, "_accessibilityViewPointFromHostedViewContext:displayId:", *(void *)&a5, a3.x, a3.y);
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)_accessibilityViewPointFromHostedViewContext:(CGPoint)a3 displayId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  double v7 = AXRotateToScreen();
  double v9 = v8;
  uint64_t v10 = +[AXBEventManager sharedManager];
  id v11 = [v10 windowServer];
  uint64_t v12 = objc_msgSend(v11, "contextIdAtPosition:", v7, v9);

  double v13 = AXConvertFromContextHostedPoint(v12, v4, x, y);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)accessibilityConvertHostedViewFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v26);
  -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v6, v5, MinX, MinY);
  double v17 = v16;
  double v19 = v18;
  -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v6, v5, MaxX, MaxY);
  double v22 = vabdd_f64(v20, v17);
  double v23 = vabdd_f64(v21, v19);
  if (v20 >= v17) {
    double v20 = v17;
  }
  if (v21 >= v19) {
    double v21 = v19;
  }
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGPoint)accessibilityConvertHostedViewPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  if (!a4)
  {
    double v9 = +[AXBEventManager sharedManager];
    uint64_t v10 = [v9 windowServer];

    uint64_t v6 = objc_msgSend(v10, "contextIdAtPosition:", x, y);
  }

  double v11 = AXConvertFromContextHostedPoint(v6, v5, x, y);
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)accessibilityConvertHostedViewPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  if (!a4)
  {
    double v9 = +[AXBEventManager sharedManager];
    uint64_t v10 = [v9 windowServer];

    uint64_t v6 = objc_msgSend(v10, "contextIdAtPosition:", x, y);
  }
  double v11 = +[AXBEventManager sharedManager];
  objc_msgSend(v11, "convertPoint:toContextId:displayId:", v6, v5, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)_sendPressFingerEvent:(BOOL)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7 secureName:(unsigned int)a8
{
  LODWORD(v8) = a8;
  uint64_t v9 = *(void *)&a7;
  double y = a4.y;
  double x = a4.x;
  BOOL v14 = a3;
  if (!a7)
  {
    double v15 = +[AXBEventManager sharedManager];
    uint64_t v9 = objc_msgSend(v15, "contextIdForPosition:displayId:", 0, x, y);
  }
  if (v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 6;
  }
  if (v14) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v8;
  }
  objc_msgSend(MEMORY[0x263F228A8], "touchRepresentationWithHandType:location:", v16, x, y);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  [v28 setSenderID:0x8000000817319380];
  double v17 = [v28 handInfo];
  double v18 = [v17 paths];
  double v19 = [v18 firstPath];
  [v19 setPathWindowContextID:v9];

  double v20 = [v28 handInfo];
  double v21 = [v20 paths];
  double v22 = [v21 firstPath];
  [v22 setTransducerType:2];

  objc_msgSend(v28, "setAdditionalFlags:", objc_msgSend(v28, "additionalFlags") | a6);
  [v28 setContextId:v9];
  CGRect v24 = [v28 handInfo];
  CGRect v25 = [v24 paths];
  CGRect v26 = [v25 firstPath];
  float v23 = a5;
  *(float *)&double v27 = v23;
  [v26 setOrbValue:v27];

  [v28 setSecureName:v8];
  if (([v28 additionalFlags] & 0x1000000) != 0) {
    AXBSendEventRepresentationUntapped(v28);
  }
}

- (void)simulatePressAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4 withDelay:(float)a5 withForce:(double)a6 withSecureName:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  -[AXBAccessibilityManager _sendPressFingerEvent:location:force:flags:contextId:secureName:](self, "_sendPressFingerEvent:location:force:flags:contextId:secureName:", 1, 0x1000000, *(void *)&a4, *(void *)&a7, a3.x, a3.y, a6);
  if (a5 > 0.0) {
    [MEMORY[0x263F08B88] sleepForTimeInterval:a5];
  }

  -[AXBAccessibilityManager _sendPressFingerEvent:location:force:flags:contextId:secureName:](self, "_sendPressFingerEvent:location:force:flags:contextId:secureName:", 0, 0x1000000, v9, v7, x, y, 0.0);
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 element:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0;
  if (a3 > 2000)
  {
    switch(a3)
    {
      case 2001:
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [v6 accessibilityLabel];
          goto LABEL_23;
        }
        break;
      case 2004:
LABEL_21:
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v7 = 0;
          goto LABEL_24;
        }
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "accessibilityTraits"));
LABEL_23:
        uint64_t v7 = (void *)v8;
        goto LABEL_24;
      case 2006:
        break;
      default:
        goto LABEL_24;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v6 accessibilityValue];
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  switch(a3)
  {
    case 1000:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilitySpringBoardApplication];
      goto LABEL_23;
    case 1001:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilitySystemAppApplicationPid];
      goto LABEL_23;
    case 1002:
      uint64_t v8 = [NSNumber numberWithBool:(_SBAXCaptureMode >> 5) & 1];
      goto LABEL_23;
    case 1003:
      HIDWORD(v9) = HIDWORD(_SBAXPassiveListenDelay);
      *(float *)&double v9 = *(double *)&_SBAXPassiveListenDelay;
      uint64_t v8 = [NSNumber numberWithFloat:v9];
      goto LABEL_23;
    case 1005:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilityUIServerApplication];
      goto LABEL_23;
    case 1006:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilityAssistiveTouchApplication];
      goto LABEL_23;
    case 1007:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilityNativeFocusedApplication];
      goto LABEL_23;
    case 1009:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilityCarPlayApplicationPid];
      goto LABEL_23;
    case 1010:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilityLiveCaptionsApplication];
      goto LABEL_23;
    case 1011:
      uint64_t v8 = [(AXBAccessibilityManager *)self _accessibilityInputUIApplication];
      goto LABEL_23;
    default:
      break;
  }
LABEL_24:

  return v7;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  switch(a3)
  {
    case 5001:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        -[AXBAccessibilityManager _releasePendingEvents:](self, "_releasePendingEvents:");
        goto LABEL_43;
      }
      BOOL v9 = 0;
      break;
    case 5002:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v13 = [MEMORY[0x263F228A8] representationWithData:v8];
        [(AXBAccessibilityManager *)self _accessibilityRepostEvent:v13];
LABEL_20:

LABEL_43:
        BOOL v9 = 1;
      }
      else
      {
        BOOL v9 = 1;
        _AXLogWithFacility();
      }
      break;
    case 5003:
      setCaptureMode([v7 intValue]);
      goto LABEL_43;
    case 5004:
      buf[0] = 0;
      objc_opt_class();
      BOOL v14 = __UIAccessibilityCastAsClass();
      uint64_t v15 = [v14 count];

      if (v15 != 3) {
        goto LABEL_43;
      }
      uint64_t v16 = [v8 objectAtIndex:0];
      [v16 pointValue];
      double v18 = v17;
      double v20 = v19;

      BOOL v9 = 1;
      double v21 = [v8 objectAtIndex:1];
      [v21 floatValue];
      double v23 = v22;

      CGRect v24 = [v8 objectAtIndex:2];
      uint64_t v25 = [v24 unsignedIntValue];

      -[AXBAccessibilityManager _sendFingerEvent:location:force:flags:contextId:](self, "_sendFingerEvent:location:force:flags:contextId:", 1, 0, v25, v18, v20, v23);
      break;
    case 5005:
      buf[0] = 0;
      objc_opt_class();
      CGRect v26 = __UIAccessibilityCastAsClass();
      uint64_t v27 = [v26 count];

      if (v27 != 3) {
        goto LABEL_43;
      }
      id v28 = [v8 objectAtIndex:0];
      [v28 pointValue];
      double v30 = v29;
      double v32 = v31;

      double v33 = [v8 objectAtIndex:1];
      [v33 floatValue];
      double v35 = v34;

      v36 = [v8 objectAtIndex:2];
      uint64_t v37 = [v36 unsignedIntValue];

      v38 = self;
      uint64_t v39 = 2;
      double v40 = v30;
      double v41 = v32;
      double v42 = v35;
      goto LABEL_15;
    case 5006:
      buf[0] = 0;
      objc_opt_class();
      v43 = __UIAccessibilityCastAsClass();
      uint64_t v44 = [v43 count];

      if (v44 != 2) {
        goto LABEL_43;
      }
      v45 = [v8 objectAtIndex:0];
      [v45 pointValue];
      double v47 = v46;
      double v49 = v48;

      v50 = [v8 objectAtIndex:1];
      uint64_t v37 = [v50 unsignedIntValue];

      double v42 = 0.0;
      v38 = self;
      uint64_t v39 = 6;
      double v40 = v47;
      double v41 = v49;
LABEL_15:
      -[AXBAccessibilityManager _sendFingerEvent:location:force:flags:contextId:](v38, "_sendFingerEvent:location:force:flags:contextId:", v39, 0, v37, v40, v41, v42);
      goto LABEL_31;
    case 5007:
      [(AXBAccessibilityManager *)self _sendCancelTouchEvent];
      goto LABEL_43;
    case 5008:
      buf[0] = 0;
      objc_opt_class();
      double v13 = __UIAccessibilityCastAsClass();
      v51 = [v13 objectForKey:*MEMORY[0x263F21B08]];
      [v51 pointValue];
      double v53 = v52;
      double v55 = v54;

      v56 = [v13 objectForKey:*MEMORY[0x263F21B00]];
      v57 = [v13 objectForKey:*MEMORY[0x263F21B18]];
      v58 = [v13 objectForKey:*MEMORY[0x263F21AF8]];
      v59 = [v13 objectForKey:*MEMORY[0x263F21B10]];
      v60 = AXLogCommon();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v131 = v8;
        _os_log_impl(&dword_241F5C000, v60, OS_LOG_TYPE_INFO, "Simulating press: %@", buf, 0xCu);
      }

      uint64_t v61 = [v57 unsignedIntValue];
      [v58 floatValue];
      int v63 = v62;
      [v56 floatValue];
      double v65 = v64;
      uint64_t v66 = [v59 unsignedIntValue];
      LODWORD(v67) = v63;
      -[AXBAccessibilityManager simulatePressAtPoint:withContextId:withDelay:withForce:withSecureName:](self, "simulatePressAtPoint:withContextId:withDelay:withForce:withSecureName:", v61, v66, v53, v55, v67, v65);

      goto LABEL_20;
    case 5009:
      -[AXBAccessibilityManager _setDeviceOrientationCapability:](self, "_setDeviceOrientationCapability:", [v7 BOOLValue]);
      goto LABEL_43;
    case 5010:
      uint64_t v10 = [MEMORY[0x263F229C0] sharedInstance];
      [v10 userEventOccurred];
LABEL_42:

      goto LABEL_43;
    case 5011:
    case 5012:
    case 5013:
    case 5014:
    case 5015:
    case 5016:
    case 5020:
    case 5021:
      break;
    case 5017:
      buf[0] = 0;
      objc_opt_class();
      v68 = __UIAccessibilityCastAsClass();
      uint64_t v69 = [v68 count];

      if (v69 != 5) {
        goto LABEL_43;
      }
      id v70 = v8;
      v71 = [v70 objectAtIndexedSubscript:0];
      [v71 pointValue];
      double v73 = v72;
      double v75 = v74;

      v76 = [v70 objectAtIndexedSubscript:1];
      [v76 floatValue];
      double v78 = v77;

      v79 = [v70 objectAtIndexedSubscript:2];
      [v79 floatValue];
      double v81 = v80;

      v82 = [v70 objectAtIndexedSubscript:3];
      [v82 floatValue];
      double v84 = v83;

      v85 = [v70 objectAtIndexedSubscript:4];

      uint64_t v86 = [v85 unsignedIntValue];
      v87 = self;
      uint64_t v88 = 1;
      goto LABEL_27;
    case 5018:
      buf[0] = 0;
      objc_opt_class();
      v89 = __UIAccessibilityCastAsClass();
      uint64_t v90 = [v89 count];

      if (v90 != 5) {
        goto LABEL_43;
      }
      id v91 = v8;
      v92 = [v91 objectAtIndexedSubscript:0];
      [v92 pointValue];
      double v73 = v93;
      double v75 = v94;

      v95 = [v91 objectAtIndexedSubscript:1];
      [v95 floatValue];
      double v78 = v96;

      v97 = [v91 objectAtIndexedSubscript:2];
      [v97 floatValue];
      double v81 = v98;

      v99 = [v91 objectAtIndexedSubscript:3];
      [v99 floatValue];
      double v84 = v100;

      v101 = [v91 objectAtIndexedSubscript:4];

      uint64_t v86 = [v101 unsignedIntValue];
      v87 = self;
      uint64_t v88 = 2;
LABEL_27:
      double v102 = v73;
      double v103 = v75;
      double v104 = v78;
      double v105 = v81;
      double v106 = v84;
      goto LABEL_30;
    case 5019:
      buf[0] = 0;
      objc_opt_class();
      v107 = __UIAccessibilityCastAsClass();
      uint64_t v108 = [v107 count];

      if (v108 != 2) {
        goto LABEL_43;
      }
      id v109 = v8;
      v110 = [v109 objectAtIndexedSubscript:0];
      [v110 pointValue];
      double v112 = v111;
      double v114 = v113;

      v115 = [v109 objectAtIndexedSubscript:1];

      uint64_t v86 = [v115 unsignedIntValue];
      double v104 = 0.0;
      double v105 = 0.0;
      double v106 = 0.0;
      v87 = self;
      uint64_t v88 = 6;
      double v102 = v112;
      double v103 = v114;
LABEL_30:
      -[AXBAccessibilityManager _sendStylusEvent:location:force:altitude:azimuth:flags:contextId:](v87, "_sendStylusEvent:location:force:altitude:azimuth:flags:contextId:", v88, 0, v86, v102, v103, v104, v105, v106);
LABEL_31:
      BOOL v9 = 1;
      break;
    case 5022:
      unsetCaptureMode([v7 intValue]);
      goto LABEL_43;
    default:
      switch(a3)
      {
        case 5100:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1218];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1219;
          goto LABEL_41;
        case 5101:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1032];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1033;
          goto LABEL_41;
        case 5102:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1200];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1201;
          goto LABEL_41;
        case 5103:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1202];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1203;
          goto LABEL_41;
        case 5104:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1204];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1205;
          goto LABEL_41;
        case 5105:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1206];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1207;
          goto LABEL_41;
        case 5106:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1216];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1217;
          goto LABEL_41;
        case 5107:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1222];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1223;
          goto LABEL_41;
        case 5108:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1224];
          double v11 = (void *)MEMORY[0x263F228A8];
          uint64_t v12 = 1224;
LABEL_41:
          v116 = [v11 buttonRepresentationWithType:v12];
          v117 = [MEMORY[0x263F228B0] sharedManager];
          [v117 sendHIDSystemEvent:v10 repostCreatorHIDEvent:0 senderID:0x8000000817319375];
          [v117 sendHIDSystemEvent:v116 repostCreatorHIDEvent:0 senderID:0x8000000817319375];

          goto LABEL_42;
        case 5109:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1216];
          v119 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1217];
          v120 = [MEMORY[0x263F228B0] sharedManager];
          [v120 sendHIDSystemEvent:v10 repostCreatorHIDEvent:0 senderID:0x8000000817319375];
          v128 = v120;
          v129 = v119;
          id v121 = v119;
          id v122 = v120;
          AXPerformBlockOnMainThreadAfterDelay();

          v123 = v128;
          goto LABEL_47;
        case 5110:
          uint64_t v10 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1222];
          v124 = [MEMORY[0x263F228A8] buttonRepresentationWithType:1223];
          v125 = [MEMORY[0x263F228B0] sharedManager];
          [v125 sendHIDSystemEvent:v10 repostCreatorHIDEvent:0 senderID:0x8000000817319375];
          v126 = v125;
          v127 = v124;
          id v121 = v124;
          id v122 = v125;
          AXPerformBlockOnMainThreadAfterDelay();

          v123 = v126;
LABEL_47:

          goto LABEL_42;
        default:
          goto LABEL_44;
      }
  }
LABEL_44:

  return v9;
}

uint64_t __78__AXBAccessibilityManager__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendHIDSystemEvent:*(void *)(a1 + 40) repostCreatorHIDEvent:0 senderID:0x8000000817319375];
}

uint64_t __78__AXBAccessibilityManager__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendHIDSystemEvent:*(void *)(a1 + 40) repostCreatorHIDEvent:0 senderID:0x8000000817319375];
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = 0;
  switch(a3)
  {
    case 91500:
      uint64_t v8 = (void *)[objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
      BOOL v9 = [v7 objectForKey:@"point"];
      [v9 pointValue];

      uint64_t v10 = [v7 objectForKey:@"displayId"];
      uint64_t v11 = [v10 unsignedIntValue];

      id v12 = [(AXBAccessibilityManager *)self windowServerDisplayForDisplayId:v11];
      uint64_t v13 = [v12 contextIdAtPosition:AXRotateToScreen()];
      uint64_t v14 = [(AXBAccessibilityManager *)self _accessibilityApplicationForContextId:v13];
      uint64_t v15 = [NSNumber numberWithInt:v14];
      [v8 setObject:v15 forKey:@"pid"];

      uint64_t v16 = [NSNumber numberWithUnsignedInt:v13];
      [v8 setObject:v16 forKey:@"contextId"];

      goto LABEL_44;
    case 91501:
      [v6 pointValue];
      double v17 = (void *)MEMORY[0x263F08D40];
      -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", 0, 0);
      uint64_t v18 = objc_msgSend(v17, "valueWithPoint:");
      goto LABEL_26;
    case 91503:
      objc_opt_class();
      double v19 = __UIAccessibilityCastAsClass();
      unint64_t v20 = [v19 count];

      if (v20 < 2) {
        goto LABEL_28;
      }
      id v12 = v7;
      double v21 = [v12 objectAtIndexedSubscript:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_42;
      }
      float v22 = [v12 objectAtIndexedSubscript:1];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_43;
      }
      CGRect v24 = [v12 objectAtIndexedSubscript:0];
      [v24 pointValue];
      double v26 = v25;
      double v28 = v27;

      double v29 = [v12 objectAtIndexedSubscript:1];
      uint64_t v30 = [v29 unsignedIntValue];

      if ((unint64_t)[v12 count] < 3)
      {
        uint64_t v32 = 0;
      }
      else
      {
        double v31 = [v12 objectAtIndexedSubscript:2];
        uint64_t v32 = [v31 unsignedIntValue];
      }
      id v91 = (void *)MEMORY[0x263F08D40];
      -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v30, v32, v26, v28);
      goto LABEL_55;
    case 91504:
      objc_opt_class();
      double v33 = __UIAccessibilityCastAsClass();
      unint64_t v34 = [v33 count];

      if (v34 < 2) {
        goto LABEL_28;
      }
      id v12 = v7;
      double v21 = [v12 objectAtIndexedSubscript:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_42;
      }
      double v35 = [v12 objectAtIndexedSubscript:1];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_42:
        goto LABEL_43;
      }
      if ((unint64_t)[v12 count] < 3)
      {

        goto LABEL_51;
      }
      v36 = [v12 objectAtIndexedSubscript:2];
      objc_opt_class();
      char v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) == 0)
      {
LABEL_43:
        uint64_t v8 = 0;
        goto LABEL_44;
      }
LABEL_51:
      v92 = [v12 objectAtIndexedSubscript:0];
      [v92 pointValue];
      double v94 = v93;
      double v96 = v95;

      v97 = [v12 objectAtIndexedSubscript:1];
      uint64_t v98 = [v97 unsignedIntValue];

      if ((unint64_t)[v12 count] < 3)
      {
        uint64_t v100 = 0;
      }
      else
      {
        v99 = [v12 objectAtIndexedSubscript:2];
        uint64_t v100 = [v99 unsignedIntValue];
      }
      id v91 = (void *)MEMORY[0x263F08D40];
      -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v98, v100, v94, v96);
LABEL_55:
      uint64_t v89 = objc_msgSend(v91, "valueWithPoint:");
LABEL_40:
      uint64_t v8 = (void *)v89;
LABEL_44:

LABEL_45:
      return v8;
    case 91505:
      objc_opt_class();
      v38 = __UIAccessibilityCastAsClass();
      unint64_t v39 = [v38 count];

      if (v39 < 2) {
        goto LABEL_28;
      }
      id v12 = v7;
      double v40 = [v12 objectAtIndexedSubscript:0];
      [v40 rectValue];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;

      double v49 = [v12 objectAtIndexedSubscript:1];
      uint64_t v50 = [v49 unsignedIntValue];

      if ((unint64_t)[v12 count] < 3)
      {
        uint64_t v52 = 0;
      }
      else
      {
        v51 = [v12 objectAtIndexedSubscript:2];
        uint64_t v52 = [v51 unsignedIntValue];
      }
      uint64_t v88 = (void *)MEMORY[0x263F08D40];
      -[AXBAccessibilityManager accessibilityConvertHostedViewFrame:fromContextId:displayId:](self, "accessibilityConvertHostedViewFrame:fromContextId:displayId:", v50, v52, v42, v44, v46, v48);
      goto LABEL_39;
    case 91506:
      [v6 pointValue];
      double v54 = v53;
      double v56 = v55;
      if ([(AXBAccessibilityManager *)self _accessibilityDisplayRequiresRotateForPoints:0])
      {
        double v54 = AXRotateToScreen();
        double v56 = v57;
      }
      v58 = +[AXBEventManager sharedManager];
      v59 = [v58 windowServer];
      uint64_t v60 = objc_msgSend(v59, "contextIdAtPosition:", v54, v56);

      uint64_t v18 = [NSNumber numberWithUnsignedInt:v60];
      goto LABEL_26;
    case 91507:
      objc_opt_class();
      uint64_t v61 = __UIAccessibilityCastAsClass();
      uint64_t v8 = (void *)[v61 count];

      if (!v8) {
        goto LABEL_45;
      }
      id v12 = v7;
      int v62 = [v12 objectAtIndexedSubscript:0];
      [v62 pointValue];
      double v64 = v63;
      double v66 = v65;

      if ([v12 count] == 2)
      {
        double v67 = [v12 objectAtIndexedSubscript:1];
        uint64_t v68 = [v67 unsignedIntValue];
      }
      else
      {
        uint64_t v68 = 0;
      }
      uint64_t v86 = [(AXBAccessibilityManager *)self windowServerDisplayForDisplayId:v68];
      if ([(AXBAccessibilityManager *)self _accessibilityDisplayRequiresRotateForPoints:v86])
      {
        double v64 = AXRotateToScreen();
        double v66 = v87;
      }
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v86, "contextIdAtPosition:", v64, v66));

      goto LABEL_44;
    case 91508:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_28;
      }
      uint64_t v69 = [v7 objectForKey:@"contextId"];
      uint64_t v70 = [v69 unsignedIntValue];

      uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", -[AXBAccessibilityManager _accessibilityApplicationForContextId:](self, "_accessibilityApplicationForContextId:", v70));
LABEL_26:
      uint64_t v8 = (void *)v18;
      goto LABEL_45;
    case 91511:
      objc_opt_class();
      v71 = __UIAccessibilityCastAsClass();
      unint64_t v72 = [v71 count];

      if (v72 < 2)
      {
LABEL_28:
        uint64_t v8 = 0;
        goto LABEL_45;
      }
      id v12 = v7;
      double v73 = [v12 objectAtIndexedSubscript:0];
      [v73 rectValue];
      double v75 = v74;
      double v77 = v76;
      double v79 = v78;
      double v81 = v80;

      v82 = [v12 objectAtIndexedSubscript:1];
      uint64_t v83 = [v82 unsignedIntValue];

      if ((unint64_t)[v12 count] < 3)
      {
        uint64_t v85 = 0;
      }
      else
      {
        double v84 = [v12 objectAtIndexedSubscript:2];
        uint64_t v85 = [v84 unsignedIntValue];
      }
      uint64_t v88 = (void *)MEMORY[0x263F08D40];
      -[AXBAccessibilityManager accessibilityConvertHostedViewFrame:toContextId:displayId:](self, "accessibilityConvertHostedViewFrame:toContextId:displayId:", v83, v85, v75, v77, v79, v81);
LABEL_39:
      uint64_t v89 = objc_msgSend(v88, "valueWithRect:");
      goto LABEL_40;
    default:
      goto LABEL_45;
  }
}

- (BOOL)_accessibilityDisplayRequiresRotateForPoints:(id)a3
{
  uint64_t v5 = [a3 name];
  int v6 = [v5 isEqualToString:@"TVOut"];
  if (v6)
  {
    id v3 = [MEMORY[0x263F15778] TVOutDisplay];
    if ([v3 isExternal])
    {
      LOBYTE(v7) = 0;
LABEL_9:

      goto LABEL_10;
    }
    if (a3)
    {
      LOBYTE(v7) = 1;
      goto LABEL_9;
    }
  }
  else if (a3)
  {
    LOBYTE(v7) = 1;
    goto LABEL_10;
  }
  uint64_t v8 = [MEMORY[0x263F15778] mainDisplay];
  int v7 = [v8 isExternal] ^ 1;

  if (v6) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (id)windowServerDisplayForDisplayId:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v4 = [MEMORY[0x263F15920] serverIfRunning];
    [v4 displayWithDisplayId:v3];
  }
  else
  {
    uint64_t v4 = +[AXBEventManager sharedManager];
    [v4 windowServer];
  uint64_t v5 = };

  return v5;
}

- (void)_userEventOccurred
{
}

- (double)_processPassiveEventQueue
{
  [(id)_PassiveEventLock lock];
  if ([(id)_SBAXPassiveEventQueue count])
  {
    uint64_t v3 = [(id)_SBAXPassiveEventQueue objectAtIndex:0];
    double Current = CFAbsoluteTimeGetCurrent();
    [v3 fireTime];
    if (Current >= v5)
    {
      [(id)_SBAXPassiveEventQueue removeObjectAtIndex:0];
      [(id)_PassiveEventLock unlock];
      BOOL v9 = [v3 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = +[AXBEventManager sharedManager];
        [v10 dispatchEventRepresentationToClient:v9];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = (double *)malloc_type_calloc(1uLL, [v9 length], 0xCA645FFCuLL);
          objc_msgSend(v9, "getBytes:length:", v11, objc_msgSend(v9, "length"));
          id v12 = +[AXBEventManager sharedManager];
          objc_msgSend(v12, "machPortForPoint:", v11[1], v11[2]);

          GSSendEvent();
          free(v11);
        }
      }
      [(AXBAccessibilityManager *)self _processPassiveEventQueue];
      double v7 = v13;
    }
    else
    {
      [(id)_PassiveEventLock unlock];
      [v3 fireTime];
      double v7 = v6 - CFAbsoluteTimeGetCurrent();
    }
  }
  else
  {
    [(id)_PassiveEventLock unlock];
    uint64_t v3 = [MEMORY[0x263EFF910] distantFuture];
    [v3 timeIntervalSinceNow];
    double v7 = v8;
  }

  return v7;
}

- (void)_releasePendingEvents:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(id)_PassiveEventLock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)_SBAXPassiveEventQueue;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "fireTime", (void)v12);
        if (v10 <= a3)
        {
          [v9 fireTime];
          [v9 setFireTime:v11 - *(double *)&_SBAXPassiveListenDelay];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if (_SBAXPassiveRunLoopRef) {
    CFRunLoopStop((CFRunLoopRef)_SBAXPassiveRunLoopRef);
  }
  objc_msgSend((id)_PassiveEventLock, "unlock", (void)v12);
}

- (void)_startPassiveResendThread
{
  uint64_t v3 = [MEMORY[0x263F08B88] currentThread];
  [v3 setName:@"AXPassiveResentThread"];

  objc_msgSend((id)_PassiveEventLock, "lock", 0, self, 0, 0, 0, 0, 0, 0, 0, _passiveEventHandler);
  _SBAXPassiveSourceRef = (uint64_t)CFRunLoopSourceCreate(0, 0, &v8);
  _SBAXPassiveRunLoopRef = (uint64_t)CFRunLoopGetCurrent();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE88];
  CFRunLoopAddSource((CFRunLoopRef)_SBAXPassiveRunLoopRef, (CFRunLoopSourceRef)_SBAXPassiveSourceRef, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  CFRunLoopSourceSignal((CFRunLoopSourceRef)_SBAXPassiveSourceRef);
  uint64_t v5 = [(id)_PassiveEventLock unlock];
  while (1)
  {
    uint64_t v6 = (void *)MEMORY[0x2456441D0](v5);
    [(AXBAccessibilityManager *)self _processPassiveEventQueue];
    CFRunLoopRunInMode(v4, v7, 1u);
  }
}

- (BOOL)_handleItemChooserVisible:(unsigned int)a3
{
  return 0;
}

- (BOOL)_screenReaderCapture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 originalType];
    if ([(AXBAccessibilityManager *)self _handleItemChooserVisible:v6])
    {
      objc_msgSend(v5, "setAdditionalFlags:", objc_msgSend(v5, "additionalFlags") | 0x2000000);
      BKPostAXEvent(v5, 0);
LABEL_7:
      char voiceOverIgnoresTrackpad = 1;
      goto LABEL_25;
    }
    if (v6 == 50 && !_SBAXDeviceOrientationCapabilityEnabled) {
      goto LABEL_7;
    }
    if ((v6 - 1000) >= 2)
    {
      if (v6 == 3200)
      {
        char voiceOverIgnoresTrackpad = self->_voiceOverIgnoresTrackpad;
        goto LABEL_25;
      }
      IsKeyboardKedouble y = AXEventTypeIsKeyboardKey();
      int v8 = 0;
      BOOL v9 = 1;
      if (v6 != 3001 && (IsKeyboardKey & 1) == 0)
      {
        if ((v6 - 10) >= 3)
        {
          if ((v6 - 1025) <= 3) {
            BOOL v9 = (((_BYTE)v6 - 1) & 0xF) == 2;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
        int v8 = 1;
      }
    }
    else
    {
      int v8 = 1;
      BOOL v9 = 1;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    if (v6 == 3001 && Current - *(double *)&_screenReaderCapture__LastUserEventSent > 4.0)
    {
      [(AXBAccessibilityManager *)self _userEventOccurred];
      _screenReaderCapture__LastUserEventSent = CFAbsoluteTimeGetCurrent();
    }
    if (v8)
    {
      objc_msgSend(v5, "setAdditionalFlags:", objc_msgSend(v5, "additionalFlags") | 0x2000000);
      BKPostAXEvent(v5, v9);
    }
    char voiceOverIgnoresTrackpad = !v9;
  }
  else
  {
    char voiceOverIgnoresTrackpad = 0;
  }
LABEL_25:

  return voiceOverIgnoresTrackpad;
}

- (BOOL)_assistiveTouchCapture:(id)a3
{
  return 0;
}

- (BOOL)_inspectorCapture:(id)a3
{
  return 0;
}

- (BOOL)_gaxCapture:(id)a3
{
  return 0;
}

- (BOOL)_axMenuCapture:(id)a3
{
  return 0;
}

- (void)_undoContextShiftedPoints:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] == 3001)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend(v4, "handInfo", 0);
    uint64_t v6 = [v5 paths];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v12 = [v11 pathWindowContextID];
          [v11 pathLocation];
          -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v12, 0);
          objc_msgSend(v11, "setPathLocation:");
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v12 = 0;
    }

    [v4 location];
    -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v12, 0);
    objc_msgSend(v4, "setLocation:");
    [v4 windowLocation];
    -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v12, 0);
    objc_msgSend(v4, "setWindowLocation:");
  }
}

- (BOOL)_accessibilityEventTapCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  [(AXBAccessibilityManager *)self _undoContextShiftedPoints:v5];
  if ((_SBAXCaptureMode & 0x20) != 0
    && ([v5 dataRepresentation],
        AXPushNotificationToSystemForBroadcast(),
        *(double *)&_SBAXPassiveListenDelay != 0.0)
    && objc_msgSend(v5, "type", *(double *)&_SBAXPassiveListenDelay) == 3001)
  {
    if (!_SBAXPassiveEventQueue)
    {
      uint64_t v6 = [objc_allocWithZone(MEMORY[0x263F08958]) init];
      uint64_t v7 = (void *)_PassiveEventLock;
      _PassiveEventLock = v6;

      uint64_t v8 = [objc_allocWithZone(MEMORY[0x263EFF980]) init];
      uint64_t v9 = (void *)_SBAXPassiveEventQueue;
      _SBAXPassiveEventQueue = v8;

      [MEMORY[0x263F08B88] detachNewThreadSelector:sel__startPassiveResendThread toTarget:self withObject:0];
    }
    double v10 = objc_opt_new();
    [v10 setValue:v4];
    [v10 setFireTime:CFAbsoluteTimeGetCurrent() + *(double *)&_SBAXPassiveListenDelay];
    [(id)_PassiveEventLock lock];
    [(id)_SBAXPassiveEventQueue addObject:v10];
    if (_SBAXPassiveRunLoopRef) {
      CFRunLoopStop((CFRunLoopRef)_SBAXPassiveRunLoopRef);
    }
    [(id)_PassiveEventLock unlock];

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  char v12 = _SBAXCaptureMode;
  if ((_SBAXCaptureMode & 8) != 0)
  {
    BOOL v11 = [(AXBAccessibilityManager *)self _gaxCapture:v5];
    char v12 = _SBAXCaptureMode;
  }
  if ((v12 & 4) != 0 && !v11)
  {
    BOOL v11 = [(AXBAccessibilityManager *)self _inspectorCapture:v5];
    char v12 = _SBAXCaptureMode;
  }
  if ((v12 & 2) != 0 && !v11)
  {
    BOOL v11 = [(AXBAccessibilityManager *)self _assistiveTouchCapture:v5];
    char v12 = _SBAXCaptureMode;
  }
  if ((v12 & 1) != 0 && !v11)
  {
    BOOL v11 = [(AXBAccessibilityManager *)self _screenReaderCapture:v5];
    char v12 = _SBAXCaptureMode;
  }
  if ((v12 & 0x10) != 0 && !v11) {
    BOOL v11 = [(AXBAccessibilityManager *)self _axMenuCapture:v5];
  }

  return v11;
}

- (void)setAccelerometerDisabled:(BOOL)a3
{
  self->_accelerometerDisabled = a3;
}

- (void).cxx_destruct
{
}

- (void)_accessibilitySystemApp
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_241F5C000, log, OS_LOG_TYPE_ERROR, "Did not find any non-CarPlay system apps, returning systemApp from backboard.", v1, 2u);
}

- (void)_accessibilitySystemAppApplicationPid
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithInt:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_241F5C000, a3, OS_LOG_TYPE_ERROR, "Pid from system app was not valid: %@ %@", (uint8_t *)&v6, 0x16u);
}

@end