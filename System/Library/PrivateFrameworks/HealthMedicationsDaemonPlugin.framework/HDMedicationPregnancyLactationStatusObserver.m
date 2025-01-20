@interface HDMedicationPregnancyLactationStatusObserver
- (BOOL)_deleteAllPregnancyLactationInteractionsOfType:(void *)a3 transaction:(void *)a4 reason:(uint64_t)a5 error:;
- (BOOL)_unitTest_shouldAttemptToDeletePregnancyDismissedInteractions;
- (BOOL)_unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions;
- (HDMedicationPregnancyLactationStatusObserver)initWithProfile:(id)a3;
- (id)unitTesting_pregnancyModelDidUpdate;
- (id)unitTesting_protectedDataDidBecomeAvailable;
- (id)unitTesting_samplesAdded;
- (id)unitTesting_samplesOfTypesWereRemoved;
- (uint64_t)_deletePregnancyInteractionsWithReason:(uint64_t)a3 error:;
- (uint64_t)_queryAndDeleteLactationInteractionsWithReason:(void *)a3 transaction:(void *)a4 error:;
- (uint64_t)doesMostRecentLactationSampleHaveDistantFutureEndDateWithError:(uint64_t)a1;
- (void)_deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded;
- (void)_deletePregancyInteractionsOnProtectedDataAvailabilityIfNeeded;
- (void)_pregnancyModelWasUpdated:(uint64_t)a1;
- (void)_protectedDataDidBecomeAvailable:(uint64_t)a1;
- (void)_queryAndDeleteLactationInteractionsWithReason:(uint64_t)a1;
- (void)_samplesOfTypesWereRemoved:(void *)a3 anchor:;
- (void)_samplesWereAdded:(void *)a3 anchor:;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)pregnancyModelDidUpdate:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setUnitTesting_pregnancyModelDidUpdate:(id)a3;
- (void)setUnitTesting_protectedDataDidBecomeAvailable:(id)a3;
- (void)setUnitTesting_samplesAdded:(id)a3;
- (void)setUnitTesting_samplesOfTypesWereRemoved:(id)a3;
- (void)set_unitTest_shouldAttemptToDeletePregnancyDismissedInteractions:(BOOL)a3;
- (void)set_unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions:(BOOL)a3;
@end

@implementation HDMedicationPregnancyLactationStatusObserver

- (BOOL)_deleteAllPregnancyLactationInteractionsOfType:(void *)a3 transaction:(void *)a4 reason:(uint64_t)a5 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (a1)
  {
    v10 = @"lactation";
    if (a2 == 1) {
      v10 = @"pregnancy";
    }
    v11 = v10;
    id v12 = a3;
    _HKInitializeLogging();
    v13 = HKLogMedication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      id v15 = v14;
      v16 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will delete %@ dismissed interaction objects, %@", buf, 0x20u);
    }
    v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
    v23 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v19 = HDDismissedPregnancyLactationInteractionPredicateForInteractionTypes((uint64_t)v18);

    v20 = [v12 databaseForEntityClass:objc_opt_class()];

    BOOL v21 = +[HDSQLiteEntity deleteEntitiesInDatabase:v20 predicate:v19 error:a5];
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HKSensitiveLogItem();
  if (![v4 state])
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v4, "state"));
    v7 = NSString;
    v8 = HKSensitiveLogItem();
    id v9 = [v7 stringWithFormat:@"responding to update to new %@ state: %@", v5, v8];

    id v21 = 0;
    int v10 = -[HDMedicationPregnancyLactationStatusObserver _deletePregnancyInteractionsWithReason:error:]((uint64_t)self, v9, (uint64_t)&v21);
    id v11 = v21;
    _HKInitializeLogging();
    id v12 = HKLogMedication();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v14;
        __int16 v24 = 2112;
        v25 = v5;
        id v15 = v14;
        _os_log_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interaction objects", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v23 = v19;
        __int16 v24 = 2114;
        v25 = v5;
        __int16 v26 = 2114;
        id v27 = v11;
        id v20 = v19;
        _os_log_error_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to delete %{public}@ dismissal items, error: %{public}@", buf, 0x20u);
      }
      if (objc_msgSend(v11, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        v16 = HKLogMedication();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          id v18 = v17;
          _os_log_impl(&dword_1BD54A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will re-attempt delete on protected data availability", buf, 0xCu);
        }
        atomic_store(1u, (unsigned __int8 *)&self->_shouldAttemptToDeletePregnancyDismissedInteractions);
      }
    }
  }
  -[HDMedicationPregnancyLactationStatusObserver _pregnancyModelWasUpdated:]((uint64_t)self, v4);
}

