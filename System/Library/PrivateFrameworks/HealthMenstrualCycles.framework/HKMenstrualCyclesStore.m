@interface HKMenstrualCyclesStore
- (BOOL)setDeviationDetectedIfNeededForDeviations:(id)a3;
- (HKCloudSyncControl)cloudSyncControl;
- (HKHealthStore)healthStore;
- (HKMenstrualCyclesStore)initWithHealthStore:(id)a3;
- (NSDate)cycleFactorsLastReviewedDate;
- (NSNumber)lastMenstrualPeriodDismissalDay;
- (NSNumber)unconfirmedDeviationDismissalDay;
- (NSNumber)unconfirmedDeviationSubmissionDay;
- (id)_appProtectedSyncedKeyValueDomain;
- (id)_deviationDetectionAnalyticsDomain;
- (id)_syncedProtectedKeyValueDomain;
- (id)deviationDetectedIndicesForDeviationType:(int64_t)a3 error:(id *)a4;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)confirmAndSaveDeviationWithMenstrualFlowByDayIndex:(id)a3 intermenstrualBleedingByDayIndex:(id)a4 addedCycleFactors:(id)a5 initialAnalysisWindow:(id)a6 completion:(id)a7;
- (void)fetchScheduledNotificationsWithCompletion:(id)a3;
- (void)saveBleedingFlow:(int64_t)a3 forBleedingType:(int64_t)a4 dayIndex:(int64_t)a5 completion:(id)a6;
- (void)saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 completion:(id)a5;
- (void)saveDaySummaries:(id)a3 canOverrideCreationDate:(BOOL)a4 completion:(id)a5;
- (void)saveDaySummaries:(id)a3 completion:(id)a4;
- (void)saveDaySummary:(id)a3 completion:(id)a4;
- (void)saveLastMenstrualPeriodWithDayIndexRange:(id)a3 completion:(id)a4;
- (void)saveMenstrualFlow:(int64_t)a3 dayIndex:(int64_t)a4 updateAdjacentDays:(BOOL)a5 completion:(id)a6;
- (void)saveMenstrualFlowByDayIndex:(id)a3 completion:(id)a4;
- (void)savePeriodEndedOnDayIndex:(int64_t)a3 completion:(id)a4;
- (void)savePeriodNotYetEndedWithCompletion:(id)a3;
- (void)savePeriodNotYetStartedWithCompletion:(id)a3;
- (void)savePeriodStartedOnDayIndex:(int64_t)a3 completion:(id)a4;
- (void)savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 completion:(id)a5;
- (void)setCycleFactorsLastReviewedDate:(id)a3;
- (void)setIsEligibleForCycleFactorsReminder:(BOOL)a3;
- (void)setLastMenstrualPeriodDismissalDay:(id)a3;
- (void)setUnconfirmedDeviationDismissalDay:(id)a3;
- (void)setUnconfirmedDeviationSubmissionDay:(id)a3;
- (void)triggerAnalysisForDebugReason:(id)a3 completion:(id)a4;
@end

@implementation HKMenstrualCyclesStore

- (HKMenstrualCyclesStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMenstrualCyclesStore;
  v6 = [(HKMenstrualCyclesStore *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A818]);
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v8 initWithHealthStore:v5 taskIdentifier:@"HKMCPluginServer" exportedObject:v7 taskUUID:v9];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (HKCloudSyncControl)cloudSyncControl
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cloudSyncControl)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F0A1B0]) initWithHealthStore:v2->_healthStore];
    cloudSyncControl = v2->_cloudSyncControl;
    v2->_cloudSyncControl = (HKCloudSyncControl *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_cloudSyncControl;
  return v5;
}

- (void)fetchScheduledNotificationsWithCompletion:(id)a3
{
  v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke;
  v9[3] = &unk_2646E9310;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke_2;
  v7[3] = &unk_2646E9278;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchScheduledNotificationsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveDaySummary:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v10 count:1];

  -[HKMenstrualCyclesStore saveDaySummaries:completion:](self, "saveDaySummaries:completion:", v9, v7, v10, v11);
}

- (void)saveDaySummaries:(id)a3 completion:(id)a4
{
}

