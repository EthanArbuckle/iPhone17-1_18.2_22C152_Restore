@interface _DPStorage
+ (id)createFetchRequestFor:(id)a3 entityName:(id)a4 predicate:(id)a5 fetchLimit:(unint64_t)a6 fetchOffset:(unint64_t)a7;
+ (id)entitiesRequiringMaintenance;
+ (id)errorStringFor:(int64_t)a3;
+ (id)shuffleOrderOfRecords:(id)a3 count:(unint64_t)a4;
+ (id)storageWithDirectory:(id)a3 readOnly:(BOOL)a4;
- (BOOL)deleteStorageWithObliterationOption:(BOOL)a3;
- (BOOL)readOnly;
- (NSDictionary)converterFromClass;
- (NSDictionary)converterFromEntity;
- (OS_dispatch_queue)queue;
- (_DPCoreDataStorage)coredataStorage;
- (_DPStorage)init;
- (_DPStorage)initWithDirectory:(id)a3 readOnly:(BOOL)a4;
- (id)removeBadObjects:(id)a3;
- (void)dealloc;
- (void)deleteAllRecordsByKey:(id)a3 withCompletion:(id)a4;
- (void)deleteRecords:(id)a3 withCompletion:(id)a4;
- (void)fetchKeynamesFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 withCompletion:(id)a7;
- (void)fetchRecordCountForEntity:(id)a3 predicate:(id)a4 completion:(id)a5;
- (void)fetchRecordsFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 randomizeOrder:(BOOL)a7 withCompletion:(id)a8;
- (void)fetchRecordsFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 withCompletion:(id)a7;
- (void)flush;
- (void)handleEmptyArrayError:(int64_t)a3 completion:(id)a4;
- (void)saveRecords:(id)a3 andFlush:(BOOL)a4 withCompletion:(id)a5;
- (void)saveRecords:(id)a3 withCompletion:(id)a4;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
- (void)scheduleStorageCullingWithName:(id)a3 database:(id)a4;
- (void)updateRecords:(id)a3 withCompletion:(id)a4;
@end

@implementation _DPStorage

- (_DPStorage)init
{
  return 0;
}

