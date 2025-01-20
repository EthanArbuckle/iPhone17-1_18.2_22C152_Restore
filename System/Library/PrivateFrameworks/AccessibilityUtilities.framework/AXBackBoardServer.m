@interface AXBackBoardServer
+ (id)server;
- (AXBColorFilterDescription)colorFilterFromLastUpdate;
- (AXBackBoardServer)init;
- (BOOL)_shouldDispatchLocally;
- (BOOL)adaptationEnabled;
- (BOOL)blueLightStatusEnabled;
- (BOOL)brightnessFiltersEnabled;
- (BOOL)inCheckerBoardMode;
- (BOOL)inPreboardMode;
- (BOOL)invertColorsEnabled;
- (BOOL)isGuidedAccessActive;
- (BOOL)isGuidedAccessInWorkspace;
- (BOOL)isGuidedAccessSelfLockedToApp:(id)a3;
- (BOOL)isGuidedAccessUnmanagedSelfLocked;
- (BOOL)isRestrictedForAAC;
- (BOOL)loadGAXBundleForUnmanagedASAM;
- (BOOL)preferenceRetrievalRequiresValidConnection;
- (BOOL)supportsAccessibilityDisplayFilters;
- (BOOL)supportsAdaptation;
- (BOOL)tripleClickHomeButtonPress;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 toContextId:(unsigned int)a5;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 toContextId:(unsigned int)a5 displayId:(unsigned int)a6;
- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4;
- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGRect)zoomInitialFocusRectWithQueryingContext:(unsigned int)a3;
- (id)_serviceName;
- (id)_springboardParametersForGuidedAccessAvailability;
- (id)accessibilityPreferenceAsMobile:(id)a3 domain:(id)a4;
- (id)backboardServiceInstance;
- (id)guidedAccessEffectiveAppBundleIdentifier;
- (id)guidedAccessIgnoredRegions;
- (id)performGuidedAccessAutomationCommand:(id)a3 error:(id *)a4;
- (int)accessibilityAssistiveTouchPID;
- (int)accessibilityFullKeyboardAccessDaemonPID;
- (int)accessibilityLiveCaptionsPID;
- (int)accessibilityUIServicePID;
- (int)hearingAidServerPID;
- (unint64_t)currentGuidedAccessModeAndSessionApp:(id *)a3;
- (unint64_t)guidedAccessAvailability;
- (unsigned)contextIdForPosition:(CGPoint)a3;
- (unsigned)contextIdHostingContextId:(unsigned int)a3;
- (void)_sendRequestGuidedAccessSessionMessage:(id)a3 numberOfRetryAttempts:(unint64_t)a4 completion:(id)a5;
- (void)adjustSystemZoom:(int)a3;
- (void)colorFilterFromLastUpdate;
- (void)dealloc;
- (void)disableBrightnessFilters;
- (void)guidedAccessAvailability;
- (void)guidedAccessEffectiveAppBundleIdentifier:(id)a3;
- (void)homeClickSwallowedForGuidedAccess;
- (void)isGuidedAccessUnmanagedSelfLocked;
- (void)jetsamThirdPartyApps;
- (void)postEvent:(id)a3 afterNamedTap:(id)a4 includeTaps:(id)a5;
- (void)postEvent:(id)a3 systemEvent:(BOOL)a4;
- (void)registerAccessibilityUIServicePID:(int)a3;
- (void)registerAssistiveTouchPID:(int)a3;
- (void)registerFullKeyboardAccessDaemonPID:(int)a3;
- (void)registerGestureConflictWithZoom:(id)a3;
- (void)registerHearingAidServerPID:(int)a3;
- (void)registerLiveCaptionsPID:(int)a3;
- (void)registerSiriViewServicePID:(int)a3;
- (void)requestGuidedAccessSessionEndWithCompletion:(id)a3;
- (void)requestGuidedAccessSessionStartWithConfigurationDictionary:(id)a3 completion:(id)a4;
- (void)resetAccessibilityFeatures;
- (void)restoreCachedBrightnessFilters;
- (void)sessionIsLoginSessionWithResult:(id)a3;
- (void)setAccessibilityPreferenceAsMobile:(id)a3 value:(id)a4 notification:(id)a5;
- (void)setCapsLockLightOn:(BOOL)a3;
- (void)setClarityUIAdminPasscode:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setHearingAidControlIsVisible:(BOOL)a3;
- (void)setInCheckerBoardMode:(BOOL)a3;
- (void)setInPreboardMode:(BOOL)a3;
- (void)setInvertColorsEnabled:(BOOL)a3;
- (void)setIsSpeakScreenHighlightVisible:(BOOL)a3;
- (void)setLockScreenDimTimerEnabled:(BOOL)a3;
- (void)setPreferenceRetrievalRequiresValidConnection:(BOOL)a3;
- (void)setSessionIsLoginSession:(BOOL)a3;
- (void)setSwitchControlHasScreenSwitch:(BOOL)a3;
- (void)setSwitchControlRendersDeviceUnusable:(BOOL)a3;
- (void)setZoomInitialFocusRect:(CGRect)a3 fromContext:(unsigned int)a4;
- (void)toggleGuidedAccess;
- (void)userEventOccurred;
- (void)validateClarityUIAdminPasscode:(id)a3 completion:(id)a4;
@end

@implementation AXBackBoardServer

+ (id)server
{
  if (_AXSIsNonUIBuild()) {
    goto LABEL_5;
  }
  if (AXIsASVAssetViewer_onceToken != -1) {
    dispatch_once(&AXIsASVAssetViewer_onceToken, &__block_literal_global_349);
  }
  if (AXIsASVAssetViewer_sIsASVAssetViewer)
  {
LABEL_5:
    id v2 = 0;
  }
  else
  {
    if (server_onceToken_2 != -1) {
      dispatch_once(&server_onceToken_2, &__block_literal_global_11);
    }
    id v2 = (id)server_Server_2;
  }

  return v2;
}