- (void)saveDaySummaries:(id)a3 canOverrideCreationDate:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke;
  v15[3] = &unk_2646E9338;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke_2;
  v13[3] = &unk_2646E9278;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveDaySummaries:canOverrideCreationDate:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveMenstrualFlow:(int64_t)a3 dayIndex:(int64_t)a4 updateAdjacentDays:(BOOL)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a6;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    objc_super v13 = objc_opt_class();
    id v14 = v13;
    v15 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v27 = v13;
    __int16 v28 = 2112;
    v29 = v15;
    __int16 v30 = 2048;
    int64_t v31 = a3;
    _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving a %@ value of %ld", buf, 0x20u);
  }
  id v16 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke;
  v21[3] = &unk_2646E9360;
  int64_t v23 = a3;
  int64_t v24 = a4;
  BOOL v25 = a5;
  id v22 = v16;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke_2;
  v19[3] = &unk_2646E9278;
  id v20 = v22;
  id v18 = v22;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveMenstrualFlow:dayIndex:updateAdjacentDays:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

uint64_t __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveBleedingFlow:(int64_t)a3 forBleedingType:(int64_t)a4 dayIndex:(int64_t)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a6;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    id v12 = objc_opt_class();
    id v22 = v12;
    objc_super v13 = HKSensitiveLogItem();
    id v14 = HKSensitiveLogItem();
    [NSNumber numberWithInteger:a4];
    id v16 = v15 = a5;
    id v17 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544386;
    int64_t v31 = v12;
    __int16 v32 = 2112;
    v33 = v13;
    __int16 v34 = 2048;
    int64_t v35 = a3;
    __int16 v36 = 2112;
    v37 = v14;
    __int16 v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_2249E9000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving a %@ value of %ld for %@ %@", buf, 0x34u);

    a5 = v15;
  }
  id v18 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke;
  v25[3] = &unk_2646E9388;
  int64_t v27 = a3;
  int64_t v28 = a4;
  int64_t v29 = a5;
  id v26 = v18;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke_2;
  v23[3] = &unk_2646E9278;
  id v24 = v26;
  id v20 = v26;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v25 errorHandler:v23];
}

uint64_t __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveBleedingFlow:forBleedingType:dayIndex:completion:", a1[5], a1[6], a1[7], a1[4]);
}

uint64_t __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke;
  v15[3] = &unk_2646E93B0;
  id v16 = v8;
  int64_t v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke_2;
  v13[3] = &unk_2646E9278;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveBleedingFlowByDayIndex:forBleedingType:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveMenstrualFlowByDayIndex:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke;
  v13[3] = &unk_2646E93D8;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke_2;
  v11[3] = &unk_2646E9278;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveBleedingFlowByDayIndex:forBleedingType:completion:", *(void *)(a1 + 32), 0, *(void *)(a1 + 40));
}

uint64_t __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmAndSaveDeviationWithMenstrualFlowByDayIndex:(id)a3 intermenstrualBleedingByDayIndex:(id)a4 addedCycleFactors:(id)a5 initialAnalysisWindow:(id)a6 completion:(id)a7
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a7];
  proxyProvider = self->_proxyProvider;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke;
  v24[3] = &unk_2646E9400;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  int64_t v29 = var0;
  int64_t v30 = var1;
  id v28 = v16;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2;
  v22[3] = &unk_2646E9278;
  id v23 = v28;
  id v18 = v28;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v24 errorHandler:v22];
}

uint64_t __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex:intermenstrualBleedingByDayIndex:addedCycleFactors:initialAnalysisWindow:completion:", a1[4], a1[5], a1[6], a1[8], a1[9], a1[7]);
}

uint64_t __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveLastMenstrualPeriodWithDayIndexRange:(id)a3 completion:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke;
  v12[3] = &unk_2646E9428;
  int64_t v14 = var0;
  int64_t v15 = var1;
  id v13 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke_2;
  v10[3] = &unk_2646E9278;
  id v11 = v13;
  id v9 = v13;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveLastMenstrualPeriodWithDayIndexRange:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePeriodNotYetStartedWithCompletion:(id)a3
{
  v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke;
  v9[3] = &unk_2646E9310;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke_2;
  v7[3] = &unk_2646E9278;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodNotYetStartedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePeriodNotYetEndedWithCompletion:(id)a3
{
  v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke;
  v9[3] = &unk_2646E9310;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke_2;
  v7[3] = &unk_2646E9278;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodNotYetEndedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePeriodStartedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke;
  v11[3] = &unk_2646E9450;
  int64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke_2;
  v9[3] = &unk_2646E9278;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodStartedOnDayIndex:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke;
  v13[3] = &unk_2646E9428;
  int64_t v15 = a3;
  int64_t v16 = a4;
  id v14 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke_2;
  v11[3] = &unk_2646E9278;
  id v12 = v14;
  id v10 = v14;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodStartedOnDayIndex:endedOnDayIndex:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePeriodEndedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke;
  v11[3] = &unk_2646E9450;
  int64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke_2;
  v9[3] = &unk_2646E9278;
  id v10 = v12;
  id v8 = v12;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodEndedOnDayIndex:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerAnalysisForDebugReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke;
  v13[3] = &unk_2646E93D8;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke_2;
  v11[3] = &unk_2646E9278;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAnalysisForDebugReason:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDate)cycleFactorsLastReviewedDate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HKMenstrualCyclesStore *)self _appProtectedSyncedKeyValueDomain];
  id v11 = 0;
  uint64_t v3 = [v2 dateForKey:@"CycleFactorsLastReviewedDate" error:&v11];
  id v4 = v11;

  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v8 = v6;
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      int64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = @"CycleFactorsLastReviewedDate";
      __int16 v16 = 2114;
      id v17 = v4;
      id v10 = v9;
      _os_log_error_impl(&dword_2249E9000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return (NSDate *)v3;
}

- (void)setCycleFactorsLastReviewedDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HKMenstrualCyclesStore *)self _appProtectedSyncedKeyValueDomain];
  id v15 = 0;
  [v5 setDate:v4 forKey:@"CycleFactorsLastReviewedDate" error:&v15];
  id v6 = v15;

  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09930];
  id v8 = *MEMORY[0x263F09930];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = @"CycleFactorsLastReviewedDate";
      __int16 v20 = 2114;
      id v21 = v6;
      id v11 = v10;
      _os_log_error_impl(&dword_2249E9000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7;
      int64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = @"CycleFactorsLastReviewedDate";
      __int16 v20 = 2112;
      id v21 = v4;
      id v14 = v13;
      _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
    }
    [(HKMenstrualCyclesStore *)self _triggerImmediateSyncWithReason:@"setCycleFactorsLastReviewedDate"];
  }
}

- (void)setIsEligibleForCycleFactorsReminder:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = [(HKMenstrualCyclesStore *)self _appProtectedSyncedKeyValueDomain];
  BOOL v5 = [NSNumber numberWithBool:v3];
  id v17 = 0;
  [v4 setNumber:v5 forKey:@"HKMCCycleFactorsEligibilityState" error:&v17];
  id v6 = v17;

  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09930];
  id v8 = *MEMORY[0x263F09930];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v19 = v10;
      __int16 v20 = 2114;
      id v21 = @"HKMCCycleFactorsEligibilityState";
      __int16 v22 = 2114;
      id v23 = v6;
      id v11 = v10;
      _os_log_error_impl(&dword_2249E9000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v7;
    int64_t v13 = objc_opt_class();
    id v14 = NSNumber;
    id v15 = v13;
    __int16 v16 = [v14 numberWithBool:v3];
    *(_DWORD *)buf = 138543874;
    id v19 = v13;
    __int16 v20 = 2114;
    id v21 = @"HKMCCycleFactorsEligibilityState";
    __int16 v22 = 2112;
    id v23 = v16;
    _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
  }
}

- (NSNumber)lastMenstrualPeriodDismissalDay
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HKMenstrualCyclesStore *)self _syncedProtectedKeyValueDomain];
  id v11 = 0;
  BOOL v3 = [v2 numberForKey:@"LastMenstrualPeriodDismissalDefaultsKey" error:&v11];
  id v4 = v11;

  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v8 = v6;
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      int64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = @"LastMenstrualPeriodDismissalDefaultsKey";
      __int16 v16 = 2114;
      id v17 = v4;
      id v10 = v9;
      _os_log_error_impl(&dword_2249E9000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return (NSNumber *)v3;
}

- (void)setLastMenstrualPeriodDismissalDay:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HKMenstrualCyclesStore *)self _syncedProtectedKeyValueDomain];
  id v15 = 0;
  [v5 setNumber:v4 forKey:@"LastMenstrualPeriodDismissalDefaultsKey" error:&v15];
  id v6 = v15;

  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09930];
  id v8 = *MEMORY[0x263F09930];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = @"LastMenstrualPeriodDismissalDefaultsKey";
      __int16 v20 = 2114;
      id v21 = v6;
      id v11 = v10;
      _os_log_error_impl(&dword_2249E9000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7;
      int64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = @"LastMenstrualPeriodDismissalDefaultsKey";
      __int16 v20 = 2112;
      id v21 = v4;
      id v14 = v13;
      _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
    }
    [(HKMenstrualCyclesStore *)self _triggerImmediateSyncWithReason:@"setLastMenstrualPeriodDismissalDay"];
  }
}

