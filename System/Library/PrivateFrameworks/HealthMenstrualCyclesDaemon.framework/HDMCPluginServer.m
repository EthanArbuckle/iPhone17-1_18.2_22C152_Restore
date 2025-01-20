@interface HDMCPluginServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (BOOL)_queue_deleteSamplesOfType:(id)a3 onDayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6;
- (BOOL)_queue_insertSamplesWithClientSource:(id)a3 creationDate:(id)a4 error:(id *)a5;
- (BOOL)_queue_insertSamplesWithClientSource:(id)a3 error:(id *)a4;
- (BOOL)_queue_reconcileSamplesToDeriveDaySummary:(id)a3 analysis:(id)a4 canOverrideCreationDate:(BOOL)a5 error:(id *)a6;
- (BOOL)_queue_saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6;
- (BOOL)_queue_saveCategorySampleByDayIndex:(id)a3 calendarCache:(id)a4 readValueFromDaySummary:(id)a5 categoryTypeIdentifier:(id)a6 makeCategorySample:(id)a7 error:(id *)a8;
- (BOOL)_queue_saveIntermenstrualBleedingByDayIndex:(id)a3 calendarCache:(id)a4 error:(id *)a5;
- (BOOL)_queue_saveLastMenstrualPeriodWithDayIndexRange:(id)a3 calendarCache:(id)a4 error:(id *)a5;
- (BOOL)_queue_saveMenstrualFlow:(int64_t)a3 forEachDayInRange:(id)a4 calendarCache:(id)a5 error:(id *)a6;
- (BOOL)_queue_saveMenstrualFlowByDayIndex:(id)a3 calendarCache:(id)a4 error:(id *)a5;
- (BOOL)_queue_saveMenstrualFlowUpdatingAdjacentDays:(int64_t)a3 dayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6;
- (BOOL)_queue_savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6;
- (BOOL)_queue_updateStartOfCycleMetadataForModifiedDayIndex:(int64_t)a3 calendarCache:(id)a4 canOverrideCreationDate:(BOOL)a5 error:(id *)a6;
- (BOOL)_queue_updateUnderlyingSamplesToReplaceDaySummary:(id)a3 withDaySummary:(id)a4 calendarCache:(id)a5 canOverrideCreationDate:(BOOL)a6 error:(id *)a7;
- (HDMCPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7;
- (id)_queue_mostRecentMenstrualFlowSampleWithError:(id *)a3 requiringBeforeDay:(int64_t)a4 calendarCache:(id)a5;
- (id)_samplesToInsertForUpdateFromDaySummary:(id)a3 toDaySummary:(id)a4 typesToDelete:(id *)a5 calendarCache:(id)a6;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_queue_updateLastLoggedInExperienceDate;
- (void)_submitPredictionAccuracyAnalyticWithDayIndex:(int64_t)a3 oldMenstrualFlow:(int64_t)a4 newMenstrualFlow:(int64_t)a5 analysis:(id)a6 isLoggingMultipleDays:(BOOL)a7;
- (void)_triggerImmediateSync;
- (void)remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex:(id)a3 intermenstrualBleedingByDayIndex:(id)a4 addedCycleFactors:(id)a5 initialAnalysisWindow:(id)a6 completion:(id)a7;
- (void)remote_fetchScheduledNotificationsWithCompletion:(id)a3;
- (void)remote_saveBleedingFlow:(int64_t)a3 forBleedingType:(int64_t)a4 dayIndex:(int64_t)a5 completion:(id)a6;
- (void)remote_saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 completion:(id)a5;
- (void)remote_saveDaySummaries:(id)a3 canOverrideCreationDate:(BOOL)a4 completion:(id)a5;
- (void)remote_saveLastMenstrualPeriodWithDayIndexRange:(id)a3 completion:(id)a4;
- (void)remote_saveMenstrualFlow:(int64_t)a3 dayIndex:(int64_t)a4 updateAdjacentDays:(BOOL)a5 completion:(id)a6;
- (void)remote_savePeriodEndedOnDayIndex:(int64_t)a3 completion:(id)a4;
- (void)remote_savePeriodNotYetEndedWithCompletion:(id)a3;
- (void)remote_savePeriodNotYetStartedWithCompletion:(id)a3;
- (void)remote_savePeriodStartedOnDayIndex:(int64_t)a3 completion:(id)a4;
- (void)remote_savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 completion:(id)a5;
- (void)remote_triggerAnalysisForDebugReason:(id)a3 completion:(id)a4;
@end

@implementation HDMCPluginServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x263F450C8]];

  if (v16)
  {
    v17 = [[HDMCPluginServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14 profileExtension:v16];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

- (HDMCPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDMCPluginServer;
  v15 = [(HDStandardTaskServer *)&v21 initWithUUID:a3 configuration:a4 client:v13 delegate:a6];
  if (v15)
  {
    v16 = [v13 profile];
    objc_storeWeak((id *)&v15->_profile, v16);

    objc_storeStrong((id *)&v15->_profileExtension, a7);
    objc_storeStrong((id *)&v15->_client, a5);
    uint64_t v17 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    v19 = [MEMORY[0x263F43498] sharedDiagnosticManager];
    [v19 addObject:v15];
  }
  return v15;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F450D0];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F09BA8];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)remote_fetchScheduledNotificationsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch scheduled notifications", buf, 0xCu);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HDMCPluginServer_remote_fetchScheduledNotificationsWithCompletion___block_invoke;
  v10[3] = &unk_264750F70;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(queue, v10);
}

void __69__HDMCPluginServer_remote_fetchScheduledNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) notificationManager];
  id v5 = 0;
  v3 = [v2 scheduledNotificationsWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)remote_saveDaySummaries:(id)a3 canOverrideCreationDate:(BOOL)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = objc_opt_class();
    id v13 = NSNumber;
    id v14 = v12;
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    *(_DWORD *)buf = 138543618;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ day summaries", buf, 0x16u);
  }
  queue = self->_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__HDMCPluginServer_remote_saveDaySummaries_canOverrideCreationDate_completion___block_invoke;
  v19[3] = &unk_264751140;
  v19[4] = self;
  id v20 = v8;
  BOOL v22 = a4;
  id v21 = v9;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(queue, v19);
}

void __79__HDMCPluginServer_remote_saveDaySummaries_canOverrideCreationDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) analysisManager];
  v3 = [v2 currentAnalysis];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
      id v15 = v10;
      int v14 = objc_msgSend(v12, "_queue_reconcileSamplesToDeriveDaySummary:analysis:canOverrideCreationDate:error:", v11, v3, v13, &v15);
      id v7 = v15;

      if (!v14) {
        break;
      }
      ++v9;
      v10 = v7;
      if (v6 == v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  [*(id *)(a1 + 32) _triggerImmediateSync];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)remote_saveBleedingFlow:(int64_t)a3 forBleedingType:(int64_t)a4 dayIndex:(int64_t)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a6;
  _HKInitializeLogging();
  uint64_t v11 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    id v12 = objc_opt_class();
    id v26 = v12;
    uint64_t v13 = HKSensitiveLogItem();
    id v24 = v10;
    v23 = [NSNumber numberWithInteger:a4];
    int v14 = HKSensitiveLogItem();
    id v15 = HKSensitiveLogItem();
    long long v16 = [NSNumber numberWithInteger:a3];
    HKSensitiveLogItem();
    long long v17 = v27 = a3;
    long long v18 = [NSNumber numberWithInteger:a5];
    HKSensitiveLogItem();
    int64_t v28 = a5;
    id v20 = v19 = a4;
    *(_DWORD *)buf = 138544642;
    v35 = v12;
    __int16 v36 = 2112;
    v37 = v13;
    __int16 v38 = 2112;
    v39 = v14;
    __int16 v40 = 2112;
    v41 = v15;
    __int16 v42 = 2112;
    v43 = v17;
    __int16 v44 = 2112;
    v45 = v20;
    _os_log_impl(&dword_225722000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@: %@, %@: %@, day: %@", buf, 0x3Eu);

    id v10 = v24;
    a4 = v19;
    a5 = v28;

    a3 = v27;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HDMCPluginServer_remote_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke;
  block[3] = &unk_264751168;
  int64_t v31 = a5;
  int64_t v32 = a3;
  int64_t v33 = a4;
  block[4] = self;
  id v30 = v10;
  id v22 = v10;
  dispatch_async(queue, block);
}

void __80__HDMCPluginServer_remote_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  v3 = (void *)a1[4];
  id v4 = [NSNumber numberWithInteger:a1[6]];
  id v10 = v4;
  uint64_t v5 = [NSNumber numberWithInteger:a1[7]];
  v11[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v7 = a1[8];
  id v9 = 0;
  objc_msgSend(v3, "_queue_saveBleedingFlowByDayIndex:forBleedingType:calendarCache:error:", v6, v7, v2, &v9);
  id v8 = v9;

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)remote_saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  id v10 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    uint64_t v11 = objc_opt_class();
    id v21 = v11;
    id v12 = HKSensitiveLogItem();
    uint64_t v13 = [NSNumber numberWithInteger:a4];
    int v14 = HKSensitiveLogItem();
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    long long v16 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544130;
    int64_t v27 = v11;
    __int16 v28 = 2112;
    v29 = v12;
    __int16 v30 = 2112;
    int64_t v31 = v14;
    __int16 v32 = 2112;
    int64_t v33 = v16;
    _os_log_impl(&dword_225722000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ %@ values: %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__HDMCPluginServer_remote_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke;
  block[3] = &unk_264751190;
  block[4] = self;
  id v23 = v8;
  id v24 = v9;
  int64_t v25 = a4;
  id v18 = v9;
  id v19 = v8;
  dispatch_async(queue, block);
}

void __81__HDMCPluginServer_remote_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  id v7 = 0;
  objc_msgSend(v3, "_queue_saveBleedingFlowByDayIndex:forBleedingType:calendarCache:error:", v4, v5, v2, &v7);
  id v6 = v7;
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)remote_saveMenstrualFlow:(int64_t)a3 dayIndex:(int64_t)a4 updateAdjacentDays:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a6;
  _HKInitializeLogging();
  uint64_t v11 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    id v12 = objc_opt_class();
    uint64_t v13 = NSNumber;
    id v21 = v12;
    int v14 = [v13 numberWithInteger:a3];
    id v15 = HKSensitiveLogItem();
    long long v16 = [NSNumber numberWithInteger:a4];
    long long v17 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544130;
    __int16 v28 = v12;
    __int16 v29 = 2112;
    __int16 v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v17;
    __int16 v33 = 1024;
    BOOL v34 = v6;
    _os_log_impl(&dword_225722000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save menstrual flow: %@, day: %@, update adjacent days: %d", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__HDMCPluginServer_remote_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke;
  block[3] = &unk_2647511B8;
  BOOL v26 = v6;
  int64_t v24 = a3;
  int64_t v25 = a4;
  block[4] = self;
  id v23 = v10;
  id v19 = v10;
  dispatch_async(queue, block);
}

