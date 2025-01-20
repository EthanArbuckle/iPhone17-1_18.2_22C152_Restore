@interface EMFocusController
+ (id)predicateForFocus:(id)a3 usingAccountRepository:(id)a4;
+ (id)updatedPredicateForFocus:(id)a3 currentPredicate:(id)a4 usingAccountRepository:(id)a5;
- (EMFocusController)init;
- (id)_currentFocusedAccountIdentifiers;
- (id)_stateCaptureInformation;
- (id)addObserver:(id)a3 currentFocus:(id *)a4;
- (void)_focusModeChanged;
- (void)_registerStateCapture;
- (void)dealloc;
- (void)getCurrentFocus:(id)a3;
@end

@implementation EMFocusController

+ (id)updatedPredicateForFocus:(id)a3 currentPredicate:(id)a4 usingAccountRepository:(id)a5
{
  id v8 = a4;
  v9 = [a1 predicateForFocus:a3 usingAccountRepository:a5];
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_andCompoundPredicateForOptionalPredicate:second:", v9, v8);

  return v10;
}

+ (id)predicateForFocus:(id)a3 usingAccountRepository:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [v5 focusedAccountIdentifiers];
    if ([v7 count])
    {
      id v8 = [v6 receivingAccounts];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__EMFocusController_predicateForFocus_usingAccountRepository___block_invoke;
      v12[3] = &unk_1E63E3490;
      id v13 = v7;
      v9 = objc_msgSend(v8, "ef_compactMap:", v12);

      v10 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v9];
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (EMFocusController)init
{
  v16.receiver = self;
  v16.super_class = (Class)EMFocusController;
  v2 = [(EMFocusController *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mail.CurrentFocusObservation"];
    observationScheduler = v2->_observationScheduler;
    v2->_observationScheduler = (EFAssertableScheduler *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    if (_os_feature_enabled_impl())
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v2);
      v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __25__EMFocusController_init__block_invoke;
      v13[3] = &unk_1E63E3440;
      objc_copyWeak(&v14, &location);
      uint64_t v8 = objc_msgSend(v7, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", @"FocusedAccountIdentifiers", 1, 1, v13);
      observationToken = v2->_observationToken;
      v2->_observationToken = (EFCancelable *)v8;

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __25__EMFocusController_init__block_invoke_2;
      v11[3] = &unk_1E63E3468;
      objc_copyWeak(&v12, &location);
      [(EMFocusController *)v2 getCurrentFocus:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    [(EMFocusController *)v2 _registerStateCapture];
  }
  return v2;
}

- (void)getCurrentFocus:(id)a3
{
  uint64_t v8 = (void (**)(id, EMFocus *))a3;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"EMFocusController.m", 69, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = [(EMFocusController *)self _currentFocusedAccountIdentifiers];
    if (v5) {
      id v6 = [[EMFocus alloc] initWithFocusedAccountIdentifiers:v5];
    }
    else {
      id v6 = 0;
    }
    v8[2](v8, v6);
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (id)_currentFocusedAccountIdentifiers
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v3 = [v2 stringArrayForKey:@"FocusedAccountIdentifiers"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __25__EMFocusController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 10);
    objc_storeStrong((id *)&v5[8], a2);
    os_unfair_lock_unlock(v5 + 10);
  }
}

- (id)addObserver:(id)a3 currentFocus:(id *)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F60D28]);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __46__EMFocusController_addObserver_currentFocus___block_invoke;
  id v13 = &unk_1E63E2F60;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  [v6 addCancelationBlock:&v10];
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  id v8 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v8, v10, v11, v12, v13);

  os_unfair_lock_unlock(&self->_lock);
  if (a4) {
    objc_storeStrong(a4, self->_currentFocus);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v6;
}

void ___ef_log_EMFocusController_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EMFocusController");
  v1 = (void *)_ef_log_EMFocusController_log;
  _ef_log_EMFocusController_log = (uint64_t)v0;
}

void __25__EMFocusController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _focusModeChanged];
  }
}

- (void)dealloc
{
  [(EFCancelable *)self->_stateCancelable cancel];
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = 0;

  v4.receiver = self;
  v4.super_class = (Class)EMFocusController;
  [(EMFocusController *)&v4 dealloc];
}

- (void)_focusModeChanged
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = _ef_log_EMFocusController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Focus mode changed", buf, 2u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__EMFocusController__focusModeChanged__block_invoke;
    v4[3] = &unk_1E63E3468;
    objc_copyWeak(&v5, (id *)buf);
    [(EMFocusController *)self getCurrentFocus:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)buf);
  }
}

void __38__EMFocusController__focusModeChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__EMFocusController__focusModeChanged__block_invoke_2;
    v7[3] = &unk_1E63E2760;
    v7[4] = WeakRetained;
    id v8 = v3;
    [v6 performBlock:v7];
  }
}

void __38__EMFocusController__focusModeChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_lock(v3);
  objc_storeStrong((id *)*v2 + 4, v2[1]);
  objc_super v4 = [*((id *)*v2 + 1) allObjects];
  os_unfair_lock_unlock(v3);
  _ef_log_EMFocusController();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Current focus: %{public}@", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "currentFocusChanged:", *(void *)(a1 + 40), (void)v11);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __46__EMFocusController_addObserver_currentFocus___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 10;
    id v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 10);
    objc_super v4 = *(void **)&v6[2]._os_unfair_lock_opaque;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 removeObject:v5];

    os_unfair_lock_unlock(v3);
    id WeakRetained = v6;
  }
}

id __62__EMFocusController_predicateForFocus_usingAccountRepository___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = [v3 objectID];
  id v6 = [v5 representedObjectID];
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4)
  {
    id v7 = +[EMMessageListItemPredicates predicateForAccount:v3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_stateCaptureInformation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = @"Focused Account Identifiers";
  objc_super v4 = [(EMFocusController *)self _currentFocusedAccountIdentifiers];
  uint64_t v5 = [v4 allObjects];
  id v6 = (void *)v5;
  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v7 = v5;
  }
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_registerStateCapture
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v6, &location);
  EFLogRegisterStateCaptureBlock();
  objc_super v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __42__EMFocusController__registerStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _stateCaptureInformation];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCancelable, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end