uint64_t __27__AXBackBoardServer_server__block_invoke()
{
  server_Server_2 = objc_alloc_init(AXBackBoardServer);

  return MEMORY[0x1F41817F8]();
}

- (AXBackBoardServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXBackBoardServer;
  id v2 = [(AXServer *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [(AXServer *)self client];
  [v3 setPortDeathHandler:0];

  v4.receiver = self;
  v4.super_class = (Class)AXBackBoardServer;
  [(AXServer *)&v4 dealloc];
}

- (id)_serviceName
{
  return @"com.apple.accessibility.AXBackBoardServer";
}

- (void)registerGestureConflictWithZoom:(id)a3
{
  id v4 = a3;
  [(AXServer *)self _connectIfNecessary];
  v6 = [[AXIPCMessage alloc] initWithKey:2000 payload:v4];

  v5 = [(AXServer *)self client];
  [v5 sendSimpleMessage:v6];
}

- (void)adjustSystemZoom:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v5 = [AXIPCMessage alloc];
  v10 = @"adjustment";
  v6 = [NSNumber numberWithUnsignedInt:v3];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [(AXIPCMessage *)v5 initWithKey:2024 payload:v7];

  v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)setLockScreenDimTimerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v5 = [AXIPCMessage alloc];
  v10 = @"enabled";
  v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [(AXIPCMessage *)v5 initWithKey:2019 payload:v7];

  v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)registerSiriViewServicePID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = [AXIPCMessage alloc];
    v10 = @"pid";
    v6 = [NSNumber numberWithInt:v3];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [(AXIPCMessage *)v5 initWithKey:2016 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __48__AXBackBoardServer_registerSiriViewServicePID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerSiriViewServicePID:*(unsigned int *)(a1 + 40)];
}

- (int)accessibilityAssistiveTouchPID
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2063 payload:0];
  id v4 = [(AXServer *)self client];
  v5 = [v4 sendMessage:v3 withError:0];

  v6 = [v5 payload];
  objc_super v7 = [v6 objectForKey:@"pid"];
  int v8 = [v7 unsignedIntValue];

  return v8;
}

- (int)accessibilityFullKeyboardAccessDaemonPID
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2070 payload:0];
  id v4 = [(AXServer *)self client];
  v5 = [v4 sendMessage:v3 withError:0];

  v6 = [v5 payload];
  objc_super v7 = [v6 objectForKey:@"pid"];
  int v8 = [v7 unsignedIntValue];

  return v8;
}

- (int)accessibilityUIServicePID
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2033 payload:0];
  id v4 = [(AXServer *)self client];
  v5 = [v4 sendMessage:v3 withError:0];

  v6 = [v5 payload];
  objc_super v7 = [v6 objectForKey:@"pid"];
  int v8 = [v7 unsignedIntValue];

  return v8;
}

- (void)registerFullKeyboardAccessDaemonPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = FKALogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v3;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Registering FKA pid: %d", buf, 8u);
    }

    v6 = [AXIPCMessage alloc];
    v11 = @"pid";
    objc_super v7 = [NSNumber numberWithInt:v3];
    v12 = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v9 = [(AXIPCMessage *)v6 initWithKey:2071 payload:v8];

    v10 = [(AXServer *)self client];
    [v10 sendSimpleMessage:v9];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __57__AXBackBoardServer_registerFullKeyboardAccessDaemonPID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerAccessibilityUIServicePID:*(unsigned int *)(a1 + 40)];
}

- (void)registerAccessibilityUIServicePID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = [AXIPCMessage alloc];
    v10 = @"pid";
    v6 = [NSNumber numberWithInt:v3];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2015 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __55__AXBackBoardServer_registerAccessibilityUIServicePID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerAccessibilityUIServicePID:*(unsigned int *)(a1 + 40)];
}

- (int)hearingAidServerPID
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2073 payload:0];
  id v4 = [(AXServer *)self client];
  v5 = [v4 sendMessage:v3 withError:0];

  v6 = [v5 payload];
  objc_super v7 = [v6 objectForKey:@"pid"];
  int v8 = [v7 unsignedIntValue];

  return v8;
}

- (void)registerHearingAidServerPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = [AXIPCMessage alloc];
    v10 = @"pid";
    v6 = [NSNumber numberWithInt:v3];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2017 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __49__AXBackBoardServer_registerHearingAidServerPID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerHearingAidServerPID:*(unsigned int *)(a1 + 40)];
}

- (void)setInPreboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = [AXIPCMessage alloc];
    v10 = @"inPreboardMode";
    v6 = [NSNumber numberWithBool:v3];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2028 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __39__AXBackBoardServer_setInPreboardMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInPreboardMode:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setInCheckerBoardMode:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = [AXIPCMessage alloc];
    v10 = @"inCheckerBoardMode";
    v6 = [NSNumber numberWithBool:v3];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2064 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __43__AXBackBoardServer_setInCheckerBoardMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInCheckerBoardMode:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_shouldDispatchLocally
{
  if (_shouldDispatchLocally_onceToken_0 != -1) {
    dispatch_once(&_shouldDispatchLocally_onceToken_0, &__block_literal_global_33_0);
  }
  return _shouldDispatchLocally_IsBackboard;
}

uint64_t __43__AXBackBoardServer__shouldDispatchLocally__block_invoke()
{
  uint64_t result = AXProcessIsBackboard();
  _shouldDispatchLocally_IsBackboard = result;
  return result;
}

- (id)backboardServiceInstance
{
  id v2 = [NSClassFromString(&cfstr_Axbackboardser_0.isa) safeValueForKey:@"backBoardServerInstanceIfExists"];
  BOOL v3 = &unk_1EDC909A0;
  if ([v2 conformsToProtocol:v3])
  {
    id v4 = v2;
  }
  else
  {
    protocol_getName((Protocol *)v3);
    _AXLogWithFacility();
    id v4 = 0;
  }

  return v4;
}

