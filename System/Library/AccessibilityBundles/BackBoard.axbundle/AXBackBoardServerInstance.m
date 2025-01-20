@interface AXBackBoardServerInstance
+ (id)backBoardServerInstance;
+ (id)backBoardServerInstanceIfExists;
- (AXBColorFilterDescription)colorFilterFromLastUpdate;
- (AXBackBoardServerInstanceDelegate)delegate;
- (BOOL)_inCheckerBoardMode;
- (BOOL)_inPreBoardMode;
- (BOOL)_sessionIsLoginSession;
- (BOOL)adaptationEnabled;
- (BOOL)blueLightStatusEnabled;
- (BOOL)brightnessFiltersEnabled;
- (BOOL)supportsAdaptation;
- (id)_axPreferenceAsMobile:(id)a3;
- (id)_gaxBackboard;
- (id)_handleAXUIServerPID:(id)a3;
- (id)_handleAdaptationEnabled:(id)a3;
- (id)_handleAssistiveTouchPID:(id)a3;
- (id)_handleBlueLightStatusEnabled:(id)a3;
- (id)_handleBrightnessFiltersEnabled:(id)a3;
- (id)_handleContextHostingIdForContextId:(id)a3;
- (id)_handleContextIdForPosition:(id)a3;
- (id)_handleConvertFrameFromContextId:(id)a3;
- (id)_handleConvertFrameFromContextIdToContextId:(id)a3;
- (id)_handleConvertFrameToContextId:(id)a3;
- (id)_handleConvertPointFromContextId:(id)a3;
- (id)_handleConvertPointToContextId:(id)a3;
- (id)_handleDisableBrightnessFilters:(id)a3;
- (id)_handleEventListenerRegistration:(id)a3;
- (id)_handleFullKeyboardAccessDaemonPID:(id)a3;
- (id)_handleGetGuidedAccessAvailability:(id)a3;
- (id)_handleGetLastSetColorFilter:(id)a3;
- (id)_handleGetZoomInitialFocusRect:(id)a3;
- (id)_handleGuidedAccessCurrentModeAndSessionApp:(id)a3;
- (id)_handleGuidedAccessEffectiveAppBundleIdentifier:(id)a3;
- (id)_handleGuidedAccessIgnoredRegions:(id)a3;
- (id)_handleHearingAidServerPID:(id)a3;
- (id)_handleHomeClickSwallowedForGuidedAccess:(id)a3;
- (id)_handleInCheckerBoardMode:(id)a3;
- (id)_handleInPreBoardMode:(id)a3;
- (id)_handleInvertColorsChange:(id)a3;
- (id)_handleIsGuidedAccessActive:(id)a3;
- (id)_handleIsGuidedAccessInWorkspace:(id)a3;
- (id)_handleIsGuidedAccessSelfLockedToRequestingApp:(id)a3;
- (id)_handleIsGuidedAccessUnmanagedSelfLocked:(id)a3;
- (id)_handleIsHearingControlEnabled:(id)a3;
- (id)_handleIsRestrictedForAAC:(id)a3;
- (id)_handleLoadGAXBundleForUnmanagedASAM:(id)a3;
- (id)_handleLockScreenDimTimerEnabled:(id)a3;
- (id)_handlePostEvent:(id)a3;
- (id)_handleRegisterAccessibilityUIServerPID:(id)a3;
- (id)_handleRegisterAssistiveTouchPID:(id)a3;
- (id)_handleRegisterFullKeyboardAccessDaemonPID:(id)a3;
- (id)_handleRegisterHearingAidServerPID:(id)a3;
- (id)_handleRegisterLiveCaptionsPID:(id)a3;
- (id)_handleRegisterSiriViewServicePID:(id)a3;
- (id)_handleRegisterZoomConflict:(id)a3;
- (id)_handleResetAccessibilityFeatures:(id)a3;
- (id)_handleRestoreCachedBrightnessFilters:(id)a3;
- (id)_handleSessionIsLoginSession:(id)a3;
- (id)_handleSetCapsLockLightOn:(id)a3;
- (id)_handleSetClarityUIAdminPasscode:(id)a3;
- (id)_handleSetInCheckerBoardMode:(id)a3;
- (id)_handleSetInPreBoardMode:(id)a3;
- (id)_handleSetIsSpeakScreenHighlightVisible:(id)a3;
- (id)_handleSetSessionIsLoginSession:(id)a3;
- (id)_handleSetSwitchControlHasScreenSwitch:(id)a3;
- (id)_handleSetSwitchControlRendersDeviceUnusable:(id)a3;
- (id)_handleSetZoomInitialFocusRect:(id)a3;
- (id)_handleSupportsAdaptation:(id)a3;
- (id)_handleToggleGuidedAccess:(id)a3;
- (id)_handleTripleClickHomeButtonFired:(id)a3;
- (id)_handleUserEventOccurred:(id)a3;
- (id)_handleValidateClarityUIAdminPasscode:(id)a3;
- (id)_handleZoomAdjustment:(id)a3;
- (id)_initServer;
- (id)_setAXPreferenceAsMobile:(id)a3;
- (id)_setDeviceOrientation:(id)a3;
- (void)_handleGuidedAccessAutomationCommand:(id)a3 completion:(id)a4;
- (void)_handleSetGuidedAccessEnabledByRequestingApp:(id)a3 completion:(id)a4;
- (void)_initializeHandlers;
- (void)dealloc;
- (void)disableBrightnessFilters;
- (void)forceLoadGAXBundle;
- (void)resetAccessibilityFeatures;
- (void)restoreCachedBrightnessFilters;
- (void)setDelegate:(id)a3;
@end

@implementation AXBackBoardServerInstance

