@interface HKHRAFibBurdenSevenDayAnalysisScheduler
- (BOOL)_determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:(int64_t)a3;
- (BOOL)_shouldAllowFeatureStatus:(id)a3;
- (HKHRAFibBurdenSevenDayAnalysisScheduler)initWithProfile:(id)a3 analysisManager:(id)a4 featureStatusManager:(id)a5 featureStatusInspector:(id)a6 alarm:(id)a7 scheduler:(id)a8 breadcrumbManager:(id)a9 syncedKeyValueDomain:(id)a10;
- (HKHRAFibBurdenSevenDayAnalysisScheduler)initWithProfile:(id)a3 featureStatusManager:(id)a4 onboardingEligibilityDeterminer:(id)a5 analyzer:(id)a6;
- (HKHRAFibBurdenSevenDayAnalysisSchedulerDelegate)delegate;
- (id)_performAnalysisWithFeatureStatus:(id)a3 error:(id *)a4;
- (void)_forceAnalysis;
- (void)_logAnalysisResult:(int64_t)a3 error:(id)a4;
- (void)_reportAnalysisResultsToDelegate:(id)a3 featureStatus:(id)a4;
- (void)_saveLastAnalysisCompletedDateForResult:(id)a3;
- (void)analysisSchedulerDidFire:(id)a3 completion:(id)a4;
- (void)initialAnalysisAlarmDidFireWithAlarm:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisScheduler

- (HKHRAFibBurdenSevenDayAnalysisScheduler)initWithProfile:(id)a3 featureStatusManager:(id)a4 onboardingEligibilityDeterminer:(id)a5 analyzer:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager alloc] initWithProfile:v13];
  v15 = [[HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector alloc] initWithOnboardingEligibilityDeterminer:v11 breadcrumbManager:v14];

  v16 = [HKHRDatabaseAnalysisSchedulerImpl alloc];
  v17 = HKHRAFibBurdenLogForCategory();
  HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay();
  v18 = -[HKHRDatabaseAnalysisSchedulerImpl initWithProfile:identifier:loggingCategory:maximumDelay:retryDelay:breadcrumbManager:](v16, "initWithProfile:identifier:loggingCategory:maximumDelay:retryDelay:breadcrumbManager:", v13, @"HKHRAFibBurdenSevenDayAnalysisSchedulerIdentifier", v17, v14);

  v19 = [[HKHRAFibBurdenSevenDayAnalysisManager alloc] initWithProfile:v13 analyzer:v10];
  v20 = [[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm alloc] initWithProfile:v13];
  v21 = objc_msgSend(MEMORY[0x1E4F65B28], "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", v13);
  v22 = [(HKHRAFibBurdenSevenDayAnalysisScheduler *)self initWithProfile:v13 analysisManager:v19 featureStatusManager:v12 featureStatusInspector:v15 alarm:v20 scheduler:v18 breadcrumbManager:v14 syncedKeyValueDomain:v21];

  return v22;
}

- (HKHRAFibBurdenSevenDayAnalysisScheduler)initWithProfile:(id)a3 analysisManager:(id)a4 featureStatusManager:(id)a5 featureStatusInspector:(id)a6 alarm:(id)a7 scheduler:(id)a8 breadcrumbManager:(id)a9 syncedKeyValueDomain:(id)a10
{
  id obj = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v21 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisScheduler;
  v18 = [(HKHRAFibBurdenSevenDayAnalysisScheduler *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, obj);
    objc_storeStrong((id *)&v19->_analysisManager, a4);
    objc_storeStrong((id *)&v19->_featureStatusManager, a5);
    objc_storeStrong((id *)&v19->_featureStatusInspector, a6);
    objc_storeStrong((id *)&v19->_alarm, a7);
    objc_storeStrong((id *)&v19->_scheduler, a8);
    objc_storeStrong((id *)&v19->_breadcrumbManager, a9);
    objc_storeStrong((id *)&v19->_syncedKeyValueDomain, a10);
    -[HKHRAFibBurdenSevenDayAnalysisSchedulerAlarm setDelegate:](v19->_alarm, "setDelegate:", v19, v21, v22, v23, v24, v25);
    [(HKHRDatabaseAnalysisScheduler *)v19->_scheduler setDelegate:v19];
  }

  return v19;
}

