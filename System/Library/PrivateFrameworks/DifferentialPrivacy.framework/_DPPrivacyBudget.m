@interface _DPPrivacyBudget
+ (BOOL)createDatabaseRecordIfMissingIn:(id)a3 key:(id)a4 balance:(int64_t)a5 cohortAggregateBalance:(double)a6;
+ (BOOL)credit:(unint64_t)a3 budgetWithName:(id)a4;
+ (BOOL)creditCohortAggregate:(double)a3 budgetWithName:(id)a4;
+ (BOOL)debit:(unint64_t)a3 budgetWithName:(id)a4;
+ (BOOL)debitCohortAggregate:(double)a3 budgetWithName:(id)a4;
+ (BOOL)isMultiDayIntervalBudgetWithName:(id)a3;
+ (_DPPrivacyBudget)budgetWithName:(id)a3;
+ (double)balanceForCohortAggregateBudgetWithName:(id)a3;
+ (id)enforceBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5;
+ (id)enforceEnhancedBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5;
+ (id)enforceSimpleBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5;
+ (id)fetchBudgetKeyNamesFrom:(id)a3;
+ (id)fetchBudgetRecordFrom:(id)a3 key:(id)a4;
+ (int64_t)balanceForBudgetWithName:(id)a3;
+ (void)createBudgetRecordsIn:(id)a3;
+ (void)initialize;
+ (void)removeBudgetWithName:(id)a3;
+ (void)resetAllBudgetRecordsIn:(id)a3;
+ (void)resetLastUpdateDateForName:(id)a3;
+ (void)updateAllBudgetsIn:(id)a3;
+ (void)updateAllBudgetsUnsafeIn:(id)a3;
+ (void)updateBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5;
+ (void)updateEnhancedBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5;
+ (void)updateSimpleBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5;
- (BOOL)initializeBudgetRecordFrom:(id)a3;
- (NSString)name;
- (_DPPrivacyBudget)init;
- (_DPPrivacyBudget)initWithName:(id)a3 budgetProperties:(id)a4;
- (_DPPrivacyBudgetProperties)budgetProperties;
- (_DPPrivacyBudgetRecord)budgetRecord;
- (id)description;
- (void)setBudgetRecord:(id)a3;
@end

@implementation _DPPrivacyBudget

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_5);
  }
}

- (_DPPrivacyBudget)init
{
  return 0;
}

