@interface HDHealthRecordsAccountExistenceNotifier
- (BOOL)ontologyEnablingHealthRecordsAccountExists;
- (HDHealthRecordsAccountExistenceNotifier)init;
- (HDHealthRecordsAccountExistenceNotifier)initWithProfile:(id)a3;
- (HDProfile)profile;
- (const)_updateAndReturnState;
- (id)unitTesting_profileReadyCompleteHandler;
- (int64_t)ontologyEnablingHealthRecordsAccountState;
- (void)addAccountExistenceObserver:(id)a3;
- (void)addAccountExistenceObserver:(id)a3 queue:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeAccountExistenceObserver:(id)a3;
- (void)setUnitTesting_profileReadyCompleteHandler:(id)a3;
- (void)unitTesting_setOntologyEnablingHealthRecordsAccountExists:(BOOL)a3;
@end

@implementation HDHealthRecordsAccountExistenceNotifier

- (HDHealthRecordsAccountExistenceNotifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordsAccountExistenceNotifier)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsAccountExistenceNotifier;
  v5 = [(HDHealthRecordsAccountExistenceNotifier *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v8 = [v7 initWithName:@"HDHealthRecordsAccountExistenceObservers" loggingCategory:*MEMORY[0x1E4F29F38]];
    observers = v6->_observers;
    v6->_observers = (HDHealthRecordsAccountExistenceObserver *)v8;

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_state = 0;
    v6->_testOverrideState = 0;
    v6->_isProfileReady = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (int64_t)ontologyEnablingHealthRecordsAccountState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (state) {
    return state;
  }

  return (int64_t)-[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState]((const os_unfair_lock *)self);
}

- (const)_updateAndReturnState
{
  v1 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 6);
    os_unfair_lock_lock((os_unfair_lock_t)&v1[6]);
    int os_unfair_lock_opaque_low = LOBYTE(v1[12]._os_unfair_lock_opaque);
    os_unfair_lock_unlock((os_unfair_lock_t)&v1[6]);
    if (os_unfair_lock_opaque_low)
    {
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x2020000000;
      uint64_t v16 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&v1[14]);
      id v4 = [WeakRetained database];
      v5 = +[HDDatabaseTransactionContext highPriorityContext];
      v6 = (void *)[v5 copyForReadingProtectedData];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64__HDHealthRecordsAccountExistenceNotifier__queryForAccountState__block_invoke;
      v11[3] = &unk_1E62F3DB0;
      v11[4] = v1;
      v11[5] = &v13;
      id v12 = 0;
      char v7 = [v4 performTransactionWithContext:v6 error:&v12 block:v11 inaccessibilityHandler:0];
      id v8 = v12;

      if ((v7 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
      {
        _HKInitializeLogging();
        v9 = *MEMORY[0x1E4F29F38];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v18 = v1;
          __int16 v19 = 2114;
          id v20 = v8;
          _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to determine if profile has health records accounts: %{public}@", buf, 0x16u);
        }
      }
      v1 = (const os_unfair_lock *)v14[3];
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)ontologyEnablingHealthRecordsAccountExists
{
  return [(HDHealthRecordsAccountExistenceNotifier *)self ontologyEnablingHealthRecordsAccountState] == 2;
}

- (void)addAccountExistenceObserver:(id)a3
{
}

- (void)addAccountExistenceObserver:(id)a3 queue:(id)a4
{
}

- (void)removeAccountExistenceObserver:(id)a3
{
}

- (void)unitTesting_setOntologyEnablingHealthRecordsAccountExists:(BOOL)a3
{
  if (a3) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_testOverrideState = v4;
  os_unfair_lock_unlock(p_lock);

  -[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState]((const os_unfair_lock *)self);
}

- (void)setUnitTesting_profileReadyCompleteHandler:(id)a3
{
  p_lock = &self->_lock;
  unitTesting_profileReadyCompleteHandler = (void (**)(id, HDHealthRecordsAccountExistenceNotifier *))a3;
  os_unfair_lock_lock(p_lock);
  if (self->_isProfileReady)
  {
    unitTesting_profileReadyCompleteHandler[2](unitTesting_profileReadyCompleteHandler, self);
  }
  else
  {
    v6 = (void *)[unitTesting_profileReadyCompleteHandler copy];

    unitTesting_profileReadyCompleteHandler = (void (**)(id, HDHealthRecordsAccountExistenceNotifier *))self->_unitTesting_profileReadyCompleteHandler;
    self->_unitTesting_profileReadyCompleteHandler = v6;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained profileExtensionsConformingToProtocol:&unk_1F18A8528];
  v6 = [v5 firstObject];
  objc_storeWeak((id *)&self->_healthRecordsProfileExtension, v6);

  id v7 = objc_loadWeakRetained((id *)&self->_healthRecordsProfileExtension);
  [v7 addAccountEventObserver:self];

  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_isProfileReady = 1;
    os_unfair_lock_unlock(&self->_lock);
    -[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState]((const os_unfair_lock *)self);
    os_unfair_lock_lock(&self->_lock);
    v10 = _Block_copy(self->_unitTesting_profileReadyCompleteHandler);
    id unitTesting_profileReadyCompleteHandler = self->_unitTesting_profileReadyCompleteHandler;
    self->_id unitTesting_profileReadyCompleteHandler = 0;

    os_unfair_lock_unlock(&self->_lock);
    v9 = v10;
    if (v10)
    {
      (*((void (**)(void *, HDHealthRecordsAccountExistenceNotifier *))v10 + 2))(v10, self);
      v9 = v10;
    }
  }
  else
  {
    -[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState](0);
  }
}

