@interface HDWorkoutEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)copySampleAssociationsFromWorkout:(id)a3 toWorkout:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)enumerateCondensedWorkoutsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)isConcreteEntity;
+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (BOOL)supportsObjectMerging;
+ (BOOL)workoutActivityType:(unint64_t *)a3 associatedWithRouteUUID:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_codableCondensedWorkoutProperties;
+ (id)_primaryActivityJoinClause;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)joinClausesForProperty:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8;
+ (id)orderingTermForSortDescriptor:(id)a3;
- (BOOL)getCondenserVersion:(int64_t *)a3 date:(id *)a4 profile:(id)a5 error:(id *)a6;
- (BOOL)isCondenserVersionLessThan:(int64_t)a3 transaction:(id)a4;
- (BOOL)updateCondenserVersion:(int64_t)a3 date:(id)a4 transaction:(id)a5 error:(id *)a6;
- (id)codableCondensedWorkoutWithTransaction:(id)a3 error:(id *)a4;
- (id)mainWorkoutActivityTypeWithTransaction:(id)a3 error:(id *)a4;
- (id)totalDistanceInCanonicalUnitWithTransaction:(id)a3 error:(id *)a4;
- (id)workoutDurationWithTransaction:(id)a3 error:(id *)a4;
- (id)workoutStartDateWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDWorkoutEntity

+ (id)databaseTable
{
  return @"workouts";
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDWorkoutEntity.m", 131, @"Subclasses must override %s", "+[HDWorkoutEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v28[3] = &unk_1E62F2900;
  id v16 = v14;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  int v18 = [v13 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_1 error:a7 SQLGenerator:v31 bindingHandler:v28 enumerationHandler:0];
  v19 = 0;
  if (v18)
  {
    v20 = [v17 _subActivities];
    BOOL v21 = +[HDWorkoutActivityEntity insertSubActivities:ownerID:database:error:](HDWorkoutActivityEntity, "insertSubActivities:ownerID:database:error:", v20, [v16 longLongValue], v13, a7);

    if (v21)
    {
      v22 = [v17 _primaryActivity];

      v19 = v16;
      if (v22)
      {
        v23 = [v17 _primaryActivity];
        BOOL v24 = +[HDWorkoutActivityEntity insertPrimaryActivity:ownerID:database:error:](HDWorkoutActivityEntity, "insertPrimaryActivity:ownerID:database:error:", v23, [v16 longLongValue], v13, a7);

        if (v24) {
          v19 = v16;
        }
        else {
          v19 = 0;
        }
      }
    }
    else
    {
      v19 = 0;
    }
  }
  id v25 = v19;

  return v25;
}

id __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)", v2, @"data_id", @"goal_type", @"total_distance", @"goal", 0];

  return v3;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addWorkouts:a3];
  }
  return a3 != 0;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  uint64_t v6 = [v4 ascending];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2AB50]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"activities.duration";
LABEL_11:
    uint64_t v10 = [v7 orderingTermWithProperty:v9 entityClass:v8 ascending:v6];
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2AB58]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"total_distance";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2AB60]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"active_energy.quantity";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2AB70]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"swimming_strokes.quantity";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2AB68]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"flights_climbed.quantity";
    goto LABEL_11;
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
  uint64_t v10 = objc_msgSendSuper2(&v13, sel_orderingTermForSortDescriptor_, v4);
LABEL_12:
  v11 = (void *)v10;

  return v11;
}

+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v8, sel_deleteStatementsForRelatedEntitiesWithTransaction_, v3);
  v5 = objc_msgSend(v4, "mutableCopy", v8.receiver, v8.super_class);

  uint64_t v6 = +[HDWorkoutEventEntity deleteStatementForWorkoutEventsWithTransaction:v3];

  [v5 addObject:v6];

  return v5;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_48;
}

