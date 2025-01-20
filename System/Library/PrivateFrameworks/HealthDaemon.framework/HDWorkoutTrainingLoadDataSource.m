@interface HDWorkoutTrainingLoadDataSource
- (BOOL)samplesForCalculatorWithHandler:(id)a3;
- (HDProfile)profile;
- (HDWorkoutTrainingLoadDataSource)init;
- (HDWorkoutTrainingLoadDataSource)initWithProfile:(id)a3 quantityType:(id)a4 filter:(id)a5;
- (HKQuantityType)quantityType;
- (_HKFilter)filter;
- (void)_retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:(uint64_t)a3 workoutPID:(void *)a4 workoutStartDate:(void *)a5 workoutEndDate:(uint64_t)a6 workoutActivityType:(uint64_t)a7 workoutDuration:(void *)a8 sourceID:(double)a9 activity:(void *)a10 sampleHandler:;
@end

@implementation HDWorkoutTrainingLoadDataSource

- (HDWorkoutTrainingLoadDataSource)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDWorkoutTrainingLoadDataSource)initWithProfile:(id)a3 quantityType:(id)a4 filter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDWorkoutTrainingLoadDataSource;
  v11 = [(HDWorkoutTrainingLoadDataSource *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    uint64_t v13 = [v9 copy];
    quantityType = v12->_quantityType;
    v12->_quantityType = (HKQuantityType *)v13;

    uint64_t v15 = [v10 copy];
    filter = v12->_filter;
    v12->_filter = (_HKFilter *)v15;
  }
  return v12;
}

- (BOOL)samplesForCalculatorWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained database];
  id v14 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke;
  v12[3] = &unk_1E62F8050;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  BOOL v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:&v14 block:v12];
  id v9 = v14;

  if (!v8)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Error querying workout samples: %{public}@", buf, 0xCu);
    }
  }

  return v8;
}

BOOL __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v25[0] = @"uuid";
  v25[1] = @"start_date";
  v25[2] = @"end_date";
  v25[3] = @"provenance";
  v25[4] = @"activities.activity_type";
  v25[5] = @"activities.duration";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
  id v9 = [v7 predicateWithProfile:WeakRetained];
  id v10 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
  v24 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v13 = [v12 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke_2;
  v20[3] = &unk_1E62F8028;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  id v21 = v4;
  uint64_t v22 = v14;
  id v23 = v15;
  id v16 = v4;
  BOOL v17 = +[HDHealthEntity enumerateProperties:v5 withPredicate:v9 orderingTerms:v11 groupBy:0 limit:0 healthDatabase:v13 error:a3 enumerationHandler:v20];

  return v17;
}

