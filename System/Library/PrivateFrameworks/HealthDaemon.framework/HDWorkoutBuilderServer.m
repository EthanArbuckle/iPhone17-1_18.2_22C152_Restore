@interface HDWorkoutBuilderServer
+ (BOOL)finishAllDetachedWorkoutBuildersExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)finishAllWorkoutBuildersForClient:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)recoveredWorkoutBuilderConfigurationForClient:(id)a3 sessionIdentifier:(id)a4 builderIdentifierOut:(id *)a5 profile:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
+ (void)finishDetachedBuilderForEntity:(id)a3 sessionEndDate:(id)a4 profile:(id)a5;
- (BOOL)_addMetadata:(int)a3 byPassPrivateKeyCheck:(uint64_t)a4 error:;
- (BOOL)_insertWorkoutEvents:(uint64_t)a3 error:;
- (BOOL)enumerateQuantitiesOfType:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateSamplesOfTypes:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)invalidated;
- (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider)_lock_sourceOrderProviderForQuantityType:(uint64_t)a1;
- (HDWorkoutBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HDWorkoutBuilderStatisticsDataSource)_lock_statisticsDataSourceForQuantityType:(uint64_t)a1;
- (HKDataFlowLink)workoutDataFlowLink;
- (NSString)description;
- (id)_lock_createStatisticsCalculatorsForQuantityType:(uint64_t)a3 mergeStrategy:(uint64_t)a4 computationMethod:(void *)a5 startDate:(void *)a6 endDate:;
- (id)_lock_maskedIntervalsForStatisticsOfType:(void *)a3 startDate:(void *)a4 endDate:;
- (id)_lock_statisticsCalculatorsForQuantityType:(uint64_t)a3 mergeStrategy:(uint64_t)a4 computationMethod:;
- (id)currentEvents;
- (id)currentMetadata;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)startDate;
- (uint64_t)_addWorkoutActivity:(uint64_t)a3 error:;
- (uint64_t)_associateZonesSamplesIfNeededWithError:(id *)a1;
- (uint64_t)_canAddDataWithError:(uint64_t)result;
- (uint64_t)_endActivityWithUUID:(void *)a3 endDate:(void *)a4 error:;
- (uint64_t)_isActivityDateOverlapping:(void *)a3 endDate:(uint64_t)a4 error:;
- (uint64_t)_lock_didUpdateStartDate;
- (uint64_t)_runInBestWriteTransactionWithError:(void *)a3 block:;
- (uint64_t)_updateActivityWithUUID:(void *)a3 addMetadata:(void *)a4 error:;
- (uint64_t)_validateActivityDates:(uint64_t)a3 error:;
- (uint64_t)_validateAuthorizationToSaveWorkoutWithError:(void *)a1;
- (unint64_t)workoutDataDestinationState;
- (void)_addExpectedDataSourceIdentifiers:(uint64_t)a1;
- (void)_addSamples:(void *)a3 quantities:(void *)a4 dataSource:(char)a5 shouldSavePriorToStart:;
- (void)_checkForAttachedDataSources;
- (void)_didChangeElapsedTimeBasis;
- (void)_didUpdateActivities;
- (void)_didUpdateEvents:(void *)a1;
- (void)_didUpdateMetadata:(void *)a1;
- (void)_didUpdateStatistics:(void *)a1;
- (void)_discardWorkoutWithError:(void *)result;
- (void)_lock_failWithError:(uint64_t)a1;
- (void)_lock_pushCurrentConstructionState;
- (void)_persistRecoveryData;
- (void)_removeExpectedDataSourceWithIdentifiers:(uint64_t)a1;
- (void)_requestDataFromSource:(void *)a3 from:(void *)a4 to:;
- (void)_updateStatisticsPauseResumeMask;
- (void)addDataAccumulationObserver:(id)a3;
- (void)addMetadata:(id)a3 dataSource:(id)a4;
- (void)addMetadataToWorkoutActivity:(id)a3 withSampleStartDate:(id)a4 dataSource:(id)a5;
- (void)addOtherSamples:(id)a3 dataSource:(id)a4;
- (void)addQuantities:(id)a3 dataSource:(id)a4;
- (void)addSampleObserver:(id)a3;
- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4;
- (void)connectionConfigured;
- (void)connectionInvalidated;
- (void)didBeginActivity:(id)a3 dataSource:(id)a4;
- (void)didCreateTaskServer:(id)a3;
- (void)didEndActivity:(id)a3 dataSource:(id)a4;
- (void)didInvalidateTaskServer:(id)a3;
- (void)remote_addDataSourcesWithIdentifiers:(id)a3;
- (void)remote_addMetadata:(id)a3 completion:(id)a4;
- (void)remote_addSamples:(id)a3 completion:(id)a4;
- (void)remote_addWorkoutActivity:(id)a3 completion:(id)a4;
- (void)remote_addWorkoutEvents:(id)a3 completion:(id)a4;
- (void)remote_currentZonesForType:(id)a3 completion:(id)a4;
- (void)remote_recoverWithCompletion:(id)a3;
- (void)remote_removeDataSourcesWithIdentifiers:(id)a3;
- (void)remote_removeMetadata:(id)a3 completion:(id)a4;
- (void)remote_setShouldCollectEvents:(BOOL)a3;
- (void)remote_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4;
- (void)remote_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4;
- (void)remote_setTargetConstructionState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)remote_updateActivityWithUUID:(id)a3 addMetadata:(id)a4 completion:(id)a5;
- (void)remote_updateActivityWithUUID:(id)a3 endDate:(id)a4 completion:(id)a5;
- (void)remote_updateDevice:(id)a3;
- (void)removeDataAccumulationObserver:(id)a3;
- (void)removeSampleObserver:(id)a3;
- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6;
- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8;
- (void)updateWorkoutConfiguration:(id)a3 dataSource:(id)a4;
@end

@implementation HDWorkoutBuilderServer

+ (id)recoveredWorkoutBuilderConfigurationForClient:(id)a3 sessionIdentifier:(id)a4 builderIdentifierOut:(id *)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__171;
  v36 = __Block_byref_object_dispose__171;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__171;
  v30 = __Block_byref_object_dispose__171;
  id v31 = 0;
  v14 = [v13 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __125__HDWorkoutBuilderServer_recoveredWorkoutBuilderConfigurationForClient_sessionIdentifier_builderIdentifierOut_profile_error___block_invoke;
  v20[3] = &unk_1E630A0B0;
  id v15 = v13;
  id v21 = v15;
  id v16 = v11;
  id v22 = v16;
  id v17 = v12;
  id v23 = v17;
  v24 = &v26;
  v25 = &v32;
  LOBYTE(a7) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a7 block:v20];

  if (a7)
  {
    if (a5) {
      *a5 = (id) v27[5];
    }
    id v18 = (id)v33[5];
  }
  else
  {
    id v18 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

uint64_t __125__HDWorkoutBuilderServer_recoveredWorkoutBuilderConfigurationForClient_sessionIdentifier_builderIdentifierOut_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = [*(id *)(a1 + 32) sourceManager];
  uint64_t v8 = *(void *)(a1 + 40);
  id v45 = 0;
  v9 = [v7 sourceForClient:v8 error:&v45];
  id v10 = v45;

  if (!v9)
  {
    id v21 = v10;
    id v12 = v21;
    if (!v21)
    {
      char v22 = 1;
      goto LABEL_39;
    }
    if (a3)
    {
      id v12 = v21;
      char v22 = 0;
      *a3 = v12;
      goto LABEL_39;
    }
    _HKLogDroppedError();
LABEL_28:
    char v22 = 0;
    goto LABEL_39;
  }
  id v11 = +[HDWorkoutBuilderEntity workoutBuilderEntitiesForSource:v9 profile:*(void *)(a1 + 32) error:a3];
  if (!v11)
  {
    id v12 = 0;
    goto LABEL_28;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v13)
  {
    char v20 = 1;
    goto LABEL_38;
  }
  uint64_t v14 = v13;
  v38 = v9;
  id v39 = v10;
  uint64_t v15 = *(void *)v42;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v42 != v15) {
        objc_enumerationMutation(v12);
      }
      id v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      id v40 = 0;
      id v17 = [v16 sessionIdentifierWithTransaction:v6 error:&v40];
      id v18 = v40;
      v19 = v18;
      if (v17)
      {
        if ([v17 isEqual:*(void *)(a1 + 48)])
        {
          id v23 = [v16 configurationWithTransaction:v6 error:a3];
          v24 = v23;
          if (!v23)
          {
            LOBYTE(i) = 0;
            v9 = v38;
LABEL_33:

LABEL_36:
            char v20 = 0;
            goto LABEL_37;
          }
          v25 = [v23 deviceEntity];
          if (v25)
          {
            uint64_t v26 = [*(id *)(a1 + 32) deviceManager];
            v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v25, "persistentID"));
            uint64_t v28 = [v26 deviceForPersistentID:v27 error:a3];

            if (!v28)
            {
              LOBYTE(i) = 0;
LABEL_32:
              v9 = v38;

              goto LABEL_33;
            }
          }
          else
          {
            uint64_t v28 = 0;
          }
          uint64_t v29 = [v24 builderIdentifier];
          uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
          id v31 = *(void **)(v30 + 40);
          *(void *)(v30 + 40) = v29;

          id v32 = objc_alloc_init(MEMORY[0x1E4F2B730]);
          uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v34 = *(void **)(v33 + 40);
          *(void *)(v33 + 40) = v32;

          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDevice:v28];
          v35 = [v24 workoutConfiguration];
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setWorkoutConfiguration:v35];

          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setGoalType:", objc_msgSend(v24, "goalType"));
          v36 = [v24 goal];
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setGoal:v36];

          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setShouldCollectWorkoutEvents:", objc_msgSend(v24, "shouldCollectWorkoutEvents"));
          LOBYTE(i) = 1;
          goto LABEL_32;
        }
      }
      else if (v18)
      {
        if (a3)
        {
          LOBYTE(i) = 0;
          *a3 = v18;
        }
        else
        {
          _HKLogDroppedError();
          LOBYTE(i) = 0;
        }
        v9 = v38;
        goto LABEL_36;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v14) {
      continue;
    }
    break;
  }
  char v20 = 1;
  v9 = v38;
LABEL_37:
  id v10 = v39;
LABEL_38:

  char v22 = v20 | i;
LABEL_39:

  return v22 & 1;
}

+ (void)finishDetachedBuilderForEntity:(id)a3 sessionEndDate:(id)a4 profile:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy__171;
  id v45 = __Block_byref_object_dispose__171;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__171;
  id v39 = __Block_byref_object_dispose__171;
  id v40 = 0;
  id v10 = [v9 database];
  id v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__HDWorkoutBuilderServer_finishDetachedBuilderForEntity_sessionEndDate_profile___block_invoke;
  v28[3] = &unk_1E630A0D8;
  id v11 = v7;
  id v29 = v11;
  id v32 = &v35;
  id v12 = v9;
  id v30 = v12;
  id v13 = v8;
  id v31 = v13;
  uint64_t v33 = &v41;
  BOOL v14 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:&v34 block:v28];
  id v15 = v34;

  if (v14)
  {
    if (v36[5])
    {
      if (v42[5])
      {
        id v16 = +[HDWorkoutBuilderEntity finishWorkoutBuilderWithIdentifier:dateInterval:profile:error:](HDWorkoutBuilderEntity, "finishWorkoutBuilderWithIdentifier:dateInterval:profile:error:");
        id v17 = v15;

        if (v16 || !v17)
        {
          _HKInitializeLogging();
          v24 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            v25 = (void *)v36[5];
            *(_DWORD *)buf = 138543362;
            id v48 = v25;
            _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Finished workout builder %{public}@", buf, 0xCu);
          }
        }
        else
        {
          _HKInitializeLogging();
          id v18 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v48 = v17;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to finish workout builder: %{public}@", buf, 0xCu);
          }
        }

        id v15 = v17;
      }
      else
      {
        BOOL v20 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "discardBuilderWithIdentifier:profile:error:");
        id v21 = v15;

        if (v20)
        {
          _HKInitializeLogging();
          char v22 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            id v23 = (void *)v36[5];
            *(_DWORD *)buf = 138543362;
            id v48 = v23;
            _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "Discarded builder %{public}@", buf, 0xCu);
          }
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v26 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)v36[5];
            *(_DWORD *)buf = 138543618;
            id v48 = v27;
            __int16 v49 = 2114;
            id v50 = v21;
            _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Failed to discard builder %{public}@: %{public}@", buf, 0x16u);
          }
        }
        id v15 = v21;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v48 = v11;
      __int16 v49 = 2114;
      id v50 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to lookup current status for builder entity %{public}@: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
}

uint64_t __80__HDWorkoutBuilderServer_finishDetachedBuilderForEntity_sessionEndDate_profile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v57 = 0;
  id v7 = [v6 configurationWithTransaction:v5 error:&v57];
  id v8 = v57;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v7 builderIdentifier];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v13 = [*(id *)(a1 + 40) daemon];
    BOOL v14 = [v13 taskServerRegistry];
    id v15 = [v14 taskServerForTaskUUID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 invalidated] & 1) == 0)
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543362;
        v59 = v26;
        _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "Not automatically finishing builder %{public}@: Builder server is still present.", buf, 0xCu);
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
      id v19 = *(id *)(v27 + 40);
      *(void *)(v27 + 40) = 0;
      uint64_t v20 = 1;
      goto LABEL_47;
    }
    id v16 = *(void **)(a1 + 32);
    id v56 = 0;
    id v17 = [v16 dataIntervalInTransaction:v5 error:&v56];
    id v18 = v56;
    id v19 = v18;
    if (!v17 && v18)
    {
      if (a3)
      {
LABEL_7:
        id v19 = v19;
        uint64_t v20 = 0;
        *a3 = v19;
LABEL_46:

LABEL_47:
        goto LABEL_48;
      }
LABEL_14:
      _HKLogDroppedError();
      uint64_t v20 = 0;
      goto LABEL_46;
    }

    char v22 = *(void **)(a1 + 32);
    id v55 = 0;
    id v23 = [v22 startDateInTransaction:v5 error:&v55];
    id v24 = v55;
    id v19 = v24;
    if (!v23 && v24)
    {
      if (a3) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
    v53 = v17;

    uint64_t v28 = *(void **)(a1 + 32);
    id v54 = 0;
    uint64_t v29 = [v28 endDateInTransaction:v5 error:&v54];
    id v30 = v54;
    id v19 = v30;
    id v31 = (void *)v29;
    if (v29) {
      BOOL v32 = 1;
    }
    else {
      BOOL v32 = v30 == 0;
    }
    uint64_t v20 = v32;
    if (!v32)
    {
      if (a3) {
        *a3 = v30;
      }
      else {
        _HKLogDroppedError();
      }
      id v17 = v53;
      goto LABEL_45;
    }
    if (!v23)
    {
      id v23 = [v53 startDate];
    }
    id v33 = v31;
    id v17 = v53;
    if (!v33)
    {
      id v33 = [v53 endDate];
      if (!v33 || objc_msgSend(*(id *)(a1 + 48), "hk_isBeforeDate:", v33))
      {
        id v34 = *(id *)(a1 + 48);
        uint64_t v35 = v33;
        id v33 = v34;
      }
    }
    v52 = v33;
    if (v23 && v33)
    {
      if (!objc_msgSend(v23, "hk_isAfterOrEqualToDate:", v33))
      {
        uint64_t v43 = [MEMORY[0x1E4F2B448] workoutType];
        uint64_t v51 = v43;
        if ([v43 isMaximumDurationRestricted])
        {
          [v43 maximumAllowedDuration];
          id v50 = objc_msgSend(v23, "dateByAddingTimeInterval:");
          uint64_t v49 = HKDateMin();

          long long v44 = (void *)v49;
        }
        else
        {
          long long v44 = v52;
        }
        uint64_t v45 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v23 endDate:v44];
        uint64_t v46 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v47 = *(void **)(v46 + 40);
        *(void *)(v46 + 40) = v45;

        goto LABEL_45;
      }
      _HKInitializeLogging();
      v36 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v59 = v23;
      __int16 v60 = 2114;
      v61 = v52;
      __int16 v62 = 2114;
      uint64_t v63 = v37;
      v38 = "Invalid start/end date (%{public}@, %{public}@) for detached builder %{public}@: discarding workout.";
      id v39 = v36;
      uint32_t v40 = 32;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v41 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
LABEL_42:

LABEL_45:
        goto LABEL_46;
      }
      id v48 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v59 = v48;
      v38 = "Unable to determine a date interval for detached builder %{public}@: discarding workout.";
      id v39 = v41;
      uint32_t v40 = 12;
    }
    _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_42;
  }
  id v21 = v8;
  id v15 = v21;
  if (v21)
  {
    if (a3)
    {
      id v15 = v21;
      uint64_t v20 = 0;
      *a3 = v15;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 1;
  }
LABEL_48:

  return v20;
}

+ (BOOL)finishAllWorkoutBuildersForClient:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 sourceManager];
  uint64_t v11 = [v10 sourceForClient:v8 error:a5];

  id v12 = +[HDWorkoutBuilderEntity workoutBuilderEntitiesForSource:v11 profile:v9 error:a5];
  id v13 = v12;
  if (v12)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [a1 finishDetachedBuilderForEntity:*(void *)(*((void *)&v19 + 1) + 8 * v17++) sessionEndDate:0 profile:v9];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }

  return v13 != 0;
}

+ (BOOL)finishAllDetachedWorkoutBuildersExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = +[HDWorkoutBuilderEntity workoutBuilderEntitiesExcludingSessions:a3 profile:v8 error:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [a1 finishDetachedBuilderForEntity:*(void *)(*((void *)&v16 + 1) + 8 * v14++) sessionEndDate:0 profile:v8];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }

  return v10 != 0;
}

