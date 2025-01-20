@interface HDMedicationPregnancyListConceptObserver
+ (id)_predicateForNonactiveDismissedInteractions;
- (HDMedicationPregnancyListConceptObserver)init;
- (HDMedicationPregnancyListConceptObserver)initWithProfile:(id)a3;
- (uint64_t)_deleteNonactiveDismissedInteractionsWithTransaction:(NSObject *)a3 error:;
- (void)_deleteNonactiveDismissedInteractionsWithTransaction:(uint64_t)a1;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4 transaction:(id)a5;
- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4 transaction:(id)a5;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4 transaction:(id)a5;
@end

@implementation HDMedicationPregnancyListConceptObserver

- (HDMedicationPregnancyListConceptObserver)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationPregnancyListConceptObserver)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationPregnancyListConceptObserver;
  v5 = [(HDMedicationPregnancyListConceptObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profile, v4);
    atomic_store(1u, (unsigned __int8 *)&v6->_shouldQueryMedicationListToDeleteDismissedInteractionsIfNeeded);
    id v8 = v7;
    [v4 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self)
  {
    if (v4)
    {
      unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_shouldQueryMedicationListToDeleteDismissedInteractionsIfNeeded);
      if (v7)
      {
        id v8 = v6;
        -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, 0);
        id v6 = v8;
      }
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogMedication();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    unsigned __int8 v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v14 = 138543362;
      *(void *)&v14[4] = objc_opt_class();
      id v8 = *(id *)&v14[4];
      _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Profile did become ready, registering for observers", v14, 0xCu);
    }
  }
  v9 = objc_msgSend(v4, "userDomainConceptManager", *(_OWORD *)v14);
  [v9 addSynchronousUserDomainConceptObserver:self];

  objc_super v10 = [v4 database];
  [v10 addProtectedDataObserver:self];

  v11 = [v4 database];

  int v12 = [v11 isProtectedDataAvailable];
  if (self && v12)
  {
    unsigned __int8 v13 = atomic_load((unsigned __int8 *)&self->_shouldQueryMedicationListToDeleteDismissedInteractionsIfNeeded);
    if (v13) {
      -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, 0);
    }
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4 transaction:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self && objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_4)) {
    -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, v9);
  }
}

- (void)_deleteNonactiveDismissedInteractionsWithTransaction:(uint64_t)a1
{
  if (a1)
  {
    unsigned __int8 v7 = 0;
    uint64_t v3 = -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:error:](a1, a2, &v7);
    id v4 = v7;
    v5 = v4;
    if (v3) {
      unsigned __int8 v6 = 0;
    }
    else {
      unsigned __int8 v6 = [v4 hk_isDatabaseAccessibilityError];
    }
    atomic_store(v6, (unsigned __int8 *)(a1 + 16));
  }
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4 transaction:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self && objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_4)) {
    -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, v9);
  }
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4 transaction:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self && objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_4)) {
    -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, v9);
  }
}

+ (id)_predicateForNonactiveDismissedInteractions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  self;
  id v0 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v0 setEntityClass:objc_opt_class()];
  v1 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
  v2 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65A38] equalToValue:*MEMORY[0x1E4F29FC0]];
  uint64_t v3 = (void *)MEMORY[0x1E4F65D08];
  v12[0] = v2;
  v12[1] = v1;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v5 = [v3 predicateMatchingAllPredicates:v4];
  [v0 setPredicate:v5];

  unsigned __int8 v6 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v11 = *MEMORY[0x1E4F65A30];
  unsigned __int8 v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v8 = [v6 predicateWithProperty:@"medication_identifier" comparisonType:7 subqueryDescriptor:v0 subqueryProperties:v7];

  id v9 = [MEMORY[0x1E4F65D08] negatedPredicate:v8];

  return v9;
}

- (uint64_t)_deleteNonactiveDismissedInteractionsWithTransaction:(NSObject *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    unsigned __int8 v6 = HKSensitiveLogItem();
    unsigned __int8 v7 = +[HDMedicationPregnancyListConceptObserver _predicateForNonactiveDismissedInteractions]();
    if (v5)
    {
      id v8 = [v5 databaseForEntityClass:objc_opt_class()];
      id v26 = 0;
      BOOL v9 = +[HDSQLiteEntity deleteEntitiesInDatabase:v8 predicate:v7 error:&v26];
      id v10 = v26;

      if (v9)
      {
LABEL_4:
        _HKInitializeLogging();
        uint64_t v11 = HKLogMedication();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v28 = v12;
          __int16 v29 = 2112;
          v30 = v6;
          id v13 = v12;
          _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interactions for non-active medications", buf, 0x16u);
        }
        a1 = 1;
        goto LABEL_15;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F65C20];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v16 = [WeakRetained database];
      id v25 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __103__HDMedicationPregnancyListConceptObserver__deleteNonactiveDismissedInteractionsWithTransaction_error___block_invoke;
      v23[3] = &unk_1E6336E90;
      id v24 = v7;
      int v17 = [v14 performWriteTransactionWithHealthDatabase:v16 error:&v25 block:v23];
      id v10 = v25;

      if (v17) {
        goto LABEL_4;
      }
    }
    _HKInitializeLogging();
    v18 = HKLogMedication();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      __int16 v29 = 2112;
      v30 = v6;
      __int16 v31 = 2112;
      v32 = v10;
      id v22 = v21;
      _os_log_error_impl(&dword_1BD54A000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error deleting %@ dismissed interactions for non-active medications: %@", buf, 0x20u);
    }
    v19 = v10;
    uint64_t v11 = v19;
    if (v19)
    {
      if (a3)
      {
        uint64_t v11 = v19;
        a1 = 0;
        *a3 = v11;
        id v10 = v11;
LABEL_15:

        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
    a1 = 0;
    id v10 = v11;
    goto LABEL_15;
  }
LABEL_16:

  return a1;
}

BOOL __103__HDMedicationPregnancyListConceptObserver__deleteNonactiveDismissedInteractionsWithTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unsigned __int8 v6 = [v5 databaseForEntityClass:objc_opt_class()];

  BOOL v7 = +[HDSQLiteEntity deleteEntitiesInDatabase:v6 predicate:*(void *)(a1 + 32) error:a3];
  return v7;
}

BOOL __94__HDMedicationPregnancyListConceptObserver__doUserDomainConceptsContainListUserDomainConcept___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 listType] == 2;

  return v3;
}

- (void).cxx_destruct
{
}

@end