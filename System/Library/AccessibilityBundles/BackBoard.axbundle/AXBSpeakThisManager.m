@interface AXBSpeakThisManager
+ (void)didUpdateAccessibilityUIServerPID;
+ (void)initializeMonitor;
- (AXBSpeakThisManager)init;
- (void)_notifySpeakThisOfSettingsChange;
- (void)_startWatchingForDeathOfAccessibilityUIServerPID;
@end

@implementation AXBSpeakThisManager

+ (void)initializeMonitor
{
  id v2 = (id)[getSpeakThisServicesClass() sharedInstance];
  if (initializeMonitor_onceToken_9 != -1)
  {
    dispatch_once(&initializeMonitor_onceToken_9, &__block_literal_global_18);
  }
}

uint64_t __40__AXBSpeakThisManager_initializeMonitor__block_invoke()
{
  SharedManager_0 = objc_alloc_init(AXBSpeakThisManager);

  return MEMORY[0x270F9A758]();
}

+ (void)didUpdateAccessibilityUIServerPID
{
}

- (AXBSpeakThisManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXBSpeakThisManager;
  id v2 = [(AXBSpeakThisManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SpeakThisQueue", 0);
    speakThisQueue = v2->_speakThisQueue;
    v2->_speakThisQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = [MEMORY[0x263F22938] sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__AXBSpeakThisManager_init__block_invoke;
    v10[3] = &unk_26510B570;
    objc_copyWeak(&v11, &location);
    [v5 registerUpdateBlock:v10 forRetrieveSelector:sel_showSpeechController withListener:v2];

    objc_destroyWeak(&v11);
    v6 = AXLogSpeakScreen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "Clearing highlight state because backboardd just started up.", v9, 2u);
    }

    _AXSSpeakThisSetHighlightVisible();
    [(AXBSpeakThisManager *)v2 _notifySpeakThisOfSettingsChange];
    [(AXBSpeakThisManager *)v2 _startWatchingForDeathOfAccessibilityUIServerPID];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__startWatchingForDeathOfAccessibilityUIServerPID name:*MEMORY[0x263F8B398] object:0];

    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__AXBSpeakThisManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifySpeakThisOfSettingsChange];
}

- (void)_notifySpeakThisOfSettingsChange
{
  dispatch_queue_t v3 = [MEMORY[0x263F22938] sharedInstance];
  if ([v3 showSpeechController])
  {
    int v4 = _AXSSpeakThisEnabled();

    if (v4)
    {
      v5 = &__block_literal_global_274;
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (!_AXSSpeakThisEnabled()) {
    return;
  }
  v5 = &__block_literal_global_280_0;
LABEL_7:
  speakThisQueue = self->_speakThisQueue;

  dispatch_async(speakThisQueue, v5);
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke()
{
  id v0 = [getSpeakThisServicesClass() sharedInstance];
  [v0 showSpeechController:&__block_literal_global_277_1];
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    dispatch_queue_t v3 = AXLogSpeakScreen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_278()
{
  id v0 = [getSpeakThisServicesClass() sharedInstance];
  [v0 hideSpeechController:&__block_literal_global_283];
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_281(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    dispatch_queue_t v3 = AXLogSpeakScreen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)_startWatchingForDeathOfAccessibilityUIServerPID
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_241F5C000, log, OS_LOG_TYPE_FAULT, "Should have accessed AXUIServer PID on the main thread.", v1, 2u);
}

void __71__AXBSpeakThisManager__startWatchingForDeathOfAccessibilityUIServerPID__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  if (!_AXSSpeakThisEnabled())
  {
    v5 = AXLogSpeakScreen();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v12[0]) = 0;
    id v11 = "Not watching for death of AXUIServer, because Speak Screen was not enabled.";
LABEL_10:
    _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v12, 2u);
    goto LABEL_11;
  }
  int v4 = *(_DWORD *)(a1 + 40);
  v5 = AXLogSpeakScreen();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 < 1)
  {
    if (!v6) {
      goto LABEL_11;
    }
    LOWORD(v12[0]) = 0;
    id v11 = "Not watching for death of AXUIServer, because PID unavailable.";
    goto LABEL_10;
  }
  if (v6)
  {
    int v7 = *(_DWORD *)(a1 + 40);
    v12[0] = 67109120;
    v12[1] = v7;
    _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Start watching for death of AXUIServer: %i", (uint8_t *)v12, 8u);
  }

  id v8 = objc_alloc(MEMORY[0x263F29CB0]);
  uint64_t v9 = [v8 initWithPID:*(unsigned int *)(a1 + 40) queue:MEMORY[0x263EF83A0] deathHandler:&__block_literal_global_289_0];
  uint64_t v10 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v10 + 16);
  *(void *)(v10 + 16) = v9;
LABEL_11:
}

uint64_t __71__AXBSpeakThisManager__startWatchingForDeathOfAccessibilityUIServerPID__block_invoke_287()
{
  id v0 = AXLogSpeakScreen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_241F5C000, v0, OS_LOG_TYPE_DEFAULT, "Clearing highlight state because AXUIServer died.", v2, 2u);
  }

  return _AXSSpeakThisSetHighlightVisible();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityUIServerDeathWatcher, 0);

  objc_storeStrong((id *)&self->_speakThisQueue, 0);
}

void __55__AXBSpeakThisManager__notifySpeakThisOfSettingsChange__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Error notifying SpeakThis of setting change: %@", (uint8_t *)&v2, 0xCu);
}

@end