- (BOOL)invalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (HDWorkoutBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v74.receiver = self;
  v74.super_class = (Class)HDWorkoutBuilderServer;
  uint64_t v12 = [(HDStandardTaskServer *)&v74 initWithUUID:v10 configuration:v11 client:a5 delegate:a6];
  if (v12)
  {
    _HKInitializeLogging();
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_configuration, a4);
    uint64_t v13 = objc_alloc_init(HDWorkoutBuilderStatisticsCalculators);
    statisticsCalculators = v12->_statisticsCalculators;
    v12->_statisticsCalculators = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sourceOrderProvidersByType = v12->_sourceOrderProvidersByType;
    v12->_sourceOrderProvidersByType = v15;

    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statisticsDataSourcesByType = v12->_statisticsDataSourcesByType;
    v12->_statisticsDataSourcesByType = v17;

    long long v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    quantityTypesRequiringCalculatorInvalidation = v12->_quantityTypesRequiringCalculatorInvalidation;
    v12->_quantityTypesRequiringCalculatorInvalidation = v19;

    id v21 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    long long v22 = (void *)MEMORY[0x1E4F29FB8];
    uint64_t v23 = [v21 initWithName:@"sample-observers" loggingCategory:*MEMORY[0x1E4F29FB8]];
    sampleObservers = v12->_sampleObservers;
    v12->_sampleObservers = (HKObserverSet *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F2B2D0]) initWithName:@"data-accumulator-observers" loggingCategory:*v22];
    dataAccumulatorObservers = v12->_dataAccumulatorObservers;
    v12->_dataAccumulatorObservers = (HKObserverSet *)v25;

    uint64_t v27 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    expectedDataSourceUUIDs = v12->_expectedDataSourceUUIDs;
    v12->_expectedDataSourceUUIDs = v27;

    uint64_t v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    quantityTypesIncludedWhilePaused = v12->_quantityTypesIncludedWhilePaused;
    v12->_quantityTypesIncludedWhilePaused = v29;

    id v31 = v11;
    id v32 = v10;
    uint64_t v33 = self;
    id v72 = v10;
    id v34 = (void *)MEMORY[0x1E4F2B588];
    [v31 associatedSessionUUID];
    uint64_t v35 = v71 = v11;

    if (v35) {
      id v36 = v35;
    }
    else {
      id v36 = v32;
    }
    v70 = [v34 nameForOwner:v33 UUID:v36 tag:0];

    uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F2B588]) initWithName:v70];
    v38 = [v37 addStateWithIndex:0 label:@"Ready"];
    id v39 = [v37 addStateWithIndex:1 label:@"Active"];
    uint32_t v40 = [v37 addStateWithIndex:2 label:@"AwaitingDataSources"];
    v73 = [v37 addStateWithIndex:3 label:@"AwaitingFinalData"];
    uint64_t v41 = [v37 addStateWithIndex:4 label:@"Ended"];
    v68 = [v37 addStateWithIndex:5 label:@"Saving"];
    long long v42 = [v37 addStateWithIndex:6 label:@"Finalized"];
    uint64_t v43 = [v37 addStateWithIndex:7 label:@"Error"];
    v69 = [v37 addStateWithIndex:8 label:@"Discarded"];
    id v44 = (id)[v37 addStateTransitionFrom:v38 to:v39 event:1 label:@"activate"];
    id v45 = (id)[v37 addStateTransitionFrom:v38 to:v39 event:2 label:@"end"];
    id v46 = (id)[v37 addStateTransitionFrom:v38 to:v39 event:3 label:@"finish"];
    id v47 = (id)[v37 addStateTransitionFrom:v39 to:v40 event:2 label:@"end"];
    id v48 = (id)[v37 addStateTransitionFrom:v39 to:v40 event:3 label:@"finish"];
    id v49 = (id)[v37 addStateTransitionFrom:v40 to:v73 event:101 label:@"attach-data-sources"];
    id v50 = (id)[v37 addStateTransitionFrom:v73 to:v41 event:102 label:@"receive-final-data"];
    id v51 = (id)[v37 addStateTransitionFrom:v41 to:v68 event:3 label:@"finish"];
    id v52 = (id)[v37 addStateTransitionFrom:v68 to:v42 event:103 label:@"saved-workout"];
    id v53 = (id)[v37 addStateTransitionFrom:v38 to:v43 event:100 label:@"error"];
    id v54 = (id)[v37 addStateTransitionFrom:v39 to:v43 event:100 label:@"error"];
    id v55 = (id)[v37 addStateTransitionFrom:v41 to:v43 event:100 label:@"error"];
    id v56 = (id)[v37 addStateTransitionFrom:v68 to:v43 event:100 label:@"error"];
    id v57 = (id)[v37 addStateTransitionFrom:v42 to:v43 event:100 label:@"error"];
    id v58 = (id)[v37 addStateTransitionFrom:v38 to:v69 event:4 label:@"discarded"];
    id v59 = (id)[v37 addStateTransitionFrom:v39 to:v69 event:4 label:@"discarded"];
    id v60 = (id)[v37 addStateTransitionFrom:v41 to:v69 event:4 label:@"discarded"];

    id v11 = v71;
    stateMachine = v12->_stateMachine;
    v12->_stateMachine = (HKStateMachine *)v37;
    id v10 = v72;

    [(HKStateMachine *)v12->_stateMachine setDelegate:v12];
    uint64_t v62 = HKCreateSerialDispatchQueue();
    upstreamQueue = v12->_upstreamQueue;
    v12->_upstreamQueue = (OS_dispatch_queue *)v62;

    _HKInitializeLogging();
    id v64 = objc_alloc(MEMORY[0x1E4F2AEC0]);
    uint64_t v65 = [v64 initWithProcessor:v12 sourceProtocol:&unk_1F17F7298 destinationProtocol:&unk_1F180F9A8 loggingCategory:*MEMORY[0x1E4F29FB8]];
    workoutDataFlowLink = v12->_workoutDataFlowLink;
    v12->_workoutDataFlowLink = (HKDataFlowLink *)v65;
  }
  return v12;
}

- (void)connectionConfigured
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];

  if (v4)
  {
    id v5 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];
    v19[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    -[HDWorkoutBuilderServer _addExpectedDataSourceIdentifiers:]((uint64_t)self, v6);

    id v7 = [(HDStandardTaskServer *)self profile];
    id v8 = [v7 daemon];
    id v9 = [v8 taskServerRegistry];
    id v10 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];
    [v9 addObserver:self forTaskServerUUID:v10 queue:0];
  }
  id v11 = [(HDStandardTaskServer *)self profile];
  uint64_t v12 = [v11 database];
  v17[4] = self;
  id v18 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__HDWorkoutBuilderServer__loadOrCreatePersistentEntity__block_invoke;
  v17[3] = &unk_1E62F6130;
  BOOL v13 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:&v18 block:v17];
  id v14 = v18;

  if (v13)
  {
    -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask]((uint64_t)self);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, v14);
    os_unfair_lock_unlock(&self->_lock);
  }

  uint64_t v15 = [(HKStateMachine *)self->_stateMachine currentState];

  if (!v15)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HDWorkoutBuilderServer.m" lineNumber:472 description:@"Failed to initialize current state after loading or creating our persistent entity."];
  }
}

- (void)_addExpectedDataSourceIdentifiers:(uint64_t)a1
{
  if (a1)
  {
    v3 = *(void **)(a1 + 120);
    id v4 = a2;
    id v5 = [v3 allSourceProcessors];
    objc_msgSend(v5, "hk_map:", &__block_literal_global_669);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [v4 arrayByExcludingObjectsInArray:v9];

    if ([v6 count])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      uint64_t v7 = [*(id *)(a1 + 128) setByAddingObjectsFromArray:v6];
      id v8 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v7;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2BC68];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = [a3 workoutConfiguration];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"nil workoutConfiguration");
  }
  return v6 != 0;
}

- (NSString)description
{
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];
  uint64_t v7 = objc_msgSend(v6, "hk_shortRepresentation");
  id v8 = v7;
  if (!v7)
  {
    unsigned __int8 v2 = [(HDStandardTaskServer *)self taskUUID];
    id v8 = objc_msgSend(v2, "hk_shortRepresentation");
  }
  id v9 = [(HKStateMachine *)self->_stateMachine currentState];
  id v10 = [v4 stringWithFormat:@"<%@_%@ %@>", v5, v8, v9];

  if (!v7)
  {
  }

  return (NSString *)v10;
}

- (void)_persistRecoveryData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 10);
    double Current = CFAbsoluteTimeGetCurrent();
    v3 = [(os_unfair_lock *)a1 profile];
    id v4 = [v3 database];
    v11[4] = a1;
    id v12 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__HDWorkoutBuilderServer__persistRecoveryData__block_invoke;
    v11[3] = &unk_1E62F6130;
    BOOL v5 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v4 error:&v12 block:v11];
    id v6 = v12;

    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FB8];
    id v8 = *MEMORY[0x1E4F29FB8];
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v7;
        CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 138543618;
        id v14 = a1;
        __int16 v15 = 2048;
        double v16 = v10 - Current;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Persisted recovery state in %.2lfs", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = a1;
      __int16 v15 = 2114;
      double v16 = *(double *)&v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist recovery data: %{public}@", buf, 0x16u);
    }
  }
}

BOOL __46__HDWorkoutBuilderServer__persistRecoveryData__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  unsigned __int8 v2 = *(const os_unfair_lock **)(a1 + 32);
  if (v2)
  {
    os_unfair_lock_assert_owner(v2 + 10);
    v3 = *(os_unfair_lock_s **)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  os_unfair_lock_unlock(v3 + 10);
  return v2 != 0;
}

- (uint64_t)_validateAuthorizationToSaveWorkoutWithError:(void *)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F2B448] workoutType];
  BOOL v5 = [a1 client];
  id v6 = [v5 authorizationOracle];
  uint64_t v7 = [v6 readAuthorizationStatusForType:v4 error:a2];

  if (!v7) {
    goto LABEL_7;
  }
  if ([v7 authorizationStatus] != 101 && objc_msgSend(v7, "authorizationStatus") != 102)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 4, @"Not authorized");
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

uint64_t __55__HDWorkoutBuilderServer__loadOrCreatePersistentEntity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  id v6 = a2;
  os_unfair_lock_lock(v5);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v6;
  if (!v7)
  {
    uint64_t v36 = 0;
    goto LABEL_111;
  }
  id v129 = 0;
  int v9 = -[HDWorkoutBuilderServer _validateAuthorizationToSaveWorkoutWithError:]((void *)v7, (uint64_t)&v129);
  id v10 = v129;
  if (v9)
  {
    id v127 = v10;
    id v11 = [(id)v7 taskUUID];
    id v12 = [(id)v7 profile];
    id v128 = 0;
    uint64_t v13 = +[HDWorkoutBuilderEntity workoutBuilderEntityWithIdentifier:v11 profile:v12 error:&v128];
    id v14 = v128;
    __int16 v15 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v13;

    if (*(void *)(v7 + 48)) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v14 == 0;
    }
    if (!v16)
    {
      if (a3)
      {
        uint64_t v36 = 0;
        *a3 = v14;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v36 = 0;
      }
      goto LABEL_109;
    }
    id v126 = v14;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 40));
    uint64_t v17 = objc_alloc_init(HDWorkoutBuilderPersistedConfiguration);
    id v18 = [(id)v7 taskUUID];
    [(HDWorkoutBuilderPersistedConfiguration *)v17 setBuilderIdentifier:v18];

    long long v19 = [*(id *)(v7 + 168) workoutConfiguration];
    [(HDWorkoutBuilderPersistedConfiguration *)v17 setWorkoutConfiguration:v19];

    long long v20 = [(id)v7 profile];
    id v21 = [v20 sourceManager];
    long long v22 = [(id)v7 client];
    uint64_t v23 = [v21 createOrUpdateSourceForClient:v22 error:a3];
    [(HDWorkoutBuilderPersistedConfiguration *)v17 setSourceEntity:v23];

    uint64_t v24 = [(HDWorkoutBuilderPersistedConfiguration *)v17 sourceEntity];

    if (!v24) {
      goto LABEL_16;
    }
    uint64_t v25 = [(id)v7 client];
    uint64_t v26 = [v25 sourceVersion];
    [(HDWorkoutBuilderPersistedConfiguration *)v17 setSourceVersion:v26];

    uint64_t v27 = [*(id *)(v7 + 168) device];

    if (!v27) {
      goto LABEL_11;
    }
    uint64_t v28 = [(id)v7 profile];
    uint64_t v29 = [v28 deviceManager];
    id v30 = [*(id *)(v7 + 168) device];
    id v31 = [v29 deviceEntityForDevice:v30 error:a3];
    [(HDWorkoutBuilderPersistedConfiguration *)v17 setDeviceEntity:v31];

    id v32 = [(HDWorkoutBuilderPersistedConfiguration *)v17 deviceEntity];

    if (v32)
    {
LABEL_11:
      uint64_t v33 = [(id)v7 client];
      int v34 = [v33 hasEntitlement:*MEMORY[0x1E4F2A548]];

      if (v34)
      {
        -[HDWorkoutBuilderPersistedConfiguration setGoalType:](v17, "setGoalType:", [*(id *)(v7 + 168) goalType]);
        uint64_t v35 = [*(id *)(v7 + 168) goal];
        [(HDWorkoutBuilderPersistedConfiguration *)v17 setGoal:v35];
      }
      else
      {
        [(HDWorkoutBuilderPersistedConfiguration *)v17 setGoalType:0];
        [(HDWorkoutBuilderPersistedConfiguration *)v17 setGoal:0];
      }
      id v14 = v126;
      uint64_t v37 = v17;

      if (!v37) {
        goto LABEL_48;
      }
      v38 = *(void **)(v7 + 48);
      if (v38)
      {
        id v39 = [v38 configurationWithTransaction:v8 error:a3];
        uint32_t v40 = v39;
        if (v39)
        {
          if ([v39 isEqual:v37])
          {
            v125 = v40;
            id v41 = v8;
            os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 40));
            id v42 = objc_alloc_init(MEMORY[0x1E4F2B748]);
            uint64_t v43 = [*(id *)(v7 + 48) metadataWithTransaction:v41 error:a3];
            if (v43)
            {
              id v124 = v43;
              uint64_t v44 = [v43 mutableCopy];
              id v45 = *(void **)(v7 + 176);
              *(void *)(v7 + 176) = v44;

              id v46 = *(void **)(v7 + 48);
              v138[0] = MEMORY[0x1E4F143A8];
              v138[1] = 3221225472;
              v138[2] = __74__HDWorkoutBuilderServer__lock_recoverPersistedDataWithTransaction_error___block_invoke;
              v138[3] = &unk_1E630A100;
              v138[4] = v7;
              id v123 = v42;
              id v47 = v42;
              id v139 = v47;
              if (![v46 enumerateStatisticsInTransaction:v41 error:a3 block:v138]) {
                goto LABEL_57;
              }
              id v48 = [*(id *)(v7 + 48) workoutEventsInTransaction:v41 error:a3];
              uint64_t v49 = [v48 sortedArrayUsingSelector:sel_compare_];
              id v50 = *(void **)(v7 + 184);
              *(void *)(v7 + 184) = v49;

              if (*(void *)(v7 + 184))
              {
                id v51 = [*(id *)(v7 + 48) workoutActivitiesInTransaction:v41 error:a3];
                if (v51)
                {
                  v118 = v47;
                  v122 = v51;
                  if ([*(id *)(v7 + 184) count])
                  {
                    id v119 = v41;
                    long long v136 = 0u;
                    long long v137 = 0u;
                    long long v134 = 0u;
                    long long v135 = 0u;
                    id v52 = v51;
                    uint64_t v53 = [v52 countByEnumeratingWithState:&v134 objects:v141 count:16];
                    if (v53)
                    {
                      uint64_t v54 = v53;
                      uint64_t v55 = *(void *)v135;
                      do
                      {
                        for (uint64_t i = 0; i != v54; ++i)
                        {
                          if (*(void *)v135 != v55) {
                            objc_enumerationMutation(v52);
                          }
                          [*(id *)(*((void *)&v134 + 1) + 8 * i) _filterAndSetWorkoutEvents:*(void *)(v7 + 184)];
                        }
                        uint64_t v54 = [v52 countByEnumeratingWithState:&v134 objects:v141 count:16];
                      }
                      while (v54);
                    }

                    id v41 = v119;
                    id v51 = v122;
                  }
                  id v57 = objc_msgSend(v51, "hk_mapToDictionary:", &__block_literal_global_210);
                  uint64_t v58 = [v57 mutableCopy];
                  id v59 = *(void **)(v7 + 192);
                  *(void *)(v7 + 192) = v58;

                  id v60 = *(void **)(v7 + 48);
                  id v133 = 0;
                  uint64_t v61 = [v60 startDateInTransaction:v41 error:&v133];
                  id v62 = v133;
                  uint64_t v63 = *(void **)(v7 + 200);
                  *(void *)(v7 + 200) = v61;

                  id v121 = v62;
                  if (*(void *)(v7 + 200)) {
                    BOOL v64 = 1;
                  }
                  else {
                    BOOL v64 = v62 == 0;
                  }
                  if (v64)
                  {
                    uint64_t v65 = *(void **)(v7 + 48);
                    id v132 = 0;
                    uint64_t v66 = [v65 endDateInTransaction:v41 error:&v132];
                    id v67 = v132;
                    v68 = *(void **)(v7 + 208);
                    *(void *)(v7 + 208) = v66;

                    if (*(void *)(v7 + 208) || !v67)
                    {
                      id v117 = v67;
                      v79 = *(void **)(v7 + 48);
                      id v131 = 0;
                      uint64_t v80 = [v79 dataIntervalInTransaction:v41 error:&v131];
                      id v81 = v131;
                      v82 = *(void **)(v7 + 216);
                      *(void *)(v7 + 216) = v80;

                      if (*(void *)(v7 + 216) || !v81)
                      {
                        id v116 = v81;
                        v83 = *(void **)(v7 + 48);
                        id v130 = 0;
                        v84 = [v83 quantityTypesIncludedWhilePausedInTransaction:v41 error:&v130];
                        id v85 = v130;
                        v86 = v85;
                        if (v84) {
                          BOOL v87 = 1;
                        }
                        else {
                          BOOL v87 = v85 == 0;
                        }
                        uint64_t v36 = v87;
                        if (v87)
                        {
                          id v114 = v85;
                          v115 = v84;
                          id v120 = v41;
                          uint64_t v88 = [MEMORY[0x1E4F1CAD0] setWithArray:v84];
                          v89 = *(void **)(v7 + 80);
                          *(void *)(v7 + 80) = v88;

                          uint64_t v90 = *(void *)(v7 + 200);
                          uint64_t v91 = *(void *)(v7 + 208);
                          if (*(_OWORD *)(v7 + 200) == 0)
                          {
                            [*(id *)(v7 + 136) enterAtState:0];
                            char v92 = 0;
                            uint64_t v93 = 0;
                          }
                          else if (!v90 || v91)
                          {
                            v95 = *(void **)(v7 + 136);
                            if (v90 && v91)
                            {
                              [v95 enterAtState:4];
                              char v92 = 0;
                              uint64_t v93 = 2;
                            }
                            else
                            {
                              [v95 enterAtState:7];
                              char v92 = 1;
                              uint64_t v93 = 4;
                            }
                          }
                          else
                          {
                            uint64_t v93 = 1;
                            [*(id *)(v7 + 136) enterAtState:1];
                            char v92 = 0;
                          }
                          *(void *)(v7 + 144) = v93;
                          os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 40));
                          v96 = [(id)v7 client];
                          v97 = [v96 connection];
                          *(void *)&long long buf = MEMORY[0x1E4F143A8];
                          *((void *)&buf + 1) = 3221225472;
                          v143 = __51__HDWorkoutBuilderServer__lock_didUpdateActivities__block_invoke;
                          v144 = &unk_1E62F3170;
                          uint64_t v145 = v7;
                          v98 = objc_msgSend(v97, "remoteObjectProxyWithErrorHandler:", &buf, &v143);

                          v99 = [*(id *)(v7 + 192) allValues];
                          objc_msgSend(v98, "clientRemote_didUpdateActivities:", v99);

                          -[HDWorkoutBuilderServer _didUpdateStatistics:]((void *)v7, v118);
                          v100 = (void *)[*(id *)(v7 + 176) copy];
                          -[HDWorkoutBuilderServer _didUpdateMetadata:]((void *)v7, v100);

                          v101 = (void *)[*(id *)(v7 + 184) copy];
                          -[HDWorkoutBuilderServer _didUpdateEvents:]((void *)v7, v101);

                          -[HDWorkoutBuilderServer _didChangeElapsedTimeBasis]((void *)v7);
                          -[HDWorkoutBuilderServer _lock_didUpdateStartDate](v7);
                          if ((v92 & 1) == 0)
                          {
                            uint64_t v102 = *(void *)(v7 + 48);
                            v103 = [(id)v7 profile];
                            id v140 = 0;
                            v104 = +[HDWorkoutBuilderAssociatedSeriesEntity seriesForBuilder:v102 profile:v103 error:&v140];
                            id v105 = v140;

                            if (v104)
                            {
                              if ([v104 count])
                              {
                                v106 = [(id)v7 client];
                                v107 = [v106 connection];
                                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                                *((void *)&buf + 1) = 3221225472;
                                v143 = __58__HDWorkoutBuilderServer__recoverAssociatedSeriesBuilders__block_invoke;
                                v144 = &unk_1E62F3170;
                                uint64_t v145 = v7;
                                v108 = [v107 remoteObjectProxyWithErrorHandler:&buf];

                                objc_msgSend(v108, "clientRemote_didRecoverSeriesBuilders:", v104);
                              }
                            }
                            else
                            {
                              _HKInitializeLogging();
                              v109 = *MEMORY[0x1E4F29FB8];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                              {
                                LODWORD(buf) = 138543362;
                                *(void *)((char *)&buf + 4) = v105;
                                _os_log_error_impl(&dword_1BCB7D000, v109, OS_LOG_TYPE_ERROR, "Failed to recover series builders after workout builder recovery: %{public}@", (uint8_t *)&buf, 0xCu);
                              }
                            }
                          }
                          v110 = [(id)v7 client];
                          v111 = [v110 connection];
                          *(void *)&long long buf = MEMORY[0x1E4F143A8];
                          *((void *)&buf + 1) = 3221225472;
                          v143 = __44__HDWorkoutBuilderServer__didFinishRecovery__block_invoke;
                          v144 = &unk_1E62F3170;
                          uint64_t v145 = v7;
                          v112 = [v111 remoteObjectProxyWithErrorHandler:&buf];

                          objc_msgSend(v112, "clientRemote_didFinishRecovery");
                          v69 = v120;
                          v86 = v114;
                          v84 = v115;
                        }
                        else
                        {
                          v69 = v41;
                          if (a3) {
                            *a3 = v85;
                          }
                          else {
                            _HKLogDroppedError();
                          }
                        }

                        id v14 = v126;
                        v77 = v123;
                        v78 = v121;
                        id v81 = v116;
                      }
                      else
                      {
                        v69 = v41;
                        id v14 = v126;
                        v78 = v121;
                        if (a3)
                        {
                          uint64_t v36 = 0;
                          *a3 = v81;
                        }
                        else
                        {
                          _HKLogDroppedError();
                          uint64_t v36 = 0;
                        }
                        v77 = v123;
                      }

                      uint32_t v40 = v125;
                      v94 = v117;
                    }
                    else
                    {
                      v69 = v41;
                      id v14 = v126;
                      if (a3)
                      {
                        uint64_t v36 = 0;
                        *a3 = v67;
                      }
                      else
                      {
                        _HKLogDroppedError();
                        uint64_t v36 = 0;
                      }
                      v78 = v121;
                      v77 = v123;
                      v94 = v67;
                      uint32_t v40 = v125;
                    }
                  }
                  else
                  {
                    v69 = v41;
                    v78 = v62;
                    if (a3)
                    {
                      uint64_t v36 = 0;
                      *a3 = v62;
                    }
                    else
                    {
                      _HKLogDroppedError();
                      uint64_t v36 = 0;
                    }
                    uint32_t v40 = v125;
                    id v14 = v126;
                    v77 = v123;
                  }

                  id v51 = v122;
                }
                else
                {
                  v69 = v41;
                  uint64_t v36 = 0;
                  uint32_t v40 = v125;
                  id v14 = v126;
                  v77 = v123;
                }
              }
              else
              {
LABEL_57:
                v69 = v41;
                uint64_t v36 = 0;
                uint32_t v40 = v125;
                id v14 = v126;
                v77 = v42;
              }

              uint64_t v43 = v124;
            }
            else
            {
              v69 = v41;
              uint64_t v36 = 0;
              v77 = v42;
            }

            goto LABEL_107;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Workout builder configuration does not match persisted configuration for this identifier.");
        }
        uint64_t v36 = 0;