- (BOOL)inPreboardMode
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    char v4 = [(AXIPCMessage *)v3 _inPreBoardMode];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:2029 payload:0];
    char v4 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)inCheckerBoardMode
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    char v4 = [(AXIPCMessage *)v3 _inCheckerBoardMode];
  }
  else
  {
    BOOL v3 = [[AXIPCMessage alloc] initWithKey:2065 payload:0];
    char v4 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)setSessionIsLoginSession:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    BOOL v5 = [AXIPCMessage alloc];
    v10 = @"sesionIsLoginSession";
    v6 = [NSNumber numberWithBool:v3];
    v11[0] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2044 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __46__AXBackBoardServer_setSessionIsLoginSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSessionIsLoginSession:*(unsigned __int8 *)(a1 + 40)];
}

- (void)sessionIsLoginSessionWithResult:(id)a3
{
  char v4 = (void (**)(id, uint64_t))a3;
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    BOOL v5 = [(AXBackBoardServer *)self backboardServiceInstance];
    uint64_t v6 = [v5 _sessionIsLoginSession];
    if (v4) {
      v4[2](v4, v6);
    }
  }
  else
  {
    objc_super v7 = [[AXIPCMessage alloc] initWithKey:2045 payload:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__AXBackBoardServer_sessionIsLoginSessionWithResult___block_invoke;
    v8[3] = &unk_1E5586688;
    v9 = v4;
    [(AXServer *)self sendAsynchronousMessage:v7 replyOnQueue:MEMORY[0x1E4F14428] handler:v8];
  }
}

void __53__AXBackBoardServer_sessionIsLoginSessionWithResult___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 payload];
  id v6 = [v3 objectForKey:@"result"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = v6;
  }
  else
  {

    char v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v4;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, [v4 BOOLValue]);
    char v4 = v7;
  }
}

- (void)registerAssistiveTouchPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    uint64_t v5 = [AXIPCMessage alloc];
    v10 = @"pid";
    id v6 = [NSNumber numberWithInt:v3];
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2014 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __47__AXBackBoardServer_registerAssistiveTouchPID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerAssistiveTouchPID:*(unsigned int *)(a1 + 40)];
}

- (void)registerLiveCaptionsPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(AXServer *)self _connectIfNecessary])
  {
    uint64_t v5 = [AXIPCMessage alloc];
    v10 = @"pid";
    id v6 = [NSNumber numberWithInt:v3];
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v8 = [(AXIPCMessage *)v5 initWithKey:2018 payload:v7];

    v9 = [(AXServer *)self client];
    [v9 sendSimpleMessage:v8];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __45__AXBackBoardServer_registerLiveCaptionsPID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerLiveCaptionsPID:*(unsigned int *)(a1 + 40)];
}

- (int)accessibilityLiveCaptionsPID
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2078 payload:0];
  char v4 = [(AXServer *)self client];
  uint64_t v5 = [v4 sendMessage:v3 withError:0];

  id v6 = [v5 payload];
  id v7 = [v6 objectForKey:@"pid"];
  int v8 = [v7 unsignedIntValue];

  return v8;
}

- (BOOL)invertColorsEnabled
{
  return _AXSInvertColorsEnabled() != 0;
}

- (void)setInvertColorsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  v10 = @"enabled";
  id v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  int v8 = [(AXIPCMessage *)v5 initWithKey:2025 payload:v7];

  v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8 withError:0];
}

- (void)postEvent:(id)a3 afterNamedTap:(id)a4 includeTaps:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  [(AXServer *)self _connectIfNecessary];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = v10;
  if (v14) {
    [v10 setObject:v14 forKeyedSubscript:@"record"];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:@"namedTaps"];
  }
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:@"afterNamedTap"];
  }
  v12 = [[AXIPCMessage alloc] initWithKey:2009 payload:v11];
  v13 = [(AXServer *)self client];
  [v13 sendSimpleMessage:v12];
}

- (void)postEvent:(id)a3 systemEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  [(AXServer *)self _connectIfNecessary];
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = [NSNumber numberWithBool:v4];
  id v8 = [v6 dictionaryWithObject:v7 forKey:@"systemEvent"];

  if (v11) {
    [v8 setObject:v11 forKeyedSubscript:@"record"];
  }
  id v9 = [[AXIPCMessage alloc] initWithKey:2009 payload:v8];
  id v10 = [(AXServer *)self client];
  [v10 sendSimpleMessage:v9];
}

