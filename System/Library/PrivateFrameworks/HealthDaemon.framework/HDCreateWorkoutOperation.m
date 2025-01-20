@interface HDCreateWorkoutOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)_associateSamplesWithUUIDs:(void *)a3 activityUUID:(uint64_t)a4 type:(void *)a5 profile:(uint64_t)a6 error:;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDCreateWorkoutOperation)initWithCoder:(id)a3;
- (HDCreateWorkoutOperation)initWithWorkoutConfiguration:(id)a3 identifier:(id)a4 dateInterval:(id)a5 metadata:(id)a6 device:(id)a7 source:(id)a8 sourceVersion:(id)a9 events:(id)a10 activities:(id)a11 statisticsCalculators:(id)a12 associatedSeries:(id)a13 goalType:(unint64_t)a14 goal:(id)a15 quantityTypesIncludedWhilePaused:(id)a16;
- (HDWorkoutBuilderStatisticsCalculators)statisticsCalculators;
- (HKDevice)device;
- (HKQuantity)goal;
- (HKSource)source;
- (HKWorkout)createdWorkout;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSArray)activities;
- (NSArray)associatedSeries;
- (NSArray)events;
- (NSArray)quantityTypesIncludedWhilePaused;
- (NSDateInterval)dateInterval;
- (NSDictionary)metadata;
- (NSString)sourceVersion;
- (NSUUID)identifier;
- (unint64_t)goalType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDCreateWorkoutOperation

- (HDCreateWorkoutOperation)initWithWorkoutConfiguration:(id)a3 identifier:(id)a4 dateInterval:(id)a5 metadata:(id)a6 device:(id)a7 source:(id)a8 sourceVersion:(id)a9 events:(id)a10 activities:(id)a11 statisticsCalculators:(id)a12 associatedSeries:(id)a13 goalType:(unint64_t)a14 goal:(id)a15 quantityTypesIncludedWhilePaused:(id)a16
{
  id v54 = a3;
  id v21 = a4;
  id v57 = a5;
  id v56 = a6;
  id v55 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v26 = v22;
  id v53 = a12;
  id v27 = a13;
  id v28 = a15;
  id v29 = a16;
  v58.receiver = self;
  v58.super_class = (Class)HDCreateWorkoutOperation;
  v30 = [(HDCreateWorkoutOperation *)&v58 init];
  if (v30)
  {
    uint64_t v31 = [v54 copy];
    workoutConfiguration = v30->_workoutConfiguration;
    v30->_workoutConfiguration = (HKWorkoutConfiguration *)v31;

    uint64_t v33 = [v21 copy];
    identifier = v30->_identifier;
    v30->_identifier = (NSUUID *)v33;

    uint64_t v35 = [v57 copy];
    dateInterval = v30->_dateInterval;
    v30->_dateInterval = (NSDateInterval *)v35;

    uint64_t v37 = [v56 copy];
    metadata = v30->_metadata;
    v30->_metadata = (NSDictionary *)v37;

    uint64_t v39 = [v55 copy];
    device = v30->_device;
    v30->_device = (HKDevice *)v39;

    uint64_t v41 = [v26 copy];
    source = v30->_source;
    v30->_source = (HKSource *)v41;

    uint64_t v43 = [v23 copy];
    sourceVersion = v30->_sourceVersion;
    v30->_sourceVersion = (NSString *)v43;

    uint64_t v45 = [v24 copy];
    events = v30->_events;
    v30->_events = (NSArray *)v45;

    uint64_t v47 = [v25 copy];
    activities = v30->_activities;
    v30->_activities = (NSArray *)v47;

    objc_storeStrong((id *)&v30->_statisticsCalculators, a12);
    uint64_t v49 = [v27 copy];
    associatedSeries = v30->_associatedSeries;
    v30->_associatedSeries = (NSArray *)v49;

    v30->_goalType = a14;
    objc_storeStrong((id *)&v30->_goal, a15);
    objc_storeStrong((id *)&v30->_quantityTypesIncludedWhilePaused, a16);
  }

  return v30;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v115 = a3;
  id v112 = a4;
  v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v9 = [v8 isAppleWatch];

  if (!v9)
  {
LABEL_7:
    identifier = self->_identifier;
    id v128 = 0;
    v114 = +[HDWorkoutBuilderEntity workoutBuilderEntityWithIdentifier:identifier profile:v115 error:&v128];
    id v16 = v128;
    if (!v114)
    {
      if (v16)
      {
        id v32 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Unable to look up workout builder '%@' during create workout operation."", self->_identifier);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          v113 = 0;
          BOOL v14 = 0;
LABEL_77:

          goto LABEL_78;
        }
      }
      if (a5)
      {
        id v33 = v32;
        BOOL v14 = 0;
        *a5 = v33;
        v113 = v33;
      }
      else
      {
        id v34 = v32;
        _HKLogDroppedError();
        BOOL v14 = 0;
        id v33 = v34;
        v113 = v34;
      }
LABEL_76:

      goto LABEL_77;
    }
    v113 = v16;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dateInterval = self->_dateInterval;
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke;
    v126[3] = &unk_1E62FD428;
    id v109 = v17;
    id v127 = v109;
    if (![v114 pruneAssociatedSamplesToDateInterval:dateInterval transaction:v112 error:a5 zonesHandler:v126])
    {
      BOOL v14 = 0;
LABEL_75:

      id v33 = v109;
      goto LABEL_76;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activities = self->_activities;
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_2;
    v125[3] = &unk_1E62FD450;
    v125[4] = self;
    id v21 = [(NSArray *)activities hk_mapToDictionary:v125];
    statisticsCalculators = self->_statisticsCalculators;
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_3;
    v119[3] = &unk_1E62FD478;
    id v23 = v115;
    id v120 = v23;
    id v94 = v114;
    id v121 = v94;
    v122 = self;
    id v105 = v21;
    id v123 = v105;
    id v102 = v19;
    id v124 = v102;
    [(HDWorkoutBuilderStatisticsCalculators *)statisticsCalculators enumerateCalculatorsWithHandler:v119];
    events = self->_events;
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_295;
    v118[3] = &unk_1E62FD4A0;
    v118[4] = self;
    v104 = [(NSArray *)events hk_filter:v118];
    id v25 = [v105 allValues];
    v103 = [v25 sortedArrayUsingComparator:&__block_literal_global_78];

    v26 = (void *)MEMORY[0x1E4F2B718];
    HKWorkoutActivityType v27 = [(HKWorkoutConfiguration *)self->_workoutConfiguration activityType];
    id v28 = [(NSDateInterval *)self->_dateInterval startDate];
    id v29 = [(NSDateInterval *)self->_dateInterval endDate];
    id v108 = [v26 _workoutWithActivityType:v27 startDate:v28 endDate:v29 workoutEvents:v104 workoutActivities:v103 duration:v102 statistics:0.0 goalType:self->_goalType goal:self->_goal device:self->_device metadata:self->_metadata];

    [v108 _setUUID:self->_identifier];
    v30 = [v23 sourceManager];
    v107 = [v30 sourceEntityForClientSource:self->_source createOrUpdateIfNecessary:0 error:a5];

    if (!v107) {
      goto LABEL_12;
    }
    if (self->_device)
    {
      uint64_t v31 = [v23 deviceManager];
      v99 = [v31 deviceEntityForDevice:self->_device error:a5];

      if (!v99)
      {
LABEL_12:
        BOOL v14 = 0;
LABEL_74:

        goto LABEL_75;
      }
    }
    else
    {
      v99 = 0;
    }
    uint64_t v35 = [v23 dataProvenanceManager];
    v97 = [v35 localDataProvenanceForSourceEntity:v107 version:self->_sourceVersion deviceEntity:v99];

    v36 = [v23 dataManager];
    id v137 = v108;
    uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];
    int v38 = [v36 insertDataObjects:v37 withProvenance:v97 creationDate:0 skipInsertionFilter:1 updateSourceOrder:1 resolveAssociations:a5 error:CFAbsoluteTimeGetCurrent()];

    if (v38)
    {
      id v98 = v112;
      id v110 = v23;
      id v39 = v109;
      id v95 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      obuint64_t j = v39;
      uint64_t v40 = [obj countByEnumeratingWithState:&v129 objects:buf count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v130;
        while (2)
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v130 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v43 = +[HDDataEntity objectWithUUID:*(void *)(*((void *)&v129 + 1) + 8 * i) encodingOptions:0 profile:v110 error:a5];
            v44 = v43;
            if (!v43) {
              goto LABEL_46;
            }
            id v45 = [v43 sampleType];
            v46 = [MEMORY[0x1E4F2B818] heartRateType];
            char v47 = [v45 isEqual:v46];

            v48 = (void *)MEMORY[0x1E4F2A828];
            if ((v47 & 1) != 0
              || ([MEMORY[0x1E4F2B818] cyclingPowerType],
                  uint64_t v49 = objc_claimAutoreleasedReturnValue(),
                  int v50 = [v45 isEqual:v49],
                  v49,
                  v48 = (void *)MEMORY[0x1E4F2A660],
                  v50))
            {
              v51 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*v48];
            }
            else
            {
              v51 = 0;
            }

            if (v51)
            {
              v52 = [(HDWorkoutBuilderStatisticsCalculators *)self->_statisticsCalculators calculatorForQuantityType:v51 activityUUID:self->_identifier];
              id v53 = v52;
              if (v52)
              {
                id v54 = [v52 currentStatistics];
                BOOL v55 = [v54 dataCount] == 0;

                if (!v55)
                {
                  id v56 = [v44 UUID];
                  v138[0] = v56;
                  id v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:1];
                  BOOL v58 = +[HDWorkoutZonesAssociationEntity associateZonesSamplesWithUUIDs:v57 withWorkoutUUID:self->_identifier transaction:v98 profile:v110 error:a5];

                  if (!v58)
                  {

LABEL_46:
                    id v106 = 0;
                    v61 = v95;
                    goto LABEL_47;
                  }
                  v59 = [v44 sampleType];
                  [v95 setObject:v44 forKeyedSubscript:v59];
                }
              }
            }
            else
            {
              _HKInitializeLogging();
              v60 = *MEMORY[0x1E4F29FB8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v140 = 138412290;
                *(void *)&v140[4] = v44;
                _os_log_error_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_ERROR, "Unsupported workout zone sample type: %@", v140, 0xCu);
              }
            }
          }
          uint64_t v40 = [obj countByEnumeratingWithState:&v129 objects:buf count:16];
          if (v40) {
            continue;
          }
          break;
        }
      }

      v61 = v95;
      id v106 = v95;