- (_DPPrivacyBudget)initWithName:(id)a3 budgetProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)_DPPrivacyBudget;
    v11 = [(_DPPrivacyBudget *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_name, a3);
      objc_storeStrong((id *)&v12->_budgetProperties, a4);
      budgetRecord = v12->_budgetRecord;
      v12->_budgetRecord = 0;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

+ (_DPPrivacyBudget)budgetWithName:(id)a3
{
  id v4 = a3;
  id v5 = (id)gAllBudgets;
  objc_sync_enter(v5);
  v6 = [(id)gAllBudgets objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v7 = +[_DPPrivacyBudgetProperties budgetPropertiesForKey:v4];
    v6 = (void *)[objc_alloc((Class)a1) initWithName:v4 budgetProperties:v7];
    if (v6) {
      [(id)gAllBudgets setObject:v6 forKeyedSubscript:v4];
    }
  }
  objc_sync_exit(v5);

  return (_DPPrivacyBudget *)v6;
}

+ (void)removeBudgetWithName:(id)a3
{
  id v4 = a3;
  id v3 = (id)gAllBudgets;
  objc_sync_enter(v3);
  if (v4) {
    [(id)gAllBudgets removeObjectForKey:v4];
  }
  objc_sync_exit(v3);
}

+ (BOOL)debit:(unint64_t)a3 budgetWithName:(id)a4
{
  id v5 = a4;
  id v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  id v7 = [(id)gAllBudgets objectForKeyedSubscript:v5];
  id v8 = [v7 budgetRecord];
  objc_msgSend(v8, "setBalance:", objc_msgSend(v8, "balance") - a3);

  objc_sync_exit(v6);
  return 1;
}

+ (BOOL)debitCohortAggregate:(double)a3 budgetWithName:(id)a4
{
  id v5 = a4;
  id v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  id v7 = [(id)gAllBudgets objectForKeyedSubscript:v5];
  id v8 = [v7 budgetRecord];
  [v8 cohortAggregateBalance];
  [v8 setCohortAggregateBalance:v9 - a3];

  objc_sync_exit(v6);
  return 1;
}

+ (BOOL)credit:(unint64_t)a3 budgetWithName:(id)a4
{
  id v5 = a4;
  id v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  id v7 = [(id)gAllBudgets objectForKeyedSubscript:v5];
  id v8 = [v7 budgetRecord];
  objc_msgSend(v8, "setBalance:", objc_msgSend(v8, "balance") + a3);

  objc_sync_exit(v6);
  return 1;
}

+ (BOOL)creditCohortAggregate:(double)a3 budgetWithName:(id)a4
{
  id v5 = a4;
  id v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  id v7 = [(id)gAllBudgets objectForKeyedSubscript:v5];
  id v8 = [v7 budgetRecord];
  [v8 cohortAggregateBalance];
  [v8 setCohortAggregateBalance:v9 + a3];

  objc_sync_exit(v6);
  return 1;
}

+ (int64_t)balanceForBudgetWithName:(id)a3
{
  id v3 = a3;
  id v4 = (id)gAllBudgets;
  objc_sync_enter(v4);
  id v5 = [(id)gAllBudgets objectForKeyedSubscript:v3];
  id v6 = [v5 budgetRecord];
  int64_t v7 = [v6 balance];

  objc_sync_exit(v4);
  return v7;
}

+ (double)balanceForCohortAggregateBudgetWithName:(id)a3
{
  id v3 = a3;
  id v4 = (id)gAllBudgets;
  objc_sync_enter(v4);
  id v5 = [(id)gAllBudgets objectForKeyedSubscript:v3];
  id v6 = [v5 budgetRecord];
  [v6 cohortAggregateBalance];
  double v8 = v7;

  objc_sync_exit(v4);
  return v8;
}

+ (BOOL)isMultiDayIntervalBudgetWithName:(id)a3
{
  id v3 = a3;
  id v4 = (id)gAllBudgets;
  objc_sync_enter(v4);
  id v5 = [(id)gAllBudgets objectForKeyedSubscript:v3];
  id v6 = [v5 budgetProperties];
  double v7 = [v6 interval];
  unint64_t v8 = [v7 unsignedIntegerValue];
  BOOL v9 = v8 > kSecondsIn24Hours;

  objc_sync_exit(v4);
  return v9;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(_DPPrivacyBudget *)self name];
  double v7 = [(_DPPrivacyBudget *)self budgetRecord];
  unint64_t v8 = [(_DPPrivacyBudget *)self budgetProperties];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { name=%@ ; budgetRecord=%@ ; budgetProperties=%@ ; }",
    v5,
    v6,
    v7,
  BOOL v9 = v8);

  return v9;
}

+ (void)resetLastUpdateDateForName:(id)a3
{
  id v6 = a3;
  id v3 = (id)gAllBudgets;
  objc_sync_enter(v3);
  id v4 = [(id)gAllBudgets objectForKeyedSubscript:v6];
  id v5 = [v4 budgetRecord];
  [v5 setLastUpdate:0.0];

  objc_sync_exit(v3);
}

+ (void)updateAllBudgetsIn:(id)a3
{
  id v4 = a3;
  id v3 = (id)gAllBudgets;
  objc_sync_enter(v3);
  [(id)objc_opt_class() updateAllBudgetsUnsafeIn:v4];
  objc_sync_exit(v3);
}

