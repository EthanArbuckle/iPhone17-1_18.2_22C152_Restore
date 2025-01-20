@interface _DPReportGenerator
+ (id)filterNonConformingRecordsFrom:(id)a3;
+ (id)queryKeysForPattern:(id)a3 storage:(id)a4;
+ (id)queryRecordsForKey:(id)a3 storage:(id)a4;
+ (id)randomizeKeys:(id)a3 andSortByPriority:(BOOL)a4;
+ (unint64_t)queryRecordCountForKey:(id)a3 withPredicate:(id)a4 storage:(id)a5;
- (BOOL)markSubmitted:(id)a3 storage:(id)a4;
- (_DPMetricsCollector)metricsCollector;
- (_DPReportGenerator)init;
- (_DPReportGenerator)initWithMetricsCollector:(id)a3;
- (id)generateReportForKeys:(id)a3 storage:(id)a4;
- (id)generateReportUsing:(id)a3;
- (void)reportMetricsForKey:(id)a3 toBeSubmitted:(id)a4 currentDate:(id)a5 storage:(id)a6;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
@end

@implementation _DPReportGenerator

+ (id)filterNonConformingRecordsFrom:(id)a3
{
  id v3 = a3;
  v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_14];
  v5 = (void *)[v3 mutableCopy];

  [v5 removeObjectsAtIndexes:v4];
  return v5;
}

+ (unint64_t)queryRecordCountForKey:(id)a3 withPredicate:(id)a4 storage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = +[_DPKeyNames keyPropertiesForKey:v8];
    uint64_t v12 = +[_DPRecordQueryPredicates entityForKey:v8];
    v13 = (void *)v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      unint64_t v17 = 0;
    }
    else
    {
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      uint64_t v26 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke;
      v19[3] = &unk_1E6C44948;
      v21 = &v23;
      SEL v22 = a2;
      v16 = v15;
      v20 = v16;
      [v10 fetchRecordCountForEntity:v13 predicate:v9 completion:v19];
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      unint64_t v17 = v24[3];

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

+ (id)queryRecordsForKey:(id)a3 storage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E019F810]();
    id v9 = +[_DPKeyNames keyPropertiesForKey:v6];
    id v10 = v9;
    if (v9)
    {
      v11 = [v9 budget];
      uint64_t v12 = [v11 name];

      v13 = +[_DPPrivacyBudgetProperties budgetPropertiesForKey:v12];
      BOOL v14 = [v13 intervalBudgetValue];
      unint64_t v15 = [v14 unsignedIntegerValue];

      if (v15 >= 0x28) {
        uint64_t v16 = 40;
      }
      else {
        uint64_t v16 = v15;
      }
    }
    else
    {
      uint64_t v16 = 40;
    }
    v18 = +[_DPRecordQueryPredicates entityForKey:v6];
    if (v18)
    {
      if ([v10 keyPatternsAllowed]) {
        +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKeyBeginsWith:v6];
      }
      else {
      v19 = +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKey:v6];
      }
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__8;
      v31 = __Block_byref_object_dispose__8;
      id v32 = 0;
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke;
      v23[3] = &unk_1E6C44570;
      uint64_t v25 = &v27;
      SEL v26 = a2;
      v21 = v20;
      v24 = v21;
      [v7 fetchRecordsFor:v18 predicate:v19 fetchLimit:v16 fetchOffset:0 randomizeOrder:1 withCompletion:v23];
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      id v17 = (id)v28[5];

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      id v17 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

+ (id)queryKeysForPattern:(id)a3 storage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E019F810]();
    id v9 = +[_DPRecordQueryPredicates entityForKey:v6];
    if (v9)
    {
      id v10 = +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKeyBeginsWith:v6];
      uint64_t v19 = 0;
      dispatch_semaphore_t v20 = &v19;
      uint64_t v21 = 0x3032000000;
      SEL v22 = __Block_byref_object_copy__8;
      uint64_t v23 = __Block_byref_object_dispose__8;
      id v24 = 0;
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50___DPReportGenerator_queryKeysForPattern_storage___block_invoke;
      v15[3] = &unk_1E6C44570;
      id v17 = &v19;
      SEL v18 = a2;
      uint64_t v12 = v11;
      uint64_t v16 = v12;
      [v7 fetchKeynamesFor:v9 predicate:v10 fetchLimit:100 fetchOffset:0 withCompletion:v15];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      id v13 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (_DPReportGenerator)init
{
  id v3 = +[_DPCoreAnalyticsCollector sharedInstance];
  v4 = [(_DPReportGenerator *)self initWithMetricsCollector:v3];

  return v4;
}