void __84__HDMCPluginServer_remote_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  if (*(unsigned char *)(a1 + 64) && HKMCDaySummaryBleedingFlowHasFlow())
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v12 = 0;
    objc_msgSend(v3, "_queue_saveMenstrualFlowUpdatingAdjacentDays:dayIndex:calendarCache:error:", v4, v5, v2, &v12);
    id v6 = v12;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    uint64_t v13 = v8;
    id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    v14[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = 0;
    objc_msgSend(v7, "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", v10, v2, &v11);
    id v6 = v11;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex:(id)a3 intermenstrualBleedingByDayIndex:(id)a4 addedCycleFactors:(id)a5 initialAnalysisWindow:(id)a6 completion:(id)a7
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v48 = a4;
  id v12 = a5;
  id v46 = a7;
  _HKInitializeLogging();
  uint64_t v13 = (os_log_t *)MEMORY[0x263F09930];
  int v14 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    long long v16 = objc_opt_class();
    long long v17 = NSNumber;
    id v18 = v16;
    id v19 = [v17 numberWithInteger:var0];
    *(_DWORD *)buf = 138543618;
    v58 = v16;
    __int16 v59 = 2112;
    v60 = v19;
    _os_log_impl(&dword_225722000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Confirm and save deviations with analysis window start: %@", buf, 0x16u);
  }
  _HKInitializeLogging();
  os_log_t v20 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    id v22 = objc_opt_class();
    id v23 = NSNumber;
    id v24 = v22;
    int64_t v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    BOOL v26 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v58 = v22;
    __int16 v59 = 2112;
    v60 = v25;
    __int16 v61 = 2112;
    v62 = v26;
    _os_log_impl(&dword_225722000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ menstrual flow values: %@", buf, 0x20u);
  }
  _HKInitializeLogging();
  os_log_t v27 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = v27;
    __int16 v29 = objc_opt_class();
    __int16 v30 = NSNumber;
    id v31 = v29;
    __int16 v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v48, "count"));
    __int16 v33 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v58 = v29;
    __int16 v59 = 2112;
    v60 = v32;
    __int16 v61 = 2112;
    v62 = v33;
    _os_log_impl(&dword_225722000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ intermenstrual bleeding values: %@", buf, 0x20u);
  }
  _HKInitializeLogging();
  os_log_t v34 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = v34;
    __int16 v36 = objc_opt_class();
    v37 = NSNumber;
    id v38 = v36;
    v39 = objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    __int16 v40 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v58 = v36;
    __int16 v59 = 2112;
    v60 = v39;
    __int16 v61 = 2112;
    v62 = v40;
    _os_log_impl(&dword_225722000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ added cycle factors: %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke;
  block[3] = &unk_264751230;
  block[4] = self;
  id v51 = v11;
  id v52 = v48;
  id v53 = v12;
  int64_t v55 = var0;
  int64_t v56 = var1;
  id v54 = v46;
  id v42 = v46;
  id v43 = v12;
  id v44 = v48;
  id v45 = v11;
  dispatch_async(queue, block);
}

void __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  id v3 = objc_alloc_init(MEMORY[0x263F43278]);
  [v3 setCacheScope:1];
  [v3 setRequiresProtectedData:1];
  [v3 setRequiresWrite:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = [WeakRetained database];
  id v44 = 0;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2;
  v39[3] = &unk_264750D78;
  id v6 = *(void **)(a1 + 40);
  v39[4] = *(void *)(a1 + 32);
  id v40 = v6;
  id v7 = v2;
  id v41 = v7;
  id v42 = *(id *)(a1 + 48);
  id v43 = *(id *)(a1 + 56);
  int v8 = [v5 performTransactionWithContext:v3 error:&v44 block:v39 inaccessibilityHandler:0];
  id v9 = v44;

  if (v8)
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 48) analysisManager];
    id v38 = v9;
    id v11 = [v10 analyzeWithError:&v38];
    id v12 = v38;

    id v9 = v12;
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v13 = [v11 deviations];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_305;
  v36[3] = &unk_2647511E0;
  id v14 = v7;
  id v37 = v14;
  id v15 = objc_msgSend(v13, "hk_map:", v36);

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2_309;
  v33[3] = &unk_264751208;
  id v16 = v14;
  id v34 = v16;
  long long v35 = *(_OWORD *)(a1 + 72);
  long long v17 = objc_msgSend(v15, "hk_filter:", v33);
  _HKInitializeLogging();
  id v18 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v31 = v3;
    id v19 = v16;
    os_log_t v20 = v11;
    id v21 = v18;
    id v22 = objc_opt_class();
    id v23 = NSNumber;
    id v30 = v22;
    id v24 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
    int64_t v25 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    id v46 = v22;
    id v11 = v20;
    id v16 = v19;
    id v3 = v31;
    __int16 v47 = 2112;
    id v48 = v24;
    __int16 v49 = 2112;
    v50 = v25;
    _os_log_impl(&dword_225722000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving %@ deviations: %@", buf, 0x20u);
  }
  BOOL v26 = *(void **)(a1 + 32);
  id v32 = v9;
  int v27 = objc_msgSend(v26, "_queue_insertSamplesWithClientSource:error:", v17, &v32);
  id v28 = v32;

  if (v27) {
    __int16 v29 = v17;
  }
  else {
    __int16 v29 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v29, v28);
}

uint64_t __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!objc_msgSend(*(id *)(a1 + 32), "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), a3)|| !objc_msgSend(*(id *)(a1 + 32), "_queue_saveIntermenstrualBleedingByDayIndex:calendarCache:error:", *(void *)(a1 + 56), *(void *)(a1 + 48), a3)|| !objc_msgSend(*(id *)(a1 + 32), "_queue_insertSamplesWithClientSource:error:", *(void *)(a1 + 64), a3))
  {
    return 0;
  }
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v13 = 138543362;
    id v14 = (id)objc_opt_class();
    id v7 = v14;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting deviation dismissal dayIndex", (uint8_t *)&v13, 0xCu);
  }
  int v8 = (void *)MEMORY[0x263F43218];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v10 = objc_msgSend(v8, "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", WeakRetained);

  uint64_t v11 = objc_msgSend(v10, "hdmc_setUnconfirmedDeviationDismissalDayIndex:error:", 0, a3);
  return v11;
}

id __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_305(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a2;
  uint64_t v5 = [v4 days];
  id v6 = [*(id *)(a1 + 32) currentCalendar];
  id v7 = objc_msgSend(v3, "hk_noonWithDayIndex:calendar:", v5, v6);

  int v8 = (void *)MEMORY[0x263EFF910];
  uint64_t v9 = [v4 days];
  if (v10 <= 0) {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v11 = v10 + v9 - 1;
  }
  id v12 = [*(id *)(a1 + 32) currentCalendar];
  int v13 = objc_msgSend(v8, "hk_noonWithDayIndex:calendar:", v11, v12);

  id v14 = (void *)MEMORY[0x263F0A150];
  [v4 type];

  uint64_t v15 = HKCategoryTypeFromDeviationType();
  id v16 = [v14 categorySampleWithType:v15 value:0 startDate:v7 endDate:v13];

  return v16;
}

BOOL __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2_309(uint64_t a1, void *a2)
{
  id v3 = [a2 startDate];
  id v4 = [*(id *)(a1 + 32) currentCalendar];
  uint64_t v5 = objc_msgSend(v3, "hk_dayIndexWithCalendar:", v4);

  return v5 >= *(void *)(a1 + 40);
}

- (void)remote_saveLastMenstrualPeriodWithDayIndexRange:(id)a3 completion:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  _HKInitializeLogging();
  int v8 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromHKDayIndexRange();
    int v13 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_225722000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save last menstrual period: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__HDMCPluginServer_remote_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke;
  v16[3] = &unk_264751258;
  int64_t v18 = var0;
  int64_t v19 = var1;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  dispatch_async(queue, v16);
}

void __79__HDMCPluginServer_remote_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  id v3 = (void *)a1[4];
  id v5 = 0;
  objc_msgSend(v3, "_queue_saveLastMenstrualPeriodWithDayIndexRange:calendarCache:error:", a1[6], a1[7], v2, &v5);
  id v4 = v5;
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)remote_savePeriodNotYetStartedWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F0A130]);
  id v6 = [v5 currentCalendar];
  uint64_t v7 = HKMCTodayIndex();

  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    int v8 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = objc_opt_class();
      id v11 = NSNumber;
      id v12 = v10;
      int v13 = [v11 numberWithInteger:v7];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl(&dword_225722000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period not started on day: %@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__HDMCPluginServer_remote_savePeriodNotYetStartedWithCompletion___block_invoke;
  v17[3] = &unk_264751190;
  v17[4] = self;
  id v18 = v5;
  id v19 = v4;
  uint64_t v20 = v7;
  id v15 = v4;
  id v16 = v5;
  dispatch_async(queue, v17);
}

void __65__HDMCPluginServer_remote_savePeriodNotYetStartedWithCompletion___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v13 = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_mostRecentMenstrualFlowSampleWithError:requiringBeforeDay:calendarCache:", &v13, *(void *)(a1 + 56), *(void *)(a1 + 40));
  id v3 = v13;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x263EFF910];
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [*(id *)(a1 + 40) currentCalendar];
    uint64_t v7 = objc_msgSend(v4, "hk_noonWithDayIndex:calendar:", v5, v6);

    int v8 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", 1, v7, 0);
    uint64_t v9 = *(void **)(a1 + 32);
    v14[0] = v8;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v12 = v3;
    objc_msgSend(v9, "_queue_insertSamplesWithClientSource:error:", v10, &v12);
    id v11 = v12;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v3 = v11;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)remote_savePeriodNotYetEndedWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F0A130]);
  id v6 = [v5 currentCalendar];
  uint64_t v7 = HKMCTodayIndex();

  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    int v8 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = objc_opt_class();
      id v11 = NSNumber;
      id v12 = v10;
      id v13 = [v11 numberWithInteger:v7];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl(&dword_225722000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period not ended on day: %@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__HDMCPluginServer_remote_savePeriodNotYetEndedWithCompletion___block_invoke;
  v17[3] = &unk_264751190;
  v17[4] = self;
  id v18 = v5;
  id v19 = v4;
  uint64_t v20 = v7;
  id v15 = v4;
  id v16 = v5;
  dispatch_async(queue, v17);
}

