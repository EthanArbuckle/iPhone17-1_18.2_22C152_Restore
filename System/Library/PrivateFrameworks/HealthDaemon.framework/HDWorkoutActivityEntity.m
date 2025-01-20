@interface HDWorkoutActivityEntity
+ (BOOL)_insertOrReplaceWorkoutActivity:(id)a3 shouldReplace:(BOOL)a4 ownerID:(unint64_t)a5 isPrimaryActivity:(BOOL)a6 database:(id)a7 error:(id *)a8;
+ (BOOL)enumerateActivityEntitiesForOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertPrimaryActivity:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)insertSubActivities:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)supportsNullableEndDate;
+ (Class)ownerEntityClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_allProperties;
+ (id)_numberProperty:(id)a3 primaryActivityOwnerID:(unint64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (id)_primaryActivityPredicateForOwnerID:(unint64_t)a3;
+ (id)_statisticsForWorkoutActivityWithPersistentId:(unint64_t)a3 workoutActivity:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)_workoutActivityFromRow:(HDSQLiteRow *)a3;
+ (id)activityEntityWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)activityTypeForPrimaryActivityOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)durationForPrimaryActivityOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)indices;
+ (id)primaryWorkoutActivityForOwnerID:(unint64_t)a3 database:(id)a4 error:(id *)a5;
+ (id)subActivitiesWithOwnerID:(unint64_t)a3 database:(id)a4 error:(id *)a5;
+ (id)subActivityEntityWithUUID:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
- (BOOL)setDuration:(double)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setMetadata:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)unitTest_validateInTransaction:(id)a3 error:(id *)a4;
- (id)UUIDInTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDWorkoutActivityEntity

+ (id)databaseTable
{
  return @"workout_activities";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  if ([a1 supportsNullableEndDate]) {
    result = (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__nullableEndDateDefinitions;
  }
  else {
    result = (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__nonNullableEndDateDefinitions_0;
  }
  *a3 = 12;
  return result;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"owner_id";
  v2 = objc_msgSend((id)objc_msgSend(a1, "ownerEntityClass"), "defaultForeignKey");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)indices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F65D28]);
  v4 = NSString;
  v5 = [a1 databaseTable];
  v6 = [v4 stringWithFormat:@"%@_owners", v5];
  v11 = @"owner_id";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v8 = (void *)[v3 initWithEntity:a1 name:v6 columns:v7];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

+ (BOOL)insertSubActivities:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (!objc_msgSend(a1, "_insertOrReplaceWorkoutActivity:shouldReplace:ownerID:isPrimaryActivity:database:error:", *(void *)(*((void *)&v19 + 1) + 8 * i), 0, a4, 0, v11, a6, (void)v19))
        {
          BOOL v17 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_11:

  return v17;
}

+ (BOOL)insertPrimaryActivity:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  return [a1 _insertOrReplaceWorkoutActivity:a3 shouldReplace:0 ownerID:a4 isPrimaryActivity:1 database:a5 error:a6];
}

+ (id)subActivitiesWithOwnerID:(unint64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = [NSNumber numberWithUnsignedLongLong:a3];
  id v12 = [v10 predicateWithProperty:@"owner_id" equalToValue:v11];

  uint64_t v13 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"is_primary_activity" equalToValue:MEMORY[0x1E4F1CC28]];
  uint64_t v14 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v12 otherPredicate:v13];
  uint64_t v15 = [a1 queryWithDatabase:v8 predicate:v14];
  v16 = [a1 _allProperties];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__HDWorkoutActivityEntity_subActivitiesWithOwnerID_database_error___block_invoke;
  v22[3] = &unk_1E62F7B80;
  id v24 = v9;
  id v25 = a1;
  id v23 = v8;
  id v17 = v9;
  id v18 = v8;
  LODWORD(a5) = [v15 enumeratePersistentIDsAndProperties:v16 error:a5 enumerationHandler:v22];

  if (a5) {
    long long v19 = v17;
  }
  else {
    long long v19 = 0;
  }
  id v20 = v19;

  return v20;
}