LABEL_107:

        goto LABEL_108;
      }
      if ([*(id *)(v7 + 168) requiresRecovery])
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Workout builder requires recovery but no persisted state was found.");
LABEL_48:
        uint64_t v36 = 0;
        goto LABEL_108;
      }
      uint64_t v37 = v37;
      id v70 = v8;
      id v71 = [(id)v7 profile];
      uint64_t v72 = +[HDWorkoutBuilderEntity createEntityForBuilderConfiguration:v37 profile:v71 error:a3];
      v73 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v72;

      if (!*(void *)(v7 + 48)) {
        goto LABEL_55;
      }
      objc_super v74 = [*(id *)(v7 + 168) associatedSessionUUID];

      if (!v74
        || (v75 = *(void **)(v7 + 48),
            [*(id *)(v7 + 168) associatedSessionUUID],
            v76 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v75) = [v75 setSessionIdentifier:v76 transaction:v70 error:a3],
            v76,
            v75))
      {
        [*(id *)(v7 + 136) enterAtState:0];
        uint64_t v36 = 1;
      }
      else
      {
LABEL_55:
        uint64_t v36 = 0;
      }
    }
    else
    {
LABEL_16:

      uint64_t v37 = 0;
      uint64_t v36 = 0;
    }
    id v14 = v126;
LABEL_108:

LABEL_109:
    id v10 = v127;
    goto LABEL_110;
  }
  uint64_t v36 = 0;
LABEL_110:

LABEL_111:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  return v36;
}

- (void)_updateStatisticsPauseResumeMask
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke;
    aBlock[3] = &unk_1E62F3208;
    aBlock[4] = a1;
    unsigned __int8 v2 = _Block_copy(aBlock);
    v3 = [(id)a1 profile];
    id v4 = [v3 database];
    BOOL v5 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
    id v23 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_620;
    v21[3] = &unk_1E62F8050;
    v21[4] = a1;
    id v22 = v2;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2_621;
    v19[3] = &unk_1E630A190;
    v19[4] = a1;
    id v6 = v22;
    id v20 = v6;
    char v7 = [v4 performTransactionWithContext:v5 error:&v23 block:v21 inaccessibilityHandler:v19];
    id v8 = v23;

    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      int v9 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        id v29 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open read transaction during pause/resume mask update: %{public}@", buf, 0x16u);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = objc_msgSend(*(id *)(a1 + 88), "allQuantityTypes", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(a1 + 112) addObject:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v25 count:16];
        }
        while (v12);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }
  }
}

- (void)_lock_failWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    id v4 = [*(id *)(a1 + 136) currentState];

    if (!v4) {
      [*(id *)(a1 + 136) enterAtState:0];
    }
    [*(id *)(a1 + 136) enqueueEvent:100 date:0 error:v5 completion:&__block_literal_global_642];
    id v3 = v5;
  }
}

void __74__HDWorkoutBuilderServer__lock_recoverPersistedDataWithTransaction_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v14)
  {
    long long v16 = -[HDWorkoutBuilderServer _lock_sourceOrderProviderForQuantityType:](*(void *)(a1 + 32), v11);
    [v14 setSourceOrderProvider:v16];

    long long v17 = -[HDWorkoutBuilderServer _lock_statisticsDataSourceForQuantityType:](*(void *)(a1 + 32), v11);
    [v14 setDataSource:v17];

    [*(id *)(*(void *)(a1 + 32) + 88) setCalculator:v14 forQuantityType:v11 activityUUID:v12];
    long long v18 = [*(id *)(a1 + 32) taskUUID];
    int v19 = [v12 isEqual:v18];

    id v20 = *(void **)(a1 + 40);
    id v21 = [v14 currentStatistics];
    if (v19) {
      [v20 addWorkoutStatistics:v21 forType:v11];
    }
    else {
      [v20 addActivityStatistics:v21 forType:v11 activityUUID:v12];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v22 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      int v24 = 138543618;
      uint64_t v25 = v23;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unexpectedly nil calculator when recovery statistics for %{public}@", (uint8_t *)&v24, 0x16u);
    }
  }
}

- (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider)_lock_sourceOrderProviderForQuantityType:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    id v4 = [*(id *)(a1 + 96) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v5 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
      id v6 = [(id)a1 profile];
      id v4 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v5 initWithProfile:v6 quantityType:v3];

      [*(id *)(a1 + 96) setObject:v4 forKeyedSubscript:v3];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (HDWorkoutBuilderStatisticsDataSource)_lock_statisticsDataSourceForQuantityType:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    id v4 = [*(id *)(a1 + 104) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v5 = [HDWorkoutBuilderStatisticsDataSource alloc];
      id v6 = [(id)a1 profile];
      id v4 = [(HDWorkoutBuilderStatisticsDataSource *)v5 initWithProfile:v6 quantityType:v3 builderEntity:*(void *)(a1 + 48)];

      [*(id *)(a1 + 104) setObject:v4 forKeyedSubscript:v3];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __74__HDWorkoutBuilderServer__lock_recoverPersistedDataWithTransaction_error___block_invoke_482(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 UUID];
  ((void (**)(void, id, id))a3)[2](v5, v7, v6);
}

- (void)_didUpdateStatistics:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3 && ([v3 isEmpty] & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [v4 allTypes];
      id v8 = [v7 allObjects];
      int v9 = [v8 componentsJoinedByString:@", "];
      *(_DWORD *)long long buf = 138543618;
      long long v18 = a1;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated statistics for [%{public}@]", buf, 0x16u);
    }
    id v10 = [a1 client];
    id v11 = [v10 connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke;
    v16[3] = &unk_1E62F3170;
    v16[4] = a1;
    id v12 = [v11 remoteObjectProxyWithErrorHandler:v16];

    objc_msgSend(v12, "clientRemote_didUpdateStatistics:", v4);
    id v13 = (void *)a1[8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke_616;
    v14[3] = &unk_1E630A2F0;
    v14[4] = a1;
    id v15 = v4;
    [v13 notifyObservers:v14];
  }
}

- (void)_didUpdateMetadata:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1 client];
  id v5 = [v4 connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke;
  v16[3] = &unk_1E62F3170;
  v16[4] = a1;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v16];

  id v7 = [a1 client];
  id v15 = 0;
  char v8 = objc_msgSend(v3, "hd_validateMetadataKeysAndValuesWithClient:error:", v7, &v15);
  id v9 = v15;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      long long v18 = a1;
      __int16 v19 = 2114;
      id v20 = v3;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_fault_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_FAULT, "%{public}@: Did update with invalid metadata %{public}@: %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v6, "clientRemote_didUpdateMetadata:", v3);
  id v11 = (void *)a1[8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke_567;
  v13[3] = &unk_1E630A2F0;
  v13[4] = a1;
  id v12 = v3;
  id v14 = v12;
  [v11 notifyObservers:v13];
}

- (void)_didUpdateEvents:(void *)a1
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [a1 client];
    id v5 = [v4 connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke;
    v10[3] = &unk_1E62F3170;
    v10[4] = a1;
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];

    objc_msgSend(v6, "clientRemote_didUpdateEvents:", v3);
    id v7 = (void *)a1[8];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke_577;
    v8[3] = &unk_1E630A2F0;
    v8[4] = a1;
    id v9 = v3;
    [v7 notifyObservers:v8];
  }
}

- (void)_didChangeElapsedTimeBasis
{
  if (a1)
  {
    unsigned __int8 v2 = [a1 client];
    id v3 = [v2 connection];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__HDWorkoutBuilderServer__didChangeElapsedTimeBasis__block_invoke;
    v5[3] = &unk_1E62F3170;
    v5[4] = a1;
    id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];

    objc_msgSend(v4, "clientRemote_didChangeElapsedTimeBasisWithStartDate:endDate:", a1[25], a1[26]);
  }
}

- (uint64_t)_lock_didUpdateStartDate
{
  if (result)
  {
    v1 = *(void **)(result + 64);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __50__HDWorkoutBuilderServer__lock_didUpdateStartDate__block_invoke;
    v2[3] = &unk_1E630A3D8;
    v2[4] = result;
    return [v1 notifyObservers:v2];
  }
  return result;
}

void __58__HDWorkoutBuilderServer__recoverAssociatedSeriesBuilders__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify workout builder client of recovered series builders with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_addSamples:(void *)a3 quantities:(void *)a4 dataSource:(char)a5 shouldSavePriorToStart:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v25 = v11;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__171;
    v58[4] = __Block_byref_object_dispose__171;
    id v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__171;
    v56[4] = __Block_byref_object_dispose__171;
    id v57 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__171;
    v54[4] = __Block_byref_object_dispose__171;
    id v55 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x3032000000;
    id v51 = __Block_byref_object_copy__171;
    id v52 = __Block_byref_object_dispose__171;
    id v53 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x3032000000;
    id v45 = __Block_byref_object_copy__171;
    id v46 = __Block_byref_object_dispose__171;
    id v47 = *(id *)(a1 + 216);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke;
    aBlock[3] = &unk_1E630A168;
    char v41 = a5;
    aBlock[4] = a1;
    uint64_t v36 = v58;
    id v34 = v9;
    uint64_t v37 = v54;
    id v35 = v10;
    v38 = v56;
    id v39 = &v42;
    uint32_t v40 = &v48;
    id v12 = _Block_copy(aBlock);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_4;
    v31[3] = &unk_1E62F8050;
    v31[4] = a1;
    id v13 = v12;
    id v32 = v13;
    id v14 = _Block_copy(v31);
    id v15 = [(id)a1 profile];
    long long v16 = [v15 database];
    id v30 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_5;
    v28[3] = &unk_1E630A190;
    void v28[4] = a1;
    id v17 = v14;
    id v29 = v17;
    BOOL v18 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v16 error:&v30 block:v17 inaccessibilityHandler:v28];
    id v19 = v30;

    if (!v18)
    {
      _HKInitializeLogging();
      id v20 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v61 = a1;
        __int16 v62 = 2114;
        id v63 = v19;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add samples: %{public}@", buf, 0x16u);
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v21 = [(id)v43[5] copy];
    id v22 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = v21;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    -[HDWorkoutBuilderServer _didUpdateStatistics:]((void *)a1, (void *)v49[5]);
    uint64_t v23 = *(void **)(a1 + 72);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_494;
    v27[3] = &unk_1E630A1B8;
    v27[4] = a1;
    v27[5] = v58;
    v27[6] = v56;
    v27[7] = v54;
    [v23 notifyObservers:v27];
    int v24 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_2_496;
    block[3] = &unk_1E62F3208;
    block[4] = a1;
    dispatch_async(v24, block);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(v56, 8);

    _Block_object_dispose(v58, 8);
    id v11 = v25;
  }
}

BOOL __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 200) && !*(unsigned char *)(a1 + 96))
  {
    BOOL v78 = 1;
    goto LABEL_103;
  }
  uint64_t v137 = a1;
  id v6 = *(id *)(a1 + 40);
  id v134 = v4;
  id v7 = v4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v5 + 40));
  id v150 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v144 = *MEMORY[0x1E4F2A950];
  __int16 v8 = objc_msgSend(MEMORY[0x1E4F2B3B8], "quantityTypeForIdentifier:");
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v187 objects:v191 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v188;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v188 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v187 + 1) + 8 * i);
        id v15 = [v14 sampleType];
        int v16 = [v15 isEqual:v8];

        if (v16)
        {
          _HKInitializeLogging();
          id v17 = (void *)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            BOOL v18 = v17;
            id v19 = [v14 sampleType];
            *(_DWORD *)long long buf = 138543618;
            uint64_t v184 = v5;
            __int16 v185 = 2114;
            v186 = v19;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add samples of type %{public}@. Must be associated to workout", buf, 0x16u);
          }
        }
        else
        {
          id v20 = *(void **)(v5 + 48);
          [v14 _startTimestamp];
          uint64_t v21 = objc_msgSend(v20, "associateObject:timestamp:transaction:error:", v14, v7, a3);
          if (v21 == 1)
          {
            [v150 addObject:v14];
          }
          else if (!v21)
          {

            id v22 = 0;
            uint64_t v23 = v150;
            goto LABEL_18;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v187 objects:v191 count:16];
    }
    while (v11);
  }

  uint64_t v23 = v150;
  id v22 = v150;
LABEL_18:

  uint64_t v24 = *(void *)(*(void *)(v137 + 56) + 8);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v22;

  if (!*(void *)(*(void *)(*(void *)(v137 + 56) + 8) + 40)) {
    goto LABEL_51;
  }
  uint64_t v26 = *(void *)(v137 + 32);
  id v27 = *(id *)(v137 + 48);
  id v146 = v7;
  if (v26)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v26 + 40));
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v187 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id v29 = v27;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v187 objects:v191 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v188;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v188 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = *(void **)(*((void *)&v187 + 1) + 8 * j);
          id v35 = *(void **)(v26 + 48);
          uint64_t v36 = objc_msgSend(v34, "hdw_sample");
          objc_msgSend(v34, "hdw_startTimestamp");
          uint64_t v37 = objc_msgSend(v35, "associateObject:timestamp:transaction:error:", v36, v146, a3);

          if (v37 == 1)
          {
            [v28 addObject:v34];
          }
          else if (!v37)
          {

            id v38 = 0;
            goto LABEL_32;
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v187 objects:v191 count:16];
      }
      while (v31);
    }

    id v38 = v28;
LABEL_32:
  }
  else
  {
    id v38 = 0;
  }
  id v39 = (void *)v137;

  uint64_t v40 = *(void *)(*(void *)(v137 + 64) + 8);
  char v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v38;

  uint64_t v42 = *(void **)(*(void *)(*(void *)(v137 + 64) + 8) + 40);
  if (!v42)
  {
LABEL_51:
    BOOL v78 = 0;
    id v4 = v134;
    goto LABEL_103;
  }
  uint64_t v43 = objc_msgSend(v42, "hk_mapToSet:", &__block_literal_global_488);
  uint64_t v44 = [v43 allObjects];
  uint64_t v45 = *(void *)(*(void *)(v137 + 72) + 8);
  id v46 = *(void **)(v45 + 40);
  *(void *)(v45 + 40) = v44;

  id v47 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
  v178[0] = v47;
  uint64_t v48 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v144];
  v178[1] = v48;
  uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:2];

  uint64_t v50 = *(void **)(*(void *)(*(void *)(v137 + 64) + 8) + 40);
  id v51 = *(void **)(*(void *)(*(void *)(v137 + 56) + 8) + 40);
  v157[0] = MEMORY[0x1E4F143A8];
  v157[1] = 3221225472;
  v157[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_3;
  v157[3] = &unk_1E62F78D8;
  id v131 = v49;
  id v158 = v131;
  id v52 = objc_msgSend(v51, "hk_filter:", v157);
  id v53 = [v50 arrayByAddingObjectsFromArray:v52];

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v54 = v53;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v153 objects:v177 count:16];
  obuint64_t j = v54;
  if (!v55)
  {

    goto LABEL_54;
  }
  uint64_t v56 = v55;
  char v57 = 0;
  uint64_t v151 = *(void *)v154;
  do
  {
    for (uint64_t k = 0; k != v56; ++k)
    {
      if (*(void *)v154 != v151) {
        objc_enumerationMutation(obj);
      }
      id v59 = objc_msgSend(*(id *)(*((void *)&v153 + 1) + 8 * k), "hdw_dateInterval");
      id v60 = v59;
      uint64_t v61 = *(void *)(v39[10] + 8);
      if (*(void *)(v61 + 40))
      {
        __int16 v62 = [v59 startDate];
        id v63 = [*(id *)(*(void *)(v39[10] + 8) + 40) startDate];
        if (objc_msgSend(v62, "hk_isBeforeDate:", v63))
        {
        }
        else
        {
          uint64_t v66 = [v60 endDate];
          id v67 = [*(id *)(*(void *)(v39[10] + 8) + 40) endDate];
          int v68 = objc_msgSend(v66, "hk_isAfterDate:", v67);

          if (!v68) {
            goto LABEL_46;
          }
        }
        id v69 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v65 = [*(id *)(*(void *)(v39[10] + 8) + 40) startDate];
        id v70 = [v60 startDate];
        id v71 = HKDateMin();
        uint64_t v72 = [*(id *)(*(void *)(v39[10] + 8) + 40) endDate];
        v73 = [v60 endDate];
        objc_super v74 = HKDateMax();
        uint64_t v75 = [v69 initWithStartDate:v71 endDate:v74];
        uint64_t v76 = *(void *)(*(void *)(v137 + 80) + 8);
        v77 = *(void **)(v76 + 40);
        *(void *)(v76 + 40) = v75;

        id v39 = (void *)v137;
      }
      else
      {
        id v64 = v59;
        uint64_t v65 = *(void **)(v61 + 40);
        *(void *)(v61 + 40) = v64;
      }

      char v57 = 1;
LABEL_46:
    }
    uint64_t v56 = [obj countByEnumeratingWithState:&v153 objects:v177 count:16];
  }
  while (v56);
  id v54 = obj;

  if ((v57 & 1) != 0
    && ([*(id *)(v39[4] + 48) setDataInterval:*(void *)(*(void *)(v39[10] + 8) + 40) transaction:v146 error:a3] & 1) == 0)
  {
    BOOL v78 = 0;
    id v4 = v134;
    goto LABEL_102;
  }