+ (id)backBoardServerInstance
{
  if (backBoardServerInstance_onceToken != -1) {
    dispatch_once(&backBoardServerInstance_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)ServerInstance;

  return v2;
}

uint64_t __52__AXBackBoardServerInstance_backBoardServerInstance__block_invoke()
{
  ServerInstance = [[AXBackBoardServerInstance alloc] _initServer];

  return MEMORY[0x270F9A758]();
}

+ (id)backBoardServerInstanceIfExists
{
  return (id)ServerInstance;
}

- (void)_initializeHandlers
{
}

- (id)_initServer
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)AXBackBoardServerInstance;
  v2 = [(AXBackBoardServerInstance *)&v23 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    zoomListeners = v2->_zoomListeners;
    v2->_zoomListeners = v5;

    CGSize v7 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v2->_initialZoomFocusRect.origin = (CGPoint)*MEMORY[0x263F001A0];
    v2->_initialZoomFocusRect.size = v7;
    v8 = AXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v8, OS_LOG_TYPE_DEFAULT, "Initialize AX backboard server", buf, 2u);
    }

    id v9 = objc_alloc(MEMORY[0x263F228C8]);
    uint64_t v10 = [v9 initWithServiceName:*MEMORY[0x263F22588] perPidService:0];
    server = v2->_server;
    v2->_server = (AXIPCServer *)v10;

    v12 = v2->_server;
    id v22 = 0;
    [(AXIPCServer *)v12 startServerWithError:&v22];
    id v13 = v22;
    v14 = AXLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_241F5C000, v14, OS_LOG_TYPE_DEFAULT, "Started AX Backboard server %@", buf, 0xCu);
    }

    [(AXIPCServer *)v2->_server setQueueSize:100];
    [(AXBackBoardServerInstance *)v2 _initializeHandlers];
    v15 = [MEMORY[0x263EFF910] date];
    [v15 timeIntervalSince1970];
    double v17 = v16;
    uint64_t v18 = AXBSystemBootTime___boottime;
    if (!AXBSystemBootTime___boottime)
    {
      int v27 = 0;
      *(void *)v26 = 0x1500000001;
      *(_OWORD *)buf = 0uLL;
      size_t v24 = 16;
      int v19 = sysctl(v26, 2u, buf, &v24, 0, 0);
      uint64_t v18 = *(void *)buf;
      if (v19 == -1) {
        uint64_t v18 = 0;
      }
      AXBSystemBootTime___boottime = v18;
    }
    uint64_t v20 = (uint64_t)v17 - v18;

    if (v20 <= 99) {
      _AXSSetAutomationEnabled();
    }
    if (v13) {
      NSLog(&cfstr_Error.isa, v13);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(AXIPCServer *)self->_server removeAllHandlersForTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)AXBackBoardServerInstance;
  [(AXBackBoardServerInstance *)&v3 dealloc];
}

- (void)disableBrightnessFilters
{
  id v2 = +[AXBBlueLightManager sharedManager];
  [v2 disableBrightnessFilters];
}

- (BOOL)brightnessFiltersEnabled
{
  id v2 = +[AXBBlueLightManager sharedManager];
  char v3 = [v2 brightnessFiltersEnabled];

  return v3;
}

- (BOOL)blueLightStatusEnabled
{
  id v2 = +[AXBBlueLightManager sharedManager];
  char v3 = [v2 blueLightStatusEnabled];

  return v3;
}

- (void)restoreCachedBrightnessFilters
{
  id v2 = +[AXBBlueLightManager sharedManager];
  [v2 restoreCachedBrightnessFilters];
}

- (BOOL)adaptationEnabled
{
  id v2 = +[AXBBlueLightManager sharedManager];
  char v3 = [v2 adaptationEnabled];

  return v3;
}

- (BOOL)supportsAdaptation
{
  id v2 = +[AXBBlueLightManager sharedManager];
  char v3 = [v2 supportsAdaptation];

  return v3;
}

- (void)forceLoadGAXBundle
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F8B1D8] object:0];

  id v3 = [MEMORY[0x263F22920] replayer];
  [v3 replayWithName:@"Ping SpringBoard for unmanaged ASAM" attempts:10 interval:1 async:MEMORY[0x263EF83A0] queue:&__block_literal_global_483 replayBlock:&__block_literal_global_487 completion:0.5];
}

uint64_t __47__AXBackBoardServerInstance_forceLoadGAXBundle__block_invoke()
{
  v0 = [MEMORY[0x263F22968] server];
  uint64_t v1 = [v0 loadGAXBundleForUnmanagedASAM];

  return v1;
}

uint64_t __47__AXBackBoardServerInstance_forceLoadGAXBundle__block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)resetAccessibilityFeatures
{
  _AXSVoiceOverTouchSetEnabled();
  _AXSAssistiveTouchSetEnabled();
  _AXSAssistiveTouchScannerSetEnabled();
  _AXSZoomTouchSetEnabled();
  _AXSInvertColorsSetEnabled();
  _AXSGrayscaleSetEnabled();
  _AXSSetReduceWhitePointEnabled();

  MEMORY[0x270F90770](0);
}

- (AXBColorFilterDescription)colorFilterFromLastUpdate
{
  v4 = +[AXBDisplayFilterManager sharedInstance];
  [v4 displayFilterFromLastUpdate];

  uint64_t result = (AXBColorFilterDescription *)MADisplayFilterGetMatrix();
  *(_OWORD *)&retstr->var0[0][0] = 0u;
  *(_OWORD *)&retstr->var0[0][2] = 0u;
  *(_OWORD *)&retstr->var0[1][1] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  retstr->var0[2][2] = 0.0;
  return result;
}

- (id)_handleRegisterZoomConflict:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  v5 = [v3 defaultCenter];
  v6 = [v4 payload];

  [v5 postNotificationName:@"UIAXZoomRegisterConflict" object:0 userInfo:v6];
  return 0;
}

- (id)_handleZoomAdjustment:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  v5 = [v3 defaultCenter];
  uint64_t v6 = *MEMORY[0x263F22A18];
  CGSize v7 = [v4 payload];

  [v5 postNotificationName:v6 object:0 userInfo:v7];
  return 0;
}

- (id)_handleContextIdForPosition:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 objectForKey:@"displayPoint"];
  NSPoint v7 = NSPointFromString(v6);
  uint64_t v8 = objc_msgSend(v5, "contextIdForDisplayPoint:", v7.x, v7.y);

  id v9 = objc_alloc(MEMORY[0x263F228C0]);
  v14 = @"result";
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v8];
  v15[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = (void *)[v9 initWithKey:2032 payload:v11];

  return v12;
}

