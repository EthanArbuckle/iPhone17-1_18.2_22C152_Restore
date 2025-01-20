@interface HKHRAFibBurdenControl
- (HKHRAFibBurdenControl)initWithHealthStore:(id)a3;
- (id)determineIfAnalysisCanRunWithFeatureStatus:(id)a3 error:(id *)a4;
- (id)fetchSevenDayAnalysisBreadcrumbsWithError:(id *)a3;
- (id)performAnalysisForWeekContainingDayIndex:(int64_t)a3 error:(id *)a4;
- (void)addTachogramClassificationForSampleUUID:(id)a3 hasAFib:(BOOL)a4 completion:(id)a5;
- (void)addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(id)a5 chanceOfWrite:(id)a6 minutesBetweenSamples:(id)a7 startingHour:(id)a8 endingHour:(id)a9 completion:(id)a10;
- (void)deleteAllTachogramClassificationsWithCompletion:(id)a3;
- (void)deleteTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4;
- (void)determineMajorityTimeZoneForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5;
- (void)fetchLastAnalysisDateWithCompletion:(id)a3;
- (void)fetchSevenDayAnalysisBreadcrumbsWithCompletion:(id)a3;
- (void)injectBurdenValues:(id)a3 completion:(id)a4;
- (void)queryAllTachogramClassificationsWithCompletion:(id)a3;
- (void)queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:(int64_t)a3 completion:(id)a4;
- (void)queryEligibleTachogramsForPreviousSixWeeksForWeekday:(int64_t)a3 completion:(id)a4;
- (void)queryEligibleTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5;
- (void)queryTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4;
- (void)sendNotificationForCurrentValue:(id)a3 previousValue:(id)a4 shouldForwardToWatch:(BOOL)a5 completion:(id)a6;
- (void)sendNotificationWithMode:(id)a3 completion:(id)a4;
- (void)setLastAnalysisDate:(id)a3 completion:(id)a4;
- (void)triggerAnalysis;
@end

@implementation HKHRAFibBurdenControl

- (HKHRAFibBurdenControl)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRAFibBurdenControl;
  v6 = [(HKHRAFibBurdenControl *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v8 initWithHealthStore:v5 taskIdentifier:@"HKHRAFibBurdenControlServer" exportedObject:v7 taskUUID:v9];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
    id v12 = objc_alloc_init(MEMORY[0x1E4F2B600]);
    [(HKTaskServerProxyProvider *)v7->_proxyProvider setTaskConfiguration:v12];
  }
  return v7;
}

- (void)triggerAnalysis
{
  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2;
  v3[3] = &unk_1E6D49A50;
  v3[4] = self;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:&__block_literal_global_4 errorHandler:v3];
}

uint64_t __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAnalysis");
}

void __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2_cold_1();
  }
}

- (id)determineIfAnalysisCanRunWithFeatureStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke;
  v14[3] = &unk_1E6D49C20;
  id v8 = v6;
  id v15 = v8;
  v16 = &v24;
  v17 = &v18;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_3;
  v13[3] = &unk_1E6D49960;
  v13[4] = &v18;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v14 errorHandler:v13];
  id v9 = (id)v19[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_2;
  v4[3] = &unk_1E6D49BF8;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_determineIfAnalysisCanRunWithFeatureStatus:completion:", v2, v4);
}

void __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)addTachogramClassificationForSampleUUID:(id)a3 hasAFib:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke;
  v16[3] = &unk_1E6D49C48;
  id v17 = v8;
  BOOL v19 = a4;
  id v18 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2;
  v13[3] = &unk_1E6D49C70;
  v13[4] = self;
  id v14 = v17;
  id v15 = v18;
  id v11 = v18;
  id v12 = v17;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v13];
}

uint64_t __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addTachogramClassificationForSampleUUID:hasAFib:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

void __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)queryAllTachogramClassificationsWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke;
  v9[3] = &unk_1E6D49C98;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6D49CC0;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryAllTachogramClassificationsWithCompletion:", *(void *)(a1 + 32));
}

void __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke;
  v14[3] = &unk_1E6D49CE8;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2;
  v11[3] = &unk_1E6D49C70;
  v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryTachogramClassificationForSampleUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deleteAllTachogramClassificationsWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke;
  v9[3] = &unk_1E6D49C98;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6D49CC0;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAllTachogramClassificationsWithCompletion:", *(void *)(a1 + 32));
}

