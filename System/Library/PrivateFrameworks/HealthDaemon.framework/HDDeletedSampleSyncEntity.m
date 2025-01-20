@interface HDDeletedSampleSyncEntity
+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)supportsSyncToInitialShard;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_predicateForSyncSession:(id)a3;
+ (int)nanoSyncObjectType;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDDeletedSampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 19;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:19];
}

+ (Class)_syncedSampleTypeClass
{
  return 0;
}

+ (id)_predicateForSyncSession:(id)a3
{
  v74[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = HDDataEntityPredicateForType(2);
  v5 = [v3 syncPredicate];
  v6 = [v5 dateInterval];

  v68 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  id v65 = v3;
  v7 = v4;
  v8 = [v6 endDate];
  uint64_t v9 = HDSampleEntityPredicateForStartDate(4);

  v10 = [v6 startDate];
  v11 = [v10 dateByAddingTimeInterval:-*MEMORY[0x1E4F2A9C8]];
  v12 = HDSampleEntityPredicateForStartDate(6);

  v13 = [v6 startDate];
  v14 = HDSampleEntityPredicateForEndDate(6);

  v15 = (void *)MEMORY[0x1E4F65D08];
  v64 = (void *)v9;
  v74[0] = v9;
  v74[1] = v12;
  v74[2] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
  v17 = [v15 predicateMatchingAllPredicates:v16];

  v18 = [v6 endDate];
  v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  if (![v18 isEqualToDate:v19]) {
    goto LABEL_5;
  }
  v20 = [v6 startDate];
  v21 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v22 = [v20 isEqualToDate:v21];

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E4F65D08];
    v18 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"start_date"];
    v73[0] = v18;
    v19 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"end_date"];
    v73[1] = v19;
    v73[2] = v17;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    uint64_t v25 = [v23 predicateMatchingAnyPredicates:v24];

    v17 = (void *)v25;
LABEL_5:
  }
  v26 = (void *)MEMORY[0x1E4F65D08];
  v72[0] = v7;
  v72[1] = v17;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  v4 = [v26 predicateMatchingAllPredicates:v27];

  id v3 = v65;
LABEL_8:
  v28 = [v3 syncPredicate];
  v29 = [v28 defaultMaximumTombstoneAge];

  if (v29)
  {
    v66 = v4;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v31 = (void *)MEMORY[0x1E4F1C9C8];
    [v29 doubleValue];
    v33 = [v31 dateWithTimeIntervalSinceNow:-v32];
    v34 = HDDeletedObjectPredicateForDeletionDate(6);
    [v30 addObject:v34];

    v35 = v3;
    v36 = [MEMORY[0x1E4F2B2C0] activityGoalScheduleType];
    v71[0] = v36;
    v37 = [MEMORY[0x1E4F2B2C0] pauseRingsScheduleType];
    v71[1] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
    v39 = HDSampleEntityPredicateForDataTypes(v38);
    v63 = v30;
    [v30 addObject:v39];

    v62 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v30];
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v41 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"end_date"];
    [v40 addObject:v41];

    v42 = [v3 syncPredicate];
    v43 = [v42 maximumObjectAgeByType];
    v44 = [v3 syncPredicate];
    v45 = [v44 defaultMaximumObjectAge];
    v46 = [v3 startDate];
    v47 = +[HDSampleSyncEntity _predicateForSampleAgeWithMaximumObjectAgeByType:defaultMaxAge:sessionStartDate:]((uint64_t)a1, v43, v45, v46);
    objc_msgSend(v40, "hk_addNonNilObject:", v47);

    v48 = (void *)MEMORY[0x1E4F65D58];
    v49 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"data_type" equalToValue:&unk_1F17EF120];
    v50 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    v51 = [v48 compoundPredicateWithPredicate:v49 otherPredicate:v50];
    [v40 addObject:v51];

    v52 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v53 = [MEMORY[0x1E4F2B3B8] heartRateType];
    v70 = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    v55 = [v35 startDate];
    v56 = objc_msgSend(v52, "hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:", v54, v55, *MEMORY[0x1E4F2AAF0]);
    [v40 addObject:v56];

    v4 = v66;
    v57 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v40];
    v58 = (void *)MEMORY[0x1E4F65D08];
    v69[0] = v66;
    v69[1] = v62;
    v69[2] = v57;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
    id v60 = [v58 predicateMatchingAllPredicates:v59];

    id v3 = v35;
  }
  else
  {
    id v60 = v4;
  }

  return v60;
}

+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDDataSyncUtilities insertDeletedObjectsFromCodableObjectCollection:a3 syncEntityClass:a1 syncStore:a4 profile:a5 error:a6];
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  v7 = objc_msgSend(v6, "hd_predicateForDeletedObjectsCreatedBeforeDate:minusDays:", v5, *MEMORY[0x1E4F299B8]);

  return v7;
}

+ (BOOL)supportsSyncToInitialShard
{
  return 1;
}

@end