- (void)_pregnancyModelWasUpdated:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v3 = MEMORY[0x1C187D5B0](*(void *)(a1 + 64));
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v5);
    }
  }
}

- (uint64_t)_deletePregnancyInteractionsWithReason:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E4F65BE8];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v8 = [WeakRetained database];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__HDMedicationPregnancyLactationStatusObserver__deletePregnancyInteractionsWithReason_error___block_invoke;
    v11[3] = &unk_1E63370D0;
    v11[4] = a1;
    id v12 = v5;
    uint64_t v9 = [v6 performWriteTransactionWithHealthDatabase:v8 error:a3 block:v11];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL __93__HDMedicationPregnancyLactationStatusObserver__deletePregnancyInteractionsWithReason_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDMedicationPregnancyLactationStatusObserver _deleteAllPregnancyLactationInteractionsOfType:transaction:reason:error:](*(void *)(a1 + 32), 1, a2, *(void **)(a1 + 40), a3);
}

- (HDMedicationPregnancyLactationStatusObserver)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationPregnancyLactationStatusObserver;
  id v5 = [(HDMedicationPregnancyLactationStatusObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profile, v4);
    atomic_store(0, (unsigned __int8 *)&v6->_shouldAttemptToDeletePregnancyDismissedInteractions);
    atomic_store(1u, (unsigned __int8 *)&v6->_shouldQueryLactationSampleToDeleteDismissedInteractionsIfNeeded);
    v6->_accessLock._os_unfair_lock_opaque = 0;
    id v8 = v7;
    [v4 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (uint64_t)doesMostRecentLactationSampleHaveDistantFutureEndDateWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297F0]];
  id v5 = (void *)MEMORY[0x1E4F65AA0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v14 = 0;
  id v7 = [v5 mostRecentSampleWithType:v4 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v14];
  id v8 = v14;

  id v9 = v8;
  if (v9)
  {
    if (a2) {
      *a2 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v7)
  {
    objc_super v10 = [v7 endDate];
    id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
    if (v10 == v11) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
  }
  else
  {
    uint64_t v12 = 2 * (v9 == 0);
  }

  return v12;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    -[HDMedicationPregnancyLactationStatusObserver _deletePregancyInteractionsOnProtectedDataAvailabilityIfNeeded]((uint64_t)self);
    -[HDMedicationPregnancyLactationStatusObserver _deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded]((uint64_t)self);
  }
  -[HDMedicationPregnancyLactationStatusObserver _protectedDataDidBecomeAvailable:]((uint64_t)self, v4);
}

- (void)_protectedDataDidBecomeAvailable:(uint64_t)a1
{
  if (a1)
  {
    BOOL v4 = (void (**)(void, void, void))MEMORY[0x1C187D5B0](*(void *)(a1 + 40));
    if (v4)
    {
      id v5 = v4;
      v4[2](v4, a1, a2);
      BOOL v4 = (void (**)(void, void, void))v5;
    }
  }
}

- (void)_deletePregancyInteractionsOnProtectedDataAvailabilityIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = HKSensitiveLogItem();
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(a1 + 24));
    if ((v3 & 1) == 0)
    {
LABEL_9:

      return;
    }
    id v11 = 0;
    int v4 = -[HDMedicationPregnancyLactationStatusObserver _deletePregnancyInteractionsWithReason:error:](a1, @"protected data available", (uint64_t)&v11);
    id v5 = v11;
    _HKInitializeLogging();
    v6 = HKLogMedication();
    id v7 = v6;
    if (v4)
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:

        atomic_store(v4 ^ 1, (unsigned __int8 *)(a1 + 24));
        goto LABEL_9;
      }
      id v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v2;
      id v9 = v8;
      _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interaction objects", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      objc_super v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      __int16 v14 = 2114;
      id v15 = v2;
      __int16 v16 = 2114;
      id v17 = v5;
      id v9 = v10;
      _os_log_error_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to delete %{public}@ dismissal items, error: %{public}@", buf, 0x20u);
    }

    goto LABEL_8;
  }
}

