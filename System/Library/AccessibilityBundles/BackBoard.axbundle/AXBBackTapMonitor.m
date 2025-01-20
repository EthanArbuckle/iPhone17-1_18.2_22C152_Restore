@interface AXBBackTapMonitor
+ (id)controller;
+ (void)initializeMonitor;
- (AXBBackTapMonitor)init;
- (AXUIClient)backTapClient;
- (BOOL)_shouldEnableBackTap;
- (VOSCommandManager)commandManager;
- (unint64_t)_policyOption;
- (void)_backTapSettingsDidUpdate;
- (void)_registerForBackTap;
- (void)_registerForBackTapFromMagnifier;
- (void)_unregisterForBackTap;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)setBackTapClient:(id)a3;
- (void)setCommandManager:(id)a3;
@end

@implementation AXBBackTapMonitor

+ (void)initializeMonitor
{
  id v2 = (id)[a1 controller];
}

+ (id)controller
{
  if (controller_onceToken != -1) {
    dispatch_once(&controller_onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)controller__sMonitor;

  return v2;
}

uint64_t __31__AXBBackTapMonitor_controller__block_invoke()
{
  controller__sMonitor = objc_alloc_init(AXBBackTapMonitor);

  return MEMORY[0x270F9A758]();
}

- (AXBBackTapMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)AXBBackTapMonitor;
  id v2 = [(AXBBackTapMonitor *)&v19 init];
  v3 = v2;
  if (v2)
  {
    [(AXBBackTapMonitor *)v2 _backTapSettingsDidUpdate];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_updateBackTap, (CFStringRef)*MEMORY[0x263F8B148], 0, (CFNotificationSuspensionBehavior)1028);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_updateBackTap, (CFStringRef)*MEMORY[0x263F8B3F0], 0, (CFNotificationSuspensionBehavior)1028);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v3, (CFNotificationCallback)_updateBackTap, (CFStringRef)*MEMORY[0x263F8B138], 0, (CFNotificationSuspensionBehavior)1028);
    v7 = [MEMORY[0x263F087C8] defaultCenter];
    [v7 addObserver:v3 selector:sel__magnifierBackTapSettingsDidSetBackTap name:*MEMORY[0x263F8B308] object:0];
    [v7 addObserver:v3 selector:sel__backTapSettingsDidUpdate name:*MEMORY[0x263F8B300] object:0];
    uint64_t v8 = [objc_alloc(MEMORY[0x263F84DB0]) initPreferringUserProfileWithoutShortcuts];
    commandManager = v3->_commandManager;
    v3->_commandManager = (VOSCommandManager *)v8;

    objc_initWeak(&location, v3);
    v10 = [MEMORY[0x263F22938] sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __25__AXBBackTapMonitor_init__block_invoke;
    v16[3] = &unk_26510B570;
    objc_copyWeak(&v17, &location);
    id v11 = objc_loadWeakRetained(&location);
    [v10 registerUpdateBlock:v16 forRetrieveSelector:sel_voiceOverCustomCommandProfile withListener:v11];

    objc_destroyWeak(&v17);
    v12 = [MEMORY[0x263F22938] sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __25__AXBBackTapMonitor_init__block_invoke_3;
    v14[3] = &unk_26510B570;
    objc_copyWeak(&v15, &location);
    [v12 registerUpdateBlock:v14 forRetrieveSelector:sel_assistiveTouchSwitches withListener:v3];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __25__AXBBackTapMonitor_init__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __25__AXBBackTapMonitor_init__block_invoke_2(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained commandManager];
  [v3 reloadPreferringUserProfile];

  id v4 = objc_loadWeakRetained(v1);
  [v4 _backTapSettingsDidUpdate];
}

void __25__AXBBackTapMonitor_init__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __25__AXBBackTapMonitor_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _backTapSettingsDidUpdate];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F8B148], 0);
  v4.receiver = self;
  v4.super_class = (Class)AXBBackTapMonitor;
  [(AXBBackTapMonitor *)&v4 dealloc];
}

- (void)_backTapSettingsDidUpdate
{
  if ([(AXBBackTapMonitor *)self _shouldEnableBackTap])
  {
    [(AXBBackTapMonitor *)self _registerForBackTap];
  }
  else if (self->_backTapClient)
  {
    [(AXBBackTapMonitor *)self _unregisterForBackTap];
  }
}