- (void)initialAnalysisAlarmDidFireWithAlarm:(id)a3
{
  [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropBreadcrumb:0];
  scheduler = self->_scheduler;

  [(HKHRDatabaseAnalysisScheduler *)scheduler scheduleAnalysis];
}

- (void)analysisSchedulerDidFire:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, id))a4;
  featureStatusManager = self->_featureStatusManager;
  id v13 = 0;
  v7 = [(HKFeatureStatusManager *)featureStatusManager featureStatusWithError:&v13];
  id v8 = v13;
  if (v7)
  {
    if ([(HKHRAFibBurdenSevenDayAnalysisScheduler *)self _shouldAllowFeatureStatus:v7])
    {
      id v12 = v8;
      v9 = [(HKHRAFibBurdenSevenDayAnalysisScheduler *)self _performAnalysisWithFeatureStatus:v7 error:&v12];
      id v10 = v12;

      -[HKHRAFibBurdenSevenDayAnalysisScheduler _logAnalysisResult:error:](self, "_logAnalysisResult:error:", [v9 result], v10);
      [(HKHRAFibBurdenSevenDayAnalysisScheduler *)self _reportAnalysisResultsToDelegate:v9 featureStatus:v7];
      [(HKHRAFibBurdenSevenDayAnalysisScheduler *)self _saveLastAnalysisCompletedDateForResult:v9];
      v5[2](v5, -[HKHRAFibBurdenSevenDayAnalysisScheduler _determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:](self, "_determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:", [v9 result]), v10);

      id v8 = v10;
    }
    else
    {
      v5[2](v5, 0, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenSevenDayAnalysisScheduler analysisSchedulerDidFire:completion:]();
    }

    [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"Failed to retrieve feature status"];
    v5[2](v5, 1, v8);
  }
}

- (void)_forceAnalysis
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1D3AC6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis forced.", (uint8_t *)&v4, 0xCu);
  }

  [(HKHRDatabaseAnalysisScheduler *)self->_scheduler forceAnalysis];
}

- (BOOL)_shouldAllowFeatureStatus:(id)a3
{
  return [(HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspecting *)self->_featureStatusInspector shouldAllowAnalysisWithFeatureStatus:a3];
}

- (id)_performAnalysisWithFeatureStatus:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__HKHRAFibBurdenSevenDayAnalysisScheduler__performAnalysisWithFeatureStatus_error___block_invoke;
  v24[3] = &unk_1E69B3EE8;
  v24[4] = self;
  id v7 = v6;
  id v25 = v7;
  v26 = &v27;
  id v8 = (void (**)(void))MEMORY[0x1D943B130](v24);
  v9 = HKHRAFibBurdenLogForCategory();
  os_signpost_id_t v10 = _HKLogSignpostIDGenerate();
  id v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v12 = [v11 showSensitiveLogItems];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    HKHRAFibBurdenPreviousWeekDayIndexRange();

    v15 = NSStringFromHKDayIndexRange();
    _HKInitializeLogging();
    if (os_signpost_enabled(v9))
    {
      id v16 = v9;
      id v17 = v16;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_signpost_emit_with_name_impl(&dword_1D3AC6000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v10, "afib-burden-analysis", "dayIndexRange=%@", buf, 0xCu);
      }
    }
    v18 = v8[2](v8);
    _HKInitializeLogging();
    if (os_signpost_enabled(v9))
    {
      v19 = v9;
      v20 = v19;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_signpost_emit_with_name_impl(&dword_1D3AC6000, v20, OS_SIGNPOST_INTERVAL_END, v10, "afib-burden-analysis", "dayIndexRange=%@", buf, 0xCu);
      }
    }
  }
  else
  {
    v18 = v8[2](v8);
  }
  id v21 = (id)v28[5];
  id v22 = v21;
  if (v21)
  {
    if (a4) {
      *a4 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(&v27, 8);

  return v18;
}

id __83__HKHRAFibBurdenSevenDayAnalysisScheduler__performAnalysisWithFeatureStatus_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  v3 = *(void **)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 56);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v3 analyzePreviousCalendarWeekWithFeatureStatus:v1 shouldSaveSampleToDatabase:1 breadcrumbManager:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  return v6;
}