- (id)_handleContextHostingIdForContextId:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 payload];
  v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 objectForKey:@"contextId"];
  uint64_t v7 = objc_msgSend(v5, "contextIdHosterForContextId:", objc_msgSend(v6, "unsignedIntValue"));

  id v8 = objc_alloc(MEMORY[0x263F228C0]);
  id v13 = @"result";
  id v9 = [NSNumber numberWithUnsignedInt:v7];
  v14[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = (void *)[v8 initWithKey:2031 payload:v10];

  return v11;
}

- (id)_handleConvertFrameToContextId:(id)a3
{
  id v4 = [a3 payload];
  v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 objectForKey:@"frame"];
  NSRect v29 = NSRectFromString(v6);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  v11 = [v4 objectForKey:@"contextId"];
  uint64_t v12 = [v11 unsignedIntValue];
  id v13 = [v4 objectForKeyedSubscript:@"displayId"];
  objc_msgSend(v5, "convertFrame:toContextId:displayId:", v12, objc_msgSend(v13, "unsignedIntValue"), x, y, width, height);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  id v22 = objc_alloc(MEMORY[0x263F228C0]);
  objc_super v23 = NSDictionary;
  v30.origin.double x = v15;
  v30.origin.double y = v17;
  v30.size.double width = v19;
  v30.size.double height = v21;
  size_t v24 = NSStringFromRect(v30);
  v25 = [v23 dictionaryWithObject:v24 forKey:@"frame"];
  v26 = (void *)[v22 initWithKey:2007 payload:v25];

  return v26;
}

- (id)_handleConvertFrameFromContextId:(id)a3
{
  id v4 = [a3 payload];
  v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 objectForKey:@"frame"];
  NSRect v29 = NSRectFromString(v6);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  v11 = [v4 objectForKey:@"contextId"];
  uint64_t v12 = [v11 unsignedIntValue];
  id v13 = [v4 objectForKeyedSubscript:@"displayId"];
  objc_msgSend(v5, "convertFrame:fromContextId:displayId:", v12, objc_msgSend(v13, "unsignedIntValue"), x, y, width, height);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  id v22 = objc_alloc(MEMORY[0x263F228C0]);
  objc_super v23 = NSDictionary;
  v30.origin.double x = v15;
  v30.origin.double y = v17;
  v30.size.double width = v19;
  v30.size.double height = v21;
  size_t v24 = NSStringFromRect(v30);
  v25 = [v23 dictionaryWithObject:v24 forKey:@"frame"];
  v26 = (void *)[v22 initWithKey:2007 payload:v25];

  return v26;
}

- (id)_handleConvertFrameFromContextIdToContextId:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"frame"];
  NSRect v47 = NSRectFromString(v7);
  double x = v47.origin.x;
  double y = v47.origin.y;
  double width = v47.size.width;
  double height = v47.size.height;
  uint64_t v12 = [v4 payload];
  id v13 = [v12 objectForKeyedSubscript:@"fromContextId"];
  uint64_t v14 = [v13 unsignedIntValue];
  CGFloat v15 = [v4 payload];
  double v16 = [v15 objectForKeyedSubscript:@"displayId"];
  objc_msgSend(v5, "convertFrame:fromContextId:displayId:", v14, objc_msgSend(v16, "unsignedIntValue"), x, y, width, height);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = [(AXBackBoardServerInstance *)self delegate];
  v26 = [v4 payload];
  int v27 = [v26 objectForKeyedSubscript:@"toContextId"];
  uint64_t v28 = [v27 unsignedIntValue];
  NSRect v29 = [v4 payload];

  NSRect v30 = [v29 objectForKeyedSubscript:@"displayId"];
  objc_msgSend(v25, "convertFrame:toContextId:displayId:", v28, objc_msgSend(v30, "unsignedIntValue"), v18, v20, v22, v24);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  id v39 = objc_alloc(MEMORY[0x263F228C0]);
  v44 = @"frame";
  v48.origin.double x = v32;
  v48.origin.double y = v34;
  v48.size.double width = v36;
  v48.size.double height = v38;
  v40 = NSStringFromRect(v48);
  v45[0] = v40;
  v41 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
  v42 = (void *)[v39 initWithKey:2042 payload:v41];

  return v42;
}

- (id)_handleConvertPointFromContextId:(id)a3
{
  id v4 = [a3 payload];
  v5 = [v4 objectForKey:@"contextId"];
  uint64_t v6 = [v5 unsignedIntValue];

  uint64_t v7 = [v4 objectForKey:@"displayId"];
  uint64_t v8 = [v7 unsignedIntValue];

  id v9 = [v4 objectForKey:@"point"];
  NSPoint v10 = NSPointFromString(v9);

  v11 = [(AXBackBoardServerInstance *)self delegate];
  objc_msgSend(v11, "convertPoint:fromContextId:displayId:", v6, v8, v10.x, v10.y);
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  id v16 = objc_alloc(MEMORY[0x263F228C0]);
  double v17 = NSDictionary;
  v23.double x = v13;
  v23.double y = v15;
  double v18 = NSStringFromPoint(v23);
  double v19 = [v17 dictionaryWithObject:v18 forKey:@"point"];
  double v20 = (void *)[v16 initWithKey:2068 payload:v19];

  return v20;
}

- (id)_handleConvertPointToContextId:(id)a3
{
  id v4 = [a3 payload];
  v5 = [v4 objectForKey:@"contextId"];
  uint64_t v6 = [v5 unsignedIntValue];

  uint64_t v7 = [v4 objectForKey:@"displayId"];
  uint64_t v8 = [v7 unsignedIntValue];

  id v9 = [v4 objectForKey:@"point"];
  NSPoint v10 = NSPointFromString(v9);

  v11 = [(AXBackBoardServerInstance *)self delegate];
  objc_msgSend(v11, "convertPoint:toContextId:displayId:", v6, v8, v10.x, v10.y);
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  id v16 = objc_alloc(MEMORY[0x263F228C0]);
  double v17 = NSDictionary;
  v23.double x = v13;
  v23.double y = v15;
  double v18 = NSStringFromPoint(v23);
  double v19 = [v17 dictionaryWithObject:v18 forKey:@"point"];
  double v20 = (void *)[v16 initWithKey:2069 payload:v19];

  return v20;
}

