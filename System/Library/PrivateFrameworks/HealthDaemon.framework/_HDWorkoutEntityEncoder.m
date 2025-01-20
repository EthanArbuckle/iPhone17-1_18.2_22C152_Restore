@interface _HDWorkoutEntityEncoder
+ (int64_t)estimatedEncodedSize;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (_HDWorkoutEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDWorkoutEntityEncoder

- (id)orderedProperties
{
  v11[9] = *MEMORY[0x1E4F143B8];
  v11[0] = @"activities.activity_type";
  v11[1] = @"activities.duration";
  v11[2] = @"active_energy.quantity";
  v11[3] = @"basal_energy.quantity";
  v11[4] = @"total_distance";
  v11[5] = @"goal";
  v11[6] = @"goal_type";
  v11[7] = @"swimming_strokes.quantity";
  v11[8] = @"flights_climbed.quantity";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
  if (self->_includeCondenserInfo)
  {
    v10[0] = @"condenser_version";
    v10[1] = @"condenser_date";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

    v3 = (void *)v5;
  }
  v6 = [(HDEntityEncoder *)self superclassEncoder];
  v7 = [v6 orderedProperties];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (void).cxx_destruct
{
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = [(HDEntityEncoder *)self superclassEncoder];
  v10 = [v9 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (!v10)
  {
    v18 = 0;
    goto LABEL_35;
  }
  v11 = objc_alloc_init(HDCodableWorkout);
  [(HDCodableWorkout *)v11 setSample:v10];
  [(HDCodableWorkout *)v11 setType:HDSQLiteColumnWithNameAsInt64()];
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableWorkout setDuration:](v11, "setDuration:");
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableWorkout setTotalEnergyBurnedInCanonicalUnit:](v11, "setTotalEnergyBurnedInCanonicalUnit:");
  }
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v11, "setTotalBasalEnergyBurnedInCanonicalUnit:");
  }
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableWorkout setTotalDistanceInCanonicalUnit:](v11, "setTotalDistanceInCanonicalUnit:");
  }
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableWorkout setTotalSwimmingStrokeCountInCanonicalUnit:](v11, "setTotalSwimmingStrokeCountInCanonicalUnit:");
  }
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableWorkout setTotalFlightsClimbedInCanonicalUnit:](v11, "setTotalFlightsClimbedInCanonicalUnit:");
  }
  workoutEntryLookupStatement = self->_workoutEntryLookupStatement;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __74___HDWorkoutEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke;
  v30[3] = &unk_1E62FF360;
  v13 = v11;
  v31 = v13;
  if (+[HDWorkoutEventEntity enumerateEventsForOwner:a3 withStatement:workoutEntryLookupStatement error:a5 eventHandler:v30])
  {
    v14 = [(HDSQLiteStatement *)self->_workoutEntryLookupStatement database];
    id v29 = 0;
    v15 = +[HDWorkoutActivityEntity primaryWorkoutActivityForOwnerID:a3 database:v14 error:&v29];
    id v16 = v29;

    if (v15)
    {
      v17 = +[HDCodableWorkoutActivity codableForWorkoutActivity:v15];
      if (v17) {
        [(HDCodableWorkout *)v13 setPrimaryActivity:v17];
      }

      goto LABEL_20;
    }
    if (objc_msgSend(v16, "hk_isObjectNotFoundError"))
    {
LABEL_20:
      v19 = [(HDSQLiteStatement *)self->_workoutEntryLookupStatement database];
      id v28 = 0;
      v20 = +[HDWorkoutActivityEntity subActivitiesWithOwnerID:a3 database:v19 error:&v28];
      id v21 = v28;

      if (v20)
      {
        v22 = +[HDCodableWorkoutActivity codablesForWorkoutActivities:v20];
        [(HDCodableWorkout *)v13 setSubActivities:v22];

        if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
        {
          [(HDCodableWorkout *)v13 setGoalType:HDSQLiteColumnWithNameAsInt64()];
          HDSQLiteColumnWithNameAsDouble();
          -[HDCodableWorkout setGoal:](v13, "setGoal:");
        }
        v18 = v13;
      }
      else
      {
        id v23 = v21;
        if (v23)
        {
          if (a5) {
            *a5 = v23;
          }
          else {
            _HKLogDroppedError();
          }
        }

        v18 = 0;
      }

      v24 = v27;
      goto LABEL_33;
    }
    v24 = v16;
    id v25 = v16;
    id v21 = v25;
    if (v25)
    {
      if (a5)
      {
        id v21 = v25;
        v18 = 0;
        *a5 = v21;
LABEL_33:

        goto LABEL_34;
      }
      _HKLogDroppedError();
    }
    v18 = 0;
    goto LABEL_33;
  }
  v18 = 0;
LABEL_34:

