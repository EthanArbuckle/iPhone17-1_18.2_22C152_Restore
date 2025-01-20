@interface AMUIPosterSwitcherModel
+ (AMUIPosterSwitcherModel)sharedInstance;
- (AMUIPosterSwitcherModel)init;
- (AMUIPosterUpdater)posterConfigurationsUpdater;
- (NSArray)posterConfigurations;
- (PRSPosterConfiguration)activeConfiguration;
- (void)_setActiveConfiguration:(id)a3;
- (void)_setPosterConfigurations:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation AMUIPosterSwitcherModel

+ (AMUIPosterSwitcherModel)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AMUIPosterSwitcherModel_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return (AMUIPosterSwitcherModel *)v2;
}

uint64_t __41__AMUIPosterSwitcherModel_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (AMUIPosterSwitcherModel)init
{
  v23.receiver = self;
  v23.super_class = (Class)AMUIPosterSwitcherModel;
  uint64_t v2 = [(AMUIPosterSwitcherModel *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    id v4 = objc_alloc_init(MEMORY[0x263F5F398]);
    id v5 = objc_alloc(MEMORY[0x263F5F360]);
    uint64_t v6 = *MEMORY[0x263F5F3A0];
    v7 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F5F3A0]];
    v8 = (void *)[v5 initWithRoles:v7];

    objc_initWeak(&location, v3);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __31__AMUIPosterSwitcherModel_init__block_invoke;
    v20[3] = &unk_265224D88;
    objc_copyWeak(&v21, &location);
    [v8 setHandler:v20];
    [v4 setActivePosterRoleObserver:v8];
    v9 = (void *)[objc_alloc(MEMORY[0x263F5F368]) initWithRole:v6];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __31__AMUIPosterSwitcherModel_init__block_invoke_2;
    v18[3] = &unk_265224DB0;
    v10 = v3;
    v19 = v10;
    [v9 setHandler:v18];
    [v4 setPostersCollectionRoleObserver:v9];
    id v11 = objc_alloc(MEMORY[0x263F5F390]);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = (void *)[v11 initWithExplanation:v13];

    [v14 activateWithConfiguration:v4];
    objc_storeStrong((id *)&v10->_wallpaperObserver, v14);
    uint64_t v15 = +[AMUIPosterUpdater defaultUpdater];
    posterConfigurationsUpdater = v10->_posterConfigurationsUpdater;
    v10->_posterConfigurationsUpdater = (AMUIPosterUpdater *)v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __31__AMUIPosterSwitcherModel_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v6 activePoster];
    [WeakRetained _setActiveConfiguration:v5];
  }
}

void __31__AMUIPosterSwitcherModel_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = v4;
    id v7 = [a4 array];
    [v6 _setPosterConfigurations:v7];
  }
}

- (void)dealloc
{
  [(PRSWallpaperObserver *)self->_wallpaperObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterSwitcherModel;
  [(AMUIPosterSwitcherModel *)&v3 dealloc];
}

- (NSArray)posterConfigurations
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = self->_posterConfigurations;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (void)_setPosterConfigurations:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  id v6 = (NSArray *)[v5 copy];

  posterConfigurations = self->_posterConfigurations;
  self->_posterConfigurations = v6;

  v8 = (void *)[(NSArray *)self->_posterConfigurations copy];
  os_unfair_lock_unlock(p_stateLock);
  id v9 = v8;
  BSDispatchMain();
}

void __52__AMUIPosterSwitcherModel__setPosterConfigurations___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 posterSwitcherModel:*(void *)(a1 + 32) didUpdateConfigurations:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (PRSPosterConfiguration)activeConfiguration
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_activeConfiguration;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (void)_setActiveConfiguration:(id)a3
{
  uint64_t v5 = (PRSPosterConfiguration *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_activeConfiguration != v5) {
    objc_storeStrong((id *)&self->_activeConfiguration, a3);
  }
  os_unfair_lock_unlock(&self->_stateLock);
  uint64_t v6 = v5;
  BSDispatchMain();
}

void __51__AMUIPosterSwitcherModel__setActiveConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 posterSwitcherModel:*(void *)(a1 + 32) didUpdateActiveConfiguration:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (AMUIPosterUpdater)posterConfigurationsUpdater
{
  return self->_posterConfigurationsUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterConfigurationsUpdater, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_posterConfigurations, 0);
  objc_storeStrong((id *)&self->_wallpaperObserver, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end