- (unsigned)contextIdForPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v15[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  id v14 = @"displayPoint";
  v16.CGFloat x = x;
  v16.CGFloat y = y;
  id v6 = NSStringFromPoint(v16);
  v15[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  id v8 = [[AXIPCMessage alloc] initWithKey:2032 payload:v7];
  id v9 = [(AXServer *)self client];
  id v10 = [v9 sendMessage:v8 withError:0];

  id v11 = [v10 payload];
  v12 = [v11 objectForKey:@"result"];
  LODWORD(v9) = [v12 unsignedIntValue];

  return v9;
}

- (unsigned)contextIdHostingContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v13 = @"contextId";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  v14[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  id v7 = [[AXIPCMessage alloc] initWithKey:2031 payload:v6];
  id v8 = [(AXServer *)self client];
  id v9 = [v8 sendMessage:v7 withError:0];

  id v10 = [v9 payload];
  id v11 = [v10 objectForKey:@"result"];
  LODWORD(v8) = [v11 unsignedIntValue];

  return v8;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 toContextId:(unsigned int)a5
{
  -[AXBackBoardServer convertFrame:fromContextId:toContextId:displayId:](self, "convertFrame:fromContextId:toContextId:displayId:", *(void *)&a4, *(void *)&a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4
{
  -[AXBackBoardServer convertFrame:toContextId:displayId:](self, "convertFrame:toContextId:displayId:", *(void *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4
{
  -[AXBackBoardServer convertFrame:fromContextId:displayId:](self, "convertFrame:fromContextId:displayId:", *(void *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 toContextId:(unsigned int)a5 displayId:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v36[4] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v35[0] = @"fromContextId";
  id v14 = [NSNumber numberWithUnsignedInt:v8];
  v36[0] = v14;
  v35[1] = @"toContextId";
  uint64_t v15 = [NSNumber numberWithUnsignedInt:v7];
  v36[1] = v15;
  v35[2] = @"displayId";
  NSPoint v16 = [NSNumber numberWithUnsignedInt:v6];
  v36[2] = v16;
  v35[3] = @"frame";
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  v17 = NSStringFromRect(v37);
  v36[3] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

  v19 = [[AXIPCMessage alloc] initWithKey:2042 payload:v18];
  v20 = [(AXServer *)self client];
  id v34 = 0;
  v21 = [v20 sendMessage:v19 withError:&v34];
  id v22 = v34;

  if (v22)
  {
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    v33 = NSStringFromRect(v38);
    _AXLogWithFacility();

    CGFloat v23 = *MEMORY[0x1E4F1DB28];
    CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v27 = [v21 payload];
    v28 = [v27 objectForKeyedSubscript:@"frame"];
    NSRect v39 = NSRectFromString(v28);
    CGFloat v23 = v39.origin.x;
    CGFloat v24 = v39.origin.y;
    CGFloat v25 = v39.size.width;
    CGFloat v26 = v39.size.height;
  }
  double v29 = v23;
  double v30 = v24;
  double v31 = v25;
  double v32 = v26;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v30[3] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v29[0] = @"contextId";
  v12 = [NSNumber numberWithUnsignedInt:v6];
  v30[0] = v12;
  v29[1] = @"displayId";
  v13 = [NSNumber numberWithUnsignedInt:v5];
  v30[1] = v13;
  v29[2] = @"frame";
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  id v14 = NSStringFromRect(v31);
  v30[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

  NSPoint v16 = [[AXIPCMessage alloc] initWithKey:2008 payload:v15];
  v17 = [(AXServer *)self client];
  v18 = [v17 sendMessage:v16 withError:0];

  v19 = [v18 payload];
  v20 = [v19 objectForKey:@"frame"];
  NSRect v32 = NSRectFromString(v20);
  CGFloat v21 = v32.origin.x;
  CGFloat v22 = v32.origin.y;
  CGFloat v23 = v32.size.width;
  CGFloat v24 = v32.size.height;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v37[3] = *MEMORY[0x1E4F143B8];
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    v12 = [(AXBackBoardServer *)self backboardServiceInstance];
    v13 = [v12 delegate];
    id v14 = &unk_1EDC90A00;
    if ([v13 conformsToProtocol:v14])
    {
      objc_msgSend(v13, "convertFrame:fromContextId:displayId:", v6, 0, x, y, width, height);
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
    }
    else
    {
      protocol_getName((Protocol *)v14);
      _AXLogWithFacility();
      CGFloat v16 = *MEMORY[0x1E4F1DB20];
      CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    v36[0] = @"contextId";
    CGFloat v23 = [NSNumber numberWithUnsignedInt:v6];
    v37[0] = v23;
    v36[1] = @"displayId";
    CGFloat v24 = [NSNumber numberWithUnsignedInt:v5];
    v37[1] = v24;
    v36[2] = @"frame";
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    double v25 = NSStringFromRect(v38);
    v37[2] = v25;
    double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];

    double v27 = [[AXIPCMessage alloc] initWithKey:2007 payload:v26];
    double v28 = [(AXServer *)self client];
    double v29 = [v28 sendMessage:v27 withError:0];

    double v30 = [v29 payload];
    NSRect v31 = [v30 objectForKey:@"frame"];
    NSRect v39 = NSRectFromString(v31);
    CGFloat v16 = v39.origin.x;
    CGFloat v18 = v39.origin.y;
    CGFloat v20 = v39.size.width;
    CGFloat v22 = v39.size.height;
  }
  double v32 = v16;
  double v33 = v18;
  double v34 = v20;
  double v35 = v22;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4
{
  -[AXBackBoardServer convertPoint:fromContextId:displayId:](self, "convertPoint:fromContextId:displayId:", *(void *)&a4, 0, a3.x, a3.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4
{
  -[AXBackBoardServer convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", *(void *)&a4, 0, a3.x, a3.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v23[3] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v22[0] = @"contextId";
  id v10 = [NSNumber numberWithUnsignedInt:v6];
  v23[0] = v10;
  v22[1] = @"displayId";
  id v11 = [NSNumber numberWithUnsignedInt:v5];
  v23[1] = v11;
  v22[2] = @"point";
  v24.CGFloat x = x;
  v24.CGFloat y = y;
  v12 = NSStringFromPoint(v24);
  v23[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  id v14 = [[AXIPCMessage alloc] initWithKey:2068 payload:v13];
  double v15 = [(AXServer *)self client];
  CGFloat v16 = [v15 sendMessage:v14 withError:0];

  double v17 = [v16 payload];
  CGFloat v18 = [v17 objectForKey:@"point"];
  NSPoint v19 = NSPointFromString(v18);

  double v20 = v19.x;
  double v21 = v19.y;
  result.CGFloat y = v21;
  result.CGFloat x = v20;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v23[3] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v22[0] = @"contextId";
  id v10 = [NSNumber numberWithUnsignedInt:v6];
  v23[0] = v10;
  v22[1] = @"displayId";
  id v11 = [NSNumber numberWithUnsignedInt:v5];
  v23[1] = v11;
  v22[2] = @"point";
  v24.CGFloat x = x;
  v24.CGFloat y = y;
  v12 = NSStringFromPoint(v24);
  v23[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  id v14 = [[AXIPCMessage alloc] initWithKey:2069 payload:v13];
  double v15 = [(AXServer *)self client];
  CGFloat v16 = [v15 sendMessage:v14 withError:0];

  double v17 = [v16 payload];
  CGFloat v18 = [v17 objectForKey:@"point"];
  NSPoint v19 = NSPointFromString(v18);

  double v20 = v19.x;
  double v21 = v19.y;
  result.CGFloat y = v21;
  result.CGFloat x = v20;
  return result;
}

- (void)userEventOccurred
{
  [(AXServer *)self _connectIfNecessary];
  double v4 = [[AXIPCMessage alloc] initWithKey:2011 payload:0];
  uint64_t v3 = [(AXServer *)self client];
  [v3 sendSimpleMessage:v4];
}

- (void)setCapsLockLightOn:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  id v10 = @"on";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(AXIPCMessage *)v5 initWithKey:2043 payload:v7];

  id v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)setHearingAidControlIsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  id v10 = @"result";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(AXIPCMessage *)v5 initWithKey:2023 payload:v7];

  id v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)setSwitchControlRendersDeviceUnusable:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  id v10 = @"result";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(AXIPCMessage *)v5 initWithKey:2036 payload:v7];

  id v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (void)setSwitchControlHasScreenSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  id v10 = @"result";
  uint64_t v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(AXIPCMessage *)v5 initWithKey:2062 payload:v7];

  id v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8];
}

- (id)accessibilityPreferenceAsMobile:(id)a3 domain:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  if (v6)
  {
    [(AXServer *)self _connectIfNecessary];
    v45[0] = @"preference";
    v45[1] = @"domain";
    uint64_t v8 = &stru_1EDC3DEF8;
    if (v7) {
      uint64_t v8 = v7;
    }
    v46[0] = v6;
    v46[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke;
    aBlock[3] = &unk_1E5586F90;
    id v10 = v9;
    id v39 = v10;
    v40 = self;
    id v11 = _Block_copy(aBlock);
    uint64_t v32 = 0;
    double v33 = &v32;
    uint64_t v34 = 0x3032000000;
    double v35 = __Block_byref_object_copy__5;
    v36 = __Block_byref_object_dispose__5;
    id v37 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    if ([(AXBackBoardServer *)self preferenceRetrievalRequiresValidConnection])
    {
      v13 = AXLogBackboardServer();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v6;
        _os_log_impl(&dword_18D308000, v13, OS_LOG_TYPE_DEFAULT, "Requiring valid connection before requesting preference %@", buf, 0xCu);
      }

      id v14 = [(AXServer *)self client];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke_197;
      v28[3] = &unk_1E5586FB8;
      NSRect v31 = &v32;
      id v30 = v11;
      double v15 = v12;
      double v29 = v15;
      [v14 establishConnectionWithTimeout:v28 completion:10000.0];

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      CGFloat v16 = AXLogBackboardServer();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = [(id)v33[5] payload];
        CGFloat v18 = [v17 objectForKeyedSubscript:@"value"];
        *(_DWORD *)buf = 138412290;
        id v42 = v18;
        _os_log_impl(&dword_18D308000, v16, OS_LOG_TYPE_DEFAULT, "Made connection and result: %@", buf, 0xCu);
      }
      id v19 = v30;
    }
    else
    {
      id v27 = 0;
      uint64_t v21 = (*((void (**)(void *, id *))v11 + 2))(v11, &v27);
      id v19 = v27;
      CGFloat v22 = (void *)v33[5];
      v33[5] = v21;

      CGFloat v23 = AXLogBackboardServer();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        NSPoint v24 = (void *)v33[5];
        *(_DWORD *)buf = 138412546;
        id v42 = v24;
        __int16 v43 = 2112;
        id v44 = v19;
        _os_log_impl(&dword_18D308000, v23, OS_LOG_TYPE_INFO, "Fetched value: %@ with error: %@", buf, 0x16u);
      }
    }
    double v25 = [(id)v33[5] payload];
    double v20 = [v25 objectForKeyedSubscript:@"value"];

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

id __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = [[AXIPCMessage alloc] initWithKey:2067 payload:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) client];
  id v6 = [v5 sendMessage:v4 withError:a2];

  return v6;
}

intptr_t __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke_197(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v4 = AXLogBackboardServer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 138412290;
    double v15 = v5;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "Establish connect? %@", buf, 0xCu);
  }
  int v6 = 21;
  do
  {
    if (!--v6) {
      break;
    }
    uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v8 = 0;
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    id v11 = AXLogBackboardServer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      double v15 = v12;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "Fetched value: %@ with error: %@", buf, 0x16u);
    }
  }
  while (v8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAccessibilityPreferenceAsMobile:(id)a3 value:(id)a4 notification:(id)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        [(AXServer *)self _connectIfNecessary];
        v16[0] = @"preference";
        v16[1] = @"value";
        v17[0] = v8;
        v17[1] = v9;
        v16[2] = @"notification";
        v17[2] = v11;
        dispatch_semaphore_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
        v13 = [[AXIPCMessage alloc] initWithKey:2027 payload:v12];
        id v14 = [(AXServer *)self client];
        id v15 = (id)[v14 sendMessage:v13 withError:0];

        goto LABEL_5;
      }
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
      if (v11) {
        goto LABEL_4;
      }
    }
    id v11 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_4;
  }