- (_DPStorage)initWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v79[12] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)_DPStorage;
  v7 = [(_DPStorage *)&v75 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v72 = [v8 pathForResource:@"DifferentialPrivacyDataModel" ofType:@"momd"];

    v71 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v72];
    v7->_readOnly = v4;
    uint64_t v9 = +[_DPCoreDataStorage storageWithDirectory:v6 databaseName:@"DifferentialPrivacy" modelURL:v71 readOnly:v4];
    coredataStorage = v7->_coredataStorage;
    v7->_coredataStorage = (_DPCoreDataStorage *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.DifferentialPrivacy.storage", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v69 = +[_DPModelInfoRecord entityName];
    v78[0] = v69;
    v67 = objc_opt_new();
    v79[0] = v67;
    v65 = +[_DPPrivacyBudgetRecord entityName];
    v78[1] = v65;
    v63 = objc_opt_new();
    v79[1] = v63;
    v61 = +[_DPNumericDataRecord entityName];
    v78[2] = v61;
    v59 = objc_opt_new();
    v79[2] = v59;
    v57 = +[_DPBitValueRecord entityName];
    v78[3] = v57;
    v55 = objc_opt_new();
    v79[3] = v55;
    v53 = +[_DPOBHSequenceRecord entityName];
    v78[4] = v53;
    v51 = objc_opt_new();
    v79[4] = v51;
    v49 = +[_DPCMSSequenceRecord entityName];
    v78[5] = v49;
    v47 = objc_opt_new();
    v79[5] = v47;
    v45 = +[_DPCMSWordRecord entityName];
    v78[6] = v45;
    v43 = objc_opt_new();
    v79[6] = v43;
    v14 = +[_DPHCMSSequenceRecord entityName];
    v78[7] = v14;
    v15 = objc_opt_new();
    v79[7] = v15;
    v16 = +[_DPHCMSWordRecord entityName];
    v78[8] = v16;
    v17 = objc_opt_new();
    v79[8] = v17;
    v18 = +[_DPPTRecord entityName];
    v78[9] = v18;
    id v73 = v6;
    v19 = objc_opt_new();
    v79[9] = v19;
    v20 = +[_DPBSSFPRecord entityName];
    v78[10] = v20;
    v21 = objc_opt_new();
    v79[10] = v21;
    +[_DPPrioRecord entityName];
    v22 = v74 = v7;
    v78[11] = v22;
    v23 = objc_opt_new();
    v79[11] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:12];
    converterFromEntity = v74->_converterFromEntity;
    v74->_converterFromEntity = (NSDictionary *)v24;

    v70 = [(id)objc_opt_class() description];
    v76[0] = v70;
    v68 = objc_opt_new();
    v77[0] = v68;
    v66 = [(id)objc_opt_class() description];
    v76[1] = v66;
    v64 = objc_opt_new();
    v77[1] = v64;
    v62 = [(id)objc_opt_class() description];
    v76[2] = v62;
    v60 = objc_opt_new();
    v77[2] = v60;
    v58 = [(id)objc_opt_class() description];
    v76[3] = v58;
    v56 = objc_opt_new();
    v77[3] = v56;
    v54 = [(id)objc_opt_class() description];
    v76[4] = v54;
    v52 = objc_opt_new();
    v77[4] = v52;
    v50 = [(id)objc_opt_class() description];
    v76[5] = v50;
    v48 = objc_opt_new();
    v77[5] = v48;
    v46 = [(id)objc_opt_class() description];
    v76[6] = v46;
    v44 = objc_opt_new();
    v77[6] = v44;
    v42 = [(id)objc_opt_class() description];
    v76[7] = v42;
    v41 = objc_opt_new();
    v77[7] = v41;
    v40 = [(id)objc_opt_class() description];
    v76[8] = v40;
    v39 = objc_opt_new();
    v77[8] = v39;
    v26 = [(id)objc_opt_class() description];
    v76[9] = v26;
    v27 = objc_opt_new();
    v77[9] = v27;
    v28 = [(id)objc_opt_class() description];
    v76[10] = v28;
    v29 = objc_opt_new();
    v77[10] = v29;
    v30 = [(id)objc_opt_class() description];
    v76[11] = v30;
    v31 = objc_opt_new();
    v77[11] = v31;
    v32 = [(id)objc_opt_class() description];
    v76[12] = v32;
    v33 = objc_opt_new();
    v77[12] = v33;
    v34 = [(id)objc_opt_class() description];
    v76[13] = v34;
    v35 = objc_opt_new();
    v77[13] = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:14];
    converterFromClass = v74->_converterFromClass;
    v74->_converterFromClass = (NSDictionary *)v36;

    id v6 = v73;
    v7 = v74;
  }
  return v7;
}

+ (id)storageWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDirectory:v6 readOnly:v4];

  return v7;
}

- (id)removeBadObjects:(id)a3
{
  v12[9] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x1E019F810]();
  v5 = (void *)[v3 mutableCopy];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v12[7] = objc_opt_class();
  v12[8] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:9];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31___DPStorage_removeBadObjects___block_invoke;
  v10[3] = &unk_1E6C44278;
  id v11 = v6;
  id v7 = v6;
  v8 = [v3 indexesOfObjectsPassingTest:v10];
  [v5 removeObjectsAtIndexes:v8];

  return v5;
}

+ (id)errorStringFor:(int64_t)a3
{
  if (errorStringFor__onceToken != -1) {
    dispatch_once(&errorStringFor__onceToken, &__block_literal_global_4);
  }
  BOOL v4 = (void *)errorStringFor__errorsDict;
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)handleEmptyArrayError:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(_DPStorage *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47___DPStorage_handleEmptyArrayError_completion___block_invoke;
    block[3] = &unk_1E6C442A0;
    block[4] = self;
    int64_t v10 = a3;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

+ (id)createFetchRequestFor:(id)a3 entityName:(id)a4 predicate:(id)a5 fetchLimit:(unint64_t)a6 fetchOffset:(unint64_t)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = objc_opt_new();
  v15 = [MEMORY[0x1E4F1C0A8] entityForName:v12 inManagedObjectContext:v11];
  [v14 setEntity:v15];

  [v14 setPredicate:v13];
  v16 = [v14 predicate];
  [v16 allowEvaluation];

  [v14 setFetchLimit:a6];
  [v14 setFetchOffset:a7];
  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v30[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v14 setSortDescriptors:v18];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = objc_msgSend(v14, "sortDescriptors", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) allowEvaluation];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v21);
  }

  return v14;
}