BOOL __64__HDHealthRecordsAccountExistenceNotifier__queryForAccountState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  os_unfair_lock_lock(v5);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v6;
  if (v7)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 24));
    uint64_t v9 = *(void *)(v7 + 40);
    if (!v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 8));
      v11 = WeakRetained;
      if (WeakRetained)
      {
        uint64_t v12 = [WeakRetained hasGatewayBackedAccountsWithTransaction:v8 error:a3];
        uint64_t v9 = v12;
        if (v12)
        {
          if (v12 == 1)
          {
            uint64_t v9 = 2;
          }
          else
          {
            uint64_t v18 = [v11 hasIssuerBackedAccountsWithTransaction:v8 error:a3];
            uint64_t v9 = v18;
            if (v18)
            {
              if (v18 == 2)
              {
                uint64_t v9 = 1;
              }
              else
              {
                __int16 v19 = [(id)v7 profile];
                id v20 = [v19 daemon];
                uint64_t v21 = [v20 ontologyConfigurationProvider];
                v22 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableCurrentLocale");
                int v23 = [v21 isCountrySupported:v22];

                if (v23) {
                  uint64_t v9 = 2;
                }
                else {
                  uint64_t v9 = 1;
                }
              }
            }
          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"nil HDHealthRecordsProfileExtension");
        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v13 + 24));
    BOOL v15 = *(void *)(v13 + 32) != 2;
    *(void *)(v13 + 32) = v14;
    if ((((v14 == 2) ^ v15) & 1) == 0)
    {
      uint64_t v16 = *(void **)(v13 + 16);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __92__HDHealthRecordsAccountExistenceNotifier__lock_updateStateAndNotifyIfRequiredWithNewState___block_invoke;
      v24[3] = &unk_1E62F8E98;
      v24[4] = v13;
      BOOL v25 = v14 == 2;
      [v16 notifyObservers:v24];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

uint64_t __92__HDHealthRecordsAccountExistenceNotifier__lock_updateStateAndNotifyIfRequiredWithNewState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accountExistenceNotifier:*(void *)(a1 + 32) didChangeHealthRecordAccountExistence:*(unsigned __int8 *)(a1 + 40)];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (id)unitTesting_profileReadyCompleteHandler
{
  return self->_unitTesting_profileReadyCompleteHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_profileReadyCompleteHandler, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_healthRecordsProfileExtension);
}

@end