LABEL_5:
}

- (void)setZoomInitialFocusRect:(CGRect)a3 fromContext:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v16[2] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  v15[0] = @"rect";
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  id v10 = NSStringFromRect(v17);
  v15[1] = @"contextId";
  v16[0] = v10;
  id v11 = [NSNumber numberWithUnsignedInt:v4];
  v16[1] = v11;
  dispatch_semaphore_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13 = [[AXIPCMessage alloc] initWithKey:2040 payload:v12];
  id v14 = [(AXServer *)self client];
  [v14 sendSimpleMessage:v13];
}

- (CGRect)zoomInitialFocusRectWithQueryingContext:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v5 = [AXIPCMessage alloc];
  CGFloat v23 = @"contextId";
  int v6 = [NSNumber numberWithUnsignedInt:v3];
  v24[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v8 = [(AXIPCMessage *)v5 initWithKey:2041 payload:v7];

  id v9 = [(AXServer *)self client];
  id v22 = 0;
  id v10 = [v9 sendMessage:v8 withError:&v22];
  id v11 = v22;

  if (v11)
  {
    _AXLogWithFacility();
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    __int16 v16 = [v10 payload];
    NSRect v17 = [v16 objectForKeyedSubscript:@"rect"];
    NSRect v25 = NSRectFromString(v17);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)tripleClickHomeButtonPress
{
  id v2 = self;
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2055 payload:0];
  LOBYTE(v2) = [(AXServer *)v2 sendSimpleMessageWithResult:v3];

  return (char)v2;
}

