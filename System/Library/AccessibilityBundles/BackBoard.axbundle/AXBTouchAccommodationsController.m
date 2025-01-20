@interface AXBTouchAccommodationsController
+ (void)hideHoldDurationTripleClickHelp;
+ (void)initializeMonitor;
+ (void)showHoldDurationTripleClickHelp;
- (AXUIClient)touchAccommodationsClient;
- (id)_clientIdentifier;
- (void)_hideHoldDurationTripleClickHelp;
- (void)_registerForTouchAccommodationsAXSettingsUpdate;
- (void)_showHoldDurationTripleClickHelp;
- (void)_updateTouchAccommodationsSetting;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)setTouchAccommodationsClient:(id)a3;
@end

@implementation AXBTouchAccommodationsController

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_11 != -1) {
    dispatch_once(&initializeMonitor_onceToken_11, &__block_literal_global_20);
  }
}

uint64_t __53__AXBTouchAccommodationsController_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBTouchAccommodationsController);
  v1 = (void *)SharedManager_1;
  SharedManager_1 = (uint64_t)v0;

  [(id)SharedManager_1 _registerForTouchAccommodationsAXSettingsUpdate];
  v2 = (void *)SharedManager_1;

  return [v2 _updateTouchAccommodationsSetting];
}

+ (void)showHoldDurationTripleClickHelp
{
}

+ (void)hideHoldDurationTripleClickHelp
{
}

- (void)_registerForTouchAccommodationsAXSettingsUpdate
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("TouchAccommodationsQueue", 0);
  touchAccommodationsQueue = self->_touchAccommodationsQueue;
  self->_touchAccommodationsQueue = v3;

  v5 = [MEMORY[0x263F22938] sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke;
  v12[3] = &unk_26510B378;
  v12[4] = self;
  [v5 registerUpdateBlock:v12 forRetrieveSelector:sel_touchAccommodationsHoldDurationEnabled withListener:self];

  v6 = [MEMORY[0x263F22938] sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_2;
  v11[3] = &unk_26510B378;
  v11[4] = self;
  [v6 registerUpdateBlock:v11 forRetrieveSelector:sel_touchAccommodationsIgnoreRepeatEnabled withListener:self];

  v7 = [MEMORY[0x263F22938] sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_3;
  v10[3] = &unk_26510B378;
  v10[4] = self;
  [v7 registerUpdateBlock:v10 forRetrieveSelector:sel_touchAccommodationsTapActivationMethod withListener:self];

  v8 = [MEMORY[0x263F22938] sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_4;
  v9[3] = &unk_26510B378;
  v9[4] = self;
  [v8 registerUpdateBlock:v9 forRetrieveSelector:sel_touchAccommodationsEnabled withListener:self];
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsSetting];
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsSetting];
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsSetting];
}

uint64_t __83__AXBTouchAccommodationsController__registerForTouchAccommodationsAXSettingsUpdate__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsSetting];
}

- (void)_updateTouchAccommodationsSetting
{
  touchAccommodationsQueue = self->_touchAccommodationsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__AXBTouchAccommodationsController__updateTouchAccommodationsSetting__block_invoke;
  block[3] = &unk_26510B378;
  block[4] = self;
  dispatch_async(touchAccommodationsQueue, block);
}

void __69__AXBTouchAccommodationsController__updateTouchAccommodationsSetting__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  int v3 = [v2 touchAccommodationsEnabled];
  if (v3) {
    int v3 = [v2 touchAccommodationsAreConfigured];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 8) != v3)
  {
    *(unsigned char *)(v4 + 8) = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 8))
    {
      v6 = AXLogTouchAccommodations();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "Starting up touch accommodations", buf, 2u);
      }

      v7 = [*(id *)(a1 + 32) touchAccommodationsClient];
      [v7 sendAsynchronousMessage:0 withIdentifier:2 targetAccessQueue:0 completion:0];

      *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
    }
    else if (*(unsigned char *)(v5 + 9))
    {
      v8 = AXLogTouchAccommodations();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_241F5C000, v8, OS_LOG_TYPE_DEFAULT, "Stopping touch accommodations", v10, 2u);
      }

      v9 = [*(id *)(a1 + 32) touchAccommodationsClient];
      [v9 sendAsynchronousMessage:0 withIdentifier:1 targetAccessQueue:0 completion:0];
    }
  }
}

- (void)_showHoldDurationTripleClickHelp
{
  id v2 = [(AXBTouchAccommodationsController *)self touchAccommodationsClient];
  [v2 sendAsynchronousMessage:0 withIdentifier:3 targetAccessQueue:0 completion:0];
}

- (void)_hideHoldDurationTripleClickHelp
{
  id v2 = [(AXBTouchAccommodationsController *)self touchAccommodationsClient];
  [v2 sendAsynchronousMessage:0 withIdentifier:4 targetAccessQueue:0 completion:0];
}

- (id)_clientIdentifier
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v3 = [v2 processIdentifier];

  uint64_t v4 = NSString;
  uint64_t v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 stringWithFormat:@"TouchAccommodationsClientIdentifier-%@", v5];

  return v6;
}

- (AXUIClient)touchAccommodationsClient
{
  touchAccommodationsClient = self->_touchAccommodationsClient;
  if (!touchAccommodationsClient)
  {
    id v4 = objc_alloc(MEMORY[0x263F22198]);
    uint64_t v5 = [(AXBTouchAccommodationsController *)self _clientIdentifier];
    v6 = (AXUIClient *)[v4 initWithIdentifier:v5 serviceBundleName:@"TouchAccommodations"];
    v7 = self->_touchAccommodationsClient;
    self->_touchAccommodationsClient = v6;

    [(AXUIClient *)self->_touchAccommodationsClient setDelegate:self];
    touchAccommodationsClient = self->_touchAccommodationsClient;
  }

  return touchAccommodationsClient;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  touchAccommodationsQueue = self->_touchAccommodationsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__AXBTouchAccommodationsController_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke;
  block[3] = &unk_26510B378;
  block[4] = self;
  dispatch_async(touchAccommodationsQueue, block);
}

void __94__AXBTouchAccommodationsController_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[8])
  {
    id v5 = [v4 touchAccommodationsClient];
    [v5 sendAsynchronousMessage:0 withIdentifier:2 targetAccessQueue:0 completion:0];
  }
}

- (void)setTouchAccommodationsClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchAccommodationsClient, 0);

  objc_storeStrong((id *)&self->_touchAccommodationsQueue, 0);
}

@end