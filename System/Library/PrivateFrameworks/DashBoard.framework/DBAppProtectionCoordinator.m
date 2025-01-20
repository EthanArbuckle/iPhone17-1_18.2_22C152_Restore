@interface DBAppProtectionCoordinator
- (BOOL)applicationBundleIdentifierIsLockedOrHidden:(id)a3;
- (CARObserverHashTable)observers;
- (DBAppProtectionCoordinator)init;
- (NSMutableSet)hiddenApplicationBundleIdentifiers;
- (NSMutableSet)lockedApplicationBundleIdentifiers;
- (void)addObserver:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setHiddenApplicationBundleIdentifiers:(id)a3;
- (void)setLockedApplicationBundleIdentifiers:(id)a3;
@end

@implementation DBAppProtectionCoordinator

- (DBAppProtectionCoordinator)init
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)DBAppProtectionCoordinator;
  v2 = [(DBAppProtectionCoordinator *)&v27 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x263F25220] subjectMonitorRegistry];
    id v5 = (id)[v4 addMonitor:v3 subjectMask:1];

    v6 = [MEMORY[0x263F251D0] lockedApplications];
    v7 = [MEMORY[0x263F251D0] hiddenApplications];
    v8 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "[DBAppProtectionCoordinator] App protection locked applications: %@", buf, 0xCu);
    }

    v9 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v7;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "[DBAppProtectionCoordinator] App protection hidden applications: %@", buf, 0xCu);
    }

    os_unfair_lock_lock(&v3->_lock);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    lockedApplicationBundleIdentifiers = v3->_lockedApplicationBundleIdentifiers;
    v3->_lockedApplicationBundleIdentifiers = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    hiddenApplicationBundleIdentifiers = v3->_hiddenApplicationBundleIdentifiers;
    v3->_hiddenApplicationBundleIdentifiers = v12;

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __34__DBAppProtectionCoordinator_init__block_invoke;
    v25[3] = &unk_2649B5378;
    v14 = v3;
    v26 = v14;
    [v6 enumerateObjectsUsingBlock:v25];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __34__DBAppProtectionCoordinator_init__block_invoke_2;
    v23 = &unk_2649B5378;
    v15 = v14;
    v24 = v15;
    [v7 enumerateObjectsUsingBlock:&v20];
    os_unfair_lock_unlock(&v3->_lock);
    id v16 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v17 = objc_msgSend(v16, "initWithProtocol:", &unk_26E1CDD50, v20, v21, v22, v23);
    observers = v15->_observers;
    v15->_observers = (CARObserverHashTable *)v17;
  }
  return v3;
}

void __34__DBAppProtectionCoordinator_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [a2 bundleIdentifier];
  [v2 addObject:v3];
}

void __34__DBAppProtectionCoordinator_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [a2 bundleIdentifier];
  [v2 addObject:v3];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAppProtectionCoordinator *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAppProtectionCoordinator *)self observers];
  [v5 removeObserver:v4];
}

- (BOOL)applicationBundleIdentifierIsLockedOrHidden:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(DBAppProtectionCoordinator *)self lockedApplicationBundleIdentifiers];
  if ([v6 containsObject:v4])
  {
    char v7 = 1;
  }
  else
  {
    v8 = [(DBAppProtectionCoordinator *)self hiddenApplicationBundleIdentifiers];
    char v7 = [v8 containsObject:v4];
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__DBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __75__DBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[DBAppProtectionCoordinator] App protection subjects changed: %@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __75__DBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke_68;
  v13 = &unk_2649B53A0;
  id v5 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:&v10];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  char v7 = objc_msgSend(*(id *)(a1 + 40), "observers", v10, v11, v12, v13, v14);
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = (void *)[v6 copy];
  [v7 appProtectionCoordinator:v8 didUpdateBundleIdentifiers:v9];
}

void __75__DBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 bundleIdentifier];
  v9 = DBLogForCategory(1uLL);
  uint64_t v10 = v9;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v7 isLocked];
      v12 = @"unlocked";
      if (v11) {
        v12 = @"locked";
      }
      int v22 = 138543618;
      v23 = v8;
      __int16 v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "[DBAppProtectionCoordinator] App %{public}@ is now %{public}@", (uint8_t *)&v22, 0x16u);
    }

    int v13 = [v7 isLocked];
    uint64_t v14 = [*(id *)(a1 + 32) lockedApplicationBundleIdentifiers];
    id v15 = v14;
    if (v13) {
      [v14 addObject:v8];
    }
    else {
      [v14 removeObject:v8];
    }

    id v16 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v7 isHidden];
      uint64_t v18 = @"unhidden";
      if (v17) {
        uint64_t v18 = @"hidden";
      }
      int v22 = 138543618;
      v23 = v8;
      __int16 v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "[DBAppProtectionCoordinator] App %{public}@ is now %{public}@", (uint8_t *)&v22, 0x16u);
    }

    int v19 = [v7 isHidden];
    uint64_t v20 = [*(id *)(a1 + 32) hiddenApplicationBundleIdentifiers];
    uint64_t v21 = v20;
    if (v19) {
      [v20 addObject:v8];
    }
    else {
      [v20 removeObject:v8];
    }

    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __75__DBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke_68_cold_1((uint64_t)v5, v10);
    }
  }
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (NSMutableSet)lockedApplicationBundleIdentifiers
{
  return self->_lockedApplicationBundleIdentifiers;
}

- (void)setLockedApplicationBundleIdentifiers:(id)a3
{
}

- (NSMutableSet)hiddenApplicationBundleIdentifiers
{
  return self->_hiddenApplicationBundleIdentifiers;
}

- (void)setHiddenApplicationBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockedApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __75__DBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke_68_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "[DBAppProtectionCoordinator] Failed to find bundle identifier for subject: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end