LABEL_47:

      if (v106)
      {
        v117 = 0;
        id obja = v108;
        id v96 = v94;
        id v62 = v110;
        id v111 = v98;
        *(_OWORD *)v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        v63 = self->_associatedSeries;
        uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:v140 objects:buf count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v141;
          uint64_t v66 = MEMORY[0x1E4F1CC08];
          while (2)
          {
            for (uint64_t j = 0; j != v64; ++j)
            {
              if (*(void *)v141 != v65) {
                objc_enumerationMutation(v63);
              }
              v68 = +[HDSeriesBuilderEntity freezeSeriesWithIdentifier:*(void *)(*(void *)&v140[8] + 8 * j) metadata:v66 profile:v62 error:&v117];
              BOOL v69 = v68 == 0;

              if (v69)
              {
                char v87 = 0;
                goto LABEL_64;
              }
            }
            uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:v140 objects:buf count:16];
            if (v64) {
              continue;
            }
            break;
          }
        }

        associatedSeries = self->_associatedSeries;
        id v136 = 0;
        BOOL v71 = -[HDCreateWorkoutOperation _associateSamplesWithUUIDs:activityUUID:type:profile:error:]((uint64_t)self, associatedSeries, 0, 0, v62, (uint64_t)&v136);
        v72 = (NSArray *)v136;
        v63 = v72;
        if (v71)
        {
          v73 = (void *)MEMORY[0x1E4F65D08];
          v74 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
          v75 = HDSampleEntityPredicateForDataType(v74);
          v138[0] = v75;
          v76 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A950]];
          v77 = HDSampleEntityPredicateForDataType(v76);
          v138[1] = v77;
          v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
          v79 = [v73 predicateMatchingAnyPredicates:v78];

          v80 = [obja metadata];
          v81 = [v80 objectForKeyedSubscript:*MEMORY[0x1E4F2BBC0]];

          v82 = +[HDMetadataValueStatement metadataValueStatementWithTransaction:v111];
          *(void *)&long long v129 = MEMORY[0x1E4F143A8];
          *((void *)&v129 + 1) = 3221225472;
          *(void *)&long long v130 = __105__HDCreateWorkoutOperation__associateQuantitySamplesWithWorkout_builderEntity_profile_transaction_error___block_invoke;
          *((void *)&v130 + 1) = &unk_1E62FD4E8;
          *(void *)&long long v131 = v79;
          *((void *)&v131 + 1) = v62;
          *(void *)&long long v132 = v81;
          id v83 = v111;
          *((void *)&v132 + 1) = v83;
          id v133 = v82;
          v134 = self;
          id v135 = obja;
          id v84 = v82;
          id v85 = v81;
          v86 = v79;
          char v87 = [v96 enumerateAssociatedUUIDsWithTransaction:v83 error:&v117 block:&v129];
        }
        else
        {
          v88 = v72;
          if (v88)
          {
            v86 = v88;
            char v87 = 0;
            v117 = v86;
          }
          else
          {
            v86 = 0;
            char v87 = 1;
          }
        }