- (id)_handlePostEvent:(id)a3
{
  id v4 = a3;
  if (_handlePostEvent__onceToken != -1) {
    dispatch_once(&_handlePostEvent__onceToken, &__block_literal_global_520);
  }
  v5 = _handlePostEvent__postQueue;
  if (_handlePostEvent__postQueue)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__AXBackBoardServerInstance__handlePostEvent___block_invoke_2;
    v7[3] = &unk_26510B528;
    id v8 = v4;
    id v9 = self;
    dispatch_async(v5, v7);
  }
  return 0;
}

uint64_t __46__AXBackBoardServerInstance__handlePostEvent___block_invoke()
{
  _handlePostEvent__postQueue = (uint64_t)dispatch_queue_create("axbackboard-post", 0);

  return MEMORY[0x270F9A758]();
}

void __46__AXBackBoardServerInstance__handlePostEvent___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) payload];
  id v11 = [v2 objectForKey:@"record"];

  id v3 = [*(id *)(a1 + 32) payload];
  id v4 = [v3 objectForKey:@"systemEvent"];
  uint64_t v5 = [v4 BOOLValue];

  uint64_t v6 = [*(id *)(a1 + 40) delegate];
  uint64_t v7 = [*(id *)(a1 + 32) payload];
  id v8 = [v7 objectForKey:@"afterNamedTap"];
  id v9 = [*(id *)(a1 + 32) payload];
  NSPoint v10 = [v9 objectForKey:@"namedTaps"];
  [v6 postEvent:v11 systemEvent:v5 afterNamedTap:v8 namedTaps:v10];
}

- (id)_handleUserEventOccurred:(id)a3
{
  id v3 = [(AXBackBoardServerInstance *)self delegate];
  [v3 userEventOccurred];

  return 0;
}

- (id)_handleSetCapsLockLightOn:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"on"];
  uint64_t v6 = [v5 BOOLValue];

  uint64_t v7 = [(AXBackBoardServerInstance *)self delegate];
  [v7 setCapsLockLightOn:v6];

  return 0;
}

- (id)_handleEventListenerRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 clientPort];
  eventListeners = self->_eventListeners;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke;
  v16[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  int v17 = v5;
  uint64_t v7 = [(NSMutableArray *)eventListeners indexOfObjectPassingTest:v16];
  id v8 = [v4 payload];

  id v9 = [v8 objectForKey:@"start"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F228B8]) initWithPort:v5];
      [v11 connectWithError:0];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      void v14[2] = __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_2;
      v14[3] = &unk_26510B7A8;
      v14[4] = self;
      int v15 = v5;
      [v11 setPortDeathHandler:v14];
      [(NSMutableArray *)self->_eventListeners addObject:v11];
      double v12 = [(AXBackBoardServerInstance *)self delegate];
      [v12 registerEventListener:1];

LABEL_7:
    }
  }
  else if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_eventListeners removeObjectAtIndex:v7];
    if (![(NSMutableArray *)self->_eventListeners count])
    {
      id v11 = [(AXBackBoardServerInstance *)self delegate];
      [v11 registerEventListener:0];
      goto LABEL_7;
    }
  }
  return 0;
}

BOOL __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serviceMachPort] == *(_DWORD *)(a1 + 32);
}

void __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_3;
  v5[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  int v6 = *(_DWORD *)(a1 + 40);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v5];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:v3];
    if (![*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      [v4 registerEventListener:0];
    }
  }
}

BOOL __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serviceMachPort] == *(_DWORD *)(a1 + 32);
}

- (id)_handleRegisterLiveCaptionsPID:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"pid"];
  uint64_t v6 = [v5 intValue];

  uint64_t v7 = [(AXBackBoardServerInstance *)self delegate];
  [v7 setLiveCaptionsPid:v6];

  id v8 = objc_alloc(MEMORY[0x263F29CB0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__AXBackBoardServerInstance__handleRegisterLiveCaptionsPID___block_invoke;
  v12[3] = &unk_26510B7A8;
  v12[4] = self;
  int v13 = v6;
  id v9 = (BSProcessDeathWatcher *)[v8 initWithPID:v6 queue:MEMORY[0x263EF83A0] deathHandler:v12];
  lcDeathWatcher = self->_lcDeathWatcher;
  self->_lcDeathWatcher = v9;

  return 0;
}

void __60__AXBackBoardServerInstance__handleRegisterLiveCaptionsPID___block_invoke(uint64_t a1)
{
  id v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "LC process went away, resetting pid", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  int v4 = [v3 accessibilityLiveCaptionsPid];
  int v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 setLiveCaptionsPid:0];
  }
}

- (id)_handleRegisterAssistiveTouchPID:(id)a3
{
  int v4 = [a3 payload];
  int v5 = [v4 objectForKey:@"pid"];
  uint64_t v6 = [v5 intValue];

  uint64_t v7 = [(AXBackBoardServerInstance *)self delegate];
  [v7 setAssistiveTouchPid:v6];

  id v8 = objc_alloc(MEMORY[0x263F29CB0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__AXBackBoardServerInstance__handleRegisterAssistiveTouchPID___block_invoke;
  v12[3] = &unk_26510B7A8;
  v12[4] = self;
  int v13 = v6;
  id v9 = (BSProcessDeathWatcher *)[v8 initWithPID:v6 queue:MEMORY[0x263EF83A0] deathHandler:v12];
  astDeathWatcher = self->_astDeathWatcher;
  self->_astDeathWatcher = v9;

  return 0;
}

void __62__AXBackBoardServerInstance__handleRegisterAssistiveTouchPID___block_invoke(uint64_t a1)
{
  id v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "AST process went away, resetting pid", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  int v4 = [v3 accessibilityAssistiveTouchPid];
  int v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 setAssistiveTouchPid:0];
  }
}

- (id)_handleAXUIServerPID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 accessibilityUIServerPid];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  int v10 = @"pid";
  uint64_t v6 = [NSNumber numberWithInt:v4];
  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)[v5 initWithKey:2033 payload:v7];

  return v8;
}