LABEL_54:
  v79 = (const os_unfair_lock *)v39[4];
  id v80 = v54;
  id v141 = v146;
  if (v79)
  {
    id v140 = v79;
    os_unfair_lock_assert_owner(v79 + 10);
    id v139 = objc_alloc_init(MEMORY[0x1E4F2B748]);
    id v81 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    id v130 = v80;
    id v82 = v80;
    uint64_t v83 = [v82 countByEnumeratingWithState:&v173 objects:v191 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v174;
      do
      {
        for (uint64_t m = 0; m != v84; ++m)
        {
          if (*(void *)v174 != v85) {
            objc_enumerationMutation(v82);
          }
          BOOL v87 = *(void **)(*((void *)&v173 + 1) + 8 * m);
          uint64_t v88 = objc_msgSend(v87, "hdw_type");
          v89 = [v81 objectForKeyedSubscript:v88];

          if (!v89)
          {
            id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v81 setObject:v90 forKeyedSubscript:v88];
          }
          uint64_t v91 = [v81 objectForKeyedSubscript:v88];
          [v91 addObject:v87];
        }
        uint64_t v84 = [v82 countByEnumeratingWithState:&v173 objects:v191 count:16];
      }
      while (v84);
    }

    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    char v92 = [v81 allKeys];
    uint64_t v93 = [v92 countByEnumeratingWithState:&v169 objects:&v187 count:16];
    id v4 = v134;
    uint64_t v94 = (uint64_t)v140;
    if (v93)
    {
      uint64_t v95 = v93;
      uint64_t v96 = *(void *)v170;
      id v143 = v81;
      uint64_t v132 = *(void *)v170;
      id v133 = v92;
      do
      {
        uint64_t v97 = 0;
        uint64_t v135 = v95;
        do
        {
          if (*(void *)v170 != v96) {
            objc_enumerationMutation(v92);
          }
          uint64_t v138 = v97;
          v98 = *(void **)(*((void *)&v169 + 1) + 8 * v97);
          if ([v98 code] != 298 && objc_msgSend(v98, "code") != 304)
          {
            id v99 = v98;
            uint64_t v100 = _HKStatisticsComputationMethodForQuantityType(v99, 0);
            v101 = -[HDWorkoutBuilderServer _lock_statisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:](v94, v99, 0, v100);
            v152 = v99;

            long long v167 = 0u;
            long long v168 = 0u;
            long long v165 = 0u;
            long long v166 = 0u;
            id v149 = v101;
            uint64_t v147 = [v101 countByEnumeratingWithState:&v165 objects:buf count:16];
            if (v147)
            {
              uint64_t v145 = *(void *)v166;
              do
              {
                for (uint64_t n = 0; n != v147; ++n)
                {
                  if (*(void *)v166 != v145) {
                    objc_enumerationMutation(v149);
                  }
                  v103 = *(void **)(*((void *)&v165 + 1) + 8 * n);
                  v104 = [v149 objectForKeyedSubscript:v103];
                  id v105 = [v104 dataSource];
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();
                  if (isKindOfClass) {
                    [v105 setEnabled:0];
                  }
                  v107 = [v81 objectForKeyedSubscript:v152];
                  [v107 sortUsingComparator:&__block_literal_global_610];
                  v108 = [v152 canonicalUnit];
                  v161[0] = MEMORY[0x1E4F143A8];
                  v161[1] = 3221225472;
                  v161[2] = __81__HDWorkoutBuilderServer__lock_updateStatisticsWithQuantities_transaction_error___block_invoke_2;
                  v161[3] = &unk_1E62F9F48;
                  id v109 = v107;
                  id v162 = v109;
                  id v110 = v108;
                  id v163 = v110;
                  id v111 = v104;
                  id v164 = v111;
                  id v160 = 0;
                  char v112 = [v111 performAddSampleTransaction:v161 error:&v160];
                  id v113 = v160;
                  if (isKindOfClass) {
                    [v105 setEnabled:1];
                  }
                  if (v112)
                  {
                    v142 = [v111 currentStatistics];

                    id v114 = *(void **)(v94 + 48);
                    id v159 = 0;
                    char v115 = [v114 storeStatisticsCalculator:v111 anchor:0 activityUUID:v103 transaction:v141 error:&v159];
                    id v113 = v159;
                    if ((v115 & 1) == 0)
                    {
                      _HKInitializeLogging();
                      id v116 = *MEMORY[0x1E4F29FB8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v179 = 138543618;
                        uint64_t v180 = v94;
                        __int16 v181 = 2114;
                        id v182 = v113;
                        _os_log_error_impl(&dword_1BCB7D000, v116, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist statistics: %{public}@", v179, 0x16u);
                      }
                    }
                    id v117 = [(id)v94 taskUUID];
                    uint64_t v118 = v94;
                    int v119 = [v103 isEqual:v117];

                    if (v119)
                    {
                      id v120 = v142;
                      [v139 addWorkoutStatistics:v142 forType:v152];
                    }
                    else
                    {
                      v122 = [*(id *)(v118 + 192) objectForKeyedSubscript:v103];
                      id v123 = [v122 startDate];

                      id v120 = v142;
                      if (v123)
                      {
                        id v124 = [v122 startDate];
                        [v142 _setStartDate:v124];
                      }
                      v125 = [v122 endDate];

                      if (v125)
                      {
                        id v126 = [v122 endDate];
                        [v142 _setEndDate:v126];
                      }
                      [v139 addActivityStatistics:v142 forType:v152 activityUUID:v103];
                    }
                    uint64_t v94 = (uint64_t)v140;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    id v121 = *MEMORY[0x1E4F29FB8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v179 = 138543618;
                      uint64_t v180 = v94;
                      __int16 v181 = 2114;
                      id v182 = v113;
                      _os_log_error_impl(&dword_1BCB7D000, v121, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add samples to statistics calculator with error: %{public}@", v179, 0x16u);
                    }
                    [*(id *)(v94 + 112) addObject:v152];
                  }

                  id v81 = v143;
                }
                uint64_t v147 = [v149 countByEnumeratingWithState:&v165 objects:buf count:16];
              }
              while (v147);
            }

            char v92 = v133;
            id v4 = v134;
            id v39 = (void *)v137;
            uint64_t v96 = v132;
            uint64_t v95 = v135;
          }
          uint64_t v97 = v138 + 1;
        }
        while (v138 + 1 != v95);
        uint64_t v95 = [v92 countByEnumeratingWithState:&v169 objects:&v187 count:16];
      }
      while (v95);
    }

    id v80 = v130;
  }
  else
  {
    id v139 = 0;
    id v4 = v134;
  }

  uint64_t v127 = *(void *)(v39[11] + 8);
  id v128 = *(void **)(v127 + 40);
  *(void *)(v127 + 40) = v139;

  BOOL v78 = *(void *)(*(void *)(v39[11] + 8) + 40) != 0;
LABEL_102:

LABEL_103:
  return v78;
}

uint64_t __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hdw_sample");
}

uint64_t __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 sampleType];
    uint64_t v6 = [v4 containsObject:v5] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  return v5;
}

BOOL __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) profile];
  uint64_t v6 = [v5 database];
  BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:*(void *)(a1 + 40)];

  return v7;
}

void __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_494(void *a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(*(void *)(a1[5] + 8) + 40) count]) {
    [v5 workoutBuilderServer:a1[4] addedSamples:*(void *)(*(void *)(a1[5] + 8) + 40)];
  }
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) count]) {
    [v5 workoutBuilderServer:a1[4] addedSamples:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  uint64_t v3 = [*(id *)(*(void *)(a1[7] + 8) + 40) count];
  id v4 = v5;
  if (v3)
  {
    [v5 workoutBuilderServer:a1[4] addedQuantities:*(void *)(*(void *)(a1[7] + 8) + 40)];
    id v4 = v5;
  }
}

void __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_2_496(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
    uint64_t v2 = [*(id *)(v1 + 112) count];
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
    if (v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F2B748]);
      id v4 = [(id)v1 profile];
      id v5 = [v4 database];
      id v12 = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke;
      v10[3] = &unk_1E62F2AE0;
      v10[4] = v1;
      id v6 = v3;
      id v11 = v6;
      BOOL v7 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v5 error:&v12 block:v10];
      id v8 = v12;

      if (v7)
      {
        if (([v6 isEmpty] & 1) == 0) {
          -[HDWorkoutBuilderServer _didUpdateStatistics:]((void *)v1, v6);
        }
      }
      else
      {
        _HKInitializeLogging();
        id v9 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v14 = v1;
          __int16 v15 = 2114;
          id v16 = v8;
          _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get read transaction to requery for invalidated sample types: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (unint64_t)workoutDataDestinationState
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKStateMachine *)self->_stateMachine currentState];
  unint64_t v5 = [v4 index];
  if (v5 > 8) {
    unint64_t v6 = 4;
  }
  else {
    unint64_t v6 = qword_1BD3408C0[v5];
  }

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count]
    && ([(HKWorkoutBuilderConfiguration *)self->_configuration shouldCollectWorkoutEvents] & 1) != 0)
  {
    unint64_t v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_502);
    _HKInitializeLogging();
    BOOL v7 = (os_log_t *)MEMORY[0x1E4F29FB8];
    id v8 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      *(_DWORD *)long long buf = 138544386;
      id v19 = self;
      __int16 v20 = 2048;
      uint64_t v21 = [v5 count];
      __int16 v22 = 2114;
      uint64_t v23 = (const char *)v5;
      __int16 v24 = 2048;
      uint64_t v25 = [v6 count];
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "%{public}@: Received %ld events (%{public}@) (%ld public: %@)", buf, 0x34u);
    }
    id v17 = 0;
    BOOL v10 = -[HDWorkoutBuilderServer _insertWorkoutEvents:error:]((uint64_t)self, v6, (uint64_t)&v17);
    id v11 = v17;
    if (!v10)
    {
      _HKInitializeLogging();
      id v12 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v19 = self;
        __int16 v20 = 2114;
        uint64_t v21 = (uint64_t)v11;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert workout events: %{public}@", buf, 0x16u);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v13 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = v13;
    uint64_t v14 = [v5 count];
    int v15 = [(HKWorkoutBuilderConfiguration *)self->_configuration shouldCollectWorkoutEvents];
    id v16 = "no";
    *(_DWORD *)long long buf = 138543874;
    id v19 = self;
    if (v15) {
      id v16 = "YES";
    }
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    uint64_t v23 = v16;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@: Ignoring %ld workout events (should-collect: %s)", buf, 0x20u);
    goto LABEL_13;
  }
LABEL_14:
}

uint64_t __54__HDWorkoutBuilderServer_addWorkoutEvents_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B798] _workoutEventWithInternalEvent:a2];
}

- (BOOL)_insertWorkoutEvents:(uint64_t)a3 error:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    if ([v5 count])
    {
      id v41 = v5;
      uint64_t v52 = 0;
      id v53 = &v52;
      uint64_t v54 = 0x2020000000;
      char v55 = 0;
      uint64_t v44 = a1;
      unint64_t v6 = [(id)a1 profile];
      BOOL v7 = [v6 database];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __53__HDWorkoutBuilderServer__insertWorkoutEvents_error___block_invoke;
      v49[3] = &unk_1E62F5CB0;
      v49[4] = a1;
      id v8 = v5;
      id v50 = v8;
      id v51 = &v52;
      BOOL v42 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:a3 block:v49];

      if (v42)
      {
        id v9 = v8;
        os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
        BOOL v10 = (void *)[*(id *)(a1 + 184) copy];
        -[HDWorkoutBuilderServer _didUpdateEvents:]((void *)a1, v10);

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        obuint64_t j = v9;
        uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v57;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v57 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              if ([v14 type] == 1 || objc_msgSend(v14, "type") == 2)
              {

                os_unfair_lock_unlock((os_unfair_lock_t)(v44 + 40));
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                os_unfair_lock_lock((os_unfair_lock_t)(v44 + 40));
                id v16 = (void *)[*(id *)(v44 + 192) copy];
                os_unfair_lock_unlock((os_unfair_lock_t)(v44 + 40));
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                id v17 = v16;
                uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:block count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v64;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v64 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      uint64_t v21 = [v17 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * j)];
                      __int16 v22 = [v21 startDate];
                      uint64_t v23 = [v21 endDate];
                      _HKCalculateWorkoutDuration();
                      double v25 = v24;

                      [v21 duration];
                      if (v26 != v25)
                      {
                        [v21 _setDuration:v25];
                        [v15 addObject:v21];
                      }
                    }
                    uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:block count:16];
                  }
                  while (v18);
                }

                if ([v15 count])
                {
                  id v27 = [(id)v44 profile];
                  uint64_t v28 = [v27 database];
                  id v62 = 0;
                  v60[0] = MEMORY[0x1E4F143A8];
                  v60[1] = 3221225472;
                  v60[2] = __51__HDWorkoutBuilderServer__updateActivitiesDuration__block_invoke;
                  v60[3] = &unk_1E62F2AE0;
                  v60[4] = v44;
                  id v61 = v15;
                  BOOL v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v28 error:&v62 block:v60];
                  id v30 = v62;

                  if (!v29)
                  {
                    _HKInitializeLogging();
                    uint64_t v31 = *MEMORY[0x1E4F29FB8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138543618;
                      uint64_t v70 = v44;
                      __int16 v71 = 2114;
                      id v72 = v30;
                      _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Error updating activity duration %{public}@", buf, 0x16u);
                    }
                  }
                  -[HDWorkoutBuilderServer _didUpdateActivities](v44);
                }
                -[HDWorkoutBuilderServer _didChangeElapsedTimeBasis]((void *)v44);
                -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask](v44);
                goto LABEL_30;
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(v44 + 40));
LABEL_30:

        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v32 = obj;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v67 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v46;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v46 != v34) {
                objc_enumerationMutation(v32);
              }
              uint64_t v36 = *(void **)(*((void *)&v45 + 1) + 8 * k);
              if ([v36 type] == 1 || objc_msgSend(v36, "type") == 2)
              {
                id v37 = v36;
                id v38 = *(NSObject **)(v44 + 152);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __56__HDWorkoutBuilderServer__notifySourcesOfInsertedEvent___block_invoke;
                block[3] = &unk_1E62F31C0;
                block[4] = v44;
                id v39 = v37;
                id v74 = v39;
                dispatch_async(v38, block);
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v67 count:16];
          }
          while (v33);
        }
      }
      if (*((unsigned char *)v53 + 24)) {
        -[HDWorkoutBuilderServer _didUpdateActivities](v44);
      }

      _Block_object_dispose(&v52, 8);
      id v5 = v41;
    }
    else
    {
      BOOL v42 = 1;
    }
  }
  else
  {
    BOOL v42 = 0;
  }

  return v42;
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v11 = 0;
  if (self)
  {
    BOOL v8 = -[HDWorkoutBuilderServer _addMetadata:byPassPrivateKeyCheck:error:]((os_unfair_lock *)self, v6, 0, (uint64_t)&v11);
    id v9 = v11;
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    id v9 = 0;
  }
  _HKInitializeLogging();
  BOOL v10 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add metadata with error: %{public}@", buf, 0x16u);
  }
LABEL_5:
}

- (void)addMetadataToWorkoutActivity:(id)a3 withSampleStartDate:(id)a4 dataSource:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void *)[(NSMutableDictionary *)self->_workoutActivitiesByUUID copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * v14)];
      uint64_t v16 = [v15 startDate];
      int v17 = objc_msgSend(v8, "hk_isAfterOrEqualToDate:", v16);

      if (v17)
      {
        uint64_t v18 = [v15 endDate];

        if (!v18) {
          break;
        }
        uint64_t v19 = [v15 endDate];
        char v20 = objc_msgSend(v8, "hk_isBeforeOrEqualToDate:", v19);

        if (v20) {
          break;
        }
      }

      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id v21 = v15;

    if (!v21) {
      goto LABEL_15;
    }
    __int16 v22 = [v21 UUID];
    id v29 = 0;
    char v23 = -[HDWorkoutBuilderServer _updateActivityWithUUID:addMetadata:error:]((uint64_t)self, v22, v7, &v29);
    id v24 = v29;

    if (v23)
    {
      -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
    }
    else
    {
      _HKInitializeLogging();
      double v26 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        id v27 = v26;
        uint64_t v28 = [v21 UUID];
        *(_DWORD *)long long buf = 138543874;
        id v35 = self;
        __int16 v36 = 2114;
        id v37 = v28;
        __int16 v38 = 2114;
        id v39 = v24;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add metadata to workout activity with UUID %{public}@ with error: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
LABEL_11:

LABEL_15:
    _HKInitializeLogging();
    double v25 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v35 = self;
      __int16 v36 = 2114;
      id v37 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find activity greater than date %{public}@ to add metadata", buf, 0x16u);
    }
  }
}

- (uint64_t)_updateActivityWithUUID:(void *)a3 addMetadata:(void *)a4 error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    id v9 = [(id)a1 client];
    int v10 = objc_msgSend(v8, "hd_validateMetadataKeysAndValuesWithClient:error:", v9, a4);

    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      uint64_t v11 = [*(id *)(a1 + 192) objectForKeyedSubscript:v7];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      if (v11)
      {
        _HKInitializeLogging();
        uint64_t v12 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = v12;
          uint64_t v14 = [v7 UUIDString];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v25 = a1;
          __int16 v26 = 2112;
          id v27 = v14;
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding metadata to activity with UUID %@", buf, 0x16u);
        }
        id v15 = [(id)a1 profile];
        uint64_t v16 = [v15 database];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __68__HDWorkoutBuilderServer__updateActivityWithUUID_addMetadata_error___block_invoke;
        v21[3] = &unk_1E62F5A88;
        v21[4] = a1;
        id v22 = v7;
        id v23 = v8;
        a1 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v16 error:a4 block:v21];
      }
      else
      {
        int v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = [v7 UUIDString];
        objc_msgSend(v17, "hk_error:format:", 118, @"Cannot find activity with UUID %@", v18);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        a1 = v19 == 0;
        if (v19)
        {
          if (a4) {
            *a4 = v19;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_didUpdateActivities
{
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v2 = [*(id *)(a1 + 192) allValues];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v3 = [(id)a1 client];
    id v4 = [v3 connection];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__HDWorkoutBuilderServer__didUpdateActivities__block_invoke;
    v6[3] = &unk_1E62F3170;
    v6[4] = a1;
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v6];

    objc_msgSend(v5, "clientRemote_didUpdateActivities:", v2);
  }
}

- (void)updateWorkoutConfiguration:(id)a3 dataSource:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if (self)
  {
    if (v8)
    {
      int v10 = [(HDStandardTaskServer *)self profile];
      uint64_t v11 = [v10 database];
      id v26 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v34 = __54__HDWorkoutBuilderServer__updateWorkoutConfiguration___block_invoke;
      id v35 = &unk_1E62F2AE0;
      __int16 v36 = self;
      id v12 = v9;
      id v37 = v12;
      BOOL v13 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:&v26 block:&buf];
      id v14 = v26;

      if (v13)
      {
        os_unfair_lock_lock(&self->_lock);
        [(HKWorkoutBuilderConfiguration *)self->_configuration setWorkoutConfiguration:v12];
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v16 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v29 = 138543618;
          long long v30 = self;
          __int16 v31 = 2114;
          id v32 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update builder workout Configuration: %{public}@", v29, 0x16u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      id v15 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = self;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Workout Configuration is nil. Nothing to update}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }

  int v17 = [(HDWorkoutBuilderServer *)self currentMetadata];
  uint64_t v18 = *MEMORY[0x1E4F2A178];
  id v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2A178]];

  LODWORD(v17) = [v19 BOOLValue];
  uint64_t v20 = [v9 locationType];
  if (v17 != (v20 == 2))
  {
    uint64_t v27 = v18;
    id v21 = [NSNumber numberWithBool:v20 == 2];
    uint64_t v28 = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [(HDWorkoutBuilderServer *)self addMetadata:v22 dataSource:v7];
  }
  id v23 = v9;
  id v24 = v23;
  if (self)
  {
    upstreamQueue = self->_upstreamQueue;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v34 = __62__HDWorkoutBuilderServer__notifySourcesOfConfigurationUpdate___block_invoke;
    id v35 = &unk_1E62F31C0;
    __int16 v36 = self;
    id v37 = v23;
    dispatch_async(upstreamQueue, &buf);
  }
}

- (void)didBeginActivity:(id)a3 dataSource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = 0;
  char v6 = -[HDWorkoutBuilderServer _addWorkoutActivity:error:]((uint64_t)self, v5, (uint64_t)&v22);
  id v7 = v22;
  if (v6)
  {
    id v8 = [(HKDataFlowLink *)self->_workoutDataFlowLink allSourceProcessors];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v12++) workoutDataDestination:self didBeginActivity:v5];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }
    BOOL v13 = [(HDStandardTaskServer *)self client];
    id v14 = [v13 connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__HDWorkoutBuilderServer_didBeginActivity_dataSource___block_invoke;
    v17[3] = &unk_1E62F3170;
    v17[4] = self;
    id v15 = [v14 remoteObjectProxyWithErrorHandler:v17];

    objc_msgSend(v15, "clientRemote_didBeginActivity:", v5);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v16 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert activity: %{public}@", buf, 0x16u);
    }
  }
}