- (id)deviationDetectedIndicesForDeviationType:(int64_t)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = HKMCDeviationDetectionAnalyticsKeyFromDeviationType(a3);
  id v7 = [(HKMenstrualCyclesStore *)self _deviationDetectionAnalyticsDomain];
  id v8 = [v7 propertyListValueForKey:v6 error:a4];

  if (!a4 || v8)
  {
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF8C0]);

      id v8 = v10;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v12 = v9;
      int64_t v13 = objc_opt_class();
      id v14 = *a4;
      int v16 = 138543874;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v14;
      id v15 = v13;
      _os_log_error_impl(&dword_2249E9000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    id v8 = 0;
  }

  return v8;
}

- (BOOL)setDeviationDetectedIfNeededForDeviations:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (!v4)
  {
    char v7 = 0;
    goto LABEL_28;
  }
  uint64_t v6 = v4;
  char v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v45;
  *(void *)&long long v5 = 138543874;
  long long v38 = v5;
  while (2)
  {
    uint64_t v10 = 0;
    uint64_t v40 = v6;
    do
    {
      if (*(void *)v45 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
      id v12 = NSNumber;
      uint64_t v13 = objc_msgSend(v11, "days", v38);
      if (v14 <= 0) {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v15 = v14 + v13 - 1;
      }
      int v16 = [v12 numberWithInteger:v15];
      id v17 = HKMCDeviationDetectionAnalyticsKeyFromDeviationType([v11 type]);
      uint64_t v18 = [v11 type];
      id v43 = v8;
      id v19 = [(HKMenstrualCyclesStore *)self deviationDetectedIndicesForDeviationType:v18 error:&v43];
      id v20 = v43;

      if (v20)
      {
        _HKInitializeLogging();
        int64_t v30 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
        {
          __int16 v32 = v30;
          v33 = objc_opt_class();
          *(_DWORD *)buf = v38;
          v49 = v33;
          __int16 v50 = 2114;
          v51 = v17;
          __int16 v52 = 2114;
          id v53 = v20;
          id v34 = v33;
          _os_log_error_impl(&dword_2249E9000, v32, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);
        }
        id v8 = v20;
        goto LABEL_26;
      }
      if ([v19 containsObject:v16])
      {
        id v8 = 0;
        goto LABEL_16;
      }
      char v39 = v7;
      id v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v19];
      [v21 addObject:v16];
      uint64_t v22 = self;
      id v23 = [(HKMenstrualCyclesStore *)self _deviationDetectionAnalyticsDomain];
      id v42 = 0;
      int v24 = [v23 setPropertyListValue:v21 forKey:v17 error:&v42];
      id v8 = v42;

      _HKInitializeLogging();
      id v25 = (void *)*MEMORY[0x263F09930];
      id v26 = *MEMORY[0x263F09930];
      if (!v24)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int64_t v35 = v25;
          __int16 v36 = objc_opt_class();
          *(_DWORD *)buf = v38;
          v49 = v36;
          __int16 v50 = 2114;
          v51 = v17;
          __int16 v52 = 2114;
          id v53 = v8;
          id v37 = v36;
          _os_log_error_impl(&dword_2249E9000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
        }
        char v7 = v39;
LABEL_26:

        goto LABEL_27;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v25;
        id v28 = objc_opt_class();
        *(_DWORD *)buf = v38;
        v49 = v28;
        __int16 v50 = 2114;
        v51 = v17;
        __int16 v52 = 2112;
        id v53 = v21;
        id v29 = v28;
        _os_log_impl(&dword_2249E9000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
      }
      char v7 = 1;
      self = v22;
      uint64_t v6 = v40;
LABEL_16:

      ++v10;
    }
    while (v6 != v10);
    uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_27:

LABEL_28:
  return v7 & 1;
}

- (NSNumber)unconfirmedDeviationDismissalDay
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HKMenstrualCyclesStore *)self _syncedProtectedKeyValueDomain];
  id v11 = 0;
  BOOL v3 = [v2 numberForKey:@"UnconfirmedDeviationDismissalDayIndex" error:&v11];
  id v4 = v11;

  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v8 = v6;
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = @"UnconfirmedDeviationDismissalDayIndex";
      __int16 v16 = 2114;
      id v17 = v4;
      id v10 = v9;
      _os_log_error_impl(&dword_2249E9000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return (NSNumber *)v3;
}