void __63__HDMCPluginServer_remote_savePeriodNotYetEndedWithCompletion___block_invoke(uint64_t a1)
{
  id v7 = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_mostRecentMenstrualFlowSampleWithError:requiringBeforeDay:calendarCache:", &v7, *(void *)(a1 + 56), *(void *)(a1 + 40));
  id v3 = v7;
  if (v2)
  {
    id v4 = [*(id *)(a1 + 40) currentCalendar];
    objc_msgSend(v2, "hk_dayIndexRangeWithCalendar:", v4);

    objc_msgSend(*(id *)(a1 + 32), "_queue_saveMenstrualFlow:forEachDayInRange:calendarCache:error:", 2, v3);
    id v5 = v6;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v3 = v5;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)remote_savePeriodStartedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F0A130]);
  int v8 = [v7 currentCalendar];
  uint64_t v9 = HKMCTodayIndex();

  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = objc_opt_class();
      id v13 = NSNumber;
      id v14 = v12;
      id v15 = [v13 numberWithInteger:a3];
      id v16 = [NSNumber numberWithInteger:v9];
      *(_DWORD *)buf = 138543874;
      BOOL v26 = v12;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period started on day: %@, today: %@", buf, 0x20u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_completion___block_invoke;
  block[3] = &unk_264751280;
  int64_t v23 = a3;
  uint64_t v24 = v9;
  id v21 = v7;
  id v22 = v6;
  block[4] = self;
  id v18 = v7;
  id v19 = v6;
  dispatch_async(queue, block);
}

void __66__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 64) >= *(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_saveMenstrualFlow:forEachDayInRange:calendarCache:error:", 2);
    id v4 = 0;
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F087E8];
    id v3 = objc_msgSend(NSNumber, "numberWithInteger:");
    objc_msgSend(v2, "hk_error:format:", 100, @"Start day cannot be after today: %@", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)remote_savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      id v11 = objc_opt_class();
      id v12 = NSNumber;
      id v13 = v11;
      id v14 = [v12 numberWithInteger:a3];
      id v15 = [NSNumber numberWithInteger:a4];
      *(_DWORD *)buf = 138543874;
      int64_t v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      __int16 v27 = v15;
      _os_log_impl(&dword_225722000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period started on day: %@, ended on day: %@", buf, 0x20u);
    }
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke;
  v18[3] = &unk_264751258;
  int64_t v20 = a3;
  int64_t v21 = a4;
  v18[4] = self;
  id v19 = v8;
  id v17 = v8;
  dispatch_async(queue, v18);
}

void __82__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v7 = 0;
  objc_msgSend(v3, "_queue_savePeriodStartedOnDayIndex:endedOnDayIndex:calendarCache:error:", v4, v5, v2, &v7);
  id v6 = v7;
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)remote_savePeriodEndedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = NSNumber;
      id v11 = v9;
      id v12 = [v10 numberWithInteger:a3];
      *(_DWORD *)buf = 138543618;
      id v19 = v9;
      __int16 v20 = 2112;
      int64_t v21 = v12;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period ended on day: %@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HDMCPluginServer_remote_savePeriodEndedOnDayIndex_completion___block_invoke;
  block[3] = &unk_2647512A8;
  id v16 = v6;
  int64_t v17 = a3;
  block[4] = self;
  id v14 = v6;
  dispatch_async(queue, block);
}

void __64__HDMCPluginServer_remote_savePeriodEndedOnDayIndex_completion___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F0A130]);
  id v3 = (void *)a1[4];
  id v16 = 0;
  uint64_t v4 = objc_msgSend(v3, "_queue_mostRecentMenstrualFlowSampleWithError:requiringBeforeDay:calendarCache:", &v16, a1[6], v2);
  id v5 = v16;
  if (v4)
  {
    id v6 = [v2 currentCalendar];
    uint64_t v7 = objc_msgSend(v4, "hk_dayIndexRangeWithCalendar:", v6);
    uint64_t v9 = v8;
    unint64_t v10 = v7 + v8;

    if (v9 <= 0) {
      unint64_t v11 = 0x8000000000000000;
    }
    else {
      unint64_t v11 = v10;
    }
    id v12 = (void *)a1[4];
    uint64_t v13 = a1[6];
    id v15 = v5;
    objc_msgSend(v12, "_queue_savePeriodStartedOnDayIndex:endedOnDayIndex:calendarCache:error:", v11, v13, v2, &v15);
    id v14 = v15;

    (*(void (**)(void))(a1[5] + 16))();
    id v5 = v14;
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)remote_triggerAnalysisForDebugReason:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, BOOL, id))a4;
  _HKInitializeLogging();
  uint64_t v8 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v6;
    id v10 = v16;
    _os_log_impl(&dword_225722000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Trigger analysis for %{public}@", buf, 0x16u);
  }
  unint64_t v11 = [(HDMCProfileExtension *)self->_profileExtension analysisManager];
  id v14 = 0;
  id v12 = [v11 analyzeWithError:&v14];
  id v13 = v14;

  v7[2](v7, v12 != 0, v13);
}

- (BOOL)_queue_reconcileSamplesToDeriveDaySummary:(id)a3 analysis:(id)a4 canOverrideCreationDate:(BOOL)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x263F0A130]);
  uint64_t v13 = [v10 dayIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = +[HDMCDaySummaryEnumerator daySummaryAtIndex:v13 profile:WeakRetained calendarCache:v12 error:a6];

  if (v15 || !*a6)
  {
    int v16 = [v10 isEqual:v15];
    _HKInitializeLogging();
    __int16 v17 = (void *)*MEMORY[0x263F09930];
    BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = v17;
        *(_DWORD *)buf = 138543362;
        id v40 = (id)objc_opt_class();
        id v20 = v40;
        _os_log_impl(&dword_225722000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical day summary", buf, 0xCu);
      }
      char v21 = 1;
    }
    else
    {
      if (v18)
      {
        log = v17;
        uint64_t v22 = objc_opt_class();
        id v31 = v22;
        HKSensitiveLogItem();
        v23 = BOOL v32 = a5;
        HKSensitiveLogItem();
        uint64_t v25 = v24 = v11;
        *(_DWORD *)buf = 138543874;
        id v40 = v22;
        __int16 v41 = 2112;
        id v42 = v23;
        __int16 v43 = 2112;
        id v44 = v25;
        _os_log_impl(&dword_225722000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reconcile underlying samples to derive summary: %@, old summary: %@", buf, 0x20u);

        id v11 = v24;
        a5 = v32;
      }
      id v26 = objc_alloc_init(MEMORY[0x263F43278]);
      [v26 setCacheScope:1];
      [v26 setRequiresProtectedData:1];
      [v26 setRequiresWrite:1];
      id v27 = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v28 = [v27 database];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __101__HDMCPluginServer__queue_reconcileSamplesToDeriveDaySummary_analysis_canOverrideCreationDate_error___block_invoke;
      v33[3] = &unk_2647512D0;
      void v33[4] = self;
      id v34 = v15;
      id v35 = v10;
      id v36 = v12;
      BOOL v38 = a5;
      id v37 = v11;
      char v21 = [v28 performTransactionWithContext:v26 error:a6 block:v33 inaccessibilityHandler:0];
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

uint64_t __101__HDMCPluginServer__queue_reconcileSamplesToDeriveDaySummary_analysis_canOverrideCreationDate_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_updateUnderlyingSamplesToReplaceDaySummary:withDaySummary:calendarCache:canOverrideCreationDate:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), a3);
  if (result)
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateStartOfCycleMetadataForModifiedDayIndex:calendarCache:canOverrideCreationDate:error:", objc_msgSend(*(id *)(a1 + 48), "dayIndex"), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), a3);
    objc_msgSend(*(id *)(a1 + 32), "_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:", objc_msgSend(*(id *)(a1 + 48), "dayIndex"), objc_msgSend(*(id *)(a1 + 40), "menstrualFlow"), objc_msgSend(*(id *)(a1 + 48), "menstrualFlow"), *(void *)(a1 + 64), 0);
    return v6;
  }
  return result;
}

- (BOOL)_queue_updateUnderlyingSamplesToReplaceDaySummary:(id)a3 withDaySummary:(id)a4 calendarCache:(id)a5 canOverrideCreationDate:(BOOL)a6 error:(id *)a7
{
  BOOL v60 = a6;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v67 = [v11 dayIndex];
  id v75 = 0;
  id v62 = v10;
  v64 = v11;
  uint64_t v63 = [(HDMCPluginServer *)self _samplesToInsertForUpdateFromDaySummary:v10 toDaySummary:v11 typesToDelete:&v75 calendarCache:v12];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v75;
  uint64_t v13 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
  id v14 = (os_log_t *)MEMORY[0x263F09930];
  if (v13)
  {
    uint64_t v15 = v13;
    id v16 = 0;
    uint64_t v17 = *(void *)v72;
    v65 = self;
    while (2)
    {
      uint64_t v18 = 0;
      uint64_t v19 = v16;
      do
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v71 + 1) + 8 * v18);
        id v70 = v19;
        BOOL v21 = [(HDMCPluginServer *)self _queue_deleteSamplesOfType:v20 onDayIndex:v67 calendarCache:v12 error:&v70];
        id v16 = v70;

        if (!v21)
        {
          BOOL v32 = 0;
          __int16 v33 = obj;
          id v34 = v62;
          id v35 = v63;
          id v36 = v64;
          goto LABEL_24;
        }
        _HKInitializeLogging();
        os_log_t v22 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v23 = v22;
          uint64_t v24 = v15;
          id v25 = v16;
          uint64_t v26 = v17;
          id v27 = v12;
          uint64_t v28 = objc_opt_class();
          id v29 = v28;
          id v30 = HKSensitiveLogItem();
          id v31 = [NSNumber numberWithInteger:v67];
          *(_DWORD *)buf = 138543874;
          v77 = v28;
          id v12 = v27;
          uint64_t v17 = v26;
          id v16 = v25;
          uint64_t v15 = v24;
          __int16 v78 = 2112;
          v79 = v30;
          __int16 v80 = 2114;
          v81 = v31;
          _os_log_impl(&dword_225722000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted samples of type: %@ for day index: %{public}@", buf, 0x20u);

          self = v65;
          id v14 = (os_log_t *)MEMORY[0x263F09930];
        }
        ++v18;
        uint64_t v19 = v16;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }

  id v35 = v63;
  __int16 v33 = (void *)[v63 mutableCopy];
  _HKInitializeLogging();
  os_log_t v37 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v38 = v37;
    v39 = objc_opt_class();
    id v40 = v14;
    __int16 v41 = NSNumber;
    id v42 = v39;
    __int16 v43 = [v41 numberWithBool:v60];
    *(_DWORD *)buf = 138543618;
    v77 = v39;
    __int16 v78 = 2114;
    v79 = v43;
    _os_log_impl(&dword_225722000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] canOverrideCreationDate: %{public}@", buf, 0x16u);

    id v14 = v40;
  }
  id v36 = v64;
  if (v60 && [v64 menstrualFlowModificationDayIndex] >= 1)
  {
    _HKInitializeLogging();
    os_log_t v44 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = v44;
      id v46 = objc_opt_class();
      __int16 v47 = NSNumber;
      id v48 = v46;
      __int16 v49 = objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v64, "menstrualFlowModificationDayIndex"));
      *(_DWORD *)buf = 138543618;
      v77 = v46;
      __int16 v78 = 2114;
      v79 = v49;
      _os_log_impl(&dword_225722000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding creation date to day index: %{public}@", buf, 0x16u);
    }
    v50 = objc_msgSend(v63, "hk_filter:", &__block_literal_global_5);
    [v33 removeObjectsInArray:v50];
    uint64_t v51 = (void *)MEMORY[0x263EFF910];
    uint64_t v52 = [v64 menstrualFlowModificationDayIndex];
    id v53 = [v12 currentCalendar];
    id v54 = objc_msgSend(v51, "hk_noonWithDayIndex:calendar:", v52, v53);

    id v69 = v16;
    LODWORD(v53) = [(HDMCPluginServer *)self _queue_insertSamplesWithClientSource:v50 creationDate:v54 error:&v69];
    id v55 = v69;

    if (!v53)
    {
      BOOL v32 = 0;
      id v16 = v55;
      goto LABEL_23;
    }
    id v16 = v55;
  }
  id v68 = v16;
  BOOL v32 = [(HDMCPluginServer *)self _queue_insertSamplesWithClientSource:v33 error:&v68];
  id v56 = v68;

  id v16 = v56;