- (id)_handleAssistiveTouchPID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 accessibilityAssistiveTouchPid];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  int v10 = @"pid";
  uint64_t v6 = [NSNumber numberWithInt:v4];
  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)[v5 initWithKey:2063 payload:v7];

  return v8;
}

- (id)_handleHearingAidServerPID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 hearingAidServerPid];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  int v10 = @"pid";
  uint64_t v6 = [NSNumber numberWithInt:v4];
  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)[v5 initWithKey:2073 payload:v7];

  return v8;
}

- (id)_handleFullKeyboardAccessDaemonPID:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v4 = [v3 accessibilityFullKeyboardAccessDaemonPid];

  id v5 = objc_alloc(MEMORY[0x263F228C0]);
  int v10 = @"pid";
  uint64_t v6 = [NSNumber numberWithInt:v4];
  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)[v5 initWithKey:2070 payload:v7];

  return v8;
}

- (id)_handleRegisterAccessibilityUIServerPID:(id)a3
{
  uint64_t v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"pid"];
  uint64_t v6 = [v5 intValue];

  uint64_t v7 = [(AXBackBoardServerInstance *)self delegate];
  [v7 setAccessibilityUIServerPid:v6];

  id v8 = objc_alloc(MEMORY[0x263F29CB0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__AXBackBoardServerInstance__handleRegisterAccessibilityUIServerPID___block_invoke;
  v12[3] = &unk_26510B7A8;
  v12[4] = self;
  int v13 = v6;
  id v9 = (BSProcessDeathWatcher *)[v8 initWithPID:v6 queue:MEMORY[0x263EF83A0] deathHandler:v12];
  uiServerDeathWatcher = self->_uiServerDeathWatcher;
  self->_uiServerDeathWatcher = v9;

  return 0;
}

void __69__AXBackBoardServerInstance__handleRegisterAccessibilityUIServerPID___block_invoke(uint64_t a1)
{
  id v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "UIServer process went away, resetting pid", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  int v4 = [v3 accessibilityUIServerPid];
  int v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 setAccessibilityUIServerPid:0];
  }
}

- (id)_handleRegisterFullKeyboardAccessDaemonPID:(id)a3
{
  int v4 = [a3 payload];
  int v5 = [v4 objectForKey:@"pid"];
  uint64_t v6 = [v5 intValue];

  uint64_t v7 = [(AXBackBoardServerInstance *)self delegate];
  [v7 setFullKeyboardAccessDaemonPID:v6];

  id v8 = objc_alloc(MEMORY[0x263F29CB0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__AXBackBoardServerInstance__handleRegisterFullKeyboardAccessDaemonPID___block_invoke;
  v12[3] = &unk_26510B7A8;
  v12[4] = self;
  int v13 = v6;
  id v9 = (BSProcessDeathWatcher *)[v8 initWithPID:v6 queue:MEMORY[0x263EF83A0] deathHandler:v12];
  fkaDeathWatcher = self->_fkaDeathWatcher;
  self->_fkaDeathWatcher = v9;

  return 0;
}

void __72__AXBackBoardServerInstance__handleRegisterFullKeyboardAccessDaemonPID___block_invoke(uint64_t a1)
{
  id v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "FKA process went away, resetting pid", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  int v4 = [v3 accessibilityFullKeyboardAccessDaemonPid];
  int v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 setFullKeyboardAccessDaemonPID:0];
  }
}

- (id)_handleRegisterSiriViewServicePID:(id)a3
{
  id v4 = a3;
  int v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 payload];

  uint64_t v7 = [v6 objectForKey:@"pid"];
  objc_msgSend(v5, "setSiriViewServicePid:", objc_msgSend(v7, "intValue"));

  return 0;
}

- (id)_handleRegisterHearingAidServerPID:(id)a3
{
  id v4 = [a3 payload];
  int v5 = [v4 objectForKey:@"pid"];
  uint64_t v6 = [v5 intValue];

  uint64_t v7 = [(AXBackBoardServerInstance *)self delegate];
  [v7 setHearingAidServerPid:v6];

  id v8 = objc_alloc(MEMORY[0x263F29CB0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__AXBackBoardServerInstance__handleRegisterHearingAidServerPID___block_invoke;
  v12[3] = &unk_26510B7A8;
  v12[4] = self;
  int v13 = v6;
  id v9 = (BSProcessDeathWatcher *)[v8 initWithPID:v6 queue:MEMORY[0x263EF83A0] deathHandler:v12];
  heardDeathWatcher = self->_heardDeathWatcher;
  self->_heardDeathWatcher = v9;

  return 0;
}

void __64__AXBackBoardServerInstance__handleRegisterHearingAidServerPID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  int v3 = [v2 hearingAidServerPid];
  int v4 = *(_DWORD *)(a1 + 40);

  if (v3 == v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 setHearingAidServerPid:0];
  }
}

- (id)_handleInvertColorsChange:(id)a3
{
  int v3 = [a3 payload];
  int v4 = [v3 objectForKey:@"enabled"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 BOOLValue];
    _AXSInvertColorsSetEnabled();
  }

  return 0;
}

- (id)_handleLockScreenDimTimerEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(AXBackBoardServerInstance *)self delegate];
  uint64_t v6 = [v4 payload];

  uint64_t v7 = [v6 objectForKey:@"enabled"];
  objc_msgSend(v5, "setLockScreenDimTimerEnabled:", objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_handleSetSwitchControlRendersDeviceUnusable:(id)a3
{
  int v3 = (void *)MEMORY[0x263F229B8];
  id v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"result"];
  objc_msgSend(v3, "setSwitchControlRendersDeviceUnusable:", objc_msgSend(v5, "BOOLValue"));

  return 0;
}

- (id)_handleSetSwitchControlHasScreenSwitch:(id)a3
{
  int v3 = (void *)MEMORY[0x263F229B8];
  id v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"result"];
  objc_msgSend(v3, "setSwitchControlHasScreenSwitch:", objc_msgSend(v5, "BOOLValue"));

  return 0;
}

