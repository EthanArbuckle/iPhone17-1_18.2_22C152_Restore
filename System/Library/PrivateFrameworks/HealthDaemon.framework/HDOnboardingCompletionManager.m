@interface HDOnboardingCompletionManager
- (BOOL)_performWriteTransactionAndNotifyObserversWithError:(void *)a3 block:(void *)a4 inaccessibilityHandler:;
- (BOOL)insertCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4 error:(id *)a5;
- (BOOL)insertOnboardingCompletion:(id)a3 error:(id *)a4;
- (BOOL)resetOnboardingCompletionsForFeature:(id)a3 error:(id *)a4;
- (HDOnboardingCompletionManager)initWithProfile:(id)a3;
- (id)onboardingCompletionsForHighestVersionOfFeatureIdentifier:(id)a3 error:(id *)a4;
- (id)onboardingCompletionsForLowestVersionOfFeatureIdentifier:(id)a3 error:(id *)a4;
- (void)_lock_unregisterObserver:(void *)a3 featureIdentifier:;
- (void)registerObserver:(id)a3 featureIdentifier:(id)a4 queue:(id)a5;
- (void)unregisterObserver:(id)a3;
- (void)unregisterObserver:(id)a3 featureIdentifier:(id)a4;
@end

@implementation HDOnboardingCompletionManager

- (HDOnboardingCompletionManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDOnboardingCompletionManager;
  v5 = [(HDOnboardingCompletionManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByFeatureIdentifier = v6->_observersByFeatureIdentifier;
    v6->_observersByFeatureIdentifier = v7;
  }
  return v6;
}

- (id)onboardingCompletionsForHighestVersionOfFeatureIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__58;
  v20 = __Block_byref_object_dispose__58;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HDOnboardingCompletionManager_onboardingCompletionsForHighestVersionOfFeatureIdentifier_error___block_invoke;
  v13[3] = &unk_1E62F9108;
  v15 = &v16;
  id v9 = v6;
  id v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    objc_super v10 = (void *)v17[5];
  }
  else {
    objc_super v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

BOOL __97__HDOnboardingCompletionManager_onboardingCompletionsForHighestVersionOfFeatureIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDOnboardingCompletionEntity onboardingCompletionsForHighestVersionOfFeatureIdentifier:*(void *)(a1 + 32) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)onboardingCompletionsForLowestVersionOfFeatureIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__58;
  v20 = __Block_byref_object_dispose__58;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__HDOnboardingCompletionManager_onboardingCompletionsForLowestVersionOfFeatureIdentifier_error___block_invoke;
  v13[3] = &unk_1E62F9108;
  v15 = &v16;
  id v9 = v6;
  id v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    objc_super v10 = (void *)v17[5];
  }
  else {
    objc_super v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

BOOL __96__HDOnboardingCompletionManager_onboardingCompletionsForLowestVersionOfFeatureIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDOnboardingCompletionEntity onboardingCompletionsForLowestVersionOfFeatureIdentifier:*(void *)(a1 + 32) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)insertOnboardingCompletion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HDOnboardingCompletionManager_insertOnboardingCompletion_error___block_invoke;
  v9[3] = &unk_1E62FAFB8;
  id v10 = v6;
  id v11 = self;
  id v7 = v6;
  LOBYTE(a4) = -[HDOnboardingCompletionManager _performWriteTransactionAndNotifyObserversWithError:block:inaccessibilityHandler:]((uint64_t)self, (uint64_t)a4, v9, 0);

  return (char)a4;
}