uint64_t __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) _goalType]);
  id v4 = [*(id *)(a1 + 40) totalDistance];

  if (v4)
  {
    v5 = [*(id *)(a1 + 40) totalDistance];
    uint64_t v6 = _HKWorkoutCanonicalDistanceUnit();
    [v5 doubleValueForUnit:v6];
    double v8 = v7;

    sqlite3_bind_double(a2, 3, v8);
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  uint64_t v9 = [*(id *)(a1 + 40) _goal];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [*(id *)(a1 + 40) _goalType],
        int IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal(),
        v10,
        IsValidForGoal))
  {
    id v12 = [*(id *)(a1 + 40) _goal];
    [*(id *)(a1 + 40) _goalType];
    objc_super v13 = _HKWorkoutCanonicalUnitForGoalType();
    [v12 doubleValueForUnit:v13];
    double v15 = v14;

    return sqlite3_bind_double(a2, 4, v15);
  }
  else
  {
    return sqlite3_bind_null(a2, 4);
  }
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 workouts];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  double v15 = [[_HDWorkoutEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)joinClausesForProperty:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"activities.activity_type"] & 1) != 0
    || [v4 isEqualToString:@"activities.duration"])
  {
    +[HDWorkoutEntity _primaryActivityJoinClause]();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  }
  else
  {
    v25[0] = @"active_energy.quantity";
    v25[1] = @"basal_energy.quantity";
    v26[0] = @"active_energy";
    v26[1] = @"basal_energy";
    v25[2] = @"swimming_strokes.quantity";
    v25[3] = @"flights_climbed.quantity";
    v26[2] = @"swimming_strokes";
    v26[3] = @"flights_climbed";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v5);
          }
          if ([v4 isEqualToString:*(void *)(*((void *)&v20 + 1) + 8 * i)])
          {
            id v13 = [v5 objectForKeyedSubscript:v4];
            id v14 = +[HDWorkoutEntity _primaryActivityJoinClause]();
            id v15 = v4;
            self;
            if ([v15 isEqualToString:@"active_energy.quantity"])
            {
              uint64_t v16 = 10;
            }
            else if ([v15 isEqualToString:@"basal_energy.quantity"])
            {
              uint64_t v16 = 9;
            }
            else if ([v15 isEqualToString:@"swimming_strokes.quantity"])
            {
              uint64_t v16 = 111;
            }
            else if ([v15 isEqualToString:@"flights_climbed.quantity"])
            {
              uint64_t v16 = 12;
            }
            else
            {
              [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Property cannot be matched to a data type"];
              uint64_t v16 = -1;
            }

            id v17 = [NSString stringWithFormat:@"%@.%@ = %ld", v13, 0x1F1729EC0, v16];
            int v18 = [MEMORY[0x1E4F65D38] leftJoinClauseFromTable:@"activities" toTargetEntity:objc_opt_class() as:v13 localReference:*MEMORY[0x1E4F65C70] targetKey:0x1F1729EA0 additionalPredicate:v17];
            double v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v14, v18, 0);

            goto LABEL_5;
          }
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
    uint64_t v6 = objc_msgSendSuper2(&v19, sel_joinClausesForProperty_, v4);
  }
  double v7 = (void *)v6;
LABEL_5:

  return v7;
}

+ (id)_primaryActivityJoinClause
{
  self;
  v0 = [NSString stringWithFormat:@"(%@ = 1)", @"is_primary_activity"];
  v1 = (void *)MEMORY[0x1E4F65D38];
  v2 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v3 = [v1 leftJoinClauseFromTable:v2 toTargetEntity:objc_opt_class() as:@"activities" localReference:*MEMORY[0x1E4F65C70] targetKey:@"owner_id" additionalPredicate:v0];

  return v3;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)copySampleAssociationsFromWorkout:(id)a3 toWorkout:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDAssociationEntity copyAssociationsFromObject:a3 toObject:a4 profile:a5 error:a6];
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v22[0] = @"duration";
  v22[1] = @"total_energy_burned";
  v23[0] = @"activities.duration";
  v23[1] = @"active_energy.quantity";
  v22[2] = @"total_basal_energy_burned";
  v22[3] = @"total_w_steps";
  v23[2] = @"basal_energy.quantity";
  v23[3] = @"swimming_strokes.quantity";
  v22[4] = @"total_flights_climbed";
  v23[4] = @"flights_climbed.quantity";
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 dictionaryWithObjects:v23 forKeys:v22 count:5];
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];
  uint64_t v16 = (void *)v15;
  if (v15) {
    id v17 = (void *)v15;
  }
  else {
    id v17 = v13;
  }
  id v18 = v17;

  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
  objc_super v19 = objc_msgSendSuper2(&v21, sel_maxValueForProperty_predicate_database_error_, v18, v12, v11, a6);

  return v19;
}