uint64_t __67__HDWorkoutActivityEntity_subActivitiesWithOwnerID_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = [*(id *)(a1 + 48) _workoutActivityFromRow:a4];
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v17 = 0;
  id v11 = [v9 _statisticsForWorkoutActivityWithPersistentId:a2 workoutActivity:v8 database:v10 error:&v17];
  id v12 = v17;
  uint64_t v13 = v12;
  if (v11) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  uint64_t v15 = v14;
  if (v14)
  {
    [v8 _setAllStatistics:v11];
    [*(id *)(a1 + 40) addObject:v8];
  }
  else if (a5)
  {
    *a5 = v12;
  }
  else
  {
    _HKLogDroppedError();
  }

  return v15;
}

+ (id)primaryWorkoutActivityForOwnerID:(unint64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__33;
  v31 = __Block_byref_object_dispose__33;
  id v32 = 0;
  id v9 = [a1 _primaryActivityPredicateForOwnerID:a3];
  uint64_t v10 = [a1 queryWithDatabase:v8 predicate:v9];
  id v11 = [a1 _allProperties];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __75__HDWorkoutActivityEntity_primaryWorkoutActivityForOwnerID_database_error___block_invoke;
  id v23 = &unk_1E62F7BA8;
  id v25 = &v27;
  id v26 = a1;
  id v12 = v8;
  id v24 = v12;
  LODWORD(v8) = [v10 enumeratePersistentIDsAndProperties:v11 error:a5 enumerationHandler:&v20];

  if (!v8)
  {
    uint64_t v13 = 0;
    goto LABEL_7;
  }
  uint64_t v13 = (void *)v28[5];
  if (v13)
  {
LABEL_7:
    id v18 = v13;
    goto LABEL_8;
  }
  BOOL v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v15 = [NSNumber numberWithUnsignedLongLong:a3];
  objc_msgSend(v14, "hk_error:format:", 118, @"Cannot find main activity for workout with persistent ID %@", v15, v20, v21, v22, v23);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v16;
  if (v16)
  {
    if (a5) {
      *a5 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v18 = 0;
LABEL_8:

  _Block_object_dispose(&v27, 8);

  return v18;
}

BOOL __75__HDWorkoutActivityEntity_primaryWorkoutActivityForOwnerID_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = [*(id *)(a1 + 48) _workoutActivityFromRow:a4];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = [*(id *)(a1 + 48) _statisticsForWorkoutActivityWithPersistentId:a2 workoutActivity:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) database:*(void *)(a1 + 32) error:a5];
  if (v11) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setAllStatistics:v11];
  }

  return v11 != 0;
}

+ (id)subActivityEntityWithUUID:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = NSNumber;
  id v12 = a5;
  id v13 = a3;
  BOOL v14 = [v11 numberWithUnsignedLongLong:a4];
  uint64_t v15 = [v10 predicateWithProperty:@"owner_id" equalToValue:v14];

  id v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"is_primary_activity" equalToValue:MEMORY[0x1E4F1CC28]];
  id v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:v13];

  v22[0] = v15;
  v22[1] = v16;
  v22[2] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  long long v19 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v18];
  uint64_t v20 = [a1 anyInDatabase:v12 predicate:v19 error:a6];

  return v20;
}

+ (id)activityEntityWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 databaseForEntityClass:a1];
  uint64_t v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:v8];

  id v11 = [a1 anyInDatabase:v9 predicate:v10 error:a5];

  return v11;
}