void __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke;
  v14[3] = &unk_1E6D49CE8;
  id v15 = v6;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2;
  v11[3] = &unk_1E6D49C70;
  v11[4] = self;
  id v12 = v15;
  id v13 = v16;
  id v9 = v16;
  id v10 = v15;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
}

uint64_t __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteTachogramClassificationForSampleUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)determineMajorityTimeZoneForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke;
  v15[3] = &unk_1E6D49D10;
  int64_t v17 = a3;
  int64_t v18 = a4;
  id v16 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2;
  v11[3] = &unk_1E6D49D38;
  int64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v16;
  id v10 = v16;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v11];
}

uint64_t __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_determineMajorityTimeZoneForStartDayIndex:endDayIndex:completion:", a1[5], a1[6], a1[4]);
}

void __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryEligibleTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke;
  v15[3] = &unk_1E6D49D10;
  int64_t v17 = a3;
  int64_t v18 = a4;
  id v16 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2;
  v11[3] = &unk_1E6D49D38;
  int64_t v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v16;
  id v10 = v16;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v11];
}

uint64_t __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryEligibleTachogramsForStartDayIndex:endDayIndex:completion:", a1[5], a1[6], a1[4]);
}

void __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryEligibleTachogramsForPreviousSixWeeksForWeekday:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke;
  v12[3] = &unk_1E6D49D60;
  int64_t v14 = a3;
  id v13 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2;
  v9[3] = &unk_1E6D49D88;
  id v10 = v13;
  int64_t v11 = a3;
  void v9[4] = self;
  id v8 = v13;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v9];
}

uint64_t __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke;
  v12[3] = &unk_1E6D49D60;
  int64_t v14 = a3;
  id v13 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2;
  v9[3] = &unk_1E6D49D88;
  id v10 = v13;
  int64_t v11 = a3;
  void v9[4] = self;
  id v8 = v13;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v9];
}

uint64_t __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(id)a5 chanceOfWrite:(id)a6 minutesBetweenSamples:(id)a7 startingHour:(id)a8 endingHour:(id)a9 completion:(id)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  proxyProvider = self->_proxyProvider;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke;
  v31[3] = &unk_1E6D49DB0;
  int64_t v38 = a3;
  int64_t v39 = a4;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2;
  v29[3] = &unk_1E6D49CC0;
  v29[4] = self;
  id v30 = v37;
  id v23 = v37;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v31 errorHandler:v29];
}

uint64_t __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addTachogramsForStartDayIndex:endDayIndex:chanceOfAFib:chanceOfWrite:minutesBetweenSamples:startingHour:endingHour:completion:", a1[10], a1[11], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

void __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)performAnalysisForWeekContainingDayIndex:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke;
  v11[3] = &unk_1E6D49E00;
  void v11[5] = &v12;
  v11[6] = a3;
  v11[4] = &v18;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_3;
  v10[3] = &unk_1E6D49960;
  v10[4] = &v12;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v11 errorHandler:v10];
  id v6 = (id)v13[5];
  id v7 = v6;
  if (v6)
  {
    if (a4) {
      *a4 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_2;
  v4[3] = &unk_1E6D49DD8;
  long long v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_performAnalysisForWeekContainingDayIndex:completion:", v2, v4);
}

void __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)sendNotificationWithMode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke;
  v13[3] = &unk_1E6D49E28;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2;
  v11[3] = &unk_1E6D49CC0;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNotificationWithMode:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendNotificationForCurrentValue:(id)a3 previousValue:(id)a4 shouldForwardToWatch:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v38 = a3;
  id v10 = a4;
  id v11 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v12 = a6;
  id v13 = [v11 alloc];
  id v14 = (void *)[v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v16 = HKHRAFibBurdenPreviousWeekDayIndexRange(v15, v14);
  uint64_t v18 = v17;

  id v34 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v16, 0, v14);
  id v32 = v14;
  id v33 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v16 + v18, 0, v14);
  id v36 = self;
  id v37 = v10;
  id v35 = v12;
  if (v38)
  {
    [v38 doubleValue];
    if (v19 <= 2.0)
    {
      id v20 = (id)[objc_alloc(NSNumber) initWithDouble:2.0];
      uint64_t v21 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      id v20 = v38;
      uint64_t v21 = MEMORY[0x1E4F1CC28];
    }
    id v23 = [MEMORY[0x1E4F29128] UUID];
    if (v10)
    {
      [v10 doubleValue];
      if (v27 > 2.0)
      {
        id v24 = v10;
        uint64_t v22 = MEMORY[0x1E4F1CC28];
        uint64_t v31 = 2;
        uint64_t v25 = MEMORY[0x1E4F1CC28];
        goto LABEL_12;
      }
      id v24 = (id)[objc_alloc(NSNumber) initWithDouble:2.0];
      uint64_t v25 = MEMORY[0x1E4F1CC28];
      uint64_t v22 = MEMORY[0x1E4F1CC38];
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v22 = 0;
      id v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    id v20 = 0;
    id v23 = 0;
    id v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 3;
  }
  uint64_t v31 = v26;
LABEL_12:
  id v28 = [HKHRAFibBurdenNotificationMode alloc];
  id v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v34 endDate:v33];
  id v30 = [(HKHRAFibBurdenNotificationMode *)v28 initWithType:v31 shouldForwardToWatch:v7 currentPercentage:v20 currentValueClamped:v21 currentValueDateInterval:v29 currentValueUUID:v23 previousPercentage:v24 previousValueClamped:v22 previousTimeZoneDiffersFromCurrent:v25];

  [(HKHRAFibBurdenControl *)v36 sendNotificationWithMode:v30 completion:v35];
}

