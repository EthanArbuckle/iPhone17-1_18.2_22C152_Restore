@interface HDMedicationCountProvider
+ (uint64_t)_medicationCountForCurrentCountNumber:(uint64_t)a3 addedCount:;
- (HDDaemon)daemon;
- (HDMedicationCountProvider)init;
- (HDMedicationCountProvider)initWithDaemon:(id)a3;
- (id)_countOfOntologyBackedMedicationsForTransaction:(uint64_t)a3 error:;
- (int64_t)ontologyBackedMedicationCountInProfile:(id)a3;
- (os_unfair_lock_s)_getAndSetReadyProfile:(os_unfair_lock_s *)result;
- (os_unfair_lock_s)_isReadyProfile:(os_unfair_lock_s *)result;
- (uint64_t)_lock_lookupAndUpdateCountForProfile:(void *)a3 transaction:(uint64_t)a4 error:;
- (uint64_t)_updateAndReturnCountForProfile:(uint64_t)a1;
- (uint64_t)_updateCountForReadyProfile:(uint64_t)a1;
- (void)_lock_updateCountAndNotifyIfRequiredForProfile:(void *)a3 currentCountNumber:(uint64_t)a4 newCount:;
- (void)_lock_updateOntologyBackedMedicationCountWithAddedCount:(void *)a3 profile:;
- (void)_monitorMedicationCountsInProfile:(uint64_t)a1;
- (void)_updateOntologyBackedMedicationCountWithAddedCount:(void *)a3 profile:;
- (void)addMedicationCountObserver:(id)a3 queue:(id)a4;
- (void)monitorMedicationCountsInProfile:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeMedicationCountObserver:(id)a3;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4;
@end

@implementation HDMedicationCountProvider

- (HDMedicationCountProvider)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationCountProvider)initWithDaemon:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDMedicationCountProvider;
  v5 = [(HDMedicationCountProvider *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = HKLogHealthOntology();
    uint64_t v9 = [v7 initWithName:@"HDMedicationCountObserver" loggingCategory:v8];
    observers = v6->_observers;
    v6->_observers = (HDMedicationCountObserver *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)monitorMedicationCountsInProfile:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  isProfileReadyByProfile = self->_isProfileReadyByProfile;
  if (!isProfileReadyByProfile)
  {
    v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v6 = self->_isProfileReadyByProfile;
    self->_isProfileReadyByProfile = v5;

    isProfileReadyByProfile = self->_isProfileReadyByProfile;
  }
  id v7 = [(NSMapTable *)isProfileReadyByProfile objectForKey:v8];
  if (v7)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [(NSMapTable *)self->_isProfileReadyByProfile setObject:MEMORY[0x1E4F1CC28] forKey:v8];
    os_unfair_lock_unlock(&self->_lock);
    -[HDMedicationCountProvider _monitorMedicationCountsInProfile:]((uint64_t)self, v8);
    [v8 registerProfileReadyObserver:self queue:0];
  }
}

- (void)_monitorMedicationCountsInProfile:(uint64_t)a1
{
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 16);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = *(void **)(a1 + 24);
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      id v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    [v5 setObject:&unk_1F17FC3D8 forKey:v4];
    os_unfair_lock_unlock(v3);
    id v8 = [v4 userDomainConceptManager];

    [v8 addUserDomainConceptObserver:a1 queue:0];
  }
}

- (int64_t)ontologyBackedMedicationCountInProfile:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMapTable *)self->_ontologyBackedMedicationCountByProfile objectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    int64_t v6 = [v5 integerValue];
    if (v6 == -1) {
      int64_t v6 = -[HDMedicationCountProvider _updateAndReturnCountForProfile:]((uint64_t)self, v4);
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_updateAndReturnCountForProfile:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 16));
    if (-[HDMedicationCountProvider _isReadyProfile:]((os_unfair_lock_s *)a1, v3)) {
      a1 = -[HDMedicationCountProvider _updateCountForReadyProfile:](a1, v3);
    }
    else {
      a1 = -1;
    }
  }

  return a1;
}