+ (BOOL)enumerateActivityEntitiesForOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = [a4 databaseForEntityClass:a1];
  id v12 = (void *)MEMORY[0x1E4F65D00];
  id v13 = [NSNumber numberWithUnsignedLongLong:a3];
  BOOL v14 = [v12 predicateWithProperty:@"owner_id" equalToValue:v13];

  uint64_t v15 = [a1 queryWithDatabase:v11 predicate:v14];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__HDWorkoutActivityEntity_enumerateActivityEntitiesForOwnerID_transaction_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E62F7BD0;
  id v19 = v10;
  id v20 = a1;
  id v16 = v10;
  LOBYTE(a5) = [v15 enumeratePersistentIDsAndProperties:0 error:a5 enumerationHandler:v18];

  return (char)a5;
}

uint64_t __100__HDWorkoutActivityEntity_enumerateActivityEntitiesForOwnerID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithPersistentID:a2];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v4;
}

+ (id)activityTypeForPrimaryActivityOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  return (id)[a1 _numberProperty:@"activity_type" primaryActivityOwnerID:a3 transaction:a4 error:a5];
}

+ (id)durationForPrimaryActivityOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  return (id)[a1 _numberProperty:@"duration" primaryActivityOwnerID:a3 transaction:a4 error:a5];
}

- (id)UUIDInTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 databaseForEntityClass:objc_opt_class()];

  v7 = [(HDSQLiteEntity *)self UUIDForProperty:@"uuid" database:v6];

  return v7;
}

- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 databaseForEntityClass:objc_opt_class()];

  v16[0] = @"end_date";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutActivityEntity_setEndDate_transaction_error___block_invoke;
  v14[3] = &unk_1E62F35C8;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v10 error:a5 bindingHandler:v14];

  return (char)a5;
}

void __56__HDWorkoutActivityEntity_setEndDate_transaction_error___block_invoke()
{
}

- (BOOL)setDuration:(double)a3 transaction:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [v8 databaseForEntityClass:objc_opt_class()];

  v13[0] = @"duration";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __57__HDWorkoutActivityEntity_setDuration_transaction_error___block_invoke;
  v12[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  *(double *)&v12[4] = a3;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v9 error:a5 bindingHandler:v12];

  return (char)a5;
}

void __57__HDWorkoutActivityEntity_setDuration_transaction_error___block_invoke()
{
}

- (BOOL)setMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 databaseForEntityClass:objc_opt_class()];

  v16[0] = @"metadata";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__HDWorkoutActivityEntity_setMetadata_transaction_error___block_invoke;
  v14[3] = &unk_1E62F35C8;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v10 error:a5 bindingHandler:v14];

  return (char)a5;
}

uint64_t __57__HDWorkoutActivityEntity_setMetadata_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (BOOL)unitTest_validateInTransaction:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__33;
  id v18 = __Block_byref_object_dispose__33;
  id v19 = 0;
  v7 = [v6 databaseForEntityClass:objc_opt_class()];
  v24[0] = @"lap_length";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __64__HDWorkoutActivityEntity_unitTest_validateInTransaction_error___block_invoke;
  v13[3] = &unk_1E62F7C18;
  v13[4] = &v20;
  v13[5] = &v14;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v13];

  if (*((unsigned char *)v21 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = (id)v15[5];
    id v11 = v10;
    BOOL v9 = v10 == 0;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __64__HDWorkoutActivityEntity_unitTest_validateInTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1C1879F20](a3, 0);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v7 + 40);
    id v8 = [v5 unarchivedObjectOfClass:v6 fromData:v4 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8 != 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

+ (id)_allProperties
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"owner_id";
  v4[2] = @"is_primary_activity";
  v4[3] = @"activity_type";
  v4[4] = @"location_type";
  v4[5] = @"swimming_location_type";
  v4[6] = @"lap_length";
  v4[7] = @"start_date";
  v4[8] = @"end_date";
  v4[9] = @"duration";
  v4[10] = @"metadata";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];

  return v2;
}