- (void)_deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded
{
  if (a1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 25));
    if (v2)
    {
      unsigned __int8 v3 = (void *)MEMORY[0x1E4F65BE8];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v5 = [WeakRetained database];
      v9[4] = a1;
      id v10 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __111__HDMedicationPregnancyLactationStatusObserver__deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded__block_invoke;
      v9[3] = &unk_1E6336E90;
      char v6 = [v3 performWriteTransactionWithHealthDatabase:v5 error:&v10 block:v9];
      id v7 = v10;

      if (v6) {
        unsigned __int8 v8 = 0;
      }
      else {
        unsigned __int8 v8 = objc_msgSend(v7, "hk_isDatabaseAccessibilityError");
      }
      atomic_store(v8, (unsigned __int8 *)(a1 + 25));
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogMedication();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    id v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v18 = 138543362;
      *(void *)&v18[4] = objc_opt_class();
      id v8 = *(id *)&v18[4];
      _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Profile did become ready, registering for observers", v18, 0xCu);
    }
  }
  id v9 = objc_msgSend(v4, "profileExtensionsConformingToProtocol:", &unk_1F181E710, *(_OWORD *)v18);
  id v10 = [v9 firstObject];
  provider = self->_provider;
  self->_provider = v10;

  uint64_t v12 = [(HKMCPregnancyModelProvidingInterface *)self->_provider getPregnancyModelProvider];
  [v12 registerObserver:self isUserInitiated:0];

  v13 = [v4 dataManager];
  __int16 v14 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297F0]];
  [v13 addObserver:self forDataType:v14];

  id v15 = [v4 database];
  [v15 addProtectedDataObserver:self];

  __int16 v16 = [v4 database];

  int v17 = [v16 isProtectedDataAvailable];
  if (v17) {
    -[HDMedicationPregnancyLactationStatusObserver _deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded]((uint64_t)self);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_3))
  {
    id v7 = NSString;
    id v8 = HKSensitiveLogItem();
    id v9 = [v7 stringWithFormat:@"%@ sample(s) added", v8];

    -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:]((uint64_t)self, v9);
  }
  -[HDMedicationPregnancyLactationStatusObserver _samplesWereAdded:anchor:]((uint64_t)self, v10, v6);
}

BOOL __68__HDMedicationPregnancyLactationStatusObserver_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = [a2 sampleType];
  unsigned __int8 v3 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297F0]];
  BOOL v4 = v2 == v3;

  return v4;
}

- (void)_queryAndDeleteLactationInteractionsWithReason:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F65BE8];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v6 = [WeakRetained database];
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__HDMedicationPregnancyLactationStatusObserver__queryAndDeleteLactationInteractionsWithReason___block_invoke;
    v10[3] = &unk_1E63370D0;
    v10[4] = a1;
    id v11 = v3;
    char v7 = [v4 performWriteTransactionWithHealthDatabase:v6 error:&v12 block:v10];
    id v8 = v12;

    if (v7) {
      unsigned __int8 v9 = 0;
    }
    else {
      unsigned __int8 v9 = objc_msgSend(v8, "hk_isDatabaseAccessibilityError");
    }
    atomic_store(v9, (unsigned __int8 *)(a1 + 25));
  }
}

- (void)_samplesWereAdded:(void *)a3 anchor:
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = MEMORY[0x1C187D5B0](*(void *)(a1 + 48));
    char v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a1, v8, v5);
    }
  }
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_359))
  {
    char v7 = NSString;
    id v8 = HKSensitiveLogItem();
    unsigned __int8 v9 = [v7 stringWithFormat:@"%@ sample(s) removed", v8];

    -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:]((uint64_t)self, v9);
  }
  -[HDMedicationPregnancyLactationStatusObserver _samplesOfTypesWereRemoved:anchor:]((uint64_t)self, v10, v6);
}

BOOL __81__HDMedicationPregnancyLactationStatusObserver_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = (void *)MEMORY[0x1E4F2ACB8];
  uint64_t v3 = *MEMORY[0x1E4F297F0];
  id v4 = a2;
  id v5 = [v2 categoryTypeForIdentifier:v3];

  return v5 == v4;
}

- (void)_samplesOfTypesWereRemoved:(void *)a3 anchor:
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = MEMORY[0x1C187D5B0](*(void *)(a1 + 56));
    char v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a1, v8, v5);
    }
  }
}

BOOL __95__HDMedicationPregnancyLactationStatusObserver__queryAndDeleteLactationInteractionsWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:transaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), a2, a3) != 0;
}