- (void)homeClickSwallowedForGuidedAccess
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2056 payload:0];
  [(AXServer *)self sendSimpleMessage:v3];
}

- (id)_springboardParametersForGuidedAccessAvailability
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = +[AXSpringBoardServer server];
  uint64_t v3 = [v2 isAppSwitcherVisible];
  uint64_t v4 = [v2 isSystemAppFrontmostExludingSiri];
  uint64_t v5 = [v2 isSyncingRestoringResettingOrUpdating];
  v11[0] = @"isSpringBoardFrontmost";
  int v6 = [NSNumber numberWithBool:v4];
  v12[0] = v6;
  v11[1] = @"isSyncingRestoringResettingOrUpdating";
  uint64_t v7 = [NSNumber numberWithBool:v5];
  v12[1] = v7;
  void v11[2] = @"isAppSwitcherVisible";
  id v8 = [NSNumber numberWithBool:v3];
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (BOOL)isGuidedAccessActive
{
  id v2 = self;
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2030 payload:0];
  LOBYTE(v2) = [(AXServer *)v2 sendSimpleMessageWithResult:v3];

  return (char)v2;
}

- (BOOL)isGuidedAccessInWorkspace
{
  id v2 = self;
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2034 payload:0];
  LOBYTE(v2) = [(AXServer *)v2 sendSimpleMessageWithResult:v3];

  return (char)v2;
}

- (id)guidedAccessEffectiveAppBundleIdentifier
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2060 payload:0];
  uint64_t v4 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];

  objc_opt_class();
  id v5 = 0;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }

  return v5;
}

- (void)guidedAccessEffectiveAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(AXServer *)self _connectIfNecessary];
  id v5 = [[AXIPCMessage alloc] initWithKey:2060 payload:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AXBackBoardServer_guidedAccessEffectiveAppBundleIdentifier___block_invoke;
  v7[3] = &unk_1E5586688;
  id v8 = v4;
  id v6 = v4;
  [(AXServer *)self sendAsynchronousMessage:v5 replyOnQueue:MEMORY[0x1E4F14428] handler:v7];
}

uint64_t __62__AXBackBoardServer_guidedAccessEffectiveAppBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  id v6 = [v3 objectForKey:@"result"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {

  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (id)performGuidedAccessAutomationCommand:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(AXServer *)self _connectIfNecessary];
  uint64_t v7 = [AXIPCMessage alloc];
  NSRect v17 = @"command";
  v18[0] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  id v9 = [(AXIPCMessage *)v7 initWithKey:2037 payload:v8];
  id v10 = [(AXServer *)self sendMessage:v9];

  if (a4)
  {
    id v11 = [v10 payload];
    dispatch_semaphore_t v12 = [v11 objectForKey:@"error"];

    id v13 = v12;
    *a4 = v13;
  }
  id v14 = [v10 payload];
  id v15 = [v14 objectForKey:@"result"];

  return v15;
}

- (unint64_t)guidedAccessAvailability
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [AXIPCMessage alloc];
  uint64_t v4 = [(AXBackBoardServer *)self _springboardParametersForGuidedAccessAvailability];
  id v5 = [(AXIPCMessage *)v3 initWithKey:2020 payload:v4];

  id v6 = [(AXServer *)self client];
  id v13 = 0;
  uint64_t v7 = [v6 sendMessage:v5 withError:&v13];
  id v8 = v13;

  if (v8)
  {
    id v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXBackBoardServer guidedAccessAvailability]();
    }
    unint64_t v10 = 12;
  }
  else
  {
    id v9 = [v7 payload];
    id v11 = [v9 objectForKey:@"availability"];
    unint64_t v10 = [v11 unsignedIntegerValue];
  }
  return v10;
}

- (void)_sendRequestGuidedAccessSessionMessage:(id)a3 numberOfRetryAttempts:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(AXServer *)self client];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke;
  v13[3] = &unk_1E5587008;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [v10 sendAsyncMessage:v12 withReplyHandler:v13];
}

void __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_cold_1();
    }

    goto LABEL_5;
  }
  id v8 = [v5 payload];
  id v9 = [v8 objectForKey:@"AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled"];
  char v10 = [v9 BOOLValue];

  id v11 = [v5 payload];
  id v12 = [v11 objectForKeyedSubscript:@"AXGuidedAccessPayloadKeyIsTemporaryFailure"];
  int v13 = [v12 BOOLValue];

  if ((v10 & 1) != 0 || !v13 || !*(void *)(a1 + 56))
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_6;
  }
  id v14 = GAXLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v15;
    _os_log_impl(&dword_18D308000, v14, OS_LOG_TYPE_INFO, "Attempting to request session again after temporary failure. Attempts remaining: %lu", buf, 0xCu);
  }

  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  AXPerformBlockOnMainThreadAfterDelay();

LABEL_6:
}

uint64_t __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_232(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequestGuidedAccessSessionMessage:*(void *)(a1 + 40) numberOfRetryAttempts:*(void *)(a1 + 56) - 1 completion:*(void *)(a1 + 48)];
}

- (void)requestGuidedAccessSessionStartWithConfigurationDictionary:(id)a3 completion:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(AXServer *)self _connectIfNecessary];
  v11[0] = @"AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled";
  v11[1] = @"AXGuidedAccessPayloadKeyGAXConfiguration";
  v12[0] = MEMORY[0x1E4F1CC38];
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [AXIPCMessage alloc];

  char v10 = [(AXIPCMessage *)v9 initWithKey:2022 payload:v8];
  [(AXBackBoardServer *)self _sendRequestGuidedAccessSessionMessage:v10 numberOfRetryAttempts:5 completion:v6];
}

