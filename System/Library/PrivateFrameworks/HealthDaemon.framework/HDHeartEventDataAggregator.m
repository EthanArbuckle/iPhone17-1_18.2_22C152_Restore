@interface HDHeartEventDataAggregator
- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6;
- (Class)sensorDatumClass;
- (id)_categoryType;
- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4;
- (void)triggerImmediateCloudSyncWithReason:(void *)a1;
@end

@implementation HDHeartEventDataAggregator

- (id)_categoryType
{
  return 0;
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F2ACB0];
  v6 = a3;
  v7 = [(HDHeartEventDataAggregator *)self _categoryType];
  v8 = [v6 dateInterval];
  v9 = [v8 startDate];
  v10 = [v6 dateInterval];
  v11 = [v10 endDate];
  if (v6)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:v6[6] forKeyedSubscript:*MEMORY[0x1E4F2BB40]];
  }
  else
  {
    id v12 = 0;
  }

  v13 = [v5 _categorySamplesSplittingDurationWithType:v7 value:0 startDate:v9 endDate:v11 device:0 metadata:v12];

  return v13;
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v14 = [v11 associatedSampleUUIDs];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(v13, "hk_appendBytesWithUUID:", *(void *)(*((void *)&v40 + 1) + 8 * i));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v16);
  }

  if ([v10 count] == 1)
  {
    id v38 = v12;
    v19 = [v10 firstObject];
    v20 = [v19 UUID];
    [(HDDataAggregator *)self dataCollectionManager];
    v22 = v21 = a6;
    v23 = [v22 profile];
    BOOL v24 = +[HDAssociationEntity insertEntriesWithAssociationUUID:v20 objectUUIDsData:v13 type:0 destinationSubObjectReference:0 profile:v23 error:v21];

    v25 = v21;
    if (!v24)
    {
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
      {
        v34 = v26;
        v35 = objc_opt_class();
        id v36 = *v21;
        *(_DWORD *)buf = 138543874;
        v45 = v35;
        __int16 v46 = 2112;
        id v47 = v11;
        __int16 v48 = 2114;
        id v49 = v36;
        id v37 = v35;
        _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Failed to associate heart event sample from sensor datum '%@': %{public}@", buf, 0x20u);
      }
    }
    v39.receiver = self;
    v39.super_class = (Class)HDHeartEventDataAggregator;
    id v12 = v38;
    BOOL v27 = [(HDDataAggregator *)&v39 didPersistObjects:v10 lastDatum:v11 collector:v38 error:v25];
  }
  else
  {
    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      v30 = v28;
      v31 = objc_opt_class();
      id v32 = *a6;
      *(_DWORD *)buf = 138544130;
      v45 = v31;
      __int16 v46 = 2112;
      id v47 = v10;
      __int16 v48 = 2112;
      id v49 = v11;
      __int16 v50 = 2114;
      id v51 = v32;
      id v33 = v31;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Not persisting unexpected objects [%@] from sensor datum'%@': %{public}@", buf, 0x2Au);
    }
    BOOL v27 = 0;
  }

  return v27;
}

- (void)triggerImmediateCloudSyncWithReason:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 dataCollectionManager];
    v5 = [v4 profile];
    v6 = [v5 cloudSyncManager];

    id v7 = objc_alloc(MEMORY[0x1E4F2AD68]);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
    v9 = (void *)[v7 initWithChangesSyncRequest:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__HDHeartEventDataAggregator_triggerImmediateCloudSyncWithReason___block_invoke;
    v10[3] = &unk_1E62F5D48;
    v10[4] = a1;
    id v11 = v3;
    [v6 syncWithRequest:v9 reason:v11 completion:v10];
  }
}

void __66__HDHeartEventDataAggregator_triggerImmediateCloudSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F10];
  id v7 = *MEMORY[0x1E4F29F10];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v8 = v6;
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v5;
    id v11 = v13;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to complete cloud sync request with %{public}@", (uint8_t *)&v12, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v9 = objc_opt_class();
    id v10 = *(void **)(a1 + 40);
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    id v11 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
LABEL_4:
  }
LABEL_6:
}

@end