BOOL __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [*(id *)(a1 + 32) databaseForEntityClass:objc_opt_class()];
  id v9 = +[HDWorkoutActivityEntity subActivitiesWithOwnerID:a2 database:v8 error:a5];
  if (v9)
  {
    uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
    v40 = HDSQLiteColumnWithNameAsUUID();
    v39 = HDSQLiteColumnWithNameAsDate();
    v38 = HDSQLiteColumnWithNameAsDate();
    uint64_t v36 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v13 = [WeakRetained dataProvenanceManager];
    uint64_t v14 = [NSNumber numberWithLongLong:v11];
    uint64_t v15 = [v13 originProvenanceForPersistentID:v14 transaction:*(void *)(a1 + 32) error:a5];

    BOOL v16 = v15 != 0;
    if (v15)
    {
      double v17 = (double)v36;
      if (v10 == 82)
      {
        v35 = v9;
        v37 = v8;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v22 = v9;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              v28 = [v27 workoutConfiguration];
              uint64_t v29 = [v28 activityType];

              if (v29 != 83)
              {
                uint64_t v30 = *(void *)(a1 + 40);
                v31 = [v15 sourceID];
                -[HDWorkoutTrainingLoadDataSource _retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:workoutPID:workoutStartDate:workoutEndDate:workoutActivityType:workoutDuration:sourceID:activity:sampleHandler:](v30, v40, a2, v39, v38, 82, [v31 longLongValue], v27, v17, *(void **)(a1 + 48));
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v24);
        }

        id v9 = v35;
        BOOL v8 = v37;
        BOOL v16 = v15 != 0;
      }
      else if (v10 == 84)
      {
        _HKInitializeLogging();
        objc_super v18 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = *(void *)(a1 + 40);
          v20 = v18;
          id v21 = _HKWorkoutActivityNameForActivityType();
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v19;
          __int16 v48 = 2114;
          v49 = v21;
          _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_INFO, "%{public}@: Not retrieving rating of exertion samples for workout activity: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v32 = *(void *)(a1 + 40);
        v33 = [v15 sourceID];
        -[HDWorkoutTrainingLoadDataSource _retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:workoutPID:workoutStartDate:workoutEndDate:workoutActivityType:workoutDuration:sourceID:activity:sampleHandler:](v32, v40, a2, v39, v38, v10, [v33 longLongValue], 0, v17, *(void **)(a1 + 48));
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:(uint64_t)a3 workoutPID:(void *)a4 workoutStartDate:(void *)a5 workoutEndDate:(uint64_t)a6 workoutActivityType:(uint64_t)a7 workoutDuration:(void *)a8 sourceID:(double)a9 activity:(void *)a10 sampleHandler:
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v67 = a2;
  id v68 = a4;
  id v69 = a5;
  id v16 = a8;
  id v70 = a10;
  if (a1)
  {
    double v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v63 = objc_msgSend(v17, "hk_BOOLForKey:defaultValue:", @"HDWorkoutTrainingLoadNoisyLogging", 0);

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v71 = 0;
    uint64_t v19 = _HDRatingOfExertionSamplesForWorkoutPID(a3, v16, 1, WeakRetained, &v71);
    id v20 = v71;

    if (v20)
    {
      id v21 = [v16 workoutConfiguration];
      [v21 activityType];

      _HKInitializeLogging();
      id v22 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        v55 = v22;
        v56 = _HKWorkoutActivityNameForActivityType();
        *(_DWORD *)v84 = 138543874;
        *(void *)&v84[4] = a1;
        *(_WORD *)&v84[12] = 2114;
        *(void *)&v84[14] = v56;
        *(_WORD *)&v84[22] = 2114;
        v85 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving rating of exertion samples for workout activity %{public}@: %{public}@", v84, 0x20u);
      }
LABEL_5:

      goto LABEL_6;
    }
    id v62 = v19;
    id v66 = v67;
    id v61 = v68;
    id v60 = v69;
    id v23 = v16;
    uint64_t v24 = (void (**)(id, uint64_t, uint64_t, id, void, double, double, double))v70;
    uint64_t v25 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A950]];
    v26 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
    uint64_t v72 = 0;
    v73 = (double *)&v72;
    uint64_t v74 = 0x2020000000;
    uint64_t v75 = 0;
    *(void *)v84 = MEMORY[0x1E4F143A8];
    *(void *)&v84[8] = 3221225472;
    *(void *)&v84[16] = __180__HDWorkoutTrainingLoadDataSource__calculateTrainingLoadForSamples_workoutUUID_workoutStartDate_workoutEndDate_workoutActivityType_workoutDuration_sourceID_activity_sampleHandler___block_invoke;
    v85 = &unk_1E62F8078;
    id v57 = v25;
    id v86 = v57;
    id v59 = v26;
    id v87 = v59;
    id v27 = v23;
    double v90 = a9;
    id v88 = v27;
    v89 = &v72;
    [v62 enumerateObjectsUsingBlock:v84];
    v28 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LODWORD(v26) = objc_msgSend(v28, "hk_BOOLForKey:defaultValue:", @"HDWorkoutTrainingLoadNoisyLogging", 0);

    if (v26)
    {
      _HKInitializeLogging();
      uint64_t v29 = (id)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = objc_msgSend(v27, "UUID", v57, v59);
        uint64_t v31 = *((void *)v73 + 3);
        *(_DWORD *)buf = 138544130;
        uint64_t v77 = a1;
        __int16 v78 = 2114;
        id v79 = v66;
        __int16 v80 = 2114;
        v81 = v30;
        __int16 v82 = 2048;
        uint64_t v83 = v31;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Calculated training load for workout <%{public}@>, activity <%{public}@> is %f ", buf, 0x2Au);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v32 = (void *)*MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
LABEL_14:
        uint64_t v35 = objc_msgSend(v27, "startDate", v57);
        uint64_t v36 = (void *)v35;
        v37 = v61;
        if (v35) {
          v37 = (void *)v35;
        }
        id v38 = v37;

        uint64_t v39 = [v27 endDate];
        v40 = (void *)v39;
        long long v41 = v60;
        if (v39) {
          long long v41 = (void *)v39;
        }
        id v42 = v41;

        long long v43 = [v27 workoutConfiguration];
        uint64_t v44 = [v43 activityType];
        if (v44) {
          uint64_t v45 = v44;
        }
        else {
          uint64_t v45 = a6;
        }

        double v46 = v73[3];
        [v38 timeIntervalSinceReferenceDate];
        double v48 = v47;
        [v42 timeIntervalSinceReferenceDate];
        v24[2](v24, a7, v45, v66, 0, v46, v48, v49);

        _Block_object_dispose(&v72, 8);
        _HKInitializeLogging();
        uint64_t v50 = *MEMORY[0x1E4F29FB8];
        if (v63)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            v51 = v50;
            v52 = [v27 UUID];
            *(_DWORD *)v84 = 138543874;
            *(void *)&v84[4] = a1;
            *(_WORD *)&v84[12] = 2114;
            *(void *)&v84[14] = v66;
            *(_WORD *)&v84[22] = 2114;
            v85 = v52;
            _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: retrieved rating of exertion samples for workout <%{public}@>, activity %{public}@ successfully", v84, 0x20u);
          }
        }
        else if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v53 = v50;
          v54 = [v27 UUID];
          *(_DWORD *)v84 = 138543874;
          *(void *)&v84[4] = a1;
          *(_WORD *)&v84[12] = 2114;
          *(void *)&v84[14] = v66;
          *(_WORD *)&v84[22] = 2114;
          v85 = v54;
          _os_log_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_INFO, "%{public}@: retrieved rating of exertion samples for workout <%{public}@>, activity %{public}@ successfully", v84, 0x20u);
        }
        goto LABEL_5;
      }
      uint64_t v29 = v32;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v33 = objc_msgSend(v27, "UUID", v57, v59);
        uint64_t v34 = *((void *)v73 + 3);
        *(_DWORD *)buf = 138544130;
        uint64_t v77 = a1;
        __int16 v78 = 2114;
        id v79 = v66;
        __int16 v80 = 2114;
        v81 = v33;
        __int16 v82 = 2048;
        uint64_t v83 = v34;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_INFO, "%{public}@: Calculated training load for workout <%{public}@>, activity <%{public}@> is %f ", buf, 0x2Au);
      }
    }

    goto LABEL_14;
  }
LABEL_6:
}

void __180__HDWorkoutTrainingLoadDataSource__calculateTrainingLoadForSamples_workoutUUID_workoutStartDate_workoutEndDate_workoutActivityType_workoutDuration_sourceID_activity_sampleHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  uint64_t v6 = [v17 quantityType];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    unint64_t v8 = (unint64_t)v17;
    unint64_t v9 = 0;
    *a4 = 1;
  }
  else
  {
    uint64_t v10 = [v17 quantityType];
    int v11 = [v10 isEqual:*(void *)(a1 + 40)];

    if (v11) {
      unint64_t v9 = (unint64_t)v17;
    }
    else {
      unint64_t v9 = 0;
    }
    unint64_t v8 = 0;
  }
  if (v9 | v8)
  {
    id v12 = [v17 quantity];
    id v13 = [*(id *)(a1 + 32) canonicalUnit];
    [v12 doubleValueForUnit:v13];
    double v15 = v14;

    [*(id *)(a1 + 48) duration];
    if (v16 == 0.0) {
      double v16 = *(double *)(a1 + 64);
    }
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = round(v15) * v16;
  }
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end