- (_DPReportGenerator)initWithMetricsCollector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPReportGenerator;
  id v6 = [(_DPReportGenerator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metricsCollector, a3);
  }

  return v7;
}

- (BOOL)markSubmitted:(id)a3 storage:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E019F810]();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "setSubmitted:", 1, (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [v6 updateRecords:v8 withCompletion:0];
  }

  return v6 != 0;
}

- (id)generateReportUsing:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v5 = +[_DPLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_DPReportGenerator generateReportUsing:](a2, v5);
  }

  if (!+[_DPDeviceInfo isDataCollectionEnabled])
  {
    id v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_DPReportGenerator generateReportUsing:](a2);
    }
    goto LABEL_9;
  }
  if (+[_DPDeviceInfo isDisabledByTaskingForCrashCopier])
  {
    id v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_DPReportGenerator generateReportUsing:](a2);
    }
LABEL_9:

    id v7 = 0;
    goto LABEL_31;
  }
  uint64_t v27 = (void *)MEMORY[0x1E019F810]();
  id v8 = +[_DPKeyNames keyNamesGroupedByPropertyName];
  v34 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v30 = v8;
  SEL v26 = [v8 allKeys];
  [(id)objc_opt_class() randomizeKeys:v26 andSortByPriority:1];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v9;
        uint64_t v10 = *(void *)(*((void *)&v40 + 1) + 8 * v9);
        context = (void *)MEMORY[0x1E019F810]();
        uint64_t v11 = [v30 objectForKeyedSubscript:v10];
        uint64_t v12 = (void *)[v11 mutableCopy];

        id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              dispatch_semaphore_t v20 = +[_DPKeyNames keyPropertiesForKey:v19];
              if ([v20 keyPatternsAllowed])
              {
                [v13 addObject:v19];
                uint64_t v21 = [(id)objc_opt_class() queryKeysForPattern:v19 storage:v35];
                if ([v21 count])
                {
                  SEL v22 = [(id)objc_opt_class() randomizeKeys:v21 andSortByPriority:0];
                  [v34 addObjectsFromArray:v22];
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v16);
        }

        [v14 removeObjectsInArray:v13];
        uint64_t v23 = (void *)[v14 copy];
        if ([v23 count])
        {
          id v24 = [(id)objc_opt_class() randomizeKeys:v23 andSortByPriority:0];
          [v34 addObjectsFromArray:v24];
        }
        uint64_t v9 = v33 + 1;
      }
      while (v33 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v31);
  }

  id v7 = [(_DPReportGenerator *)self generateReportForKeys:v34 storage:v35];

LABEL_31:

  return v7;
}

+ (id)randomizeKeys:(id)a3 andSortByPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E019F810]();
  uint32_t v7 = [v5 count];
  id v8 = (void *)[v5 mutableCopy];
  for (uint64_t i = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy]; objc_msgSend(v8, "count"); --v7)
  {
    uint64_t v10 = arc4random_uniform(v7);
    uint64_t v11 = [v8 objectAtIndexedSubscript:v10];
    [v8 removeObjectAtIndex:v10];
    [i addObject:v11];
  }
  if (v4)
  {
    uint64_t v12 = [i sortedArrayWithOptions:16 usingComparator:&__block_literal_global_13];
  }
  else
  {
    uint64_t v12 = [i copy];
  }
  id v13 = (void *)v12;

  return v13;
}