LABEL_23:
  id v34 = v62;
LABEL_24:

  id v57 = v16;
  v58 = v57;
  if (v57)
  {
    if (a7) {
      *a7 = v57;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v32;
}

uint64_t __129__HDMCPluginServer__queue_updateUnderlyingSamplesToReplaceDaySummary_withDaySummary_calendarCache_canOverrideCreationDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 sampleType];
  id v3 = [v2 identifier];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F09380]];

  return v4;
}

- (id)_samplesToInsertForUpdateFromDaySummary:(id)a3 toDaySummary:(id)a4 typesToDelete:(id *)a5 calendarCache:(id)a6
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  id v13 = v11;
  id v14 = a6;
  uint64_t v15 = [v12 dayIndex];
  uint64_t v16 = [v13 dayIndex];
  if (v12 && v15 != v16)
  {
    v90 = [MEMORY[0x263F08690] currentHandler];
    [v90 handleFailureInMethod:a2, self, @"HDMCPluginServer.m", 487, @"Invalid parameter not satisfying: %@", @"[oldDaySummary dayIndex] == [newDaySummary dayIndex] || oldDaySummary == nil" object file lineNumber description];
  }
  uint64_t v17 = [v13 dayIndex];
  uint64_t v18 = (void *)MEMORY[0x263EFF910];
  uint64_t v19 = [v14 currentCalendar];
  uint64_t v20 = objc_msgSend(v18, "hk_noonWithDayIndex:calendar:", v17, v19);

  BOOL v21 = [MEMORY[0x263EFF980] array];
  os_log_t v22 = [MEMORY[0x263EFF980] array];
  uint64_t v23 = [v13 menstrualFlow];
  if (v23 != [v12 menstrualFlow]
    || ([v13 startOfCycleFromCycleTracking],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        [v12 startOfCycleFromCycleTracking],
        id v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v24 != v25))
  {
    uint64_t v26 = (void *)MEMORY[0x263F0A150];
    uint64_t v27 = [v13 menstrualFlow];
    uint64_t v28 = [v13 startOfCycleFromCycleTracking];
    id v29 = objc_msgSend(v26, "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", v27, v20, objc_msgSend(v28, "BOOLValue"));

    if (v29) {
      [v22 addObject:v29];
    }
    if ([v12 menstrualFlow])
    {
      id v30 = [MEMORY[0x263F0A598] dataTypeWithCode:95];
      [v21 addObject:v30];
    }
  }
  uint64_t v31 = [v13 bleedingInPregnancyFlow];
  if (v31 != [v12 bleedingInPregnancyFlow])
  {
    BOOL v32 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", objc_msgSend(v13, "bleedingInPregnancyFlow"), 1, v20, 0);
    if (v32) {
      [v22 addObject:v32];
    }
    if ([v12 bleedingInPregnancyFlow])
    {
      __int16 v33 = [MEMORY[0x263F0A598] dataTypeWithCode:313];
      [v21 addObject:v33];
    }
  }
  uint64_t v34 = [v13 bleedingAfterPregnancyFlow];
  if (v34 != [v12 bleedingAfterPregnancyFlow])
  {
    id v35 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", objc_msgSend(v13, "bleedingAfterPregnancyFlow"), 2, v20, 0);
    if (v35) {
      [v22 addObject:v35];
    }
    if ([v12 bleedingAfterPregnancyFlow])
    {
      id v36 = [MEMORY[0x263F0A598] dataTypeWithCode:314];
      [v21 addObject:v36];
    }
  }
  uint64_t v37 = [v13 cervicalMucusQuality];
  if (v37 != [v12 cervicalMucusQuality])
  {
    BOOL v38 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithCervicalMucusQuality:date:", objc_msgSend(v13, "cervicalMucusQuality"), v20);
    if (v38) {
      [v22 addObject:v38];
    }
    if ([v12 cervicalMucusQuality])
    {
      v39 = [MEMORY[0x263F0A598] dataTypeWithCode:91];
      [v21 addObject:v39];
    }
  }
  uint64_t v40 = [v13 ovulationTestResult];
  if (v40 != [v12 ovulationTestResult])
  {
    __int16 v41 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithOvulationTestResult:date:", objc_msgSend(v13, "ovulationTestResult"), v20);
    if (v41) {
      [v22 addObject:v41];
    }
    if ([v12 ovulationTestResult])
    {
      id v42 = [MEMORY[0x263F0A598] dataTypeWithCode:92];
      [v21 addObject:v42];
    }
  }
  uint64_t v43 = [v13 pregnancyTestResult];
  if (v43 != [v12 pregnancyTestResult])
  {
    os_log_t v44 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithPregnancyTestResult:date:", objc_msgSend(v13, "pregnancyTestResult"), v20);
    if (v44) {
      [v22 addObject:v44];
    }
    if ([v12 pregnancyTestResult])
    {
      uint64_t v45 = [MEMORY[0x263F0A598] dataTypeWithCode:243];
      [v21 addObject:v45];
    }
  }
  uint64_t v46 = [v13 progesteroneTestResult];
  if (v46 != [v12 progesteroneTestResult])
  {
    __int16 v47 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithProgesteroneTestResult:date:", objc_msgSend(v13, "progesteroneTestResult"), v20);
    if (v47) {
      [v22 addObject:v47];
    }
    if ([v12 progesteroneTestResult])
    {
      id v48 = [MEMORY[0x263F0A598] dataTypeWithCode:244];
      [v21 addObject:v48];
    }
  }
  int v49 = [v13 intermenstrualBleeding];
  if (v49 != [v12 intermenstrualBleeding])
  {
    if ([v13 intermenstrualBleeding])
    {
      v50 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_intermenstrualBleedingCategorySampleWithDate:", v20);
      uint64_t v51 = v22;
    }
    else
    {
      if (![v12 intermenstrualBleeding]) {
        goto LABEL_53;
      }
      v50 = [MEMORY[0x263F0A598] dataTypeWithCode:96];
      uint64_t v51 = v21;
    }
    [v51 addObject:v50];
  }
LABEL_53:
  uint64_t v52 = [v13 sexualActivity];
  if (v52 != [v12 sexualActivity])
  {
    id v53 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithSexualActivity:date:", objc_msgSend(v13, "sexualActivity"), v20);
    if (v53) {
      [v22 addObject:v53];
    }
    if ([v12 sexualActivity])
    {
      id v54 = [MEMORY[0x263F0A598] dataTypeWithCode:97];
      [v21 addObject:v54];
    }
  }
  id v55 = (void *)MEMORY[0x263EFFA08];
  v96 = v13;
  [v13 symptoms];
  id v56 = HKMCDaySummarySymptomArrayFromSymptoms();
  id v57 = [v55 setWithArray:v56];

  v58 = (void *)MEMORY[0x263EFFA08];
  v93 = v12;
  [v12 symptoms];
  __int16 v59 = HKMCDaySummarySymptomArrayFromSymptoms();
  uint64_t v60 = [v58 setWithArray:v59];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v94 = (void *)v60;
  v95 = v57;
  __int16 v61 = objc_msgSend(v57, "hk_minus:", v60);
  uint64_t v62 = [v61 countByEnumeratingWithState:&v101 objects:v106 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v102 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithMenstrualSymptom:date:", objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * i), "integerValue"), v20);
        if (v66) {
          [v22 addObject:v66];
        }
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v101 objects:v106 count:16];
    }
    while (v63);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v67 = objc_msgSend(v94, "hk_minus:", v95);
  uint64_t v68 = [v67 countByEnumeratingWithState:&v97 objects:v105 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v98;
    long long v71 = (void *)MEMORY[0x263F44F38];
    do
    {
      for (uint64_t j = 0; j != v69; ++j)
      {
        if (*(void *)v98 != v70) {
          objc_enumerationMutation(v67);
        }
        [*(id *)(*((void *)&v97 + 1) + 8 * j) integerValue];
        uint64_t v73 = HKMCDataTypeCodeFromMenstrualSymptom();
        if (v73 != *v71)
        {
          long long v74 = [MEMORY[0x263F0A598] dataTypeWithCode:v73];
          [v21 addObject:v74];
        }
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v97 objects:v105 count:16];
    }
    while (v69);
  }

  id v75 = [v96 basalBodyTemperature];
  uint64_t v76 = [v93 basalBodyTemperature];
  if (v75 == (void *)v76)
  {

LABEL_87:
    v82 = v96;
    goto LABEL_88;
  }
  v77 = (void *)v76;
  uint64_t v78 = [v93 basalBodyTemperature];
  if (v78)
  {
    v79 = (void *)v78;
    __int16 v80 = [v96 basalBodyTemperature];
    v81 = [v93 basalBodyTemperature];
    char v91 = [v80 isEqual:v81];

    v82 = v96;
    if (v91) {
      goto LABEL_88;
    }
  }
  else
  {

    v82 = v96;
  }
  uint64_t v83 = [v82 basalBodyTemperature];

  if (v83)
  {
    v84 = (void *)MEMORY[0x263F0A648];
    v85 = [v82 basalBodyTemperature];
    v86 = objc_msgSend(v84, "hkmc_quantitySampleWithBasalBodyTemperature:date:", v85, v20);

    [v22 addObject:v86];
  }
  v87 = [v93 basalBodyTemperature];

  if (v87)
  {
    id v75 = [MEMORY[0x263F0A598] dataTypeWithCode:90];
    [v21 addObject:v75];
    goto LABEL_87;
  }