- (uint64_t)_addWorkoutActivity:(uint64_t)a3 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    char v6 = (void *)[*(id *)(a1 + 184) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = [v5 startDate];
    id v8 = [v5 endDate];
    _HKCalculateWorkoutDuration();
    double v10 = v9;

    [v5 _setDuration:v10];
    if ([v6 count]) {
      [v5 _filterAndSetWorkoutEvents:v6];
    }
    uint64_t v35 = 0;
    __int16 v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__171;
    id v39 = __Block_byref_object_dispose__171;
    id v40 = 0;
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v43 = a1;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding workout activity %@", buf, 0x16u);
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke;
    v32[3] = &unk_1E62F76B8;
    v32[4] = a1;
    id v12 = v5;
    id v33 = v12;
    uint64_t v34 = &v35;
    unsigned int v27 = -[HDWorkoutBuilderServer _runInBestWriteTransactionWithError:block:]((void *)a1, a3, v32);
    if (v27)
    {
      BOOL v13 = [(id)v36[5] activitiesStatistics];
      id v14 = [v12 UUID];
      id v15 = [v13 objectForKeyedSubscript:v14];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            long long v21 = [v16 objectForKeyedSubscript:v20];
            [v12 _setStatistics:v21 forType:v20];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v41 count:16];
        }
        while (v17);
      }

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      id v22 = *(void **)(a1 + 192);
      if (!v22)
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v24 = *(void **)(a1 + 192);
        *(void *)(a1 + 192) = v23;

        id v22 = *(void **)(a1 + 192);
      }
      uint64_t v25 = [v12 UUID];
      [v22 setObject:v12 forKeyedSubscript:v25];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    unsigned int v27 = 0;
  }

  return v27;
}

void __54__HDWorkoutBuilderServer_didBeginActivity_dataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of begun activity with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didEndActivity:(id)a3 dataSource:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 UUID];
  uint64_t v7 = [v5 endDate];

  id v11 = 0;
  char v8 = -[HDWorkoutBuilderServer _endActivityWithUUID:endDate:error:]((uint64_t)self, v6, v7, &v11);
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      BOOL v13 = self;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed registering end of activity: %{public}@", buf, 0x16u);
    }
  }
}

- (uint64_t)_endActivityWithUUID:(void *)a3 endDate:(void *)a4 error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v9 = [*(id *)(a1 + 192) objectForKeyedSubscript:v7];
    uint64_t v10 = (void *)[v9 copy];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (!v10)
    {
      long long v28 = (void *)MEMORY[0x1E4F28C58];
      long long v29 = [v7 UUIDString];
      objc_msgSend(v28, "hk_error:format:", 118, @"Cannot find activity with UUID %@", v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      a1 = v30 == 0;
      if (v30)
      {
        if (a4) {
          *a4 = v30;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v19 = 0;
      goto LABEL_24;
    }
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      uint64_t v44 = a1;
      __int16 v45 = 2112;
      id v46 = v8;
      __int16 v47 = 2112;
      long long v48 = v10;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting end date %@ on activity %@", buf, 0x20u);
    }
    id v12 = [v10 startDate];
    _HKCalculateWorkoutDuration();
    double v14 = v13;

    id v33 = v8;
    [v10 _setEndDate:v8];
    [v10 _setDuration:v14];
    id v15 = [(id)a1 profile];
    uint64_t v16 = [v15 database];
    id v41 = 0;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke;
    v39[3] = &unk_1E62F2AE0;
    v39[4] = a1;
    id v17 = v10;
    id v40 = v17;
    BOOL v18 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v16 error:&v41 block:v39];
    id v19 = v41;

    if (v18)
    {
      -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask](a1);
      id v20 = [*(id *)(a1 + 120) allSourceProcessors];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * v24++) workoutDataDestination:a1 didEndActivity:v17];
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v22);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      [*(id *)(a1 + 192) setObject:v17 forKeyedSubscript:v7];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      uint64_t v25 = [(id)a1 client];
      __int16 v26 = [v25 connection];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke_2;
      v34[3] = &unk_1E62F3170;
      v34[4] = a1;
      unsigned int v27 = [v26 remoteObjectProxyWithErrorHandler:v34];

      objc_msgSend(v27, "clientRemote_didEndActivity:", v17);
    }
    else
    {
      id v31 = v19;
      id v20 = v31;
      if (v31)
      {
        id v8 = v33;
        if (a4)
        {
          id v20 = v31;
          a1 = 0;
          *a4 = v20;
        }
        else
        {
          _HKLogDroppedError();
          a1 = 0;
        }
        goto LABEL_21;
      }
    }
    a1 = 1;
    id v8 = v33;
LABEL_21:

LABEL_24:
  }

  return a1;
}

uint64_t __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  id v6 = a2;
  os_unfair_lock_lock(v5);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 48) updateWorkoutActivityEndDate:*(void *)(a1 + 40) transaction:v6 error:a3];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  return v7;
}

void __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of ended activity with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)addDataAccumulationObserver:(id)a3
{
  id v8 = a3;
  [(HKObserverSet *)self->_dataAccumulatorObservers registerObserver:v8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_unfair_lock_lock(&self->_lock);
  statisticsCalculators = self->_statisticsCalculators;
  int v6 = [(HDStandardTaskServer *)self taskUUID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HDWorkoutBuilderServer__currentStatisticsByQuantityType__block_invoke;
  v9[3] = &unk_1E630A3B0;
  id v7 = v4;
  id v10 = v7;
  [(HDWorkoutBuilderStatisticsCalculators *)statisticsCalculators enumerateCalculatorsForActivityUUID:v6 handler:v9];

  os_unfair_lock_unlock(&self->_lock);
  if (objc_opt_respondsToSelector()) {
    [v8 workoutDataAccumulator:self didUpdateStatistics:v7];
  }
}

- (void)removeDataAccumulationObserver:(id)a3
{
}

- (id)currentEvents
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSArray *)self->_workoutEvents copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)startDate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_workoutStartDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  switch([v10 index])
  {
    case 0:
      id v40 = 0;
      char v19 = -[HDWorkoutBuilderServer _validateAuthorizationToSaveWorkoutWithError:](self, (uint64_t)&v40);
      id v20 = v40;
      if ((v19 & 1) == 0) {
        -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, v20);
      }
      upstreamQueue = self->_upstreamQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke;
      block[3] = &unk_1E62F31C0;
      block[4] = self;
      id v39 = v20;
      id v22 = v20;
      dispatch_async(upstreamQueue, block);

      goto LABEL_9;
    case 1:
LABEL_9:
      id v37 = 0;
      int v23 = -[HDWorkoutBuilderServer _validateAuthorizationToSaveWorkoutWithError:](self, (uint64_t)&v37);
      id v24 = v37;
      if (v23)
      {
        uint64_t v25 = self->_upstreamQueue;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2;
        v35[3] = &unk_1E62F31C0;
        v35[4] = self;
        id v36 = v11;
        dispatch_async(v25, v35);
      }
      else
      {
        -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, v24);
      }

      break;
    case 2:
      id v17 = self->_upstreamQueue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_510;
      v34[3] = &unk_1E62F3208;
      v34[4] = self;
      BOOL v18 = v34;
      goto LABEL_15;
    case 3:
      __int16 v26 = self->_upstreamQueue;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_511;
      v32[3] = &unk_1E62F31C0;
      v32[4] = self;
      id v33 = v11;
      dispatch_async(v26, v32);
      uint64_t v16 = v33;
      goto LABEL_13;
    case 5:
      id v17 = self->_upstreamQueue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3_519;
      v31[3] = &unk_1E62F3208;
      v31[4] = self;
      BOOL v18 = v31;
      goto LABEL_15;
    case 6:
      id v17 = self->_upstreamQueue;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_521;
      v30[3] = &unk_1E62F3208;
      v30[4] = self;
      BOOL v18 = v30;
LABEL_15:
      dispatch_async(v17, v18);
      break;
    case 7:
    case 8:
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Workout builder has been discarded."");
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      double v13 = (NSError *)[v12 copy];
      error = self->_error;
      self->_error = v13;

      id v15 = self->_upstreamQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_528;
      v27[3] = &unk_1E62F30F8;
      v27[4] = self;
      id v28 = v10;
      id v12 = v12;
      id v29 = v12;
      dispatch_async(v15, v27);

      uint64_t v16 = v28;
LABEL_13:

      break;
    default:
      break;
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v17 = 0;
  if (!v2) {
    goto LABEL_14;
  }
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)v2 + 10);
  id v3 = [*((id *)v2 + 21) workoutConfiguration];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_unfair_lock_lock((os_unfair_lock_t)v2 + 10);
  uint64_t v5 = *MEMORY[0x1E4F2A178];
  int v6 = [*((id *)v2 + 22) objectForKeyedSubscript:*MEMORY[0x1E4F2A178]];

  if (!v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "locationType") == 2);
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
  if ([v3 swimmingLocationType])
  {
    uint64_t v8 = *MEMORY[0x1E4F2A1E0];
    id v9 = [*((id *)v2 + 22) objectForKeyedSubscript:*MEMORY[0x1E4F2A1E0]];

    if (!v9)
    {
      id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "swimmingLocationType"));
      [v4 setObject:v10 forKeyedSubscript:v8];
    }
  }
  uint64_t v11 = [v3 lapLength];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = *MEMORY[0x1E4F2A188];
    double v14 = [*((id *)v2 + 22) objectForKeyedSubscript:*MEMORY[0x1E4F2A188]];

    if (!v14)
    {
      id v15 = [v3 lapLength];
      [v4 setObject:v15 forKeyedSubscript:v13];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v2 + 10);
  BOOL v16 = ![v4 count]
     || -[HDWorkoutBuilderServer _addMetadata:byPassPrivateKeyCheck:error:]((os_unfair_lock *)v2, v4, 0, (uint64_t)&v17);

  id v2 = v17;
  if (!v16)
  {
LABEL_14:
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    -[HDWorkoutBuilderServer _lock_failWithError:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) allSourceProcessors];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void **)(v7 + 200);
        if (!v8) {
          uint64_t v8 = *(void **)(a1 + 40);
        }
        -[HDWorkoutBuilderServer _requestDataFromSource:from:to:]((void *)v7, *(void **)(*((void *)&v15 + 1) + 8 * i), v8, *(void **)(v7 + 208));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }
  id v9 = *(id **)(a1 + 32);
  id v14 = 0;
  char v10 = -[HDWorkoutBuilderServer _associateZonesSamplesIfNeededWithError:](v9, &v14);
  id v11 = v14;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to associate zone samples for workout builder: %{public}@", buf, 0x16u);
    }
  }
}

- (void)_requestDataFromSource:(void *)a3 from:(void *)a4 to:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v18 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__HDWorkoutBuilderServer__requestDataFromSource_from_to___block_invoke;
    v13[3] = &unk_1E62FA130;
    id v14 = v7;
    long long v15 = a1;
    id v16 = v8;
    id v17 = v9;
    char v10 = -[HDWorkoutBuilderServer _runInBestWriteTransactionWithError:block:](a1, (uint64_t)&v18, v13);
    id v11 = v18;
    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      id v12 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v20 = a1;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed write transaction when fetching data during data source addition: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (uint64_t)_associateZonesSamplesIfNeededWithError:(id *)a1
{
  v43[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a1[28]) {
    return 1;
  }
  id v39 = 0;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  int v6 = [MEMORY[0x1E4F2B818] heartRateType];
  id v7 = [MEMORY[0x1E4F2B818] cyclingPowerType];
  id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, 0);

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __53__HDWorkoutBuilderServer__fetchZonesByTypeWithError___block_invoke;
  v40[3] = &unk_1E630A340;
  id v10 = v9;
  id v41 = v10;
  id v11 = 0;
  if ([a1 enumerateSamplesOfTypes:v8 error:&v39 handler:v40]) {
    id v11 = v10;
  }

  id v12 = v39;
  if (v11)
  {
    if ([v11 count])
    {
      uint64_t v13 = [v11 mutableCopy];
      id v14 = a1[28];
      a1[28] = (id)v13;
      uint64_t v3 = 1;
    }
    else
    {
      id v32 = a2;
      id v33 = v12;
      long long v15 = [MEMORY[0x1E4F2B818] heartRateType];
      v43[0] = v15;
      id v16 = [MEMORY[0x1E4F2B818] cyclingPowerType];
      v43[1] = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v17;
      uint64_t v18 = [v14 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v14);
            }
            uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v23 = [a1 profile];
            id v34 = 0;
            uint64_t v24 = +[HDSampleEntity mostRecentSampleWithType:v22 profile:v23 encodingOptions:0 predicate:0 anchor:0 error:&v34];
            id v25 = v34;

            if (v24) {
              BOOL v26 = 1;
            }
            else {
              BOOL v26 = v25 == 0;
            }
            if (!v26)
            {
              if (v32) {
                *id v32 = v25;
              }
              else {
                _HKLogDroppedError();
              }
              id v12 = v33;

              uint64_t v3 = 0;
              id v30 = v14;
              goto LABEL_32;
            }
            if (v24)
            {
              id v27 = a1[28];
              if (!v27)
              {
                id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                id v29 = a1[28];
                a1[28] = v28;

                id v27 = a1[28];
              }
              [v27 setObject:v24 forKeyedSubscript:v22];
            }
          }
          uint64_t v19 = [v14 countByEnumeratingWithState:&v35 objects:v42 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      if ([a1[28] count])
      {
        id v30 = [a1[28] allValues];
        uint64_t v3 = 1;
        -[HDWorkoutBuilderServer _addSamples:quantities:dataSource:shouldSavePriorToStart:]((uint64_t)a1, v30, MEMORY[0x1E4F1CBF0], 0, 1);
        id v12 = v33;
LABEL_32:
      }
      else
      {
        uint64_t v3 = 1;
        id v12 = v33;
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_510(uint64_t a1)
{
}

- (void)_checkForAttachedDataSources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    [*(id *)(a1 + 136) enqueueEvent:101 date:0 error:0 completion:&__block_literal_global_672];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_511(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) allSourceProcessors];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 200);
  if (!v3) {
    uint64_t v3 = *(void **)(a1 + 40);
  }
  id v4 = v3;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  if (!v5) {
    uint64_t v5 = *(void **)(a1 + 40);
  }
  id v6 = v5;
  dispatch_group_t v7 = dispatch_group_create();
  id v8 = *(void **)(a1 + 32);
  id v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3;
  v21[3] = &unk_1E630A200;
  id v9 = v2;
  id v22 = v9;
  id v10 = v7;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v23 = v10;
  uint64_t v24 = v11;
  id v12 = v4;
  id v25 = v12;
  id v13 = v6;
  id v26 = v13;
  id v27 = *(id *)(a1 + 40);
  char v14 = -[HDWorkoutBuilderServer _runInBestWriteTransactionWithError:block:](v8, (uint64_t)&v28, v21);
  id v15 = v28;
  if ((v14 & 1) == 0)
  {
    _HKInitializeLogging();
    id v16 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v30 = v19;
      __int16 v31 = 2114;
      id v32 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set up write transaction for requesting final data: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(NSObject **)(v17 + 152);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_515;
  v20[3] = &unk_1E62F3208;
  void v20[4] = v17;
  dispatch_group_notify(v10, v18, v20);
}

uint64_t __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        _HKInitializeLogging();
        dispatch_group_t v7 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          uint64_t v9 = *(void *)(a1 + 56);
          uint64_t v10 = *(void *)(a1 + 64);
          *(_DWORD *)long long buf = 138544130;
          uint64_t v25 = v8;
          __int16 v26 = 2114;
          uint64_t v27 = v9;
          __int16 v28 = 2114;
          uint64_t v29 = v10;
          __int16 v30 = 2114;
          __int16 v31 = v6;
          _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Requesting final data for interval (%{public}@ - %{public}@) from %{public}@", buf, 0x2Au);
        }
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 64);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_512;
        v18[3] = &unk_1E62F2EF8;
        v18[4] = v11;
        v18[5] = v6;
        id v19 = *(id *)(a1 + 40);
        [v6 workoutDataDestination:v11 requestsFinalDataFrom:v12 to:v13 completion:v18];
        uint64_t v14 = *(void *)(a1 + 48);
        id v15 = *(void **)(v14 + 208);
        if (!v15) {
          id v15 = *(void **)(a1 + 72);
        }
        -[HDWorkoutBuilderServer _requestDataFromSource:from:to:]((void *)v14, v6, *(void **)(v14 + 200), v15);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v3);
  }

  return 1;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_512(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  dispatch_group_t v7 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Received final data from %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recieve final data from %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (uint64_t)_runInBestWriteTransactionWithError:(void *)a3 block:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = [a1 profile];
    dispatch_group_t v7 = [v6 database];
    uint64_t v8 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke;
    v13[3] = &unk_1E62FA3D0;
    id v14 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke_2;
    v11[3] = &unk_1E62F8610;
    id v12 = v14;
    uint64_t v9 = [v7 performTransactionWithContext:v8 error:a2 block:v13 inaccessibilityHandler:v11];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_515(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(*(void *)(a1 + 32) + 136) enqueueEvent:102 date:0 error:0 completion:&__block_literal_global_518];
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);

  os_unfair_lock_unlock(v2);
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3_519(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v38 = 0;
  if (!v2) {
    goto LABEL_27;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 40));
  uint64_t v3 = *(void *)(v2 + 200);
  if (!v3)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = @"Workout builder has unspecified start date.";
LABEL_24:
    objc_msgSend(v24, "hk_assignError:code:description:", &v38, 124, v25);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
    uint64_t v2 = 0;
    goto LABEL_27;
  }
  uint64_t v4 = *(void **)(v2 + 208);
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v51 = v2;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: (#w0) Synthesizing end date while finishing; no end date yet specified (was endCollection called)?",
        buf,
        0xCu);
    }
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    dispatch_group_t v7 = *(void **)(v2 + 208);
    *(void *)(v2 + 208) = v6;

    uint64_t v4 = *(void **)(v2 + 208);
    uint64_t v3 = *(void *)(v2 + 200);
  }
  if ((objc_msgSend(v4, "hk_isAfterDate:", v3) & 1) == 0)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = @"Workout builder end date is not after start date.";
    goto LABEL_24;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(v2 + 200) endDate:*(void *)(v2 + 208)];
  uint64_t v9 = objc_msgSend(*(id *)(v2 + 192), "hk_filterKeysWithBlock:", &__block_literal_global_640);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:buf count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!-[HDWorkoutBuilderServer _endActivityWithUUID:endDate:error:](v2, *(void **)(*((void *)&v40 + 1) + 8 * i), *(void **)(v2 + 208), &v38))
        {
          uint64_t v2 = 0;
          long long v22 = v10;
          goto LABEL_26;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:buf count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = [*(id *)(v2 + 168) associatedSessionUUID];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = [*(id *)(v2 + 168) associatedSessionUUID];
    uint64_t v18 = [v17 UUIDString];
    uint64_t v19 = *MEMORY[0x1E4F2BBC0];
    [v16 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F2BBC0]];

    id v39 = 0;
    LOBYTE(v18) = -[HDWorkoutBuilderServer _addMetadata:byPassPrivateKeyCheck:error:]((os_unfair_lock *)v2, v16, 1, (uint64_t)&v39);
    id v20 = v39;
    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      long long v21 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = v21;
        id v34 = [v16 objectForKeyedSubscript:v19];
        *(_DWORD *)uint64_t v44 = 138543874;
        uint64_t v45 = v2;
        __int16 v46 = 2114;
        __int16 v47 = v34;
        __int16 v48 = 2114;
        id v49 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add associated sessionId:%{public}@ with error: %{public}@", v44, 0x20u);
      }
    }
  }
  long long v22 = [(id)v2 taskUUID];
  long long v23 = [(id)v2 profile];
  uint64_t v2 = +[HDWorkoutBuilderEntity finishWorkoutBuilderWithIdentifier:v22 dateInterval:v8 profile:v23 error:&v38];

LABEL_26:
LABEL_27:
  id v26 = v38;
  uint64_t v27 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2 || !v26)
  {
    __int16 v28 = [(os_unfair_lock_s *)v27 client];
    uint64_t v29 = [v28 connection];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_4;
    v37[3] = &unk_1E62F3170;
    v37[4] = *(void *)(a1 + 32);
    __int16 v30 = [v29 remoteObjectProxyWithErrorHandler:v37];

    objc_msgSend(v30, "clientRemote_finishedWorkout:", v2);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(v31 + 136);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_520;
    v35[3] = &unk_1E62F5D48;
    v35[4] = v31;
    id v36 = (id)v2;
    [v32 enqueueEvent:103 date:0 error:0 completion:v35];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  }
  else
  {
    os_unfair_lock_lock(v27 + 10);
    -[HDWorkoutBuilderServer _lock_failWithError:](*(void *)(a1 + 32), v26);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send finished workout to client, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_520(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = v2;
    int v6 = [v3 _detailedDescriptionString];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Workout did save: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_521(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) profile];
  uint64_t v2 = [v4 daemon];
  id v3 = [v2 taskServerRegistry];
  [v3 removeTaskServerObserver:*(void *)(a1 + 32)];
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_528(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  id v3 = [v2 daemon];
  id v4 = [v3 taskServerRegistry];
  [v4 removeTaskServerObserver:*(void *)(a1 + 32)];

  uint64_t v5 = *(void **)(a1 + 32);
  id v17 = 0;
  LODWORD(v4) = -[HDWorkoutBuilderServer _discardWorkoutWithError:](v5, (uint64_t)&v17);
  id v6 = v17;
  _HKInitializeLogging();
  int v7 = *MEMORY[0x1E4F29FB8];
  uint64_t v8 = *MEMORY[0x1E4F29FB8];
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarded workout after moving to %{public}@ state", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543874;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Unable to discard workout after moving to %{public}@ state: %{public}@", buf, 0x20u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) client];
  uint64_t v12 = [v11 connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_529;
  v16[3] = &unk_1E62F3170;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v13 = [v12 remoteObjectProxyWithErrorHandler:v16];

  objc_msgSend(v13, "clientRemote_didFailWithError:", *(void *)(a1 + 48));
}