- (void)reportMetricsForKey:(id)a3 toBeSubmitted:(id)a4 currentDate:(id)a5 storage:(id)a6
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (+[_DPDeviceInfo isInternalBuild])
  {
    id v14 = +[_DPKeyNames keyPropertiesForKey:v10];
    if (v14)
    {
      id v32 = self;
      id v41 = v14;
      long long v40 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v12 sinceDate:-604800.0];
      long long v39 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v12 sinceDate:-86400.0];
      long long v37 = +[_DPRecordQueryPredicates predicateForRecordsInDateRangeStart:v40 end:v12];
      long long v38 = +[_DPRecordQueryPredicates predicateForRecordsInDateRangeStart:v39 end:v12];
      uint64_t v15 = +[_DPRecordQueryPredicates predicateForRecordsMatchingKey:v10];
      uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
      v46[0] = v15;
      v46[1] = v38;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
      long long v36 = [v16 andPredicateWithSubpredicates:v17];

      SEL v18 = (void *)MEMORY[0x1E4F28BA0];
      v45[0] = v15;
      v45[1] = v37;
      id v35 = (void *)v15;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
      v34 = [v18 andPredicateWithSubpredicates:v19];

      uint64_t v33 = [(id)objc_opt_class() queryRecordCountForKey:v10 withPredicate:v36 storage:v13];
      uint64_t v20 = [(id)objc_opt_class() queryRecordCountForKey:v10 withPredicate:v34 storage:v13];
      uint64_t v21 = (void *)MEMORY[0x1E4F28BA0];
      v44[0] = v15;
      SEL v22 = +[_DPRecordQueryPredicates predicateForRecordsNotSubmitted];
      v44[1] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      id v24 = [v21 andPredicateWithSubpredicates:v23];

      unint64_t v25 = [(id)objc_opt_class() queryRecordCountForKey:v10 withPredicate:v24 storage:v13];
      double v26 = (double)(unint64_t)[v11 count] / (double)v25;
      v43[0] = v10;
      v42[0] = @"useCase";
      v42[1] = @"countLastWeek";
      uint64_t v27 = [NSNumber numberWithUnsignedInteger:v20];
      v43[1] = v27;
      v42[2] = @"countLastDay";
      v28 = [NSNumber numberWithUnsignedInteger:v33];
      v43[2] = v28;
      v42[3] = @"proportionSubmitted";
      uint64_t v29 = [NSNumber numberWithDouble:v26];
      v43[3] = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];

      uint64_t v31 = [(_DPReportGenerator *)v32 metricsCollector];
      [v31 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.usage" withMetrics:v30];

      id v14 = v41;
    }
  }
}