LABEL_88:
  id v88 = v21;
  *a5 = v88;

  return v22;
}

- (BOOL)_queue_saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  switch(a4)
  {
    case 2:
      uint64_t v14 = *MEMORY[0x263F09258];
      uint64_t v15 = &__block_literal_global_337;
      uint64_t v16 = &__block_literal_global_339;
LABEL_7:
      BOOL v13 = [(HDMCPluginServer *)self _queue_saveCategorySampleByDayIndex:v11 calendarCache:v12 readValueFromDaySummary:v15 categoryTypeIdentifier:v14 makeCategorySample:v16 error:a6];
      goto LABEL_8;
    case 1:
      uint64_t v14 = *MEMORY[0x263F09260];
      uint64_t v15 = &__block_literal_global_332;
      uint64_t v16 = &__block_literal_global_335;
      goto LABEL_7;
    case 0:
      BOOL v13 = [(HDMCPluginServer *)self _queue_saveMenstrualFlowByDayIndex:v11 calendarCache:v12 error:a6];
LABEL_8:
      BOOL v6 = v13;
      break;
  }

  return v6;
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bleedingInPregnancyFlow];
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", a2, 1, a3, 0);
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bleedingAfterPregnancyFlow];
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", a2, 2, a3, 0);
}

- (BOOL)_queue_saveMenstrualFlowUpdatingAdjacentDays:(int64_t)a3 dayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v10 = objc_alloc_init(MEMORY[0x263F43278]);
  [v10 setCacheScope:1];
  [v10 setRequiresProtectedData:1];
  [v10 setRequiresWrite:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained database];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke;
  v14[3] = &unk_264751358;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a3;
  LOBYTE(a6) = [v12 performTransactionWithContext:v10 error:a6 block:v14 inaccessibilityHandler:0];

  return (char)a6;
}

uint64_t __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)[objc_alloc(MEMORY[0x263F45108]) initWithFlowDayIndex:a1[5]];
  id v6 = objc_alloc_init(MEMORY[0x263F0A130]);
  uint64_t v7 = [HDMCDaySummaryEnumerator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  LOBYTE(v20) = 0;
  uint64_t v9 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v7, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", WeakRetained, v6, a1[5] + 1, 9, 1, 0, v20);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_2;
  v24[3] = &unk_264750F48;
  id v10 = v5;
  id v25 = v10;
  [(HDMCDaySummaryEnumerator *)v9 enumerateWithError:a3 handler:v24];
  if (([v10 isUnsuitableForRange] & 1) == 0)
  {
    id v11 = [HDMCDaySummaryEnumerator alloc];
    id v12 = objc_loadWeakRetained((id *)(a1[4] + 40));
    LOBYTE(v21) = 0;
    BOOL v13 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v11, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v12, v6, a1[5] - 10, 9, 0, 1, v21);

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_3;
    v22[3] = &unk_264750F48;
    id v23 = v10;
    [(HDMCDaySummaryEnumerator *)v13 enumerateWithError:a3 handler:v22];

    uint64_t v9 = v13;
  }
  uint64_t v14 = (void *)a1[4];
  uint64_t v15 = a1[6];
  uint64_t v16 = [v10 flowDayIndexRange];
  uint64_t v18 = objc_msgSend(v14, "_queue_saveMenstrualFlow:forEachDayInRange:calendarCache:error:", v15, v16, v17, v6, a3);

  return v18;
}

uint64_t __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addNextAscendingDay:a2 shouldStop:a3];
}

uint64_t __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addNextDescendingDay:a2 shouldStop:a3];
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:(int64_t)a3 oldMenstrualFlow:(int64_t)a4 newMenstrualFlow:(int64_t)a5 analysis:(id)a6 isLoggingMultipleDays:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a6;
  _HKInitializeLogging();
  BOOL v13 = (os_log_t *)MEMORY[0x263F09930];
  uint64_t v14 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    *(_DWORD *)buf = 138543362;
    id v62 = (id)objc_opt_class();
    id v16 = v62;
    _os_log_impl(&dword_225722000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitting prediction accuracy analytic", buf, 0xCu);
  }
  if ((HKMCDaySummaryBleedingFlowHasFlow() & 1) == 0 && HKMCDaySummaryBleedingFlowHasFlow())
  {
    if (v12)
    {
      int64_t v54 = a3;
      BOOL v55 = v7;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v18 = [WeakRetained featureSettingsManager];
      uint64_t v19 = *MEMORY[0x263F09798];
      id v60 = 0;
      uint64_t v20 = [v18 featureSettingsForFeatureIdentifier:v19 error:&v60];
      id v21 = v60;

      id v57 = (void *)v20;
      if (v20)
      {
        id v22 = objc_loadWeakRetained((id *)&self->_profile);
        id v23 = [v22 featureStatusProviderForIdentifier:*MEMORY[0x263F097A8]];

        id v59 = v21;
        id v56 = v23;
        uint64_t v24 = [v23 featureStatusWithError:&v59];
        id v25 = v59;

        uint64_t v26 = (void *)v24;
        if (v24)
        {
          id v27 = objc_loadWeakRetained((id *)&self->_profile);
          uint64_t v28 = [v27 featureStatusProviderForIdentifier:*MEMORY[0x263F097B0]];

          id v58 = v25;
          uint64_t v52 = v28;
          uint64_t v29 = [v28 featureStatusWithError:&v58];
          id v30 = v58;

          id v53 = (void *)v29;
          if (v29)
          {
            id v51 = v30;
            if ([v57 menstruationProjectionsEnabled])
            {
              uint64_t v31 = [(HDMCProfileExtension *)self->_profileExtension settingsManager];
              uint64_t v32 = [v31 areAllMenstruationPredictionAlgorithmAttributesSupported];
            }
            else
            {
              uint64_t v32 = 0;
            }
            if ([v57 fertileWindowProjectionsEnabled])
            {
              id v35 = [(HDMCProfileExtension *)self->_profileExtension settingsManager];
              int v36 = [v35 areAllFertileWindowPredictionAlgorithmAttributesSupported];
            }
            else
            {
              int v36 = 0;
            }
            uint64_t v37 = v32;
            int v38 = v32 | v36;
            v39 = [(HDMCProfileExtension *)self->_profileExtension settingsManager];
            char v50 = [v39 internalCycleFactorsOverrideEnabled];

            int v49 = (void *)MEMORY[0x263F451C0];
            if (v38 == 1)
            {
              uint64_t v40 = *MEMORY[0x263F09600];
              id v48 = [v26 objectForKeyedSubscript:*MEMORY[0x263F09600]];
              char v41 = [v48 areAllRequirementsSatisfied];
              id v42 = v53;
              __int16 v47 = [v53 objectForKeyedSubscript:v40];
              char v43 = [v47 areAllRequirementsSatisfied];
            }
            else
            {
              char v41 = 0;
              char v43 = 0;
              id v42 = v53;
            }
            char v44 = [v42 isOnboardingRecordPresent];
            uint64_t v45 = [v12 cycles];
            BYTE3(v46) = v50;
            BYTE2(v46) = v44;
            BYTE1(v46) = v43;
            LOBYTE(v46) = v41;
            objc_msgSend(v49, "submitMetricWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:periodPredictionEnabled:heartRateBasedPredictionEnabled:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:internalLiveOnCycleFactorOverrideEnabled:cycles:", v54, a4, a5, v12, v55, v37, v46, v45);

            uint64_t v34 = v57;
            id v30 = v51;
            if (v38)
            {
            }
          }
          else
          {
            _HKInitializeLogging();
            uint64_t v34 = v57;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
              -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:].cold.4();
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
            -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:]();
          }
          id v30 = v25;
          uint64_t v34 = v57;
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          id v30 = v21;
          -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:]();
          uint64_t v34 = 0;
        }
        else
        {
          uint64_t v34 = 0;
          id v30 = v21;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v33 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG)) {
        -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:](v33);
      }
    }
  }
}

- (BOOL)_queue_saveMenstrualFlowByDayIndex:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 count])
  {
    id v10 = [(HDMCProfileExtension *)self->_profileExtension analysisManager];
    id v11 = [v10 currentAnalysis];

    id v12 = [v9 currentCalendar];
    id v13 = objc_alloc_init(MEMORY[0x263F43278]);
    [v13 setCacheScope:1];
    [v13 setRequiresProtectedData:1];
    [v13 setRequiresWrite:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v15 = [WeakRetained database];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke;
    v20[3] = &unk_264750D78;
    id v21 = v8;
    id v22 = self;
    id v23 = v9;
    id v24 = v12;
    id v25 = v11;
    id v16 = v11;
    id v17 = v12;
    char v18 = [v15 performTransactionWithContext:v13 error:a5 block:v20 inaccessibilityHandler:0];
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

uint64_t __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v31 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [*(id *)(a1 + 32) allKeys];
  uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v33)
  {
    uint64_t v6 = *(void *)v40;
    *(void *)&long long v5 = 138543618;
    long long v29 = v5;
    uint64_t v30 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "integerValue", v29);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
        id v11 = +[HDMCDaySummaryEnumerator daySummaryAtIndex:v9 profile:WeakRetained calendarCache:*(void *)(a1 + 48) error:a3];

        if (!v11 && *a3) {
          goto LABEL_22;
        }
        id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
        uint64_t v13 = [v12 integerValue];

        if ([v11 menstrualFlow] == v13)
        {
          _HKInitializeLogging();
          uint64_t v14 = (void *)*MEMORY[0x263F09930];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = v14;
            id v16 = objc_opt_class();
            id v17 = NSNumber;
            id v18 = v16;
            uint64_t v19 = [v17 numberWithInteger:v9];
            *(_DWORD *)buf = v29;
            char v44 = v16;
            __int16 v45 = 2112;
            uint64_t v46 = v19;
            _os_log_impl(&dword_225722000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical menstrual flow, day index: %@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v20 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", v9, *(void *)(a1 + 56));
          id v21 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", v13, v20, 0);
          id v22 = *(void **)(a1 + 40);
          id v23 = [MEMORY[0x263F0A598] menstrualFlowType];
          int v24 = objc_msgSend(v22, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v23, objc_msgSend(v8, "integerValue"), *(void *)(a1 + 48), a3);

          if (v24 && v21)
          {
            id v25 = *(void **)(a1 + 40);
            __int16 v47 = v21;
            uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
            LOBYTE(v25) = objc_msgSend(v25, "_queue_insertSamplesWithClientSource:error:", v26, a3);

            if ((v25 & 1) == 0) {
              goto LABEL_21;
            }
          }
          else if (!v24)
          {
            goto LABEL_21;
          }
          if ((objc_msgSend(*(id *)(a1 + 40), "_queue_updateStartOfCycleMetadataForModifiedDayIndex:calendarCache:canOverrideCreationDate:error:", objc_msgSend(v8, "integerValue"), *(void *)(a1 + 48), 0, a3) & 1) == 0)
          {
LABEL_21:

LABEL_22:
            uint64_t v27 = 0;
            goto LABEL_23;
          }
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke_2;
          v34[3] = &unk_264751380;
          v34[4] = *(void *)(a1 + 40);
          v34[5] = v8;
          id v35 = v11;
          uint64_t v38 = v13;
          id v36 = *(id *)(a1 + 64);
          id v37 = *(id *)(a1 + 32);
          [v31 onCommit:v34 orRollback:0];

          uint64_t v6 = v30;
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }
  uint64_t v27 = 1;
LABEL_23:

  return v27;
}

uint64_t __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) integerValue];
  uint64_t v4 = [*(id *)(a1 + 48) menstrualFlow];
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = [*(id *)(a1 + 64) allKeys];
  objc_msgSend(v2, "_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:", v3, v4, v5, v6, (unint64_t)objc_msgSend(v7, "count") > 1);

  id v8 = *(void **)(a1 + 32);
  return [v8 _triggerImmediateSync];
}