+ (void)updateAllBudgetsUnsafeIn:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  v50 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v3 = +[_DPPrivacyBudgetProperties budgetMaintenanceSchedule];
  id v43 = (id)gAllBudgets;
  objc_sync_enter(v43);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v3;
  uint64_t v46 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v62 != v45) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v48 = objc_msgSend(obj, "objectForKeyedSubscript:", v4, v43);
        id v5 = [v48 allObjects];
        v56 = v4;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v51 = v5;
        uint64_t v6 = [v51 countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v6)
        {
          uint64_t v53 = *(void *)v58;
          do
          {
            uint64_t v7 = 0;
            uint64_t v54 = v6;
            do
            {
              if (*(void *)v58 != v53) {
                objc_enumerationMutation(v51);
              }
              uint64_t v8 = *(void *)(*((void *)&v57 + 1) + 8 * v7);
              BOOL v9 = (void *)MEMORY[0x1E019F810]();
              v10 = [(id)gAllBudgets objectForKeyedSubscript:v8];
              v11 = (void *)MEMORY[0x1E4F1C9C8];
              v12 = [v10 budgetRecord];
              [v12 lastUpdate];
              v13 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");

              v14 = [MEMORY[0x1E4F1C9C8] date];
              [v14 timeIntervalSinceDate:v13];
              double v16 = v15;

              [v56 doubleValue];
              if (v17 <= v16)
              {
                unint64_t v18 = [v56 unsignedIntegerValue];
                uint64_t v19 = [v56 unsignedIntegerValue];
                unint64_t v20 = (unint64_t)v16 / v18;
                double v21 = (double)(v20 * v19);
                BOOL v23 = v16 < v21 || v20 > 1;
                if (v23) {
                  unint64_t v20 = 1;
                }
                unint64_t v55 = v20;
                if (v23) {
                  double v24 = v16;
                }
                else {
                  double v24 = v21;
                }
                v25 = [v10 budgetProperties];
                v26 = [v25 intervalBudgetValue];
                uint64_t v52 = [v26 unsignedIntegerValue];
                v27 = [v10 budgetProperties];
                v28 = [v27 intervalChunksValue];
                uint64_t v29 = [v28 unsignedIntegerValue];

                v30 = [v10 budgetProperties];
                v31 = [v30 intervalCohortAggregateBudgetValue];
                [v31 doubleValue];
                double v33 = v32;
                v34 = [v10 budgetProperties];
                v35 = [v34 intervalChunksValue];
                unint64_t v36 = [v35 unsignedIntegerValue];

                v37 = [v10 budgetRecord];

                if (v37)
                {
                  v38 = [v10 budgetRecord];
                  [v38 lastUpdate];
                  [v38 setLastUpdate:v24 + v39];

                  v40 = [v10 budgetRecord];
                  [v40 setBalance:v52 * v55 * v29];

                  v41 = [v10 budgetRecord];
                  [v41 setCohortAggregateBalance:v33 * (double)v55 * (double)v36];

                  v42 = [v10 budgetRecord];
                  [v50 addObject:v42];
                }
              }

              ++v7;
            }
            while (v54 != v7);
            uint64_t v6 = [v51 countByEnumeratingWithState:&v57 objects:v65 count:16];
          }
          while (v6);
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v46);
  }

  [v44 updateRecords:v50 withCompletion:0];
  objc_sync_exit(v43);
}

+ (void)resetAllBudgetRecordsIn:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1E019F810]();
  id obj = (id)gAllBudgets;
  objc_sync_enter(obj);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(id)gAllBudgets allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        BOOL v9 = objc_msgSend((id)objc_opt_class(), "fetchBudgetRecordFrom:key:", v3, v8, context);
        if ([v9 count])
        {
          v10 = [v9 firstObject];
          v11 = [(id)gAllBudgets objectForKeyedSubscript:v8];
          [v11 setBudgetRecord:v10];
        }
        else
        {
          v10 = [(id)gAllBudgets objectForKeyedSubscript:v8];
          [v10 setBudgetRecord:0];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  objc_sync_exit(obj);
}

+ (void)createBudgetRecordsIn:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1E019F810]();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = +[_DPPrivacyBudgetProperties allBudgetPropertiesKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        BOOL v9 = +[_DPPrivacyBudgetProperties budgetPropertiesForKey:v8];
        v10 = [v9 intervalBudgetValue];
        uint64_t v11 = [v10 integerValue];
        v12 = [v9 intervalChunksValue];
        uint64_t v13 = [v12 integerValue] * v11;

        long long v14 = [v9 intervalCohortAggregateBudgetValue];
        [v14 doubleValue];
        double v16 = v15;
        long long v17 = [v9 intervalChunksValue];
        double v18 = v16 * (double)[v17 integerValue];

        +[_DPPrivacyBudget createDatabaseRecordIfMissingIn:v3 key:v8 balance:v13 cohortAggregateBalance:v18];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
}

