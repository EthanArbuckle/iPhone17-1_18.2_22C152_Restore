@interface HDFitnessFriendActivitySnapshotEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)enumerateSnapshotsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)isConcreteEntity;
+ (BOOL)supportsObjectMerging;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDFitnessFriendActivitySnapshotEntity

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[19] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDFitnessFriendActivitySnapshotEntity.m", 121, @"Subclasses must override %s", "+[HDFitnessFriendActivitySnapshotEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"friend_uuid";
  v27[2] = @"active_hours";
  v27[3] = @"active_hours_goal";
  v27[4] = @"brisk_minutes";
  v27[5] = @"brisk_minutes_goal";
  v27[6] = @"energy_burned";
  v27[7] = @"energy_burned_goal";
  v27[8] = @"move_minutes";
  v27[9] = @"move_minutes_goal";
  v27[10] = @"activity_move_mode";
  v27[11] = @"walk_run_distance";
  v27[12] = @"steps";
  v27[13] = @"snapshot_index";
  v27[14] = @"source_uuid";
  v27[15] = @"uploaded_date";
  v27[16] = @"vulcan_count";
  v27[17] = @"vulcan_condition";
  v27[18] = @"timezone_offset";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:19];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__HDFitnessFriendActivitySnapshotEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E62F3A88;
  id v25 = v13;
  id v26 = v12;
  id v17 = v12;
  id v18 = v13;
  v19 = [a1 insertOrReplaceEntity:1 database:v14 properties:v16 error:a7 bindingHandler:v24];

  if (v19) {
    v20 = v18;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __103__HDFitnessFriendActivitySnapshotEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) friendUUID];
  MEMORY[0x1C1879EF0](a2, @"friend_uuid", v4);

  [*(id *)(a1 + 40) activeHours];
  MEMORY[0x1C1879E50](a2, @"active_hours");
  [*(id *)(a1 + 40) activeHoursGoal];
  MEMORY[0x1C1879E50](a2, @"active_hours_goal");
  [*(id *)(a1 + 40) briskMinutes];
  MEMORY[0x1C1879E50](a2, @"brisk_minutes");
  [*(id *)(a1 + 40) briskMinutesGoal];
  MEMORY[0x1C1879E50](a2, @"brisk_minutes_goal");
  [*(id *)(a1 + 40) energyBurned];
  MEMORY[0x1C1879E50](a2, @"energy_burned");
  [*(id *)(a1 + 40) energyBurnedGoal];
  MEMORY[0x1C1879E50](a2, @"energy_burned_goal");
  [*(id *)(a1 + 40) mmv];
  MEMORY[0x1C1879E50](a2, @"move_minutes");
  [*(id *)(a1 + 40) mmg];
  MEMORY[0x1C1879E50](a2, @"move_minutes_goal");
  MEMORY[0x1C1879E80](a2, @"activity_move_mode", [*(id *)(a1 + 40) amm]);
  [*(id *)(a1 + 40) stepCount];
  MEMORY[0x1C1879E50](a2, @"steps");
  [*(id *)(a1 + 40) walkingAndRunningDistance];
  MEMORY[0x1C1879E50](a2, @"walk_run_distance");
  MEMORY[0x1C1879E80](a2, @"snapshot_index", [*(id *)(a1 + 40) snapshotIndex]);
  v5 = [*(id *)(a1 + 40) sourceUUID];
  MEMORY[0x1C1879EF0](a2, @"source_uuid", v5);

  v6 = [*(id *)(a1 + 40) snapshotUploadedDate];
  MEMORY[0x1C1879E40](a2, @"uploaded_date", v6);

  [*(id *)(a1 + 40) pushCount];
  MEMORY[0x1C1879E50](a2, @"vulcan_count");
  MEMORY[0x1C1879E80](a2, @"vulcan_condition", [*(id *)(a1 + 40) wheelchairUse]);
  v7 = [*(id *)(a1 + 40) timeZoneOffsetFromUTCForNoon];

  if (!v7)
  {
    JUMPOUT(0x1C1879E90);
  }
  id v8 = [*(id *)(a1 + 40) timeZoneOffsetFromUTCForNoon];
  MEMORY[0x1C1879E80](a2, @"timezone_offset", [v8 integerValue]);
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"fitness_friend_activity_snapshots";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 19;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_54;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"friend_uuid";
  v4[1] = @"snapshot_index";
  v4[2] = @"source_uuid";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDFitnessFriendActivitySnapshotEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v32 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, id, id *))a8;
  id v17 = [v13 friendUUID];
  id v18 = HDFitnessFriendActivitySnapshotEntityPredicateForFriendUUID();

  v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "snapshotIndex"));
  v20 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"snapshot_index" equalToValue:v19];

  id v21 = (void *)MEMORY[0x1E4F65D00];
  v22 = [v13 sourceUUID];
  v23 = _HDSQLiteValueForUUID();
  v24 = [v21 predicateWithProperty:@"source_uuid" equalToValue:v23];

  id v25 = (void *)MEMORY[0x1E4F65D08];
  v45[0] = v18;
  v45[1] = v20;
  v45[2] = v24;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v27 = [v25 predicateMatchingAllPredicates:v26];

  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__107;
  v39 = __Block_byref_object_dispose__107;
  id v40 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __108__HDFitnessFriendActivitySnapshotEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke;
  v34[3] = &unk_1E6301DD8;
  v34[4] = &v41;
  v34[5] = &v35;
  [a1 deleteSamplesWithPredicate:v27 limit:0 generateDeletedObjects:0 transaction:v15 profile:v14 recursiveDeleteAuthorizationBlock:0 completionHandler:v34];
  if (*((unsigned char *)v42 + 24))
  {
    v28 = v16[2](v16, v13, a7);
  }
  else
  {
    id v29 = (id)v36[5];
    v30 = v29;
    if (v29)
    {
      if (a7) {
        *a7 = v29;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v28 = 0;
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);

  return v28;
}

void __108__HDFitnessFriendActivitySnapshotEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 fitnessFriendActivitySnapshots];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addFitnessFriendActivitySnapshots:a3];
  }
  return a3 != 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)enumerateSnapshotsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  v24 = a6;
  if (a4)
  {
    id v14 = *a4;
    uint64_t v15 = *MEMORY[0x1E4F65C70];
    if (v14)
    {
      v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65C70] greaterThanValue:v14];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    id v14 = 0;
    v16 = 0;
    uint64_t v15 = *MEMORY[0x1E4F65C70];
  }
  id v17 = +[HDDataEntity entityEnumeratorWithProfile:v12];
  id v18 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v16];
  [v17 setPredicate:v18];

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v31 = [v14 longLongValue];
  v19 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:v15 entityClass:objc_opt_class() ascending:1];
  v32[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v17 setOrderingTerms:v20];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__HDFitnessFriendActivitySnapshotEntity_enumerateSnapshotsWithPredicate_anchor_profile_error_handler___block_invoke;
  v25[3] = &unk_1E6301DB0;
  v27 = &v28;
  id v21 = v13;
  id v26 = v21;
  char v22 = [v17 enumerateWithError:v24 handler:v25];
  if (a4)
  {
    *a4 = [NSNumber numberWithLongLong:v29[3]];
  }

  _Block_object_dispose(&v28, 8);
  return v22;
}

uint64_t __102__HDFitnessFriendActivitySnapshotEntity_enumerateSnapshotsWithPredicate_anchor_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 <= a3) {
    uint64_t v4 = a3;
  }
  *(void *)(v3 + 24) = v4;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end