- (BOOL)_queue_saveCategorySampleByDayIndex:(id)a3 calendarCache:(id)a4 readValueFromDaySummary:(id)a5 categoryTypeIdentifier:(id)a6 makeCategorySample:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v14 count])
  {
    uint64_t v19 = [v15 currentCalendar];
    uint64_t v26 = v16;
    id v20 = objc_alloc_init(MEMORY[0x263F43278]);
    [v20 setCacheScope:1];
    [v20 setRequiresProtectedData:1];
    [v20 setRequiresWrite:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v22 = [WeakRetained database];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __142__HDMCPluginServer__queue_saveCategorySampleByDayIndex_calendarCache_readValueFromDaySummary_categoryTypeIdentifier_makeCategorySample_error___block_invoke;
    v27[3] = &unk_2647513A8;
    id v28 = v14;
    long long v29 = self;
    id v30 = v15;
    id v33 = v26;
    id v31 = v17;
    id v32 = v19;
    id v34 = v18;
    id v23 = v19;
    char v24 = [v22 performTransactionWithContext:v20 error:a8 block:v27 inaccessibilityHandler:0];

    id v16 = v26;
  }
  else
  {
    char v24 = 1;
  }

  return v24;
}

uint64_t __142__HDMCPluginServer__queue_saveCategorySampleByDayIndex_calendarCache_readValueFromDaySummary_categoryTypeIdentifier_makeCategorySample_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = [*(id *)(a1 + 32) allKeys];
  uint64_t v37 = [v5 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v37)
  {
    uint64_t v7 = *(void *)v39;
    *(void *)&long long v6 = 138543874;
    long long v34 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "integerValue", v34);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
        id v12 = +[HDMCDaySummaryEnumerator daySummaryAtIndex:v10 profile:WeakRetained calendarCache:*(void *)(a1 + 48) error:a3];

        if (!v12 && *a3)
        {
LABEL_22:

          uint64_t v32 = 0;
          goto LABEL_23;
        }
        uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        uint64_t v14 = [v13 integerValue];

        if ((*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))() == v14)
        {
          _HKInitializeLogging();
          id v15 = (void *)*MEMORY[0x263F09930];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
          {
            log = v15;
            id v16 = objc_opt_class();
            uint64_t v17 = v7;
            id v18 = a3;
            uint64_t v19 = v5;
            uint64_t v20 = *(void *)(a1 + 56);
            id v21 = NSNumber;
            id v35 = v16;
            id v22 = [v21 numberWithInteger:v10];
            *(_DWORD *)buf = v34;
            char v43 = v16;
            __int16 v44 = 2112;
            uint64_t v45 = v20;
            uint64_t v5 = v19;
            a3 = v18;
            uint64_t v7 = v17;
            __int16 v46 = 2112;
            __int16 v47 = v22;
            _os_log_impl(&dword_225722000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical value for type: %@, day index: %@", buf, 0x20u);
          }
        }
        else
        {
          id v23 = *(void **)(a1 + 40);
          char v24 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*(void *)(a1 + 56)];
          int v25 = objc_msgSend(v23, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v24, v10, *(void *)(a1 + 48), a3);

          if (v25) {
            BOOL v26 = v14 == 0;
          }
          else {
            BOOL v26 = 1;
          }
          if (v26)
          {
            if ((v25 & 1) == 0) {
              goto LABEL_22;
            }
          }
          else
          {
            uint64_t v27 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", v10, *(void *)(a1 + 64));
            id v28 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
            long long v29 = *(void **)(a1 + 40);
            id v48 = v28;
            id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
            char v31 = objc_msgSend(v29, "_queue_insertSamplesWithClientSource:error:", v30, a3);

            if ((v31 & 1) == 0) {
              goto LABEL_22;
            }
          }
        }
      }
      uint64_t v37 = [v5 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
  uint64_t v32 = 1;
LABEL_23:

  return v32;
}

- (BOOL)_queue_saveIntermenstrualBleedingByDayIndex:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 count])
  {
    uint64_t v10 = [v9 currentCalendar];
    id v11 = objc_alloc_init(MEMORY[0x263F43278]);
    [v11 setCacheScope:1];
    [v11 setRequiresProtectedData:1];
    [v11 setRequiresWrite:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v13 = [WeakRetained database];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __84__HDMCPluginServer__queue_saveIntermenstrualBleedingByDayIndex_calendarCache_error___block_invoke;
    v17[3] = &unk_2647513D0;
    id v18 = v8;
    uint64_t v19 = self;
    id v20 = v9;
    id v21 = v10;
    id v14 = v10;
    char v15 = [v13 performTransactionWithContext:v11 error:a5 block:v17 inaccessibilityHandler:0];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

uint64_t __84__HDMCPluginServer__queue_saveIntermenstrualBleedingByDayIndex_calendarCache_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = [*(id *)(a1 + 32) allKeys];
  uint64_t v35 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v35)
  {
    uint64_t v7 = *(void *)v37;
    uint64_t v34 = *MEMORY[0x263F09330];
    *(void *)&long long v6 = 138543618;
    long long v32 = v6;
    id v33 = a3;
    while (2)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "integerValue", v32);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
        id v12 = +[HDMCDaySummaryEnumerator daySummaryAtIndex:v10 profile:WeakRetained calendarCache:*(void *)(a1 + 48) error:a3];

        if (!v12 && *a3)
        {
LABEL_18:

          uint64_t v30 = 0;
          goto LABEL_19;
        }
        uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        int v14 = [v13 BOOLValue];

        if (v14 == [v12 intermenstrualBleeding])
        {
          _HKInitializeLogging();
          id v22 = (void *)*MEMORY[0x263F09930];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
          {
            id v23 = v22;
            char v24 = objc_opt_class();
            int v25 = NSNumber;
            uint64_t v26 = v7;
            uint64_t v27 = v5;
            id v28 = v24;
            long long v29 = [v25 numberWithInteger:v10];
            *(_DWORD *)buf = v32;
            long long v41 = v24;
            __int16 v42 = 2112;
            char v43 = v29;
            _os_log_impl(&dword_225722000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical intermenstrual bleeding value, day index: %@", buf, 0x16u);

            uint64_t v5 = v27;
            uint64_t v7 = v26;
            a3 = v33;
          }
        }
        else
        {
          char v15 = *(void **)(a1 + 40);
          id v16 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:v34];
          int v17 = objc_msgSend(v15, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v16, v10, *(void *)(a1 + 48), a3);

          if ((v17 & v14) == 1)
          {
            id v18 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", v10, *(void *)(a1 + 56));
            uint64_t v19 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_intermenstrualBleedingCategorySampleWithDate:", v18);
            id v20 = *(void **)(a1 + 40);
            __int16 v44 = v19;
            id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
            LOBYTE(v20) = objc_msgSend(v20, "_queue_insertSamplesWithClientSource:error:", v21, a3);

            if ((v20 & 1) == 0) {
              goto LABEL_18;
            }
          }
          else if ((v17 & 1) == 0)
          {
            goto LABEL_18;
          }
        }
      }
      uint64_t v35 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }
  uint64_t v30 = 1;
LABEL_19:

  return v30;
}

- (BOOL)_queue_saveLastMenstrualPeriodWithDayIndexRange:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v9 = a4;
  uint64_t v10 = [(HDMCProfileExtension *)self->_profileExtension analysisManager];
  id v11 = [v10 currentAnalysis];

  id v12 = objc_alloc_init(MEMORY[0x263F43278]);
  [v12 setCacheScope:1];
  [v12 setRequiresProtectedData:1];
  [v12 setRequiresWrite:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v14 = [WeakRetained database];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke;
  v18[3] = &unk_264751420;
  int64_t v22 = var0;
  int64_t v23 = var1;
  id v19 = v9;
  id v20 = self;
  id v21 = v11;
  id v15 = v11;
  id v16 = v9;
  LOBYTE(a5) = [v14 performTransactionWithContext:v12 error:a5 block:v18 inaccessibilityHandler:0];

  return (char)a5;
}