+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"HDWorkoutEntity.m", 305, @"Invalid parameter not satisfying: %@", @"[existingObject isKindOfClass:[HKWorkout class]]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, a1, @"HDWorkoutEntity.m", 306, @"Invalid parameter not satisfying: %@", @"[replacementObject isKindOfClass:[HKWorkout class]]" object file lineNumber description];
  }
  uint64_t v16 = a9;
  id v17 = v13;
  id v52 = v14;
  id v18 = [v52 _subActivities];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v20 = [v17 _subActivities];
    uint64_t v51 = [v20 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v51)
    {
      uint64_t v50 = *(void *)v59;
      id v47 = v17;
      id v48 = v15;
      id obj = v20;
      while (2)
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v59 != v50) {
            objc_enumerationMutation(obj);
          }
          long long v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          long long v23 = [v22 startDate];
          BOOL v24 = [v22 endDate];
          id v25 = [v17 UUID];
          v26 = HDReferenceForAssociatableObject(v22);
          v27 = +[HDAssociationEntity objectUUIDsAssociatedWithObjectUUID:v25 subObjectReference:v26 excludeDeleted:1 profile:v15 error:v16];

          if ([v27 count])
          {
            v53 = v27;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            v28 = [v52 _subActivities];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v55;
LABEL_14:
              uint64_t v32 = 0;
              while (1)
              {
                if (*(void *)v55 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = *(void **)(*((void *)&v54 + 1) + 8 * v32);
                v34 = [v33 startDate];
                v35 = [v33 endDate];
                [v23 timeIntervalSinceDate:v34];
                double v37 = fabs(v36);
                [v24 timeIntervalSinceDate:v35];
                if (v37 <= 0.001 && fabs(v38) <= 0.001) {
                  break;
                }

                if (v30 == ++v32)
                {
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
                  if (v30) {
                    goto LABEL_14;
                  }
                  goto LABEL_21;
                }
              }
              v39 = [v52 UUID];
              v40 = HDReferenceForAssociatableObject(v33);
              v27 = v53;
              id v15 = v48;
              BOOL v49 = +[HDAssociationEntity associateSampleUUIDs:v53 withSampleUUID:v39 type:1 destinationSubObjectReference:v40 lastInsertedEntityID:0 profile:v48 error:a9];

              uint64_t v16 = a9;
              id v17 = v47;
              if (v49) {
                goto LABEL_23;
              }

              char v42 = 0;
              v41 = obj;
              goto LABEL_29;
            }
LABEL_21:

            id v17 = v47;
            id v15 = v48;
            uint64_t v16 = a9;
            v27 = v53;
          }