- (void)requestGuidedAccessSessionEndWithCompletion:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXServer *)self _connectIfNecessary];
  id v11 = @"AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled";
  v12[0] = MEMORY[0x1E4F1CC28];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v6 = [[AXIPCMessage alloc] initWithKey:2022 payload:v5];
  id v7 = [(AXServer *)self client];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__AXBackBoardServer_requestGuidedAccessSessionEndWithCompletion___block_invoke;
  v9[3] = &unk_1E5586688;
  id v10 = v4;
  id v8 = v4;
  [v7 sendAsyncMessage:v6 withReplyHandler:v9];
}

void __65__AXBackBoardServer_requestGuidedAccessSessionEndWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id v7 = [a2 payload];
    id v8 = [v7 objectForKey:@"AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled"];
    [v8 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isGuidedAccessSelfLockedToApp:(id)a3
{
  if (!a3) {
    return 0;
  }
  [(AXServer *)self _connectIfNecessary];
  id v4 = [[AXIPCMessage alloc] initWithKey:2021 payload:0];
  id v5 = [(AXServer *)self client];
  id v12 = 0;
  id v6 = [v5 sendMessage:v4 withError:&v12];
  id v7 = v12;

  if (v7)
  {
    id v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXBackBoardServer isGuidedAccessSelfLockedToApp:]();
    }
    char v9 = 0;
  }
  else
  {
    id v8 = [v6 payload];
    id v10 = [v8 objectForKey:@"AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled"];
    char v9 = [v10 BOOLValue];
  }
  return v9;
}

- (BOOL)isGuidedAccessUnmanagedSelfLocked
{
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2054 payload:0];
  id v4 = [(AXServer *)self client];
  id v11 = 0;
  id v5 = [v4 sendMessage:v3 withError:&v11];
  id v6 = v11;

  if (v6)
  {
    id v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXBackBoardServer isGuidedAccessUnmanagedSelfLocked]();
    }
    char v8 = 0;
  }
  else
  {
    id v7 = [v5 payload];
    char v9 = [v7 objectForKeyedSubscript:@"result"];
    char v8 = [v9 BOOLValue];
  }
  return v8;
}

- (BOOL)isRestrictedForAAC
{
  id v2 = self;
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2072 payload:0];
  LOBYTE(v2) = [(AXServer *)v2 sendSimpleMessageWithResult:v3];

  return (char)v2;
}

- (void)toggleGuidedAccess
{
  uint64_t v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "Toggle Guided Access", v6, 2u);
  }

  [(AXServer *)self _connectIfNecessary];
  id v4 = [[AXIPCMessage alloc] initWithKey:2058 payload:0];
  id v5 = [(AXServer *)self client];
  [v5 sendSimpleMessage:v4];
}

- (id)guidedAccessIgnoredRegions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2035 payload:0];
  id v4 = [(AXServer *)self sendSimpleMessageWithObjectResult:v3];

  if ([v4 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = AX_CGPathCreateWithDataRepresentation(*(void *)(*((void *)&v14 + 1) + 8 * i));
          if (v11)
          {
            id v12 = (const void *)v11;
            objc_msgSend(v5, "addObject:", v11, (void)v14);
            CFRelease(v12);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)currentGuidedAccessModeAndSessionApp:(id *)a3
{
  [(AXServer *)self _connectIfNecessary];
  id v5 = [[AXIPCMessage alloc] initWithKey:2061 payload:0];
  id v6 = [(AXServer *)self sendMessage:v5];
  uint64_t v7 = [v6 payload];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"AXGuidedAccessPayloadKeyGAXMode"];
  unint64_t v9 = [v8 unsignedIntegerValue];

  if (a3)
  {
    if (v9)
    {
      id v10 = [v7 objectForKeyedSubscript:@"AXGuidedAccessPayloadKeySessionApp"];
      *a3 = v10;
    }
    else
    {
      *a3 = 0;
    }
  }

  return v9;
}

- (void)jetsamThirdPartyApps
{
  [(AXServer *)self _connectIfNecessary];
  id v4 = [[AXIPCMessage alloc] initWithKey:2026 payload:0];
  uint64_t v3 = [(AXServer *)self client];
  [v3 sendSimpleMessage:v4];
}

- (void)disableBrightnessFilters
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    [(AXIPCMessage *)v3 disableBrightnessFilters];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2047 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)brightnessFiltersEnabled
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    char v4 = [(AXIPCMessage *)v3 brightnessFiltersEnabled];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2048 payload:0];
    char v4 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)blueLightStatusEnabled
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    char v4 = [(AXIPCMessage *)v3 blueLightStatusEnabled];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2049 payload:0];
    char v4 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)restoreCachedBrightnessFilters
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    [(AXIPCMessage *)v3 restoreCachedBrightnessFilters];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2050 payload:0];
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }
}

- (BOOL)adaptationEnabled
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    char v4 = [(AXIPCMessage *)v3 adaptationEnabled];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2051 payload:0];
    char v4 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)supportsAdaptation
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    uint64_t v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    char v4 = [(AXIPCMessage *)v3 supportsAdaptation];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v3 = [[AXIPCMessage alloc] initWithKey:2052 payload:0];
    char v4 = [(AXServer *)self sendSimpleMessageWithResult:v3];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)supportsAccessibilityDisplayFilters
{
  id v2 = +[AXSettings sharedInstance];
  char v3 = [v2 supportsAdvancedDisplayFilters];

  return v3;
}

- (BOOL)loadGAXBundleForUnmanagedASAM
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    char v3 = [(AXBackBoardServer *)self backboardServiceInstance];
    [v3 forceLoadGAXBundle];

    return 1;
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    BOOL v5 = [[AXIPCMessage alloc] initWithKey:2053 payload:0];
    id v6 = [(AXServer *)self client];
    uint64_t v10 = 0;
    id v7 = (id)[v6 sendMessage:v5 withError:&v10];
    uint64_t v8 = v10;

    BOOL v4 = v8 == 0;
  }
  return v4;
}

