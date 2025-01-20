@interface HDRaceRouteClusterWorkout
+ (id)clusterWorkoutWithWorkoutEntity:(id)a3 transaction:(id)a4 metadataManager:(id)a5 error:(id *)a6;
+ (id)clusterWorkoutWithWorkoutUUID:(id)a3 transaction:(id)a4 metadataManager:(id)a5 error:(id *)a6;
- (NSDate)startDate;
- (NSUUID)workoutUUID;
- (double)distance;
- (double)duration;
- (double)finishDuration;
- (double)startDuration;
- (unint64_t)activityType;
@end

@implementation HDRaceRouteClusterWorkout

+ (id)clusterWorkoutWithWorkoutEntity:(id)a3 transaction:(id)a4 metadataManager:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[HDMetadataValueStatement metadataValueStatementWithTransaction:v10];
  v13 = objc_msgSend(v11, "metadataForObjectID:baseMetadata:keyFilter:statement:error:", objc_msgSend(v9, "persistentID"), 0, 0, v12, a6);

  if (!v13)
  {
    v25 = 0;
    goto LABEL_40;
  }
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BB90]];

  uint64_t v15 = [v10 databaseForEntity:v9];
  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
  uint64_t v17 = HDDataEntityPredicateForRowID((uint64_t)v16, 1);

  v18 = (void *)v15;
  v64 = (void *)v17;
  id v65 = 0;
  uint64_t v19 = +[HDSQLiteEntity propertyValueForAnyInDatabase:v15 property:@"uuid" predicate:v17 error:&v65];
  id v20 = v65;
  v21 = _HDUUIDForSQLiteValue();
  v63 = (void *)v19;
  if (v21)
  {
    id v22 = [v9 mainWorkoutActivityTypeWithTransaction:v10 error:a6];
    if (v22)
    {
      if (v14)
      {
        id obj = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BB98]];
        if (obj) {
          goto LABEL_8;
        }
      }
      id obj = [v9 workoutStartDateWithTransaction:v10 error:a6];
      if (obj)
      {
        if (!v14)
        {
          id v57 = v20;
          v23 = 0;
LABEL_21:
          v61 = v23;
          uint64_t v27 = [v9 totalDistanceInCanonicalUnitWithTransaction:v10 error:a6];
          if (!v27)
          {
            v25 = 0;
            v26 = v64;
            id v20 = v57;
LABEL_37:

            goto LABEL_38;
          }
          v28 = (void *)v27;
          v54 = (void *)MEMORY[0x1E4F2B370];
          _HKWorkoutCanonicalDistanceUnit();
          v29 = v59 = v18;
          [v28 doubleValue];
          v55 = objc_msgSend(v54, "quantityWithUnit:doubleValue:", v29);

          v51 = NSNumber;
          v30 = [MEMORY[0x1E4F2B618] meterUnit];
          [v55 doubleValueForUnit:v30];
          objc_msgSend(v51, "numberWithDouble:");
          uint64_t v31 = v52 = v28;

          v18 = v59;
          v24 = (void *)v31;
          v23 = v61;
LABEL_23:
          v60 = v18;
          v56 = v24;
          [v24 doubleValue];
          double v33 = v32;
          v61 = v23;
          [v23 doubleValue];
          double v35 = v34;
          if (v14)
          {
            v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BBA8]];
            v36 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BB88]];
            id v20 = v57;
            if (v36) {
              goto LABEL_29;
            }
          }
          else
          {
            id v20 = v57;
          }
          uint64_t v37 = [v9 workoutDurationWithTransaction:v10 error:a6];
          if (!v37)
          {
            v58 = v14;
            v25 = 0;
LABEL_36:

            v18 = v60;
            v26 = v64;
            goto LABEL_37;
          }
          v36 = (void *)v37;
LABEL_29:
          [v36 doubleValue];
          double v39 = v38;
          [v14 doubleValue];
          double v41 = v40;
          v42 = v14;
          v25 = [HDRaceRouteClusterWorkout alloc];
          uint64_t v50 = [v22 integerValue];
          v58 = v42;
          [v42 doubleValue];
          double v44 = v43;
          [v36 doubleValue];
          double v46 = v45;
          id v53 = v21;
          id v47 = obj;
          if (v25)
          {
            v66.receiver = v25;
            v66.super_class = (Class)HDRaceRouteClusterWorkout;
            v48 = objc_msgSendSuper2(&v66, sel_init);
            v25 = (HDRaceRouteClusterWorkout *)v48;
            if (v48)
            {
              objc_storeStrong(v48 + 1, v21);
              v25->_activityType = v50;
              objc_storeStrong((id *)&v25->_startDate, obj);
              v25->_distance = v33 - v35;
              v25->_duration = v39 - v41;
              v25->_startDuration = v44;
              v25->_finishDuration = v46;
            }
          }

          goto LABEL_36;
        }
LABEL_8:
        id v57 = v20;
        v23 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BBA0]];
        v24 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2BB80]];
        if (v24) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
    }
    v25 = 0;
LABEL_19:
    v26 = v64;
LABEL_38:

    goto LABEL_39;
  }
  if (v20)
  {
    id v22 = v20;
LABEL_15:
    if (a6)
    {
      id v22 = v22;
      v25 = 0;
      *a6 = v22;
    }
    else
    {
      _HKLogDroppedError();
      v25 = 0;
    }
    id v20 = v22;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Invalid reference workout UUID");
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22) {
    goto LABEL_15;
  }
  id v20 = 0;
  v25 = 0;
  v26 = v64;
LABEL_39:

LABEL_40:

  return v25;
}

+ (id)clusterWorkoutWithWorkoutUUID:(id)a3 transaction:(id)a4 metadataManager:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  v13 = [v10 databaseForEntityClass:objc_opt_class()];
  v14 = HDDataEntityPredicateForDataUUID();

  uint64_t v15 = +[HDDataEntity anyInDatabase:v13 predicate:v14 error:a6];

  if (v15)
  {
    v16 = [a1 clusterWorkoutWithWorkoutEntity:v15 transaction:v10 metadataManager:v11 error:a6];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSUUID)workoutUUID
{
  return self->_workoutUUID;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)distance
{
  return self->_distance;
}

- (double)duration
{
  return self->_duration;
}

- (double)startDuration
{
  return self->_startDuration;
}

- (double)finishDuration
{
  return self->_finishDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_workoutUUID, 0);
}

@end