- (void)fetchLastAnalysisDateWithCompletion:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F2B138];
  healthStore = self->_healthStore;
  id v5 = a3;
  objc_msgSend(v3, "hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:", healthStore);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 dateForKey:@"LastAnalysisCompletedDate" completion:v5];
}

- (void)setLastAnalysisDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1E4F2B138];
  healthStore = self->_healthStore;
  id v9 = a3;
  id v10 = objc_msgSend(v7, "hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:", healthStore);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HKHRAFibBurdenControl_setLastAnalysisDate_completion___block_invoke;
  v12[3] = &unk_1E6D49E50;
  id v13 = v6;
  id v11 = v6;
  [v10 setDate:v9 forKey:@"LastAnalysisCompletedDate" completion:v12];
}

void __56__HKHRAFibBurdenControl_setLastAnalysisDate_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    notify_post("com.apple.private.health.afib-burden.analysis-date.did-change");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)injectBurdenValues:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke;
  v13[3] = &unk_1E6D49E28;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2;
  v11[3] = &unk_1E6D49CC0;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_injectBurdenValues:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)fetchSevenDayAnalysisBreadcrumbsWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1;
  id v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke;
  v10[3] = &unk_1E6D49EA0;
  v10[4] = &v17;
  void v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_3;
  v9[3] = &unk_1E6D49960;
  void v9[4] = &v11;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_2;
  v3[3] = &unk_1E6D49E78;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:", v3);
}

void __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)fetchSevenDayAnalysisBreadcrumbsWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke;
  v9[3] = &unk_1E6D49EC8;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6D49CC0;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:", *(void *)(a1 + 32));
}

void __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when triggering analysis: %@");
}

void __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E0A83000, v0, v1, "[%@] Error when inserting tachogram classification with UUID %@: %@");
}

void __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when querying all tachogram classifications: %@");
}

void __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E0A83000, v0, v1, "[%@] Error when querying tachogram classification with UUID %@: %@");
}

void __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when deleting all tachogram classifications: %@");
}

void __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E0A83000, v0, v1, "[%@] Error when deleting tachogram classifications for UUID %@: %@");
}

void __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1E0A83000, v0, v1, "[%@] Error when determining majority time zones for day indexes %ld-%ld: %@");
}

void __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1E0A83000, v0, v1, "[%@] Error when querying eligible tachograms for day indexes %ld-%ld: %@");
}

void __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1E0A83000, v0, v1, "[%@] Error when querying eligible tachograms for weekday %ld: %@");
}

void __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_1E0A83000, v0, v1, "[%@] Error when querying eligible tachograms for time of day bucket %ld: %@");
}

void __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when adding tachograms: %@");
}

void __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when sending notification: %@");
}

void __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when injecting burden values: %@");
}

void __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%@] Error when fetching seven day analysis breadcrumbs: %@");
}

@end