- (void)addMedicationCountObserver:(id)a3 queue:(id)a4
{
}

- (void)removeMedicationCountObserver:(id)a3
{
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  if ((-[HDMedicationCountProvider _getAndSetReadyProfile:]((os_unfair_lock_s *)self, v4) & 1) == 0) {
    -[HDMedicationCountProvider _updateCountForReadyProfile:]((uint64_t)self, v4);
  }
}

- (os_unfair_lock_s)_getAndSetReadyProfile:(os_unfair_lock_s *)result
{
  if (result)
  {
    v2 = result;
    id v3 = result + 4;
    id v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = [*(id *)&v2[8]._os_unfair_lock_opaque objectForKey:v4];
    uint64_t v6 = [v5 BOOLValue];

    [*(id *)&v2[8]._os_unfair_lock_opaque setObject:MEMORY[0x1E4F1CC38] forKey:v4];
    os_unfair_lock_unlock(v3);
    return (os_unfair_lock_s *)v6;
  }
  return result;
}

- (uint64_t)_updateCountForReadyProfile:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = [v3 userDomainConceptManager];

    if (v5)
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2020000000;
      uint64_t v19 = -1;
      uint64_t v6 = (void *)MEMORY[0x1E4F65C20];
      id v7 = [v4 database];
      v14 = &v16;
      id v15 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__HDMedicationCountProvider__updateCountForReadyProfile___block_invoke;
      v12[3] = &unk_1E63379B0;
      v12[4] = a1;
      id v13 = v4;
      char v8 = [v6 performReadTransactionWithHealthDatabase:v7 error:&v15 block:v12];
      id v9 = v15;

      if ((v8 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
      {
        _HKInitializeLogging();
        v10 = HKLogHealthOntology();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          [(HDMedicationCountProvider *)a1 _updateCountForReadyProfile:v10];
        }
      }
      a1 = v17[3];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [v13 firstOntologyCoding];

          if (v14) {
            ++v10;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
    if (v10 >= 1)
    {
      id v15 = [v6 profile];
      -[HDMedicationCountProvider _updateOntologyBackedMedicationCountWithAddedCount:profile:]((uint64_t)self, v10, v15);
    }
  }
}

- (void)_updateOntologyBackedMedicationCountWithAddedCount:(void *)a3 profile:
{
  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 16);
    id v6 = a3;
    os_unfair_lock_lock(v5);
    -[HDMedicationCountProvider _lock_updateOntologyBackedMedicationCountWithAddedCount:profile:](a1, a2, v6);
    os_unfair_lock_unlock(v5);
    -[HDMedicationCountProvider _updateAndReturnCountForProfile:](a1, v6);
  }
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  id v5 = [a3 profile];
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_ontologyBackedMedicationCountByProfile setObject:&unk_1F17FC3D8 forKey:v5];
  os_unfair_lock_unlock(&self->_lock);
  -[HDMedicationCountProvider _updateAndReturnCountForProfile:]((uint64_t)self, v5);
}

- (os_unfair_lock_s)_isReadyProfile:(os_unfair_lock_s *)result
{
  if (result)
  {
    v2 = result;
    id v3 = result + 4;
    id v4 = a2;
    os_unfair_lock_lock(v3);
    id v5 = [*(id *)&v2[8]._os_unfair_lock_opaque objectForKey:v4];

    uint64_t v6 = [v5 BOOLValue];
    os_unfair_lock_unlock(v3);
    return (os_unfair_lock_s *)v6;
  }
  return result;
}

BOOL __57__HDMedicationCountProvider__updateCountForReadyProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  os_unfair_lock_lock(v5);
  uint64_t v7 = -[HDMedicationCountProvider _lock_lookupAndUpdateCountForProfile:transaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), v6, a3);

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != -1;
}