- (id)_handleSetZoomInitialFocusRect:(id)a3
{
  id v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"rect"];
  NSRect v19 = NSRectFromString(v5);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;

  int v10 = [v4 objectForKeyedSubscript:@"contextId"];
  uint64_t v11 = [v10 unsignedIntValue];

  double v12 = [(AXBackBoardServerInstance *)self delegate];
  int v13 = [v4 objectForKeyedSubscript:@"displayId"];
  objc_msgSend(v12, "convertFrame:fromContextId:displayId:", v11, objc_msgSend(v13, "unsignedIntValue"), x, y, width, height);
  self->_initialZoomFocusRect.origin.double x = v14;
  self->_initialZoomFocusRect.origin.double y = v15;
  self->_initialZoomFocusRect.size.double width = v16;
  self->_initialZoomFocusRect.size.double height = v17;

  return 0;
}

- (id)_handleGetZoomInitialFocusRect:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 payload];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"contextId"];
  uint64_t v7 = [v6 unsignedIntValue];

  id v8 = [(AXBackBoardServerInstance *)self delegate];
  id v9 = [v4 payload];

  int v10 = [v9 objectForKeyedSubscript:@"displayId"];
  objc_msgSend(v8, "convertFrame:toContextId:displayId:", v7, objc_msgSend(v10, "unsignedIntValue"), self->_initialZoomFocusRect.origin.x, self->_initialZoomFocusRect.origin.y, self->_initialZoomFocusRect.size.width, self->_initialZoomFocusRect.size.height);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  NSPoint v23 = @"rect";
  v26.origin.double x = v12;
  v26.origin.double y = v14;
  v26.size.double width = v16;
  v26.size.double height = v18;
  NSRect v19 = NSStringFromRect(v26);
  v24[0] = v19;
  double v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

  double v21 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2041 payload:v20];

  return v21;
}

- (id)_gaxBackboard
{
  id v2 = (void *)_gaxBackboard_gaxBackboard;
  if (!_gaxBackboard_gaxBackboard)
  {
    uint64_t v3 = [NSClassFromString(&cfstr_Gaxbackboard.isa) safeValueForKey:@"sharedInstance"];
    id v4 = (void *)_gaxBackboard_gaxBackboard;
    _gaxBackboard_gaxBackboard = v3;

    id v2 = (void *)_gaxBackboard_gaxBackboard;
  }

  return v2;
}

- (BOOL)_inPreBoardMode
{
  return InPreBoardMode;
}

- (BOOL)_inCheckerBoardMode
{
  return InCheckerBoardMode;
}

- (BOOL)_sessionIsLoginSession
{
  return SessionIsLoginSession;
}

- (id)_handleInPreBoardMode:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AXBackBoardServerInstance _inPreBoardMode](self, "_inPreBoardMode"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:2029 payload:v6];

  return v7;
}

- (id)_handleSetInPreBoardMode:(id)a3
{
  uint64_t v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"inPreboardMode"];
  InPreBoardMode = [v4 BOOLValue];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F22670], 0, 0, 1u);
  return 0;
}

- (id)_handleInCheckerBoardMode:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AXBackBoardServerInstance _inCheckerBoardMode](self, "_inCheckerBoardMode"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:2065 payload:v6];

  return v7;
}

- (id)_handleSetInCheckerBoardMode:(id)a3
{
  uint64_t v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"inCheckerBoardMode"];
  InCheckerBoardMode = [v4 BOOLValue];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F22668], 0, 0, 1u);
  return 0;
}

- (id)_handleTripleClickHomeButtonFired:(id)a3
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)*MEMORY[0x263F8B3C0], 0, 0, 1u);
  return 0;
}

- (id)_handleHomeClickSwallowedForGuidedAccess:(id)a3
{
  uint64_t v3 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  if (objc_opt_respondsToSelector())
  {
    id v5 = v3;
    AXPerformSafeBlock();
  }
  return 0;
}

uint64_t __70__AXBackBoardServerInstance__handleHomeClickSwallowedForGuidedAccess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeClickSwallowedInSpringBoard];
}

- (id)_handleSessionIsLoginSession:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  id v9 = @"result";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AXBackBoardServerInstance _sessionIsLoginSession](self, "_sessionIsLoginSession"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v4 initWithKey:2045 payload:v6];

  return v7;
}

- (id)_handleSetSessionIsLoginSession:(id)a3
{
  uint64_t v3 = [a3 payload];
  id v4 = [v3 objectForKeyedSubscript:@"sesionIsLoginSession"];
  SessionIsLoginSession = [v4 BOOLValue];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F22678], 0, 0, 1u);
  if (SessionIsLoginSession)
  {
    uint64_t v6 = [MEMORY[0x263F22938] sharedInstance];
    [v6 addRotorOptionsForLoginSession];

    uint64_t v7 = [MEMORY[0x263F22938] sharedInstance];
    [v7 configureZoomForLoginSession];
  }
  return 0;
}

- (id)_handleGetGuidedAccessAvailability:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 12;
  id v5 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  uint64_t v6 = v5;
  if (v5)
  {
    id v12 = v5;
    id v13 = v4;
    AXPerformSafeBlock();
  }
  id v7 = objc_alloc(MEMORY[0x263F228C0]);
  CGFloat v18 = @"availability";
  id v8 = [NSNumber numberWithUnsignedInteger:v15[3]];
  v19[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  int v10 = (void *)[v7 initWithKey:2020 payload:v9];

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __64__AXBackBoardServerInstance__handleGetGuidedAccessAvailability___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) payload];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 availabilityForExternalRequestWithSpringboardParameters:v3];
}

