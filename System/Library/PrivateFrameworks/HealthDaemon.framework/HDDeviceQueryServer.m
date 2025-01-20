@interface HDDeviceQueryServer
+ (Class)queryClass;
- (void)_queue_start;
@end

@implementation HDDeviceQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v27.receiver = self;
  v27.super_class = (Class)HDDeviceQueryServer;
  [(HDQueryServer *)&v27 _queue_start];
  v3 = [(HDQueryServer *)self objectType];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__75;
  v25[4] = __Block_byref_object_dispose__75;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__75;
  v23[4] = __Block_byref_object_dispose__75;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HDDeviceQueryServer__queue_start__block_invoke;
  aBlock[3] = &unk_1E62FDC18;
  aBlock[4] = self;
  aBlock[5] = v23;
  aBlock[6] = v21;
  v4 = _Block_copy(aBlock);
  v5 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  v6 = [(HDQueryServer *)self profile];
  v7 = [v6 database];
  id v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__HDDeviceQueryServer__queue_start__block_invoke_282;
  v14[3] = &unk_1E62FDC68;
  v14[4] = self;
  id v8 = v3;
  id v15 = v8;
  v17 = v25;
  v18 = v23;
  id v9 = v4;
  id v16 = v9;
  int v10 = [v7 performTransactionWithContext:v5 error:&v19 block:v14 inaccessibilityHandler:0];
  id v11 = v19;

  if (v10)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
  else
  {
    v12 = [(HDQueryServer *)self clientProxy];
    v13 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v12, "client_deliverError:forQuery:", v11, v13);
  }
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

void __35__HDDeviceQueryServer__queue_start__block_invoke(void *a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(a1[5] + 8) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__HDDeviceQueryServer__queue_start__block_invoke_2;
  v13[3] = &unk_1E62FDBF0;
  v13[4] = a1[4];
  v5 = objc_msgSend(v4, "hk_map:", v13);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = (void *)a1[4];
  if (v9)
  {
    int v10 = [v9 clientProxy];
    id v9 = (void *)a1[4];
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  v12 = [v9 queryUUID];
  objc_msgSend(v10, "clientRemote_deliverDevices:done:reset:query:", v5, a2, v11, v12);

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
}

id __35__HDDeviceQueryServer__queue_start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) profile];
  v5 = [v4 deviceManager];
  id v11 = 0;
  id v6 = [v5 deviceForPersistentID:v3 error:&v11];
  id v7 = v11;

  if (!v6)
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v3;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup device for ID %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v6;
}

uint64_t __35__HDDeviceQueryServer__queue_start__block_invoke_282(uint64_t a1, void *a2, uint64_t a3)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) client];
  id v7 = [v6 authorizationOracle];

  id v8 = [v7 readAuthorizationStatusForType:*(void *)(a1 + 40) error:a3];
  id v9 = v8;
  if (v8)
  {
    if (([v8 authorizationStatus] == 103 || objc_msgSend(v9, "authorizationStatus") == 101)
      && ![v9 authorizationMode])
    {
      v12 = [*(id *)(a1 + 32) objectType];
      uint64_t v13 = [v7 additionalAuthorizationPredicateForObjectType:v12 error:a3];

      v38 = (void *)v13;
      if (v13)
      {
        uint64_t v33 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "dataObjectClass"), "hd_dataEntityClass");
        __int16 v14 = [*(id *)(a1 + 32) profile];
        id v15 = [v14 deviceManager];
        v36 = [v15 deviceEntityForNoDeviceWithError:a3];

        __int16 v16 = (void *)MEMORY[0x1E4F65D00];
        id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v36, "persistentID"));
        v37 = [v16 predicateWithProperty:@"data_provenances.device_id" notEqualToValue:v17];

        uint64_t v18 = [*(id *)(a1 + 32) objectType];
        v35 = HDSampleEntityPredicateForDataType(v18);

        id v19 = [*(id *)(a1 + 32) filter];
        v20 = [*(id *)(a1 + 32) profile];
        uint64_t v21 = [v19 predicateWithProfile:v20];

        char v22 = (void *)v21;
        v23 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v35 otherPredicate:v21];
        id v24 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v23 otherPredicate:v13];

        v25 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v24 otherPredicate:v37];

        id v26 = objc_alloc_init(MEMORY[0x1E4F65D68]);
        [v26 setEntityClass:v33];
        [v26 setPredicate:v25];
        id v27 = objc_alloc(MEMORY[0x1E4F65D60]);
        v28 = [v5 databaseForEntityClass:v33];
        v29 = (void *)[v27 initWithDatabase:v28 descriptor:v26];

        v42[0] = @"data_provenances.device_id";
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __35__HDDeviceQueryServer__queue_start__block_invoke_2_293;
        v39[3] = &unk_1E62FDC40;
        uint64_t v31 = *(void *)(a1 + 64);
        v39[4] = *(void *)(a1 + 32);
        uint64_t v41 = v31;
        long long v34 = *(_OWORD *)(a1 + 48);
        id v32 = (id)v34;
        long long v40 = v34;
        uint64_t v10 = [v29 enumerateProperties:v30 error:a3 enumerationHandler:v39];

        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 4, @"Client is not authorized for this query.");
    }
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

uint64_t __35__HDDeviceQueryServer__queue_start__block_invoke_2_293(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || ([*(id *)(a1 + 32) _shouldSuspendQuery] & 1) != 0)
  {
    return 0;
  }
  id v6 = MEMORY[0x1C1879F70](a3, 0);
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v6] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v6];
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 0x64) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];
  }

  return 1;
}

@end