- (uint64_t)_lock_lookupAndUpdateCountForProfile:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = -[HDMedicationCountProvider _countOfOntologyBackedMedicationsForTransaction:error:](a1, a3, a4);
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 integerValue];
      if (v10) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = 0;
      }
      if (v10 == 1) {
        uint64_t v11 = 1;
      }
      if (v10 >= 2) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = v11;
      }
      id v13 = [*(id *)(a1 + 24) objectForKey:v7];
      -[HDMedicationCountProvider _lock_updateCountAndNotifyIfRequiredForProfile:currentCountNumber:newCount:](a1, v7, v13, v12);
    }
    else
    {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_lock_updateOntologyBackedMedicationCountWithAddedCount:(void *)a3 profile:
{
  if (a1)
  {
    id v5 = (const os_unfair_lock *)(a1 + 16);
    id v6 = a3;
    os_unfair_lock_assert_owner(v5);
    id v8 = [*(id *)(a1 + 24) objectForKey:v6];
    uint64_t v7 = +[HDMedicationCountProvider _medicationCountForCurrentCountNumber:addedCount:]((uint64_t)HDMedicationCountProvider, v8, a2);
    -[HDMedicationCountProvider _lock_updateCountAndNotifyIfRequiredForProfile:currentCountNumber:newCount:](a1, v6, v8, v7);
  }
}

- (id)_countOfOntologyBackedMedicationsForTransaction:(uint64_t)a3 error:
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1E4F65D08];
    id v5 = (void *)MEMORY[0x1E4F2B690];
    id v6 = a2;
    uint64_t v7 = [v5 medicationUserDomainConceptTypeIdentifier];
    id v8 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65A38] equalToValue:*MEMORY[0x1E4F29FC0]];
    v14[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v11 = [v4 predicateMatchingAllPredicates:v10];

    uint64_t v12 = [MEMORY[0x1E4F65C28] countOfUserDomainConceptsMatchingPredicate:v11 options:0 transaction:v6 error:a3];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

+ (uint64_t)_medicationCountForCurrentCountNumber:(uint64_t)a3 addedCount:
{
  id v4 = a2;
  self;
  if (a3) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a3 == 1) {
    uint64_t v5 = 1;
  }
  if (a3 >= 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v4)
  {
    uint64_t v7 = [v4 integerValue];
    if (v7 > v6) {
      uint64_t v6 = v7;
    }
  }

  return v6;
}

- (void)_lock_updateCountAndNotifyIfRequiredForProfile:(void *)a3 currentCountNumber:(uint64_t)a4 newCount:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    uint64_t v9 = [v8 integerValue];
    if (v9) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v9 == 1) {
      uint64_t v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v10 = 2;
    }
    if (v10 != a4)
    {
      uint64_t v11 = *(void **)(a1 + 24);
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
      [v11 setObject:v12 forKey:v7];

      id v13 = *(void **)(a1 + 8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __104__HDMedicationCountProvider__lock_updateCountAndNotifyIfRequiredForProfile_currentCountNumber_newCount___block_invoke;
      void v14[3] = &unk_1E63379D8;
      v14[4] = a1;
      id v15 = v7;
      uint64_t v16 = a4;
      [v13 notifyObservers:v14];
    }
  }
}

uint64_t __104__HDMedicationCountProvider__lock_updateCountAndNotifyIfRequiredForProfile_currentCountNumber_newCount___block_invoke(void *a1, void *a2)
{
  return [a2 medicationCountProvider:a1[4] didObserveChangeForProfile:a1[5] ontologyBackedMedicationCount:a1[6]];
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_isProfileReadyByProfile, 0);
  objc_storeStrong((id *)&self->_ontologyBackedMedicationCountByProfile, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_updateCountForReadyProfile:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BD54A000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to determine if profile has ontology backed medications: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end