- (id)_handleIsGuidedAccessInWorkspace:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  id v4 = v3;
  if (v3)
  {
    double v11 = @"result";
    id v5 = NSNumber;
    if ([v3 safeBoolForKey:@"isInWorkspace"]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = [v4 safeBoolForKey:@"isPasscodeViewVisible"];
    }
    id v8 = [v5 numberWithInt:v6];
    v12[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

    id v7 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2034 payload:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_handleGuidedAccessEffectiveAppBundleIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  uint64_t v4 = [v3 safeValueForKey:@"effectiveAppBundleIdentifier"];
  id v5 = (void *)v4;
  if (v4)
  {
    id v9 = @"result";
    v10[0] = v4;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2060 payload:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_handleGuidedAccessAutomationCommand:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke;
  v19[3] = &unk_26510BA48;
  id v9 = v7;
  id v20 = v9;
  int v10 = (void (**)(void, void))MEMORY[0x2456443D0](v19);
  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      double v11 = [v6 payload];
      id v12 = [v11 objectForKeyedSubscript:@"command"];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke_2;
      v17[3] = &unk_26510BA70;
      CGFloat v18 = v10;
      [v8 handleGuidedAccessAutomationCommand:v12 completion:v17];

      id v13 = 0;
      goto LABEL_9;
    }
    id v13 = @"GAX Backbaord instance does not respond to handleGuidedAccessAutomationCommand:";
    double v15 = @"%@";
    uint64_t v16 = @"GAX Backbaord instance does not respond to handleGuidedAccessAutomationCommand:";
    LOBYTE(v14) = 1;
    _AXLogWithFacility();
  }
  else
  {
    id v13 = @"Guided Access is not loaded";
  }
  if (([(__CFString *)v13 hasPrefix:@"ERROR:", v14, v15, v16] & 1) == 0)
  {
    id v13 = [NSString stringWithFormat:@"ERROR: %@", v13];
  }
  double v21 = @"error";
  v22[0] = v13;
  id v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  ((void (**)(void, void *))v10)[2](v10, v12);
LABEL_9:
}

void __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x263F228C0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithKey:2037 payload:v4];

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"result"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_handleIsGuidedAccessActive:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F228C0]);
    id v9 = @"result";
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "safeBoolForKey:", @"isActive"));
    v10[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = (void *)[v4 initWithKey:2030 payload:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_handleSetGuidedAccessEnabledByRequestingApp:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 senderBundleId];
  id v9 = [v6 payload];
  int v10 = [v9 objectForKey:*MEMORY[0x263F22630]];
  int v11 = [v10 BOOLValue];

  id v12 = [v6 payload];
  id v13 = [v12 objectForKey:*MEMORY[0x263F22610]];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke;
  v29[3] = &unk_26510BA98;
  id v14 = v7;
  id v30 = v14;
  double v15 = (void *)MEMORY[0x2456443D0](v29);
  uint64_t v16 = v15;
  if (v8)
  {
    uint64_t v17 = [(AXBackBoardServerInstance *)self _gaxBackboard];
    CGFloat v18 = v17;
    if (v17)
    {
      v22[1] = MEMORY[0x263EF8330];
      void v22[2] = 3221225472;
      v22[3] = __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_2;
      v22[4] = &unk_26510BAC0;
      NSRect v19 = &v23;
      id v23 = v17;
      char v28 = v11;
      id v24 = v8;
      id v25 = v6;
      id v26 = v13;
      id v27 = v16;
      AXPerformSafeBlock();
    }
    else
    {
      id v20 = GAXLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v32 = v11;
        _os_log_impl(&dword_241F5C000, v20, OS_LOG_TYPE_INFO, "Received request to set Guided Access enabled=%i, but GAXBackboard was nil.", buf, 8u);
      }

      NSRect v19 = (id *)v22;
      v22[0] = v16;
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
  else
  {
    id v21 = v15;
    AXPerformBlockAsynchronouslyOnMainThread();
    CGFloat v18 = v21;
  }
}

void __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v10[2] = *MEMORY[0x263EF8340];
  v9[0] = *MEMORY[0x263F22630];
  id v5 = [NSNumber numberWithBool:a2];
  v10[0] = v5;
  v9[1] = *MEMORY[0x263F22620];
  id v6 = [NSNumber numberWithBool:a3];
  v10[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2022 payload:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_3;
  v7[3] = &unk_26510BA98;
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v4 setEnabled:v2 != 0 fromAppWithIdentifier:v3 withAuditToken:v9 configuration:v6 completion:v7];
}

uint64_t __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_614(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_2_615(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_handleIsGuidedAccessSelfLockedToRequestingApp:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = [v4 senderBundleId];
  if (v5)
  {
    uint64_t v6 = [(AXBackBoardServerInstance *)self _gaxBackboard];
    id v7 = v6;
    if (v6)
    {
      id v13 = v6;
      id v14 = v5;
      AXPerformSafeBlock();
    }
  }
  id v8 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v19 = *MEMORY[0x263F22628];
  id v9 = [NSNumber numberWithBool:*((unsigned __int8 *)v16 + 24)];
  v20[0] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  int v11 = (void *)[v8 initWithKey:2022 payload:v10];

  _Block_object_dispose(&v15, 8);

  return v11;
}

uint64_t __76__AXBackBoardServerInstance__handleIsGuidedAccessSelfLockedToRequestingApp___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSelfLockedToAppWithIdentifier:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_handleIsGuidedAccessUnmanagedSelfLocked:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v9 = @"result";
  uint64_t v3 = NSNumber;
  id v4 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isUnmanagedSelfLocked"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2054 payload:v6];

  return v7;
}

- (id)_handleIsRestrictedForAAC:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v9 = @"result";
  uint64_t v3 = NSNumber;
  id v4 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isRestrictedForAAC"));
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2072 payload:v6];

  return v7;
}

- (id)_handleGuidedAccessIgnoredRegions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  id v4 = v3;
  if (!v3) {
    goto LABEL_12;
  }
  id v5 = [v3 safeValueForKey:@"_accessIgnoredTouchRegions"];
  if (![v5 count])
  {

LABEL_12:
    id v14 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)AX_CGPathCopyDataRepresentation();
        objc_msgSend(v6, "addObject:", v12, v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  id v20 = @"result";
  id v21 = v6;
  id v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v14 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2035 payload:v13];

LABEL_13:

  return v14;
}

- (id)_handleGuidedAccessCurrentModeAndSessionApp:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXBackBoardServerInstance *)self _gaxBackboard];
  if (v3)
  {
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 currentGuidedAccessModeForBackboardServer];
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F22618]];

    if (v5)
    {
      id v7 = [v3 currentSessionApp];
      if (v7) {
        [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F22638]];
      }
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2061 payload:v4];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F228C0]);
    uint64_t v12 = *MEMORY[0x263F22618];
    v13[0] = &unk_26F637800;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = (void *)[v9 initWithKey:2061 payload:v10];
  }

  return v8;
}

