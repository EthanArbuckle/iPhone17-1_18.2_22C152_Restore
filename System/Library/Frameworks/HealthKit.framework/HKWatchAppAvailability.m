@interface HKWatchAppAvailability
- (ASDAppQuery)query;
- (HKWatchAppAvailability)initWithBundleID:(id)a3;
- (HKWatchAppAvailabilityObserver)observers;
- (NSArray)_test_apps;
- (NSString)bundleID;
- (id)findApplicationIn:(id)a3;
- (int64_t)installState;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)appInstallStateOnWatch:(id)a3 completion:(id)a4;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setInstallState:(int64_t)a3;
- (void)setObservers:(id)a3;
- (void)setQuery:(id)a3;
- (void)set_test_apps:(id)a3;
@end

@implementation HKWatchAppAvailability

- (HKWatchAppAvailability)initWithBundleID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWatchAppAvailability;
  v6 = [(HKWatchAppAvailability *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v7->_installState = -1;
    v8 = [HKObserverSet alloc];
    uint64_t v9 = [(HKObserverSet *)v8 initWithName:@"AppAvailabilityObservers" loggingCategory:HKLogDefault];
    observers = v7->_observers;
    v7->_observers = (HKWatchAppAvailabilityObserver *)v9;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(HKWatchAppAvailability *)self query];
  [v3 setObserver:0];

  v4.receiver = self;
  v4.super_class = (Class)HKWatchAppAvailability;
  [(HKWatchAppAvailability *)&v4 dealloc];
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)appInstallStateOnWatch:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  uint64_t v9 = (void *)getASDAppQueryClass_softClass;
  uint64_t v22 = getASDAppQueryClass_softClass;
  if (!getASDAppQueryClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __getASDAppQueryClass_block_invoke;
    location[3] = &unk_1E58BD760;
    location[4] = &v19;
    __getASDAppQueryClass_block_invoke((uint64_t)location);
    uint64_t v9 = (void *)v20[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v19, 8);
  v11 = [v10 queryForSystemAppsOnPairedDevice:v7];
  [(HKWatchAppAvailability *)self setQuery:v11];

  objc_super v12 = [(HKWatchAppAvailability *)self query];
  [v12 setObserver:self];

  objc_initWeak(location, self);
  v13 = [(HKWatchAppAvailability *)self query];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HKWatchAppAvailability_appInstallStateOnWatch_completion___block_invoke;
  v15[3] = &unk_1E58C61D0;
  objc_copyWeak(v17, location);
  id v14 = v8;
  id v16 = v14;
  v17[1] = (id)a2;
  [v13 executeQueryWithResultHandler:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(location);
}

void __60__HKWatchAppAvailability_appInstallStateOnWatch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    objc_super v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"%@ deallocated", objc_opt_class());
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 3, v12);
LABEL_17:

    goto LABEL_18;
  }
  if (!v6
    || (objc_msgSend(WeakRetained, "_test_apps"), uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    id v10 = objc_msgSend(v8, "_test_apps");
    if (v10)
    {
      v11 = objc_msgSend(v8, "_test_apps");
      objc_super v12 = [v8 findApplicationIn:v11];
    }
    else
    {
      objc_super v12 = [v8 findApplicationIn:v5];
    }

    if (v12)
    {
      if ([v12 isInstalled])
      {
        uint64_t v14 = 2;
      }
      else
      {
        v23 = [v12 progress];
        uint64_t v14 = v23 != 0;
      }
      [v8 setInstallState:v14];
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, void))(v20 + 16);
      uint64_t v22 = v14;
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *(const char **)(a1 + 48);
        v17 = v15;
        v18 = NSStringFromSelector(v16);
        uint64_t v19 = [v8 bundleID];
        *(_DWORD *)buf = 138543874;
        v30 = v8;
        __int16 v31 = 2114;
        v32 = v18;
        __int16 v33 = 2114;
        v34 = v19;
        _os_log_impl(&dword_19C023000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Application (%{public}@) was not found on watch", buf, 0x20u);
      }
      [v8 setInstallState:0];
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, void))(v20 + 16);
      uint64_t v22 = 0;
    }
    v21(v20, v22, 0);
    goto LABEL_17;
  }
  _HKInitializeLogging();
  v24 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
  {
    v25 = *(const char **)(a1 + 48);
    v26 = v24;
    v27 = NSStringFromSelector(v25);
    v28 = [v8 bundleID];
    *(_DWORD *)buf = 138544130;
    v30 = v8;
    __int16 v31 = 2114;
    v32 = v27;
    __int16 v33 = 2114;
    v34 = v28;
    __int16 v35 = 2114;
    id v36 = v6;
    _os_log_error_impl(&dword_19C023000, v26, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to fetch install state for application (%{public}@) with error: %{public}@", buf, 0x2Au);
  }
  [v8 setInstallState:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_18:
}

- (id)findApplicationIn:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  id v6 = [(HKWatchAppAvailability *)self bundleID];
  id v7 = [v4 predicateWithFormat:@"bundleID == %@", v6];

  id v8 = [v5 filteredArrayUsingPredicate:v7];

  uint64_t v9 = [v8 firstObject];

  return v9;
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HKWatchAppAvailability *)self query];

  if (v9 == v8)
  {
    id v10 = [(HKWatchAppAvailability *)self _test_apps];
    if (v10)
    {
      v11 = [(HKWatchAppAvailability *)self _test_apps];
      objc_super v12 = [(HKWatchAppAvailability *)self findApplicationIn:v11];
    }
    else
    {
      objc_super v12 = [(HKWatchAppAvailability *)self findApplicationIn:v7];
    }

    if (v12)
    {
      if ([v12 isInstalled])
      {
        uint64_t v13 = 2;
      }
      else
      {
        v18 = [v12 progress];
        uint64_t v13 = v18 != 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = (void *)HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        id v16 = NSStringFromSelector(a2);
        v17 = [(HKWatchAppAvailability *)self bundleID];
        *(_DWORD *)buf = 138543874;
        v30 = self;
        __int16 v31 = 2114;
        v32 = v16;
        __int16 v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Application (%{public}@) was not found on watch", buf, 0x20u);
      }
      uint64_t v13 = 0;
    }
    if ([(HKWatchAppAvailability *)self installState] == v13)
    {
      if (v13 == 1)
      {
        observers = self->_observers;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke_2;
        v26[3] = &unk_1E58C6220;
        v26[4] = self;
        id v27 = v12;
        [(HKWatchAppAvailabilityObserver *)observers notifyObservers:v26];
      }
    }
    else
    {
      [(HKWatchAppAvailability *)self setInstallState:v13];
      _HKInitializeLogging();
      uint64_t v20 = (void *)HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = NSNumber;
        uint64_t v22 = self->_observers;
        v23 = v20;
        v24 = objc_msgSend(v21, "numberWithUnsignedInteger:", -[HKWatchAppAvailabilityObserver count](v22, "count"));
        *(_DWORD *)buf = 138543618;
        v30 = self;
        __int16 v31 = 2112;
        v32 = v24;
        _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of onboarding completion update", buf, 0x16u);
      }
      v25 = self->_observers;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke;
      v28[3] = &unk_1E58C61F8;
      v28[4] = self;
      v28[5] = v13;
      [(HKWatchAppAvailabilityObserver *)v25 notifyObservers:v28];
    }
  }
}

uint64_t __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 watchAppAvailability:*(void *)(a1 + 32) appInstallStateDidChange:*(void *)(a1 + 40)];
}

void __52__HKWatchAppAvailability_appQuery_resultsDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = NSNumber;
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) progress];
    [v5 fractionCompleted];
    id v6 = objc_msgSend(v3, "numberWithDouble:");
    [v7 watchAppAvailability:v4 appInstallProgressDidUpdate:v6];
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (ASDAppQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSArray)_test_apps
{
  return self->__test_apps;
}

- (void)set_test_apps:(id)a3
{
}

- (HKWatchAppAvailabilityObserver)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (int64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(int64_t)a3
{
  self->_installState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->__test_apps, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end