+ (id)shuffleOrderOfRecords:(id)a3 count:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)[v5 mutableCopy];
  int v7 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v9 = [v5 count];
    unint64_t v10 = a4;
    if (v9 <= a4) {
      unint64_t v10 = [v5 count];
    }
    if (i >= v10) {
      break;
    }
    objc_msgSend(v6, "exchangeObjectAtIndex:withObjectAtIndex:", i, i + arc4random_uniform(v7 + objc_msgSend(v6, "count")));
    --v7;
  }
  id v11 = (void *)[v6 copy];

  return v11;
}

- (void)fetchRecordCountForEntity:(id)a3 predicate:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v10 && v9 && v11)
  {
    id v13 = [(_DPStorage *)self coredataStorage];
    v14 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
    v15 = [v13 mocForProtectionClass:v14];

    if (v15)
    {
      v16 = (void *)os_transaction_create();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2;
      v19[3] = &unk_1E6C44340;
      v19[4] = self;
      id v20 = v15;
      id v21 = v9;
      id v22 = v10;
      SEL v25 = a2;
      id v23 = v16;
      id v24 = v12;
      id v17 = v16;
      [v20 performWithOptions:4 andBlock:v19];
    }
    else
    {
      v18 = [(_DPStorage *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke;
      block[3] = &unk_1E6C442C8;
      block[4] = self;
      id v27 = v12;
      dispatch_async(v18, block);
    }
  }
}

- (void)fetchKeynamesFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 withCompletion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = v15;
  if (v14 && v13 && v15)
  {
    id v17 = [(_DPStorage *)self coredataStorage];
    v18 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
    v19 = [v17 mocForProtectionClass:v18];

    if (v19)
    {
      id v20 = (void *)os_transaction_create();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2;
      v23[3] = &unk_1E6C44390;
      v23[4] = self;
      id v24 = v19;
      id v25 = v13;
      id v26 = v14;
      unint64_t v29 = a5;
      unint64_t v30 = a6;
      SEL v31 = a2;
      id v27 = v20;
      id v28 = v16;
      id v21 = v20;
      [v24 performWithOptions:4 andBlock:v23];
    }
    else
    {
      id v22 = [(_DPStorage *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke;
      block[3] = &unk_1E6C442C8;
      block[4] = self;
      id v33 = v16;
      dispatch_async(v22, block);
    }
  }
}

- (void)fetchRecordsFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 withCompletion:(id)a7
{
}

- (void)fetchRecordsFor:(id)a3 predicate:(id)a4 fetchLimit:(unint64_t)a5 fetchOffset:(unint64_t)a6 randomizeOrder:(BOOL)a7 withCompletion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v18 = v17;
  if (v16 && v15 && v17)
  {
    BOOL v25 = a7;
    v19 = [(_DPStorage *)self coredataStorage];
    id v20 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
    id v21 = [v19 mocForProtectionClass:v20];

    if (v21)
    {
      id v22 = (void *)os_transaction_create();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2;
      v26[3] = &unk_1E6C443B8;
      v26[4] = self;
      id v27 = v21;
      id v28 = v15;
      id v29 = v16;
      unint64_t v32 = a5;
      unint64_t v33 = a6;
      BOOL v35 = v25;
      SEL v34 = a2;
      id v30 = v22;
      id v31 = v18;
      id v23 = v22;
      [v27 performWithOptions:4 andBlock:v26];
    }
    else
    {
      id v24 = [(_DPStorage *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke;
      block[3] = &unk_1E6C442C8;
      block[4] = self;
      id v37 = v18;
      dispatch_async(v24, block);
    }
  }
}

- (void)saveRecords:(id)a3 withCompletion:(id)a4
{
}

- (void)saveRecords:(id)a3 andFlush:(BOOL)a4 withCompletion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ([v9 count])
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__4;
    id v30 = __Block_byref_object_dispose__4;
    id v31 = [(_DPStorage *)self removeBadObjects:v9];
    uint64_t v11 = [(id)v27[5] count];
    if (v11 != [v9 count])
    {
      id v12 = +[_DPLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = (id)objc_opt_class();
        id v14 = NSStringFromSelector(a2);
        -[_DPStorage saveRecords:andFlush:withCompletion:](v13, v14, buf, v12);
      }
    }
    if ([(id)v27[5] count])
    {
      id v15 = [(_DPStorage *)self coredataStorage];
      id v16 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
      id v17 = [v15 mocForProtectionClass:v16];

      if (!v17)
      {
        v18 = +[_DPLog daemon];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[_DPStorage saveRecords:andFlush:withCompletion:](v18);
        }
      }
      v19 = (void *)os_transaction_create();
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke;
      v21[3] = &unk_1E6C44408;
      id v24 = &v26;
      v21[4] = self;
      id v20 = v17;
      id v22 = v20;
      BOOL v25 = a4;
      id v23 = v10;
      [v20 performWithOptions:4 andBlock:v21];
    }
    else
    {
      [(_DPStorage *)self handleEmptyArrayError:4 completion:v10];
    }
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    [(_DPStorage *)self handleEmptyArrayError:3 completion:v10];
  }
}