- (void)setUnconfirmedDeviationDismissalDay:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HKMenstrualCyclesStore *)self _syncedProtectedKeyValueDomain];
  id v15 = 0;
  [v5 setNumber:v4 forKey:@"UnconfirmedDeviationDismissalDayIndex" error:&v15];
  id v6 = v15;

  _HKInitializeLogging();
  char v7 = (void *)*MEMORY[0x263F09930];
  id v8 = *MEMORY[0x263F09930];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v7;
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = @"UnconfirmedDeviationDismissalDayIndex";
      __int16 v20 = 2114;
      id v21 = v6;
      id v11 = v10;
      _os_log_error_impl(&dword_2249E9000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7;
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = @"UnconfirmedDeviationDismissalDayIndex";
      __int16 v20 = 2112;
      id v21 = v4;
      id v14 = v13;
      _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
    }
    [(HKMenstrualCyclesStore *)self triggerAnalysisForDebugReason:@"deviation dismissal" completion:&__block_literal_global];
    [(HKMenstrualCyclesStore *)self _triggerImmediateSyncWithReason:@"setUnconfirmedDeviationDismissalDay"];
  }
}

- (NSNumber)unconfirmedDeviationSubmissionDay
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HKMenstrualCyclesStore *)self _deviationDetectionAnalyticsDomain];
  id v11 = 0;
  BOOL v3 = [v2 numberForKey:@"UnconfirmedDeviationSubmissionDayIndex" error:&v11];
  id v4 = v11;

  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v8 = v6;
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = @"UnconfirmedDeviationSubmissionDayIndex";
      __int16 v16 = 2114;
      id v17 = v4;
      id v10 = v9;
      _os_log_error_impl(&dword_2249E9000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return (NSNumber *)v3;
}

- (void)setUnconfirmedDeviationSubmissionDay:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HKMenstrualCyclesStore *)self _deviationDetectionAnalyticsDomain];
  id v13 = 0;
  [v5 setNumber:v4 forKey:@"UnconfirmedDeviationSubmissionDayIndex" error:&v13];
  id v6 = v13;

  _HKInitializeLogging();
  char v7 = (void *)*MEMORY[0x263F09930];
  id v8 = *MEMORY[0x263F09930];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v7;
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = @"UnconfirmedDeviationSubmissionDayIndex";
      __int16 v18 = 2114;
      id v19 = v6;
      id v11 = v10;
      _os_log_error_impl(&dword_2249E9000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v7;
    id v12 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    id v15 = v12;
    __int16 v16 = 2114;
    id v17 = @"UnconfirmedDeviationSubmissionDayIndex";
    __int16 v18 = 2112;
    id v19 = v4;
    id v11 = v12;
    _os_log_impl(&dword_2249E9000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
    goto LABEL_6;
  }
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  id v6 = [(HKMenstrualCyclesStore *)self cloudSyncControl];
  char v7 = (void *)[objc_alloc(MEMORY[0x263F0A1C8]) initWithChangesSyncRequest:v5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke;
  v9[3] = &unk_2646E9498;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 syncWithRequest:v7 reason:v8 completion:v9];
}

void __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  char v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully requested sync after %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (id)_syncedProtectedKeyValueDomain
{
  id v3 = objc_alloc(MEMORY[0x263F0A470]);
  id v4 = [(HKMenstrualCyclesStore *)self healthStore];
  id v5 = (void *)[v3 initWithCategory:0 domainName:@"com.apple.private.health.menstrual-cycles" healthStore:v4];

  return v5;
}

- (id)_appProtectedSyncedKeyValueDomain
{
  id v3 = objc_alloc(MEMORY[0x263F0A470]);
  id v4 = [(HKMenstrualCyclesStore *)self healthStore];
  id v5 = (void *)[v3 initWithCategory:2 domainName:@"com.apple.private.health.menstrual-cycles" healthStore:v4];

  return v5;
}

- (id)_deviationDetectionAnalyticsDomain
{
  id v3 = objc_alloc(MEMORY[0x263F0A470]);
  id v4 = [(HKMenstrualCyclesStore *)self healthStore];
  id v5 = (void *)[v3 initWithCategory:1 domainName:@"com.apple.private.health.menstrual-cycles.deviation-detection-analytics" healthStore:v4];

  return v5;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_cloudSyncControl, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  id v8 = v6;
  _os_log_error_impl(&dword_2249E9000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Unsuccessfully requested sync after %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end