- (void)resetAccessibilityFeatures
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    id v7 = [(AXBackBoardServer *)self backboardServiceInstance];
    [v7 resetAccessibilityFeatures];
  }
  else
  {
    [(AXServer *)self _connectIfNecessary];
    char v3 = [[AXIPCMessage alloc] initWithKey:2057 payload:0];
    BOOL v4 = [(AXServer *)self client];
    id v8 = 0;
    id v5 = (id)[v4 sendMessage:v3 withError:&v8];
    id v6 = v8;

    if (v6) {
      _AXLogWithFacility();
    }
  }
}

- (AXBColorFilterDescription)colorFilterFromLastUpdate
{
  if ([(AXBackBoardServer *)self _shouldDispatchLocally])
  {
    id v5 = [(AXBackBoardServer *)self backboardServiceInstance];
    if (v5)
    {
      uint64_t v19 = v5;
      [v5 colorFilterFromLastUpdate];
      id v5 = v19;
    }
    else
    {
      retstr->var0[2][2] = 0.0;
      *(_OWORD *)&retstr->var0[1][1] = 0u;
      *(_OWORD *)&retstr->var0[2][0] = 0u;
      *(_OWORD *)&retstr->var0[0][0] = 0u;
      *(_OWORD *)&retstr->var0[0][2] = 0u;
    }
  }
  else
  {
    retstr->var0[2][2] = 0.0;
    *(_OWORD *)&retstr->var0[1][1] = 0u;
    *(_OWORD *)&retstr->var0[2][0] = 0u;
    *(_OWORD *)&retstr->var0[0][0] = 0u;
    *(_OWORD *)&retstr->var0[0][2] = 0u;
    [(AXServer *)self _connectIfNecessary];
    id v6 = [[AXIPCMessage alloc] initWithKey:2066 payload:0];
    id v7 = [(AXServer *)self client];
    id v20 = 0;
    id v8 = [v7 sendMessage:v6 withError:&v20];
    id v9 = v20;

    if (v9)
    {
      uint64_t v10 = AXLogBackboardServer();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXBackBoardServer colorFilterFromLastUpdate]();
      }
    }
    uint64_t v11 = [v8 payload];
    id v12 = [v11 objectForKeyedSubscript:@"filterData"];

    if ([v12 length] == 72)
    {
      uint64_t v13 = [v12 bytes];
      *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)v13;
      long long v15 = *(_OWORD *)(v13 + 32);
      long long v14 = *(_OWORD *)(v13 + 48);
      long long v16 = *(_OWORD *)(v13 + 16);
      retstr->var0[2][2] = *(double *)(v13 + 64);
      *(_OWORD *)&retstr->var0[1][1] = v15;
      *(_OWORD *)&retstr->var0[2][0] = v14;
      *(_OWORD *)&retstr->var0[0][2] = v16;
    }
    else
    {
      long long v17 = AXLogBackboardServer();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(AXBackBoardServer *)v12 colorFilterFromLastUpdate];
      }
    }
  }
  return result;
}

- (void)setIsSpeakScreenHighlightVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  id v5 = [AXIPCMessage alloc];
  uint64_t v10 = @"visible";
  id v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(AXIPCMessage *)v5 initWithKey:2074 payload:v7];

  id v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8 withError:0];
}

- (void)setDeviceOrientation:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(AXServer *)self _connectIfNecessary];
  id v5 = [AXIPCMessage alloc];
  uint64_t v10 = @"deviceOrientation";
  id v6 = [NSNumber numberWithLong:a3];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(AXIPCMessage *)v5 initWithKey:2075 payload:v7];

  id v9 = [(AXServer *)self client];
  [v9 sendSimpleMessage:v8 withError:0];
}

- (void)setClarityUIAdminPasscode:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXServer *)self _connectIfNecessary];
  id v5 = [AXIPCMessage alloc];
  id v9 = @"passcode";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(AXIPCMessage *)v5 initWithKey:2076 payload:v6];
  id v8 = [(AXServer *)self client];
  [v8 sendSimpleMessage:v7 withError:0];
}

- (void)validateClarityUIAdminPasscode:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(AXServer *)self _connectIfNecessary];
  id v8 = [AXIPCMessage alloc];
  long long v14 = @"passcode";
  v15[0] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v10 = [(AXIPCMessage *)v8 initWithKey:2077 payload:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__AXBackBoardServer_validateClarityUIAdminPasscode_completion___block_invoke;
  void v12[3] = &unk_1E5587030;
  id v13 = v6;
  id v11 = v6;
  [(AXServer *)self sendAsynchronousMessage:v10 replyOnQueue:MEMORY[0x1E4F14428] BOOLResultHandler:v12];
}

uint64_t __63__AXBackBoardServer_validateClarityUIAdminPasscode_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)preferenceRetrievalRequiresValidConnection
{
  return self->_preferenceRetrievalRequiresValidConnection;
}

- (void)setPreferenceRetrievalRequiresValidConnection:(BOOL)a3
{
  self->_preferenceRetrievalRequiresValidConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomAttributeListeners, 0);

  objc_storeStrong((id *)&self->_eventListeners, 0);
}

- (void)guidedAccessAvailability
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "Could not ask backboard server about GAX Availability: %{public}@", v2, v3, v4, v5, v6);
}

void __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "Could not ask backboard server to set Guided Access enabled by requesting app: %{public}@", v2, v3, v4, v5, v6);
}

- (void)isGuidedAccessSelfLockedToApp:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "Could not ask backboard server if GAX is self locked to app. %{public}@", v2, v3, v4, v5, v6);
}

- (void)isGuidedAccessUnmanagedSelfLocked
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "Could not ask if GAX self lock is active and unmanaged: %{public}@", v2, v3, v4, v5, v6);
}

- (void)colorFilterFromLastUpdate
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "Could not get last set color filter: %@", v2, v3, v4, v5, v6);
}

@end