- (void)_logAnalysisResult:(int64_t)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  switch(a3)
  {
    case 0:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v11 = 138412290;
      int v12 = self;
      id v8 = "[%@] Burden analysis run and sample created";
      goto LABEL_14;
    case 1:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v11 = 138412546;
      int v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      id v8 = "[%@] Burden analysis run, no sample created due to infrastructure error: %@";
      v9 = v7;
      uint32_t v10 = 22;
      goto LABEL_15;
    case 2:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v11 = 138412290;
      int v12 = self;
      id v8 = "[%@] Burden analysis run, no sample created as there was not enough time since last sample";
      goto LABEL_14;
    case 3:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v11 = 138412290;
      int v12 = self;
      id v8 = "[%@] Burden analysis run, no sample created as there was not enough tachograms for the previous seven days";
      goto LABEL_14;
    case 4:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v11 = 138412290;
      int v12 = self;
      id v8 = "[%@] Burden analysis run, no sample created as there was not enough days in previous seven days with minimum "
           "tachogram threshold";
      goto LABEL_14;
    case 5:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v11 = 138412290;
      int v12 = self;
      id v8 = "[%@] Burden analysis run, no sample created as there was not enough segments";
LABEL_14:
      v9 = v7;
      uint32_t v10 = 12;
LABEL_15:
      _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
LABEL_16:

LABEL_17:
      return;
    default:
      goto LABEL_17;
  }
}

- (BOOL)_determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:(int64_t)a3
{
  return a3 == 1;
}

- (void)_reportAnalysisResultsToDelegate:(id)a3 featureStatus:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 result];
  if ((unint64_t)(v7 - 3) >= 3)
  {
    if (v7) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = [v10 sampleCreated];
    objc_msgSend(WeakRetained, "sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:", self, v9, objc_msgSend(v10, "onboardedWithinAnalysisInterval"), v6);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:", self, 0, objc_msgSend(v10, "onboardedWithinAnalysisInterval"), v6);
  }

LABEL_6:
}

- (void)_saveLastAnalysisCompletedDateForResult:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 result];
  if (v4 <= 5)
  {
    if (((1 << v4) & 0x39) != 0)
    {
      _HKInitializeLogging();
      uint64_t v5 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v13 = self;
        _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Saving analysis completed date", buf, 0xCu);
      }

      syncedKeyValueDomain = self->_syncedKeyValueDomain;
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = *MEMORY[0x1E4F67D48];
      id v11 = 0;
      [(HDKeyValueDomain *)syncedKeyValueDomain setDate:v7 forKey:v8 error:&v11];
      v9 = v11;

      if (v9)
      {
        _HKInitializeLogging();
        id v10 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[HKHRAFibBurdenSevenDayAnalysisScheduler _saveLastAnalysisCompletedDateForResult:]();
        }
      }
      notify_post((const char *)*MEMORY[0x1E4F67D40]);
    }
    else
    {
      _HKInitializeLogging();
      v9 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v13 = self;
        _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Skipping save analysis completed date - analysis not completed", buf, 0xCu);
      }
    }
  }
}

- (HKHRAFibBurdenSevenDayAnalysisSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKHRAFibBurdenSevenDayAnalysisSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_breadcrumbManager, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_featureStatusInspector, 0);
  objc_storeStrong((id *)&self->_featureStatusManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)analysisSchedulerDidFire:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Error when getting initial feature status: %@");
}

- (void)_saveLastAnalysisCompletedDateForResult:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Error when saving analysis date: %@");
}

@end