LABEL_23:
        }
        long long v20 = obj;
        uint64_t v51 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }
  }
  if (+[HDAssociationEntity copyAssociationsFromObject:v17 toObject:v52 type:1 profile:v15 error:v16])
  {
    v41 = [v15 dataManager];
    id v62 = v17;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
    char v42 = [v41 deleteDataObjects:v23 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:v16];
LABEL_29:
  }
  else
  {
    char v42 = 0;
  }

  return v42;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v43 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = 0;
    goto LABEL_35;
  }
  id v42 = v14;
  id v18 = [v42 _primaryActivity];

  if (v18)
  {
    v41 = [v16 databaseForEntityClass:objc_opt_class()];
    uint64_t v54 = 0;
    long long v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    id v53 = 0;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke;
    v52[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v52[4] = a1;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_2;
    v50[3] = &unk_1E62F43C8;
    id v19 = v42;
    id v51 = v19;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_3;
    v49[3] = &unk_1E62F3640;
    v49[4] = &v54;
    char v20 = [v41 executeCachedStatementForKey:&mergeDataObject_provenance_profile_transaction_error_insertHandler__searchKey error:&v53 SQLGenerator:v52 bindingHandler:v50 enumerationHandler:v49];
    id v21 = v53;
    long long v22 = v21;
    if (v20)
    {
      uint64_t v23 = v55[3];
      id v48 = v21;
      id v24 = +[HDWorkoutActivityEntity primaryWorkoutActivityForOwnerID:v23 database:v41 error:&v48];
      id v25 = v48;

      if (v24)
      {
        v26 = [NSNumber numberWithUnsignedLongLong:v55[3]];
LABEL_33:

        _Block_object_dispose(&v54, 8);
        goto LABEL_34;
      }
      if (v25 && (objc_msgSend(v25, "hk_isObjectNotFoundError") & 1) == 0)
      {
        id v34 = v25;
        id v25 = v34;
        if (a7) {
          *a7 = v34;
        }
        else {
          _HKLogDroppedError();
        }
      }
      else
      {
        v28 = [v19 _primaryActivity];
        uint64_t v29 = v55[3];
        id v47 = v25;
        BOOL v30 = +[HDWorkoutActivityEntity insertPrimaryActivity:v28 ownerID:v29 database:v41 error:&v47];
        id v40 = v47;

        if (v30)
        {
          v58[0] = @"total_distance";
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
          uint64_t v31 = [NSNumber numberWithUnsignedLongLong:v55[3]];
          double v38 = HDDataEntityPredicateForRowID((uint64_t)v31, 1);

          id v46 = v40;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_4;
          v44[3] = &unk_1E62F35C8;
          id v45 = v19;
          char v32 = [a1 updateProperties:v39 predicate:v38 database:v41 error:&v46 bindingHandler:v44];
          id v25 = v46;

          if (v32)
          {
            v26 = [NSNumber numberWithUnsignedLongLong:v55[3]];
          }
          else
          {
            id v35 = v25;
            double v36 = v35;
            if (v35)
            {
              if (a7) {
                *a7 = v35;
              }
              else {
                _HKLogDroppedError();
              }
            }

            v26 = 0;
          }

          id v24 = 0;
          goto LABEL_33;
        }
        id v33 = v40;
        id v25 = v33;
        if (v33)
        {
          if (a7) {
            *a7 = v33;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
      id v24 = 0;
    }
    else
    {
      id v27 = v21;
      id v24 = v27;
      if (v27)
      {
        if (a7)
        {
          id v24 = v27;
          v26 = 0;
          *a7 = v24;
        }
        else
        {
          _HKLogDroppedError();
          v26 = 0;
        }
        id v25 = v24;
        goto LABEL_33;
      }
      id v25 = 0;
    }
    v26 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 1401, @"Ignoring synced workout for merge because it does not have a primary activity");
  v26 = 0;
LABEL_34:

LABEL_35:

  return v26;
}

id __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v4 = [v1 stringWithFormat:@"SELECT %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@=?", @"data_id", v2, v3, @"data_id", @"uuid"];

  return v4;
}

void __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) totalDistance];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) totalDistance];
    id v4 = _HKWorkoutCanonicalDistanceUnit();
    [v3 doubleValueForUnit:v4];

    JUMPOUT(0x1C1879E50);
  }

  JUMPOUT(0x1C1879E90);
}

- (BOOL)updateCondenserVersion:(int64_t)a3 date:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v20[0] = @"condenser_version";
  v20[1] = @"condenser_date";
  id v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a5;
  id v13 = [v11 arrayWithObjects:v20 count:2];
  id v14 = [v12 databaseForEntity:self];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__HDWorkoutEntity_updateCondenserVersion_date_transaction_error___block_invoke;
  v17[3] = &unk_1E62F67E8;
  id v18 = v10;
  int64_t v19 = a3;
  id v15 = v10;
  LOBYTE(a6) = [(HDSQLiteEntity *)self updateProperties:v13 database:v14 error:a6 bindingHandler:v17];

  return (char)a6;
}

void __65__HDWorkoutEntity_updateCondenserVersion_date_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"condenser_version", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E40);
}