- (void)_discardWorkoutWithError:(void *)result
{
  if (result)
  {
    id v3 = result;
    id v4 = [result taskUUID];
    uint64_t v5 = [v3 profile];
    BOOL v6 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:v4 profile:v5 error:a2];

    return (void *)v6;
  }
  return result;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_529(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send error to client, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  _HKInitializeLogging();
  __int16 v20 = *MEMORY[0x1E4F29FB8];
  BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (!v21) {
      goto LABEL_7;
    }
    *(_DWORD *)__int16 v28 = 138543618;
    *(void *)&void v28[4] = self;
    *(_WORD *)&v28[12] = 2114;
    *(void *)&v28[14] = v15;
    __int16 v22 = "%{public}@: (#w0) %{public}@.";
  }
  else
  {
    if (!v21) {
      goto LABEL_7;
    }
    *(_DWORD *)__int16 v28 = 138543618;
    *(void *)&void v28[4] = self;
    *(_WORD *)&v28[12] = 2114;
    *(void *)&v28[14] = v17;
    __int16 v22 = "%{public}@: (#w0) Enter at %{public}@.";
  }
  _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, v22, v28, 0x16u);
LABEL_7:
  -[HDWorkoutBuilderServer _lock_pushCurrentConstructionState]((uint64_t)self);
  if (v16)
  {
    unint64_t v23 = [v16 index];
    if (v23 > 8) {
      uint64_t v24 = 4;
    }
    else {
      uint64_t v24 = qword_1BD3408C0[v23];
    }
    unint64_t v25 = objc_msgSend(v17, "index", *(void *)v28, *(_OWORD *)&v28[8]);
    if (v25 > 8) {
      uint64_t v26 = 4;
    }
    else {
      uint64_t v26 = qword_1BD3408C0[v25];
    }
    if (self)
    {
      upstreamQueue = self->_upstreamQueue;
      *(void *)__int16 v28 = MEMORY[0x1E4F143A8];
      *(void *)&v28[8] = 3221225472;
      *(void *)&v28[16] = __70__HDWorkoutBuilderServer__notifySourcesOfTransitionFromState_toState___block_invoke;
      uint64_t v29 = &unk_1E630A228;
      __int16 v30 = self;
      uint64_t v31 = v24;
      uint64_t v32 = v26;
      dispatch_async(upstreamQueue, v28);
    }
  }
  -[HKStateMachine enqueueEvent:date:error:completion:](self->_stateMachine, "enqueueEvent:date:error:completion:", self->_targetConstructionState, 0, 0, &__block_literal_global_531, *(void *)v28, *(_OWORD *)&v28[8]);
}

- (void)_lock_pushCurrentConstructionState
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    uint64_t v2 = [*(id *)(a1 + 136) currentState];
    id v3 = [(id)a1 client];
    id v4 = [v3 connection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HDWorkoutBuilderServer__lock_pushCurrentConstructionState__block_invoke;
    v8[3] = &unk_1E62F3170;
    v8[4] = a1;
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v8];

    unint64_t v6 = [v2 index];
    if (v6 > 8) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = qword_1BD3408C0[v6];
    }
    objc_msgSend(v5, "clientRemote_stateDidChange:startDate:endDate:", v7, *(void *)(a1 + 200), *(void *)(a1 + 208));
  }
}

void __70__HDWorkoutBuilderServer__notifySourcesOfTransitionFromState_toState___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 120) allSourceProcessors];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) workoutDataDestination:a1[4] didChangeFromState:a1[5] toState:a1[6]];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __62__HDWorkoutBuilderServer__notifySourcesOfConfigurationUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) allSourceProcessors];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) workoutDataDestination:*(void *)(a1 + 32) didUpdateConfiguration:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __56__HDWorkoutBuilderServer__notifySourcesOfInsertedEvent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) allSourceProcessors];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) workoutDataDestination:*(void *)(a1 + 32) didInsertEvent:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)remote_setTargetConstructionState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v34 = _HKLoggingActionCompletion();
  os_unfair_lock_lock(&self->_lock);
  if (v9 && !self->_workoutStartDate)
  {
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Start date set: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = (NSDate *)[v9 copy];
    workoutStartDate = self->_workoutStartDate;
    self->_workoutStartDate = v13;

    -[HDWorkoutBuilderServer _lock_didUpdateStartDate]((uint64_t)self);
    int v11 = 1;
    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    int v11 = 0;
    if (!v10) {
      goto LABEL_9;
    }
  }
  if (!self->_workoutEndDate)
  {
    _HKInitializeLogging();
    id v17 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) End date set: %{public}@", buf, 0x16u);
    }
    id v18 = (NSDate *)[v10 copy];
    workoutEndDate = self->_workoutEndDate;
    self->_workoutEndDate = v18;

    _HKCalculateWorkoutDuration();
    uint64_t v16 = v20;
    os_unfair_lock_unlock(&self->_lock);
    char v15 = 1;
    goto LABEL_14;
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_lock);
  if (!v11) {
    goto LABEL_18;
  }
  char v15 = 0;
  uint64_t v16 = 0;
LABEL_14:
  BOOL v21 = [(HDStandardTaskServer *)self profile];
  __int16 v22 = [v21 database];
  id v51 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke;
  v45[3] = &unk_1E630A250;
  v45[4] = self;
  id v46 = v9;
  id v47 = v10;
  uint64_t v48 = v16;
  char v49 = v11;
  char v50 = v15;
  BOOL v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v22 error:&v51 block:v45];
  id v24 = v51;

  -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask]((uint64_t)self);
  -[HDWorkoutBuilderServer _didChangeElapsedTimeBasis](self);
  if (!v23)
  {
    _HKInitializeLogging();
    unint64_t v25 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@: (#w0) Failed to persist updated start/end dates for workout builder: %{public}@", buf, 0x16u);
    }
  }

LABEL_18:
  os_unfair_lock_lock(&self->_lock);
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 1;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v59 = __Block_byref_object_copy__171;
  id v60 = __Block_byref_object_dispose__171;
  id v61 = 0;
  if (self->_targetConstructionState != a3)
  {
    _HKInitializeLogging();
    uint64_t v26 = (id)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HKWorkoutBuilderConstructionStateToString();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v28 = HKWorkoutBuilderConstructionStateToString();
      *(_DWORD *)uint64_t v52 = 138543874;
      id v53 = self;
      __int16 v54 = 2114;
      id v55 = v27;
      __int16 v56 = 2114;
      long long v57 = v28;
      _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Target state changed: %{public}@ -> %{public}@", v52, 0x20u);
    }
    self->_targetConstructionState = a3;
    stateMachine = self->_stateMachine;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_534;
    v40[3] = &unk_1E630A278;
    void v40[4] = &v41;
    v40[5] = buf;
    [(HKStateMachine *)stateMachine enqueueEvent:a3 date:0 error:0 completion:v40];
    if (!*((unsigned char *)v42 + 24)) {
      -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, *(void **)(*(void *)&buf[8] + 40));
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  __int16 v30 = [(HDStandardTaskServer *)self client];
  uint64_t v31 = [v30 connection];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_2;
  v39[3] = &unk_1E62F3170;
  v39[4] = self;
  uint64_t v32 = [v31 remoteObjectProxyWithErrorHandler:v39];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_535;
  v35[3] = &unk_1E630A2A0;
  id v33 = v34;
  id v36 = v33;
  long long v37 = &v41;
  id v38 = buf;
  objc_msgSend(v32, "clientRemote_synchronizeWithCompletion:", v35);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v41, 8);
}

BOOL __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc(MEMORY[0x1E4F2B720]);
  long long v7 = [*(id *)(a1 + 32) taskUUID];
  long long v8 = [*(id *)(*(void *)(a1 + 32) + 168) workoutConfiguration];
  id v9 = (void *)[v6 _initWithUUID:v7 workoutConfiguration:v8 startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) workoutEvents:*(void *)(*(void *)(a1 + 32) + 184) startsPaused:0 duration:*(double *)(a1 + 56) metadata:*(void *)(*(void *)(a1 + 32) + 176) statisticsPerType:0];

  BOOL v10 = (!*(unsigned char *)(a1 + 64)
      || [*(id *)(*(void *)(a1 + 32) + 48) setStartDate:*(void *)(a1 + 40) transaction:v5 error:a3]&& objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "insertPrimaryWorkoutActivity:transaction:error:", v9, v5, a3))&& (!*(unsigned char *)(a1 + 65)|| objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setEndDate:transaction:error:", *(void *)(a1 + 48), v5, a3)&& (objc_msgSend(
            *(id *)(*(void *)(a1 + 32) + 48),
            "updateWorkoutActivityEndDate:transaction:error:",
            v9,
            v5,
            a3) & 1) != 0);

  return v10;
}

void __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_534(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addSamples completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_535(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)remote_addDataSourcesWithIdentifiers:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v25 = [(HKDataFlowLink *)self->_workoutDataFlowLink allSourceProcessors];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v24 = *(void *)v31;
    *(void *)&long long v6 = 138412290;
    long long v22 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v25;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            char v15 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v14), "workoutDataProcessorUUID", v22);
            int v16 = [v15 isEqual:v9];

            if (v16) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          _HKInitializeLogging();
          id v19 = (void *)*MEMORY[0x1E4F29FB8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          id v17 = v19;
          uint64_t v20 = [v9 UUIDString];
          *(_DWORD *)long long buf = v22;
          long long v35 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Trying to add already linked data source %@ to workout builder", buf, 0xCu);
        }
        else
        {
LABEL_14:

          -[HDWorkoutBuilderServer _addExpectedDataSourceIdentifiers:]((uint64_t)self, obj);
          id v10 = [(HDStandardTaskServer *)self profile];
          id v17 = [v10 daemon];
          id v18 = [v17 taskServerRegistry];
          [v18 addObserver:self forTaskServerUUID:v9 queue:0];
        }
LABEL_17:

        ++v8;
      }
      while (v8 != v7);
      uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
      uint64_t v7 = v21;
    }
    while (v21);
  }
}

- (void)remote_removeDataSourcesWithIdentifiers:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[HDWorkoutBuilderServer _removeExpectedDataSourceWithIdentifiers:]((uint64_t)self, v4);
  unint64_t v25 = self;
  long long v27 = [(HKDataFlowLink *)self->_workoutDataFlowLink allSourceProcessors];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v26 = *(void *)v33;
    *(void *)&long long v6 = 138543618;
    long long v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = v27;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              char v15 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              int v16 = objc_msgSend(v15, "workoutDataProcessorUUID", v23);
              int v17 = [v16 isEqual:v9];

              if (v17)
              {
                workoutDataFlowLinuint64_t k = v25->_workoutDataFlowLink;
                long long v22 = [v15 workoutDataFlowLink];
                [(HKDataFlowLink *)workoutDataFlowLink removeSource:v22];

                goto LABEL_17;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v40 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        _HKInitializeLogging();
        id v18 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          id v19 = v18;
          uint64_t v20 = [v9 UUIDString];
          *(_DWORD *)long long buf = v23;
          long long v37 = v25;
          __int16 v38 = 2114;
          id v39 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Trying to remove non linked data source %{public}@ from workout builder", buf, 0x16u);
        }
LABEL_17:
        ;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v7);
  }
}

- (void)_removeExpectedDataSourceWithIdentifiers:(uint64_t)a1
{
  id v9 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v3 = *(void **)(a1 + 128);
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    uint64_t v5 = objc_msgSend(v3, "hk_minus:", v4);
    long long v6 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v5;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    uint64_t v7 = [*(id *)(a1 + 136) currentState];
    uint64_t v8 = [v7 index];

    if (v8 == 2) {
      -[HDWorkoutBuilderServer _checkForAttachedDataSources](a1);
    }
  }
}

- (void)remote_addSamples:(id)a3 completion:(id)a4
{
  id v5 = a3;
  _HKLoggingActionCompletion();
  long long v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v22 = 0;
  char v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v22);
  id v8 = v22;
  if (v7)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke;
    id v18 = &unk_1E62F2A18;
    id v19 = self;
    id v9 = v5;
    id v20 = v9;
    id v10 = v6;
    id v21 = v10;
    if (self)
    {
      uint64_t v11 = &v15;
      id v12 = v9;
      uint64_t v13 = [(HDStandardTaskServer *)self delegate];
      uint64_t v14 = [v13 sampleSavingDelegate];
      [v14 saveSamples:v12 withCompletion:v11];

      id v10 = v21;
    }
  }
  else
  {
    ((void (**)(void, void, id))v6)[2](v6, 0, v8);
  }
}

- (uint64_t)_canAddDataWithError:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = [(id)result workoutDataDestinationState];
    if (v4 >= 3)
    {
      if (v4 == 4)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v3 + 40));
        char v7 = *(void **)(v3 + 56);
        if (v7)
        {
          if (a2) {
            *a2 = v7;
          }
          else {
            _HKLogDroppedError();
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a2, 124, @"Workout builder has encountered an unexpected failure.");
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 40));
      }
      else
      {
        if (v4 == 3)
        {
          id v5 = (void *)MEMORY[0x1E4F28C58];
          long long v6 = @"Workout Builder is finalized.";
        }
        else
        {
          id v5 = (void *)MEMORY[0x1E4F28C58];
          long long v6 = @"Unexpected workout builder state.";
        }
        objc_msgSend(v5, "hk_assignError:code:description:", a2, 3, v6);
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addOtherSamples:*(void *)(a1 + 40) dataSource:0];
  }
  long long v6 = [*(id *)(a1 + 32) client];
  char v7 = [v6 connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_2;
  v15[3] = &unk_1E62F3170;
  v15[4] = *(void *)(a1 + 32);
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v15];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_537;
  v11[3] = &unk_1E630A2C8;
  id v9 = *(id *)(a1 + 48);
  char v14 = a2;
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  objc_msgSend(v8, "clientRemote_synchronizeWithCompletion:", v11);
}

void __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addSamples completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_537(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)remote_addWorkoutEvents:(id)a3 completion:(id)a4
{
  id v5 = a3;
  _HKLoggingActionCompletion();
  int v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v21 = 0;
  char v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v21);
  id v8 = v21;
  id v9 = v8;
  if (v7)
  {
    id v20 = v8;
    BOOL v10 = -[HDWorkoutBuilderServer _insertWorkoutEvents:error:]((uint64_t)self, v5, (uint64_t)&v20);
    id v11 = v20;

    id v12 = [(HDStandardTaskServer *)self client];
    id v13 = [v12 connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke;
    v19[3] = &unk_1E62F3170;
    v19[4] = self;
    char v14 = [v13 remoteObjectProxyWithErrorHandler:v19];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke_539;
    v15[3] = &unk_1E630A2C8;
    int v17 = v6;
    BOOL v18 = v10;
    id v9 = v11;
    id v16 = v9;
    objc_msgSend(v14, "clientRemote_synchronizeWithCompletion:", v15);
  }
  else
  {
    ((void (**)(void, void, id))v6)[2](v6, 0, v8);
  }
}

void __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addWorkoutEvents completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke_539(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)remote_addMetadata:(id)a3 completion:(id)a4
{
  id v5 = a3;
  _HKLoggingActionCompletion();
  int v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v22 = 0;
  char v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v22);
  id v8 = v22;
  id v9 = v8;
  if (v7)
  {
    id v21 = v8;
    if (self)
    {
      BOOL v10 = -[HDWorkoutBuilderServer _addMetadata:byPassPrivateKeyCheck:error:]((os_unfair_lock *)self, v5, 0, (uint64_t)&v21);
      id v11 = v21;
    }
    else
    {
      BOOL v10 = 0;
      id v11 = v8;
    }
    id v12 = v11;

    id v13 = [(HDStandardTaskServer *)self client];
    char v14 = [v13 connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke;
    v20[3] = &unk_1E62F3170;
    void v20[4] = self;
    uint64_t v15 = [v14 remoteObjectProxyWithErrorHandler:v20];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke_541;
    v16[3] = &unk_1E630A2C8;
    BOOL v18 = v6;
    BOOL v19 = v10;
    id v9 = v12;
    id v17 = v9;
    objc_msgSend(v15, "clientRemote_synchronizeWithCompletion:", v16);
  }
  else
  {
    ((void (**)(void, void, id))v6)[2](v6, 0, v8);
  }
}

void __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addMetadata completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke_541(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)remote_removeMetadata:(id)a3 completion:(id)a4
{
  id v5 = a3;
  _HKLoggingActionCompletion();
  int v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(HDStandardTaskServer *)self client];
  char v8 = [v7 hasEntitlement:*MEMORY[0x1E4F2A548]];

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Client is missing private entitlement");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v27 = 0;
  char v9 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v27);
  id v10 = v27;
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
LABEL_10:
    ((void (**)(void, void, id))v6)[2](v6, 0, v11);
    goto LABEL_11;
  }
  id v26 = v10;
  id v12 = v5;
  if (self)
  {
    os_unfair_lock_assert_not_owner(&self->_lock);
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x3032000000;
    long long v34 = __Block_byref_object_copy__171;
    long long v35 = __Block_byref_object_dispose__171;
    id v36 = 0;
    id v13 = [(HDStandardTaskServer *)self profile];
    char v14 = [v13 database];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __48__HDWorkoutBuilderServer__removeMetadata_error___block_invoke;
    v28[3] = &unk_1E62F5CB0;
    void v28[4] = self;
    id v29 = v12;
    long long v30 = &v31;
    BOOL v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:&v26 block:v28];

    if (v15)
    {
      id v16 = (void *)v32[5];
      if (v16) {
        -[HDWorkoutBuilderServer _didUpdateMetadata:](self, v16);
      }
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  id v17 = v26;
  BOOL v18 = [(HDStandardTaskServer *)self client];
  BOOL v19 = [v18 connection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke;
  v25[3] = &unk_1E62F3170;
  v25[4] = self;
  id v20 = [v19 remoteObjectProxyWithErrorHandler:v25];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke_546;
  v21[3] = &unk_1E630A2C8;
  long long v23 = v6;
  BOOL v24 = v15;
  id v11 = v17;
  id v22 = v11;
  objc_msgSend(v20, "clientRemote_synchronizeWithCompletion:", v21);

LABEL_11:
}

void __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's removeMetadata completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke_546(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)remote_addWorkoutActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  _HKLoggingActionCompletion();
  int v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v40 = 0;
  char v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v40);
  id v8 = v40;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x1E4F2B718];
    uint64_t v10 = [(HKWorkoutBuilderConfiguration *)self->_configuration workoutConfiguration];
    uint64_t v11 = [v10 activityType];
    id v12 = [v5 workoutConfiguration];
    LOBYTE(v9) = objc_msgSend(v9, "_workoutWithActivityType:acceptsSubActivityType:", v11, objc_msgSend(v12, "activityType"));

    if (v9)
    {
      id v13 = [v5 startDate];
      id v39 = v8;
      char v14 = -[HDWorkoutBuilderServer _validateActivityDates:error:]((uint64_t)self, v13, (uint64_t)&v39);
      id v15 = v39;

      if (v14)
      {
        id v16 = [v5 endDate];
        if (v16)
        {
          id v17 = [v5 startDate];
          int v18 = objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v17);

          if (v18)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Activity end date cannot be before start date");
            id v8 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
          id v38 = v15;
          int v24 = -[HDWorkoutBuilderServer _validateActivityDates:error:]((uint64_t)self, v16, (uint64_t)&v38);
          id v8 = v38;

          if ((v24 & 1) == 0) {
            goto LABEL_13;
          }
          id v15 = v8;
        }
        id v37 = v15;
        int v25 = -[HDWorkoutBuilderServer _isActivityDateOverlapping:endDate:error:]((uint64_t)self, v5, v16, (uint64_t)&v37);
        id v8 = v37;

        if (!v25)
        {
          id v36 = v8;
          int v26 = -[HDWorkoutBuilderServer _addWorkoutActivity:error:]((uint64_t)self, v5, (uint64_t)&v36);
          id v27 = v36;

          if (v26) {
            -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
          }
          long long v28 = [(HDStandardTaskServer *)self client];
          id v29 = [v28 connection];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke;
          v35[3] = &unk_1E62F3170;
          void v35[4] = self;
          long long v30 = [v29 remoteObjectProxyWithErrorHandler:v35];

          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke_555;
          v31[3] = &unk_1E630A2C8;
          uint64_t v33 = v6;
          char v34 = v26;
          id v8 = v27;
          id v32 = v8;
          objc_msgSend(v30, "clientRemote_synchronizeWithCompletion:", v31);

          goto LABEL_17;
        }
LABEL_13:
        ((void (**)(void, void, id))v6)[2](v6, 0, v8);
LABEL_17:

        goto LABEL_18;
      }
      ((void (**)(void, void, id))v6)[2](v6, 0, v15);
      id v8 = v15;
    }
    else
    {
      BOOL v19 = (void *)MEMORY[0x1E4F28C58];
      id v20 = NSNumber;
      id v21 = [v5 workoutConfiguration];
      id v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "activityType"));
      uint64_t v23 = objc_msgSend(v19, "hk_error:format:", 3, @"Cannot add subactivity of type %@", v22);

      v6[2](v6, 0, v23);
      id v8 = (id)v23;
    }
  }
  else
  {
    ((void (**)(void, void, id))v6)[2](v6, 0, v8);
  }