id __66__HDOnboardingCompletionManager_insertOnboardingCompletion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (id *)(*(void *)(a1 + 40) + 8);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [WeakRetained syncIdentityManager];
  id v10 = [v9 currentSyncIdentity];
  id v11 = [v10 entity];
  v12 = +[HDOnboardingCompletionEntity insertOnboardingCompletion:syncIdentity:transaction:error:](HDOnboardingCompletionEntity, "insertOnboardingCompletion:syncIdentity:transaction:error:", v5, [v11 persistentID], v7, a3);

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    id v14 = [*(id *)(a1 + 32) featureIdentifier];
    v15 = [v13 setWithObject:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_performWriteTransactionAndNotifyObserversWithError:(void *)a3 block:(void *)a4 inaccessibilityHandler:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__58;
    v16[4] = __Block_byref_object_dispose__58;
    id v17 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v10 = [WeakRetained database];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke;
    v13[3] = &unk_1E62FAFE0;
    v15 = v16;
    void v13[4] = a1;
    id v14 = v7;
    BOOL v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a2 block:v13 inaccessibilityHandler:v8];

    _Block_object_dispose(v16, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)resetOnboardingCompletionsForFeature:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HDOnboardingCompletionManager_resetOnboardingCompletionsForFeature_error___block_invoke;
  v9[3] = &unk_1E62FAFB8;
  id v10 = v6;
  BOOL v11 = self;
  id v7 = v6;
  LOBYTE(a4) = -[HDOnboardingCompletionManager _performWriteTransactionAndNotifyObserversWithError:block:inaccessibilityHandler:]((uint64_t)self, (uint64_t)a4, v9, 0);

  return (char)a4;
}

id __76__HDOnboardingCompletionManager_resetOnboardingCompletionsForFeature_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (id *)(*(void *)(a1 + 40) + 8);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [WeakRetained syncIdentityManager];
  id v10 = [v9 currentSyncIdentity];
  BOOL v11 = [v10 entity];
  LODWORD(a3) = +[HDOnboardingCompletionEntity deleteAllCompletionsForFeatureIdentifier:syncIdentity:transaction:error:](HDOnboardingCompletionEntity, "deleteAllCompletionsForFeatureIdentifier:syncIdentity:transaction:error:", v5, [v11 persistentID], v7, a3);

  if (a3)
  {
    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

BOOL __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[5];
  id v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  uint64_t v8 = v6(v5, v7, a3);
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke_2;
  v13[3] = &unk_1E62F6E80;
  uint64_t v11 = a1[6];
  void v13[4] = a1[4];
  void v13[5] = v11;
  [v7 onCommit:v13 orRollback:0];

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

void __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    lock = (os_unfair_lock_s *)(v1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 16));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(*(id *)(v1 + 24), "objectForKeyedSubscript:", v8, lock);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __70__HDOnboardingCompletionManager__notifyObserversOfFeatureIdentifiers___block_invoke;
          v11[3] = &unk_1E62FB008;
          v11[4] = v1;
          v11[5] = v8;
          [v9 notifyObservers:v11];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    os_unfair_lock_unlock(lock);
  }
}

uint64_t __70__HDOnboardingCompletionManager__notifyObserversOfFeatureIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 onboardingCompletionManager:*(void *)(a1 + 32) didUpdateOnboardingCompletionsForFeatureIdentifier:*(void *)(a1 + 40)];
}

- (BOOL)insertCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [[HDOnboardingCompletionJournalOperation alloc] initWithCodableOnboardingCompletions:v8 syncProvenance:a4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a5) = [(HDOnboardingCompletionJournalOperation *)v9 performOrJournalWithProfile:WeakRetained error:a5];

  return (char)a5;
}

id __113__HDOnboardingCompletionManager__insertCodableOnboardingCompletions_syncProvenance_error_inaccessabilityHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[4];
  uint64_t v6 = (id *)(a1[5] + 8);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v9 = +[HDOnboardingCompletionEntity insertCodableOnboardingCompletions:v5 syncProvenance:v4 profile:WeakRetained transaction:v7 error:a3];

  return v9;
}

- (void)registerObserver:(id)a3 featureIdentifier:(id)a4 queue:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_observersByFeatureIdentifier objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    long long v12 = HKLogInfrastructure();
    id v10 = (void *)[v11 initWithName:v8 loggingCategory:v12];

    [(NSMutableDictionary *)self->_observersByFeatureIdentifier setObject:v10 forKeyedSubscript:v8];
  }
  [v10 registerObserver:v13 queue:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3 featureIdentifier:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDOnboardingCompletionManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_unregisterObserver:(void *)a3 featureIdentifier:
{
  if (a1)
  {
    uint64_t v5 = (const os_unfair_lock *)(a1 + 16);
    id v6 = a3;
    id v7 = a2;
    os_unfair_lock_assert_owner(v5);
    id v8 = [*(id *)(a1 + 24) objectForKeyedSubscript:v6];

    [v8 unregisterObserver:v7];
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_observersByFeatureIdentifier allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDOnboardingCompletionManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v4, *(void **)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByFeatureIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end