- (BOOL)isCondenserVersionLessThan:(int64_t)a3 transaction:(id)a4
{
  uint64_t v6 = [a4 databaseForEntity:self];
  double v7 = [(HDSQLiteEntity *)self numberForProperty:@"condenser_version" database:v6];

  if (v7) {
    BOOL v8 = [v7 integerValue] < a3;
  }
  else {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)getCondenserVersion:(int64_t *)a3 date:(id *)a4 profile:(id)a5 error:(id *)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = -1;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int64_t v19 = __Block_byref_object_copy__85;
  char v20 = __Block_byref_object_dispose__85;
  id v21 = 0;
  v26[0] = @"condenser_version";
  v26[1] = @"condenser_date";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v12 = [v10 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__HDWorkoutEntity_getCondenserVersion_date_profile_error___block_invoke;
  v15[3] = &unk_1E62F7C18;
  v15[4] = &v22;
  v15[5] = &v16;
  BOOL v13 = [(HDHealthEntity *)self getValuesForProperties:v11 healthDatabase:v12 error:a6 handler:v15];

  if (v13)
  {
    if (a3) {
      *a3 = v23[3];
    }
    if (a4) {
      *a4 = (id) v17[5];
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __58__HDWorkoutEntity_getCondenserVersion_date_profile_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  uint64_t v2 = HDSQLiteColumnWithNameAsDate();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)enumerateCondensedWorkoutsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a4 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke;
  v16[3] = &unk_1E62FB698;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

uint64_t __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (void *)MEMORY[0x1E4F65D08];
  id v5 = (void *)MEMORY[0x1E4F65D48];
  id v6 = a2;
  double v7 = [v5 isNotNullPredicateWithProperty:@"condenser_version"];
  uint64_t v24 = [v4 compoundPredicateWithPredicate:v7 otherPredicate:*(void *)(a1 + 32)];

  BOOL v8 = *(void **)(a1 + 48);
  uint64_t v9 = [v6 protectedDatabase];

  id v10 = HDWorkoutEntityOrderingTermsForCondenserDate();
  uint64_t v23 = [v8 queryWithDatabase:v9 predicate:v24 limit:0 orderingTerms:v10 groupBy:0];

  id v11 = +[HDWorkoutEntity _codableCondensedWorkoutProperties]();
  uint64_t v12 = [v11 indexOfObject:*MEMORY[0x1E4F65C70]];
  uint64_t v13 = [v11 indexOfObject:@"uuid"];
  uint64_t v14 = [v11 indexOfObject:@"creation_date"];
  uint64_t v15 = [v11 indexOfObject:@"start_date"];
  uint64_t v16 = [v11 indexOfObject:@"end_date"];
  uint64_t v17 = [v11 indexOfObject:@"activities.duration"];
  uint64_t v18 = [v11 indexOfObject:@"activities.activity_type"];
  uint64_t v19 = [v11 indexOfObject:@"condenser_version"];
  uint64_t v20 = [v11 indexOfObject:@"condenser_date"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke_2;
  void v26[3] = &unk_1E62FF310;
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  uint64_t v30 = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v17;
  uint64_t v34 = v18;
  uint64_t v35 = v19;
  uint64_t v36 = v20;
  id v27 = *(id *)(a1 + 40);
  uint64_t v21 = [v23 enumerateProperties:v11 error:a3 enumerationHandler:v26];

  return v21;
}

+ (id)_codableCondensedWorkoutProperties
{
  v2[9] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = *MEMORY[0x1E4F65C70];
  v2[1] = @"uuid";
  v2[2] = @"creation_date";
  v2[3] = @"start_date";
  v2[4] = @"end_date";
  v2[5] = @"activities.duration";
  v2[6] = @"activities.activity_type";
  v2[7] = @"condenser_version";
  v2[8] = @"condenser_date";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];

  return v0;
}

uint64_t __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F2AD88]);
  [v5 setPersistentID:HDSQLiteColumnAsInt64()];
  id v6 = MEMORY[0x1C1879F20](a3, a1[6]);
  [v5 setUuid:v6];

  MEMORY[0x1C1879F40](a3, a1[7]);
  objc_msgSend(v5, "setCreationDate:");
  MEMORY[0x1C1879F40](a3, a1[8]);
  objc_msgSend(v5, "setStartDate:");
  MEMORY[0x1C1879F40](a3, a1[9]);
  objc_msgSend(v5, "setEndDate:");
  MEMORY[0x1C1879F40](a3, a1[10]);
  objc_msgSend(v5, "setDuration:");
  [v5 setType:HDSQLiteColumnAsInt64()];
  [v5 setCondenserVersion:HDSQLiteColumnAsInt64()];
  MEMORY[0x1C1879F40](a3, a1[13]);
  objc_msgSend(v5, "setCondenserDate:");
  uint64_t v7 = (*(uint64_t (**)(void))(a1[4] + 16))();

  return v7;
}