+ (id)fetchBudgetRecordFrom:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__5;
  long long v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  uint64_t v8 = +[_DPRecordQueryPredicates predicateForKey:v7];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v10 = +[_DPPrivacyBudgetRecord entityName];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke;
  v14[3] = &unk_1E6C44548;
  double v16 = &v18;
  SEL v17 = a2;
  uint64_t v11 = v9;
  double v15 = v11;
  [v6 fetchRecordsFor:v10 predicate:v8 fetchLimit:1 fetchOffset:0 withCompletion:v14];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

+ (id)fetchBudgetKeyNamesFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E019F810]();
    id v6 = +[_DPPrivacyBudgetRecord entityName];
    if (v6)
    {
      id v7 = +[_DPRecordQueryPredicates predicateForAllRecords];
      uint64_t v16 = 0;
      SEL v17 = &v16;
      uint64_t v18 = 0x3032000000;
      uint64_t v19 = __Block_byref_object_copy__5;
      uint64_t v20 = __Block_byref_object_dispose__5;
      id v21 = 0;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44___DPPrivacyBudget_fetchBudgetKeyNamesFrom___block_invoke;
      v12[3] = &unk_1E6C44570;
      long long v14 = &v16;
      SEL v15 = a2;
      dispatch_semaphore_t v9 = v8;
      uint64_t v13 = v9;
      [v4 fetchKeynamesFor:v6 predicate:v7 fetchLimit:300 fetchOffset:0 withCompletion:v12];
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      id v10 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (BOOL)initializeBudgetRecordFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E019F810]();
  id v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  id v7 = [(_DPPrivacyBudget *)self budgetRecord];

  if (v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    dispatch_semaphore_t v9 = [(id)objc_opt_class() fetchBudgetRecordFrom:v4 key:self->_name];
    uint64_t v10 = [v9 count];
    BOOL v8 = v10 != 0;
    if (v10)
    {
      uint64_t v11 = [v9 firstObject];
      [(_DPPrivacyBudget *)self setBudgetRecord:v11];
    }
  }
  objc_sync_exit(v6);

  return v8;
}

+ (BOOL)createDatabaseRecordIfMissingIn:(id)a3 key:(id)a4 balance:(int64_t)a5 cohortAggregateBalance:(double)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x1E019F810]();
  id v13 = (id)gAllBudgets;
  objc_sync_enter(v13);
  long long v14 = [(id)objc_opt_class() fetchBudgetRecordFrom:v10 key:v11];
  uint64_t v15 = [v14 count];
  if (!v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    [v16 timeIntervalSinceReferenceDate];
    uint64_t v18 = [[_DPPrivacyBudgetRecord alloc] initWithKey:v11 creationDate:a5 lastUpdate:0 balance:v17 cohortAggregateBalance:v17 objectId:a6];
    v22[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke;
    v21[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
    v21[4] = a2;
    [v10 updateRecords:v19 withCompletion:v21];
  }
  objc_sync_exit(v13);

  return v15 == 0;
}

+ (id)enforceBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [v8 objectAtIndexedSubscript:0];
    id v12 = [v11 metadata];

    if (+[_DPEnhancedPrivacyAlgorithm isEnhancedPrivacyAlgorithm:v12])
    {
      [a1 enforceEnhancedBudgetForRecords:v8 withKey:v9 inDatabase:v10];
    }
    else
    {
      [a1 enforceSimpleBudgetForRecords:v8 withKey:v9 inDatabase:v10];
    id v13 = };
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
    id v12 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

+ (void)updateBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v12 count])
  {
    id v10 = [v12 objectAtIndexedSubscript:0];
    id v11 = [v10 metadata];

    if (+[_DPEnhancedPrivacyAlgorithm isEnhancedPrivacyAlgorithm:v11])
    {
      [a1 updateEnhancedBudgetForRecords:v12 withKey:v8 inDatabase:v9];
    }
    else
    {
      [a1 updateSimpleBudgetForRecords:v12 withKey:v8 inDatabase:v9];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }
}