+ (BOOL)_insertOrReplaceWorkoutActivity:(id)a3 shouldReplace:(BOOL)a4 ownerID:(unint64_t)a5 isPrimaryActivity:(BOOL)a6 database:(id)a7 error:(id *)a8
{
  BOOL v12 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  uint64_t v16 = [v14 workoutConfiguration];
  id v17 = [a1 _allProperties];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __114__HDWorkoutActivityEntity__insertOrReplaceWorkoutActivity_shouldReplace_ownerID_isPrimaryActivity_database_error___block_invoke;
  v47[3] = &unk_1E62F7C40;
  id v18 = v14;
  id v48 = v18;
  unint64_t v50 = a5;
  BOOL v51 = a6;
  id v19 = v16;
  id v49 = v19;
  v42 = v15;
  v40 = a8;
  uint64_t v20 = [a1 insertOrReplaceEntity:v12 database:v15 properties:v17 error:a8 bindingHandler:v47];

  v41 = (void *)v20;
  if (v20)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v18 allStatistics];
    uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v36 = v19;
      uint64_t v39 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v44 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          id v25 = v18;
          id v26 = [v18 allStatistics];
          uint64_t v27 = [v26 objectForKeyedSubscript:v24];

          v28 = [_HDWorkoutStatistics alloc];
          uint64_t v29 = [v27 sumQuantity];
          uint64_t v30 = (uint64_t)v29;
          if (!v29)
          {
            uint64_t v30 = [v27 averageQuantity];
            v38 = (void *)v30;
          }
          v31 = [v27 minimumQuantity];
          id v32 = [v27 maximumQuantity];
          v33 = [(_HDWorkoutStatistics *)v28 initWithQuantityType:v24 quantity:v30 min:v31 max:v32];

          if (!v29) {
          BOOL v34 = +[HDWorkoutStatisticsEntity insertWorkoutStatistics:workoutActivityId:database:error:](HDWorkoutStatisticsEntity, "insertWorkoutStatistics:workoutActivityId:database:error:", v33, [v41 persistentID], v42, v40);
          }

          if (!v34)
          {
            LOBYTE(v20) = 0;
            id v18 = v25;
            goto LABEL_16;
          }
          id v18 = v25;
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      LOBYTE(v20) = 1;
LABEL_16:
      id v19 = v36;
    }
    else
    {
      LOBYTE(v20) = 1;
    }
  }
  return v20;
}

void __114__HDWorkoutActivityEntity__insertOrReplaceWorkoutActivity_shouldReplace_ownerID_isPrimaryActivity_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) UUID];
  MEMORY[0x1C1879EF0](a2, @"uuid", v4);

  MEMORY[0x1C1879E80](a2, @"owner_id", *(void *)(a1 + 48));
  MEMORY[0x1C1879E20](a2, @"is_primary_activity", *(unsigned __int8 *)(a1 + 56));
  MEMORY[0x1C1879E80](a2, @"activity_type", [*(id *)(a1 + 40) activityType]);
  MEMORY[0x1C1879E80](a2, @"location_type", [*(id *)(a1 + 40) locationType]);
  MEMORY[0x1C1879E80](a2, @"swimming_location_type", [*(id *)(a1 + 40) swimmingLocationType]);
  id v5 = [*(id *)(a1 + 40) lapLength];
  HDSQLiteBindSecureCodingObjectToProperty();

  uint64_t v6 = [*(id *)(a1 + 32) startDate];
  MEMORY[0x1C1879E40](a2, @"start_date", v6);

  uint64_t v7 = [*(id *)(a1 + 32) endDate];
  MEMORY[0x1C1879E40](a2, @"end_date", v7);

  [*(id *)(a1 + 32) duration];
  MEMORY[0x1C1879E50](a2, @"duration");
  id v8 = [*(id *)(a1 + 32) metadata];
  HDSQLiteBindSecureCodingObjectToProperty();
}