LABEL_18:
}

- (uint64_t)_validateActivityDates:(uint64_t)a3 error:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];

  if (v6 == v5)
  {
    id v8 = @"Activity cannot start or end with date in distant past.";
    goto LABEL_13;
  }
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];

  if (v7 == v5)
  {
    id v8 = @"Activity cannot start or end with date in distant future.";
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "hk_isBeforeDate:", *(void *)(a1 + 200)))
  {
    id v8 = @"Activity cannot start or end before Workout start.";
LABEL_13:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 3, v8);
LABEL_14:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "hk_isAfterDate:", *(void *)(a1 + 208)))
  {
    id v8 = @"Activity cannot start or end after Workout end.";
    goto LABEL_13;
  }
  id v9 = [*(id *)(a1 + 136) currentState];
  uint64_t v10 = [v9 index];

  if (v10 != 1)
  {
    id v8 = @"Activity cannot start or end, builder is not active";
    goto LABEL_13;
  }
  uint64_t v11 = 1;
LABEL_15:

  return v11;
}

- (uint64_t)_isActivityDateOverlapping:(void *)a3 endDate:(uint64_t)a4 error:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v33 = 0;
    goto LABEL_24;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  id v9 = [*(id *)(a1 + 192) allValues];
  uint64_t v10 = (void *)[v9 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v12)
  {
    uint64_t v33 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = v12;
  uint64_t v35 = a4;
  uint64_t v14 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      id v17 = [v16 endDate];

      if (v17)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
        BOOL v19 = [v16 startDate];
        id v20 = [v16 endDate];
        id v21 = (void *)[v18 initWithStartDate:v19 endDate:v20];

        if (v8)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F28C18]);
          uint64_t v23 = [v7 startDate];
          int v24 = (void *)[v22 initWithStartDate:v23 endDate:v8];

          int v25 = [v24 intersectionWithDateInterval:v21];
          [v25 duration];
          double v27 = v26;

          if (v27 != 0.0)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", v35, 3, @"Activity date cannot overlap existing activities");

            goto LABEL_21;
          }
        }
        long long v28 = [v7 startDate];
        id v29 = [v16 endDate];
        char v30 = [v28 isEqualToDate:v29];

        if (v30)
        {
          uint64_t v33 = 0;
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v31 = [v7 startDate];
        int v32 = [v21 containsDate:v31];

        if (!v32)
        {

          continue;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", v35, 3, @"Activity date cannot overlap existing activities ");
LABEL_21:
        uint64_t v33 = 1;
        goto LABEL_22;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    uint64_t v33 = 0;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_23:

LABEL_24:
  return v33;
}

void __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addWorkoutActivity completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke_555(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)remote_updateActivityWithUUID:(id)a3 endDate:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  _HKLoggingActionCompletion();
  id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_workoutActivitiesByUUID objectForKeyedSubscript:v7];
  id v11 = (void *)[v10 copy];

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v12 = [v11 endDate];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = @"Activity already has end date set.";
LABEL_3:
    objc_msgSend(v13, "hk_error:description:", 3, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    ((void (**)(void, void, id))v9)[2](v9, 0, v15);
    goto LABEL_5;
  }
  if (v8)
  {
    id v16 = [v11 startDate];
    int v17 = objc_msgSend(v8, "hk_isBeforeOrEqualToDate:", v16);

    if (v17)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = @"Activity end date cannot be before or equal to start date.";
      goto LABEL_3;
    }
  }
  id v34 = 0;
  char v18 = -[HDWorkoutBuilderServer _validateActivityDates:error:]((uint64_t)self, v8, (uint64_t)&v34);
  id v19 = v34;
  id v15 = v19;
  if ((v18 & 1) == 0) {
    goto LABEL_4;
  }
  id v33 = v19;
  int v20 = -[HDWorkoutBuilderServer _isActivityDateOverlapping:endDate:error:]((uint64_t)self, v11, v8, (uint64_t)&v33);
  id v21 = v33;

  if (v20)
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v21);
    id v15 = v21;
  }
  else
  {
    id v32 = v21;
    int v22 = -[HDWorkoutBuilderServer _endActivityWithUUID:endDate:error:]((uint64_t)self, v7, v8, &v32);
    id v23 = v32;

    if (v22) {
      -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
    }
    int v24 = [(HDStandardTaskServer *)self client];
    int v25 = [v24 connection];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke;
    v31[3] = &unk_1E62F3170;
    void v31[4] = self;
    double v26 = [v25 remoteObjectProxyWithErrorHandler:v31];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke_563;
    v27[3] = &unk_1E630A2C8;
    id v29 = v9;
    char v30 = v22;
    id v15 = v23;
    id v28 = v15;
    objc_msgSend(v26, "clientRemote_synchronizeWithCompletion:", v27);
  }
LABEL_5:
}

void __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's updateActivityWithUUID:endDate: completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke_563(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)remote_updateActivityWithUUID:(id)a3 addMetadata:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = _HKLoggingActionCompletion();
  id v22 = 0;
  int v10 = -[HDWorkoutBuilderServer _updateActivityWithUUID:addMetadata:error:]((uint64_t)self, v8, v7, &v22);

  id v11 = v22;
  if (v10) {
    -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
  }
  uint64_t v12 = [(HDStandardTaskServer *)self client];
  uint64_t v13 = [v12 connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke;
  v21[3] = &unk_1E62F3170;
  void v21[4] = self;
  uint64_t v14 = [v13 remoteObjectProxyWithErrorHandler:v21];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke_565;
  v17[3] = &unk_1E630A2C8;
  char v20 = v10;
  id v18 = v11;
  id v19 = v9;
  id v15 = v11;
  id v16 = v9;
  objc_msgSend(v14, "clientRemote_synchronizeWithCompletion:", v17);
}

void __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's updateActivityWithUUID:addMetadata: completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke_565(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __60__HDWorkoutBuilderServer__lock_pushCurrentConstructionState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  unint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't flush data to client with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)remote_recoverWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutBuilderServer _lock_pushCurrentConstructionState]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v5 = [(HDStandardTaskServer *)self client];
  int v6 = [v5 connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke;
  v11[3] = &unk_1E62F3170;
  void v11[4] = self;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke_566;
  v9[3] = &unk_1E62F29A0;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v7, "clientRemote_synchronizeWithCompletion:", v9);
}

void __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't flush data to client with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke_566(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_updateDevice:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HDStandardTaskServer *)self profile];
  int v6 = [v5 deviceManager];
  id v22 = 0;
  uint64_t v7 = [v6 deviceEntityForDevice:v4 error:&v22];
  id v8 = v22;

  if (v7)
  {
    id v9 = [(HDStandardTaskServer *)self profile];
    uint64_t v10 = [v9 database];
    id v21 = v8;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __46__HDWorkoutBuilderServer_remote_updateDevice___block_invoke;
    id v18 = &unk_1E62F2AE0;
    id v19 = self;
    id v20 = v7;
    BOOL v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:&v21 block:&v15];
    id v12 = v21;

    if (v11)
    {
      os_unfair_lock_lock(&self->_lock);
      -[HKWorkoutBuilderConfiguration setDevice:](self->_configuration, "setDevice:", v4, v15, v16, v17, v18, v19);
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        int v24 = self;
        __int16 v25 = 2114;
        id v26 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update device: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543874;
      int v24 = self;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      id v28 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find device entity for device: %{public}@. Error %{public}@", buf, 0x20u);
    }
    id v12 = v8;
  }
}

uint64_t __46__HDWorkoutBuilderServer_remote_updateDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setDeviceEntity:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (void)remote_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4
{
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = _HKStatisticsComputationMethodForQuantityType(v8, 0);
  id v7 = -[HDWorkoutBuilderServer _lock_statisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:]((uint64_t)self, v8, a3, v6);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_lock_statisticsCalculatorsForQuantityType:(uint64_t)a3 mergeStrategy:(uint64_t)a4 computationMethod:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [(id)a1 taskUUID];
    v38[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    id v9 = v6;
    uint64_t v10 = [*(id *)(a1 + 192) allKeys];
    BOOL v11 = [v8 arrayByAddingObjectsFromArray:v10];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      uint64_t v29 = *(void *)v34;
      do
      {
        uint64_t v16 = 0;
        uint64_t v32 = v14;
        do
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
          id v18 = objc_msgSend(*(id *)(a1 + 88), "calculatorForQuantityType:activityUUID:", v5, v17, v29);
          if (!v18)
          {
            id v19 = *(id *)(a1 + 200);
            id v20 = [(id)a1 taskUUID];
            char v21 = [v17 isEqual:v20];

            if (v21)
            {
              id v22 = 0;
            }
            else
            {
              id v23 = [*(id *)(a1 + 192) objectForKeyedSubscript:v17];
              [v23 startDate];
              id v24 = v5;
              id v25 = v12;
              v27 = id v26 = v9;

              id v22 = [v23 endDate];

              id v19 = (id)v27;
              id v9 = v26;
              id v12 = v25;
              id v5 = v24;
              uint64_t v15 = v29;
            }
            id v18 = -[HDWorkoutBuilderServer _lock_createStatisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:startDate:endDate:](a1, v5, a3, a4, v19, v22);
            [*(id *)(a1 + 88) setCalculator:v18 forQuantityType:v5 activityUUID:v17];

            uint64_t v14 = v32;
          }
          [v9 setObject:v18 forKeyedSubscript:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)remote_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4
{
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = -[HDWorkoutBuilderServer _lock_statisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:]((uint64_t)self, v7, 0, a3);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)remote_setShouldCollectEvents:(BOOL)a3
{
  BOOL v3 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HKWorkoutBuilderConfiguration *)self->_configuration setShouldCollectWorkoutEvents:v3];

  os_unfair_lock_unlock(p_lock);
}

- (void)remote_currentZonesForType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  upstreamQueue = self->_upstreamQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HDWorkoutBuilderServer_remote_currentZonesForType_completion___block_invoke;
  block[3] = &unk_1E62F69F0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(upstreamQueue, block);
}

void __64__HDWorkoutBuilderServer_remote_currentZonesForType_completion___block_invoke(void *a1)
{
  uint64_t v2 = (id *)a1[4];
  id v7 = 0;
  char v3 = -[HDWorkoutBuilderServer _associateZonesSamplesIfNeededWithError:](v2, &v7);
  id v4 = v7;
  uint64_t v5 = a1[6];
  if (v3)
  {
    id v6 = [*(id *)(a1[4] + 224) objectForKeyedSubscript:a1[5]];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    (*(void (**)(void, void, id))(v5 + 16))(a1[6], 0, v4);
  }
}

uint64_t __54__HDWorkoutBuilderServer__updateWorkoutConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setWorkoutConfiguration:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (id)currentMetadata
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_metadata copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)_addMetadata:(int)a3 byPassPrivateKeyCheck:(uint64_t)a4 error:
{
  id v7 = a2;
  os_unfair_lock_assert_not_owner(a1 + 10);
  id v8 = [(os_unfair_lock *)a1 client];
  id v9 = v8;
  if (a3)
  {
    id v10 = [v8 configuration];
    uint64_t v11 = [v10 applicationSDKVersionToken];

    if ((objc_msgSend(v7, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", 1, v11, a4) & 1) == 0)
    {
LABEL_3:
      BOOL v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    int v13 = objc_msgSend(v7, "hd_validateMetadataKeysAndValuesWithClient:error:", v8, a4);

    if (!v13) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__171;
  id v24 = __Block_byref_object_dispose__171;
  id v25 = 0;
  uint64_t v14 = [(os_unfair_lock *)a1 profile];
  uint64_t v15 = [v14 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HDWorkoutBuilderServer__addMetadata_byPassPrivateKeyCheck_error___block_invoke;
  v17[3] = &unk_1E62F5CB0;
  void v17[4] = a1;
  id v18 = v7;
  id v19 = &v20;
  BOOL v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v15 error:a4 block:v17];

  if (v12) {
    -[HDWorkoutBuilderServer _didUpdateMetadata:](a1, (void *)v21[5]);
  }

  _Block_object_dispose(&v20, 8);
LABEL_8:

  return v12;
}

uint64_t __67__HDWorkoutBuilderServer__addMetadata_byPassPrivateKeyCheck_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_unfair_lock_s *)(a1[4] + 40);
  id v6 = a2;
  os_unfair_lock_lock(v5);
  id v7 = *(void **)(a1[4] + 176);
  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = a1[4];
    id v10 = *(void **)(v9 + 176);
    *(void *)(v9 + 176) = v8;

    id v7 = *(void **)(a1[4] + 176);
  }
  [v7 addEntriesFromDictionary:a1[5]];
  uint64_t v11 = [*(id *)(a1[4] + 176) copy];
  uint64_t v12 = *(void *)(a1[6] + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(a1[4] + 48) setMetadata:*(void *)(a1[4] + 176) transaction:v6 error:a3];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
  return v14;
}

uint64_t __48__HDWorkoutBuilderServer__removeMetadata_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 40));
  id v6 = *(void **)(a1[4] + 176);
  if (v6
    && ([v6 objectForKeyedSubscript:a1[5]],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    [*(id *)(a1[4] + 176) removeObjectForKey:a1[5]];
    uint64_t v8 = [*(id *)(a1[4] + 176) copy];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [*(id *)(a1[4] + 48) setMetadata:*(void *)(a1[4] + 176) transaction:v5 error:a3];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = a1[5];
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%{public}@: Empty or metadata for %{public}@ does not exist", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
    uint64_t v11 = 1;
  }

  return v11;
}

void __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated metadata with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke_567(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutDataAccumulator:*(void *)(a1 + 32) didUpdateMetadata:*(void *)(a1 + 40)];
  }
}

void __52__HDWorkoutBuilderServer__didChangeElapsedTimeBasis__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of elapsed time basis change with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __53__HDWorkoutBuilderServer__insertWorkoutEvents_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 40)];
  int v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 184))
  {
    objc_msgSend(v5, "addObjectsFromArray:");
    uint64_t v7 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 40));
  __int16 v8 = [v6 allObjects];
  id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    uint64_t v14 = 1;
    uint64_t v15 = @"Consecutive pause events.";
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = [*(id *)(*((void *)&v43 + 1) + 8 * i) type];
        if (v17 == 2)
        {
          if (v14 == 1)
          {
            uint64_t v15 = @"Consecutive resume events.";
LABEL_36:
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, v15);

            uint64_t v31 = 0;
            goto LABEL_39;
          }
          uint64_t v14 = 1;
        }
        else if (v17 == 1)
        {
          if (v14 == 2) {
            goto LABEL_36;
          }
          uint64_t v14 = 2;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  long long v33 = v6;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = *(id *)(a1 + 40);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        if (([*(id *)(*(void *)(a1 + 32) + 184) containsObject:v23] & 1) == 0
          && ![*(id *)(*(void *)(a1 + 32) + 48) insertWorkoutEvent:v23 transaction:v34 error:a3])
        {

          uint64_t v31 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), v9);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v24 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:*(void *)(*((void *)&v35 + 1) + 8 * k)];
        int v30 = [v29 _filterAndSetWorkoutEvents:v10];

        if (v30) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v26);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v31 = 1;
LABEL_38:
  int v6 = v33;
LABEL_39:

  return v31;
}

void __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated events with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke_577(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutDataAccumulator:*(void *)(a1 + 32) didUpdateEvents:*(void *)(a1 + 40)];
  }
}

BOOL __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = [v4 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke_2;
  v11[3] = &unk_1E62F5CB0;
  int v6 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 48);
  id v12 = v7;
  uint64_t v13 = v8;
  BOOL v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v5 error:a2 block:v11];

  return v9;
}

BOOL __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if ([*(id *)(*(void *)(a1 + 32) + 48) insertWorkoutActivity:*(void *)(a1 + 40) transaction:v5 error:a3])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v33 = a1;
    id v7 = *(id *)(a1 + 40);
    id v34 = v5;
    id v38 = v5;
    if (v6)
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)(v6 + 40));
      id v36 = objc_alloc_init(MEMORY[0x1E4F2B748]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      obuint64_t j = [*(id *)(v6 + 88) allQuantityTypes];
      uint64_t v39 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (!v39) {
        goto LABEL_24;
      }
      uint64_t v37 = *(void *)v43;
      while (1)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(obj);
          }
          BOOL v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
          uint64_t v10 = _HKStatisticsComputationMethodForQuantityType(v9, 0);
          uint64_t v11 = [v7 startDate];
          id v12 = [v7 endDate];
          uint64_t v13 = -[HDWorkoutBuilderServer _lock_createStatisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:startDate:endDate:](v6, v9, 0, v10, v11, v12);

          uint64_t v14 = *(void **)(v6 + 88);
          uint64_t v15 = [v7 UUID];
          [v14 setCalculator:v13 forQuantityType:v9 activityUUID:v15];

          id v41 = 0;
          LOBYTE(v15) = [v13 invalidateInterval:0 error:&v41];
          id v16 = v41;
          if ((v15 & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v17 = *MEMORY[0x1E4F29FB8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543618;
              uint64_t v47 = v6;
              __int16 v48 = 2114;
              id v49 = v16;
              _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to invalidate calculator: %{public}@", buf, 0x16u);
            }
          }
          id v18 = objc_msgSend(v13, "currentStatistics", v33);
          uint64_t v19 = *(void **)(v6 + 48);
          uint64_t v20 = [v7 UUID];
          id v40 = 0;
          LOBYTE(v19) = [v19 storeStatisticsCalculator:v13 anchor:0 activityUUID:v20 transaction:v38 error:&v40];
          id v21 = v40;

          if ((v19 & 1) == 0
            && (_HKInitializeLogging(),
                uint64_t v22 = *MEMORY[0x1E4F29FB8],
                os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)long long buf = 138543618;
            uint64_t v47 = v6;
            __int16 v48 = 2114;
            id v49 = v21;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist statistics: %{public}@", buf, 0x16u);
            if (!v18) {
              goto LABEL_19;
            }
          }
          else if (!v18)
          {
            goto LABEL_19;
          }
          uint64_t v23 = [v7 startDate];

          if (v23)
          {
            id v24 = [v7 startDate];
            [v18 _setStartDate:v24];
          }
          uint64_t v25 = [v7 endDate];

          if (v25)
          {
            uint64_t v26 = [v7 endDate];
            [v18 _setEndDate:v26];
          }
          uint64_t v27 = [v7 UUID];
          [v36 addActivityStatistics:v18 forType:v9 activityUUID:v27];

LABEL_19:
          ++v8;
        }
        while (v39 != v8);
        uint64_t v28 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        uint64_t v39 = v28;
        if (!v28)
        {
LABEL_24:

          goto LABEL_25;
        }
      }
    }
    id v36 = 0;
LABEL_25:

    a1 = v33;
    uint64_t v29 = *(void *)(*(void *)(v33 + 48) + 8);
    int v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v36;

    BOOL v31 = *(void *)(*(void *)(*(void *)(v33 + 48) + 8) + 40) != 0;
    id v5 = v34;
  }
  else
  {
    BOOL v31 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));

  return v31;
}