+ (id)enforceEnhancedBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = [v7 objectAtIndexedSubscript:0];
    id v11 = [v10 metadata];

    if (+[_DPEnhancedPrivacyAlgorithm isMetadataValid:](_DPEnhancedPrivacyAlgorithm, "isMetadataValid:", v11)&& +[_DPEnhancedPrivacyAlgorithm verifyEnhancedDPParamsForKey:v8 withMetadata:v11])
    {
      id v12 = +[_DPEnhancedPrivacyAlgorithm allowedDataTypesForKey:v8 withMetadata:v11];
      if (v12)
      {
        id v49 = v8;
        v47 = +[_DPKeyNames keyPropertiesForKey:v8];
        uint64_t v46 = [v47 namespaceName];
        v50 = +[_DPNamespaceParameters initParametersForNamespace:](_DPNamespaceParameters, "initParametersForNamespace:");
        id v13 = [v50 budget];
        [v13 initializeBudgetRecordFrom:v9];

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v48 = v12;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          double v17 = 0;
          uint64_t v18 = *(void *)v57;
          do
          {
            uint64_t v19 = 0;
            uint64_t v20 = v17;
            do
            {
              if (*(void *)v57 != v18) {
                objc_enumerationMutation(v14);
              }
              double v17 = +[_DPDataTypeParameters initParametersForDataType:*(void *)(*((void *)&v56 + 1) + 8 * v19)];

              id v21 = [v17 budget];
              [v21 initializeBudgetRecordFrom:v9];

              ++v19;
              uint64_t v20 = v17;
            }
            while (v16 != v19);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v61 count:16];
          }
          while (v16);
        }
        else
        {
          double v17 = 0;
        }

        id v23 = (void *)MEMORY[0x1E019F810]();
        +[_DPPrivacyBudget updateAllBudgetsIn:v9];
        long long v24 = v50;
        v25 = [v50 budget];
        uint64_t v26 = [v25 name];

        uint64_t v27 = +[_DPPrivacyBudget balanceForBudgetWithName:v26];
        uint64_t v45 = (void *)v26;
        +[_DPPrivacyBudget balanceForCohortAggregateBudgetWithName:v26];
        double v29 = v28;
        id v44 = [v11 objectForKeyedSubscript:@"EnhancedDifferentialPrivacyParameters"];
        v30 = [v44 objectForKeyedSubscript:@"cohortAggregateDifferentialPrivacyBudget"];
        [v30 doubleValue];
        double v32 = v31;

        id v22 = (id)MEMORY[0x1E4F1CBF0];
        if (v27 >= 1 && v29 - v32 >= 0.0)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id obj = v14;
          uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v53;
            while (2)
            {
              uint64_t v36 = 0;
              v37 = v17;
              do
              {
                if (*(void *)v53 != v35) {
                  objc_enumerationMutation(obj);
                }
                double v17 = +[_DPDataTypeParameters initParametersForDataType:*(void *)(*((void *)&v52 + 1) + 8 * v36)];

                v38 = [v17 budget];
                double v39 = [v38 name];

                uint64_t v40 = +[_DPPrivacyBudget balanceForBudgetWithName:v39];
                +[_DPPrivacyBudget balanceForCohortAggregateBudgetWithName:v39];
                double v42 = v41;

                if (v40 < 1 || v42 - v32 < 0.0)
                {

                  id v22 = (id)MEMORY[0x1E4F1CBF0];
                  goto LABEL_30;
                }
                ++v36;
                v37 = v17;
              }
              while (v34 != v36);
              uint64_t v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16, v42 - v32);
              if (v34) {
                continue;
              }
              break;
            }
          }

          id v22 = (id)[v7 copy];
LABEL_30:
          long long v24 = v50;
        }

        id v12 = v48;
        id v8 = v49;
      }
      else
      {
        id v22 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v22 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v22 = (id)MEMORY[0x1E4F1CBF0];
    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v22;
}

+ (id)enforceSimpleBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[_DPKeyNames keyPropertiesForKey:v8];
  id v11 = [v10 budget];
  [v11 initializeBudgetRecordFrom:v9];

  id v12 = (void *)MEMORY[0x1E019F810]();
  +[_DPPrivacyBudget updateAllBudgetsIn:v9];
  id v13 = [v10 budget];
  id v14 = [v13 name];

  uint64_t v15 = +[_DPPrivacyBudget balanceForBudgetWithName:v14];
  if (v15 <= 0)
  {
    uint64_t v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[_DPPrivacyBudget enforceSimpleBudgetForRecords:withKey:inDatabase:]();
    }

    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v16 = v15;
    id v17 = v7;
    if ([v17 count] > v16)
    {
      uint64_t v18 = objc_msgSend(v17, "subarrayWithRange:", 0, v16);

      id v17 = (id)v18;
    }
  }

  return v17;
}

