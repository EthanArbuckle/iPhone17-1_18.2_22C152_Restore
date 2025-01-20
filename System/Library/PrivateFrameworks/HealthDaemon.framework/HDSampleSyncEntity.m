@interface HDSampleSyncEntity
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (Class)_syncedSampleTypeClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4;
+ (id)_predicateForSampleAgeWithMaximumObjectAgeByType:(void *)a3 defaultMaxAge:(void *)a4 sessionStartDate:;
+ (id)_predicateForSyncSession:(id)a3;
@end

@implementation HDSampleSyncEntity

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", 0, v5, *MEMORY[0x1E4F2AB00]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (Class)_syncedSampleTypeClass
{
  return 0;
}

+ (id)_predicateForSyncSession:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___HDSampleSyncEntity;
  v6 = objc_msgSendSuper2(&v27, sel__predicateForSyncSession_, v5);
  id v7 = v5;
  self;
  int v8 = [v7 syncPredicate];

  v9 = [v8 dateInterval];

  if (v9)
  {
    v10 = [v9 endDate];
    v11 = HDSampleEntityPredicateForStartDate(4);

    v12 = [v9 startDate];
    v13 = [v12 dateByAddingTimeInterval:-*MEMORY[0x1E4F2A9C8]];
    v14 = HDSampleEntityPredicateForStartDate(6);

    v15 = [v9 startDate];
    v16 = HDSampleEntityPredicateForEndDate(6);

    v17 = (void *)MEMORY[0x1E4F65D08];
    v28[0] = v11;
    v28[1] = v14;
    v28[2] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
    v19 = [v17 predicateMatchingAllPredicates:v18];
  }
  else
  {
    v19 = 0;
  }

  v20 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v6 otherPredicate:v19];
  v21 = (void *)[a1 _syncedSampleTypeClass];
  if (v21)
  {
    v22 = v21;
    if (([v21 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, a1, @"HDDataSyncEntity.m", 391, @"%@ isn't an object type class", v22 object file lineNumber description];
    }
    v23 = [a1 _predicateForSampleAgeInSyncSession:v7 sampleTypeClass:v22];
    id v24 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v20 otherPredicate:v23];
  }
  else
  {
    id v24 = v20;
  }

  return v24;
}

+ (id)_predicateForSampleAgeInSyncSession:(id)a3 sampleTypeClass:(Class)a4
{
  id v6 = a3;
  id v7 = [v6 syncPredicate];
  int v8 = [v7 maximumObjectAgeByType];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HDSampleSyncEntity__predicateForSampleAgeInSyncSession_sampleTypeClass___block_invoke;
  v15[3] = &__block_descriptor_40_e35_B24__0__HKObjectType_8__NSNumber_16lu32l8;
  v15[4] = a4;
  v9 = objc_msgSend(v8, "hk_filter:", v15);

  v10 = [v6 syncPredicate];
  v11 = [v10 defaultMaximumObjectAge];
  v12 = [v6 startDate];

  v13 = +[HDSampleSyncEntity _predicateForSampleAgeWithMaximumObjectAgeByType:defaultMaxAge:sessionStartDate:]((uint64_t)a1, v9, v11, v12);

  return v13;
}

uint64_t __74__HDSampleSyncEntity__predicateForSampleAgeInSyncSession_sampleTypeClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)_predicateForSampleAgeWithMaximumObjectAgeByType:(void *)a3 defaultMaxAge:(void *)a4 sessionStartDate:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  uint64_t v9 = [v6 count];
  if (v7 || v9)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke;
    v27[3] = &unk_1E630E430;
    id v12 = v11;
    id v28 = v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v27];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke_2;
    v24[3] = &unk_1E630E458;
    id v14 = v8;
    id v25 = v14;
    id v15 = v13;
    id v26 = v15;
    [v12 enumerateKeysAndObjectsUsingBlock:v24];
    if (v7)
    {
      v16 = [v6 allKeys];
      v17 = HDSampleEntityPredicateForDataTypes(v16);

      v18 = [MEMORY[0x1E4F65D08] negatedPredicate:v17];
      [v7 doubleValue];
      v20 = [v14 dateByAddingTimeInterval:-v19];
      v21 = HDSampleEntityPredicateForEndDate(5);

      v22 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v18 otherPredicate:v21];
      [v15 addObject:v22];
    }
    v10 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v15];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:v7];
}

void __102__HDSampleSyncEntity__predicateForSampleAgeWithMaximumObjectAgeByType_defaultMaxAge_sessionStartDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  if ([v5 count] == 1)
  {
    id v7 = [v5 anyObject];

    HDSampleEntityPredicateForDataType(v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v7;
  }
  else
  {
    HDSampleEntityPredicateForDataTypes(v5);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v8 = *(void **)(a1 + 32);
  [v6 doubleValue];
  double v10 = v9;

  id v11 = [v8 dateByAddingTimeInterval:-v10];
  id v12 = HDSampleEntityPredicateForEndDate(5);

  id v13 = *(void **)(a1 + 40);
  id v14 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v15 otherPredicate:v12];
  [v13 addObject:v14];
}

@end