uint64_t __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v46[1] = *MEMORY[0x263EF8340];
  id v34 = a2;
  uint64_t v5 = *(void *)(a1 + 64);
  long long v6 = (uint64_t *)(a1 + 56);
  if (v5 <= 0) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 56) + v5 - 1;
  }
  id v8 = [*(id *)(a1 + 32) currentCalendar];
  uint64_t v9 = HKMCTodayIndex();

  if (v7 >= v9) {
    uint64_t v7 = v9;
  }
  uint64_t v10 = *v6;
  if (*v6 > v7)
  {
    uint64_t v11 = 1;
    goto LABEL_26;
  }
  long long v32 = v41;
  id v33 = v37;
  while (1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    uint64_t v13 = +[HDMCDaySummaryEnumerator daySummaryAtIndex:v10 profile:WeakRetained calendarCache:*(void *)(a1 + 32) error:a3];

    if (!v13 && *a3)
    {
      uint64_t v11 = 0;
      goto LABEL_25;
    }
    if (objc_msgSend(v13, "menstrualFlow", v32, v33)) {
      break;
    }
    int v14 = (void *)MEMORY[0x263EFF910];
    id v15 = [*(id *)(a1 + 32) currentCalendar];
    id v16 = objc_msgSend(v14, "hk_noonWithDayIndex:calendar:", v10, v15);

    int v17 = objc_msgSend(MEMORY[0x263F0A150], "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", 2, v16, v10 == *(void *)(a1 + 56));
    id v18 = *(void **)(a1 + 40);
    id v19 = [MEMORY[0x263F0A598] menstrualFlowType];
    uint64_t v11 = objc_msgSend(v18, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v19, v10, *(void *)(a1 + 32), a3);

    if (v11 && v17)
    {
      id v20 = *(void **)(a1 + 40);
      v46[0] = v17;
      id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
      LOBYTE(v20) = objc_msgSend(v20, "_queue_insertSamplesWithClientSource:error:", v21, a3);

      if ((v20 & 1) == 0)
      {
        uint64_t v11 = 0;
        goto LABEL_18;
      }
    }
    else if (!v11)
    {
      goto LABEL_18;
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v37[0] = __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_2;
    v37[1] = &unk_2647513F8;
    v37[2] = *(void *)(a1 + 40);
    uint64_t v40 = v10;
    id v38 = v13;
    id v22 = *(id *)(a1 + 48);
    *long long v32 = *(_OWORD *)v6;
    id v39 = v22;
    v41[2] = v7;
    [v34 onCommit:v36 orRollback:0];

    uint64_t v11 = 1;
LABEL_18:

    if (v11)
    {
      if (v10++ < v7) {
        continue;
      }
    }
    goto LABEL_26;
  }
  _HKInitializeLogging();
  char v24 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    int v25 = v24;
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = NSNumber;
    id v28 = v26;
    long long v29 = [v27 numberWithInteger:v10];
    uint64_t v30 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    char v43 = v26;
    __int16 v44 = 2112;
    uint64_t v45 = v30;
    _os_log_impl(&dword_225722000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending first period log early due to no flow sample on day: %@", buf, 0x16u);
  }
  uint64_t v11 = 1;
LABEL_25:

LABEL_26:
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_344;
  v35[3] = &unk_2647508B0;
  v35[4] = *(void *)(a1 + 40);
  objc_msgSend(v34, "onCommit:orRollback:", v35, 0, v32);

  return v11;
}

uint64_t __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) menstrualFlow];
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = *(void *)(a1 + 64) > *(void *)(a1 + 80);
  return [v3 _submitPredictionAccuracyAnalyticWithDayIndex:v2 oldMenstrualFlow:v4 newMenstrualFlow:2 analysis:v5 isLoggingMultipleDays:v6];
}

uint64_t __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_344(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerImmediateSync];
}

- (BOOL)_queue_saveMenstrualFlow:(int64_t)a3 forEachDayInRange:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:var1];
  int64_t v12 = var0 + var1;
  do
  {
    do
    {
      uint64_t v13 = [NSNumber numberWithInteger:a3];
      int v14 = [NSNumber numberWithInteger:var0];
      [v11 setObject:v13 forKeyedSubscript:v14];

      ++var0;
    }
    while (var1 < 1);
  }
  while (v12 > var0);
  BOOL v15 = [(HDMCPluginServer *)self _queue_saveMenstrualFlowByDayIndex:v11 calendarCache:v10 error:a6];

  return v15;
}

- (BOOL)_queue_savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a4 - a3 + 1];
  if (a4 >= a3)
  {
    do
    {
      int64_t v12 = [NSNumber numberWithInteger:a3];
      [v11 setObject:&unk_26D8EE980 forKeyedSubscript:v12];

      ++a3;
    }
    while (a4 + 1 != a3);
  }
  uint64_t v13 = [v10 currentCalendar];
  uint64_t v14 = HKMCTodayIndex();

  if (v14 - 1 == a4)
  {
    BOOL v15 = [NSNumber numberWithInteger:v14];
    [v11 setObject:&unk_26D8EE998 forKeyedSubscript:v15];
  }
  BOOL v16 = [(HDMCPluginServer *)self _queue_saveMenstrualFlowByDayIndex:v11 calendarCache:v10 error:a6];

  return v16;
}

- (id)_queue_mostRecentMenstrualFlowSampleWithError:(id *)a3 requiringBeforeDay:(int64_t)a4 calendarCache:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__9;
  char v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  uint64_t v9 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09380]];
  id v10 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v12 = [v10 entityEnumeratorWithType:v9 profile:WeakRetained];

  uint64_t v34 = *MEMORY[0x263F42FD0];
  v35[0] = MEMORY[0x263EFFA88];
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  [v12 addEncodingOptionsFromDictionary:v13];

  uint64_t v14 = [MEMORY[0x263F434C8] orderingTermWithProperty:*MEMORY[0x263F43080] entityClass:objc_opt_class() ascending:0];
  id v33 = v14;
  BOOL v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  [v12 setOrderingTerms:v15];

  [v12 setLimitCount:1];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __99__HDMCPluginServer__queue_mostRecentMenstrualFlowSampleWithError_requiringBeforeDay_calendarCache___block_invoke;
  v26[3] = &unk_264750778;
  v26[4] = &v27;
  [v12 enumerateWithError:a3 handler:v26];
  BOOL v16 = (void *)v28[5];
  if (v16)
  {
    int v17 = [v8 currentCalendar];
    uint64_t v18 = objc_msgSend(v16, "hk_dayIndexRangeWithCalendar:", v17);
    BOOL v21 = v19 > 0 && v18 + v19 <= a4;

    if (v21)
    {
      id v22 = (id)v28[5];
      goto LABEL_13;
    }
    int64_t v23 = (void *)MEMORY[0x263F087E8];
    char v24 = [NSNumber numberWithInteger:a4];
    objc_msgSend(v23, "hk_assignError:code:format:", a3, 100, @"Most recent menstrual flow is not before day %@", v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 100, @"Most recent menstrual flow is nil");
  }
  id v22 = 0;
LABEL_13:

  _Block_object_dispose(&v27, 8);
  return v22;
}

uint64_t __99__HDMCPluginServer__queue_mostRecentMenstrualFlowSampleWithError_requiringBeforeDay_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)_queue_updateStartOfCycleMetadataForModifiedDayIndex:(int64_t)a3 calendarCache:(id)a4 canOverrideCreationDate:(BOOL)a5 error:(id *)a6
{
  BOOL v69 = a5;
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v72 = a4;
  _HKInitializeLogging();
  uint64_t v9 = (os_log_t *)MEMORY[0x263F09930];
  id v10 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    int64_t v12 = objc_opt_class();
    uint64_t v13 = NSNumber;
    id v14 = v12;
    BOOL v15 = [v13 numberWithInteger:a3];
    *(_DWORD *)buf = 138543618;
    long long v98 = v12;
    __int16 v99 = 2112;
    long long v100 = v15;
    _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating start of cycle metadata for modified day: %@", buf, 0x16u);
  }
  id v16 = objc_alloc_init(MEMORY[0x263F429A0]);
  int v17 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:41];
  uint64_t v18 = [HDMCDaySummaryEnumerator alloc];
  uint64_t v70 = self;
  uint64_t v19 = [(HDStandardTaskServer *)self profile];
  LOBYTE(v65) = 0;
  id v20 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v18, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v19, v72, a3 - 20, 41, 1, 0, v65);

  id v95 = 0;
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __117__HDMCPluginServer__queue_updateStartOfCycleMetadataForModifiedDayIndex_calendarCache_canOverrideCreationDate_error___block_invoke;
  v90[3] = &unk_264751448;
  id v21 = v17;
  id v91 = v21;
  int64_t v93 = a3 - 20;
  uint64_t v94 = 41;
  id v22 = v16;
  id v92 = v22;
  BOOL v23 = [(HDMCDaySummaryEnumerator *)v20 enumerateWithError:&v95 handler:v90];
  id v24 = v95;
  id v25 = v24;
  if (!v23) {
    goto LABEL_40;
  }
  BOOL v75 = v23;
  id v89 = v24;
  uint64_t v26 = [v22 analyzeWithError:&v89];
  id v27 = v89;

  if (!v26)
  {
    id v25 = v27;
    if (v25)
    {
      if (a6) {
        *a6 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_40:
    BOOL v63 = 0;
    goto LABEL_41;
  }
  int64_t v73 = a3;
  long long v74 = v27;
  id v66 = v22;
  uint64_t v67 = v20;
  uint64_t v68 = v21;
  id v28 = [MEMORY[0x263EFF9C0] set];
  uint64_t v29 = [MEMORY[0x263EFF9C0] set];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v30 = v26;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v85 objects:v107 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v86 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        uint64_t v36 = [v35 julianDayOfMenstruationStart];
        LODWORD(v35) = [v35 isDeterminant];
        long long v37 = [NSNumber numberWithInteger:v36];
        if (v35) {
          id v38 = v28;
        }
        else {
          id v38 = v29;
        }
        [v38 addObject:v37];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v85 objects:v107 count:16];
    }
    while (v32);
  }

  _HKInitializeLogging();
  os_log_t v39 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = v39;
    long long v41 = objc_opt_class();
    __int16 v42 = NSNumber;
    id obja = v41;
    char v43 = objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
    __int16 v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
    uint64_t v45 = HKSensitiveLogItem();
    uint64_t v46 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544386;
    long long v98 = v41;
    __int16 v99 = 2112;
    long long v100 = v43;
    __int16 v101 = 2112;
    long long v102 = v44;
    __int16 v103 = 2112;
    long long v104 = v45;
    __int16 v105 = 2112;
    v106 = v46;
    _os_log_impl(&dword_225722000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %@ cycles from analyzing %@ summaries, start days: %@, indeterminant start days: %@", buf, 0x34u);
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v68;
  uint64_t v47 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v82;
    uint64_t v50 = v73;
    id v77 = v30;
    while (2)
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v82 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = *(void **)(*((void *)&v81 + 1) + 8 * j);
        id v53 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v52, "dayIndex"));
        if ([v52 dayIndex] >= v50)
        {
          uint64_t v54 = v48;
          BOOL v55 = [v52 startOfCycleFromCycleTracking];

          if (v55 && ([v29 containsObject:v53] & 1) == 0)
          {
            id v56 = [v52 startOfCycleFromCycleTracking];
            int v57 = [v56 BOOLValue];

            uint64_t v58 = [v28 containsObject:v53];
            if (v57 == v58)
            {
              BOOL v62 = v75;
            }
            else
            {
              uint64_t v59 = v58;
              uint64_t v76 = (void *)[v52 mutableCopy];
              id v60 = [NSNumber numberWithBool:v59];
              [v76 setStartOfCycleFromCycleTracking:v60];

              __int16 v61 = (void *)[v76 copy];
              id v80 = v74;
              BOOL v62 = [(HDMCPluginServer *)v70 _queue_updateUnderlyingSamplesToReplaceDaySummary:v52 withDaySummary:v61 calendarCache:v72 canOverrideCreationDate:v69 error:&v80];
              id v71 = v80;

              long long v74 = v71;
            }
            uint64_t v50 = v73;
            BOOL v75 = v62;
            if (!v62)
            {

              id v30 = v77;
              goto LABEL_37;
            }
          }
          uint64_t v48 = v54;
          id v30 = v77;
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
      if (v48) {
        continue;
      }
      break;
    }
  }