- (void)updateRecords:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = [(_DPStorage *)self removeBadObjects:v7];
    uint64_t v10 = [v9 count];
    if (v10 != [v7 count])
    {
      uint64_t v11 = +[_DPLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPStorage updateRecords:withCompletion:]((uint64_t)self, a2);
      }
    }
    if ([v9 count])
    {
      id v12 = [(_DPStorage *)self coredataStorage];
      id v13 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
      id v14 = [v12 mocForProtectionClass:v13];

      id v15 = (void *)os_transaction_create();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43___DPStorage_updateRecords_withCompletion___block_invoke;
      v17[3] = &unk_1E6C44430;
      id v18 = v9;
      v19 = self;
      id v20 = v14;
      id v21 = v8;
      id v16 = v14;
      [v16 performWithOptions:4 andBlock:v17];
    }
    else
    {
      [(_DPStorage *)self handleEmptyArrayError:4 completion:v8];
    }
  }
  else
  {
    [(_DPStorage *)self handleEmptyArrayError:3 completion:v8];
  }
}

- (void)deleteRecords:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = [(_DPStorage *)self removeBadObjects:v7];
    uint64_t v10 = [v9 count];
    if (v10 != [v7 count])
    {
      uint64_t v11 = +[_DPLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPStorage updateRecords:withCompletion:]((uint64_t)self, a2);
      }
    }
    if ([v9 count])
    {
      id v12 = [(_DPStorage *)self coredataStorage];
      id v13 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
      id v14 = [v12 mocForProtectionClass:v13];

      id v15 = (void *)os_transaction_create();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43___DPStorage_deleteRecords_withCompletion___block_invoke;
      v17[3] = &unk_1E6C44458;
      id v18 = v9;
      id v19 = v14;
      id v20 = self;
      id v21 = v8;
      id v16 = v14;
      [v16 performWithOptions:4 andBlock:v17];
    }
    else
    {
      [(_DPStorage *)self handleEmptyArrayError:4 completion:v8];
    }
  }
  else
  {
    [(_DPStorage *)self handleEmptyArrayError:3 completion:v8];
  }
}

- (void)deleteAllRecordsByKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DPStorage *)self coredataStorage];
  id v9 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  uint64_t v10 = [v8 mocForProtectionClass:v9];

  uint64_t v11 = +[_DPRecordQueryPredicates entityForKey:v6];
  id v12 = (void *)os_transaction_create();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke;
  v17[3] = &unk_1E6C44480;
  id v18 = v6;
  id v19 = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v7;
  id v13 = v7;
  id v14 = v11;
  id v15 = v10;
  id v16 = v6;
  [v15 performWithOptions:4 andBlock:v17];
}

- (BOOL)deleteStorageWithObliterationOption:(BOOL)a3
{
  if (self->_readOnly) {
    return 0;
  }
  uint64_t v4 = a3;
  id v5 = [(_DPStorage *)self coredataStorage];
  id v6 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  LOBYTE(v4) = [v5 deleteStorageFor:v6 obliterate:v4];

  return v4;
}