- (void)_registerForBackTapFromMagnifier
{
  v9[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(AXBBackTapMonitor *)self _policyOption] | 1;
  objc_super v4 = [(AXBBackTapMonitor *)self backTapClient];
  uint64_t v8 = *MEMORY[0x263F22598];
  v5 = [NSNumber numberWithUnsignedInteger:v3];
  v9[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v7 = [MEMORY[0x263F21380] mainAccessQueue];
  [v4 sendAsynchronousMessage:v6 withIdentifier:10000 targetAccessQueue:v7 completion:&__block_literal_global_284];
}

uint64_t __53__AXBBackTapMonitor__registerForBackTapFromMagnifier__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)_registerForBackTap
{
  v10[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = AXLogBackTap();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_241F5C000, v3, OS_LOG_TYPE_DEFAULT, "Registering for Back Tap", v8, 2u);
  }

  objc_super v4 = [(AXBBackTapMonitor *)self backTapClient];
  uint64_t v9 = *MEMORY[0x263F22598];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXBBackTapMonitor _policyOption](self, "_policyOption"));
  v10[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [MEMORY[0x263F21380] mainAccessQueue];
  [v4 sendAsynchronousMessage:v6 withIdentifier:10000 targetAccessQueue:v7 completion:&__block_literal_global_289];
}

uint64_t __40__AXBBackTapMonitor__registerForBackTap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)_unregisterForBackTap
{
  unint64_t v3 = [(AXBBackTapMonitor *)self backTapClient];
  objc_super v4 = [MEMORY[0x263F21380] mainAccessQueue];
  [v3 sendAsynchronousMessage:0 withIdentifier:10001 targetAccessQueue:v4 completion:&__block_literal_global_291];

  backTapClient = self->_backTapClient;
  self->_backTapClient = 0;
}

uint64_t __42__AXBBackTapMonitor__unregisterForBackTap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return _AXLogWithFacility();
  }
  return result;
}

- (AXUIClient)backTapClient
{
  backTapClient = self->_backTapClient;
  if (!backTapClient)
  {
    id v4 = objc_alloc(MEMORY[0x263F22198]);
    v5 = (AXUIClient *)[v4 initWithIdentifier:*MEMORY[0x263F22590] serviceBundleName:@"BackTapUIServer"];
    v6 = self->_backTapClient;
    self->_backTapClient = v5;

    [(AXUIClient *)self->_backTapClient setDelegate:self];
    backTapClient = self->_backTapClient;
  }

  return backTapClient;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  if (self->_backTapClient == a3) {
    AXPerformBlockOnMainThread();
  }
}

uint64_t __79__AXBBackTapMonitor_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _backTapSettingsDidUpdate];
}

- (BOOL)_shouldEnableBackTap
{
  return [(AXBBackTapMonitor *)self _policyOption] != 0;
}

- (unint64_t)_policyOption
{
  unint64_t v3 = [MEMORY[0x263F22938] sharedInstance];
  int v4 = [v3 backTapEnabled];

  if (v4)
  {
    v5 = [MEMORY[0x263F22938] sharedInstance];
    v6 = [v5 backTapDoubleTapAction];
    BOOL v7 = v6 != 0;

    uint64_t v8 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v9 = [v8 backTapTripleTapAction];
    unint64_t v10 = v7 | (2 * (v9 != 0));
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (_AXSAssistiveTouchScannerEnabled())
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    id v11 = [MEMORY[0x263F22938] sharedInstance];
    v12 = [v11 assistiveTouchSwitches];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __34__AXBBackTapMonitor__policyOption__block_invoke;
    v23[3] = &unk_26510B5B8;
    v23[4] = &v28;
    v23[5] = &v24;
    [v12 enumerateObjectsUsingBlock:v23];

    v10 |= *((unsigned __int8 *)v29 + 24) | (2 * *((unsigned __int8 *)v25 + 24));
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
  }
  if (_AXSVoiceOverTouchEnabled())
  {
    v13 = [MEMORY[0x263F84DB8] resolverForCurrentHost];
    v14 = [(AXBBackTapMonitor *)self commandManager];
    id v15 = [MEMORY[0x263F84DC0] BackTapDoubleTap];
    v16 = [v14 commandForTouchGesture:v15 withResolver:v13];
    BOOL v17 = v16 != 0;

    v18 = [(AXBBackTapMonitor *)self commandManager];
    objc_super v19 = [MEMORY[0x263F84DC0] BackTapTripleTap];
    v20 = [v18 commandForTouchGesture:v19 withResolver:v13];
    BOOL v21 = v20 != 0;

    v10 |= v17 || 2 * v21;
  }
  return v10;
}

void __34__AXBBackTapMonitor__policyOption__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 source];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F229F8]];

  if (v4)
  {
    if ([v5 accessibilityEventUsage] == 1) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    if ([v5 accessibilityEventUsage] == 2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (void)setBackTapClient:(id)a3
{
}

- (VOSCommandManager)commandManager
{
  return self->_commandManager;
}

- (void)setCommandManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandManager, 0);

  objc_storeStrong((id *)&self->_backTapClient, 0);
}

@end