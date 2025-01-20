@interface HDMedicationOntologyDailyAnalytics
- (BOOL)isEventSubmissionIHAGated;
- (HDMedicationOntologyDailyAnalytics)init;
- (HDMedicationOntologyDailyAnalytics)initWithProfile:(id)a3;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)shardRegistry;
@end

@implementation HDMedicationOntologyDailyAnalytics

- (HDMedicationOntologyDailyAnalytics)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationOntologyDailyAnalytics)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMedicationOntologyDailyAnalytics;
  v5 = [(HDMedicationOntologyDailyAnalytics *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:&unk_1F17FC840];
  v7 = (void *)MEMORY[0x1E4F65D08];
  objc_super v8 = HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v24[0] = v8;
  v9 = HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v24[1] = v9;
  uint64_t v10 = HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v24[2] = v10;
  v11 = HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v24[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  v13 = [v7 predicateMatchingAnyPredicates:v12];

  v14 = [(HDMedicationOntologyDailyAnalytics *)self shardRegistry];
  id v23 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__HDMedicationOntologyDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke;
  v21[3] = &unk_1E6338358;
  id v15 = v6;
  id v22 = v15;
  LOBYTE(v10) = [v14 enumerateEntriesWithPredicate:v13 orderingTerms:0 error:&v23 enumerationHandler:v21];
  id v16 = v23;

  if (v10)
  {
    id v17 = v15;
  }
  else
  {
    _HKInitializeLogging();
    v18 = HKLogMedication();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationOntologyDailyAnalytics makeUnrestrictedEventPayloadWithDataSource:error:]((uint64_t)self, (uint64_t)v16, v18);
    }

    id v19 = v16;
    if (v19)
    {
      if (a4) {
        *a4 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v17 = 0;
  }

  return v17;
}

uint64_t __87__HDMedicationOntologyDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A2A0]];

  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"availableStateCoreMeds"];

    v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"desiredStateCoreMeds"];

    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = @"shardVersionCoreMeds";
LABEL_9:
    [v9 setObject:v8 forKeyedSubscript:v10];

    goto LABEL_10;
  }
  v11 = [v3 identifier];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2A2C8]];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"availableStateMedsScanning"];

    v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"desiredStateMedsScanning"];

    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = @"shardVersionMedsScaning";
    goto LABEL_9;
  }
  id v15 = [v3 identifier];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F2A2A8]];

  if (v16)
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:@"availableStateInteractions"];

    v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"desiredStateInteractions"];

    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = @"shardVersionInteractions";
    goto LABEL_9;
  }
  id v19 = [v3 identifier];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F2A2C0]];

  if (v20)
  {
    v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    [*(id *)(a1 + 32) setObject:v21 forKeyedSubscript:@"availableStateMedsEducation"];

    id v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    [*(id *)(a1 + 32) setObject:v22 forKeyedSubscript:@"desiredStateMedsEducation"];

    objc_super v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = @"shardVersionMedsEducation";
    goto LABEL_9;
  }
LABEL_10:

  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)shardRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained daemon];
  id v4 = [v3 ontologyUpdateCoordinator];
  int v5 = [v4 shardRegistry];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)makeUnrestrictedEventPayloadWithDataSource:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BD54A000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error enumerating shard registry entries: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end