LABEL_37:

  BOOL v63 = v75;
  id v25 = v74;
  id v20 = v67;
  id v21 = v68;
  id v22 = v66;
LABEL_41:

  return v63;
}

void __117__HDMCPluginServer__queue_updateStartOfCycleMetadataForModifiedDayIndex_calendarCache_canOverrideCreationDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (![*(id *)(a1 + 32) count] && objc_msgSend(v7, "dayIndex") > *(void *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = objc_msgSend(MEMORY[0x263F42968], "hkmc_emptyDayInputWithDayIndex:");
    [v3 appendDay:v4];
  }
  uint64_t v5 = *(void **)(a1 + 40);
  BOOL v6 = objc_msgSend(MEMORY[0x263F42968], "hkmc_dayInputWithDaySummary:", v7);
  [v5 appendDay:v6];

  [*(id *)(a1 + 32) addObject:v7];
}

- (BOOL)_queue_insertSamplesWithClientSource:(id)a3 error:(id *)a4
{
  return [(HDMCPluginServer *)self _queue_insertSamplesWithClientSource:a3 creationDate:0 error:a4];
}

- (BOOL)_queue_insertSamplesWithClientSource:(id)a3 creationDate:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v11 = [WeakRetained sourceManager];
    int64_t v12 = [v11 createOrUpdateSourceForClient:self->_client error:a5];

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_profile);
      id v14 = [v13 dataProvenanceManager];
      BOOL v15 = [v14 localDataProvenanceForSourceEntity:v12 version:0 deviceEntity:0];

      if (v9) {
        MEMORY[0x22A634670](v9);
      }
      else {
        double Current = CFAbsoluteTimeGetCurrent();
      }
      double v18 = Current;
      id v19 = objc_loadWeakRetained((id *)&self->_profile);
      id v20 = [v19 dataManager];
      char v17 = [v20 insertDataObjects:v8 withProvenance:v15 creationDate:1 skipInsertionFilter:a5 error:v18];

      _HKInitializeLogging();
      id v21 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v21;
        BOOL v23 = objc_opt_class();
        id v24 = NSNumber;
        id v28 = v23;
        id v25 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        uint64_t v26 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138544386;
        id v30 = v23;
        __int16 v31 = 2112;
        uint64_t v32 = v25;
        __int16 v33 = 2112;
        uint64_t v34 = v26;
        __int16 v35 = 2114;
        id v36 = v9;
        __int16 v37 = 2112;
        id v38 = v12;
        _os_log_impl(&dword_225722000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted %@ samples: %@ @ %{public}@, source: %@", buf, 0x34u);
      }
      [(HDMCPluginServer *)self _queue_updateLastLoggedInExperienceDate];
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (void)_queue_updateLastLoggedInExperienceDate
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error saving last logged date: %{public}@", v7, v8, v9, v10, v11);
}

- (BOOL)_queue_deleteSamplesOfType:(id)a3 onDayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  v69[1] = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v43 = a5;
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 1;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = __Block_byref_object_copy__9;
  __int16 v61 = __Block_byref_object_dispose__9;
  id v62 = 0;
  __int16 v42 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = (void *)MEMORY[0x263F43318];
  long long v41 = self;
  location = (id *)&self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v68 = *MEMORY[0x263F42FD0];
  v69[0] = MEMORY[0x263EFFA88];
  uint8_t v11 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
  int64_t v12 = objc_msgSend(MEMORY[0x263F434D0], "hdmc_predicateForSamplesInDayIndexRange:", a4, 1);
  id v13 = (id *)(v58 + 5);
  id obj = (id)v58[5];
  uint64_t v39 = [v9 samplesWithType:v38 profile:WeakRetained encodingOptions:v11 predicate:v12 limit:0 anchor:0 error:&obj];
  objc_storeStrong(v13, obj);

  if (v39)
  {
    uint64_t v40 = [v43 currentCalendar];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v14 = v39;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v67 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v53;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v14);
        }
        double v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
        id v19 = [v18 _timeZone];
        id v20 = [v43 calendarForTimeZone:v19];
        int64_t v21 = objc_msgSend(v18, "hk_dayIndexRangeWithCalendar:", v20);
        uint64_t v23 = v22;

        if (a4 >= v21 && a4 - v21 < v23)
        {
          if (v23 >= 2)
          {
            id v25 = objc_msgSend(MEMORY[0x263F089C8], "hk_indexSetWithDayIndexRange:", v21, v23);
            [v25 removeIndex:a4];
            v45[0] = MEMORY[0x263EF8330];
            v45[1] = 3221225472;
            v45[2] = __78__HDMCPluginServer__queue_deleteSamplesOfType_onDayIndex_calendarCache_error___block_invoke;
            v45[3] = &unk_264751470;
            id v46 = v40;
            uint64_t v47 = v18;
            uint64_t v49 = &v63;
            uint64_t v48 = v41;
            uint64_t v50 = &v57;
            int64_t v51 = a4;
            objc_msgSend(v25, "hk_enumerateDayIndexRangesUsingBlock:", v45);
          }
          uint64_t v26 = [v18 UUID];
          [v42 addObject:v26];

          if (!*((unsigned char *)v64 + 24)) {
            break;
          }
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v67 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (*((unsigned char *)v64 + 24))
    {
      id v27 = objc_alloc_init(MEMORY[0x263F431C0]);
      id v28 = objc_loadWeakRetained(location);
      uint64_t v29 = [v28 dataManager];
      id v30 = (id *)(v58 + 5);
      id v44 = (id)v58[5];
      char v31 = [v29 deleteObjectsWithUUIDCollection:v42 configuration:v27 error:&v44];
      objc_storeStrong(v30, v44);
      *((unsigned char *)v64 + 24) = v31;

      [(HDMCPluginServer *)v41 _queue_updateLastLoggedInExperienceDate];
    }
  }
  id v32 = (id)v58[5];
  __int16 v33 = v32;
  if (v32)
  {
    if (a6) {
      *a6 = v32;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v34 = *((unsigned char *)v64 + 24) != 0;
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v34;
}

void __78__HDMCPluginServer__queue_deleteSamplesOfType_onDayIndex_calendarCache_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v46[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", a2, *(void *)(a1 + 32));
  if (a3 <= 0) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = a3 + a2 - 1;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", v7, *(void *)(a1 + 32), a3);
  id v9 = *(id *)(a1 + 40);
  id v10 = v6;
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v12 = (void *)MEMORY[0x263F0A150];
    id v13 = v9;
    id v14 = [v13 categoryType];
    uint64_t v15 = [v13 value];
    uint64_t v16 = [v13 metadata];

    uint64_t v17 = [v12 categorySampleWithType:v14 value:v15 startDate:v10 endDate:v11 metadata:v16];
LABEL_8:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v18 = (void *)MEMORY[0x263F0A648];
    id v19 = v9;
    id v14 = [v19 quantityType];
    uint64_t v16 = [v19 quantity];
    id v20 = [v19 metadata];

    uint64_t v17 = [v18 quantitySampleWithType:v14 quantity:v16 startDate:v10 endDate:v11 metadata:v20];

    goto LABEL_8;
  }
  uint64_t v17 = 0;
LABEL_10:

  if (v17)
  {
    int64_t v21 = [v17 metadata];
    uint64_t v22 = v21;
    if (a2 > *(void *)(a1 + 72))
    {
      uint64_t v23 = *MEMORY[0x263F09AC0];
      id v24 = [v21 objectForKeyedSubscript:*MEMORY[0x263F09AC0]];

      if (v24)
      {
        uint64_t v45 = v23;
        v46[0] = MEMORY[0x263EFFA80];
        id v25 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
        uint64_t v26 = objc_msgSend(v22, "hk_dictionaryByAddingEntriesFromDictionary:", v25);

        [v17 _setMetadata:v26];
        uint64_t v22 = (void *)v26;
      }
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v27 + 24))
    {
      id v28 = *(void **)(a1 + 48);
      id v44 = v17;
      uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v30 + 40);
      LOBYTE(v28) = objc_msgSend(v28, "_queue_insertSamplesWithClientSource:error:", v29, &obj);
      objc_storeStrong((id *)(v30 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v28;
    }
    else
    {
      *(unsigned char *)(v27 + 24) = 0;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      _HKInitializeLogging();
      char v31 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        id v32 = v31;
        __int16 v33 = objc_opt_class();
        id v34 = v33;
        __int16 v35 = HKSensitiveLogItem();
        id v36 = NSStringFromHKDayIndexRange();
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v33;
        __int16 v40 = 2112;
        long long v41 = v35;
        __int16 v42 = 2112;
        id v43 = v36;
        _os_log_impl(&dword_225722000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted multi-day replacement sample: %@ (%@)", buf, 0x20u);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (void)_triggerImmediateSync
{
  uint64_t v3 = [(HDStandardTaskServer *)self profile];
  id v4 = [v3 nanoSyncManager];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __41__HDMCPluginServer__triggerImmediateSync__block_invoke;
  v14[3] = &unk_264750820;
  v14[4] = self;
  [v4 syncHealthDataWithOptions:0 reason:v6 completion:v14];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0A1C8]) initWithChangesSyncRequest:v7];
  id v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [v9 cloudSyncManager];
  id v11 = (objc_class *)objc_opt_class();
  int64_t v12 = NSStringFromClass(v11);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__HDMCPluginServer__triggerImmediateSync__block_invoke_368;
  v13[3] = &unk_264750820;
  v13[4] = self;
  [v10 syncWithRequest:v8 reason:v12 completion:v13];
}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09930];
  uint64_t v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forced HealthKit nanosync", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __41__HDMCPluginServer__triggerImmediateSync__block_invoke_cold_1(a1, v6);
  }
}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke_368(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09930];
  uint64_t v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forced HealthKit changes sync", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __41__HDMCPluginServer__triggerImmediateSync__block_invoke_368_cold_1(a1, v6);
  }
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F35C30](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F35D48](self, a2);
}

- (id)diagnosticDescription
{
  return &stru_26D8E7520;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:(void *)a1 oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_debug_impl(&dword_225722000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@] Skipping metric submission due to nil analysis", (uint8_t *)&v3, 0xCu);
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  int v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature settings for menstrual cycles: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  int v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature status for heart rate input: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  int v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature status for wrist temperature input: %{public}@", v7, v8, v9, v10, v11);
}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_225722000, v6, v7, "[%{public}@] Error forcing HealthKit nano sync: %{public}@", v8, v9, v10, v11, v12);
}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke_368_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_225722000, v6, v7, "[%{public}@] Error forcing HealthKit changes sync: %{public}@", v8, v9, v10, v11, v12);
}

@end