- (id)generateReportForKeys:(id)a3 storage:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    long long v38 = &stru_1F3681BE0;
    goto LABEL_51;
  }
  context = (void *)MEMORY[0x1E019F810]();
  uint32_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  v58 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v60 = (void *)[v7 mutableCopy];
  v57 = (void *)[v7 mutableCopy];
  v67 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v59 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v56 = v5;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (!v9) {
    goto LABEL_33;
  }
  uint64_t v10 = v9;
  uint64_t v61 = 40;
  id v62 = v6;
  unint64_t v11 = 0x1E6C43000uLL;
  uint64_t v12 = *(void *)v73;
  id v64 = v8;
  uint64_t v65 = *(void *)v73;
  while (2)
  {
    uint64_t v13 = 0;
    uint64_t v66 = v10;
    do
    {
      if (*(void *)v73 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void *)(*((void *)&v72 + 1) + 8 * v13);
      uint64_t v15 = (void *)MEMORY[0x1E019F810]();
      uint64_t v16 = [*(id *)(v11 + 2144) keyPropertiesForKey:v14];
      uint64_t v17 = v16;
      if (v16 && [v16 transport] != 4)
      {
        SEL v18 = [v17 budget];
        [v18 initializeBudgetRecordFrom:v6];

        uint64_t v19 = [v17 budget];
        uint64_t v20 = [v19 name];

        int64_t v21 = +[_DPPrivacyBudget balanceForBudgetWithName:v20];
        SEL v22 = [v67 objectForKeyedSubscript:v20];
        uint64_t v23 = [v22 unsignedIntegerValue];

        uint64_t v24 = v21 - v23;
        if (v24 < 1)
        {
LABEL_27:
          uint64_t v12 = v65;

          uint64_t v10 = v66;
          unint64_t v11 = 0x1E6C43000;
          goto LABEL_28;
        }
        uint64_t v25 = [v17 transport];
        double v26 = (void *)MEMORY[0x1E019F810]();
        uint64_t v27 = [(id)objc_opt_class() queryRecordsForKey:v14 storage:v6];
        v28 = [(id)objc_opt_class() filterNonConformingRecordsFrom:v27];
        if ([v28 count])
        {

          if ([v28 count] <= (unint64_t)v24)
          {
            uint64_t v27 = v28;
          }
          else
          {
            uint64_t v27 = objc_msgSend(v28, "subarrayWithRange:", 0, v24);
          }
          id v8 = v64;
          if (![v27 count]) {
            goto LABEL_26;
          }
          uint64_t v29 = [v27 count];
          if (v61 - v29 < 0)
          {

            id v6 = v62;
            goto LABEL_33;
          }
          v61 -= v29;
          v30 = [_DPJSONSegment alloc];
          uint64_t v31 = [v17 serverAlgorithmString];
          id v32 = [v17 parameterDictionary];
          uint64_t v33 = [(_DPJSONSegment *)v30 initWithKey:v14 serverAlgorithmString:v31 parameterDictionary:v32 records:v27];

          if (v33)
          {
            [v60 addObjectsFromArray:v27];
            if (v25 == 2) {
              [v57 addObject:v33];
            }
            [(_DPReportGenerator *)self reportMetricsForKey:v14 toBeSubmitted:v27 currentDate:v59 storage:v62];
            if (+[_DPDeviceInfo isInternalBuild] || v25 != 2) {
              [v58 addObject:v33];
            }
            v34 = [v67 objectForKeyedSubscript:v20];
            uint64_t v35 = [v34 unsignedIntegerValue];

            uint64_t v36 = [v27 count];
            long long v37 = [NSNumber numberWithUnsignedInteger:v36 + v35];
            [v67 setObject:v37 forKeyedSubscript:v20];
          }
        }
        else
        {
        }
        id v8 = v64;
LABEL_26:

        id v6 = v62;
        goto LABEL_27;
      }
LABEL_28:

      ++v13;
    }
    while (v10 != v13);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_33:

  long long v39 = v58;
  if (![v58 count])
  {
    long long v38 = 0;
    id v5 = v56;
    id v41 = v57;
    goto LABEL_50;
  }
  long long v40 = (void *)MEMORY[0x1E019F810]();
  id v41 = v57;
  if (![v58 count]
    || (+[_DPJSONOutputHelper submissionContentForSegments:v58], (uint64_t v42 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v38 = 0;
    goto LABEL_48;
  }
  long long v43 = (void *)v42;
  long long v38 = +[_DPUploadHelper writeFileForDA:v42];

  if (!v38)
  {
LABEL_48:
    id v5 = v56;
    goto LABEL_50;
  }
  [(_DPReportGenerator *)self markSubmitted:v60 storage:v6];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v44 = v67;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v69 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        v50 = [v44 objectForKeyedSubscript:v49];
        +[_DPPrivacyBudget debit:budgetWithName:](_DPPrivacyBudget, "debit:budgetWithName:", [v50 unsignedIntegerValue], v49);
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v46);
  }

  v51 = (void *)MEMORY[0x1E019F810]();
  +[_DPPrivacyBudget updateAllBudgetsIn:v6];
  id v41 = v57;
  id v5 = v56;
  if ([v57 count])
  {
    v52 = +[_DPJSONOutputHelper submissionContentForSegments:v57];
    id v53 = +[_DPUploadHelper writeFileForParsec:v52];
  }
  long long v39 = v58;
LABEL_50:

LABEL_51:

  return v38;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __59___DPReportGenerator_scheduleMaintenanceWithName_database___block_invoke;
  uint64_t v14 = &unk_1E6C44250;
  uint64_t v15 = self;
  id v16 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E019FA60](&v11);
  uint64_t v10 = +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v8, kSecondsIn18Hours, v9, 1, v11, v12, v13, v14, v15);

  +[_DPPeriodicTaskManager registerTask:v10];
}

- (_DPMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void).cxx_destruct
{
}

- (void)generateReportUsing:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: Disabled by Tasking - skipping report generation", v4, v5, v6, v7, 2u);
}

- (void)generateReportUsing:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: Disabled by D&U switch - skipping report generation", v4, v5, v6, v7, 2u);
}

- (void)generateReportUsing:(const char *)a1 .cold.3(const char *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  uint64_t v4 = +[_DPStrings databaseDirectoryPath];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "%@: Data Base Directory Path: %@", (uint8_t *)&v5, 0x16u);
}

@end