LABEL_64:
        v89 = v117;
        v90 = v89;
        if (v87)
        {
          [v111 onCommit:&__block_literal_global_307_1 orRollback:0];
          objc_storeStrong((id *)&self->_createdWorkout, v108);
          [(HKWorkout *)self->_createdWorkout _setZonesByType:v106];
          BOOL v14 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:self->_identifier profile:v62 error:a5];
        }
        else
        {
          v91 = v89;
          v92 = v91;
          BOOL v14 = v91 == 0;
          if (v91)
          {
            if (a5) {
              *a5 = v91;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }

    goto LABEL_74;
  }
  v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  v113 = objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", *MEMORY[0x1E4F2AB00], v11);

  v12 = [(NSDateInterval *)self->_dateInterval endDate];
  LODWORD(v11) = objc_msgSend(v12, "hk_isBeforeDate:", v113);

  if (!v11)
  {

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to save a workout which is older than the standard data availability on Watch. Discarding builder", buf, 2u);
  }
  BOOL v14 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:self->_identifier profile:v115 error:a5];
LABEL_78:

  return v14;
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  v5 = a3;
  v6 = [v9 endDate];

  if (!v6)
  {
    v7 = [*(id *)(*(void *)(a1 + 32) + 32) endDate];
    [v9 _setEndDate:v7];
  }
  v8 = [v9 UUID];
  v5[2](v5, v8, v9);
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [[HDWorkoutBuilderStatisticsDataSource alloc] initWithProfile:*(void *)(a1 + 32) quantityType:v8 builderEntity:*(void *)(a1 + 40)];
  v11 = [[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc] initWithProfile:*(void *)(a1 + 32) quantityType:v8];
  [v7 setDataSource:v10];
  [v7 setSourceOrderProvider:v11];
  if ([v9 isEqual:*(void *)(*(void *)(a1 + 48) + 24)])
  {
    [v7 setDateInterval:*(void *)(*(void *)(a1 + 48) + 32)];
  }
  else
  {
    v12 = v10;
    v13 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
    BOOL v14 = v13;
    if (!v13
      || ([v13 endDate],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v14 startDate],
          id v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = objc_msgSend(v15, "hk_isAfterDate:", v16),
          v16,
          v15,
          !v17))
    {

      v10 = v12;
      goto LABEL_20;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v19 = [v14 startDate];
    v20 = [v14 endDate];
    id v21 = (void *)[v18 initWithStartDate:v19 endDate:v20];
    [v7 setDateInterval:v21];

    v10 = v12;
  }
  if (([*(id *)(*(void *)(a1 + 48) + 120) containsObject:v8] & 1) == 0)
  {
    id v22 = _HKPausedIntervalsWithWorkoutEvents();
    id v33 = 0;
    char v23 = [v7 setMaskedIntervals:v22 error:&v33];
    id v24 = v33;
    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      id v25 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v35 = v8;
        __int16 v36 = 2114;
        id v37 = v24;
        _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Failed to set mask interval for %{public}@ at workout end; will fall back on existing statistics: %{public}@",
          buf,
          0x16u);
      }
    }
  }
  id v32 = 0;
  char v26 = [v7 invalidateInterval:0 error:&v32];
  id v27 = v32;
  if ((v26 & 1) == 0)
  {
    _HKInitializeLogging();
    id v28 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = v8;
      __int16 v36 = 2114;
      id v37 = v27;
      _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Failed to update statistics for %{public}@ at workout end; will fall back on existing statistics: %{public}@",
        buf,
        0x16u);
    }
  }
  id v29 = [v7 currentStatistics];
  if (v29)
  {
    if ([v9 isEqual:*(void *)(*(void *)(a1 + 48) + 24)])
    {
      [*(id *)(a1 + 64) setObject:v29 forKeyedSubscript:v8];
    }
    else
    {
      v30 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
      [v30 _setStatistics:v29 forType:v8];
    }
  }

