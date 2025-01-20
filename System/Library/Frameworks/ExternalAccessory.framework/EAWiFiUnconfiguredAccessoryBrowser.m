@interface EAWiFiUnconfiguredAccessoryBrowser
- (EAWiFiUnconfiguredAccessoryBrowser)init;
- (EAWiFiUnconfiguredAccessoryBrowser)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (NSPredicate)accessorySearchPredicate;
- (NSSet)unconfiguredAccessories;
- (OS_dispatch_queue)delegateQueue;
- (id)delegate;
- (void)_handleBrowserDidUpdateState:(id)a3;
- (void)_handleBrowserFinishedConfiguring:(id)a3;
- (void)_handleNewAccessoriesNotification:(id)a3;
- (void)_handlePurgeAccessoriesSetNotification:(id)a3;
- (void)_handleRemovedAccessoriesNotification:(id)a3;
- (void)configureAccessory:(EAWiFiUnconfiguredAccessory *)accessory withConfigurationUIOnViewController:(UIViewController *)viewController;
- (void)dealloc;
- (void)setAccessorySearchPredicate:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateQueue:(id)a3;
- (void)startSearchingForUnconfiguredAccessoriesMatchingPredicate:(NSPredicate *)predicate;
- (void)stopSearchingForUnconfiguredAccessories;
@end

@implementation EAWiFiUnconfiguredAccessoryBrowser

- (EAWiFiUnconfiguredAccessoryBrowser)init
{
  return [(EAWiFiUnconfiguredAccessoryBrowser *)self initWithDelegate:0 queue:0];
}

- (EAWiFiUnconfiguredAccessoryBrowser)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6 = delegate;
  v7 = queue;
  v27.receiver = self;
  v27.super_class = (Class)EAWiFiUnconfiguredAccessoryBrowser;
  v8 = [(EAWiFiUnconfiguredAccessoryBrowser *)&v27 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unconfiguredAccessories = v9->_unconfiguredAccessories;
    v9->_unconfiguredAccessories = v10;

    if (v7)
    {
      v12 = v7;
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = (OS_dispatch_queue *)v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v14;
    }

    v9->__debugLog = +[WACLogging isEnabled];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __61__EAWiFiUnconfiguredAccessoryBrowser_initWithDelegate_queue___block_invoke;
    v25 = &unk_1E62944A8;
    v16 = v9;
    v26 = v16;
    if (initWithDelegate_queue__token != -1) {
      dispatch_once(&initWithDelegate_queue__token, &block);
    }
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v16 selector:sel__handleBrowserDidUpdateState_ name:@"EAWiFiUnconfiguredAccessoryBrowserDidUpdateState" object:0];
    [v17 addObserver:v16 selector:sel__handleNewAccessoriesNotification_ name:@"EAWiFiUnconfiguredAccessoriesAddedNotification" object:0];
    [v17 addObserver:v16 selector:sel__handleRemovedAccessoriesNotification_ name:@"EAWiFiUnconfiguredAccessoriesRemovedNotification" object:0];
    [v17 addObserver:v16 selector:sel__handlePurgeAccessoriesSetNotification_ name:@"EAWiFiUnconfiguredAccessoryBrowserPurgeAccessoriesSet" object:0];
    if (v9->__debugLog)
    {
      v18 = EAUIApplicationDidEnterBackgroundNotification();
      NSLog(&stru_1F1597D28.isa, v18, block, v23, v24, v25, v26);
    }
    v19 = EAUIApplicationDidEnterBackgroundNotification();
    [v17 addObserver:v16 selector:sel_stopSearchingForUnconfiguredAccessories name:v19 object:0];
  }
  id v20 = (id)[(id)__EAWiFiUnconfiguredAccessoryBrowserManager sharedInstance];

  return v9;
}

void __61__EAWiFiUnconfiguredAccessoryBrowser_initWithDelegate_queue___block_invoke(uint64_t a1)
{
  uikitFramework_0 = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 0);
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ExternalAccessory"];
  v3 = [v2 builtInPlugInsPath];
  id v5 = [v3 stringByAppendingPathComponent:@"ExternalAccessoryWACUIBits.bundle"];

  v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v5];
  [v4 load];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    NSLog(&cfstr_Bundlepath.isa, v5);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
    {
      NSLog(&cfstr_Bundle.isa, v4);
      if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
        NSLog(&cfstr_Principle.isa, [v4 principalClass]);
      }
    }
  }
  if (v4)
  {
    __EAWiFiUnconfiguredAccessoryBrowserManager = [v4 principalClass];
    if (!__EAWiFiUnconfiguredAccessoryBrowserManager) {
      NSLog(&cfstr_WacBrowserErro.isa);
    }
  }
  else
  {
    NSLog(&cfstr_WacBrowserErro_0.isa);
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (uikitFramework_0 && dealloc_token != -1) {
    dispatch_once(&dealloc_token, &__block_literal_global_1);
  }
  v4.receiver = self;
  v4.super_class = (Class)EAWiFiUnconfiguredAccessoryBrowser;
  [(EAWiFiUnconfiguredAccessoryBrowser *)&v4 dealloc];
}

uint64_t __45__EAWiFiUnconfiguredAccessoryBrowser_dealloc__block_invoke()
{
  return dlclose((void *)uikitFramework_0);
}

- (void)startSearchingForUnconfiguredAccessoriesMatchingPredicate:(NSPredicate *)predicate
{
  id v5 = predicate;
  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserStar.isa);
  }
  [(EAWiFiUnconfiguredAccessoryBrowser *)self setAccessorySearchPredicate:v5];
  objc_super v4 = [(id)__EAWiFiUnconfiguredAccessoryBrowserManager sharedInstance];
  [v4 startSearchingForUnconfiguredAccessories];
}