- (id)codableCondensedWorkoutWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F2AD88];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = +[HDWorkoutEntity _codableCondensedWorkoutProperties]();
  id v10 = [v7 protectedDatabase];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HDWorkoutEntity_codableCondensedWorkoutWithTransaction_error___block_invoke;
  v15[3] = &unk_1E62FF338;
  id v16 = v8;
  id v11 = v8;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v9 database:v10 error:a4 handler:v15];

  if (a4) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

void __64__HDWorkoutEntity_codableCondensedWorkoutWithTransaction_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPersistentID:HDSQLiteColumnWithNameAsInt64()];
  uint64_t v2 = HDSQLiteColumnWithNameAsData();
  [*(id *)(a1 + 32) setUuid:v2];

  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setCreationDate:");
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:");
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setEndDate:");
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setDuration:");
  [*(id *)(a1 + 32) setType:HDSQLiteColumnWithNameAsInt64()];
  HDSQLiteColumnWithNameAsNumber();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5) {
    objc_msgSend(*(id *)(a1 + 32), "setCondenserVersion:", objc_msgSend(v5, "longLongValue"));
  }
  uint64_t v3 = HDSQLiteColumnWithNameAsNumber();
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(*(id *)(a1 + 32), "setCondenserDate:");
  }
}

- (id)mainWorkoutActivityTypeWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HDWorkoutActivityEntity activityTypeForPrimaryActivityOwnerID:[(HDSQLiteEntity *)self persistentID] transaction:v6 error:a4];

  return v7;
}

- (id)workoutStartDateWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__85;
  uint64_t v17 = __Block_byref_object_dispose__85;
  id v18 = 0;
  v19[0] = @"start_date";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HDWorkoutEntity_workoutStartDateWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    uint64_t v9 = (void *)v14[5];
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __57__HDWorkoutEntity_workoutStartDateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsDate();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)workoutDurationWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HDWorkoutActivityEntity durationForPrimaryActivityOwnerID:[(HDSQLiteEntity *)self persistentID] transaction:v6 error:a4];

  return v7;
}

- (id)totalDistanceInCanonicalUnitWithTransaction:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v16[0] = @"total_distance";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v8 = [v6 databaseForEntity:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HDWorkoutEntity_totalDistanceInCanonicalUnitWithTransaction_error___block_invoke;
  v11[3] = &unk_1E62F8848;
  v11[4] = &v12;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v11];

  if (a4)
  {
    uint64_t v9 = [NSNumber numberWithDouble:v13[3]];
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __69__HDWorkoutEntity_totalDistanceInCanonicalUnitWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t result = HDSQLiteColumnWithNameAsDouble();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

+ (BOOL)workoutActivityType:(unint64_t *)a3 associatedWithRouteUUID:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v21 = a4;
  uint64_t v19 = NSString;
  id v20 = a5;
  id v18 = [a1 disambiguatedDatabaseTable];
  id v8 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v9 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v10 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v12 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v19, "stringWithFormat:", @"SELECT %@ FROM %@ INNER JOIN %@ AS %@ ON %@ = %@ WHERE                                               %@ AND                                               (%@ IN (SELECT %@ FROM %@ INNER JOIN %@ ON %@=%@ WHERE %@ = ?)                                                 OR                                                 %@ IN (SELECT %@ FROM %@ INNER JOIN %@ ON %@=%@ WHERE %@ = ?))", @"activities.activity_type", v18, v8, @"activities", @"data_id", @"owner_id", @"is_primary_activity", @"data_id", @"destination_object_id", v9, v10, @"source_object_id", @"data_id", @"uuid", @"data_id", @"data_id",
    v11,
    v12,
    @"uuid",
    @"parent_uuid",
    @"child_uuid",
  uint64_t v13 = 0);

  uint64_t v14 = [v20 databaseForEntityClass:objc_opt_class()];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke;
  v25[3] = &unk_1E62F43C8;
  id v26 = v21;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke_2;
  v24[3] = &__block_descriptor_40_e26_B24__0__HDSQLiteRow__8__16l;
  v24[4] = a3;
  id v15 = v21;
  char v16 = [v14 executeSQL:v13 error:a6 bindingHandler:v25 enumerationHandler:v24];

  return v16;
}

uint64_t __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke_2(uint64_t a1)
{
  **(void **)(a1 + 32) = HDSQLiteColumnAsInt64();
  return 1;
}

@end