LABEL_35:

  return v18;
}

+ (int64_t)estimatedEncodedSize
{
  return 1000;
}

- (_HDWorkoutEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_HDWorkoutEntityEncoder;
  id v16 = [(HDEntityEncoder *)&v25 initWithHealthEntityClass:a3 profile:a4 transaction:v14 purpose:a6 encodingOptions:v15 authorizationFilter:a8];
  if (v16)
  {
    v17 = [v15 objectForKeyedSubscript:@"IncludeCondenserInfo"];
    v16->_includeCondenserInfo = [v17 BOOLValue];

    v18 = [v14 databaseForEntityClass:a3];
    id v24 = 0;
    uint64_t v19 = +[HDWorkoutEventEntity statementForEnumeratingEventsForOwnerInDatabase:v18 error:&v24];
    id v20 = v24;
    workoutEntryLookupStatement = v16->_workoutEntryLookupStatement;
    v16->_workoutEntryLookupStatement = (HDSQLiteStatement *)v19;

    if (!v16->_workoutEntryLookupStatement)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Unable to create statement to look up workout events: %{public}@", buf, 0xCu);
      }
    }
  }
  return v16;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B718]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [(HDEntityEncoder *)self superclassEncoder];
  int v11 = [v10 applyPropertiesToObject:v9 persistentID:a4 row:a5 error:a6];

  if (v11)
  {
    [v9 _setWorkoutActivityType:HDSQLiteColumnWithNameAsInt64()];
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v9, "_setDuration:");
    uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v13 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v13) & 1) == 0 && _HKWorkoutGoalTypeIsValidForGoal())
    {
      id v14 = (void *)MEMORY[0x1E4F2B370];
      id v15 = _HKWorkoutCanonicalUnitForGoalType();
      MEMORY[0x1C1879F40](a5, v13);
      id v16 = objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15);

      [v9 _setGoal:v16];
      [v9 _setGoalType:v12];
    }
    uint64_t v17 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v17) & 1) == 0)
    {
      double v18 = MEMORY[0x1C1879F40](a5, v17);
      uint64_t v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F8]];
      id v20 = [v19 canonicalUnit];

      id v21 = [MEMORY[0x1E4F2B370] quantityWithUnit:v20 doubleValue:v18];
      [v9 _setTotalSwimmingStrokeCount:v21];
    }
    uint64_t v22 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a5, v22) & 1) == 0)
    {
      double v23 = MEMORY[0x1C1879F40](a5, v22);
      id v24 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A808]];
      objc_super v25 = [v24 canonicalUnit];

      v26 = [MEMORY[0x1E4F2B370] quantityWithUnit:v25 doubleValue:v23];
      [v9 _setTotalFlightsClimbed:v26];
    }
    if (self->_includeCondenserInfo)
    {
      id v27 = [v9 metadata];
      id v28 = (id)[v27 mutableCopy];

      uint64_t v29 = (int)HDSQLiteColumnWithName();
      char v30 = MEMORY[0x1C1879FC0](a5, v29);
      if ((v30 & 1) == 0)
      {
        if (!v28) {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        v31 = MEMORY[0x1C1879F70](a5, v29);
        [v28 setObject:v31 forKeyedSubscript:@"condenser_version"];
      }
      uint64_t v32 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1C1879FC0](a5, v32) & 1) == 0)
      {
        if (!v28) {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        v33 = MEMORY[0x1C1879F30](a5, v32);
        [v28 setObject:v33 forKeyedSubscript:@"condenser_date"];

        char v30 = 0;
      }
      if (v28 && (v30 & 1) == 0) {
        [v9 _setMetadata:v28];
      }
    }
    v34 = [(HDEntityEncoder *)self transaction];
    v86 = [v34 databaseForEntityClass:objc_opt_class()];

    v35 = [NSNumber numberWithLongLong:a4];
    id v96 = 0;
    v36 = +[HDWorkoutEventEntity workoutEventsWithOwnerID:v35 database:v86 error:&v96];
    id v83 = v96;

    if (!v36)
    {
      _HKInitializeLogging();
      v47 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v83;
        _os_log_error_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_ERROR, "Error retrieving workout events: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      id v84 = v83;
      if (v84)
      {
        if (!a6)
        {
          _HKLogDroppedError();
          BOOL v46 = 0;
LABEL_76:

          goto LABEL_77;
        }
        id v85 = v84;
        BOOL v46 = 0;
        *a6 = v85;
      }
      else
      {
        BOOL v46 = 1;
      }
LABEL_77:

      goto LABEL_78;
    }
    if ([v36 count]) {
      [v9 _setWorkoutEvents:v36];
    }
    v37 = [(HDEntityEncoder *)self transaction];
    v81 = [v37 databaseForEntityClass:objc_opt_class()];

    id v95 = 0;
    v82 = +[HDWorkoutActivityEntity subActivitiesWithOwnerID:a4 database:v81 error:&v95];
    id v84 = v95;
    if (!v82)
    {
      _HKInitializeLogging();
      v48 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v84;
        _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "Error retrieving workout activities: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      id v49 = v84;
      id v44 = v49;
      if (v49)
      {
        if (a6)
        {
          id v44 = v49;
          BOOL v46 = 0;
          *a6 = v44;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v46 = 0;
        }
      }
      else
      {
        BOOL v46 = 1;
      }
      goto LABEL_75;
    }
    if ([v82 count])
    {
      if ([v36 count])
      {
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v38 = v82;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v91 objects:v102 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v92;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v92 != v40) {
                objc_enumerationMutation(v38);
              }
              [*(id *)(*((void *)&v91 + 1) + 8 * i) _filterAndSetWorkoutEvents:v36];
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v91 objects:v102 count:16];
          }
          while (v39);
        }
      }
      [v9 _setSubActivities:v82];
    }
    id v90 = 0;
    id v42 = +[HDWorkoutActivityEntity primaryWorkoutActivityForOwnerID:a4 database:v81 error:&v90];
    id v43 = v90;
    id v44 = v43;
    if (v42)
    {
      v45 = [v9 workoutEvents];
      [v42 _filterAndSetWorkoutEvents:v45];
    }
    else
    {
      if ((objc_msgSend(v43, "hk_isObjectNotFoundError") & 1) == 0)
      {
        id v74 = v44;
        id v42 = v74;
        if (v74)
        {
          if (a6)
          {
            id v42 = v74;
            BOOL v46 = 0;
            *a6 = v42;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v46 = 0;
          }
        }
        else
        {
          BOOL v46 = 1;
        }
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
      id v50 = v9;
      v45 = v50;
      if (self)
      {
        [v50 workoutActivityType];
        v51 = [v45 metadata];
        v52 = _HKWorkoutConfigurationWithActivityTypeAndMetadata();

        id v53 = objc_alloc(MEMORY[0x1E4F2B720]);
        v78 = [v45 UUID];
        v77 = [v45 startDate];
        v76 = [v45 endDate];
        v54 = [v45 workoutEvents];
        [v45 duration];
        id v42 = (id)objc_msgSend(v53, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v78, v52, v77, v76, v54, 0, 0, 0);

        uint64_t v55 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v55) & 1) == 0)
        {
          double v56 = MEMORY[0x1C1879F40](a5, v55);
          v57 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
          v79 = [v57 canonicalUnit];

          v58 = [MEMORY[0x1E4F2B370] quantityWithUnit:v79 doubleValue:v56];
          [v45 _setTotalEnergyBurned:v58];
        }
        uint64_t v59 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v59) & 1) == 0)
        {
          double v60 = MEMORY[0x1C1879F40](a5, v59);
          v61 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A600]];
          v80 = [v61 canonicalUnit];

          v62 = [MEMORY[0x1E4F2B370] quantityWithUnit:v80 doubleValue:v60];
          [v45 _setTotalBasalEnergyBurned:v62];
        }
        uint64_t v63 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1C1879FC0](a5, v63) & 1) == 0)
        {
          double v64 = MEMORY[0x1C1879F40](a5, v63);
          v65 = (void *)MEMORY[0x1E4F2B370];
          v66 = _HKWorkoutCanonicalDistanceUnit();
          v67 = [v65 quantityWithUnit:v66 doubleValue:v64];

          [v45 _setTotalDistance:v67];
        }
      }
      else
      {
        id v42 = 0;
      }
    }

    [v9 _setPrimaryActivity:v42];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__85;
    v100 = __Block_byref_object_dispose__85;
    id v101 = 0;
    v68 = [(HDEntityEncoder *)self profile];
    v69 = [(HDEntityEncoder *)self transaction];
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __74___HDWorkoutEntityEncoder_applyPropertiesToObject_persistentID_row_error___block_invoke;
    v88[3] = &unk_1E62FF388;
    v88[4] = &buf;
    id v89 = 0;
    BOOL v70 = +[HDWorkoutZonesAssociationEntity enumerateZonesSamplesWithWorkoutPersistentID:a4 profile:v68 transaction:v69 error:&v89 handler:v88];
    id v71 = v89;

    if (v70)
    {
      [v9 _setZonesByType:*(void *)(*((void *)&buf + 1) + 40)];
      BOOL v46 = 1;
    }
    else
    {
      id v72 = v71;
      v73 = v72;
      BOOL v46 = v72 == 0;
      if (v72)
      {
        if (a6) {
          *a6 = v72;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    _Block_object_dispose(&buf, 8);

    goto LABEL_74;
  }
  BOOL v46 = 0;
LABEL_78:

  return v46;
}

@end