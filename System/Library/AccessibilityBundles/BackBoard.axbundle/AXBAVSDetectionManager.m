@interface AXBAVSDetectionManager
+ (id)controller;
+ (void)initializeManager;
- (AXBAVSDetectionManager)init;
- (AXUIClient)avsDetectionClient;
- (BOOL)_shouldArmAVS;
- (void)_avsSettingsDidUpdate;
- (void)_bootstrapAVSDetection;
- (void)_startupAVSDetectionUIServer;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)setAvsDetectionClient:(id)a3;
@end

@implementation AXBAVSDetectionManager

+ (void)initializeManager
{
  id v2 = (id)[a1 controller];
}

+ (id)controller
{
  if (controller_onceToken_2 != -1) {
    dispatch_once(&controller_onceToken_2, &__block_literal_global_17);
  }
  id v2 = (void *)controller__sManager_0;

  return v2;
}

uint64_t __36__AXBAVSDetectionManager_controller__block_invoke()
{
  controller__sManager_0 = objc_alloc_init(AXBAVSDetectionManager);

  return MEMORY[0x270F9A758]();
}

- (AXBAVSDetectionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXBAVSDetectionManager;
  id v2 = [(AXBAVSDetectionManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXBAVSDetectionManager *)v2 _bootstrapAVSDetection];
  }
  return v3;
}

- (void)_bootstrapAVSDetection
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  v6 = __48__AXBAVSDetectionManager__bootstrapAVSDetection__block_invoke;
  v7 = &unk_26510B570;
  objc_copyWeak(&v8, &location);
  [v3 registerUpdateBlock:&v4 forRetrieveSelector:sel_isAdaptiveVoiceShortcutsEnabled withListener:self];

  [(AXBAVSDetectionManager *)self _avsSettingsDidUpdate];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__AXBAVSDetectionManager__bootstrapAVSDetection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _avsSettingsDidUpdate];
}

- (void)_avsSettingsDidUpdate
{
  if ([(AXBAVSDetectionManager *)self _shouldArmAVS])
  {
    v3 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__AXBAVSDetectionManager__avsSettingsDidUpdate__block_invoke;
    block[3] = &unk_26510B378;
    block[4] = self;
    dispatch_async(v3, block);
  }
  else
  {
    avsDetectionClient = self->_avsDetectionClient;
    self->_avsDetectionClient = 0;
  }
}

uint64_t __47__AXBAVSDetectionManager__avsSettingsDidUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startupAVSDetectionUIServer];
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  avsDetectionClient = self->_avsDetectionClient;
  if (avsDetectionClient == a3 && avsDetectionClient != 0) {
    [(AXBAVSDetectionManager *)self _startupAVSDetectionUIServer];
  }
}

- (void)_startupAVSDetectionUIServer
{
  if (!self->_avsDetectionClient)
  {
    v3 = AXLogAVS();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v3, OS_LOG_TYPE_DEFAULT, "Creating AVS Client", buf, 2u);
    }

    uint64_t v4 = (AXUIClient *)[objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:@"AX_adaptiveVoiceShortcutsClient-sb" serviceBundleName:@"AXAVSPluginService"];
    avsDetectionClient = self->_avsDetectionClient;
    self->_avsDetectionClient = v4;

    [(AXUIClient *)self->_avsDetectionClient setDelegate:self];
  }
  if ([(AXBAVSDetectionManager *)self _shouldArmAVS])
  {
    v6 = AXLogAVS();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "Starting AVS UI Server", v9, 2u);
    }

    v7 = self->_avsDetectionClient;
    id v8 = [MEMORY[0x263F21380] mainAccessQueue];
    [(AXUIClient *)v7 sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:10000 targetAccessQueue:v8 completion:0];
  }
}

- (BOOL)_shouldArmAVS
{
  id v2 = [MEMORY[0x263F22938] sharedInstance];
  char v3 = [v2 isAdaptiveVoiceShortcutsEnabled];

  return v3;
}

- (AXUIClient)avsDetectionClient
{
  return self->_avsDetectionClient;
}

- (void)setAvsDetectionClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end