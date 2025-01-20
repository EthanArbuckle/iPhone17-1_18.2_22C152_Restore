@interface AAUISpinnerManager
- (AAUISpinnerManager)init;
- (AAUISpinnerManager)initWithNavigationItem:(id)a3 hideBackButton:(BOOL)a4;
- (void)startNavigationSpinner;
- (void)startSpinnerInSpecifier:(id)a3 forKey:(id)a4;
- (void)stopAllSpinners;
- (void)stopAnimatingForKey:(id)a3;
- (void)stopNavigationSpinner;
@end

@implementation AAUISpinnerManager

- (AAUISpinnerManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISpinnerManager;
  v2 = [(AAUISpinnerManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    spinnerControllers = v2->_spinnerControllers;
    v2->_spinnerControllers = (NSMutableDictionary *)v3;

    v2->_controllersLock._os_unfair_lock_opaque = 0;
    navItem = v2->_navItem;
    v2->_navItem = 0;
  }
  return v2;
}

- (AAUISpinnerManager)initWithNavigationItem:(id)a3 hideBackButton:(BOOL)a4
{
  id v7 = a3;
  v8 = [(AAUISpinnerManager *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_navItem, a3);
    v9->_shouldHideBackButton = a4;
  }

  return v9;
}

- (void)startNavigationSpinner
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "navItem is nil. Use initWithNavigationItem: before calling startNavigationSpinner", v1, 2u);
}

void __44__AAUISpinnerManager_startNavigationSpinner__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"_AAUINavSpinnerKey"];

  if (v2)
  {
    uint64_t v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__AAUISpinnerManager_startNavigationSpinner__block_invoke_cold_1(v3);
    }
  }
  else
  {
    v4 = [[AAUINavigationItemSpinnerController alloc] initWithNavigationItem:*(void *)(*(void *)(a1 + 32) + 24) hideBackButton:*(unsigned __int8 *)(*(void *)(a1 + 32) + 32)];
    [(AAUINavigationItemSpinnerController *)v4 startSpinning];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v4 forKeyedSubscript:@"_AAUINavSpinnerKey"];
  }
}

- (void)stopNavigationSpinner
{
}

- (void)startSpinnerInSpecifier:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke;
  v11[3] = &unk_263F92758;
  p_controllersLock = &self->_controllersLock;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  os_unfair_lock_lock(p_controllersLock);
  __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke(v11);
  os_unfair_lock_unlock(p_controllersLock);
}

void __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke(void *a1)
{
  v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  if (v3)
  {
    v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke_cold_1(v2, v4);
    }
  }
  else
  {
    v5 = [[AAUISpecifierSpinnerController alloc] initWithSpecifier:a1[6]];
    [(AAUISpecifierSpinnerController *)v5 startSpinning];
    [*(id *)(a1[4] + 8) setObject:v5 forKeyedSubscript:a1[5]];
  }
}

- (void)stopAllSpinners
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_spinnerControllers allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AAUISpinnerManager *)self stopAnimatingForKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)stopAnimatingForKey:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke;
  v7[3] = &unk_263F926B8;
  p_controllersLock = &self->_controllersLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_controllersLock);
  __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_controllersLock);
}

void __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3)
  {
    [v3 stopSpinning];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke_cold_1(v2, v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_spinnerControllers, 0);
}

void __44__AAUISpinnerManager_startNavigationSpinner__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Nav bar spinner is already active!", v1, 2u);
}

void __53__AAUISpinnerManager_startSpinnerInSpecifier_forKey___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Duplicate spinner for key %@", (uint8_t *)&v3, 0xCu);
}

void __42__AAUISpinnerManager_stopAnimatingForKey___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "No spinner found for key %@", (uint8_t *)&v3, 0xCu);
}

@end