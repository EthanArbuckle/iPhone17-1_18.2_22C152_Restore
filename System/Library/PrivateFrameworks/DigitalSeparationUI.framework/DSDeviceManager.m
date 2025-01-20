@interface DSDeviceManager
+ (id)sharedInstance;
- (AIDAAccountManager)accountManager;
- (AKAppleIDAuthenticationController)authController;
- (DSDeviceListDelegate)delegate;
- (DSDeviceManager)init;
- (NSArray)remoteDevices;
- (OS_dispatch_queue)workQueue;
- (id)iconForDevice:(id)a3;
- (void)_setRemoteDeviceList:(id)a3;
- (void)appDidLaunch;
- (void)refresh;
- (void)refreshRemoteDeviceList;
- (void)setAccountManager:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DSDeviceManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DSDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___utility;
  return v2;
}

uint64_t __33__DSDeviceManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___utility;
  sharedInstance___utility = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (DSDeviceManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)DSDeviceManager;
  uint64_t v2 = [(DSDeviceManager *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.DigitalSeparation", "DSDeviceManager");
    v4 = (void *)DSLog_8;
    DSLog_8 = (uint64_t)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("DSDeviceManager", v5);
    [(DSDeviceManager *)v2 setWorkQueue:v6];

    id v7 = objc_alloc(MEMORY[0x263F26D70]);
    v8 = [MEMORY[0x263EFB210] defaultStore];
    v9 = (void *)[v7 initWithAccountStore:v8];
    [(DSDeviceManager *)v2 setAccountManager:v9];

    id v10 = objc_alloc_init(MEMORY[0x263F29118]);
    [(DSDeviceManager *)v2 setAuthController:v10];

    [(DSDeviceManager *)v2 refresh];
  }
  return v2;
}

- (void)appDidLaunch
{
  uint64_t v2 = DSLog_8;
  if (os_log_type_enabled((os_log_t)DSLog_8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_DEFAULT, "Initializing device manager and fetching device lists", v3, 2u);
  }
}

- (void)refresh
{
  os_log_t v3 = [(DSDeviceManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__DSDeviceManager_refresh__block_invoke;
  block[3] = &unk_264C6E7D0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__DSDeviceManager_refresh__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshRemoteDeviceList];
}

- (id)iconForDevice:(id)a3
{
  return 0;
}

- (void)refreshRemoteDeviceList
{
  os_log_t v3 = objc_opt_new();
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  id v5 = objc_alloc_init(MEMORY[0x263F291C8]);
  dispatch_queue_t v6 = objc_msgSend(v4, "aa_altDSID");
  [v5 setAltDSID:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F29118]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__DSDeviceManager_refreshRemoteDeviceList__block_invoke;
  v8[3] = &unk_264C6F218;
  v8[4] = self;
  [v7 deviceListWithContext:v5 completion:v8];
}

void __42__DSDeviceManager_refreshRemoteDeviceList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  dispatch_queue_t v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = DSLog_8;
    if (os_log_type_enabled((os_log_t)DSLog_8, OS_LOG_TYPE_ERROR))
    {
      v11 = @"Unknown";
      if (v7) {
        v11 = v7;
      }
      int v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_235BFC000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the AK device list with error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = [v5 deviceList];
    [v8 _setRemoteDeviceList:v9];
  }
}

- (void)_setRemoteDeviceList:(id)a3
{
  id v5 = a3;
  dispatch_queue_t v6 = self->_remoteDevices;
  objc_storeStrong((id *)&self->_remoteDevices, a3);
  if (v5 || !v6)
  {
    id v7 = [(DSDeviceManager *)self delegate];

    if (v7)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __40__DSDeviceManager__setRemoteDeviceList___block_invoke;
      v8[3] = &unk_264C6ED28;
      v8[4] = self;
      id v9 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v8);
    }
  }
}

void __40__DSDeviceManager__setRemoteDeviceList___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteDeviceListModified:*(void *)(a1 + 40)];
}

- (DSDeviceListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSDeviceListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)remoteDevices
{
  return self->_remoteDevices;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (AKAppleIDAuthenticationController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end