- (uint64_t)_queryAndDeleteLactationInteractionsWithReason:(void *)a3 transaction:(void *)a4 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v10 = 0;
    goto LABEL_24;
  }
  unsigned __int8 v9 = HKSensitiveLogItem();
  id v27 = 0;
  uint64_t v10 = -[HDMedicationPregnancyLactationStatusObserver doesMostRecentLactationSampleHaveDistantFutureEndDateWithError:](a1, &v27);
  id v11 = v27;
  if (v10 == 2)
  {
    id v14 = [NSString stringWithFormat:@"%@, no %@ sample with distant future end date found", v7, v9];
    id v26 = v11;
    BOOL v16 = -[HDMedicationPregnancyLactationStatusObserver _deleteAllPregnancyLactationInteractionsOfType:transaction:reason:error:](a1, 2, v8, v14, (uint64_t)&v26);
    id v15 = v26;

    _HKInitializeLogging();
    int v17 = HKLogMedication();
    uint64_t v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v29 = v19;
        __int16 v30 = 2112;
        v31 = v9;
        id v20 = v19;
        _os_log_impl(&dword_1BD54A000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interaction objects", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v29 = v24;
        __int16 v30 = 2114;
        v31 = v9;
        __int16 v32 = 2114;
        id v33 = v15;
        id v25 = v24;
        _os_log_error_impl(&dword_1BD54A000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to delete %{public}@ dismissal interaction objects, error: %{public}@", buf, 0x20u);
      }
      id v15 = v15;
      if (v15)
      {
        if (a4) {
          *a4 = v15;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v10 = 0;
    }
    goto LABEL_22;
  }
  if (!v10)
  {
    _HKInitializeLogging();
    id v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v29 = v22;
      __int16 v30 = 2114;
      v31 = v9;
      __int16 v32 = 2114;
      id v33 = v11;
      id v23 = v22;
      _os_log_error_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch any %{public}@ sample, error: %{public}@", buf, 0x20u);
    }
    id v13 = v11;
    id v14 = v13;
    if (v13)
    {
      if (a4)
      {
        id v14 = v13;
        uint64_t v10 = 0;
        *a4 = v14;
        id v15 = v14;
LABEL_22:

        id v11 = v15;
        goto LABEL_23;
      }
      _HKLogDroppedError();
    }
    uint64_t v10 = 0;
    id v15 = v14;
    goto LABEL_22;
  }
LABEL_23:

LABEL_24:
  return v10;
}

BOOL __111__HDMedicationPregnancyLactationStatusObserver__deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:transaction:error:](*(void *)(a1 + 32), @"protected data available", a2, a3) != 0;
}

- (BOOL)_unitTest_shouldAttemptToDeletePregnancyDismissedInteractions
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldAttemptToDeletePregnancyDismissedInteractions);
  return v2 & 1;
}

- (BOOL)_unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldQueryLactationSampleToDeleteDismissedInteractionsIfNeeded);
  return v2 & 1;
}

- (void)set_unitTest_shouldAttemptToDeletePregnancyDismissedInteractions:(BOOL)a3
{
  self->__unitTest_shouldAttemptToDeletePregnancyDismissedInteractions = a3;
}

- (void)set_unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions:(BOOL)a3
{
  self->__unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions = a3;
}

- (id)unitTesting_protectedDataDidBecomeAvailable
{
  return self->_unitTesting_protectedDataDidBecomeAvailable;
}

- (void)setUnitTesting_protectedDataDidBecomeAvailable:(id)a3
{
}

- (id)unitTesting_samplesAdded
{
  return self->_unitTesting_samplesAdded;
}

- (void)setUnitTesting_samplesAdded:(id)a3
{
}

- (id)unitTesting_samplesOfTypesWereRemoved
{
  return self->_unitTesting_samplesOfTypesWereRemoved;
}

- (void)setUnitTesting_samplesOfTypesWereRemoved:(id)a3
{
}

- (id)unitTesting_pregnancyModelDidUpdate
{
  return self->_unitTesting_pregnancyModelDidUpdate;
}

- (void)setUnitTesting_pregnancyModelDidUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_pregnancyModelDidUpdate, 0);
  objc_storeStrong(&self->_unitTesting_samplesOfTypesWereRemoved, 0);
  objc_storeStrong(&self->_unitTesting_samplesAdded, 0);
  objc_storeStrong(&self->_unitTesting_protectedDataDidBecomeAvailable, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end