+ (void)updateEnhancedBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[_DPKeyNames keyPropertiesForKey:v8];
  id v11 = [v7 objectAtIndexedSubscript:0];
  id v12 = [v11 metadata];

  if (+[_DPEnhancedPrivacyAlgorithm isMetadataValid:](_DPEnhancedPrivacyAlgorithm, "isMetadataValid:", v12)&& +[_DPEnhancedPrivacyAlgorithm verifyEnhancedDPParamsForKey:v8 withMetadata:v12])
  {
    v38 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    double v41 = [v10 namespaceName];
    id v13 = +[_DPNamespaceParameters initParametersForNamespace:](_DPNamespaceParameters, "initParametersForNamespace:");
    id v14 = [v13 budget];
    uint64_t v15 = [v14 name];

    +[_DPPrivacyBudget debit:1 budgetWithName:v15];
    double v39 = [v12 objectForKeyedSubscript:@"EnhancedDifferentialPrivacyParameters"];
    unint64_t v16 = [v39 objectForKeyedSubscript:@"cohortAggregateDifferentialPrivacyBudget"];
    [v16 doubleValue];
    double v18 = v17;

    uint64_t v40 = (void *)v15;
    +[_DPPrivacyBudget debitCohortAggregate:v15 budgetWithName:v18];
    uint64_t v19 = [v13 budget];
    [v19 budgetRecord];
    v21 = uint64_t v20 = v12;

    [v38 addObject:v21];
    double v42 = v20;
    uint64_t v22 = +[_DPEnhancedPrivacyAlgorithm allowedDataTypesForKey:v8 withMetadata:v20];
    long long v44 = 0u;
    long long v45 = 0u;
    id v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v22) {
      id v23 = (void *)v22;
    }
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    id obj = v23;
    uint64_t v24 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v34 = v10;
      id v35 = v9;
      id v36 = v8;
      id v37 = v7;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v45;
      do
      {
        uint64_t v28 = 0;
        double v29 = v21;
        v30 = v26;
        do
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = +[_DPDataTypeParameters initParametersForDataType:*(void *)(*((void *)&v44 + 1) + 8 * v28)];

          double v31 = [v26 budget];
          double v32 = [v31 name];

          +[_DPPrivacyBudget debit:1 budgetWithName:v32];
          +[_DPPrivacyBudget debitCohortAggregate:v32 budgetWithName:v18];
          uint64_t v33 = [v26 budget];
          id v21 = [v33 budgetRecord];

          [v38 addObject:v21];
          ++v28;
          double v29 = v21;
          v30 = v26;
        }
        while (v25 != v28);
        uint64_t v25 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v25);

      id v8 = v36;
      id v7 = v37;
      id v10 = v34;
      id v9 = v35;
    }

    [v9 updateRecords:v38 withCompletion:0];
    id v12 = v42;
  }
}

+ (void)updateSimpleBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = +[_DPKeyNames keyPropertiesForKey:a4];
  if ([v7 count])
  {
    id v10 = [v9 budget];
    id v11 = [v10 name];

    +[_DPPrivacyBudget debit:budgetWithName:](_DPPrivacyBudget, "debit:budgetWithName:", [v7 count], v11);
    id v12 = [v9 budget];
    id v13 = [v12 budgetRecord];

    v15[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v8 updateRecords:v14 withCompletion:0];
  }
}

- (NSString)name
{
  return self->_name;
}

- (_DPPrivacyBudgetProperties)budgetProperties
{
  return self->_budgetProperties;
}

- (_DPPrivacyBudgetRecord)budgetRecord
{
  return (_DPPrivacyBudgetRecord *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBudgetRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetRecord, 0);
  objc_storeStrong((id *)&self->_budgetProperties, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)enforceSimpleBudgetForRecords:withKey:inDatabase:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_DEBUG, "%@: no balance left for key=%@", v3, 0x16u);
}

@end