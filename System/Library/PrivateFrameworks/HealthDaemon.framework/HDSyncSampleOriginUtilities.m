@interface HDSyncSampleOriginUtilities
+ (BOOL)generateStateSyncCodableContributors:(id *)a3 predicate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)generateStateSyncCodableDevices:(id *)a3 predicate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (int64_t)ingestContributorSyncObjects:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)ingestSourceSyncObjects:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
@end

@implementation HDSyncSampleOriginUtilities

+ (BOOL)generateStateSyncCodableDevices:(id *)a3 predicate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v14 = a4;
  id v15 = objc_alloc_init(v13);
  v16 = +[HDDeviceEntity _propertiesForDevice];
  v17 = [v12 database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__HDSyncSampleOriginUtilities_generateStateSyncCodableDevices_predicate_profile_transaction_error___block_invoke;
  v23[3] = &unk_1E62F6FD0;
  id v24 = v11;
  id v25 = v12;
  id v18 = v15;
  id v26 = v18;
  id v19 = v12;
  id v20 = v11;
  BOOL v21 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:v16 predicate:v14 healthDatabase:v17 error:a7 block:v23];

  if (a3 && v21) {
    *a3 = v18;
  }

  return v21;
}

BOOL __99__HDSyncSampleOriginUtilities_generateStateSyncCodableDevices_predicate_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14 = 0;
  BOOL v9 = +[HDDeviceSyncEntity _syncCodableDevice:&v14 fromRow:a4 profile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40) error:a8];
  id v10 = v14;
  id v11 = v10;
  if (v9 && v10 != 0) {
    [*(id *)(a1 + 48) addObject:v10];
  }

  return v9;
}

+ (int64_t)ingestSourceSyncObjects:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__HDSyncSampleOriginUtilities_ingestSourceSyncObjects_syncStore_profile_error___block_invoke;
  v18[3] = &__block_descriptor_40_e25__16__0__HDCodableSource_8l;
  v18[4] = a1;
  id v12 = a5;
  v13 = objc_msgSend(v10, "hk_map:", v18);
  id v14 = [v12 sourceManager];

  if (v11) {
    uint64_t v15 = [v11 syncProvenance];
  }
  else {
    uint64_t v15 = 0;
  }
  int v16 = [v14 createSourcesWithCodables:v13 provenance:v15 error:a6];

  return v16 ^ 1u;
}

id __79__HDSyncSampleOriginUtilities_ingestSourceSyncObjects_syncStore_profile_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F2BEC8]];

  if (v4)
  {
    v5 = [v2 decodedUUID];
    if (v5)
    {
      v6 = (void *)[v2 copy];

      v7 = [MEMORY[0x1E4F2B560] _generateIdentifierForAppleDeviceWithUUID:v5];
      [v6 setBundleIdentifier:v7];

      id v2 = v6;
    }
    else
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v10 = v8;
        int v12 = 138543362;
        id v13 = (id)objc_opt_class();
        id v11 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Decoded UUID found nil.", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v2;
}

+ (int64_t)ingestContributorSyncObjects:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4) {
    a4 = (id)[a4 syncProvenance];
  }
  id v11 = [[HDInsertCodableContributorsOperation alloc] initWithContributors:v9 provenance:a4];
  int64_t v12 = [(HDJournalableOperation *)v11 performOrJournalWithProfile:v10 error:a6] ^ 1;

  return v12;
}

+ (BOOL)generateStateSyncCodableContributors:(id *)a3 predicate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v14 = a4;
  id v15 = objc_alloc_init(v13);
  int v16 = +[HDContributorSyncEntity _orderedProperties];
  v17 = [v12 database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__HDSyncSampleOriginUtilities_generateStateSyncCodableContributors_predicate_profile_transaction_error___block_invoke;
  v23[3] = &unk_1E62F6FD0;
  id v24 = v11;
  id v25 = v12;
  id v18 = v15;
  id v26 = v18;
  id v19 = v12;
  id v20 = v11;
  BOOL v21 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:v16 predicate:v14 healthDatabase:v17 error:a7 block:v23];

  if (a3 && v21) {
    *a3 = v18;
  }

  return v21;
}

BOOL __104__HDSyncSampleOriginUtilities_generateStateSyncCodableContributors_predicate_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = +[HDContributorSyncEntity _syncCodableContributorFromRow:a4 profile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40) error:a8];
  if (v9) {
    [*(id *)(a1 + 48) addObject:v9];
  }

  return v9 != 0;
}

@end