void __51__HDWorkoutBuilderServer__lock_didUpdateActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated activities with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __46__HDWorkoutBuilderServer__didUpdateActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated activities with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __51__HDWorkoutBuilderServer__updateActivitiesDuration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "updateWorkoutActivityEndDate:transaction:error:", *(void *)(*((void *)&v13 + 1) + 8 * v10), v5, a3, (void)v13))
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  return v11;
}

uint64_t __68__HDWorkoutBuilderServer__updateActivityWithUUID_addMetadata_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = (os_unfair_lock_s *)(a1[4] + 40);
  id v6 = a2;
  os_unfair_lock_lock(v5);
  uint64_t v7 = [*(id *)(a1[4] + 192) objectForKeyedSubscript:a1[5]];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 metadata];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v10 addEntriesFromDictionary:a1[6]];
  [v8 _setMetadata:v10];
  uint64_t v11 = [*(id *)(a1[4] + 48) updateWorkoutActivityMetadata:v8 transaction:v6 error:a3];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
  return v11;
}

uint64_t __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 112) allObjects];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * v5);
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 88);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke_2;
        v10[3] = &unk_1E630A318;
        id v11 = *(id *)(a1 + 40);
        uint64_t v12 = v6;
        uint64_t v13 = *(void *)(a1 + 32);
        [v7 enumerateCalculatorsForQuantityType:v6 handler:v10];
        [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  return 1;
}

uint64_t __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v11 = 0;
  int v4 = [v3 invalidateInterval:0 error:&v11];
  id v5 = v11;
  if (v4)
  {
    uint64_t v6 = [v3 currentStatistics];
    if (v6) {
      [*(id *)(a1 + 32) addWorkoutStatistics:v6 forType:*(void *)(a1 + 40)];
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to requery for samples of type %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return 1;
}

void __53__HDWorkoutBuilderServer__fetchZonesByTypeWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 sampleType];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

uint64_t __81__HDWorkoutBuilderServer__lock_updateStatisticsWithQuantities_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a2, "hdw_dateInterval");
  uint64_t v6 = [v5 startDate];
  uint64_t v7 = objc_msgSend(v4, "hdw_dateInterval");

  uint64_t v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __81__HDWorkoutBuilderServer__lock_updateStatisticsWithQuantities_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "hdw_quantity");
        [v9 doubleValueForUnit:*(void *)(a1 + 40)];
        double v11 = v10;

        uint64_t v12 = *(void **)(a1 + 48);
        objc_msgSend(v8, "hdw_startTimestamp");
        double v14 = v13;
        objc_msgSend(v8, "hdw_endTimestamp");
        double v16 = v15;
        id v17 = objc_msgSend(v8, "hdw_sample");
        uint64_t v18 = [v17 sourceRevision];
        uint64_t v19 = [v18 source];
        uint64_t v20 = [v19 _sourceID];
        LODWORD(v12) = objc_msgSend(v12, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v20, "longLongValue"), a2, v11, v14, v16);

        if (!v12)
        {
          uint64_t v21 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v21 = 1;
LABEL_11:

  return v21;
}

- (id)_lock_createStatisticsCalculatorsForQuantityType:(uint64_t)a3 mergeStrategy:(uint64_t)a4 computationMethod:(void *)a5 startDate:(void *)a6 endDate:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a2;
  unint64_t v14 = [v13 aggregationStyle];
  if (v14 > 3) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = qword_1BD340908[v14];
  }
  double v16 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:v13 intervalCollection:0 options:v15 mergeStrategy:a3 computationMethod:a4];
  id v17 = -[HDWorkoutBuilderServer _lock_sourceOrderProviderForQuantityType:](a1, v13);
  [v16 setSourceOrderProvider:v17];

  uint64_t v18 = -[HDWorkoutBuilderServer _lock_statisticsDataSourceForQuantityType:](a1, v13);
  [v16 setDataSource:v18];

  uint64_t v19 = -[HDWorkoutBuilderServer _lock_maskedIntervalsForStatisticsOfType:startDate:endDate:](a1, v13, v11, v12);

  id v25 = 0;
  char v20 = [v16 setMaskedIntervals:v19 error:&v25];
  id v21 = v25;
  if ((v20 & 1) == 0
    && (_HKInitializeLogging(),
        uint64_t v22 = *MEMORY[0x1E4F29FB8],
        os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v27 = a1;
    __int16 v28 = 2114;
    id v29 = v21;
    _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error setting statistics masking intervals immediately after calculator creation: %{public}@", buf, 0x16u);
    if (!v11) {
      goto LABEL_9;
    }
  }
  else if (!v11)
  {
    goto LABEL_9;
  }
  [v16 configureMergeAnchor:v11];
  if (v12)
  {
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v12];
    [v16 setDateInterval:v23];
  }
LABEL_9:

  return v16;
}

- (id)_lock_maskedIntervalsForStatisticsOfType:(void *)a3 startDate:(void *)a4 endDate:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = a2;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    char v10 = [*(id *)(a1 + 80) containsObject:v9];

    if (v10)
    {
      a1 = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      a1 = _HKPausedIntervalsWithWorkoutEvents();
    }
    if (v7)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F2AEE0]);
      id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
      id v13 = (void *)[v11 initWithStartDate:v12 endDate:v7];

      v23[0] = v13;
      unint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      uint64_t v15 = [v14 arrayByAddingObjectsFromArray:a1];

      a1 = v15;
    }
    if (v8)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F2AEE0]);
      id v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v18 = (void *)[v16 initWithStartDate:v8 endDate:v17];

      uint64_t v22 = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      uint64_t v20 = [v19 arrayByAddingObjectsFromArray:a1];

      a1 = v20;
    }
  }

  return (id)a1;
}

void __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated statistics with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke_616(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) workoutStatistics];
    [v5 workoutDataAccumulator:v3 didUpdateStatistics:v4];
  }
}

void __44__HDWorkoutBuilderServer__didFinishRecovery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of finished recovery with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 40));
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__171;
  id v21 = __Block_byref_object_dispose__171;
  id v22 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F2B748]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 88);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2;
  v14[3] = &unk_1E630A388;
  v14[4] = v3;
  id v16 = &v17;
  id v5 = v2;
  id v15 = v5;
  [v4 enumerateCalculatorsWithHandler:v14];
  if ([(id)v18[5] count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = (id)v18[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
      }
      while (v7);
    }
  }
  -[HDWorkoutBuilderServer _didUpdateStatistics:](*(void **)(a1 + 32), v5);

  _Block_object_dispose(&v17, 8);
}

uint64_t __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(id *)(*(void *)(a1 + 32) + 200);
  long long v11 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:v9];
  long long v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 startDate];

    unint64_t v14 = [v12 endDate];
    id v10 = (id)v13;
  }
  else
  {
    unint64_t v14 = 0;
  }
  id v15 = -[HDWorkoutBuilderServer _lock_maskedIntervalsForStatisticsOfType:startDate:endDate:](*(void *)(a1 + 32), v8, v10, v14);
  if (v10) {
    [v7 configureMergeAnchor:v10];
  }
  id v16 = [v7 maskedIntervals];
  char v17 = [v16 isEqual:v15];

  if ((v17 & 1) == 0)
  {
    id v31 = 0;
    char v18 = [v7 setMaskedIntervals:v15 error:&v31];
    id v19 = v31;
    if (v18)
    {
      uint64_t v20 = [v7 currentStatistics];
      if (v20)
      {
        id v30 = v19;
        id v21 = [*(id *)(a1 + 32) taskUUID];
        int v29 = [v9 isEqual:v21];

        if (v29)
        {
          [*(id *)(a1 + 40) addWorkoutStatistics:v20 forType:v8];
          id v19 = v30;
        }
        else
        {
          if (v10) {
            [v20 _setStartDate:v10];
          }
          id v19 = v30;
          if (v14) {
            [v20 _setEndDate:v14];
          }
          [*(id *)(a1 + 40) addActivityStatistics:v20 forType:v8 activityUUID:v9];
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      id v22 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543874;
        uint64_t v33 = v28;
        __int16 v34 = 2114;
        id v35 = v8;
        __int16 v36 = 2114;
        id v37 = v19;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to requery after interval mask update for type %{public}@: %{public}@", buf, 0x20u);
      }
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v23)
      {
        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
        long long v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;

        uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v23 addObject:v8];
    }
  }
  return 1;
}

uint64_t __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_620(uint64_t a1)
{
  return 1;
}

uint64_t __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2_621(uint64_t a1)
{
  return 1;
}

uint64_t __58__HDWorkoutBuilderServer__currentStatisticsByQuantityType__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 currentStatistics];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];

  return 1;
}

void __50__HDWorkoutBuilderServer__lock_didUpdateStartDate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutDataAccumulator:*(void *)(a1 + 32) didUpdateStartDate:*(void *)(*(void *)(a1 + 32) + 200)];
  }
}

- (void)addSampleObserver:(id)a3
{
}

- (void)removeSampleObserver:(id)a3
{
}

- (BOOL)enumerateSamplesOfTypes:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a5;
  persistentEntity = self->_persistentEntity;
  id v10 = a3;
  long long v11 = [(HDStandardTaskServer *)self profile];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__HDWorkoutBuilderServer_enumerateSamplesOfTypes_error_handler___block_invoke;
  v14[3] = &unk_1E630A400;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a4) = [(HDWorkoutBuilderEntity *)persistentEntity enumerateAssociatedSamplesOfTypes:v10 interval:0 profile:v11 error:a4 sampleHandler:v14];

  return (char)a4;
}

uint64_t __64__HDWorkoutBuilderServer_enumerateSamplesOfTypes_error_handler___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)enumerateQuantitiesOfType:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  persistentEntity = self->_persistentEntity;
  long long v11 = [(HDStandardTaskServer *)self profile];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HDWorkoutBuilderServer_enumerateQuantitiesOfType_error_handler___block_invoke;
  v15[3] = &unk_1E630A428;
  id v16 = v8;
  id v17 = v9;
  id v12 = v8;
  id v13 = v9;
  LOBYTE(a4) = [(HDWorkoutBuilderEntity *)persistentEntity enumerateAssociatedSampleValuesOfType:v12 interval:0 profile:v11 error:a4 sampleHandler:v15];

  return (char)a4;
}

uint64_t __66__HDWorkoutBuilderServer_enumerateQuantitiesOfType_error_handler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id v9 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = [*(id *)(a1 + 32) canonicalUnit];
  id v12 = [v9 quantityWithUnit:v11 doubleValue:a4];
  id v13 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a5, a6);
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v12, v13);

  return 1;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B728] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B728] clientInterface];
}

- (void)connectionInvalidated
{
  char v3 = 0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v3, 1u);
  uint64_t v4 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];

  if (!v4)
  {
    id v19 = 0;
    unsigned int v10 = -[HDWorkoutBuilderServer _discardWorkoutWithError:](self, (uint64_t)&v19);
    id v8 = v19;
    _HKInitializeLogging();
    long long v11 = *MEMORY[0x1E4F29FB8];
    id v12 = *MEMORY[0x1E4F29FB8];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v21 = self;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarded workout on connection invalidation because no session is associated with this builder.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to discard unassociated builder on connection invalidation: %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  id v5 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];
  id v6 = [(HDStandardTaskServer *)self profile];
  id v18 = 0;
  id v7 = +[HDWorkoutSessionEntity lookupSessionWithIdentifier:v5 profile:v6 error:&v18];
  id v8 = v18;

  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    if (v7)
    {
      -[HDWorkoutBuilderServer _persistRecoveryData]((os_unfair_lock *)self);
    }
    else
    {
      persistentEntity = self->_persistentEntity;
      id v16 = [(HDStandardTaskServer *)self profile];
      +[HDWorkoutBuilderServer finishDetachedBuilderForEntity:persistentEntity sessionEndDate:0 profile:v16];
    }
LABEL_19:

    v17.receiver = self;
    v17.super_class = (Class)HDWorkoutBuilderServer;
    [(HDStandardTaskServer *)&v17 connectionInvalidated];
    return;
  }
  _HKInitializeLogging();
  id v13 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup associated session entity on connection invalidated; treating session as present: %{public}@",
      buf,
      0x16u);
  }
  -[HDWorkoutBuilderServer _persistRecoveryData]((os_unfair_lock *)self);
}

BOOL __50__HDWorkoutBuilderServer__finishWorkoutWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 endDate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)didCreateTaskServer:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  if ([v41 conformsToProtocol:&unk_1F17F7298])
  {
    uint64_t v4 = [v41 taskUUID];
    id v40 = v41;
    id v5 = v4;
    if (self)
    {
      os_unfair_lock_lock(&self->_lock);
      BOOL v6 = [(NSSet *)self->_expectedDataSourceUUIDs containsObject:v5];
      os_unfair_lock_unlock(&self->_lock);
      if (v6)
      {
        workoutDataFlowLinuint64_t k = self->_workoutDataFlowLink;
        if (!workoutDataFlowLink)
        {
          uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
          [v39 handleFailureInMethod:sel__setupDataSource_identifier_, self, @"HDWorkoutBuilderServer.m", 3185, @"Invalid parameter not satisfying: %@", @"_workoutDataFlowLink != nil" object file lineNumber description];

          workoutDataFlowLinuint64_t k = self->_workoutDataFlowLink;
        }
        [(HKDataFlowLink *)workoutDataFlowLink allSourceProcessors];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v60;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v60 != v10) {
                objc_enumerationMutation(v8);
              }
              id v12 = [*(id *)(*((void *)&v59 + 1) + 8 * i) workoutDataProcessorUUID];
              int v13 = [v12 isEqual:v5];

              if (v13)
              {
                _HKInitializeLogging();
                uint64_t v27 = (void *)*MEMORY[0x1E4F29FB8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                {
                  id v37 = v27;
                  uint64_t v38 = [v5 UUIDString];
                  *(_DWORD *)long long buf = 138412290;
                  *(void *)&uint8_t buf[4] = v38;
                  _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "Trying to add already linked data source %@ to workout builder", buf, 0xCu);
                }
                *(void *)long long buf = v5;
                uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
                -[HDWorkoutBuilderServer _removeExpectedDataSourceWithIdentifiers:]((uint64_t)self, v28);

                goto LABEL_30;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        _HKInitializeLogging();
        unint64_t v14 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          id v16 = [v40 workoutDataFlowLink];
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2114;
          long long v65 = v16;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding source %{public}@ (%{public}@)", buf, 0x20u);
        }
        objc_super v17 = self->_workoutDataFlowLink;
        id v18 = [v40 workoutDataFlowLink];
        [(HKDataFlowLink *)v17 addSource:v18];

        uint64_t v55 = 0;
        __int16 v56 = &v55;
        uint64_t v57 = 0x2020000000;
        char v58 = 0;
        uint64_t v49 = 0;
        uint64_t v50 = &v49;
        uint64_t v51 = 0x3032000000;
        uint64_t v52 = __Block_byref_object_copy__171;
        id v53 = __Block_byref_object_dispose__171;
        id v54 = 0;
        uint64_t v43 = 0;
        long long v44 = &v43;
        uint64_t v45 = 0x3032000000;
        long long v46 = __Block_byref_object_copy__171;
        uint64_t v47 = __Block_byref_object_dispose__171;
        id v48 = 0;
        id v19 = [(HDStandardTaskServer *)self profile];
        uint64_t v20 = [v19 database];
        id v42 = 0;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __54__HDWorkoutBuilderServer__setupDataSource_identifier___block_invoke;
        long long v65 = &unk_1E6300468;
        id v21 = v40;
        id v66 = v21;
        id v67 = self;
        id v22 = v5;
        id v68 = v22;
        id v69 = &v49;
        uint64_t v70 = &v43;
        __int16 v71 = &v55;
        BOOL v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v20 error:&v42 block:buf];
        id v24 = v42;

        if (v23)
        {
          os_unfair_lock_lock(&self->_lock);
          if ([(NSMutableDictionary *)self->_workoutActivitiesByUUID count])
          {
            uint64_t v25 = [(NSMutableDictionary *)self->_workoutActivitiesByUUID allValues];
            long long v26 = objc_msgSend(v25, "hk_firstObjectPassingTest:", &__block_literal_global_665);

            os_unfair_lock_unlock(&self->_lock);
            if (v26) {
              [v21 workoutDataDestination:self didBeginActivity:v26];
            }
          }
          else
          {
            os_unfair_lock_unlock(&self->_lock);
            long long v26 = 0;
          }
          -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask]((uint64_t)self);
          if (*((unsigned char *)v56 + 24)) {
            -[HDWorkoutBuilderServer _requestDataFromSource:from:to:](self, v21, (void *)v50[5], (void *)v44[5]);
          }
          if (objc_opt_respondsToSelector())
          {
            int v29 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];
            [v21 workoutDataDestination:self didAttachDataSourceToSessionIdentifer:v29];
          }
        }
        id v63 = v22;
        id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
        -[HDWorkoutBuilderServer _removeExpectedDataSourceWithIdentifiers:]((uint64_t)self, v30);

        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v49, 8);

        _Block_object_dispose(&v55, 8);
LABEL_30:
      }
    }
  }
  id v31 = [(HKWorkoutBuilderConfiguration *)self->_configuration associatedSessionUUID];
  uint64_t v32 = [v41 taskUUID];
  int v33 = [v31 isEqual:v32];

  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_unfair_lock_lock(&self->_lock);
      lock_isAssociatedToSessiouint64_t n = self->_lock_isAssociatedToSession;
      self->_lock_isAssociatedToSessiouint64_t n = 1;
      os_unfair_lock_unlock(&self->_lock);
      if (!lock_isAssociatedToSession)
      {
        persistentEntity = self->_persistentEntity;
        id v36 = v41;
        [v36 setAssociatedWorkoutBuilderEntity:persistentEntity];
        [v36 setWorkoutDataAccumulator:self];
      }
    }
  }
}

- (void)didInvalidateTaskServer:(id)a3
{
  id v4 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v5 = [v8 daemon];
  BOOL v6 = [v5 taskServerRegistry];
  id v7 = [v4 taskUUID];

  [v6 addObserver:self forTaskServerUUID:v7 queue:0];
}

uint64_t __54__HDWorkoutBuilderServer__setupDataSource_identifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![*(id *)(*(void *)(a1 + 40) + 48) setSessionIdentifier:*(void *)(a1 + 48) transaction:v5 error:a3])
  {
    uint64_t v17 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v8 = v5;
    if (v6)
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)(v6 + 40));
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = [v7 quantityTypesToIncludeWhilePaused];
        uint64_t v10 = [*(id *)(v6 + 80) setByAddingObjectsFromSet:v9];
        long long v11 = *(void **)(v6 + 80);
        *(void *)(v6 + 80) = v10;

        id v12 = *(void **)(v6 + 48);
        int v13 = [*(id *)(v6 + 80) allObjects];
        id v19 = 0;
        char v14 = [v12 setQuantityTypesIncludedWhilePaused:v13 transaction:v8 error:&v19];
        id v15 = v19;

        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          id v16 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            uint64_t v21 = v6;
            __int16 v22 = 2114;
            id v23 = v15;
            _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Unable to add quantity types to include while paused: %{public}@", buf, 0x16u);
          }
        }
      }
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 40) + 200));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 40) + 208));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                           + 40) != 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    uint64_t v17 = 1;
  }

  return v17;
}

BOOL __54__HDWorkoutBuilderServer__setupDataSource_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 endDate];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __60__HDWorkoutBuilderServer__addExpectedDataSourceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 workoutDataProcessorUUID];
}

uint64_t __57__HDWorkoutBuilderServer__requestDataFromSource_from_to___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonesByType, 0);
  objc_storeStrong((id *)&self->_dataInterval, 0);
  objc_storeStrong((id *)&self->_workoutEndDate, 0);
  objc_storeStrong((id *)&self->_workoutStartDate, 0);
  objc_storeStrong((id *)&self->_workoutActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_upstreamQueue, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_expectedDataSourceUUIDs, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_quantityTypesRequiringCalculatorInvalidation, 0);
  objc_storeStrong((id *)&self->_statisticsDataSourcesByType, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvidersByType, 0);
  objc_storeStrong((id *)&self->_statisticsCalculators, 0);
  objc_storeStrong((id *)&self->_quantityTypesIncludedWhilePaused, 0);
  objc_storeStrong((id *)&self->_sampleObservers, 0);
  objc_storeStrong((id *)&self->_dataAccumulatorObservers, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_persistentEntity, 0);
}

@end