- (id)_axPreferenceAsMobile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKey:@"preference"];
  uint64_t v6 = __UIAccessibilitySafeClass();

  id v7 = [v3 payload];
  uint64_t v8 = [v7 objectForKey:@"domain"];
  id v9 = __UIAccessibilitySafeClass();

  if (![v9 length])
  {

    id v9 = 0;
  }
  uint64_t v10 = (void *)MEMORY[0x245643C10](v6, v9, 0);
  int v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v12 = v11;
  if (v10) {
    [v11 setObject:v10 forKeyedSubscript:@"value"];
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x263F228C0]) initWithKey:2067 payload:v12];

  return v13;
}

- (id)_setAXPreferenceAsMobile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKey:@"preference"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKey:@"value"];

  uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {

    id v7 = 0;
  }
  uint64_t v10 = [v3 payload];
  int v11 = [v10 objectForKey:@"notification"];

  uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {

    int v11 = 0;
  }
  _AXSetPreferenceWithNotification();

  return 0;
}

- (id)_handleIsHearingControlEnabled:(id)a3
{
  id v3 = a3;
  id v4 = +[AXBHomeClickController controller];
  uint64_t v5 = [v3 payload];

  uint64_t v6 = [v5 objectForKey:@"result"];
  objc_msgSend(v4, "setIsHearingAidControlVisible:", objc_msgSend(v6, "BOOLValue"));

  return 0;
}

- (id)_handleDisableBrightnessFilters:(id)a3
{
  return 0;
}

- (id)_handleBrightnessFiltersEnabled:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXBackBoardServerInstance *)self brightnessFiltersEnabled];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  int v9 = @"result";
  uint64_t v5 = [NSNumber numberWithBool:v3];
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)[v4 initWithKey:2048 payload:v6];

  return v7;
}

- (id)_handleBlueLightStatusEnabled:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXBackBoardServerInstance *)self blueLightStatusEnabled];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  int v9 = @"result";
  uint64_t v5 = [NSNumber numberWithBool:v3];
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)[v4 initWithKey:2049 payload:v6];

  return v7;
}

- (id)_handleRestoreCachedBrightnessFilters:(id)a3
{
  return 0;
}

- (id)_handleAdaptationEnabled:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXBackBoardServerInstance *)self adaptationEnabled];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  int v9 = @"result";
  uint64_t v5 = [NSNumber numberWithBool:v3];
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)[v4 initWithKey:2051 payload:v6];

  return v7;
}

- (id)_handleSupportsAdaptation:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXBackBoardServerInstance *)self supportsAdaptation];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  int v9 = @"result";
  uint64_t v5 = [NSNumber numberWithBool:v3];
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)[v4 initWithKey:2052 payload:v6];

  return v7;
}

- (id)_handleLoadGAXBundleForUnmanagedASAM:(id)a3
{
  return 0;
}

- (id)_handleResetAccessibilityFeatures:(id)a3
{
  uint64_t v6 = [a3 senderBundleId];
  LOBYTE(v5) = 1;
  _AXLogWithFacility();

  [(AXBackBoardServerInstance *)self resetAccessibilityFeatures];
  return 0;
}

- (id)_handleToggleGuidedAccess:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_DEFAULT, "_handleToggleGuidedAccess: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x263F225A0] object:0];

  return 0;
}

- (id)_handleGetLastSetColorFilter:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  [(AXBackBoardServerInstance *)self colorFilterFromLastUpdate];
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:72];
  id v4 = objc_alloc(MEMORY[0x263F228C0]);
  uint64_t v9 = @"filterData";
  v10[0] = v3;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = (void *)[v4 initWithKey:2066 payload:v5];

  return v6;
}

- (id)_handleSetIsSpeakScreenHighlightVisible:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"visible"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(AXBackBoardServerInstance *)self delegate];
    objc_msgSend(v6, "setIsSpeakScreenHighlightVisible:", objc_msgSend(v5, "BOOLValue"));
  }
  return 0;
}

- (id)_setDeviceOrientation:(id)a3
{
  id v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"deviceOrientation"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)([v4 integerValue] - 1) <= 3) {
    BKSHIDServicesSetDeviceOrientationForAutomation();
  }

  return 0;
}

- (id)_handleSetClarityUIAdminPasscode:(id)a3
{
  id v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"passcode"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = +[AXBClarityUIManager sharedManager];
    [v6 setAdminPasscode:v5];
  }
  else
  {
    uint64_t v6 = CLFLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXBackBoardServerInstance _handleSetClarityUIAdminPasscode:](v6);
    }
  }

  return 0;
}

- (id)_handleValidateClarityUIAdminPasscode:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"passcode"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = +[AXBClarityUIManager sharedManager];
    uint64_t v7 = [v6 validateAdminPasscode:v5];

    id v8 = objc_alloc(MEMORY[0x263F228C0]);
    int v13 = @"result";
    uint64_t v9 = [NSNumber numberWithBool:v7];
    v14[0] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    int v11 = (void *)[v8 initWithKey:2077 payload:v10];
  }
  else
  {
    uint64_t v9 = CLFLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[AXBackBoardServerInstance _handleValidateClarityUIAdminPasscode:](v9);
    }
    int v11 = 0;
  }

  return v11;
}

- (AXBackBoardServerInstanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXBackBoardServerInstanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lcDeathWatcher, 0);
  objc_storeStrong((id *)&self->_fkaDeathWatcher, 0);
  objc_storeStrong((id *)&self->_astDeathWatcher, 0);
  objc_storeStrong((id *)&self->_uiServerDeathWatcher, 0);
  objc_storeStrong((id *)&self->_heardDeathWatcher, 0);
  objc_storeStrong((id *)&self->_eventTapClients, 0);
  objc_storeStrong((id *)&self->_zoomListeners, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)_handleSetClarityUIAdminPasscode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_241F5C000, log, OS_LOG_TYPE_FAULT, "Attempted to set admin passcode to non-string value.", v1, 2u);
}

- (void)_handleValidateClarityUIAdminPasscode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_241F5C000, log, OS_LOG_TYPE_FAULT, "Attempted to validate admin passcode that was a non-string value.", v1, 2u);
}

@end