- (void)flush
{
  id v3 = (void *)os_transaction_create();
  if (![(_DPStorage *)self readOnly])
  {
    uint64_t v4 = [(_DPStorage *)self coredataStorage];
    id v5 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
    id v6 = [v4 mocForProtectionClass:v5];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __19___DPStorage_flush__block_invoke;
    v10[3] = &unk_1E6C43BB8;
    id v11 = v6;
    id v7 = v6;
    [v7 performWithOptions:4 andBlock:v10];
  }
  id v8 = [(_DPStorage *)self coredataStorage];
  id v9 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  [v8 invalidateManagedObjectContextFor:v9];
}

- (void)dealloc
{
  [(_DPStorage *)self flush];
  v3.receiver = self;
  v3.super_class = (Class)_DPStorage;
  [(_DPStorage *)&v3 dealloc];
}

+ (id)entitiesRequiringMaintenance
{
  v14[10] = *MEMORY[0x1E4F143B8];
  id v13 = +[_DPNumericDataRecord entityName];
  v14[0] = v13;
  v2 = +[_DPBitValueRecord entityName];
  v14[1] = v2;
  objc_super v3 = +[_DPOBHSequenceRecord entityName];
  v14[2] = v3;
  uint64_t v4 = +[_DPCMSWordRecord entityName];
  v14[3] = v4;
  id v5 = +[_DPCMSSequenceRecord entityName];
  v14[4] = v5;
  id v6 = +[_DPHCMSWordRecord entityName];
  v14[5] = v6;
  id v7 = +[_DPHCMSSequenceRecord entityName];
  v14[6] = v7;
  id v8 = +[_DPPTRecord entityName];
  v14[7] = v8;
  id v9 = +[_DPBSSFPRecord entityName];
  v14[8] = v9;
  uint64_t v10 = +[_DPPrioRecord entityName];
  v14[9] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

- (void)scheduleStorageCullingWithName:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() entitiesRequiringMaintenance];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __54___DPStorage_scheduleStorageCullingWithName_database___block_invoke;
  id v15 = &unk_1E6C444A8;
  id v16 = v5;
  id v17 = v7;
  long long v18 = xmmword_1DC5C5F70;
  id v8 = v7;
  id v9 = v5;
  uint64_t v10 = (void *)MEMORY[0x1E019FA60](&v12);
  id v11 = +[_DPPeriodicTask taskWithName:period:handler:](_DPPeriodicTask, "taskWithName:period:handler:", v6, kSecondsIn24Hours, v10, v12, v13, v14, v15);

  +[_DPPeriodicTaskManager registerTask:v11];
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v5 = a4;
  double v6 = (double)(unint64_t)kSecondsIn14Day;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() entitiesRequiringMaintenance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51___DPStorage_scheduleMaintenanceWithName_database___block_invoke;
  v13[3] = &unk_1E6C444D0;
  id v14 = v5;
  id v15 = v8;
  long long v16 = xmmword_1DC5C5F70;
  double v17 = v6;
  id v9 = v8;
  id v10 = v5;
  id v11 = (void *)MEMORY[0x1E019FA60](v13);
  uint64_t v12 = +[_DPPeriodicTask taskWithName:v7 period:kSecondsIn12Hours handler:v11];

  +[_DPPeriodicTaskManager registerTask:v12];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)converterFromEntity
{
  return self->_converterFromEntity;
}

- (NSDictionary)converterFromClass
{
  return self->_converterFromClass;
}

- (_DPCoreDataStorage)coredataStorage
{
  return self->_coredataStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coredataStorage, 0);
  objc_storeStrong((id *)&self->_converterFromClass, 0);
  objc_storeStrong((id *)&self->_converterFromEntity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)saveRecords:(os_log_t)log andFlush:withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "NSManagedObjectContext is not found", v1, 2u);
}

- (void)saveRecords:(uint8_t *)buf andFlush:(os_log_t)log withCompletion:.cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "%@ : %@ : found foreign objects", buf, 0x16u);
}

- (void)updateRecords:(uint64_t)a1 withCompletion:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v5, v6, "%@ : %@ : found foreign objects", v7, v8, v9, v10, v11);
}

@end