LABEL_20:
  return 1;
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_295(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v5 = [v3 dateInterval];
  v6 = [v5 startDate];
  if ([v4 containsDate:v6])
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    id v8 = [v3 dateInterval];
    id v9 = [v8 endDate];
    uint64_t v10 = [v7 containsDate:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_2_297(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __65__HDCreateWorkoutOperation_performWithProfile_transaction_error___block_invoke_304()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDHealthStoreServerDidAssociateWorkoutSamples" object:0];
}

- (BOOL)_associateSamplesWithUUIDs:(void *)a3 activityUUID:(uint64_t)a4 type:(void *)a5 profile:(uint64_t)a6 error:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a1)
  {
    if (v12) {
      BOOL v14 = [[HDAssociatableObjectReference alloc] initWithUUID:v12 objectClass:objc_opt_class()];
    }
    else {
      BOOL v14 = 0;
    }
    uint64_t v15 = *(void *)(a1 + 24);
    uint64_t v18 = 0;
    BOOL v16 = +[HDAssociationEntity associateSampleUUIDs:v11 withSampleUUID:v15 type:a4 destinationSubObjectReference:v14 lastInsertedEntityID:&v18 profile:v13 error:a6];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

BOOL __105__HDCreateWorkoutOperation__associateQuantitySamplesWithWorkout_builderEntity_profile_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = (void *)MEMORY[0x1E4F65D08];
  v6 = HDDataEntityPredicateForDataUUID();
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  v87[0] = v6;
  v87[1] = v8;
  id v9 = [v7 metadataManager];
  uint64_t v75 = *MEMORY[0x1E4F2BBC0];
  uint64_t v10 = objc_msgSend(v9, "predicateWithMetadataKey:value:operatorType:");
  v87[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
  id v12 = [v5 predicateMatchingAllPredicates:v11];

  id v13 = [*(id *)(a1 + 56) databaseForEntityClass:objc_opt_class()];
  id v80 = 0;
  BOOL v14 = +[HDDataEntity anyInDatabase:v13 predicate:v12 error:&v80];
  id v15 = v80;

  if (v14)
  {
    BOOL v16 = [*(id *)(a1 + 40) metadataManager];
    uint64_t v17 = [v14 persistentID];
    uint64_t v18 = *(void *)(a1 + 64);
    id v79 = 0;
    id v19 = [v16 metadataForObjectID:v17 baseMetadata:0 keyFilter:0 statement:v18 error:&v79];
    id v20 = v79;

    if (v20)
    {
      _HKInitializeLogging();
      id v21 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v63 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        uint64_t v89 = v63;
        __int16 v90 = 2112;
        id v91 = v4;
        __int16 v92 = 2112;
        id v93 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Error retrieving metadata on effort sample:%@, error:%@", buf, 0x20u);
      }
      if (a3) {
        *a3 = v20;
      }
      else {
        _HKLogDroppedError();
      }

      goto LABEL_24;
    }
    v67 = (void *)*MEMORY[0x1E4F2BC10];
    char v23 = objc_msgSend(v19, "objectForKey:");
    id v24 = v23;
    if (!v23)
    {
      _HKInitializeLogging();
      v48 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = *(void *)(a1 + 72);
        int v50 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138543874;
        uint64_t v89 = v49;
        __int16 v90 = 2112;
        id v91 = v67;
        __int16 v92 = 2112;
        id v93 = v50;
        _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "%{public}@, Effort sample is missing %@, skipping association to workout:%@", buf, 0x20u);
      }
      goto LABEL_45;
    }
    BOOL v71 = v19;
    id v72 = v15;
    BOOL v69 = v23;
    v70 = v14;
    v73 = v12;
    id v74 = v4;
    uint64_t v25 = *(void *)(a1 + 72);
    char v26 = *(void **)(a1 + 80);
    id v27 = v23;
    id v28 = v26;
    id v29 = v28;
    if (!v25) {
      goto LABEL_34;
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v68 = v28;
    v30 = [v28 _subActivities];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:buf count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v82;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v82 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          __int16 v36 = [v35 UUID];
          id v37 = [v36 UUIDString];
          char v38 = [v37 isEqual:v27];

          if (v38)
          {
            v42 = [v35 UUID];

            id v24 = v69;
            BOOL v14 = v70;
            unint64_t v47 = 0x1E4F1C000;
            id v29 = v68;
            goto LABEL_36;
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v81 objects:buf count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    id v29 = v68;
    id v39 = [v68 metadata];
    uint64_t v40 = [v39 objectForKeyedSubscript:v75];
    int v41 = [v27 isEqual:v40];

    if (v41)
    {
      v42 = [v68 UUID];
    }
    else
    {
LABEL_34:
      v42 = 0;
    }
    id v24 = v69;
    BOOL v14 = v70;
    unint64_t v47 = 0x1E4F1C000uLL;
LABEL_36:

    if (!v42)
    {
      _HKInitializeLogging();
      v60 = *MEMORY[0x1E4F29FB8];
      id v19 = v71;
      id v15 = v72;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = *(void *)(a1 + 72);
        uint64_t v66 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 138544130;
        uint64_t v89 = v65;
        __int16 v90 = 2112;
        id v91 = v67;
        __int16 v92 = 2112;
        id v93 = 0;
        __int16 v94 = 2112;
        uint64_t v95 = v66;
        _os_log_error_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_ERROR, "%{public}@, Effort samples <%@: %@>, does not match any activity UUID on workout:%@", buf, 0x2Au);
      }
      goto LABEL_44;
    }
    id v53 = [*(id *)(a1 + 80) UUID];
    if ([v42 isEqual:v53]) {
      id v54 = 0;
    }
    else {
      id v54 = v42;
    }
    id v55 = v54;

    uint64_t v56 = *(void *)(a1 + 72);
    id v86 = v74;
    id v57 = [*(id *)(v47 + 2424) arrayWithObjects:&v86 count:1];
    BOOL v58 = *(void **)(a1 + 40);
    id v78 = 0;
    LODWORD(v56) = -[HDCreateWorkoutOperation _associateSamplesWithUUIDs:activityUUID:type:profile:error:](v56, v57, v55, 1, v58, (uint64_t)&v78);

    id v59 = v78;
    if (v56)
    {

      id v19 = v71;
      id v15 = v72;
LABEL_44:

      id v12 = v73;
      id v4 = v74;
LABEL_45:

      BOOL v22 = 1;
      goto LABEL_53;
    }
    id v61 = v59;
    id v62 = v61;
    BOOL v22 = v61 == 0;
    id v15 = v72;
    if (v61)
    {
      if (a3) {
        *a3 = v61;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v12 = v73;
    id v4 = v74;
  }
  else if (v15)
  {
    if (!a3)
    {
      _HKLogDroppedError();
LABEL_24:
      BOOL v22 = 0;
      goto LABEL_53;
    }
    BOOL v22 = 0;
    *a3 = v15;
  }
  else
  {
    uint64_t v43 = *(void *)(a1 + 72);
    id v85 = v4;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    id v45 = *(void **)(a1 + 40);
    id v77 = 0;
    LODWORD(v43) = -[HDCreateWorkoutOperation _associateSamplesWithUUIDs:activityUUID:type:profile:error:](v43, v44, 0, 0, v45, (uint64_t)&v77);
    id v46 = v77;

    if (v43)
    {

      BOOL v22 = 1;
      id v15 = 0;
    }
    else
    {
      id v51 = v46;
      v52 = v51;
      BOOL v22 = v51 == 0;
      id v15 = 0;
      if (v51)
      {
        if (a3) {
          *a3 = v51;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
LABEL_53:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCreateWorkoutOperation)initWithCoder:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HDCreateWorkoutOperation;
  v5 = [(HDCreateWorkoutOperation *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workout_configuration"];
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date_interval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

    id v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"metadata"];
    uint64_t v14 = objc_msgSend(v13, "hk_replaceKeysFromSharedStringCache");
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    device = v5->_device;
    v5->_device = (HKDevice *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (HKSource *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source_version"];
    sourceVersion = v5->_sourceVersion;
    v5->_sourceVersion = (NSString *)v20;

    BOOL v22 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    char v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    id v24 = [v22 setWithArray:v23];
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"events"];
    events = v5->_events;
    v5->_events = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calculators"];
    statisticsCalculators = v5->_statisticsCalculators;
    v5->_statisticsCalculators = (HDWorkoutBuilderStatisticsCalculators *)v27;

    v5->_goalType = [v4 decodeIntegerForKey:@"goal_type"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goal"];
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v29;

    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    uint64_t v33 = [v31 setWithArray:v32];

    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"activities"];
    activities = v5->_activities;
    v5->_activities = (NSArray *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  workoutConfiguration = self->_workoutConfiguration;
  id v5 = a3;
  [v5 encodeObject:workoutConfiguration forKey:@"workout_configuration"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_dateInterval forKey:@"date_interval"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
  [v5 encodeObject:self->_device forKey:@"device"];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeObject:self->_sourceVersion forKey:@"source_version"];
  [v5 encodeObject:self->_events forKey:@"events"];
  [v5 encodeObject:self->_statisticsCalculators forKey:@"calculators"];
  [v5 encodeInteger:self->_goalType forKey:@"goal_type"];
  [v5 encodeObject:self->_goal forKey:@"goal"];
  [v5 encodeObject:self->_activities forKey:@"activities"];
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HKDevice)device
{
  return self->_device;
}

- (HKSource)source
{
  return self->_source;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSArray)events
{
  return self->_events;
}

- (NSArray)activities
{
  return self->_activities;
}

- (HDWorkoutBuilderStatisticsCalculators)statisticsCalculators
{
  return self->_statisticsCalculators;
}

- (NSArray)associatedSeries
{
  return self->_associatedSeries;
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (NSArray)quantityTypesIncludedWhilePaused
{
  return self->_quantityTypesIncludedWhilePaused;
}

- (HKWorkout)createdWorkout
{
  return self->_createdWorkout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdWorkout, 0);
  objc_storeStrong((id *)&self->_quantityTypesIncludedWhilePaused, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_associatedSeries, 0);
  objc_storeStrong((id *)&self->_statisticsCalculators, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end