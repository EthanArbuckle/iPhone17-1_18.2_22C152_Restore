@interface AXBSoundDetectionManager
+ (id)controller;
+ (void)initializeManager;
- (AXBSoundDetectionManager)init;
- (AXUIClient)soundDetectionClient;
- (BOOL)_shouldArmSoundRecognition;
- (BOOL)_shouldArmVoiceTriggers;
- (VOSCommandManager)commandManager;
- (void)_bootstrapSoundDetection;
- (void)_shouldArmVoiceTriggers;
- (void)_soundDetectionSettingsDidUpdate;
- (void)_startupSoundDetectionUIServer;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)setCommandManager:(id)a3;
- (void)setSoundDetectionClient:(id)a3;
@end

@implementation AXBSoundDetectionManager

+ (void)initializeManager
{
  id v2 = (id)[a1 controller];
}

+ (id)controller
{
  if (controller_onceToken_0 != -1) {
    dispatch_once(&controller_onceToken_0, &__block_literal_global_8);
  }
  id v2 = (void *)controller__sManager;

  return v2;
}

uint64_t __38__AXBSoundDetectionManager_controller__block_invoke()
{
  controller__sManager = objc_alloc_init(AXBSoundDetectionManager);

  return MEMORY[0x270F9A758]();
}

- (AXBSoundDetectionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXBSoundDetectionManager;
  id v2 = [(AXBSoundDetectionManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXBSoundDetectionManager *)v2 _bootstrapSoundDetection];
  }
  return v3;
}

- (void)_bootstrapSoundDetection
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F21DA0] sharedInstance];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke;
  v21[3] = &unk_26510B570;
  objc_copyWeak(&v22, &location);
  [v3 registerUpdateBlock:v21 forRetrieveSelector:sel_ultronSupportEnabled withListener:self];

  v4 = [MEMORY[0x263F21DA0] sharedInstance];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_2;
  v19[3] = &unk_26510B570;
  objc_copyWeak(&v20, &location);
  [v4 registerUpdateBlock:v19 forRetrieveSelector:sel_ultronIsRunning withListener:self];

  objc_super v5 = [MEMORY[0x263F21DA0] sharedInstance];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_3;
  v17[3] = &unk_26510B570;
  objc_copyWeak(&v18, &location);
  [v5 registerUpdateBlock:v17 forRetrieveSelector:sel_soundDetectionState withListener:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_updateSoundDetection, (CFStringRef)*MEMORY[0x263F8B138], 0, (CFNotificationSuspensionBehavior)1028);
  v7 = [MEMORY[0x263F22938] sharedInstance];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_4;
  v15[3] = &unk_26510B570;
  objc_copyWeak(&v16, &location);
  [v7 registerUpdateBlock:v15 forRetrieveSelector:sel_assistiveTouchSwitches withListener:self];

  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)_updateSoundDetection, (CFStringRef)*MEMORY[0x263F8B130], 0, (CFNotificationSuspensionBehavior)1028);
  v9 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_5;
  v13 = &unk_26510B570;
  objc_copyWeak(&v14, &location);
  [v9 registerUpdateBlock:&v10 forRetrieveSelector:sel_assistiveTouchActionsBySoundAction withListener:self];

  [(AXBSoundDetectionManager *)self _soundDetectionSettingsDidUpdate];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _soundDetectionSettingsDidUpdate];
}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _soundDetectionSettingsDidUpdate];
}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _soundDetectionSettingsDidUpdate];
}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _soundDetectionSettingsDidUpdate];
}

void __52__AXBSoundDetectionManager__bootstrapSoundDetection__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _soundDetectionSettingsDidUpdate];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F8B130], 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F8B138], 0);
  v5.receiver = self;
  v5.super_class = (Class)AXBSoundDetectionManager;
  [(AXBSoundDetectionManager *)&v5 dealloc];
}

- (void)_soundDetectionSettingsDidUpdate
{
  v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241F5C000, v3, OS_LOG_TYPE_DEFAULT, "Sound detection settings did update", buf, 2u);
  }

  v4 = [MEMORY[0x263F21DA0] sharedInstance];
  char v5 = [v4 ultronSupportEnabled];

  if ((v5 & 1) != 0
    || [(AXBSoundDetectionManager *)self _shouldArmSoundRecognition]
    || [(AXBSoundDetectionManager *)self _shouldArmVoiceTriggers])
  {
    v6 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__AXBSoundDetectionManager__soundDetectionSettingsDidUpdate__block_invoke;
    block[3] = &unk_26510B378;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    soundDetectionClient = self->_soundDetectionClient;
    self->_soundDetectionClient = 0;
  }
}

uint64_t __60__AXBSoundDetectionManager__soundDetectionSettingsDidUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startupSoundDetectionUIServer];
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  soundDetectionClient = self->_soundDetectionClient;
  if (soundDetectionClient == a3 && soundDetectionClient != 0)
  {
    v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [MEMORY[0x263F21DA0] sharedInstance];
      v8[0] = 67109120;
      v8[1] = [v7 ultronSupportEnabled];
      _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_INFO, "Ultron client interrupted, restart: %d", (uint8_t *)v8, 8u);
    }
    [(AXBSoundDetectionManager *)self _startupSoundDetectionUIServer];
  }
}

- (void)_startupSoundDetectionUIServer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_241F5C000, v0, v1, "Creating Sound Detection Client", v2, v3, v4, v5, v6);
}

- (BOOL)_shouldArmSoundRecognition
{
  uint64_t v2 = [MEMORY[0x263F21DA0] sharedInstance];
  if ([v2 soundDetectionState] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F21DA0] sharedInstance];
    BOOL v3 = [v4 soundDetectionState] == 2;
  }
  return v3;
}

- (BOOL)_shouldArmVoiceTriggers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (_AXSAssistiveTouchScannerEnabled())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v2 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", 0);
    BOOL v3 = [v2 assistiveTouchSwitches];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      uint64_t v7 = *MEMORY[0x263F22A10];
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * v8) source];
          int v10 = [v9 isEqualToString:v7];

          if (v10)
          {
            v15 = AXLogUltron();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              -[AXBSoundDetectionManager _shouldArmVoiceTriggers]();
            }

            goto LABEL_18;
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  int v11 = _AXSAssistiveTouchEnabled();
  if (v11)
  {
    v12 = [MEMORY[0x263F22938] sharedInstance];
    v13 = [v12 assistiveTouchActionsBySoundAction];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      BOOL v3 = AXLogUltron();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[AXBSoundDetectionManager _shouldArmVoiceTriggers]();
      }
LABEL_18:

      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (AXUIClient)soundDetectionClient
{
  return self->_soundDetectionClient;
}

- (void)setSoundDetectionClient:(id)a3
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

  objc_storeStrong((id *)&self->_soundDetectionClient, 0);
}

- (void)_shouldArmVoiceTriggers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_241F5C000, v0, v1, "Voice triggers should arm for Switch Control", v2, v3, v4, v5, v6);
}

@end