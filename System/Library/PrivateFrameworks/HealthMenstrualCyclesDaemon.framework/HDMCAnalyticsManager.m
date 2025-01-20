@interface HDMCAnalyticsManager
- (HDMCAnalyticsManager)initWithProfile:(id)a3 analysisManager:(id)a4 heartRateFeatureAvailabilityManager:(id)a5 deviationDetectionFeatureAvailabilityManager:(id)a6 wristTemperatureInputFeatureAvailabilityManager:(id)a7 pregnancyManager:(id)a8;
- (void)_submitAnalyticsWithCompletion:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
@end

@implementation HDMCAnalyticsManager

- (HDMCAnalyticsManager)initWithProfile:(id)a3 analysisManager:(id)a4 heartRateFeatureAvailabilityManager:(id)a5 deviationDetectionFeatureAvailabilityManager:(id)a6 wristTemperatureInputFeatureAvailabilityManager:(id)a7 pregnancyManager:(id)a8
{
  id obj = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v22 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HDMCAnalyticsManager;
  v18 = [(HDMCAnalyticsManager *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, obj);
    objc_storeStrong((id *)&v19->_analysisManager, a4);
    objc_storeStrong((id *)&v19->_heartRateFeatureAvailabilityManager, a5);
    objc_storeStrong((id *)&v19->_deviationDetectionFeatureAvailabilityManager, a6);
    objc_storeStrong((id *)&v19->_wristTemperatureInputFeatureAvailabilityManager, a7);
    objc_storeStrong((id *)&v19->_pregnancyManager, a8);
    id WeakRetained = objc_loadWeakRetained((id *)&v19->_profile);
    [WeakRetained registerProfileReadyObserver:v19 queue:0];
  }
  return v19;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained daemon];
  v5 = [v4 analyticsSubmissionCoordinator];
  [v5 addObserver:self queue:0];
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = +[HDMCDailyAnalytics shouldSubmit];
  v7 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults");
  uint64_t v8 = objc_msgSend(v7, "hkmc_analyticsDebugModeEnabled");

  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x263F09930];
  v10 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = objc_opt_class();
    v13 = NSNumber;
    id v14 = v12;
    id v15 = [v13 numberWithBool:v6];
    id v16 = [NSNumber numberWithBool:v8];
    int v21 = 138543874;
    id v22 = v12;
    __int16 v23 = 2114;
    objc_super v24 = v15;
    __int16 v25 = 2114;
    v26 = v16;
    _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received daily analytics trigger. metricsEnabled: %{public}@, inDebugMode: %{public}@", (uint8_t *)&v21, 0x20u);
  }
  if (v6 | v8)
  {
    [(HDMCAnalyticsManager *)self _submitAnalyticsWithCompletion:v5];
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = objc_opt_class();
      int v21 = 138543362;
      id v22 = v19;
      id v20 = v19;
      _os_log_impl(&dword_225722000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping analytics submission", (uint8_t *)&v21, 0xCu);
    }
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
  }
}

- (void)_submitAnalyticsWithCompletion:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _HKLogPersistedSignposts();
  os_signpost_id_t v6 = _HKLogSignpostIDGenerate();

  _HKInitializeLogging();
  v7 = _HKLogPersistedSignposts();
  BOOL v8 = os_signpost_enabled(v7);

  if (v8)
  {
    v9 = _HKLogPersistedSignposts();
    v10 = v9;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_225722000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "menstrual-cycles-daily-analytics", "", buf, 2u);
    }
  }
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x263F09930];
  v12 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    id v14 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v49 = v14;
    id v15 = v14;
    _os_log_impl(&dword_225722000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning analytics submission", buf, 0xCu);
  }
  id v16 = [(HDMCAnalysisManager *)self->_analysisManager currentAnalysis];
  os_log_t v17 = [v16 cycles];

  if (v17)
  {
    id v18 = 0;
  }
  else
  {
    analysisManager = self->_analysisManager;
    id v47 = 0;
    uint64_t v20 = [(HDMCAnalysisManager *)analysisManager _analyzeWithForceIncludeCycles:1 forceAnalyzeCompleteHistory:0 error:&v47];
    id v18 = v47;

    id v16 = (void *)v20;
  }
  _HKInitializeLogging();
  if (v16)
  {
    os_log_t v21 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      __int16 v23 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v49 = v23;
      id v24 = v23;
      _os_log_impl(&dword_225722000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished running analysis", buf, 0xCu);
    }
    __int16 v25 = [HDMCDailyAnalytics alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v27 = [(HDMCDailyAnalytics *)v25 initWithProfile:WeakRetained analysis:v16 heartRateFeatureAvailabilityManager:self->_heartRateFeatureAvailabilityManager deviationDetectionFeatureAvailabilityManager:self->_deviationDetectionFeatureAvailabilityManager wristTemperatureInputFeatureAvailabilityManager:self->_wristTemperatureInputFeatureAvailabilityManager pregnancyManager:self->_pregnancyManager];

    id v46 = v18;
    BOOL v28 = [(HDMCDailyAnalytics *)v27 submitMetricWithError:&v46];
    id v29 = v46;

    _HKInitializeLogging();
    v30 = _HKLogPersistedSignposts();
    BOOL v31 = os_signpost_enabled(v30);

    if (v28)
    {
      if (v31)
      {
        v32 = _HKLogPersistedSignposts();
        v33 = v32;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_225722000, v33, OS_SIGNPOST_INTERVAL_END, v6, "menstrual-cycles-daily-analytics", "", buf, 2u);
        }
      }
      _HKInitializeLogging();
      os_log_t v34 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        v36 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v49 = v36;
        id v37 = v36;
        _os_log_impl(&dword_225722000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Metric submission succeeded", buf, 0xCu);
      }
      (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
    }
    else
    {
      if (v31)
      {
        v43 = _HKLogPersistedSignposts();
        v44 = v43;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_225722000, v44, OS_SIGNPOST_INTERVAL_END, v6, "menstrual-cycles-daily-analytics", "", buf, 2u);
        }
      }
      _HKInitializeLogging();
      os_log_t v45 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)) {
        -[HDMCAnalyticsManager _submitAnalyticsWithCompletion:](v45);
      }
      (*((void (**)(id, void, uint64_t, id))v4 + 2))(v4, 0, 2, v29);
    }

    id v18 = v29;
  }
  else
  {
    v38 = _HKLogPersistedSignposts();
    BOOL v39 = os_signpost_enabled(v38);

    if (v39)
    {
      v40 = _HKLogPersistedSignposts();
      v41 = v40;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_225722000, v41, OS_SIGNPOST_INTERVAL_END, v6, "menstrual-cycles-daily-analytics", "", buf, 2u);
      }
    }
    _HKInitializeLogging();
    os_log_t v42 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)) {
      -[HDMCAnalyticsManager _submitAnalyticsWithCompletion:](v42);
    }
    (*((void (**)(id, void, uint64_t, id))v4 + 2))(v4, 0, 2, v18);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregnancyManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_deviationDetectionFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureAvailabilityManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_analysisManager, 0);
}

- (void)_submitAnalyticsWithCompletion:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Analysis failed with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_submitAnalyticsWithCompletion:(void *)a1 .cold.2(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Metric submission failed with error: %{public}@", v6, v7, v8, v9, v10);
}

@end