- (void)stopSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserStop.isa, a2);
  }
  id v2 = [(id)__EAWiFiUnconfiguredAccessoryBrowserManager sharedInstance];
  [v2 stopSearchingForUnconfiguredAccessories];
}

- (void)configureAccessory:(EAWiFiUnconfiguredAccessory *)accessory withConfigurationUIOnViewController:(UIViewController *)viewController
{
  v9 = accessory;
  id v6 = viewController;
  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserConf.isa, v9);
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handleBrowserFinishedConfiguring_ name:@"EAWiFiUnconfiguredAccessoryBrowserFinishedConfiguringAccessoryNotification" object:0];

  v8 = [(id)__EAWiFiUnconfiguredAccessoryBrowserManager sharedInstance];
  [v8 configureAccessory:v9 withConfigurationUIOnViewController:v6];
}

- (void)_handleBrowserDidUpdateState:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"EAWiFiUnconfiguredAccessoryBrowserState"];
  uint64_t v6 = (int)[v5 intValue];

  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserHand.isa, v6);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserDidUpdateState___block_invoke;
      block[3] = &unk_1E62944D0;
      block[4] = self;
      block[5] = v6;
      dispatch_async(delegateQueue, block);
    }
  }
}

void __67__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserDidUpdateState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained accessoryBrowser:*(void *)(a1 + 32) didUpdateState:*(void *)(a1 + 40)];
}

- (void)_handleNewAccessoriesNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"];

  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserHand_0.isa, v5);
  }
  uint64_t v6 = [(EAWiFiUnconfiguredAccessoryBrowser *)self accessorySearchPredicate];

  if (v6)
  {
    v7 = [(EAWiFiUnconfiguredAccessoryBrowser *)self accessorySearchPredicate];
    id v8 = [v5 filteredSetUsingPredicate:v7];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = [(EAWiFiUnconfiguredAccessoryBrowser *)self unconfiguredAccessories];
  [v9 unionSet:v8];

  if ([v8 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__EAWiFiUnconfiguredAccessoryBrowser__handleNewAccessoriesNotification___block_invoke;
        block[3] = &unk_1E62944F8;
        block[4] = self;
        id v16 = v8;
        dispatch_async(delegateQueue, block);
      }
    }
  }
}

void __72__EAWiFiUnconfiguredAccessoryBrowser__handleNewAccessoriesNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained accessoryBrowser:*(void *)(a1 + 32) didFindUnconfiguredAccessories:*(void *)(a1 + 40)];
}

- (void)_handleRemovedAccessoriesNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"];

  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserHand_1.isa, v5);
  }
  uint64_t v6 = [(EAWiFiUnconfiguredAccessoryBrowser *)self accessorySearchPredicate];

  if (v6)
  {
    v7 = [(EAWiFiUnconfiguredAccessoryBrowser *)self accessorySearchPredicate];
    id v8 = [v5 filteredSetUsingPredicate:v7];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = [(EAWiFiUnconfiguredAccessoryBrowser *)self unconfiguredAccessories];
  [v9 minusSet:v8];

  if ([v8 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__EAWiFiUnconfiguredAccessoryBrowser__handleRemovedAccessoriesNotification___block_invoke;
        block[3] = &unk_1E62944F8;
        block[4] = self;
        id v16 = v8;
        dispatch_async(delegateQueue, block);
      }
    }
  }
}

void __76__EAWiFiUnconfiguredAccessoryBrowser__handleRemovedAccessoriesNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained accessoryBrowser:*(void *)(a1 + 32) didRemoveUnconfiguredAccessories:*(void *)(a1 + 40)];
}

- (void)_handlePurgeAccessoriesSetNotification:(id)a3
{
  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserHand_2.isa, a2, a3, self->_unconfiguredAccessories);
  }
  objc_super v4 = [MEMORY[0x1E4F1CAD0] setWithSet:self->_unconfiguredAccessories];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__EAWiFiUnconfiguredAccessoryBrowser__handlePurgeAccessoriesSetNotification___block_invoke;
  block[3] = &unk_1E62944F8;
  block[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, block);
  v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unconfiguredAccessories = self->_unconfiguredAccessories;
  self->_unconfiguredAccessories = v7;
}

void __77__EAWiFiUnconfiguredAccessoryBrowser__handlePurgeAccessoriesSetNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained accessoryBrowser:*(void *)(a1 + 32) didRemoveUnconfiguredAccessories:*(void *)(a1 + 40)];
}

- (void)_handleBrowserFinishedConfiguring:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->__debugLog) {
    NSLog(&cfstr_WacBrowserHand_3.isa, v4);
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"EAWiFiUnconfiguredAccessoryBrowserFinishedConfiguringAccessoryNotification" object:0];

  v7 = [v5 userInfo];
  id v8 = [v7 objectForKey:@"EAWiFiUnconfiguredAccessoryBrowserConfigurationStatus"];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v5 userInfo];
  v11 = [v10 objectForKey:@"EAWiFiUnconfiguredAccessoryConfigured"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    char v13 = WeakRetained;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserFinishedConfiguring___block_invoke;
      block[3] = &unk_1E6294520;
      block[4] = self;
      id v18 = v11;
      uint64_t v19 = v9;
      dispatch_async(delegateQueue, block);
    }
  }
}

void __72__EAWiFiUnconfiguredAccessoryBrowser__handleBrowserFinishedConfiguring___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained accessoryBrowser:a1[4] didFinishConfiguringAccessory:a1[5] withStatus:a1[6]];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSSet)unconfiguredAccessories
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSPredicate)accessorySearchPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessorySearchPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySearchPredicate, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_unconfiguredAccessories, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end