+ (id)_workoutActivityFromRow:(HDSQLiteRow *)a3
{
  id v3 = HDSQLiteColumnWithNameAsUUID();
  id v4 = objc_alloc_init(MEMORY[0x1E4F2B768]);
  [v4 setActivityType:HDSQLiteColumnWithNameAsInt64()];
  [v4 setLocationType:HDSQLiteColumnWithNameAsInt64()];
  [v4 setSwimmingLocationType:HDSQLiteColumnWithNameAsInt64()];
  objc_opt_class();
  id v5 = HDSQLiteColumnWithNameAsObject();
  [v4 setLapLength:v5];

  uint64_t v6 = HDSQLiteColumnWithNameAsDate();
  uint64_t v7 = HDSQLiteColumnWithNameAsDate();
  HDSQLiteColumnWithNameAsDouble();
  double v9 = v8;
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  id v11 = HDSQLiteColumnWithNameAsObjectWithClasses();
  id v12 = objc_alloc(MEMORY[0x1E4F2B720]);
  id v13 = (void *)[v12 _initWithUUID:v3 workoutConfiguration:v4 startDate:v6 endDate:v7 workoutEvents:MEMORY[0x1E4F1CBF0] startsPaused:0 duration:v9 metadata:v11 statisticsPerType:0];

  return v13;
}

+ (id)_statisticsForWorkoutActivityWithPersistentId:(unint64_t)a3 workoutActivity:(id)a4 database:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__HDWorkoutActivityEntity__statisticsForWorkoutActivityWithPersistentId_workoutActivity_database_error___block_invoke;
  v18[3] = &unk_1E62F7C68;
  id v19 = v9;
  id v20 = v12;
  id v13 = v12;
  id v14 = v9;
  LODWORD(a6) = +[HDWorkoutStatisticsEntity enumerateWorkoutStatisticsForActivityId:a3 database:v11 error:a6 handler:v18];

  if (a6) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __104__HDWorkoutActivityEntity__statisticsForWorkoutActivityWithPersistentId_workoutActivity_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F2B5B0]);
  id v5 = [v3 quantityType];
  uint64_t v6 = [*(id *)(a1 + 32) startDate];
  uint64_t v7 = [*(id *)(a1 + 32) endDate];
  double v8 = (void *)[v4 initWithDataType:v5 startDate:v6 endDate:v7];

  id v9 = [v3 quantityType];
  uint64_t v10 = [v9 aggregationStyle];

  id v11 = [v3 quantity];
  if (v10) {
    [v8 setAverageQuantity:v11];
  }
  else {
    [v8 setSumQuantity:v11];
  }

  id v12 = [v3 min];
  [v8 setMinimumQuantity:v12];

  id v13 = [v3 max];
  [v8 setMaximumQuantity:v13];

  id v14 = *(void **)(a1 + 40);
  id v15 = [v3 quantityType];
  [v14 setObject:v8 forKeyedSubscript:v15];

  return 1;
}

+ (BOOL)supportsNullableEndDate
{
  return 0;
}

+ (id)_primaryActivityPredicateForOwnerID:(unint64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F65D00];
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [v3 predicateWithProperty:@"owner_id" equalToValue:v4];

  uint64_t v6 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"is_primary_activity" equalToValue:MEMORY[0x1E4F1CC38]];
  uint64_t v7 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v5 otherPredicate:v6];

  return v7;
}

+ (id)_numberProperty:(id)a3 primaryActivityOwnerID:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__33;
  id v25 = __Block_byref_object_dispose__33;
  id v26 = 0;
  id v12 = [v11 databaseForEntityClass:a1];
  id v13 = NSString;
  id v14 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v15 = [v13 stringWithFormat:@"SELECT %@ FROM %@ WHERE (%@=1) AND (%@=?)", v10, v14, @"is_primary_activity", @"owner_id"];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke;
  v20[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke_2;
  v19[3] = &unk_1E62F3640;
  v19[4] = &v21;
  if ([v12 executeSQL:v15 error:a6 bindingHandler:v20 enumerationHandler:v19]) {
    id v16 = (void *)v22[5];
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  _Block_object_dispose(&v21, 8);

  return v17;
}

uint64_t __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end